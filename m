Return-Path: <linux-usb+bounces-35885-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UL5zKA1tzmmpngYAu9opvQ
	(envelope-from <linux-usb+bounces-35885-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:20:13 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 931A73898F8
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:20:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3C9D63059566
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E37C307492;
	Thu,  2 Apr 2026 13:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EAdC6i3S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A298B2F5A06
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135867; cv=none; b=NXC6mUgZC405c+iLqygonIrUarjO7D+4fqDHSrmeq4iIm0+86m4a1IZ9MWf2w461fPFUKSZDlCSGNglUxmkU2716lhSKrVM1dkQIDz8qXveywuMAV6UMtz+mt8mt753wWGyLsBYOxRQ+EIcTvE2xfRI5P5+ztRKc9eBa2QNsjfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135867; c=relaxed/simple;
	bh=sqM3NN4jIqxoNVzqyOmEipxqHET7t7ydZzY/6fSXN5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Um9IYWriu4T2gzyTc9wbwek9uQOTVYvzlq8c+U1A6+KB7aiUZpYllQsooJdKWiL64fDMUkBnz8Vq+atarlaSXVmnb8vE7wNlm5M+3veFwLkIyKe1DrnQofXQMJQSR0WX5H+oSOGztCwqiAVAI5MudgKavpswdj3zjBK2zCtAYGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EAdC6i3S; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135866; x=1806671866;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sqM3NN4jIqxoNVzqyOmEipxqHET7t7ydZzY/6fSXN5E=;
  b=EAdC6i3SZRtnHlpCQ5yVangJkShDeeKt5xQVk2FMbj4w6hdN8dVRkcSU
   Xi2Pur90YyeyTlwpOYTEtHPAh//kxmmWAL6KTS5Agjm0MuoyQAAax7QT3
   1gYYEkk28JM4MugU8qViMCkbb0YJETSjV+9LNE2uHNH5ZOTprmxvCO4FO
   +eMg9r6H0CORoy/ztiD0HFxDI+1mjjBV6hUdvRYHAAHIftsz0GCXz3eVw
   5Gp1HQVCyAJoPGiiMA5Jf+SaGaMtF7BXgAG8AkLuYh3r4SPAPE8avk6Ky
   sTN8v82CsRWWC244+Rdfv2qWcathuA1qG5EnHIWCPtNkh/sF4vpkiEJcw
   g==;
X-CSE-ConnectionGUID: E2SKhkoTQXekC4K0vI7cEg==
X-CSE-MsgGUID: a+FMeWDZSQyHthpeGpPfNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87650911"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87650911"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:46 -0700
X-CSE-ConnectionGUID: zFZxglFaTR+pRlhR8tRFJw==
X-CSE-MsgGUID: 3VPjqbVDQbSHOb4IK1w+BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227241584"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.50])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:45 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 20/25] usb: xhci: rename parameter to match argument 'portsc'
Date: Thu,  2 Apr 2026 16:13:37 +0300
Message-ID: <20260402131342.2628648-21-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402131342.2628648-1-mathias.nyman@linux.intel.com>
References: <20260402131342.2628648-1-mathias.nyman@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35885-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 931A73898F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Neronin <niklas.neronin@linux.intel.com>

A previous patch renamed the temporary variable holding the value read
from the PORTSC register from 'temp' to 'portsc'. This patch follows up
by updating the parameter names of all helper functions called from
xhci_hub_control() that receive a PORTSC value, as well as the functions
they call.

Function changed:
xhci_get_port_status()
 L xhci_get_usb3_port_status()
    L xhci_hub_report_usb3_link_state()
    L xhci_del_comp_mod_timer()
xhci_get_ext_port_status()
xhci_port_state_to_neutral()
xhci_clear_port_change_bit()
xhci_port_speed()

The reason for the rename is to differentiate between port
status/change bit to be written to PORTSC and replying to hub-class
USB requests. Each of them use their specific macros.

Use "portsc" name for PORTSC values and "status" for values intended
for replying to hub-class USB request.

A dedicated structure for USB hub port status responses
('struct usb_port_status' from ch11.h) exists and will be integrated in
a later patch.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 61 ++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 9cd64d6989c9..8e134f6b4e37 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -375,11 +375,11 @@ static void xhci_hub_descriptor(struct usb_hcd *hcd, struct xhci_hcd *xhci,
 
 }
 
-static unsigned int xhci_port_speed(unsigned int port_status)
+static unsigned int xhci_port_speed(int portsc)
 {
-	if (DEV_LOWSPEED(port_status))
+	if (DEV_LOWSPEED(portsc))
 		return USB_PORT_STAT_LOW_SPEED;
-	if (DEV_HIGHSPEED(port_status))
+	if (DEV_HIGHSPEED(portsc))
 		return USB_PORT_STAT_HIGH_SPEED;
 	/*
 	 * FIXME: Yes, we should check for full speed, but the core uses that as
@@ -429,9 +429,9 @@ static unsigned int xhci_port_speed(unsigned int port_status)
 
 /**
  * xhci_port_state_to_neutral() - Clean up read portsc value back into writeable
- * @state: u32 port value read from portsc register to be cleanup up
+ * @portsc: u32 port value read from portsc register to be cleanup up
  *
- * Given a port state, this function returns a value that would result in the
+ * Given a portsc, this function returns a value that would result in the
  * port being in the same state, if the value was written to the port status
  * control register.
  * Save Read Only (RO) bits and save read/write bits where
@@ -442,10 +442,10 @@ static unsigned int xhci_port_speed(unsigned int port_status)
  * changing port state.
  */
 
-u32 xhci_port_state_to_neutral(u32 state)
+u32 xhci_port_state_to_neutral(u32 portsc)
 {
 	/* Save read-only status and port state */
-	return (state & XHCI_PORT_RO) | (state & XHCI_PORT_RWS);
+	return (portsc & XHCI_PORT_RO) | (portsc & XHCI_PORT_RWS);
 }
 EXPORT_SYMBOL_GPL(xhci_port_state_to_neutral);
 
@@ -578,7 +578,7 @@ static void xhci_disable_port(struct xhci_hcd *xhci, struct xhci_port *port)
 }
 
 static void xhci_clear_port_change_bit(struct xhci_hcd *xhci, u16 wValue, struct xhci_port *port,
-				       u32 port_status)
+				       u32 portsc)
 {
 	char *port_change_bit;
 	u32 status;
@@ -621,11 +621,11 @@ static void xhci_clear_port_change_bit(struct xhci_hcd *xhci, u16 wValue, struct
 		return;
 	}
 	/* Change bits are all write 1 to clear */
-	xhci_portsc_writel(port, port_status | status);
-	port_status = xhci_portsc_readl(port);
+	xhci_portsc_writel(port, portsc | status);
+	portsc = xhci_portsc_readl(port);
 
 	xhci_dbg(xhci, "clear port%d %s change, portsc: 0x%x\n",
-		 port->hcd_portnum + 1, port_change_bit, port_status);
+		 port->hcd_portnum + 1, port_change_bit, portsc);
 }
 
 struct xhci_hub *xhci_get_rhub(struct usb_hcd *hcd)
@@ -851,14 +851,14 @@ void xhci_test_and_clear_bit(struct xhci_hcd *xhci, struct xhci_port *port,
 
 /* Updates Link Status for super Speed port */
 static void xhci_hub_report_usb3_link_state(struct xhci_hcd *xhci,
-		u32 *status, u32 status_reg)
+		u32 *status, u32 portsc)
 {
-	u32 pls = status_reg & PORT_PLS_MASK;
+	u32 pls = portsc & PORT_PLS_MASK;
 
 	/* When the CAS bit is set then warm reset
 	 * should be performed on port
 	 */
-	if (status_reg & PORT_CAS) {
+	if (portsc & PORT_CAS) {
 		/* The CAS bit can be set while the port is
 		 * in any link state.
 		 * Only roothubs have CAS bit, so we
@@ -910,10 +910,10 @@ static void xhci_hub_report_usb3_link_state(struct xhci_hcd *xhci,
  * the compliance mode timer is deleted. A port won't enter
  * compliance mode if it has previously entered U0.
  */
-static void xhci_del_comp_mod_timer(struct xhci_hcd *xhci, u32 status, int portnum)
+static void xhci_del_comp_mod_timer(struct xhci_hcd *xhci, u32 portsc, int portnum)
 {
 	u32 all_ports_seen_u0 = ((1 << xhci->usb3_rhub.num_ports) - 1);
-	bool port_in_u0 = ((status & PORT_PLS_MASK) == XDEV_U0);
+	bool port_in_u0 = ((portsc & PORT_PLS_MASK) == XDEV_U0);
 
 	if (!(xhci->quirks & XHCI_COMP_MODE_QUIRK))
 		return;
@@ -1018,13 +1018,13 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
 	return 0;
 }
 
-static u32 xhci_get_ext_port_status(u32 raw_port_status, u32 port_li)
+static u32 xhci_get_ext_port_status(u32 portsc, u32 port_li)
 {
 	u32 ext_stat = 0;
 	int speed_id;
 
 	/* only support rx and tx lane counts of 1 in usb3.1 spec */
-	speed_id = DEV_PORT_SPEED(raw_port_status);
+	speed_id = DEV_PORT_SPEED(portsc);
 	ext_stat |= speed_id;		/* bits 3:0, RX speed id */
 	ext_stat |= speed_id << 4;	/* bits 7:4, TX speed id */
 
@@ -1150,7 +1150,7 @@ static void xhci_get_usb2_port_status(struct xhci_port *port, u32 *status,
  *  - Drop and reacquire the xHCI lock, in order to wait for port resume.
  */
 static u32 xhci_get_port_status(struct usb_hcd *hcd, struct xhci_bus_state *bus_state,
-				int portnum, u32 raw_port_status, unsigned long *flags)
+				int portnum, u32 portsc, unsigned long *flags)
 	__releases(&xhci->lock)
 	__acquires(&xhci->lock)
 {
@@ -1162,33 +1162,32 @@ static u32 xhci_get_port_status(struct usb_hcd *hcd, struct xhci_bus_state *bus_
 	port = rhub->ports[portnum];
 
 	/* common wPortChange bits */
-	if (raw_port_status & PORT_CSC)
+	if (portsc & PORT_CSC)
 		status |= USB_PORT_STAT_C_CONNECTION << 16;
-	if (raw_port_status & PORT_PEC)
+	if (portsc & PORT_PEC)
 		status |= USB_PORT_STAT_C_ENABLE << 16;
-	if ((raw_port_status & PORT_OCC))
+	if (portsc & PORT_OCC)
 		status |= USB_PORT_STAT_C_OVERCURRENT << 16;
-	if ((raw_port_status & PORT_RC))
+	if (portsc & PORT_RC)
 		status |= USB_PORT_STAT_C_RESET << 16;
 
 	/* common wPortStatus bits */
-	if (raw_port_status & PORT_CONNECT) {
+	if (portsc & PORT_CONNECT) {
 		status |= USB_PORT_STAT_CONNECTION;
-		status |= xhci_port_speed(raw_port_status);
+		status |= xhci_port_speed(portsc);
 	}
-	if (raw_port_status & PORT_PE)
+	if (portsc & PORT_PE)
 		status |= USB_PORT_STAT_ENABLE;
-	if (raw_port_status & PORT_OC)
+	if (portsc & PORT_OC)
 		status |= USB_PORT_STAT_OVERCURRENT;
-	if (raw_port_status & PORT_RESET)
+	if (portsc & PORT_RESET)
 		status |= USB_PORT_STAT_RESET;
 
 	/* USB2 and USB3 specific bits, including Port Link State */
 	if (hcd->speed >= HCD_USB3)
-		xhci_get_usb3_port_status(port, &status, raw_port_status);
+		xhci_get_usb3_port_status(port, &status, portsc);
 	else
-		xhci_get_usb2_port_status(port, &status, raw_port_status,
-					  flags);
+		xhci_get_usb2_port_status(port, &status, portsc, flags);
 
 	if (bus_state->port_c_suspend & (1 << portnum))
 		status |= USB_PORT_STAT_C_SUSPEND << 16;
-- 
2.43.0


