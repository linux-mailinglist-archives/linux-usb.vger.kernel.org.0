Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 719D7540089
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jun 2022 15:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245012AbiFGN5l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jun 2022 09:57:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243882AbiFGN5i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jun 2022 09:57:38 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC6722B1F
        for <linux-usb@vger.kernel.org>; Tue,  7 Jun 2022 06:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654610257; x=1686146257;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IltMqYX9SV7Twry08w8peegu9aVbUcCBvB0kxUUgluM=;
  b=l9SPUFV9mBv0btlpoSIHj9+POyZWArPDcgmUgOZiY4F/pcZ8cl6HQHD3
   HI/iYtbX3I+LhcQBr4zyIP7B+IZQviLhOvcq6ksojWbqXQCGCpXT9stZe
   5Our9phEUIbMmuGjbf4dFdTKQp/GcMFubuRvj/lDsRVsErRR8vIEm5K3Y
   GwQHc/uD0UBlhWPBmMuhRjodjx8cqe6D2N4JrPFWjtT9Vp7OaTWcvpnro
   ijbe6lKMJzZdO3XCXOVKTwM98FAFPqqAUA3c6pOUk8L6a4RfXhlmtaTa9
   0KTEz6Zyv07p3LYfTB9qinzUXV9XbN2nqPJtHchafKJfIfeRIIrVCWvlo
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="302083883"
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; 
   d="scan'208";a="302083883"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 06:57:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; 
   d="scan'208";a="907061572"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga005.fm.intel.com with ESMTP; 07 Jun 2022 06:57:35 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <linux-usb@vger.kernel.org>, <stern@rowland.harvard.edu>
Cc:     evgreen@google.com, shobhit.srivastava@intel.com,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFC PATCH 1/1] xhci: pci: power off roothub ports in hibernate poweroff_late stage
Date:   Tue,  7 Jun 2022 16:58:36 +0300
Message-Id: <20220607135836.627711-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220607135836.627711-1-mathias.nyman@linux.intel.com>
References: <20220607135836.627711-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Power off roothub ports in hibernate S4 poweroff_late stage to avoid
self-powered usb devices from surviving in U3 suspended state into
next reboot. Bootloader/firmware can't handle usb ports in U3, and
will timeout, causing extra delay during reboot/restore from S4.

Only turn off ports if xhci isn't capable of waking up from S4, as
turning off port power will disable remote wake for connected devices.

This is a bit of a hack, we create a custom non-constant dev_pm_ops
strucure for xhci-pci driver where we first copy the standard
usb_hcd_pci_pm_ops content, and then add the poweroff_late callback
to turn of port power for xhci-pci

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c |  4 ++--
 drivers/usb/host/xhci-pci.c | 32 +++++++++++++++++++++++++++++++-
 drivers/usb/host/xhci.h     |  2 ++
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index c54f2bc23d3f..dc404107f4d9 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -652,8 +652,8 @@ struct xhci_hub *xhci_get_rhub(struct usb_hcd *hcd)
  * It will release and re-aquire the lock while calling ACPI
  * method.
  */
-static void xhci_set_port_power(struct xhci_hcd *xhci, struct usb_hcd *hcd,
-				u16 index, bool on, unsigned long *flags)
+void xhci_set_port_power(struct xhci_hcd *xhci, struct usb_hcd *hcd, u16 index,
+			 bool on, unsigned long *flags)
 	__must_hold(&xhci->lock)
 {
 	struct xhci_hub *rhub;
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index fac9492a8bda..89c4c3f07a99 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -85,6 +85,7 @@
 static const char hcd_name[] = "xhci_hcd";
 
 static struct hc_driver __read_mostly xhci_pci_hc_driver;
+static struct dev_pm_ops xhci_hcd_pci_pm_ops;
 
 static int xhci_pci_setup(struct usb_hcd *hcd);
 
@@ -630,6 +631,32 @@ static int xhci_pci_resume(struct usb_hcd *hcd, bool hibernated)
 	return retval;
 }
 
+static int xhci_pci_poweroff_late(struct device *dev)
+{
+	struct pci_dev          *pci_dev = to_pci_dev(dev);
+	struct usb_hcd          *hcd = pci_get_drvdata(pci_dev);
+	struct xhci_hcd		*xhci = hcd_to_xhci(hcd);
+	unsigned long		flags;
+	int			i;
+
+	if (!device_may_wakeup(dev)) {
+		spin_lock_irqsave(&xhci->lock, flags);
+
+		/* Power off USB2 ports*/
+		for (i = 0; i < xhci->usb2_rhub.num_ports; i++)
+			xhci_set_port_power(xhci, xhci->main_hcd, i, false,
+					    &flags);
+		/* Power off USB3 ports*/
+		for (i = 0; i < xhci->usb3_rhub.num_ports; i++)
+			xhci_set_port_power(xhci, xhci->shared_hcd, i, false,
+					    &flags);
+
+		spin_unlock_irqrestore(&xhci->lock, flags);
+	}
+
+	return 0;
+}
+
 static void xhci_pci_shutdown(struct usb_hcd *hcd)
 {
 	struct xhci_hcd		*xhci = hcd_to_xhci(hcd);
@@ -685,7 +712,7 @@ static struct pci_driver xhci_pci_driver = {
 	.shutdown = 	usb_hcd_pci_shutdown,
 #ifdef CONFIG_PM
 	.driver = {
-		.pm = &usb_hcd_pci_pm_ops
+		.pm = &xhci_hcd_pci_pm_ops
 	},
 #endif
 };
@@ -697,6 +724,9 @@ static int __init xhci_pci_init(void)
 	xhci_pci_hc_driver.pci_suspend = xhci_pci_suspend;
 	xhci_pci_hc_driver.pci_resume = xhci_pci_resume;
 	xhci_pci_hc_driver.shutdown = xhci_pci_shutdown;
+
+	xhci_hcd_pci_pm_ops = usb_hcd_pci_pm_ops;
+	xhci_hcd_pci_pm_ops.poweroff_late = xhci_pci_poweroff_late;
 #endif
 	return pci_register_driver(&xhci_pci_driver);
 }
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 0bd76c94a4b1..28aaf031f9a8 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2196,6 +2196,8 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue, u16 wIndex,
 int xhci_hub_status_data(struct usb_hcd *hcd, char *buf);
 int xhci_find_raw_port_number(struct usb_hcd *hcd, int port1);
 struct xhci_hub *xhci_get_rhub(struct usb_hcd *hcd);
+void xhci_set_port_power(struct xhci_hcd *xhci, struct usb_hcd *hcd, u16 index,
+			 bool on, unsigned long *flags);
 
 void xhci_hc_died(struct xhci_hcd *xhci);
 
-- 
2.25.1

