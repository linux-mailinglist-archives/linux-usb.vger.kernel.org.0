Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4908D23261C
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jul 2020 22:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbgG2UX3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jul 2020 16:23:29 -0400
Received: from netrider.rowland.org ([192.131.102.5]:47653 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726365AbgG2UX3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jul 2020 16:23:29 -0400
Received: (qmail 1585094 invoked by uid 1000); 29 Jul 2020 16:23:28 -0400
Date:   Wed, 29 Jul 2020 16:23:28 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     Anton Vasilyev <vasilyev@ispras.ru>,
        Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH RFC 3/4] USB: UDC: net2280: Fix memory leaks
Message-ID: <20200729202328.GD1584059@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As Anton and Evgeny have noted, the net2280 UDC driver has a problem
with leaking memory along some of its failure pathways.  It also has
another problem, not previously noted, in that some of the failure
pathways will call usb_del_gadget_udc() without first calling
usb_add_gadget_udc_release().  And it leaks memory by calling kfree()
when it should call put_device().

Previous attempts to fix the problems have failed because of lack of
support in the UDC core for separately initializing and adding
gadgets, or for separately deleting and freeing gadgets.  The previous
patch in this series adds the necessary support, making it possible to
fix the outstanding problems properly.

This patch adds an "added" flag to the net2280 structure to indicate
whether or not the gadget has been registered (and thus whether or not
to call usb_del_gadget()), and it fixes the deallocation issues by
calling usb_put_gadget() at the appropriate point.

A similar memory leak issue, apparently never before recognized, stems
from the fact that the driver never initializes the drvdata field in
the gadget's embedded struct device!  Evidently this wasn't noticed
because the pointer is only ever used as an argument to kfree(), which
doesn't mind getting called with a NULL pointer.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-By: Anton Vasilyev <vasilyev@ispras.ru>
Reported-By: Evgeny Novikov <novikov@ispras.ru>
CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

---

 drivers/usb/gadget/udc/net2280.c |   10 +++++++---
 drivers/usb/gadget/udc/net2280.h |    1 +
 2 files changed, 8 insertions(+), 3 deletions(-)

Index: usb-devel/drivers/usb/gadget/udc/net2280.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/net2280.c
+++ usb-devel/drivers/usb/gadget/udc/net2280.c
@@ -3572,7 +3572,8 @@ static void net2280_remove(struct pci_de
 {
 	struct net2280		*dev = pci_get_drvdata(pdev);
 
-	usb_del_gadget_udc(&dev->gadget);
+	if (dev->added)
+		usb_del_gadget(&dev->gadget);
 
 	BUG_ON(dev->driver);
 
@@ -3603,6 +3604,7 @@ static void net2280_remove(struct pci_de
 	device_remove_file(&pdev->dev, &dev_attr_registers);
 
 	ep_info(dev, "unbind\n");
+	usb_put_gadget(&dev->gadget);
 }
 
 /* wrap this driver around the specified device, but
@@ -3624,6 +3626,8 @@ static int net2280_probe(struct pci_dev
 	}
 
 	pci_set_drvdata(pdev, dev);
+	dev_set_drvdata(&dev->gadget.dev, dev);
+	usb_initialize_gadget(&pdev->dev, &dev->gadget, gadget_release);
 	spin_lock_init(&dev->lock);
 	dev->quirks = id->driver_data;
 	dev->pdev = pdev;
@@ -3774,10 +3778,10 @@ static int net2280_probe(struct pci_dev
 	if (retval)
 		goto done;
 
-	retval = usb_add_gadget_udc_release(&pdev->dev, &dev->gadget,
-			gadget_release);
+	retval = usb_add_gadget(&dev->gadget);
 	if (retval)
 		goto done;
+	dev->added = 1;
 	return 0;
 
 done:
Index: usb-devel/drivers/usb/gadget/udc/net2280.h
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/net2280.h
+++ usb-devel/drivers/usb/gadget/udc/net2280.h
@@ -156,6 +156,7 @@ struct net2280 {
 					softconnect : 1,
 					got_irq : 1,
 					region:1,
+					added:1,
 					u1_enable:1,
 					u2_enable:1,
 					ltm_enable:1,
