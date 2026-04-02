Return-Path: <linux-usb+bounces-35878-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uD2XHaxvzmnxngYAu9opvQ
	(envelope-from <linux-usb+bounces-35878-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:31:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB4E389C3D
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCA5D301D313
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C14F2F2607;
	Thu,  2 Apr 2026 13:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HMb/G+5v"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565612E0901
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135854; cv=none; b=dMMUEoTsEhGP0b7eCd1K7Z2+TpWSznPpSAhZPx73JTcQgy5kVLW0n1e6L5v6zU69kWvgbG8N3lV/j6/YhIOvONLf0RU9G8wTbaLgvktibYwywvYzUDgpnD89LjiDxDz/QOEqu8fXsscU0RDYiM32smux4G/Bd4JDZEcAT/FuK4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135854; c=relaxed/simple;
	bh=AfvnVK7blBtJLIQDuKyCLodNFuz+l12HmskKk7fIDms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nrJvtJeyJTWi3s037pPj6BUwDKQr1GtacakfpXONecgNdix63z6JHlNEqHNM4YTfaNIVGAGGrOaBh4c8HwyO54xw4E9e7yiJblEWebG8Gs0JWOGh41ml4sPV5+kP3FRweJCLnnyWO5XAp7eJyRv5vEGrLlKwKscdpfsub3/9epc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HMb/G+5v; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135854; x=1806671854;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AfvnVK7blBtJLIQDuKyCLodNFuz+l12HmskKk7fIDms=;
  b=HMb/G+5vxfMWfWFzDh5ofm642IGkJtggSbmwANVLtASb8p3nZG5hggDH
   TDJk4hZZeZVvZHKvO/QHM4nC6T/UuXxtUYUv+DuQ9oaS3NkbmcicWSQeE
   rE25wwhjjCvL6F1XuG+TSnhH09VBAaf4j0kGcIjecx2iJ5cQqX6PaObRb
   PLbOEk88LyZvNWSpgdnqJhjJ2cSepJhW3a9f9FKGY6t6C5U5qcFfl7fmi
   kN7vIRYF0Nqv6j1wRQKUuI4MqH3ypOXKoBUPtkBL7lfT+PqIjhYcQeOzO
   Bx1jV3ucHSt5FXfMMNUiKdXgUoP/HrsAE9un3JkE+MvTG2QdFXUzTS26Z
   A==;
X-CSE-ConnectionGUID: MAdPxK9ITR6y0/qB7QzxGw==
X-CSE-MsgGUID: 1EufYJpST8u6crBzi9PbVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87650864"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87650864"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:33 -0700
X-CSE-ConnectionGUID: AtbqjahZTkKKBBYqACwCgQ==
X-CSE-MsgGUID: P6ArfRebTYizbDeoI32N8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227241542"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.50])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:32 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 13/25] usb: xhci: stop treating 'wIndex' as a mutable port number
Date: Thu,  2 Apr 2026 16:13:30 +0300
Message-ID: <20260402131342.2628648-14-mathias.nyman@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35878-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,linux.intel.com:mid]
X-Rspamd-Queue-Id: EBB4E389C3D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Neronin <niklas.neronin@linux.intel.com>

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
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
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
2.43.0


