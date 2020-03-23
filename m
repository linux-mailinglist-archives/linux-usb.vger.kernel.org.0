Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F196618F26C
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2020 11:11:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbgCWKLu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Mar 2020 06:11:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:33516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727806AbgCWKLt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Mar 2020 06:11:49 -0400
Received: from localhost.localdomain (unknown [171.76.96.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4EF6320769;
        Mon, 23 Mar 2020 10:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584958308;
        bh=83gV157djbRaLHhZQuuSh8sn6r+Bv6wd+BZwXERbrVw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kRsknifgvVT3jYxE+x8rUpD/U30MF+KG2VwQi1YTHpKypuCVNa/t196UMleAeL9cx
         VYc6p+rYkDkGr9rCEmF/SK1/K0jYvNCbAJdzjdN5xnRtO7K3rEMJuFAA5D7i3Y59Ac
         QkaalV9+Gio0odREEV6ZGLtERsLk0adE7Njb1BwU=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        =?UTF-8?q?Andreas=20B=C3=B6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v7 1/5] usb: hci: add hc_driver as argument for usb_hcd_pci_probe
Date:   Mon, 23 Mar 2020 15:41:17 +0530
Message-Id: <20200323101121.243906-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323101121.243906-1-vkoul@kernel.org>
References: <20200323101121.243906-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb_hcd_pci_probe expects users to call this with driver_data set as
hc_driver, that limits the possibility of using the driver_data for
driver data.

Add hc_driver as argument to usb_hcd_pci_probe and modify the callers
ehci/ohci/xhci/uhci to pass hc_driver as argument and freeup the
driver_data used

Tested xhci driver on Dragon-board RB3, compile tested ehci and ohci.
Couldn't compile uhci

Suggested-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/usb/core/hcd-pci.c  |  7 ++++---
 drivers/usb/host/ehci-pci.c |  6 ++----
 drivers/usb/host/ohci-pci.c |  9 ++++++---
 drivers/usb/host/uhci-pci.c |  8 ++++++--
 drivers/usb/host/xhci-pci.c | 14 +++++---------
 include/linux/usb/hcd.h     |  3 ++-
 6 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index f0a259937da8..b0a3400f836f 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -159,6 +159,7 @@ static void ehci_wait_for_companions(struct pci_dev *pdev, struct usb_hcd *hcd,
  * usb_hcd_pci_probe - initialize PCI-based HCDs
  * @dev: USB Host Controller being probed
  * @id: pci hotplug id connecting controller to HCD framework
+ * @driver: USB HC driver handle
  * Context: !in_interrupt()
  *
  * Allocates basic PCI resources for this USB host controller, and
@@ -169,9 +170,9 @@ static void ehci_wait_for_companions(struct pci_dev *pdev, struct usb_hcd *hcd,
  *
  * Return: 0 if successful.
  */
-int usb_hcd_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
+int usb_hcd_pci_probe(struct pci_dev *dev, const struct pci_device_id *id,
+		      struct hc_driver *driver)
 {
-	struct hc_driver	*driver;
 	struct usb_hcd		*hcd;
 	int			retval;
 	int			hcd_irq = 0;
@@ -181,7 +182,7 @@ int usb_hcd_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	if (!id)
 		return -EINVAL;
-	driver = (struct hc_driver *)id->driver_data;
+
 	if (!driver)
 		return -EINVAL;
 
diff --git a/drivers/usb/host/ehci-pci.c b/drivers/usb/host/ehci-pci.c
index b0882c13a1d1..daaddfbbf797 100644
--- a/drivers/usb/host/ehci-pci.c
+++ b/drivers/usb/host/ehci-pci.c
@@ -360,23 +360,21 @@ static int ehci_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	if (is_bypassed_id(pdev))
 		return -ENODEV;
-	return usb_hcd_pci_probe(pdev, id);
+	return usb_hcd_pci_probe(pdev, id, &ehci_pci_hc_driver);
 }
 
 static void ehci_pci_remove(struct pci_dev *pdev)
 {
 	pci_clear_mwi(pdev);
-	usb_hcd_pci_remove(pdev);	
+	usb_hcd_pci_remove(pdev);
 }
 
 /* PCI driver selection metadata; PCI hotplugging uses this */
 static const struct pci_device_id pci_ids [] = { {
 	/* handle any USB 2.0 EHCI controller */
 	PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_USB_EHCI, ~0),
-	.driver_data =	(unsigned long) &ehci_pci_hc_driver,
 	}, {
 	PCI_VDEVICE(STMICRO, PCI_DEVICE_ID_STMICRO_USB_HOST),
-	.driver_data = (unsigned long) &ehci_pci_hc_driver,
 	},
 	{ /* end: all zeroes */ }
 };
diff --git a/drivers/usb/host/ohci-pci.c b/drivers/usb/host/ohci-pci.c
index f4e13a3fddee..78b0d84c7675 100644
--- a/drivers/usb/host/ohci-pci.c
+++ b/drivers/usb/host/ohci-pci.c
@@ -277,21 +277,24 @@ static const struct ohci_driver_overrides pci_overrides __initconst = {
 static const struct pci_device_id pci_ids[] = { {
 	/* handle any USB OHCI controller */
 	PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_USB_OHCI, ~0),
-	.driver_data =	(unsigned long) &ohci_pci_hc_driver,
 	}, {
 	/* The device in the ConneXT I/O hub has no class reg */
 	PCI_VDEVICE(STMICRO, PCI_DEVICE_ID_STMICRO_USB_OHCI),
-	.driver_data =	(unsigned long) &ohci_pci_hc_driver,
 	}, { /* end: all zeroes */ }
 };
 MODULE_DEVICE_TABLE (pci, pci_ids);
 
+static int ohci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
+{
+	return usb_hcd_pci_probe(dev, id, &ohci_pci_hc_driver);
+}
+
 /* pci driver glue; this is a "new style" PCI driver module */
 static struct pci_driver ohci_pci_driver = {
 	.name =		(char *) hcd_name,
 	.id_table =	pci_ids,
 
-	.probe =	usb_hcd_pci_probe,
+	.probe =	ohci_pci_probe,
 	.remove =	usb_hcd_pci_remove,
 	.shutdown =	usb_hcd_pci_shutdown,
 
diff --git a/drivers/usb/host/uhci-pci.c b/drivers/usb/host/uhci-pci.c
index 0fa3d72bae26..d59b9257c52b 100644
--- a/drivers/usb/host/uhci-pci.c
+++ b/drivers/usb/host/uhci-pci.c
@@ -287,17 +287,21 @@ static const struct hc_driver uhci_driver = {
 static const struct pci_device_id uhci_pci_ids[] = { {
 	/* handle any USB UHCI controller */
 	PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_USB_UHCI, ~0),
-	.driver_data =	(unsigned long) &uhci_driver,
 	}, { /* end: all zeroes */ }
 };
 
 MODULE_DEVICE_TABLE(pci, uhci_pci_ids);
 
+static int uhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
+{
+	return usb_hcd_pci_probe(dev, id, &uhci_driver);
+}
+
 static struct pci_driver uhci_pci_driver = {
 	.name =		(char *)hcd_name,
 	.id_table =	uhci_pci_ids,
 
-	.probe =	usb_hcd_pci_probe,
+	.probe =	uhci_pci_probe,
 	.remove =	usb_hcd_pci_remove,
 	.shutdown =	uhci_shutdown,
 
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 4917c5b033fa..a19752178216 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -316,11 +316,8 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	int retval;
 	struct xhci_hcd *xhci;
-	struct hc_driver *driver;
 	struct usb_hcd *hcd;
 
-	driver = (struct hc_driver *)id->driver_data;
-
 	/* Prevent runtime suspending between USB-2 and USB-3 initialization */
 	pm_runtime_get_noresume(&dev->dev);
 
@@ -330,7 +327,7 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	 * to say USB 2.0, but I'm not sure what the implications would be in
 	 * the other parts of the HCD code.
 	 */
-	retval = usb_hcd_pci_probe(dev, id);
+	retval = usb_hcd_pci_probe(dev, id, &xhci_pci_hc_driver);
 
 	if (retval)
 		goto put_runtime_pm;
@@ -338,8 +335,8 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	/* USB 2.0 roothub is stored in the PCI device now. */
 	hcd = dev_get_drvdata(&dev->dev);
 	xhci = hcd_to_xhci(hcd);
-	xhci->shared_hcd = usb_create_shared_hcd(driver, &dev->dev,
-				pci_name(dev), hcd);
+	xhci->shared_hcd = usb_create_shared_hcd(&xhci_pci_hc_driver, &dev->dev,
+						 pci_name(dev), hcd);
 	if (!xhci->shared_hcd) {
 		retval = -ENOMEM;
 		goto dealloc_usb2_hcd;
@@ -536,10 +533,9 @@ static void xhci_pci_shutdown(struct usb_hcd *hcd)
 /*-------------------------------------------------------------------------*/
 
 /* PCI driver selection metadata; PCI hotplugging uses this */
-static const struct pci_device_id pci_ids[] = { {
+static const struct pci_device_id pci_ids[] = {
 	/* handle any USB 3.0 xHCI controller */
-	PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_USB_XHCI, ~0),
-	.driver_data =	(unsigned long) &xhci_pci_hc_driver,
+	{ PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_USB_XHCI, ~0),
 	},
 	{ /* end: all zeroes */ }
 };
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index 712b2a603645..7823a06f6692 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -479,7 +479,8 @@ extern void usb_hcd_platform_shutdown(struct platform_device *dev);
 struct pci_dev;
 struct pci_device_id;
 extern int usb_hcd_pci_probe(struct pci_dev *dev,
-				const struct pci_device_id *id);
+			     const struct pci_device_id *id,
+			     struct hc_driver *driver);
 extern void usb_hcd_pci_remove(struct pci_dev *dev);
 extern void usb_hcd_pci_shutdown(struct pci_dev *dev);
 
-- 
2.25.1

