Return-Path: <linux-usb+bounces-35884-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCTFDmZuzmnxngYAu9opvQ
	(envelope-from <linux-usb+bounces-35884-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:25:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F664389AC6
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:25:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C73931896BE
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94182E9757;
	Thu,  2 Apr 2026 13:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HTt7Jrpm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052E22F1FD0
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135865; cv=none; b=t+IAmI4d0Xt4sS/zPue4YTJCT1QEUmO0wVycpwYOgEDPKCepfNtlHBalSwNHpz43Z5wwxqcCBXRGdj7WgBANMzHjQGbATmBoG23tMsLk6ODCuiRXgsALlWqP14O20aJOcq6L5vPuHOaolHKJ3yDuVDNX6J5kMiXiqf9rQNADd/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135865; c=relaxed/simple;
	bh=b9BBwSUZ6+XcsJ2tXk2B/RRYjA2+AyWZm2pXHUfOrQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sd5rOez/BITQXYHfo+NYktzB8V9BzptG+Ks7jjCY52Nf1drK2ZZ9CBBwThi4BT8aAvbAaxBmXvSRsFdcOyQ+yq3gFsCb9J/f4W8/RrECNHAr/S1ZTJMozj1p0k0rp1+TpNp+FCZ+HRCDT5LC2eYMIBL4RzRs03cAcQQ8dvzB4R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HTt7Jrpm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135864; x=1806671864;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b9BBwSUZ6+XcsJ2tXk2B/RRYjA2+AyWZm2pXHUfOrQQ=;
  b=HTt7Jrpm5YVhtENfhBxowC4atmRaw6HNffW/rfZUnolcAfXKnf7oejsQ
   Sobft+K0+WPOpS1bufdB5uOwIDy/bQUkWMDHQXF1P8D1wyZsl9li46gvM
   jjQJU12CjBKwttAY0Ga1GQDvlOnANyDQNTJ5Ung48IjHVZ2sFYp/1SUDy
   cb9fiiku2GpJDx2YjocUjhapC48O9hPv2auRVDnWCp/ZzLIMS2g+LnHpe
   jnmZ+7IMd8m8zk3NngsJYfos6YCgQOjFtDGSKyHN1o/SrftfejgdrR7VC
   ap7Ca5zU+kF5omisQZsi4W7gkioQCBrYbioy7h23fl+WK+fafr69Dwtr9
   g==;
X-CSE-ConnectionGUID: py/ECF21SoWlpAkKHfdQ2g==
X-CSE-MsgGUID: G7AhGUTdRV2HZTo40P3lvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87650903"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87650903"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:44 -0700
X-CSE-ConnectionGUID: Df0Rv6siTfiMHkPG6yzxSw==
X-CSE-MsgGUID: DkRuYzNLSrSbp396yBHqYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227241581"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.50])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:43 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 19/25] usb: xhci: add PORTSC variable to xhci_hub_control()
Date: Thu,  2 Apr 2026 16:13:36 +0300
Message-ID: <20260402131342.2628648-20-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402131342.2628648-1-mathias.nyman@linux.intel.com>
References: <20260402131342.2628648-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35884-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 9F664389AC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Neronin <niklas.neronin@linux.intel.com>

The variable 'temp' is used multiple times throughout xhci_hub_control()
for holding only PORTSC register values.

As a follow-up to introducing a dedicated variable for PORTPMSC, rename
all remaining 'temp' to 'portsc'. This improves readability and clarifies
what is being modified.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 102 ++++++++++++++++++------------------
 1 file changed, 51 insertions(+), 51 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 4da3b48dfce0..9cd64d6989c9 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1202,7 +1202,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
 	int max_ports;
 	unsigned long flags;
-	u32 temp, portpmsc, status;
+	u32 portsc, portpmsc, status;
 	int retval = 0;
 	struct xhci_bus_state *bus_state;
 	u16 link_state;
@@ -1258,19 +1258,19 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			goto error;
 
 		port = ports[portnum];
-		temp = xhci_portsc_readl(port);
-		if (temp == ~(u32)0) {
+		portsc = xhci_portsc_readl(port);
+		if (portsc == ~(u32)0) {
 			xhci_hc_died(xhci);
 			retval = -ENODEV;
 			break;
 		}
-		trace_xhci_get_port_status(port, temp);
-		status = xhci_get_port_status(hcd, bus_state, portnum, temp, &flags);
+		trace_xhci_get_port_status(port, portsc);
+		status = xhci_get_port_status(hcd, bus_state, portnum, portsc, &flags);
 		if (status == 0xffffffff)
 			goto error;
 
 		xhci_dbg(xhci, "Get port status %d-%d read: 0x%x, return 0x%x",
-			 hcd->self.busnum, portnum + 1, temp, status);
+			 hcd->self.busnum, portnum + 1, portsc, status);
 
 		put_unaligned(cpu_to_le32(status), (__le32 *) buf);
 		/* if USB 3.1 extended port status return additional 4 bytes */
@@ -1283,7 +1283,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				break;
 			}
 			port_li = readl(&port->port_reg->portli);
-			status = xhci_get_ext_port_status(temp, port_li);
+			status = xhci_get_ext_port_status(portsc, port_li);
 			put_unaligned_le32(status, &buf[4]);
 		}
 		break;
@@ -1293,18 +1293,18 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			goto error;
 
 		port = ports[portnum];
-		temp = xhci_portsc_readl(port);
-		if (temp == ~(u32)0) {
+		portsc = xhci_portsc_readl(port);
+		if (portsc == ~(u32)0) {
 			xhci_hc_died(xhci);
 			retval = -ENODEV;
 			break;
 		}
-		temp = xhci_port_state_to_neutral(temp);
+		portsc = xhci_port_state_to_neutral(portsc);
 		/* FIXME: What new port features do we need to support? */
 		switch (wValue) {
 		case USB_PORT_FEAT_SUSPEND:
-			temp = xhci_portsc_readl(port);
-			if ((temp & PORT_PLS_MASK) != XDEV_U0) {
+			portsc = xhci_portsc_readl(port);
+			if ((portsc & PORT_PLS_MASK) != XDEV_U0) {
 				/* Resume the port to U0 first */
 				xhci_set_link_state(xhci, port, XDEV_U0);
 				spin_unlock_irqrestore(&xhci->lock, flags);
@@ -1315,9 +1315,9 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			 * a port unless the port reports that it is in the
 			 * enabled (PED = ‘1’,PLS < ‘3’) state.
 			 */
-			temp = xhci_portsc_readl(port);
-			if ((temp & PORT_PE) == 0 || (temp & PORT_RESET)
-				|| (temp & PORT_PLS_MASK) >= XDEV_U3) {
+			portsc = xhci_portsc_readl(port);
+			if ((portsc & PORT_PE) == 0 || (portsc & PORT_RESET) ||
+			    (portsc & PORT_PLS_MASK) >= XDEV_U3) {
 				xhci_warn(xhci, "USB core suspending port %d-%d not in U0/U1/U2\n",
 					  hcd->self.busnum, portnum + 1);
 				goto error;
@@ -1338,26 +1338,26 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			msleep(10); /* wait device to enter */
 			spin_lock_irqsave(&xhci->lock, flags);
 
-			temp = xhci_portsc_readl(port);
+			portsc = xhci_portsc_readl(port);
 			bus_state->suspended_ports |= 1 << portnum;
 			break;
 		case USB_PORT_FEAT_LINK_STATE:
 			link_state = (wIndex & 0xff00) >> 3;
-			temp = xhci_portsc_readl(port);
+			portsc = xhci_portsc_readl(port);
 			/* Disable port */
 			if (link_state == USB_SS_PORT_LS_SS_DISABLED) {
 				xhci_dbg(xhci, "Disable port %d-%d\n",
 					 hcd->self.busnum, portnum + 1);
-				temp = xhci_port_state_to_neutral(temp);
+				portsc = xhci_port_state_to_neutral(portsc);
 				/*
 				 * Clear all change bits, so that we get a new
 				 * connection event.
 				 */
-				temp |= PORT_CSC | PORT_PEC | PORT_WRC |
-					PORT_OCC | PORT_RC | PORT_PLC |
-					PORT_CEC;
-				xhci_portsc_writel(port, temp | PORT_PE);
-				temp = xhci_portsc_readl(port);
+				portsc |= PORT_CSC | PORT_PEC | PORT_WRC |
+					  PORT_OCC | PORT_RC | PORT_PLC |
+					  PORT_CEC;
+				xhci_portsc_writel(port, portsc | PORT_PE);
+				portsc = xhci_portsc_readl(port);
 				break;
 			}
 
@@ -1366,7 +1366,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				xhci_dbg(xhci, "Enable port %d-%d\n",
 					 hcd->self.busnum, portnum + 1);
 				xhci_set_link_state(xhci, port,	XDEV_RXDETECT);
-				temp = xhci_portsc_readl(port);
+				portsc = xhci_portsc_readl(port);
 				break;
 			}
 
@@ -1390,7 +1390,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 					break;
 				}
 
-				if ((temp & PORT_CONNECT)) {
+				if ((portsc & PORT_CONNECT)) {
 					xhci_warn(xhci, "Can't set compliance mode when port is connected\n");
 					goto error;
 				}
@@ -1399,11 +1399,11 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 					 hcd->self.busnum, portnum + 1);
 				xhci_set_link_state(xhci, port, XDEV_COMP_MODE);
 
-				temp = xhci_portsc_readl(port);
+				portsc = xhci_portsc_readl(port);
 				break;
 			}
 			/* Port must be enabled */
-			if (!(temp & PORT_PE)) {
+			if (!(portsc & PORT_PE)) {
 				retval = -ENODEV;
 				break;
 			}
@@ -1422,7 +1422,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			 * completion
 			 */
 			if (link_state == USB_SS_PORT_LS_U0) {
-				u32 pls = temp & PORT_PLS_MASK;
+				u32 pls = portsc & PORT_PLS_MASK;
 				bool wait_u0 = false;
 
 				/* already in U0 */
@@ -1447,7 +1447,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 					xhci_dbg(xhci, "missing U0 port change event for port %d-%d\n",
 						 hcd->self.busnum, portnum + 1);
 				spin_lock_irqsave(&xhci->lock, flags);
-				temp = xhci_portsc_readl(port);
+				portsc = xhci_portsc_readl(port);
 				break;
 			}
 
@@ -1465,12 +1465,12 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				spin_unlock_irqrestore(&xhci->lock, flags);
 				while (retries--) {
 					usleep_range(4000, 8000);
-					temp = xhci_portsc_readl(port);
-					if ((temp & PORT_PLS_MASK) == XDEV_U3)
+					portsc = xhci_portsc_readl(port);
+					if ((portsc & PORT_PLS_MASK) == XDEV_U3)
 						break;
 				}
 				spin_lock_irqsave(&xhci->lock, flags);
-				temp = xhci_portsc_readl(port);
+				portsc = xhci_portsc_readl(port);
 				bus_state->suspended_ports |= 1 << portnum;
 			}
 			break;
@@ -1484,24 +1484,24 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			xhci_set_port_power(xhci, port, true, &flags);
 			break;
 		case USB_PORT_FEAT_RESET:
-			temp = (temp | PORT_RESET);
-			xhci_portsc_writel(port, temp);
+			portsc |= PORT_RESET;
+			xhci_portsc_writel(port, portsc);
 
-			temp = xhci_portsc_readl(port);
+			portsc = xhci_portsc_readl(port);
 			xhci_dbg(xhci, "set port reset, actual port %d-%d status  = 0x%x\n",
-				 hcd->self.busnum, portnum + 1, temp);
+				 hcd->self.busnum, portnum + 1, portsc);
 			break;
 		case USB_PORT_FEAT_REMOTE_WAKE_MASK:
 			wake_mask = wIndex & 0xff00;
 			xhci_set_remote_wake_mask(xhci, port, wake_mask);
-			temp = xhci_portsc_readl(port);
+			portsc = xhci_portsc_readl(port);
 			xhci_dbg(xhci, "set port remote wake mask, actual port %d-%d status  = 0x%x\n",
-				 hcd->self.busnum, portnum + 1, temp);
+				 hcd->self.busnum, portnum + 1, portsc);
 			break;
 		case USB_PORT_FEAT_BH_PORT_RESET:
-			temp |= PORT_WR;
-			xhci_portsc_writel(port, temp);
-			temp = xhci_portsc_readl(port);
+			portsc |= PORT_WR;
+			xhci_portsc_writel(port, portsc);
+			portsc = xhci_portsc_readl(port);
 			break;
 		case USB_PORT_FEAT_U1_TIMEOUT:
 			if (hcd->speed < HCD_USB3)
@@ -1538,7 +1538,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			goto error;
 		}
 		/* unblock any posted writes */
-		temp = xhci_portsc_readl(port);
+		portsc = xhci_portsc_readl(port);
 		break;
 	case ClearPortFeature:
 		portnum = (wIndex & 0xff) - 1;
@@ -1546,23 +1546,23 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			goto error;
 
 		port = ports[portnum];
-		temp = xhci_portsc_readl(port);
-		if (temp == ~(u32)0) {
+		portsc = xhci_portsc_readl(port);
+		if (portsc == ~(u32)0) {
 			xhci_hc_died(xhci);
 			retval = -ENODEV;
 			break;
 		}
 		/* FIXME: What new port features do we need to support? */
-		temp = xhci_port_state_to_neutral(temp);
+		portsc = xhci_port_state_to_neutral(portsc);
 		switch (wValue) {
 		case USB_PORT_FEAT_SUSPEND:
-			temp = xhci_portsc_readl(port);
+			portsc = xhci_portsc_readl(port);
 			xhci_dbg(xhci, "clear USB_PORT_FEAT_SUSPEND\n");
-			xhci_dbg(xhci, "PORTSC %04x\n", temp);
-			if (temp & PORT_RESET)
+			xhci_dbg(xhci, "PORTSC %04x\n", portsc);
+			if (portsc & PORT_RESET)
 				goto error;
-			if ((temp & PORT_PLS_MASK) == XDEV_U3) {
-				if ((temp & PORT_PE) == 0)
+			if ((portsc & PORT_PLS_MASK) == XDEV_U3) {
+				if ((portsc & PORT_PE) == 0)
 					goto error;
 
 				set_bit(portnum, &bus_state->resuming_ports);
@@ -1593,7 +1593,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		case USB_PORT_FEAT_C_ENABLE:
 		case USB_PORT_FEAT_C_PORT_LINK_STATE:
 		case USB_PORT_FEAT_C_PORT_CONFIG_ERROR:
-			xhci_clear_port_change_bit(xhci, wValue, port, temp);
+			xhci_clear_port_change_bit(xhci, wValue, port, portsc);
 			break;
 		case USB_PORT_FEAT_ENABLE:
 			xhci_disable_port(xhci, port);
-- 
2.43.0


