Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0798E21264B
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 16:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729480AbgGBOaz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 10:30:55 -0400
Received: from mga11.intel.com ([192.55.52.93]:49010 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728651AbgGBOaz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 Jul 2020 10:30:55 -0400
IronPort-SDR: 0iNtk55uzuMM04ODjERaAwkgP4Zmd3qV8QnuXQ3KR7nMb0CC3u4U37m0DdbQW7RSOyO1i18Bo6
 YgdJDk5eTWqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="145050208"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; 
   d="scan'208";a="145050208"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2020 07:30:48 -0700
IronPort-SDR: vWrOKyo4v+GMkgqM72jmF51Rz3H5324+VLO8XgWWIvl9jhQL2aNXH/CVA88Lx3aQ9yfa/2r9wZ
 Q5z1+9DSYXDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; 
   d="scan'208";a="265713563"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 02 Jul 2020 07:30:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E24631A3; Thu,  2 Jul 2020 17:30:45 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] usb: hcd: Try MSI interrupts on PCI devices
Date:   Thu,  2 Jul 2020 17:30:45 +0300
Message-Id: <20200702143045.23429-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It appears that some platforms share same IRQ line between several devices,
some of which are EHCI and OHCI controllers. This is neither practical nor
performance-wise, especially in the case when they are supporting MSI.

In order to improve the situation try to allocate MSI and fallback to legacy
IRQ if no MSI available.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/core/hcd-pci.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index 1547aa6e5314..4dc443aaef5c 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -194,20 +194,21 @@ int usb_hcd_pci_probe(struct pci_dev *dev, const struct pci_device_id *id,
 	 * make sure irq setup is not touched for xhci in generic hcd code
 	 */
 	if ((driver->flags & HCD_MASK) < HCD_USB3) {
-		if (!dev->irq) {
+		retval = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_LEGACY | PCI_IRQ_MSI);
+		if (retval < 0) {
 			dev_err(&dev->dev,
 			"Found HC with no IRQ. Check BIOS/PCI %s setup!\n",
 				pci_name(dev));
 			retval = -ENODEV;
 			goto disable_pci;
 		}
-		hcd_irq = dev->irq;
+		hcd_irq = pci_irq_vector(dev, 0);
 	}
 
 	hcd = usb_create_hcd(driver, &dev->dev, pci_name(dev));
 	if (!hcd) {
 		retval = -ENOMEM;
-		goto disable_pci;
+		goto free_irq_vectors;
 	}
 
 	hcd->amd_resume_bug = (usb_hcd_amd_remote_wakeup_quirk(dev) &&
@@ -286,6 +287,9 @@ int usb_hcd_pci_probe(struct pci_dev *dev, const struct pci_device_id *id,
 
 put_hcd:
 	usb_put_hcd(hcd);
+free_irq_vectors:
+	if ((driver->flags & HCD_MASK) < HCD_USB3)
+		pci_free_irq_vectors(dev);
 disable_pci:
 	pci_disable_device(dev);
 	dev_err(&dev->dev, "init %s fail, %d\n", pci_name(dev), retval);
@@ -343,6 +347,8 @@ void usb_hcd_pci_remove(struct pci_dev *dev)
 		up_read(&companions_rwsem);
 	}
 	usb_put_hcd(hcd);
+	if ((hcd->driver->flags & HCD_MASK) < HCD_USB3)
+		pci_free_irq_vectors(dev);
 	pci_disable_device(dev);
 }
 EXPORT_SYMBOL_GPL(usb_hcd_pci_remove);
@@ -454,7 +460,7 @@ static int suspend_common(struct device *dev, bool do_wakeup)
 	 * synchronized here.
 	 */
 	if (!hcd->msix_enabled)
-		synchronize_irq(pci_dev->irq);
+		synchronize_irq(pci_irq_vector(pci_dev, 0));
 
 	/* Downstream ports from this root hub should already be quiesced, so
 	 * there will be no DMA activity.  Now we can shut down the upstream
-- 
2.27.0

