Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A92B41D7B3
	for <lists+linux-usb@lfdr.de>; Thu, 30 Sep 2021 12:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350004AbhI3K3V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Sep 2021 06:29:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349993AbhI3K3J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Sep 2021 06:29:09 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE6F5C061772
        for <linux-usb@vger.kernel.org>; Thu, 30 Sep 2021 03:27:26 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mVtHg-0002sQ-PP; Thu, 30 Sep 2021 12:27:24 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mVtHd-00086W-5R; Thu, 30 Sep 2021 12:27:21 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        caleb.connolly@ideasonboard.com,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 2/7] usb: gadget: uvc: rename function to be more consistent
Date:   Thu, 30 Sep 2021 12:27:12 +0200
Message-Id: <20210930102717.15720-3-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930102717.15720-1-m.grzeschik@pengutronix.de>
References: <20210930102717.15720-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Michael Tretter <m.tretter@pengutronix.de>

When enabling info debugging for the uvc gadget, the bind and unbind
infos use different formats. Change the unbind to visually match the
bind.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/gadget/function/f_uvc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 9d87c0fb8f92e..1e93ab5c0c88d 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -884,12 +884,12 @@ static void uvc_free(struct usb_function *f)
 	kfree(uvc);
 }
 
-static void uvc_unbind(struct usb_configuration *c, struct usb_function *f)
+static void uvc_function_unbind(struct usb_configuration *c, struct usb_function *f)
 {
 	struct usb_composite_dev *cdev = c->cdev;
 	struct uvc_device *uvc = to_uvc(f);
 
-	uvcg_info(f, "%s\n", __func__);
+	uvcg_info(f, "%s()\n", __func__);
 
 	device_remove_file(&uvc->vdev.dev, &dev_attr_function_name);
 	video_unregister_device(&uvc->vdev);
@@ -943,7 +943,7 @@ static struct usb_function *uvc_alloc(struct usb_function_instance *fi)
 	/* Register the function. */
 	uvc->func.name = "uvc";
 	uvc->func.bind = uvc_function_bind;
-	uvc->func.unbind = uvc_unbind;
+	uvc->func.unbind = uvc_function_unbind;
 	uvc->func.get_alt = uvc_function_get_alt;
 	uvc->func.set_alt = uvc_function_set_alt;
 	uvc->func.disable = uvc_function_disable;
-- 
2.30.2

