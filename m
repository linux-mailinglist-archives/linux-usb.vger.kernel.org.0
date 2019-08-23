Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 827649AC6F
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2019 12:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391907AbfHWKGi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 23 Aug 2019 06:06:38 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:40959 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391899AbfHWKGh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Aug 2019 06:06:37 -0400
IronPort-SDR: MobJrKvaLs71+7AO5O3gKD6Y7LXqAEeT5VW3H6ggzg5qP4T/BHX/BR/jw4Q0UucIFfD+2EVlp5
 EH7sEHulXPaJNQ1x3EmBspZOHYv9ODTQg5jOgUDD2Z7rVKaiRAm1sDm0gik/7IZOeTfQaFVRoa
 T9pd9yDvT82iNmN3wv7/BX1X64u6WlyTxFuGllwDGhy1ML1GMQ5MJ70AWxaA0Xergf6juiYDdf
 l+CPI+M7Kec1mKbJZ+dNq38ZhWMiiZ0SUD9UhIw2R7ClLTerVB7n3IGNvDDXWfnMt+j34ImVJc
 P1A=
X-IronPort-AV: E=Sophos;i="5.64,420,1559548800"; 
   d="scan'208";a="40675118"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 23 Aug 2019 02:06:06 -0800
IronPort-SDR: 8A0eKfb7HsYULvpEZPKg5oY79rr8+JrgwhthYp1r7SBHe/9+HDln7YZG+LnEgoHupPx3oOoKkz
 uaEnyLYy3o+AHPoHRRUBAHjM6RhSTPqAbU84VmL+Akd3ISMJ+8amY4FqZ6mBHUwMXz/v5aM684
 US9TqlfzbFCrrWZ7cYCBDyUXgncisX81ddJH0Onwb8ZI3TqFxELDHCSGMPbBg7rUM3n2IKLgb/
 8Cd2qNHGVZuw3TeZJiKWjzT/mLujneqMRpKA2Xf9QzlG97d4O1muP0qPat6pQjFF8hXJmV+UMx
 xQ0=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [Patch v4] usb: hcd: fix use-after-free on driver removal
Thread-Topic: [Patch v4] usb: hcd: fix use-after-free on driver removal
Thread-Index: AQHVWZfhcriOMYVBfUWq2zWHQehVwg==
Date:   Fri, 23 Aug 2019 10:06:01 +0000
Message-ID: <1566554761464.60146@mentor.com>
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

On driver removal, the platform_device_unregister call
attached through devm_add_action_or_reset was executed
after usb_hcd_pci_remove.
This lead to a use-after-free for the iomem resource of
the xhci-ext-caps driver in the platform removal
because the parent of the resource was freed earlier.

Fix this by using devm for hcd-pci created resources.
This simplifies error handling on driver initialisation
and fixes the removal sequence.

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
As this is a bugfix, please consider it to go to stable trees too.
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
