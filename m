Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 255FA1460CB
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2020 03:53:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgAWCxs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jan 2020 21:53:48 -0500
Received: from inva020.nxp.com ([92.121.34.13]:42656 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbgAWCxs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Jan 2020 21:53:48 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D63BE1A3F4E;
        Thu, 23 Jan 2020 03:53:45 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3597A1A3FEE;
        Thu, 23 Jan 2020 03:53:44 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id CB6B6402C4;
        Thu, 23 Jan 2020 10:53:41 +0800 (SGT)
From:   Peter Chen <peter.chen@nxp.com>
To:     linux-usb@vger.kernel.org
Cc:     linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] usb: chipidea: udc: using structure ci_hdrc device for runtime PM
Date:   Thu, 23 Jan 2020 10:49:19 +0800
Message-Id: <1579747759-32526-1-git-send-email-peter.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

At current code, it doesn't maintain ci->gadget.dev's runtime PM
status well, eg, during the PM operation, the PM counter for
ci->gadget.dev doesn't be changed accordingly.

In this commit, we use ci_hdrc device instead of ci->gadget.dev
for runtime PM APIs at udc driver, in the way, we handle runtime
PM APIs using unify device structure between core and udc driver.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/udc.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index ffaf46f5d062..ffa6caee1f3b 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -1533,7 +1533,7 @@ static void ci_hdrc_gadget_connect(struct usb_gadget *_gadget, int is_active)
 	unsigned long flags;
 
 	if (is_active) {
-		pm_runtime_get_sync(&_gadget->dev);
+		pm_runtime_get_sync(ci->dev);
 		hw_device_reset(ci);
 		spin_lock_irqsave(&ci->lock, flags);
 		if (ci->driver) {
@@ -1551,7 +1551,7 @@ static void ci_hdrc_gadget_connect(struct usb_gadget *_gadget, int is_active)
 			ci->platdata->notify_event(ci,
 			CI_HDRC_CONTROLLER_STOPPED_EVENT);
 		_gadget_stop_activity(&ci->gadget);
-		pm_runtime_put_sync(&_gadget->dev);
+		pm_runtime_put_sync(ci->dev);
 		usb_gadget_set_state(_gadget, USB_STATE_NOTATTACHED);
 	}
 }
@@ -1636,12 +1636,12 @@ static int ci_udc_pullup(struct usb_gadget *_gadget, int is_on)
 	if (ci_otg_is_fsm_mode(ci) || ci->role == CI_ROLE_HOST)
 		return 0;
 
-	pm_runtime_get_sync(&ci->gadget.dev);
+	pm_runtime_get_sync(ci->dev);
 	if (is_on)
 		hw_write(ci, OP_USBCMD, USBCMD_RS, USBCMD_RS);
 	else
 		hw_write(ci, OP_USBCMD, USBCMD_RS, 0);
-	pm_runtime_put_sync(&ci->gadget.dev);
+	pm_runtime_put_sync(ci->dev);
 
 	return 0;
 }
@@ -1839,7 +1839,7 @@ static int ci_udc_stop(struct usb_gadget *gadget)
 			CI_HDRC_CONTROLLER_STOPPED_EVENT);
 		_gadget_stop_activity(&ci->gadget);
 		spin_lock_irqsave(&ci->lock, flags);
-		pm_runtime_put(&ci->gadget.dev);
+		pm_runtime_put(ci->dev);
 	}
 
 	spin_unlock_irqrestore(&ci->lock, flags);
@@ -1970,9 +1970,6 @@ static int udc_start(struct ci_hdrc *ci)
 	if (retval)
 		goto destroy_eps;
 
-	pm_runtime_no_callbacks(&ci->gadget.dev);
-	pm_runtime_enable(&ci->gadget.dev);
-
 	return retval;
 
 destroy_eps:
-- 
2.17.1

