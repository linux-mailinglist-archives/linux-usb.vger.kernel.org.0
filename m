Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB1516F881
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2020 08:26:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbgBZH0u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Feb 2020 02:26:50 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41507 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726903AbgBZH0t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Feb 2020 02:26:49 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j6r5j-0002jU-IW; Wed, 26 Feb 2020 08:26:47 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j6r5i-00059k-2e; Wed, 26 Feb 2020 08:26:46 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     richard.leitner@skidata.com, fancer.lancer@gmail.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] usb: usb251xb: fix regulator probe and error handling
Date:   Wed, 26 Feb 2020 08:26:44 +0100
Message-Id: <20200226072644.18490-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit 4d7201cda226 ("usb: usb251xb: add vdd supply support") didn't
covered the non-DT use-case and so the regualtor_enable() call during
probe will fail on those platforms. Also the commit didn't handled the
error case correctly.

Move devm_regulator_get() out of usb251xb_get_ofdata() to address the
1st issue. This can be done without worries because devm_regulator_get()
handles the non-DT use-case too. Add devm_add_action_or_reset() to
address the 2nd bug.

Fixes: 4d7201cda226 ("usb: usb251xb: add vdd supply support")
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Hi,

unfortunately I didn't covered the non-DT use case during the devel of
commit 4d7201cda226 and I was a bit to optimistic so I also missed the
error handling.

Regards,
  Marco

 drivers/usb/misc/usb251xb.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 10c9e7f6273e..29fe5771c21b 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -424,10 +424,6 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 		return err;
 	}
 
-	hub->vdd = devm_regulator_get(dev, "vdd");
-	if (IS_ERR(hub->vdd))
-		return PTR_ERR(hub->vdd);
-
 	if (of_property_read_u16_array(np, "vendor-id", &hub->vendor_id, 1))
 		hub->vendor_id = USB251XB_DEF_VENDOR_ID;
 
@@ -640,6 +636,13 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 }
 #endif /* CONFIG_OF */
 
+static void usb251xb_regulator_disable_action(void *data)
+{
+	struct usb251xb *hub = data;
+
+	regulator_disable(hub->vdd);
+}
+
 static int usb251xb_probe(struct usb251xb *hub)
 {
 	struct device *dev = hub->dev;
@@ -676,10 +679,19 @@ static int usb251xb_probe(struct usb251xb *hub)
 	if (err)
 		return err;
 
+	hub->vdd = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(hub->vdd))
+		return PTR_ERR(hub->vdd);
+
 	err = regulator_enable(hub->vdd);
 	if (err)
 		return err;
 
+	err = devm_add_action_or_reset(dev,
+				       usb251xb_regulator_disable_action, hub);
+	if (err)
+		return err;
+
 	err = usb251xb_connect(hub);
 	if (err) {
 		dev_err(dev, "Failed to connect hub (%d)\n", err);
-- 
2.20.1

