Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86E08664B8
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jul 2019 04:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729331AbfGLCzI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Jul 2019 22:55:08 -0400
Received: from gate.crashing.org ([63.228.1.57]:54475 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729260AbfGLCzH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Jul 2019 22:55:07 -0400
Received: from ufdda393ec48b57.ant.amazon.com (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6C2rnGi010240;
        Thu, 11 Jul 2019 21:54:10 -0500
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Joel Stanley <joel@jms.id.au>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH v2 07/12] usb: gadget: aspeed: Rework the reset logic
Date:   Fri, 12 Jul 2019 12:53:43 +1000
Message-Id: <20190712025348.21019-8-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190712025348.21019-1-benh@kernel.crashing.org>
References: <20190712025348.21019-1-benh@kernel.crashing.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We had some dodgy code using the speed setting to decide whether a
port reset would reset the device or just enable it.

Instead, if the device is disabled and has a gadget attached, a
reset will enable it. If it's already enabled, a reset will
reset it.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/usb/gadget/udc/aspeed-vhub/dev.c | 58 +++++++++++-------------
 1 file changed, 27 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
index 5f7e3b6de531..79d3cb6bd2e7 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
@@ -50,7 +50,7 @@ void ast_vhub_dev_irq(struct ast_vhub_dev *d)
 
 static void ast_vhub_dev_enable(struct ast_vhub_dev *d)
 {
-	u32 reg, hmsk;
+	u32 reg, hmsk, i;
 
 	if (d->enabled)
 		return;
@@ -76,6 +76,20 @@ static void ast_vhub_dev_enable(struct ast_vhub_dev *d)
 	/* Set EP0 DMA buffer address */
 	writel(d->ep0.buf_dma, d->regs + AST_VHUB_DEV_EP0_DATA);
 
+	/* Clear stall on all EPs */
+	for (i = 0; i < AST_VHUB_NUM_GEN_EPs; i++) {
+		struct ast_vhub_ep *ep = d->epns[i];
+
+		if (ep && (ep->epn.stalled || ep->epn.wedged)) {
+			ep->epn.stalled = false;
+			ep->epn.wedged = false;
+			ast_vhub_update_epn_stall(ep);
+		}
+	}
+
+	/* Additional cleanups */
+	d->wakeup_en = false;
+	d->suspended = false;
 	d->enabled = true;
 }
 
@@ -477,46 +491,28 @@ void ast_vhub_dev_resume(struct ast_vhub_dev *d)
 
 void ast_vhub_dev_reset(struct ast_vhub_dev *d)
 {
-	/*
-	 * If speed is not set, we enable the port. If it is,
-	 * send reset to the gadget and reset "speed".
-	 *
-	 * Speed is an indication that we have got the first
-	 * setup packet to the device.
-	 */
-	if (d->gadget.speed == USB_SPEED_UNKNOWN && !d->enabled) {
-		DDBG(d, "Reset at unknown speed of disabled device, enabling...\n");
-		ast_vhub_dev_enable(d);
-		d->suspended = false;
+	/* No driver, just disable the device and return */
+	if (!d->driver) {
+		ast_vhub_dev_disable(d);
+		return;
 	}
-	if (d->gadget.speed != USB_SPEED_UNKNOWN && d->driver) {
-		unsigned int i;
 
-		DDBG(d, "Reset at known speed of bound device, resetting...\n");
+	/* If the port isn't enabled, just enable it */
+	if (!d->enabled) {
+		DDBG(d, "Reset of disabled device, enabling...\n");
+		ast_vhub_dev_enable(d);
+	} else {
+		DDBG(d, "Reset of enabled device, resetting...\n");
 		spin_unlock(&d->vhub->lock);
-		d->driver->reset(&d->gadget);
+		usb_gadget_udc_reset(&d->gadget, d->driver);
 		spin_lock(&d->vhub->lock);
 
 		/*
-		 * Disable/re-enable HW, this will clear the address
+		 * Disable and maybe re-enable HW, this will clear the address
 		 * and speed setting.
 		 */
 		ast_vhub_dev_disable(d);
 		ast_vhub_dev_enable(d);
-
-		/* Clear stall on all EPs */
-		for (i = 0; i < AST_VHUB_NUM_GEN_EPs; i++) {
-			struct ast_vhub_ep *ep = d->epns[i];
-
-			if (ep && ep->epn.stalled) {
-				ep->epn.stalled = false;
-				ast_vhub_update_epn_stall(ep);
-			}
-		}
-
-		/* Additional cleanups */
-		d->wakeup_en = false;
-		d->suspended = false;
 	}
 }
 
-- 
2.17.1

