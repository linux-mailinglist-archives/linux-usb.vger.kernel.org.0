Return-Path: <linux-usb+bounces-35880-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLoUHnpuzmkCnwYAu9opvQ
	(envelope-from <linux-usb+bounces-35880-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:26:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D70E3389AF2
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7FE13156D36
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782FE2FE58C;
	Thu,  2 Apr 2026 13:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XPnOmt+7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4352FAC14
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135858; cv=none; b=Mfc6VR9+bURe8xdCqNLcMhtZj91y07tre3K0Cm7fErfILVcRa7SFvxLYMz3K7XMtSx1O5vmgMCM06lb/+S+rFIH4vd6srBvIy+C3AojuN2K6WwtsckxyLBWt+zbpLfecx91Q+rJwUewSBcDbkYjQCNd3OIwsIZKxgZDgCU7LdSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135858; c=relaxed/simple;
	bh=7hedFLJW8jNPftWEcgtbj6fqFS4KtZxunW0cIwn1C7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gA0rrLohgqA+gDlTGnIbcV5zgXp1pcNxa82Jkl0McukU4+WmV/sk8YhJdU8JSSlJG+pQLycB34w0DIPm76gnnSv8T+AvBEMj4bZPvjrQtr28nrlNpyA+Zw2bzLoV9AAOY3xf7pAxOALEjhe1oShUdrCSd5ZAJN5sKxcCndaeFB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XPnOmt+7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135857; x=1806671857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7hedFLJW8jNPftWEcgtbj6fqFS4KtZxunW0cIwn1C7k=;
  b=XPnOmt+7KxkKc2eeswvABrKWBy3NucAHDjozbZ5o0UOj9o0WQM9p9+PM
   yw9bDSJwreNIm+wxDDdIIp7fMdRZ3+8Fm6eHUu2vlzg9vi+JcCcubL9xs
   Vd1AL8CxqXFW9jP+5O6hWCCtAlYuv1i6MeMEPswp3JVAaKvdwl+24wK8A
   0w+nzUQ0CiD0RlrrqLSqiVzr4Z7j2NKPIYgFBmMJ9+7gXr5OJOQgCWpkO
   VSJdj1XnuWfsHYKPpIArv6PuqVavWe6sSjh3awR7U+zAKSZkV2ScyhSTk
   oEgxkWF9xTNU/kE+RBrvuNkrTTSlCDPBlpFPpA7FjkUZ7UFjleS+9F0t2
   A==;
X-CSE-ConnectionGUID: odlsesu8TLW1ClP00fJjRw==
X-CSE-MsgGUID: /kVzeDaxQJSN02q23BW77w==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87650880"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87650880"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:37 -0700
X-CSE-ConnectionGUID: XUXC5yVMS+qVds5jA4ap7g==
X-CSE-MsgGUID: OPMjVoffQr20F5BGvuq9vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227241560"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.50])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:36 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 15/25] usb: xhci: clean up handling of upper bits in SetPortFeature wIndex
Date: Thu,  2 Apr 2026 16:13:32 +0300
Message-ID: <20260402131342.2628648-16-mathias.nyman@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35880-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: D70E3389AF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Neronin <niklas.neronin@linux.intel.com>

In Set Port Feature requests, the upper byte of 'wIndex' encodes
feature-specific parameters. The current code reads these upper bits in
an early pre-processing block, and then the same feature is handled again
later in the main switch statement. This results in duplicated condition
checks and makes the control flow harder to follow.

Move all feature-specific extraction of 'wIndex' upper bits into the
main SetPortFeature logic so that each feature is handled in exactly one
place. This reduces duplication, makes the handling clearer, and keeps
'wIndex' parsing local to the code that actually uses the values.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index de843ecc7d63..daa04ac811fc 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1205,10 +1205,10 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 	u32 temp, status;
 	int retval = 0;
 	struct xhci_bus_state *bus_state;
-	u16 link_state = 0;
-	u16 wake_mask = 0;
-	u16 timeout = 0;
-	u16 test_mode = 0;
+	u16 link_state;
+	u16 wake_mask;
+	u8 timeout;
+	u8 test_mode;
 	struct xhci_hub *rhub;
 	struct xhci_port **ports;
 	struct xhci_port *port;
@@ -1286,15 +1286,6 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		}
 		break;
 	case SetPortFeature:
-		if (wValue == USB_PORT_FEAT_LINK_STATE)
-			link_state = (wIndex & 0xff00) >> 3;
-		if (wValue == USB_PORT_FEAT_REMOTE_WAKE_MASK)
-			wake_mask = wIndex & 0xff00;
-		if (wValue == USB_PORT_FEAT_TEST)
-			test_mode = (wIndex & 0xff00) >> 8;
-		/* The MSB of wIndex is the U1/U2 timeout */
-		timeout = (wIndex & 0xff00) >> 8;
-
 		portnum = (wIndex & 0xff) - 1;
 		if (!in_range(portnum, 0, max_ports))
 			goto error;
@@ -1349,6 +1340,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			bus_state->suspended_ports |= 1 << portnum;
 			break;
 		case USB_PORT_FEAT_LINK_STATE:
+			link_state = (wIndex & 0xff00) >> 3;
 			temp = xhci_portsc_readl(port);
 			/* Disable port */
 			if (link_state == USB_SS_PORT_LS_SS_DISABLED) {
@@ -1498,6 +1490,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				 hcd->self.busnum, portnum + 1, temp);
 			break;
 		case USB_PORT_FEAT_REMOTE_WAKE_MASK:
+			wake_mask = wIndex & 0xff00;
 			xhci_set_remote_wake_mask(xhci, port, wake_mask);
 			temp = xhci_portsc_readl(port);
 			xhci_dbg(xhci, "set port remote wake mask, actual port %d-%d status  = 0x%x\n",
@@ -1511,6 +1504,8 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		case USB_PORT_FEAT_U1_TIMEOUT:
 			if (hcd->speed < HCD_USB3)
 				goto error;
+
+			timeout = (wIndex & 0xff00) >> 8;
 			temp = readl(&port->port_reg->portpmsc);
 			temp &= ~PORT_U1_TIMEOUT_MASK;
 			temp |= PORT_U1_TIMEOUT(timeout);
@@ -1519,6 +1514,8 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		case USB_PORT_FEAT_U2_TIMEOUT:
 			if (hcd->speed < HCD_USB3)
 				goto error;
+
+			timeout = (wIndex & 0xff00) >> 8;
 			temp = readl(&port->port_reg->portpmsc);
 			temp &= ~PORT_U2_TIMEOUT_MASK;
 			temp |= PORT_U2_TIMEOUT(timeout);
@@ -1528,6 +1525,8 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			/* 4.19.6 Port Test Modes (USB2 Test Mode) */
 			if (hcd->speed != HCD_USB2)
 				goto error;
+
+			test_mode = (wIndex & 0xff00) >> 8;
 			if (test_mode > USB_TEST_FORCE_ENABLE ||
 			    test_mode < USB_TEST_J)
 				goto error;
-- 
2.43.0


