Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 859FC1EB68B
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jun 2020 09:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgFBH1X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jun 2020 03:27:23 -0400
Received: from inva021.nxp.com ([92.121.34.21]:33258 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725616AbgFBH1X (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jun 2020 03:27:23 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 29C1320098E;
        Tue,  2 Jun 2020 09:27:21 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A9EB6200972;
        Tue,  2 Jun 2020 09:27:18 +0200 (CEST)
Received: from titan.ap.freescale.net (titan.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 4C82140280;
        Tue,  2 Jun 2020 15:27:15 +0800 (SGT)
From:   jun.li@nxp.com
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     john.stultz@linaro.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: tcpci_rt1711h: avoid screaming irq causing boot hangs
Date:   Tue,  2 Jun 2020 15:12:08 +0800
Message-Id: <20200602071208.12120-1-jun.li@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

John reported screaming irq caused by rt1711h when system boot[1],
this is because irq request is done before tcpci_register_port(),
so the chip->tcpci has not been setup, irq handler is entered but
can't do anything, this patch is to address this by moving the irq
request after tcpci_register_port().

[1] https://lkml.org/lkml/2020/5/30/1

Cc: John Stultz <john.stultz@linaro.org>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/tcpm/tcpci_rt1711h.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
index 0173890..b56a088 100644
--- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
+++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
@@ -179,26 +179,6 @@ static irqreturn_t rt1711h_irq(int irq, void *dev_id)
 	return tcpci_irq(chip->tcpci);
 }
 
-static int rt1711h_init_alert(struct rt1711h_chip *chip,
-			      struct i2c_client *client)
-{
-	int ret;
-
-	/* Disable chip interrupts before requesting irq */
-	ret = rt1711h_write16(chip, TCPC_ALERT_MASK, 0);
-	if (ret < 0)
-		return ret;
-
-	ret = devm_request_threaded_irq(chip->dev, client->irq, NULL,
-					rt1711h_irq,
-					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
-					dev_name(chip->dev), chip);
-	if (ret < 0)
-		return ret;
-	enable_irq_wake(client->irq);
-	return 0;
-}
-
 static int rt1711h_sw_reset(struct rt1711h_chip *chip)
 {
 	int ret;
@@ -260,7 +240,8 @@ static int rt1711h_probe(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 
-	ret = rt1711h_init_alert(chip, client);
+	/* Disable chip interrupts before requesting irq */
+	ret = rt1711h_write16(chip, TCPC_ALERT_MASK, 0);
 	if (ret < 0)
 		return ret;
 
@@ -271,6 +252,14 @@ static int rt1711h_probe(struct i2c_client *client,
 	if (IS_ERR_OR_NULL(chip->tcpci))
 		return PTR_ERR(chip->tcpci);
 
+	ret = devm_request_threaded_irq(chip->dev, client->irq, NULL,
+					rt1711h_irq,
+					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
+					dev_name(chip->dev), chip);
+	if (ret < 0)
+		return ret;
+	enable_irq_wake(client->irq);
+
 	return 0;
 }
 
-- 
2.7.4

