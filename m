Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B91D1BA068
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2020 11:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbgD0Juy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Apr 2020 05:50:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:56820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727013AbgD0Jux (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Apr 2020 05:50:53 -0400
Received: from localhost.localdomain (unknown [180.171.74.255])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 83AD820663;
        Mon, 27 Apr 2020 09:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587981053;
        bh=ZRueKNP17Zki6+Id+cJwVybkRSm6JcKCK9i7a4Hy2m4=;
        h=From:To:Cc:Subject:Date:From;
        b=OR15UMrzXIBOxQc7tO123652BRY+C/bBpDsE+MjPD6EZUYd+m2nyEtn8Ln7GwED9x
         aeWDEjLweDYxhSN1uoQQmXT8J+nXIglyLVs6PrLy/tO3lOc81+wMsfuqOXRIX18VnU
         QAB7iOQB7z7sQrFHt3parYCDczBefEvDEfwcuG5E=
From:   Peter Chen <peter.chen@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/4] usb: chipidea: introduce CI_HDRC_CONTROLLER_VBUS_EVENT glue layer use
Date:   Mon, 27 Apr 2020 17:50:36 +0800
Message-Id: <20200427095039.3833-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

Some vendors glue layer need to handle some events for vbus, eg,
some i.mx platforms (imx7d, imx8mm, imx8mn, etc) needs vbus event
to handle charger detection, its charger detection is finished at
glue layer code, but not at USB PHY driver.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/udc.c   | 7 ++++++-
 include/linux/usb/chipidea.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 921bcf14dc06..da70fbe7ca4c 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -1561,6 +1561,7 @@ static int ci_udc_vbus_session(struct usb_gadget *_gadget, int is_active)
 {
 	struct ci_hdrc *ci = container_of(_gadget, struct ci_hdrc, gadget);
 	unsigned long flags;
+	int ret = 0;
 
 	spin_lock_irqsave(&ci->lock, flags);
 	ci->vbus_active = is_active;
@@ -1570,10 +1571,14 @@ static int ci_udc_vbus_session(struct usb_gadget *_gadget, int is_active)
 		usb_phy_set_charger_state(ci->usb_phy, is_active ?
 			USB_CHARGER_PRESENT : USB_CHARGER_ABSENT);
 
+	if (ci->platdata->notify_event)
+		ret = ci->platdata->notify_event(ci,
+				CI_HDRC_CONTROLLER_VBUS_EVENT);
+
 	if (ci->driver)
 		ci_hdrc_gadget_connect(_gadget, is_active);
 
-	return 0;
+	return ret;
 }
 
 static int ci_udc_wakeup(struct usb_gadget *_gadget)
diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
index edd89b7c8f18..54167a2d28ea 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -67,6 +67,7 @@ struct ci_hdrc_platform_data {
 #define CI_HDRC_CONTROLLER_STOPPED_EVENT	1
 #define CI_HDRC_IMX_HSIC_ACTIVE_EVENT		2
 #define CI_HDRC_IMX_HSIC_SUSPEND_EVENT		3
+#define CI_HDRC_CONTROLLER_VBUS_EVENT		4
 	int	(*notify_event) (struct ci_hdrc *ci, unsigned event);
 	struct regulator	*reg_vbus;
 	struct usb_otg_caps	ci_otg_caps;
-- 
2.17.1

