Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D019359191
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 03:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233200AbhDIBmd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 21:42:33 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:47588 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233153AbhDIBmc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 21:42:32 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C6E6CC00CA;
        Fri,  9 Apr 2021 01:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1617932540; bh=+frHFzkavFcIw/rtKwSdenkc0gQz6Etpz0ryVfSa+mo=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=FLqnMElTyp4PYJB/vV+x3JFh5Upiqzv+wDe3NTam7JOxnGXaGVek+h40WfbRA0VMp
         rlO2uszVZHH/gZ8uN9r756gdYtrDsLNPMU97T/xVDJAMbWcn16ySeCwemEYZNmJDOE
         CTFa4QojGcg6TtZlQhzo6tLGwtSXq0aX4V0GBa7h8573G5WBvl/GyH5EI/JcH02NAa
         Yv1WetxmcyKBCm80HKU1u25+/KCHkrusvSbt3UlfoEtY0TWD2O4bYrAGLFzdNlQdHy
         5gwP4S5a8a/zoyXZO0P4eiKof8VQNyU1i+Xb5lsIv215gJpnTgz5O6SvOHOizlxeoN
         c8zzDDfAq7jBg==
Received: from lab-vbox (unknown [10.205.144.97])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 8156BA0096;
        Fri,  9 Apr 2021 01:42:19 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Thu, 08 Apr 2021 18:42:19 -0700
Date:   Thu, 08 Apr 2021 18:42:19 -0700
Message-Id: <c4055883d9852cd3a6463dfe0f2c8f63366f2169.1617929509.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1617929509.git.Thinh.Nguyen@synopsys.com>
References: <cover.1617929509.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 4/6] usb: xhci: Rename Compliance mode timer quirk
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In preparation for a workaround that needs to poll for the port status,
rename the timer for XHCI_COMP_MODE_QUIRK to be more generic as it can
be used for the new workaround. No funtional change here.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/host/xhci-hub.c |  2 +-
 drivers/usb/host/xhci.c     | 41 +++++++++++++++++--------------------
 drivers/usb/host/xhci.h     |  8 ++++----
 3 files changed, 24 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index e9b18fc17617..8bfafbd680ab 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -893,7 +893,7 @@ static void xhci_del_comp_mod_timer(struct xhci_hcd *xhci, u32 status,
 	if ((xhci->port_status_u0 != all_ports_seen_u0) && port_in_u0) {
 		xhci->port_status_u0 |= 1 << wIndex;
 		if (xhci->port_status_u0 == all_ports_seen_u0) {
-			del_timer_sync(&xhci->comp_mode_recovery_timer);
+			del_timer_sync(&xhci->port_check_timer);
 			xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 				"All USB3 ports have entered U0 already!");
 			xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index e1136a6b9372..e1b3d1063f6b 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -475,7 +475,7 @@ static inline void xhci_msix_sync_irqs(struct xhci_hcd *xhci)
 
 #endif
 
-static void compliance_mode_recovery(struct timer_list *t)
+static void port_check(struct timer_list *t)
 {
 	struct xhci_hcd *xhci;
 	struct usb_hcd *hcd;
@@ -483,7 +483,7 @@ static void compliance_mode_recovery(struct timer_list *t)
 	u32 temp;
 	int i;
 
-	xhci = from_timer(xhci, t, comp_mode_recovery_timer);
+	xhci = from_timer(xhci, t, port_check_timer);
 	rhub = &xhci->usb3_rhub;
 
 	for (i = 0; i < rhub->num_ports; i++) {
@@ -508,8 +508,8 @@ static void compliance_mode_recovery(struct timer_list *t)
 	}
 
 	if (xhci->port_status_u0 != ((1 << rhub->num_ports) - 1))
-		mod_timer(&xhci->comp_mode_recovery_timer,
-			jiffies + msecs_to_jiffies(COMP_MODE_RCVRY_MSECS));
+		mod_timer(&xhci->port_check_timer,
+			jiffies + msecs_to_jiffies(PORT_CHECK_MSECS));
 }
 
 /*
@@ -522,15 +522,14 @@ static void compliance_mode_recovery(struct timer_list *t)
  * status event is generated when entering compliance mode (per xhci spec),
  * this quirk is needed on systems that have the failing hardware installed.
  */
-static void compliance_mode_recovery_timer_init(struct xhci_hcd *xhci)
+static void port_check_timer_init(struct xhci_hcd *xhci)
 {
 	xhci->port_status_u0 = 0;
-	timer_setup(&xhci->comp_mode_recovery_timer, compliance_mode_recovery,
-		    0);
-	xhci->comp_mode_recovery_timer.expires = jiffies +
-			msecs_to_jiffies(COMP_MODE_RCVRY_MSECS);
+	timer_setup(&xhci->port_check_timer, port_check, 0);
+	xhci->port_check_timer.expires = jiffies +
+			msecs_to_jiffies(PORT_CHECK_MSECS);
 
-	add_timer(&xhci->comp_mode_recovery_timer);
+	add_timer(&xhci->port_check_timer);
 	xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 			"Compliance mode recovery timer initialized");
 }
@@ -596,7 +595,7 @@ static int xhci_init(struct usb_hcd *hcd)
 	/* Initializing Compliance Mode Recovery Data If Needed */
 	if (xhci_compliance_mode_recovery_timer_quirk_check()) {
 		xhci->quirks |= XHCI_COMP_MODE_QUIRK;
-		compliance_mode_recovery_timer_init(xhci);
+		port_check_timer_init(xhci);
 	}
 
 	return retval;
@@ -739,10 +738,9 @@ static void xhci_stop(struct usb_hcd *hcd)
 	/* Deleting Compliance Mode Recovery Timer */
 	if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
 			(!(xhci_all_ports_seen_u0(xhci)))) {
-		del_timer_sync(&xhci->comp_mode_recovery_timer);
+		del_timer_sync(&xhci->port_check_timer);
 		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
-				"%s: compliance mode recovery timer deleted",
-				__func__);
+				"%s: port check timer deleted", __func__);
 	}
 
 	if (xhci->quirks & XHCI_AMD_PLL_FIX)
@@ -1057,15 +1055,14 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 	spin_unlock_irq(&xhci->lock);
 
 	/*
-	 * Deleting Compliance Mode Recovery Timer because the xHCI Host
+	 * Deleting Port Check Timer because the xHCI Host
 	 * is about to be suspended.
 	 */
 	if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
 			(!(xhci_all_ports_seen_u0(xhci)))) {
-		del_timer_sync(&xhci->comp_mode_recovery_timer);
+		del_timer_sync(&xhci->port_check_timer);
 		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
-				"%s: compliance mode recovery timer deleted",
-				__func__);
+				"%s: port check timer deleted", __func__);
 	}
 
 	/* step 5: remove core well power */
@@ -1150,9 +1147,9 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 
 		if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
 				!(xhci_all_ports_seen_u0(xhci))) {
-			del_timer_sync(&xhci->comp_mode_recovery_timer);
+			del_timer_sync(&xhci->port_check_timer);
 			xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
-				"Compliance Mode Recovery Timer deleted!");
+				"Port Check Timer deleted!");
 		}
 
 		/* Let the USB core know _both_ roothubs lost power. */
@@ -1245,13 +1242,13 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		}
 	}
 	/*
-	 * If system is subject to the Quirk, Compliance Mode Timer needs to
+	 * If system is subject to the Quirk, Port Check Timer needs to
 	 * be re-initialized Always after a system resume. Ports are subject
 	 * to suffer the Compliance Mode issue again. It doesn't matter if
 	 * ports have entered previously to U0 before system's suspension.
 	 */
 	if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) && !comp_timer_running)
-		compliance_mode_recovery_timer_init(xhci);
+		port_check_timer_init(xhci);
 
 	if (xhci->quirks & XHCI_ASMEDIA_MODIFY_FLOWCONTROL)
 		usb_asmedia_modifyflowcontrol(to_pci_dev(hcd->self.controller));
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 27d2c1176dd1..b52b7dcb5bb9 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1862,12 +1862,12 @@ struct xhci_hcd {
 	/* cached extended protocol port capabilities */
 	struct xhci_port_cap	*port_caps;
 	unsigned int		num_port_caps;
-	/* Compliance Mode Recovery Data */
-	struct timer_list	comp_mode_recovery_timer;
+	/* For quirks that require to poll for port status */
+	struct timer_list	port_check_timer;
 	u32			port_status_u0;
 	u16			test_mode;
-/* Compliance Mode Timer Triggered every 2 seconds */
-#define COMP_MODE_RCVRY_MSECS 2000
+/* Port polling frequency */
+#define PORT_CHECK_MSECS 2000
 
 	/* Track max eSS interval for XHCI_ISOC_BLOCKED_DISCONNECT */
 	unsigned int		max_ess_interval;
-- 
2.28.0

