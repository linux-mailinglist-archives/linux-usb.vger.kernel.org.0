Return-Path: <linux-usb+bounces-35152-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOOGHCUBvGmurAIAu9opvQ
	(envelope-from <linux-usb+bounces-35152-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 14:59:01 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 104242CC4CD
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 14:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BD503212B24
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 13:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1609338839C;
	Thu, 19 Mar 2026 13:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KW1S+ivw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179E43A4501
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 13:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773928630; cv=none; b=gBUX0EmZDO+GoOmTTarNloephA+SdLQ5vBnLsWRXIsxAHhsiNfZIw079QDRznS6iue+xYvHyY+hkGn83sKSQl+H8YwtMG9YBmj3cl7s+b/BE3PRD/kMpVAhlLdPJy4kM6aW/3z1UIUmVsN5A3fI/tWB8tQofmGpGkWvesBtQmlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773928630; c=relaxed/simple;
	bh=zv+ungc5PeV4DKObMOZoywlLVcgWF3cHWYLGB3KOhGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GGG8VIqLNQIH05XN53t5T2f+NJMrOEds+28zxrafo7jl5rnfURkZEQlhuE0tC/ArwPE2djaq8028xeXVgL27zpWkRsUAPnt21teBVsDkV8T1ESNjIcKUyponZ0IRLmIUCVVZHYY8VguN0sxEfEW9XY/iLW1VK5VEptYzBIjbiak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KW1S+ivw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773928629; x=1805464629;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zv+ungc5PeV4DKObMOZoywlLVcgWF3cHWYLGB3KOhGQ=;
  b=KW1S+ivw8KEnt5ftSp+mPzpyKDyRSFioxTXIt3VswWwL0Wt3fOySYXX6
   SEGK6CQBRIxz3i7zylxx9HzyTmLerIAHw73yT+1p4CJACxrkwGQJGZogU
   Qt/w4uCAGZdkjGEZjj1l6Br8/qMB9DKPiC8zg5EBaLM4vWGWc+rDTJusH
   a1yRH+drhreNNyvHAMY4BsiWI6UTEnkmlgkYH46P6LDIRMnLXloyYS3Vl
   vystz+fpo3bRqpJ1F5S3MAV1hxMSZCwXAmMGU+BDYvUbf5E6hwi4vP7SH
   BRs7uSVVFd+YpscuIJ43AV/+ypaHMZk8sM7KcOQNPiFjNvorFLjiNvwAX
   A==;
X-CSE-ConnectionGUID: hPrk1IpwTnKlvmO8PjvXCg==
X-CSE-MsgGUID: zHzMfAabRU+INKugIsfIjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78904206"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="78904206"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 06:57:08 -0700
X-CSE-ConnectionGUID: AlCKUrc4QPieiQlfa3iwJw==
X-CSE-MsgGUID: VemQSkkqQM6geDxd9nY0Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="260866334"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 19 Mar 2026 06:57:07 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id AF8909B; Thu, 19 Mar 2026 14:57:06 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 7/9] usb: xhci: add PORTSC variable to xhci_hub_control()
Date: Thu, 19 Mar 2026 14:56:22 +0100
Message-ID: <20260319135626.3077643-8-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260319135626.3077643-1-niklas.neronin@linux.intel.com>
References: <20260319135626.3077643-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35152-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 104242CC4CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The variable 'temp' is used multiple times throughout xhci_hub_control()
for holding only PORTSC register values.

As a follow-up to introducing a dedicated variable for PORTPMSC, rename
all remaining 'temp' to 'portsc'. This improves readability and clarifies
what is being modified.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
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
2.50.1


