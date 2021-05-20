Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D77E38B84B
	for <lists+linux-usb@lfdr.de>; Thu, 20 May 2021 22:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236069AbhETUXQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 May 2021 16:23:16 -0400
Received: from netrider.rowland.org ([192.131.102.5]:54383 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S236062AbhETUXP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 May 2021 16:23:15 -0400
Received: (qmail 1217366 invoked by uid 1000); 20 May 2021 16:21:52 -0400
Date:   Thu, 20 May 2021 16:21:52 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH 2/4] USB: UDC: Implement udc_async_callbacks in dummy-hcd
Message-ID: <20210520202152.GD1216852@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds a udc_async_callbacks handler to the dummy-hcd UDC
driver, which will prevent a theoretical race during gadget unbinding.

The implementation is simple, since dummy-hcd already has a flag to
keep track of whether emulated IRQs are enabled.  All the handler has
to do is store the enable value in the flag, and avoid setting the
flag prematurely.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---


[as1957]


 drivers/usb/gadget/udc/dummy_hcd.c |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -919,6 +919,15 @@ static void dummy_udc_set_speed(struct u
 	dummy_udc_update_ep0(dum);
 }
 
+static void dummy_udc_async_callbacks(struct usb_gadget *_gadget, bool enable)
+{
+	struct dummy	*dum = gadget_dev_to_dummy(&_gadget->dev);
+
+	spin_lock_irq(&dum->lock);
+	dum->ints_enabled = enable;
+	spin_unlock_irq(&dum->lock);
+}
+
 static int dummy_udc_start(struct usb_gadget *g,
 		struct usb_gadget_driver *driver);
 static int dummy_udc_stop(struct usb_gadget *g);
@@ -931,6 +940,7 @@ static const struct usb_gadget_ops dummy
 	.udc_start	= dummy_udc_start,
 	.udc_stop	= dummy_udc_stop,
 	.udc_set_speed	= dummy_udc_set_speed,
+	.udc_async_callbacks = dummy_udc_async_callbacks,
 };
 
 /*-------------------------------------------------------------------------*/
@@ -990,7 +1000,6 @@ static int dummy_udc_start(struct usb_ga
 	spin_lock_irq(&dum->lock);
 	dum->devstatus = 0;
 	dum->driver = driver;
-	dum->ints_enabled = 1;
 	spin_unlock_irq(&dum->lock);
 
 	return 0;
