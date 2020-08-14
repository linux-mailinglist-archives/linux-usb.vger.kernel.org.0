Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B892244E71
	for <lists+linux-usb@lfdr.de>; Fri, 14 Aug 2020 20:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728263AbgHNSWW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Aug 2020 14:22:22 -0400
Received: from mga06.intel.com ([134.134.136.31]:8502 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726320AbgHNSWW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Aug 2020 14:22:22 -0400
IronPort-SDR: GhTHYQXwbqzorUxQqcUhhVU+BdebaMN1PccJ6+SAIfiT5cvhQIUSeP0PoeeaBgcbTFhW0aiNkC
 GLLva4XiQlHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9713"; a="215995803"
X-IronPort-AV: E=Sophos;i="5.76,313,1592895600"; 
   d="scan'208";a="215995803"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2020 11:22:21 -0700
IronPort-SDR: VXbx1aIMiMzNHNT+/4w2Cf4O1juPzU03SYb6Vjqd9PtE3U67bRd1w6SeCM2Kc1ZGFncHOynlwd
 lPRAw5hONcaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,313,1592895600"; 
   d="scan'208";a="399550328"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 14 Aug 2020 11:22:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1D42615D; Fri, 14 Aug 2020 21:22:18 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        "Schmid, Carsten" <Carsten_Schmid@mentor.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        John Garry <john.garry@huawei.com>
Subject: [PATCH v1] usb: hcd: Fix use after free in usb_hcd_pci_remove()
Date:   Fri, 14 Aug 2020 21:22:18 +0300
Message-Id: <20200814182218.71957-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On the removal stage we put a reference to the controller structure and
if it's not used anymore it gets freed, but later we try to dereference
a pointer to a member of that structure.

Copy necessary field to a temporary variable to avoid use after free.

Fixes: 306c54d0edb6 ("usb: hcd: Try MSI interrupts on PCI devices")
Reported-by: John Garry <john.garry@huawei.com>
Link: https://lore.kernel.org/linux-usb/30a8c4ca-64c2-863b-cfcd-0970599c0ba3@huawei.com/
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/core/hcd-pci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index 4dc443aaef5c..ec0d6c50610c 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -315,11 +315,14 @@ EXPORT_SYMBOL_GPL(usb_hcd_pci_probe);
 void usb_hcd_pci_remove(struct pci_dev *dev)
 {
 	struct usb_hcd		*hcd;
+	int			hcd_driver_flags;
 
 	hcd = pci_get_drvdata(dev);
 	if (!hcd)
 		return;
 
+	hcd_driver_flags = hcd->driver->flags;
+
 	if (pci_dev_run_wake(dev))
 		pm_runtime_get_noresume(&dev->dev);
 
@@ -347,7 +350,7 @@ void usb_hcd_pci_remove(struct pci_dev *dev)
 		up_read(&companions_rwsem);
 	}
 	usb_put_hcd(hcd);
-	if ((hcd->driver->flags & HCD_MASK) < HCD_USB3)
+	if ((hcd_driver_flags & HCD_MASK) < HCD_USB3)
 		pci_free_irq_vectors(dev);
 	pci_disable_device(dev);
 }
-- 
2.28.0

