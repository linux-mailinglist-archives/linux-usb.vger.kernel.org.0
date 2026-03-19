Return-Path: <linux-usb+bounces-35146-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAx9BAwBvGmurAIAu9opvQ
	(envelope-from <linux-usb+bounces-35146-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 14:58:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C422CC4A1
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 14:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB1F5305BAA8
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 13:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C69C34F25C;
	Thu, 19 Mar 2026 13:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gcHbw9MU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC752C21DD
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 13:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773928627; cv=none; b=lV0q4fCAJHPzzRuSjNvfJhvPlxkqv2gn3KthC8tMbdc3rztzTx8tzTUsRJvShMNU8ptzV+UOBY4vzI/IlsXQdxq+nxBZy/vPOowKwuXK7XoyolyE+ApkqIAF4lPnQ0zsnZtsX6foAO/vOX1PVFJl7wsL1bOTtPJD0sRnwqR339o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773928627; c=relaxed/simple;
	bh=y2jYZOT8P1/ED8f11KgH8AFVeBy774xBUu6FHoKrUT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FI/TvrByIhJl0//0w7WYFwDoW19JMJ08KGc7Mpu1XLPUWEirw6RaCxvL86LwDeQLdzEM7uZccdJzgKymn3SXX2yuZRy+xZultpFJg685HZBdmjcO08T6svH3Xbd6yNdal9EhCi9Mwb/N/2iHySUD9SUumQD6O8x+N2NkCA/jYzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gcHbw9MU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773928626; x=1805464626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y2jYZOT8P1/ED8f11KgH8AFVeBy774xBUu6FHoKrUT4=;
  b=gcHbw9MUrqF9nzv1Jn0RSj4cmWB80wNe6LsD6m6VMDiX5irmR8/MIQI4
   hmgtKAdkTK6zeI7PgLLzovvU103nrYwYVY2Q6q0BLK8g5vukrWnkR44aR
   MMtj2NSS/4Cg+IOj3x0tnEzSY6hYCjKlNyHCikkjNWtQgNvV2uS9nV9IR
   MarNq1DMb5TALY1LWxxMMTK3lXGxTETpIbOwmNYaN+LgmMHCy7RP09rc3
   BlteGkvuxUZOu20+3lgczD6WcXJEqykJBcZUiWQDsbBAXAgRCR0QdjQ4w
   FmWAxBi//HsrJKEq2B/lTAUXAp4H1MXM6wzDDj1+cl8riX8a3yvWJg+Yi
   w==;
X-CSE-ConnectionGUID: aXMKShuWRFSSiy7LR8LNlg==
X-CSE-MsgGUID: JnzS43NBSKKRxh9lJ73NTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74971448"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="74971448"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 06:57:06 -0700
X-CSE-ConnectionGUID: S1MV9VJcRjWHhJ7VpnUzTA==
X-CSE-MsgGUID: okCTtPDSQfqi+gfKzuDI9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="223185548"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 19 Mar 2026 06:57:04 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id A872099; Thu, 19 Mar 2026 14:57:03 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 2/9] usb: xhci: rename 'wIndex' parameters to 'portnum'
Date: Thu, 19 Mar 2026 14:56:17 +0100
Message-ID: <20260319135626.3077643-3-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260319135626.3077643-1-niklas.neronin@linux.intel.com>
References: <20260319135626.3077643-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35146-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,linux.intel.com:mid]
X-Rspamd-Queue-Id: 61C422CC4A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Several helper functions take a parameter named 'wIndex', but the
value they receive is not the raw USB request wIndex field. The only
function that actually processes the USB hub request parameter is
xhci_hub_control(), which extracts the relevant port number (and other
upper-byte fields) before passing them down.

To avoid confusion between the USB request parameter and the derived
0-based port index, rename all such function parameters from 'wIndex'
to 'portnum'. This improves readability and makes the call intentions
clearer.

When a function accept struct 'xhci_port' pointer, use its port number
instead.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 60 +++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 4730beae2478..de843ecc7d63 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -577,8 +577,8 @@ static void xhci_disable_port(struct xhci_hcd *xhci, struct xhci_port *port)
 		 hcd->self.busnum, port->hcd_portnum + 1, portsc);
 }
 
-static void xhci_clear_port_change_bit(struct xhci_hcd *xhci, u16 wValue,
-		u16 wIndex, struct xhci_port *port, u32 port_status)
+static void xhci_clear_port_change_bit(struct xhci_hcd *xhci, u16 wValue, struct xhci_port *port,
+				       u32 port_status)
 {
 	char *port_change_bit;
 	u32 status;
@@ -625,7 +625,7 @@ static void xhci_clear_port_change_bit(struct xhci_hcd *xhci, u16 wValue,
 	port_status = xhci_portsc_readl(port);
 
 	xhci_dbg(xhci, "clear port%d %s change, portsc: 0x%x\n",
-		 wIndex + 1, port_change_bit, port_status);
+		 port->hcd_portnum + 1, port_change_bit, port_status);
 }
 
 struct xhci_hub *xhci_get_rhub(struct usb_hcd *hcd)
@@ -675,14 +675,13 @@ static void xhci_set_port_power(struct xhci_hcd *xhci, struct xhci_port *port,
 	spin_lock_irqsave(&xhci->lock, *flags);
 }
 
-static void xhci_port_set_test_mode(struct xhci_hcd *xhci,
-	u16 test_mode, u16 wIndex)
+static void xhci_port_set_test_mode(struct xhci_hcd *xhci, u16 test_mode, int portnum)
 {
 	u32 temp;
 	struct xhci_port *port;
 
 	/* xhci only supports test mode for usb2 ports */
-	port = xhci->usb2_rhub.ports[wIndex];
+	port = xhci->usb2_rhub.ports[portnum];
 	temp = readl(&port->port_reg->portpmsc);
 	temp |= test_mode << PORT_TEST_MODE_SHIFT;
 	writel(temp, &port->port_reg->portpmsc);
@@ -691,8 +690,8 @@ static void xhci_port_set_test_mode(struct xhci_hcd *xhci,
 		xhci_start(xhci);
 }
 
-static int xhci_enter_test_mode(struct xhci_hcd *xhci,
-				u16 test_mode, u16 wIndex, unsigned long *flags)
+static int xhci_enter_test_mode(struct xhci_hcd *xhci, u16 test_mode, int portnum,
+				unsigned long *flags)
 	__must_hold(&xhci->lock)
 {
 	int i, retval;
@@ -726,10 +725,8 @@ static int xhci_enter_test_mode(struct xhci_hcd *xhci,
 	/* Disable runtime PM for test mode */
 	pm_runtime_forbid(xhci_to_hcd(xhci)->self.controller);
 	/* Set PORTPMSC.PTC field to enter selected test mode */
-	/* Port is selected by wIndex. port_id = wIndex + 1 */
-	xhci_dbg(xhci, "Enter Test Mode: %d, Port_id=%d\n",
-					test_mode, wIndex + 1);
-	xhci_port_set_test_mode(xhci, test_mode, wIndex);
+	xhci_dbg(xhci, "Enter Test Mode: %u, Port_id=%d\n", test_mode, portnum + 1);
+	xhci_port_set_test_mode(xhci, test_mode, portnum);
 	return retval;
 }
 
@@ -913,8 +910,7 @@ static void xhci_hub_report_usb3_link_state(struct xhci_hcd *xhci,
  * the compliance mode timer is deleted. A port won't enter
  * compliance mode if it has previously entered U0.
  */
-static void xhci_del_comp_mod_timer(struct xhci_hcd *xhci, u32 status,
-				    u16 wIndex)
+static void xhci_del_comp_mod_timer(struct xhci_hcd *xhci, u32 status, int portnum)
 {
 	u32 all_ports_seen_u0 = ((1 << xhci->usb3_rhub.num_ports) - 1);
 	bool port_in_u0 = ((status & PORT_PLS_MASK) == XDEV_U0);
@@ -923,7 +919,7 @@ static void xhci_del_comp_mod_timer(struct xhci_hcd *xhci, u32 status,
 		return;
 
 	if ((xhci->port_status_u0 != all_ports_seen_u0) && port_in_u0) {
-		xhci->port_status_u0 |= 1 << wIndex;
+		xhci->port_status_u0 |= 1 << portnum;
 		if (xhci->port_status_u0 == all_ports_seen_u0) {
 			timer_delete_sync(&xhci->comp_mode_recovery_timer);
 			xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
@@ -941,12 +937,12 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
 	struct xhci_bus_state *bus_state;
 	struct xhci_hcd	*xhci;
 	struct usb_hcd *hcd;
-	u32 wIndex;
+	int portnum;
 
 	hcd = port->rhub->hcd;
 	bus_state = &port->rhub->bus_state;
 	xhci = hcd_to_xhci(hcd);
-	wIndex = port->hcd_portnum;
+	portnum = port->hcd_portnum;
 
 	if ((portsc & PORT_RESET) || !(portsc & PORT_PE)) {
 		return -EINVAL;
@@ -954,7 +950,7 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
 	/* did port event handler already start resume timing? */
 	if (!port->resume_timestamp) {
 		/* If not, maybe we are in a host initiated resume? */
-		if (test_bit(wIndex, &bus_state->resuming_ports)) {
+		if (test_bit(portnum, &bus_state->resuming_ports)) {
 			/* Host initiated resume doesn't time the resume
 			 * signalling using resume_done[].
 			 * It manually sets RESUME state, sleeps 20ms
@@ -968,20 +964,20 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
 			unsigned long timeout = jiffies +
 				msecs_to_jiffies(USB_RESUME_TIMEOUT);
 
-			set_bit(wIndex, &bus_state->resuming_ports);
+			set_bit(portnum, &bus_state->resuming_ports);
 			port->resume_timestamp = timeout;
 			mod_timer(&hcd->rh_timer, timeout);
-			usb_hcd_start_port_resume(&hcd->self, wIndex);
+			usb_hcd_start_port_resume(&hcd->self, portnum);
 		}
 	/* Has resume been signalled for USB_RESUME_TIME yet? */
 	} else if (time_after_eq(jiffies, port->resume_timestamp)) {
 		int time_left;
 
 		xhci_dbg(xhci, "resume USB2 port %d-%d\n",
-			 hcd->self.busnum, wIndex + 1);
+			 hcd->self.busnum, portnum + 1);
 
 		port->resume_timestamp = 0;
-		clear_bit(wIndex, &bus_state->resuming_ports);
+		clear_bit(portnum, &bus_state->resuming_ports);
 
 		reinit_completion(&port->rexit_done);
 		port->rexit_active = true;
@@ -1005,7 +1001,7 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
 			int port_status = xhci_portsc_readl(port);
 
 			xhci_warn(xhci, "Port resume timed out, port %d-%d: 0x%x\n",
-				  hcd->self.busnum, wIndex + 1, port_status);
+				  hcd->self.busnum, portnum + 1, port_status);
 			/*
 			 * keep rexit_active set if U0 transition failed so we
 			 * know to report PORT_STAT_SUSPEND status back to
@@ -1014,9 +1010,9 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
 			 */
 		}
 
-		usb_hcd_end_port_resume(&hcd->self, wIndex);
-		bus_state->port_c_suspend |= 1 << wIndex;
-		bus_state->suspended_ports &= ~(1 << wIndex);
+		usb_hcd_end_port_resume(&hcd->self, portnum);
+		bus_state->port_c_suspend |= 1 << portnum;
+		bus_state->suspended_ports &= ~(1 << portnum);
 	}
 
 	return 0;
@@ -1153,10 +1149,8 @@ static void xhci_get_usb2_port_status(struct xhci_port *port, u32 *status,
  *  - Stop the Synopsys redriver Compliance Mode polling.
  *  - Drop and reacquire the xHCI lock, in order to wait for port resume.
  */
-static u32 xhci_get_port_status(struct usb_hcd *hcd,
-		struct xhci_bus_state *bus_state,
-	u16 wIndex, u32 raw_port_status,
-		unsigned long *flags)
+static u32 xhci_get_port_status(struct usb_hcd *hcd, struct xhci_bus_state *bus_state,
+				int portnum, u32 raw_port_status, unsigned long *flags)
 	__releases(&xhci->lock)
 	__acquires(&xhci->lock)
 {
@@ -1165,7 +1159,7 @@ static u32 xhci_get_port_status(struct usb_hcd *hcd,
 	struct xhci_port *port;
 
 	rhub = xhci_get_rhub(hcd);
-	port = rhub->ports[wIndex];
+	port = rhub->ports[portnum];
 
 	/* common wPortChange bits */
 	if (raw_port_status & PORT_CSC)
@@ -1196,7 +1190,7 @@ static u32 xhci_get_port_status(struct usb_hcd *hcd,
 		xhci_get_usb2_port_status(port, &status, raw_port_status,
 					  flags);
 
-	if (bus_state->port_c_suspend & (1 << wIndex))
+	if (bus_state->port_c_suspend & (1 << portnum))
 		status |= USB_PORT_STAT_C_SUSPEND << 16;
 
 	return status;
@@ -1598,7 +1592,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		case USB_PORT_FEAT_C_ENABLE:
 		case USB_PORT_FEAT_C_PORT_LINK_STATE:
 		case USB_PORT_FEAT_C_PORT_CONFIG_ERROR:
-			xhci_clear_port_change_bit(xhci, wValue, portnum, port, temp);
+			xhci_clear_port_change_bit(xhci, wValue, port, temp);
 			break;
 		case USB_PORT_FEAT_ENABLE:
 			xhci_disable_port(xhci, port);
-- 
2.50.1


