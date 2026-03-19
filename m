Return-Path: <linux-usb+bounces-35147-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNhfGg4BvGmurAIAu9opvQ
	(envelope-from <linux-usb+bounces-35147-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 14:58:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC76F2CC4A8
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 14:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 454F831E9B05
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 13:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF93C36A02F;
	Thu, 19 Mar 2026 13:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KIewohes"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71602D0C97
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 13:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773928627; cv=none; b=kHzxirsCSRyTTD3VZ/e90HVT2U0RyzFq0PJ2O8XYpz4WSn4WvaCXoZB425Afb1piJpHSLk8+Rsfb1IClWCe5WynKvMxuv04uqHANjDvmhLzKmjUb4LM/WUhAD8KoIYgsTvGKgurWzlHuPPdNHPtkeDtcGCAu2nOfUSW6T2wEzTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773928627; c=relaxed/simple;
	bh=1XYlywQy14AEOhMdXjlds16NUK3hDIDZ/XMnBusn5+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BOXNEY70lL3nK2qC/pnLb8a0SS8ipgHg/nj4o2zVhwbsvgMzGO/AjO2H+B/lIIsiRrPeEcNdntTuJf/I9T5QPst0pujfTRGiVJV6mAobuRhbdgL4GSoOxOLv7Dn0nG8OpIB5lmVLsQ3JyLCGuzwW7rb6XW7ueEy8KvHMIFNX7iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KIewohes; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773928626; x=1805464626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1XYlywQy14AEOhMdXjlds16NUK3hDIDZ/XMnBusn5+8=;
  b=KIewohestLalNWrI4fbyVgSaRffd/5q0nmkQX4iBa0hlBCDO6xpAxQNB
   bq/1i+dmVa44oxaUk2Ef0gkM6zgYdcTBR+44/YCF9c/Zn2uH2WHZ5cltp
   b2UDUoYtI66irrfljHyM0tyIQE5lhQYOcV13UFquOZvtrqmeDoCh6owhs
   zcBQC2CUw5pLfivySgmcFxvvUuCWmCx9QA/TO3GDj1ZuKXR8pFTnP8m8v
   IyrLLe8XIZQvZ+xziHSfXn9yNVFEBOO+MSc4T/6ilJAzaXn+oghBXgzv7
   OSQuBhntf6S8E2n3EBSpLCPwmkmGU5JCRKmVEDxLwBtEKG6g6Yf3k9IJX
   A==;
X-CSE-ConnectionGUID: 8vXFPcUjSm6UqVBMbDzPzg==
X-CSE-MsgGUID: WpKlCMkLRTu05zto6j0RGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78904200"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="78904200"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 06:57:05 -0700
X-CSE-ConnectionGUID: 9KCeDvKGRiCtjV6kQUFLpw==
X-CSE-MsgGUID: DlMNBJjNQkeRujLaXpSsrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="260866309"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 19 Mar 2026 06:57:04 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 1CF8D98; Thu, 19 Mar 2026 14:57:03 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 1/9] usb: xhci: stop treating 'wIndex' as a mutable port number
Date: Thu, 19 Mar 2026 14:56:16 +0100
Message-ID: <20260319135626.3077643-2-niklas.neronin@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35147-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: BC76F2CC4A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The USB request parameter 'wIndex' is a 16-bit field whose meaning depends
on the request type. For hub port operations, only bits 7:0 encode the port
number (1..MaxPorts). Despite this, the current code extracts the port
number into 'portnum1' while also modifying and using 'wIndex' directly as
a 0-based port index. This dual use is both confusing and error-prone,
since 'wIndex' is not always a pure port number.

Clean this up by deriving a single 0-based 'portnum' from 'wIndex' and
using it throughout the function. The original 'wIndex' value is no longer
modified or treated as a port number. This also matches existing xhci code.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 65 +++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 04cc3d681495..4730beae2478 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1218,13 +1218,12 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 	struct xhci_hub *rhub;
 	struct xhci_port **ports;
 	struct xhci_port *port;
-	int portnum1;
+	int portnum;
 
 	rhub = xhci_get_rhub(hcd);
 	ports = rhub->ports;
 	max_ports = rhub->num_ports;
 	bus_state = &rhub->bus_state;
-	portnum1 = wIndex & 0xff;
 
 	spin_lock_irqsave(&xhci->lock, flags);
 	switch (typeReq) {
@@ -1258,11 +1257,11 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		spin_unlock_irqrestore(&xhci->lock, flags);
 		return retval;
 	case GetPortStatus:
-		if (!portnum1 || portnum1 > max_ports)
+		portnum = (wIndex & 0xff) - 1;
+		if (!in_range(portnum, 0, max_ports))
 			goto error;
 
-		wIndex--;
-		port = ports[portnum1 - 1];
+		port = ports[portnum];
 		temp = xhci_portsc_readl(port);
 		if (temp == ~(u32)0) {
 			xhci_hc_died(xhci);
@@ -1270,13 +1269,12 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			break;
 		}
 		trace_xhci_get_port_status(port, temp);
-		status = xhci_get_port_status(hcd, bus_state, wIndex, temp,
-					      &flags);
+		status = xhci_get_port_status(hcd, bus_state, portnum, temp, &flags);
 		if (status == 0xffffffff)
 			goto error;
 
 		xhci_dbg(xhci, "Get port status %d-%d read: 0x%x, return 0x%x",
-			 hcd->self.busnum, portnum1, temp, status);
+			 hcd->self.busnum, portnum + 1, temp, status);
 
 		put_unaligned(cpu_to_le32(status), (__le32 *) buf);
 		/* if USB 3.1 extended port status return additional 4 bytes */
@@ -1303,12 +1301,11 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		/* The MSB of wIndex is the U1/U2 timeout */
 		timeout = (wIndex & 0xff00) >> 8;
 
-		wIndex &= 0xff;
-		if (!portnum1 || portnum1 > max_ports)
+		portnum = (wIndex & 0xff) - 1;
+		if (!in_range(portnum, 0, max_ports))
 			goto error;
 
-		port = ports[portnum1 - 1];
-		wIndex--;
+		port = ports[portnum];
 		temp = xhci_portsc_readl(port);
 		if (temp == ~(u32)0) {
 			xhci_hc_died(xhci);
@@ -1335,7 +1332,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			if ((temp & PORT_PE) == 0 || (temp & PORT_RESET)
 				|| (temp & PORT_PLS_MASK) >= XDEV_U3) {
 				xhci_warn(xhci, "USB core suspending port %d-%d not in U0/U1/U2\n",
-					  hcd->self.busnum, portnum1);
+					  hcd->self.busnum, portnum + 1);
 				goto error;
 			}
 
@@ -1355,14 +1352,14 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			spin_lock_irqsave(&xhci->lock, flags);
 
 			temp = xhci_portsc_readl(port);
-			bus_state->suspended_ports |= 1 << wIndex;
+			bus_state->suspended_ports |= 1 << portnum;
 			break;
 		case USB_PORT_FEAT_LINK_STATE:
 			temp = xhci_portsc_readl(port);
 			/* Disable port */
 			if (link_state == USB_SS_PORT_LS_SS_DISABLED) {
 				xhci_dbg(xhci, "Disable port %d-%d\n",
-					 hcd->self.busnum, portnum1);
+					 hcd->self.busnum, portnum + 1);
 				temp = xhci_port_state_to_neutral(temp);
 				/*
 				 * Clear all change bits, so that we get a new
@@ -1379,7 +1376,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			/* Put link in RxDetect (enable port) */
 			if (link_state == USB_SS_PORT_LS_RX_DETECT) {
 				xhci_dbg(xhci, "Enable port %d-%d\n",
-					 hcd->self.busnum, portnum1);
+					 hcd->self.busnum, portnum + 1);
 				xhci_set_link_state(xhci, port,	link_state);
 				temp = xhci_portsc_readl(port);
 				break;
@@ -1411,7 +1408,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				}
 
 				xhci_dbg(xhci, "Enable compliance mode transition for port %d-%d\n",
-					 hcd->self.busnum, portnum1);
+					 hcd->self.busnum, portnum + 1);
 				xhci_set_link_state(xhci, port, link_state);
 
 				temp = xhci_portsc_readl(port);
@@ -1425,7 +1422,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			/* Can't set port link state above '3' (U3) */
 			if (link_state > USB_SS_PORT_LS_U3) {
 				xhci_warn(xhci, "Cannot set port %d-%d link state %d\n",
-					  hcd->self.busnum, portnum1, link_state);
+					  hcd->self.busnum, portnum + 1, link_state);
 				goto error;
 			}
 
@@ -1460,7 +1457,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				if (!wait_for_completion_timeout(&port->u3exit_done,
 								 msecs_to_jiffies(500)))
 					xhci_dbg(xhci, "missing U0 port change event for port %d-%d\n",
-						 hcd->self.busnum, portnum1);
+						 hcd->self.busnum, portnum + 1);
 				spin_lock_irqsave(&xhci->lock, flags);
 				temp = xhci_portsc_readl(port);
 				break;
@@ -1486,7 +1483,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				}
 				spin_lock_irqsave(&xhci->lock, flags);
 				temp = xhci_portsc_readl(port);
-				bus_state->suspended_ports |= 1 << wIndex;
+				bus_state->suspended_ports |= 1 << portnum;
 			}
 			break;
 		case USB_PORT_FEAT_POWER:
@@ -1504,13 +1501,13 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 
 			temp = xhci_portsc_readl(port);
 			xhci_dbg(xhci, "set port reset, actual port %d-%d status  = 0x%x\n",
-				 hcd->self.busnum, portnum1, temp);
+				 hcd->self.busnum, portnum + 1, temp);
 			break;
 		case USB_PORT_FEAT_REMOTE_WAKE_MASK:
 			xhci_set_remote_wake_mask(xhci, port, wake_mask);
 			temp = xhci_portsc_readl(port);
 			xhci_dbg(xhci, "set port remote wake mask, actual port %d-%d status  = 0x%x\n",
-				 hcd->self.busnum, portnum1, temp);
+				 hcd->self.busnum, portnum + 1, temp);
 			break;
 		case USB_PORT_FEAT_BH_PORT_RESET:
 			temp |= PORT_WR;
@@ -1540,8 +1537,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			if (test_mode > USB_TEST_FORCE_ENABLE ||
 			    test_mode < USB_TEST_J)
 				goto error;
-			retval = xhci_enter_test_mode(xhci, test_mode, wIndex,
-						      &flags);
+			retval = xhci_enter_test_mode(xhci, test_mode, portnum, &flags);
 			break;
 		default:
 			goto error;
@@ -1550,12 +1546,11 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		temp = xhci_portsc_readl(port);
 		break;
 	case ClearPortFeature:
-		if (!portnum1 || portnum1 > max_ports)
+		portnum = (wIndex & 0xff) - 1;
+		if (!in_range(portnum, 0, max_ports))
 			goto error;
 
-		port = ports[portnum1 - 1];
-
-		wIndex--;
+		port = ports[portnum];
 		temp = xhci_portsc_readl(port);
 		if (temp == ~(u32)0) {
 			xhci_hc_died(xhci);
@@ -1575,17 +1570,17 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				if ((temp & PORT_PE) == 0)
 					goto error;
 
-				set_bit(wIndex, &bus_state->resuming_ports);
-				usb_hcd_start_port_resume(&hcd->self, wIndex);
+				set_bit(portnum, &bus_state->resuming_ports);
+				usb_hcd_start_port_resume(&hcd->self, portnum);
 				xhci_set_link_state(xhci, port, XDEV_RESUME);
 				spin_unlock_irqrestore(&xhci->lock, flags);
 				msleep(USB_RESUME_TIMEOUT);
 				spin_lock_irqsave(&xhci->lock, flags);
 				xhci_set_link_state(xhci, port, XDEV_U0);
-				clear_bit(wIndex, &bus_state->resuming_ports);
-				usb_hcd_end_port_resume(&hcd->self, wIndex);
+				clear_bit(portnum, &bus_state->resuming_ports);
+				usb_hcd_end_port_resume(&hcd->self, portnum);
 			}
-			bus_state->port_c_suspend |= 1 << wIndex;
+			bus_state->port_c_suspend |= 1 << portnum;
 
 			if (!port->slot_id) {
 				xhci_dbg(xhci, "slot_id is zero\n");
@@ -1594,7 +1589,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			xhci_ring_device(xhci, port->slot_id);
 			break;
 		case USB_PORT_FEAT_C_SUSPEND:
-			bus_state->port_c_suspend &= ~(1 << wIndex);
+			bus_state->port_c_suspend &= ~(1 << portnum);
 			fallthrough;
 		case USB_PORT_FEAT_C_RESET:
 		case USB_PORT_FEAT_C_BH_PORT_RESET:
@@ -1603,7 +1598,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		case USB_PORT_FEAT_C_ENABLE:
 		case USB_PORT_FEAT_C_PORT_LINK_STATE:
 		case USB_PORT_FEAT_C_PORT_CONFIG_ERROR:
-			xhci_clear_port_change_bit(xhci, wValue, wIndex, port, temp);
+			xhci_clear_port_change_bit(xhci, wValue, portnum, port, temp);
 			break;
 		case USB_PORT_FEAT_ENABLE:
 			xhci_disable_port(xhci, port);
-- 
2.50.1


