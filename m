Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 042EE232616
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jul 2020 22:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgG2UWc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jul 2020 16:22:32 -0400
Received: from netrider.rowland.org ([192.131.102.5]:44705 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726365AbgG2UWc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jul 2020 16:22:32 -0400
Received: (qmail 1585024 invoked by uid 1000); 29 Jul 2020 16:22:31 -0400
Date:   Wed, 29 Jul 2020 16:22:31 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     Roger Quadros <rogerq@ti.com>, Peter Chen <peter.chen@nxp.com>,
        Anton Vasilyev <vasilyev@ispras.ru>,
        Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH RFC 1/4] USB: UDC: Don't wipe deallocated memory
Message-ID: <20200729202231.GB1584059@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Abusing the kernel's device model, some UDC drivers (including
dwc3 and cdns3) register and unregister their gadget structures
multiple times.  This is strictly forbidden; device structures may not
be reused.

Commit fac323471df6 ("usb: udc: allow adding and removing the same
gadget device") attempted to work around this restriction by zeroing
out the memory occupied by a gadget's embedded struct device when the
gadget is unregistered.  However, it does so at the wrong time,
immediately following the call to device_unregister().  At that point
there may still be outstanding references to the device, and
overwriting its memory is likely to cause trouble.  Even worse, if
there are no outstanding references then the gadget's memory may have
been deallocated, and so gadget must be considered to be a stale
pointer when it is passed to memset().

This patch fixes the problem by moving the offending memset to the
device's release routine, which gets called only when all references
have been dropped.  (Actually the call gets moved to the default
release routine, renamed from "usb_udc_nop_release" to
"usb_udc_zero_release" to indicate that it now zeroes out the memory.
This routine is the one used by dwc3 and cdns3; other drivers may not
use it.)

This doesn't fix the underlying problem.  UDC drivers that register
their gadgets multiple times should be rewritten to allocate their
gadget structures dynamically, using a new one each time.  Until that
is done, this will at least remove one potential source of errors.

On the other hand, the patch may create new errors if the release
routine doesn't get called until after the gadget has been
re-registered.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: Roger Quadros <rogerq@ti.com>
CC: Peter Chen <peter.chen@nxp.com>
CC: Anton Vasilyev <vasilyev@ispras.ru>
CC: Evgeny Novikov <novikov@ispras.ru>
CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

---

 drivers/usb/gadget/udc/core.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

Index: usb-devel/drivers/usb/gadget/udc/core.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/core.c
+++ usb-devel/drivers/usb/gadget/udc/core.c
@@ -1138,9 +1138,10 @@ static void usb_udc_release(struct devic
 
 static const struct attribute_group *usb_udc_attr_groups[];
 
-static void usb_udc_nop_release(struct device *dev)
+static void usb_udc_zero_release(struct device *dev)
 {
 	dev_vdbg(dev, "%s\n", __func__);
+	memset(dev, 0, sizeof(*dev));
 }
 
 /* should be called with udc_lock held */
@@ -1184,7 +1185,7 @@ int usb_add_gadget_udc_release(struct de
 	if (release)
 		gadget->dev.release = release;
 	else
-		gadget->dev.release = usb_udc_nop_release;
+		gadget->dev.release = usb_udc_zero_release;
 
 	device_initialize(&gadget->dev);
 
@@ -1338,7 +1339,6 @@ void usb_del_gadget_udc(struct usb_gadge
 	flush_work(&gadget->work);
 	device_unregister(&udc->dev);
 	device_unregister(&gadget->dev);
-	memset(&gadget->dev, 0x00, sizeof(gadget->dev));
 }
 EXPORT_SYMBOL_GPL(usb_del_gadget_udc);
 
