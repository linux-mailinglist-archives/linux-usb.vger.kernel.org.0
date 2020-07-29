Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAA7B23261D
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jul 2020 22:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbgG2UXu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jul 2020 16:23:50 -0400
Received: from netrider.rowland.org ([192.131.102.5]:59217 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726365AbgG2UXu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jul 2020 16:23:50 -0400
Received: (qmail 1585116 invoked by uid 1000); 29 Jul 2020 16:23:49 -0400
Date:   Wed, 29 Jul 2020 16:23:49 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     Anton Vasilyev <vasilyev@ispras.ru>,
        Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH RFC 4/4] USB: UDC: net2272: Fix memory leaks
Message-ID: <20200729202349.GE1584059@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Like net2280 (on which it was based), the net2272 UDC driver has a
problem with leaking memory along some of its failure pathways.  It
also has another problem, not previously noted, in that some of the
failure pathways will call usb_del_gadget_udc() without first calling
usb_add_gadget_udc_release().  And it leaks memory by calling kfree()
when it should call put_device().

Until now it has been impossible to handle the memory leaks, because of
lack of support in the UDC core for separately initializing and adding
gadgets, or for separately deleting and freeing gadgets.  An earlier
patch in this series adds the necessary support, making it possible to
fix the outstanding problems properly.

This patch adds an "added" flag to the net2272 structure to indicate
whether or not the gadget has been registered (and thus whether or not
to call usb_del_gadget()), and it fixes the deallocation issues by
calling usb_put_gadget() at the appropriate places.

A similar memory leak issue, apparently never before recognized, stems
from the fact that the driver never initializes the drvdata field in
the gadget's embedded struct device!  Evidently this wasn't noticed
because the pointer is only ever used as an argument to kfree(), which
doesn't mind getting called with a NULL pointer.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: Anton Vasilyev <vasilyev@ispras.ru>
CC: Evgeny Novikov <novikov@ispras.ru>
CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

---

 drivers/usb/gadget/udc/net2272.c |   21 ++++++++++++---------
 drivers/usb/gadget/udc/net2272.h |    1 +
 2 files changed, 13 insertions(+), 9 deletions(-)

Index: usb-devel/drivers/usb/gadget/udc/net2272.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/net2272.c
+++ usb-devel/drivers/usb/gadget/udc/net2272.c
@@ -2205,7 +2205,8 @@ net2272_gadget_release(struct device *_d
 static void
 net2272_remove(struct net2272 *dev)
 {
-	usb_del_gadget_udc(&dev->gadget);
+	if (dev->added)
+		usb_del_gadget(&dev->gadget);
 	free_irq(dev->irq, dev);
 	iounmap(dev->base_addr);
 	device_remove_file(dev->dev, &dev_attr_registers);
@@ -2235,6 +2236,8 @@ static struct net2272 *net2272_probe_ini
 
 	/* the "gadget" abstracts/virtualizes the controller */
 	ret->gadget.name = driver_name;
+	dev_set_drvdata(&ret->gadget.dev, ret);
+	usb_initialize_gadget(dev, &ret->gadget, net2272_gadget_release);
 
 	return ret;
 }
@@ -2273,10 +2276,10 @@ net2272_probe_fin(struct net2272 *dev, u
 	if (ret)
 		goto err_irq;
 
-	ret = usb_add_gadget_udc_release(dev->dev, &dev->gadget,
-			net2272_gadget_release);
+	ret = usb_add_gadget(&dev->gadget);
 	if (ret)
 		goto err_add_udc;
+	dev->added = 1;
 
 	return 0;
 
@@ -2449,7 +2452,7 @@ net2272_pci_probe(struct pci_dev *pdev,
 
 	if (pci_enable_device(pdev) < 0) {
 		ret = -ENODEV;
-		goto err_free;
+		goto err_put;
 	}
 
 	pci_set_master(pdev);
@@ -2472,8 +2475,8 @@ net2272_pci_probe(struct pci_dev *pdev,
 
  err_pci:
 	pci_disable_device(pdev);
- err_free:
-	kfree(dev);
+ err_put:
+	usb_put_gadget(&dev->gadget);
 
 	return ret;
 }
@@ -2534,7 +2537,7 @@ net2272_pci_remove(struct pci_dev *pdev)
 
 	pci_disable_device(pdev);
 
-	kfree(dev);
+	usb_put_gadget(&dev->gadget);
 }
 
 /* Table of matching PCI IDs */
@@ -2647,7 +2650,7 @@ net2272_plat_probe(struct platform_devic
  err_req:
 	release_mem_region(base, len);
  err:
-	kfree(dev);
+	usb_put_gadget(&dev->gadget);
 
 	return ret;
 }
@@ -2662,7 +2665,7 @@ net2272_plat_remove(struct platform_devi
 	release_mem_region(pdev->resource[0].start,
 		resource_size(&pdev->resource[0]));
 
-	kfree(dev);
+	usb_put_gadget(&dev->gadget);
 
 	return 0;
 }
Index: usb-devel/drivers/usb/gadget/udc/net2272.h
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/net2272.h
+++ usb-devel/drivers/usb/gadget/udc/net2272.h
@@ -446,6 +446,7 @@ struct net2272 {
 	unsigned protocol_stall:1,
 	         softconnect:1,
 	         wakeup:1,
+	         added:1,
 	         dma_eot_polarity:1,
 	         dma_dack_polarity:1,
 	         dma_dreq_polarity:1,
