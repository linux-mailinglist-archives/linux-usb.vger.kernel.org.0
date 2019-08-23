Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 022A59B1A9
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2019 16:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388169AbfHWOLf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 23 Aug 2019 10:11:35 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:15891 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730899AbfHWOLe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Aug 2019 10:11:34 -0400
IronPort-SDR: dWeX+s2pINtohmAaRUTV9Xu5XH643cshmjtP5ZEMgoA/THit+CzMEI7YMyVlcMKY2+gpSx3yZi
 o43MG8AboewMXht1lsnAr/xu+ZNVElyrLfiKZEhHEU2ZqOPSkgMKyyyObmmKV+F61ZuGKOxysj
 KSBwGWOuxznvR95sdt9vBpgi7EBIjShUAn0xI2lYfxqEfCWXejZ+xwK0i33MzG8eKCuQatyADc
 cgoEz1WNdsCiEXBdULvzWbYuOTjAU6RELaPurso6IOiJ/KlqqVEnnzScCrBHfaFd8UBKUVVspL
 yLA=
X-IronPort-AV: E=Sophos;i="5.64,421,1559548800"; 
   d="scan'208";a="40711319"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 23 Aug 2019 06:11:34 -0800
IronPort-SDR: wXHhGEnrXklgzww6xNsC8vnPTaUh+ob+4qXx+LqHRiU1mbmKS07zUQpsASBjFrDGtVXyXDpEVe
 maM+T1WRAswYDgZQLd5zcnqfnlFSdVy3SsV/ifdGwl++RPfVazZa7ky+p+2L520trkmN3Bbo0e
 B6hW22Y61V8DNUbJSETZtfZuS1JeEWn0PUrNbITCO0HfKPSYrXFyk3NqAKPtAGGrS2ssElgd6M
 fcIMmTSWppLcgGyQMQ8GGxg+HPLpXhrxq9uIxFOozLy4l/fmoxc9uj3t+G1wbWw+TAIzDA4UON
 W9A=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [Patch v5] usb: hcd: use managed device resources
Thread-Topic: [Patch v5] usb: hcd: use managed device resources
Thread-Index: AQHVWbuDnGbGmDS690Kl9IU7UhO1ug==
Date:   Fri, 23 Aug 2019 14:11:28 +0000
Message-ID: <1566569488679.31808@mentor.com>
Accept-Language: de-DE, en-IE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Using managed device resources in usb_hcd_pci_probe() allows devm usage for
resource subranges, such as the mmio resource for the platform device
created to control host/device mode mux, which is a xhci extended
capability, and sits inside the xhci mmio region.

If managed device resources are not used then "parent" resource
is released before subrange at driver removal as .remove callback is
called before the devres list of resources for this device is walked
and released.

This has been observed with the xhci extended capability driver causing a
use-after-free which is now fixed.

An additional nice benefit is that error handling on driver initialisation
is simplified much.

Signed-off-by: Carsten Schmid <carsten_schmid@mentor.com>
Tested-by: Carsten Schmid <carsten_schmid@mentor.com>
---
Rationale:
Use-after-free was reproduced on 4.14.102 and 4.14.129 kernel
using unbind mechanism.
echo 0000:00:15.0 > /sys/bus/pci/drivers/xhci_hcd/unbind

Upstream version of driver is identical in the affected code.
Fix was tested successfully on 4.14.129.
Provided patch applies and compiles on v5.2.8 stable.
As this is also a bugfix, please consider it to go to stable trees too.
---
v2:
   - more speaking name for private data element
   - consider failure in driver init sequence
   - fix minor issues found by checkpatch.pl
v3:
   - corrected typo: resorce -> resource
   - added Reviewed by and Tested-by
v4:
   - completely rewritten to use devm resource allocation
     in hcd-pci
   - modified title to better reflect change content
   - removed Reviewed-by
     [old title: usb: xhci-pci: reorder removal to avoid use-after-free]
v5:
   - rewrite commit message to cover all aspects of the patch
     [old title: usb: hcd: fix use-after-free on driver removal]

Thanks to Hans and Mathias for their encouraging support.
---
 drivers/usb/core/hcd-pci.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index 03432467b05f..7537681355f6 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -216,17 +216,18 @@ int usb_hcd_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		/* EHCI, OHCI */
 		hcd->rsrc_start = pci_resource_start(dev, 0);
 		hcd->rsrc_len = pci_resource_len(dev, 0);
-		if (!request_mem_region(hcd->rsrc_start, hcd->rsrc_len,
-				driver->description)) {
+		if (!devm_request_mem_region(&dev->dev, hcd->rsrc_start,
+				hcd->rsrc_len, driver->description)) {
 			dev_dbg(&dev->dev, "controller already in use\n");
 			retval = -EBUSY;
 			goto put_hcd;
 		}
-		hcd->regs = ioremap_nocache(hcd->rsrc_start, hcd->rsrc_len);
+		hcd->regs = devm_ioremap_nocache(&dev->dev, hcd->rsrc_start,
+				hcd->rsrc_len);
 		if (hcd->regs == NULL) {
 			dev_dbg(&dev->dev, "error mapping memory\n");
 			retval = -EFAULT;
-			goto release_mem_region;
+			goto put_hcd;
 		}
 
 	} else {
@@ -240,8 +241,8 @@ int usb_hcd_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 			hcd->rsrc_start = pci_resource_start(dev, region);
 			hcd->rsrc_len = pci_resource_len(dev, region);
-			if (request_region(hcd->rsrc_start, hcd->rsrc_len,
-					driver->description))
+			if (devm_request_region(&dev->dev, hcd->rsrc_start,
+					hcd->rsrc_len, driver->description))
 				break;
 		}
 		if (region == PCI_ROM_RESOURCE) {
@@ -275,20 +276,13 @@ int usb_hcd_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	}
 
 	if (retval != 0)
-		goto unmap_registers;
+		goto put_hcd;
 	device_wakeup_enable(hcd->self.controller);
 
 	if (pci_dev_run_wake(dev))
 		pm_runtime_put_noidle(&dev->dev);
 	return retval;
 
-unmap_registers:
-	if (driver->flags & HCD_MEMORY) {
-		iounmap(hcd->regs);
-release_mem_region:
-		release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
-	} else
-		release_region(hcd->rsrc_start, hcd->rsrc_len);
 put_hcd:
 	usb_put_hcd(hcd);
 disable_pci:
@@ -347,14 +341,6 @@ void usb_hcd_pci_remove(struct pci_dev *dev)
 		dev_set_drvdata(&dev->dev, NULL);
 		up_read(&companions_rwsem);
 	}
-
-	if (hcd->driver->flags & HCD_MEMORY) {
-		iounmap(hcd->regs);
-		release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
-	} else {
-		release_region(hcd->rsrc_start, hcd->rsrc_len);
-	}
-
 	usb_put_hcd(hcd);
 	pci_disable_device(dev);
 }
-- 
2.17.1
