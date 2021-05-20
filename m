Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9D8538B84D
	for <lists+linux-usb@lfdr.de>; Thu, 20 May 2021 22:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236142AbhETUX3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 May 2021 16:23:29 -0400
Received: from netrider.rowland.org ([192.131.102.5]:33487 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S235955AbhETUX3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 May 2021 16:23:29 -0400
Received: (qmail 1217395 invoked by uid 1000); 20 May 2021 16:22:06 -0400
Date:   Thu, 20 May 2021 16:22:06 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH 4/4] USB: UDC: Implement udc_async_callbacks in net2272
Message-ID: <20210520202206.GF1216852@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds a udc_async_callbacks handler to the net2272 UDC
driver, which will prevent a theoretical race during gadget unbinding.

The net2272 driver is sufficiently complicated that I didn't want to
mess around with IRQ settings.  Instead, the patch simply adds a new
flag to control async callbacks, and checks the flag before issuing
any of them.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---


[as1959]


 drivers/usb/gadget/udc/net2272.c |   41 +++++++++++++++++++++++++--------------
 drivers/usb/gadget/udc/net2272.h |    1 
 2 files changed, 28 insertions(+), 14 deletions(-)

Index: usb-devel/drivers/usb/gadget/udc/net2272.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/net2272.c
+++ usb-devel/drivers/usb/gadget/udc/net2272.c
@@ -1149,6 +1149,7 @@ net2272_pullup(struct usb_gadget *_gadge
 static int net2272_start(struct usb_gadget *_gadget,
 		struct usb_gadget_driver *driver);
 static int net2272_stop(struct usb_gadget *_gadget);
+static void net2272_async_callbacks(struct usb_gadget *_gadget, bool enable);
 
 static const struct usb_gadget_ops net2272_ops = {
 	.get_frame	= net2272_get_frame,
@@ -1157,6 +1158,7 @@ static const struct usb_gadget_ops net22
 	.pullup		= net2272_pullup,
 	.udc_start	= net2272_start,
 	.udc_stop	= net2272_stop,
+	.udc_async_callbacks = net2272_async_callbacks,
 };
 
 /*---------------------------------------------------------------------------*/
@@ -1475,7 +1477,7 @@ stop_activity(struct net2272 *dev, struc
 		net2272_dequeue_all(&dev->ep[i]);
 
 	/* report disconnect; the driver is already quiesced */
-	if (driver) {
+	if (dev->async_callbacks && driver) {
 		spin_unlock(&dev->lock);
 		driver->disconnect(&dev->gadget);
 		spin_lock(&dev->lock);
@@ -1500,6 +1502,15 @@ static int net2272_stop(struct usb_gadge
 	return 0;
 }
 
+static void net2272_async_callbacks(struct usb_gadget *_gadget, bool enable)
+{
+	struct net2272	*dev = container_of(_gadget, struct net2272, gadget);
+
+	spin_lock_irq(&dev->lock);
+	dev->async_callbacks = enable;
+	spin_unlock_irq(&dev->lock);
+}
+
 /*---------------------------------------------------------------------------*/
 /* handle ep-a/ep-b dma completions */
 static void
@@ -1909,9 +1920,11 @@ net2272_handle_stat0_irqs(struct net2272
 				u.r.bRequestType, u.r.bRequest,
 				u.r.wValue, u.r.wIndex,
 				net2272_ep_read(ep, EP_CFG));
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
@@ -1993,14 +2006,14 @@ net2272_handle_stat1_irqs(struct net2272
 			if (disconnect || reset) {
 				stop_activity(dev, dev->driver);
 				net2272_ep0_start(dev);
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
@@ -2014,14 +2027,14 @@ net2272_handle_stat1_irqs(struct net2272
 	if (stat & tmp) {
 		net2272_write(dev, IRQSTAT1, tmp);
 		if (stat & (1 << SUSPEND_REQUEST_INTERRUPT)) {
-			if (dev->driver->suspend)
+			if (dev->async_callbacks && dev->driver->suspend)
 				dev->driver->suspend(&dev->gadget);
 			if (!enable_suspend) {
 				stat &= ~(1 << SUSPEND_REQUEST_INTERRUPT);
 				dev_dbg(dev->dev, "Suspend disabled, ignoring\n");
 			}
 		} else {
-			if (dev->driver->resume)
+			if (dev->async_callbacks && dev->driver->resume)
 				dev->driver->resume(&dev->gadget);
 		}
 		stat &= ~tmp;
Index: usb-devel/drivers/usb/gadget/udc/net2272.h
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/net2272.h
+++ usb-devel/drivers/usb/gadget/udc/net2272.h
@@ -442,6 +442,7 @@ struct net2272 {
 	         softconnect:1,
 	         wakeup:1,
 		 added:1,
+		 async_callbacks:1,
 	         dma_eot_polarity:1,
 	         dma_dack_polarity:1,
 	         dma_dreq_polarity:1,
