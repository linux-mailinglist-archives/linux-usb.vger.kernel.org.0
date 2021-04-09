Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5884C359192
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 03:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbhDIBmj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 21:42:39 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:45266 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232426AbhDIBmj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 21:42:39 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ABCF84047D;
        Fri,  9 Apr 2021 01:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1617932547; bh=CE+X6FiC/nf4g/r1FZ8tYebCPTvluBVigp/fWxN4290=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=SVT0x6ZayLPYMLxd8iOBwGEV/7+TnC9hZJgnTOM8qHc6DiNVt4AqtvO5PeNgHIkhD
         l7HHpuHzeDo1cORyHX55AcEuujpxintCuMJU4ReO1XVdM+wsGXjVSP02b/l12g1g14
         BD9xDkI1HH38L83P37TaV1CmlspJLn5vS7KJNTNgqNbZHQ2cPIKWF5sqP20VK1S/wh
         qM7VsqufA6MwjlpEdPG7CNe89E+x7g9Hny1BpxepbGk+t9MIPjCgadfkJCgk79wLAP
         RdXcvj/o9rhTDHRDz4x0w4I3f4lAxgZkBwMD2vbD1oi7ssgUQXlk/oiKbWgg2ALQtD
         NczqY59of+g3A==
Received: from lab-vbox (unknown [10.205.144.97])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 1F0FFA007C;
        Fri,  9 Apr 2021 01:42:25 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Thu, 08 Apr 2021 18:42:25 -0700
Date:   Thu, 08 Apr 2021 18:42:25 -0700
Message-Id: <9a058ff185fd206c06c95c9634b7f387871d72eb.1617929509.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1617929509.git.Thinh.Nguyen@synopsys.com>
References: <cover.1617929509.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 5/6] usb: xhci: Workaround lost disconnect port status
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If an eSS device with active periodic transfers is disconnected from the
DWC_usb31 (v1.90a and prior) host controller at root port, the host
controller may not detect a disconnection. By active transfers, it
means that the endpoint is not in flow control, and there are active
Transfer Descriptors available for the host to initiate transfers to the
endpoint. This issue can occur if the endpoint periodic interval is in
2ms, 4ms, or 8ms.

In addition, the host controller will not be able to detect a new device
connection while the disconnection is not processed. The controller will
set the link state of the affected port to eSS_INACTIVE.

To workaround this, have the xHCI driver polls for the eSS root port
status every 2 seconds. If eSS_INACTIVE state is detected, initiate a
fake connection change to stop all the active endpoints and start
polling for new connection change.

Since XHCI_COMP_MODE_QUIRK is basically doing the same thing except for
polling for a different link state, we will use the same timer and
polling rate for this new workaround. Introduce a new quirk
XHCI_LOST_DISCONNECT_QUIRK to poll for eSS_INACTIVE port link state and
fake a connection change.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/host/xhci-hub.c     | 10 +++++++-
 drivers/usb/host/xhci.c         | 44 ++++++++++++++++++++++++---------
 include/linux/usb/xhci-quirks.h |  1 +
 3 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 8bfafbd680ab..32fbf95f021b 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -868,6 +868,11 @@ static void xhci_hub_report_usb3_link_state(struct xhci_hcd *xhci,
 		if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
 				(pls == USB_SS_PORT_LS_COMP_MOD))
 			pls |= USB_PORT_STAT_CONNECTION;
+
+		/* Fake a connection change */
+		if ((xhci->quirks & XHCI_LOST_DISCONNECT_QUIRK) &&
+				pls == XDEV_INACTIVE)
+			pls |= USB_PORT_STAT_CONNECTION;
 	}
 
 	/* update status field */
@@ -887,7 +892,8 @@ static void xhci_del_comp_mod_timer(struct xhci_hcd *xhci, u32 status,
 	u32 all_ports_seen_u0 = ((1 << xhci->usb3_rhub.num_ports) - 1);
 	bool port_in_u0 = ((status & PORT_PLS_MASK) == XDEV_U0);
 
-	if (!(xhci->quirks & XHCI_COMP_MODE_QUIRK))
+	if (!(xhci->quirks & XHCI_COMP_MODE_QUIRK) ||
+	    (xhci->quirks & XHCI_LOST_DISCONNECT_QUIRK))
 		return;
 
 	if ((xhci->port_status_u0 != all_ports_seen_u0) && port_in_u0) {
@@ -1654,6 +1660,8 @@ int xhci_hub_status_data(struct usb_hcd *hcd, char *buf)
 		trace_xhci_hub_status_data(i, temp);
 
 		if ((temp & mask) != 0 ||
+			((xhci->quirks & XHCI_LOST_DISCONNECT_QUIRK) &&
+				(temp & PORT_PLS_MASK) == XDEV_INACTIVE) ||
 			(bus_state->port_c_suspend & 1 << i) ||
 			(bus_state->resume_done[i] && time_after_eq(
 			    jiffies, bus_state->resume_done[i]))) {
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index e1b3d1063f6b..62275ee88849 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -485,10 +485,14 @@ static void port_check(struct timer_list *t)
 
 	xhci = from_timer(xhci, t, port_check_timer);
 	rhub = &xhci->usb3_rhub;
+	hcd = xhci->shared_hcd;
 
 	for (i = 0; i < rhub->num_ports; i++) {
+		bool poll_rhub = false;
+
 		temp = readl(rhub->ports[i]->addr);
-		if ((temp & PORT_PLS_MASK) == USB_SS_PORT_LS_COMP_MOD) {
+		if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
+		    ((temp & PORT_PLS_MASK) == USB_SS_PORT_LS_COMP_MOD)) {
 			/*
 			 * Compliance Mode Detected. Letting USB Core
 			 * handle the Warm Reset
@@ -498,8 +502,15 @@ static void port_check(struct timer_list *t)
 					i + 1);
 			xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 					"Attempting compliance mode recovery");
-			hcd = xhci->shared_hcd;
 
+			poll_rhub = true;
+		}
+
+		if ((xhci->quirks & XHCI_LOST_DISCONNECT_QUIRK) &&
+		    ((temp & PORT_PLS_MASK) == XDEV_INACTIVE))
+			poll_rhub = true;
+
+		if (poll_rhub) {
 			if (hcd->state == HC_STATE_SUSPENDED)
 				usb_hcd_resume_root_hub(hcd);
 
@@ -507,7 +518,9 @@ static void port_check(struct timer_list *t)
 		}
 	}
 
-	if (xhci->port_status_u0 != ((1 << rhub->num_ports) - 1))
+	if ((xhci->quirks & XHCI_LOST_DISCONNECT_QUIRK) ||
+	    ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
+	     xhci->port_status_u0 != ((1 << rhub->num_ports) - 1)))
 		mod_timer(&xhci->port_check_timer,
 			jiffies + msecs_to_jiffies(PORT_CHECK_MSECS));
 }
@@ -593,10 +606,12 @@ static int xhci_init(struct usb_hcd *hcd)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Finished xhci_init");
 
 	/* Initializing Compliance Mode Recovery Data If Needed */
-	if (xhci_compliance_mode_recovery_timer_quirk_check()) {
+	if (xhci_compliance_mode_recovery_timer_quirk_check())
 		xhci->quirks |= XHCI_COMP_MODE_QUIRK;
+
+	if (xhci->quirks & XHCI_LOST_DISCONNECT_QUIRK ||
+	    xhci->quirks & XHCI_COMP_MODE_QUIRK)
 		port_check_timer_init(xhci);
-	}
 
 	return retval;
 }
@@ -736,8 +751,9 @@ static void xhci_stop(struct usb_hcd *hcd)
 	xhci_cleanup_msix(xhci);
 
 	/* Deleting Compliance Mode Recovery Timer */
-	if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
-			(!(xhci_all_ports_seen_u0(xhci)))) {
+	if ((xhci->quirks & XHCI_LOST_DISCONNECT_QUIRK) ||
+	    ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
+	     !(xhci_all_ports_seen_u0(xhci)))) {
 		del_timer_sync(&xhci->port_check_timer);
 		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 				"%s: port check timer deleted", __func__);
@@ -1058,8 +1074,9 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 	 * Deleting Port Check Timer because the xHCI Host
 	 * is about to be suspended.
 	 */
-	if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
-			(!(xhci_all_ports_seen_u0(xhci)))) {
+	if ((xhci->quirks & XHCI_LOST_DISCONNECT_QUIRK) ||
+	    ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
+	     !(xhci_all_ports_seen_u0(xhci)))) {
 		del_timer_sync(&xhci->port_check_timer);
 		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 				"%s: port check timer deleted", __func__);
@@ -1145,8 +1162,9 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 	/* If restore operation fails, re-initialize the HC during resume */
 	if ((temp & STS_SRE) || hibernated) {
 
-		if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
-				!(xhci_all_ports_seen_u0(xhci))) {
+		if ((xhci->quirks & XHCI_LOST_DISCONNECT_QUIRK) ||
+		    ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
+		     !(xhci_all_ports_seen_u0(xhci)))) {
 			del_timer_sync(&xhci->port_check_timer);
 			xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 				"Port Check Timer deleted!");
@@ -1247,7 +1265,9 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 	 * to suffer the Compliance Mode issue again. It doesn't matter if
 	 * ports have entered previously to U0 before system's suspension.
 	 */
-	if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) && !comp_timer_running)
+	if (!comp_timer_running &&
+	    ((xhci->quirks & XHCI_LOST_DISCONNECT_QUIRK) ||
+	     (xhci->quirks & XHCI_COMP_MODE_QUIRK)))
 		port_check_timer_init(xhci);
 
 	if (xhci->quirks & XHCI_ASMEDIA_MODIFY_FLOWCONTROL)
diff --git a/include/linux/usb/xhci-quirks.h b/include/linux/usb/xhci-quirks.h
index 3a8566c902be..ce428a7e9de8 100644
--- a/include/linux/usb/xhci-quirks.h
+++ b/include/linux/usb/xhci-quirks.h
@@ -60,6 +60,7 @@
 #define XHCI_NO_SOFT_RETRY		BIT_ULL(40)
 #define XHCI_ISOC_BLOCKED_DISCONNECT	BIT_ULL(41)
 #define XHCI_LIMIT_FS_BI_INTR_EP	BIT_ULL(42)
+#define XHCI_LOST_DISCONNECT_QUIRK	BIT_ULL(43)
 
 struct usb_hcd;
 
-- 
2.28.0

