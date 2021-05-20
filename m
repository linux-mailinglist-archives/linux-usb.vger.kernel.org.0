Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6430B38B84C
	for <lists+linux-usb@lfdr.de>; Thu, 20 May 2021 22:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236192AbhETUXY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 May 2021 16:23:24 -0400
Received: from netrider.rowland.org ([192.131.102.5]:41495 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S236062AbhETUXW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 May 2021 16:23:22 -0400
Received: (qmail 1217378 invoked by uid 1000); 20 May 2021 16:22:00 -0400
Date:   Thu, 20 May 2021 16:22:00 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH 3/4] USB: UDC: Implement udc_async_callbacks in net2280
Message-ID: <20210520202200.GE1216852@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds a udc_async_callbacks handler to the net2280 UDC
driver, which will prevent a theoretical race during gadget unbinding.

The net2280 driver is sufficiently complicated that I didn't want to
mess around with IRQ settings.  Instead, the patch simply adds a new
flag to control async callbacks, and checks the flag before issuing
any of them.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---


[as1958]


 drivers/usb/gadget/udc/net2280.c |   49 +++++++++++++++++++++++++--------------
 drivers/usb/gadget/udc/net2280.h |    1 
 2 files changed, 33 insertions(+), 17 deletions(-)

Index: usb-devel/drivers/usb/gadget/udc/net2280.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/net2280.c
+++ usb-devel/drivers/usb/gadget/udc/net2280.c
@@ -1617,6 +1617,7 @@ static struct usb_ep *net2280_match_ep(s
 static int net2280_start(struct usb_gadget *_gadget,
 		struct usb_gadget_driver *driver);
 static int net2280_stop(struct usb_gadget *_gadget);
+static void net2280_async_callbacks(struct usb_gadget *_gadget, bool enable);
 
 static const struct usb_gadget_ops net2280_ops = {
 	.get_frame	= net2280_get_frame,
@@ -1625,6 +1626,7 @@ static const struct usb_gadget_ops net22
 	.pullup		= net2280_pullup,
 	.udc_start	= net2280_start,
 	.udc_stop	= net2280_stop,
+	.udc_async_callbacks = net2280_async_callbacks,
 	.match_ep	= net2280_match_ep,
 };
 
@@ -2472,7 +2474,7 @@ static void stop_activity(struct net2280
 		nuke(&dev->ep[i]);
 
 	/* report disconnect; the driver is already quiesced */
-	if (driver) {
+	if (dev->async_callbacks && driver) {
 		spin_unlock(&dev->lock);
 		driver->disconnect(&dev->gadget);
 		spin_lock(&dev->lock);
@@ -2502,6 +2504,15 @@ static int net2280_stop(struct usb_gadge
 	return 0;
 }
 
+static void net2280_async_callbacks(struct usb_gadget *_gadget, bool enable)
+{
+	struct net2280	*dev = container_of(_gadget, struct net2280, gadget);
+
+	spin_lock_irq(&dev->lock);
+	dev->async_callbacks = enable;
+	spin_unlock_irq(&dev->lock);
+}
+
 /*-------------------------------------------------------------------------*/
 
 /* handle ep0, ep-e, ep-f with 64 byte packets: packet per irq.
@@ -3042,9 +3053,11 @@ usb3_delegate:
 				readl(&ep->cfg->ep_cfg));
 
 		ep->responded = 0;
-		spin_unlock(&dev->lock);
-		tmp = dev->driver->setup(&dev->gadget, &r);
-		spin_lock(&dev->lock);
+		if (dev->async_callbacks) {
+			spin_unlock(&dev->lock);
+			tmp = dev->driver->setup(&dev->gadget, &r);
+			spin_lock(&dev->lock);
+		}
 	}
 do_stall3:
 	if (tmp < 0) {
@@ -3284,9 +3297,11 @@ delegate:
 				w_value, w_index, w_length,
 				readl(&ep->cfg->ep_cfg));
 			ep->responded = 0;
-			spin_unlock(&dev->lock);
-			tmp = dev->driver->setup(&dev->gadget, &u.r);
-			spin_lock(&dev->lock);
+			if (dev->async_callbacks) {
+				spin_unlock(&dev->lock);
+				tmp = dev->driver->setup(&dev->gadget, &u.r);
+				spin_lock(&dev->lock);
+			}
 		}
 
 		/* stall ep0 on error */
@@ -3391,14 +3406,14 @@ __acquires(dev->lock)
 			if (disconnect || reset) {
 				stop_activity(dev, dev->driver);
 				ep0_start(dev);
-				spin_unlock(&dev->lock);
-				if (reset)
-					usb_gadget_udc_reset
-						(&dev->gadget, dev->driver);
-				else
-					(dev->driver->disconnect)
-						(&dev->gadget);
-				spin_lock(&dev->lock);
+				if (dev->async_callbacks) {
+					spin_unlock(&dev->lock);
+					if (reset)
+						usb_gadget_udc_reset(&dev->gadget, dev->driver);
+					else
+						(dev->driver->disconnect)(&dev->gadget);
+					spin_lock(&dev->lock);
+				}
 				return;
 			}
 		}
@@ -3419,12 +3434,12 @@ __acquires(dev->lock)
 		writel(tmp, &dev->regs->irqstat1);
 		spin_unlock(&dev->lock);
 		if (stat & BIT(SUSPEND_REQUEST_INTERRUPT)) {
-			if (dev->driver->suspend)
+			if (dev->async_callbacks && dev->driver->suspend)
 				dev->driver->suspend(&dev->gadget);
 			if (!enable_suspend)
 				stat &= ~BIT(SUSPEND_REQUEST_INTERRUPT);
 		} else {
-			if (dev->driver->resume)
+			if (dev->async_callbacks && dev->driver->resume)
 				dev->driver->resume(&dev->gadget);
 			/* at high speed, note erratum 0133 */
 		}
Index: usb-devel/drivers/usb/gadget/udc/net2280.h
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/net2280.h
+++ usb-devel/drivers/usb/gadget/udc/net2280.h
@@ -162,6 +162,7 @@ struct net2280 {
 					ltm_enable:1,
 					wakeup_enable:1,
 					addressed_state:1,
+					async_callbacks:1,
 					bug7734_patched:1;
 	u16				chiprev;
 	int enhanced_mode;
