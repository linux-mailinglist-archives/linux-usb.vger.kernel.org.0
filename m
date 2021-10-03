Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2184203ED
	for <lists+linux-usb@lfdr.de>; Sun,  3 Oct 2021 22:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbhJCUbf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 3 Oct 2021 16:31:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231587AbhJCUbc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 3 Oct 2021 16:31:32 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5641DC061787
        for <linux-usb@vger.kernel.org>; Sun,  3 Oct 2021 13:29:44 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mX87C-0003Rp-9u; Sun, 03 Oct 2021 22:29:42 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mX87B-0000Ad-SJ; Sun, 03 Oct 2021 22:29:41 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        caleb.connolly@ideasonboard.com
Subject: [PATCH v2 7/7] usb: gadget: udc: ensure the gadget is still available
Date:   Sun,  3 Oct 2021 22:29:39 +0200
Message-Id: <20211003202939.306-8-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211003202939.306-1-m.grzeschik@pengutronix.de>
References: <20211003202939.306-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It is possible that the configfs gadget layer will be calling the unbind
functions of all gadget functions on gadget_dev_desc_UDC_store and
cleaned up the cdev structures pointer to the gadget. This will not
prevent the usage of the usb_function_de/activate functions.

f_obex and f_uvc are the candidates to still call the functions with no
valid gadget set. This patch prevents the usage of the gadget if it was
already unset.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
v2: - no changes

 drivers/usb/gadget/composite.c | 4 ++--
 drivers/usb/gadget/udc/core.c  | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 504c1cbc255d1..1b4cd01e2ae13 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -393,7 +393,7 @@ int usb_function_deactivate(struct usb_function *function)
 
 	spin_lock_irqsave(&cdev->lock, flags);
 
-	if (cdev->deactivations == 0) {
+	if (cdev->deactivations == 0 && cdev->gadget) {
 		spin_unlock_irqrestore(&cdev->lock, flags);
 		status = usb_gadget_deactivate(cdev->gadget);
 		spin_lock_irqsave(&cdev->lock, flags);
@@ -428,7 +428,7 @@ int usb_function_activate(struct usb_function *function)
 		status = -EINVAL;
 	else {
 		cdev->deactivations--;
-		if (cdev->deactivations == 0) {
+		if (cdev->deactivations == 0 && cdev->gadget) {
 			spin_unlock_irqrestore(&cdev->lock, flags);
 			status = usb_gadget_activate(cdev->gadget);
 			spin_lock_irqsave(&cdev->lock, flags);
diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 14fdf918ecfeb..52964d0e26fa6 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -756,6 +756,9 @@ int usb_gadget_deactivate(struct usb_gadget *gadget)
 {
 	int ret = 0;
 
+	if (!gadget)
+		return ret;
+
 	if (gadget->deactivated)
 		goto out;
 
-- 
2.30.2

