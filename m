Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDE8535A9AE
	for <lists+linux-usb@lfdr.de>; Sat, 10 Apr 2021 02:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235320AbhDJAr3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 20:47:29 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:46954 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235312AbhDJAr3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Apr 2021 20:47:29 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6FCB7C00CB;
        Sat, 10 Apr 2021 00:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1618015635; bh=tq4xc0d56NxO2c7Uf5zSd9LFdpKIsj/l+9sUWMT8oQo=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=FakvpRznVPk/1C6MxflGzCCtByGhsQLuQZqFTuR5b31zUARDt1nZjF+1S3HXi1A5i
         QGOKKXVCeTHg/i/Gy31VFdGVxCix3ZeJ4g7lNlX+KV9VaYu6XeFEBHl4h/GRcfS/dS
         7yYgUKkpF37oFQVmGu4LYPv2ddvXLiR4MLoa+UmWxpCB8jDuCu2Qx2ZRIOS35xMC42
         9V3E/RPxb1AZEzQkhHhWjbQPQAH9d40uC3ii56Os3MGrLT4S3w1oHS5nC2Ol+GSb9b
         TYiSUJ2qGvVPAhiEBw1jXtb+do2aG0SkhMk3qfh5Il+Y9mqsDrdMCfsr97IM15j9RF
         kEnA5RNJG06wQ==
Received: from lab-vbox (unknown [10.205.130.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 2BBF6A007C;
        Sat, 10 Apr 2021 00:47:14 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Fri, 09 Apr 2021 17:47:14 -0700
Date:   Fri, 09 Apr 2021 17:47:14 -0700
Message-Id: <11cd7b9c481ca0be1a3a33a8c94443fd49a59b22.1618014279.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1618014279.git.Thinh.Nguyen@synopsys.com>
References: <cover.1618014279.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 5/7] usb: xhci: Rename Compliance mode timer quirk
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
 Changes in v2:
 - None

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

