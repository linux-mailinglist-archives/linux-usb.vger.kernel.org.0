Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 866BC523FE2
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 00:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344286AbiEKWDq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 18:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241097AbiEKWDp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 18:03:45 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA57BE3B
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 15:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652306623; x=1683842623;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k2PNimZLy1uNkr/E2RvhJvHrKBKII5IpPi4fhFQBBFA=;
  b=b58HftGQ8rereiuD3YprgzZmBQ7ZODw5w0t1OgjmMGuq1znorx7gM3IP
   oxvrAkNNU7ymcVuysURoCmdY8e5IPge8KYoH3CToPlO+OLbso5vfkTzsw
   NGxPmu3N2zcSkurIxNA3aLB5iiKwmr1/CDBJmKcqNYOPQ2SzN4wU1D8Ze
   iF8OBINmiZ7FwqxTxbjumuGt3bHngzqQXjd3tI9tJhJjtECFCMOAe9sRt
   FUIL91VBN4RtN6sMAODVQnxX+A1AQ12c4urAFshC+2YnepC59SqB0tntZ
   G6pY5UG3hcG/tawoFpgCi3YQAuh3BwbVWHE8kotK84V0iTDy7DBVFZRGc
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="330427429"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="330427429"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 15:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="542496212"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga006.jf.intel.com with ESMTP; 11 May 2022 15:03:39 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 2/9] xhci: prepare for operation w/o shared hcd
Date:   Thu, 12 May 2022 01:04:43 +0300
Message-Id: <20220511220450.85367-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511220450.85367-1-mathias.nyman@linux.intel.com>
References: <20220511220450.85367-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Heiner Kallweit <hkallweit1@gmail.com>

This patch prepares xhci for the following scenario:
- If either of the root hubs has no ports, then omit shared hcd
- Main hcd can be USB3 if there are no USB2 ports

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c |  3 ++-
 drivers/usb/host/xhci-mem.c | 11 ++++----
 drivers/usb/host/xhci.c     | 53 ++++++++++++++++++++++++-------------
 drivers/usb/host/xhci.h     | 26 ++++++++++++++++++
 4 files changed, 68 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index f65f1ba2b592..c54f2bc23d3f 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -707,6 +707,7 @@ static int xhci_enter_test_mode(struct xhci_hcd *xhci,
 				u16 test_mode, u16 wIndex, unsigned long *flags)
 	__must_hold(&xhci->lock)
 {
+	struct usb_hcd *usb3_hcd = xhci_get_usb3_hcd(xhci);
 	int i, retval;
 
 	/* Disable all Device Slots */
@@ -727,7 +728,7 @@ static int xhci_enter_test_mode(struct xhci_hcd *xhci,
 	xhci_dbg(xhci, "Disable all port (PP = 0)\n");
 	/* Power off USB3 ports*/
 	for (i = 0; i < xhci->usb3_rhub.num_ports; i++)
-		xhci_set_port_power(xhci, xhci->shared_hcd, i, false, flags);
+		xhci_set_port_power(xhci, usb3_hcd, i, false, flags);
 	/* Power off USB2 ports*/
 	for (i = 0; i < xhci->usb2_rhub.num_ports; i++)
 		xhci_set_port_power(xhci, xhci->main_hcd, i, false, flags);
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index bbb27ee2c6a3..50bf64dcb186 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1072,7 +1072,7 @@ static u32 xhci_find_real_port_number(struct xhci_hcd *xhci,
 	struct usb_hcd *hcd;
 
 	if (udev->speed >= USB_SPEED_SUPER)
-		hcd = xhci->shared_hcd;
+		hcd = xhci_get_usb3_hcd(xhci);
 	else
 		hcd = xhci->main_hcd;
 
@@ -2362,10 +2362,11 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 		xhci->usb2_rhub.num_ports = USB_MAXCHILDREN;
 	}
 
-	/*
-	 * Note we could have all USB 3.0 ports, or all USB 2.0 ports.
-	 * Not sure how the USB core will handle a hub with no ports...
-	 */
+	if (!xhci->usb2_rhub.num_ports)
+		xhci_info(xhci, "USB2 root hub has no ports\n");
+
+	if (!xhci->usb3_rhub.num_ports)
+		xhci_info(xhci, "USB3 root hub has no ports\n");
 
 	xhci_create_rhub_port_array(xhci, &xhci->usb2_rhub, flags);
 	xhci_create_rhub_port_array(xhci, &xhci->usb3_rhub, flags);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 92ae4ec531ff..5d4955ed4074 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -486,6 +486,10 @@ static void compliance_mode_recovery(struct timer_list *t)
 
 	xhci = from_timer(xhci, t, comp_mode_recovery_timer);
 	rhub = &xhci->usb3_rhub;
+	hcd = rhub->hcd;
+
+	if (!hcd)
+		return;
 
 	for (i = 0; i < rhub->num_ports; i++) {
 		temp = readl(rhub->ports[i]->addr);
@@ -499,7 +503,6 @@ static void compliance_mode_recovery(struct timer_list *t)
 					i + 1);
 			xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 					"Attempting compliance mode recovery");
-			hcd = xhci->shared_hcd;
 
 			if (hcd->state == HC_STATE_SUSPENDED)
 				usb_hcd_resume_root_hub(hcd);
@@ -612,14 +615,11 @@ static int xhci_run_finished(struct xhci_hcd *xhci)
 		xhci_halt(xhci);
 		return -ENODEV;
 	}
-	xhci->shared_hcd->state = HC_STATE_RUNNING;
 	xhci->cmd_ring_state = CMD_RING_STATE_RUNNING;
 
 	if (xhci->quirks & XHCI_NEC_HOST)
 		xhci_ring_cmd_db(xhci);
 
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"Finished xhci_run for USB3 roothub");
 	return 0;
 }
 
@@ -694,12 +694,15 @@ int xhci_run(struct usb_hcd *hcd)
 			xhci_free_command(xhci, command);
 	}
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"Finished xhci_run for USB2 roothub");
+			"Finished %s for main hcd", __func__);
 
 	xhci_create_dbc_dev(xhci);
 
 	xhci_debugfs_init(xhci);
 
+	if (xhci_has_one_roothub(xhci))
+		return xhci_run_finished(xhci);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(xhci_run);
@@ -992,7 +995,7 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 		return 0;
 
 	if (hcd->state != HC_STATE_SUSPENDED ||
-			xhci->shared_hcd->state != HC_STATE_SUSPENDED)
+	    (xhci->shared_hcd && xhci->shared_hcd->state != HC_STATE_SUSPENDED))
 		return -EINVAL;
 
 	/* Clear root port wake on bits if wakeup not allowed. */
@@ -1009,15 +1012,18 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 		 __func__, hcd->self.busnum);
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	del_timer_sync(&hcd->rh_timer);
-	clear_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
-	del_timer_sync(&xhci->shared_hcd->rh_timer);
+	if (xhci->shared_hcd) {
+		clear_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
+		del_timer_sync(&xhci->shared_hcd->rh_timer);
+	}
 
 	if (xhci->quirks & XHCI_SUSPEND_DELAY)
 		usleep_range(1000, 1500);
 
 	spin_lock_irq(&xhci->lock);
 	clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
-	clear_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);
+	if (xhci->shared_hcd)
+		clear_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);
 	/* step 1: stop endpoint */
 	/* skipped assuming that port suspend has done */
 
@@ -1117,7 +1123,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		msleep(100);
 
 	set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
-	set_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);
+	if (xhci->shared_hcd)
+		set_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);
 
 	spin_lock_irq(&xhci->lock);
 
@@ -1177,7 +1184,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 
 		/* Let the USB core know _both_ roothubs lost power. */
 		usb_root_hub_lost_power(xhci->main_hcd->self.root_hub);
-		usb_root_hub_lost_power(xhci->shared_hcd->self.root_hub);
+		if (xhci->shared_hcd)
+			usb_root_hub_lost_power(xhci->shared_hcd->self.root_hub);
 
 		xhci_dbg(xhci, "Stop HCD\n");
 		xhci_halt(xhci);
@@ -1217,12 +1225,13 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 
 		xhci_dbg(xhci, "Start the primary HCD\n");
 		retval = xhci_run(hcd->primary_hcd);
-		if (!retval) {
+		if (!retval && secondary_hcd) {
 			xhci_dbg(xhci, "Start the secondary HCD\n");
 			retval = xhci_run(secondary_hcd);
 		}
 		hcd->state = HC_STATE_SUSPENDED;
-		xhci->shared_hcd->state = HC_STATE_SUSPENDED;
+		if (xhci->shared_hcd)
+			xhci->shared_hcd->state = HC_STATE_SUSPENDED;
 		goto done;
 	}
 
@@ -1260,7 +1269,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		}
 
 		if (pending_portevent) {
-			usb_hcd_resume_root_hub(xhci->shared_hcd);
+			if (xhci->shared_hcd)
+				usb_hcd_resume_root_hub(xhci->shared_hcd);
 			usb_hcd_resume_root_hub(hcd);
 		}
 	}
@@ -1279,8 +1289,10 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 	/* Re-enable port polling. */
 	xhci_dbg(xhci, "%s: starting usb%d port polling.\n",
 		 __func__, hcd->self.busnum);
-	set_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
-	usb_hcd_poll_rh_status(xhci->shared_hcd);
+	if (xhci->shared_hcd) {
+		set_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
+		usb_hcd_poll_rh_status(xhci->shared_hcd);
+	}
 	set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	usb_hcd_poll_rh_status(hcd);
 
@@ -5279,9 +5291,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 
 	xhci = hcd_to_xhci(hcd);
 
-	if (usb_hcd_is_primary_hcd(hcd)) {
-		xhci_hcd_init_usb2_data(xhci, hcd);
-	} else {
+	if (!usb_hcd_is_primary_hcd(hcd)) {
 		xhci_hcd_init_usb3_data(xhci, hcd);
 		return 0;
 	}
@@ -5362,6 +5372,11 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 		return retval;
 	xhci_dbg(xhci, "Called HCD init\n");
 
+	if (xhci_hcd_is_usb3(hcd))
+		xhci_hcd_init_usb3_data(xhci, hcd);
+	else
+		xhci_hcd_init_usb2_data(xhci, hcd);
+
 	xhci_info(xhci, "hcc params 0x%08x hci version 0x%x quirks 0x%016llx\n",
 		  xhci->hcc_params, xhci->hci_version, xhci->quirks);
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 473a33ce299e..c792a3148e49 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1911,6 +1911,8 @@ struct xhci_hcd {
 	unsigned		hw_lpm_support:1;
 	/* Broken Suspend flag for SNPS Suspend resume issue */
 	unsigned		broken_suspend:1;
+	/* Indicates that omitting hcd is supported if root hub has no ports */
+	unsigned		allow_single_roothub:1;
 	/* cached usb2 extened protocol capabilites */
 	u32                     *ext_caps;
 	unsigned int            num_ext_caps;
@@ -1966,6 +1968,30 @@ static inline struct usb_hcd *xhci_to_hcd(struct xhci_hcd *xhci)
 	return xhci->main_hcd;
 }
 
+static inline struct usb_hcd *xhci_get_usb3_hcd(struct xhci_hcd *xhci)
+{
+	if (xhci->shared_hcd)
+		return xhci->shared_hcd;
+
+	if (!xhci->usb2_rhub.num_ports)
+		return xhci->main_hcd;
+
+	return NULL;
+}
+
+static inline bool xhci_hcd_is_usb3(struct usb_hcd *hcd)
+{
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+
+	return hcd == xhci_get_usb3_hcd(xhci);
+}
+
+static inline bool xhci_has_one_roothub(struct xhci_hcd *xhci)
+{
+	return xhci->allow_single_roothub &&
+	       (!xhci->usb2_rhub.num_ports || !xhci->usb3_rhub.num_ports);
+}
+
 #define xhci_dbg(xhci, fmt, args...) \
 	dev_dbg(xhci_to_hcd(xhci)->self.controller , fmt , ## args)
 #define xhci_err(xhci, fmt, args...) \
-- 
2.25.1

