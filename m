Return-Path: <linux-usb+bounces-35888-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEmRJ91uzmnxngYAu9opvQ
	(envelope-from <linux-usb+bounces-35888-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:27:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BFB389B72
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0953D3159366
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6620A2E719C;
	Thu,  2 Apr 2026 13:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jAdZJd5l"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12E8313527
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135872; cv=none; b=CHr4FcFlAuTuW8Mt6rwWH1H6Y3RU6mlXeGVDHYkdikVQGRHNAxD0AE58UiAfY28Mwr75111nJb4XriK7ie4sfGETj7kTKDHHZttIF5gjxSxbsITHdBTLVAlxd4Ia6udagWQIXHftTpV2wtSPYM0AtuGxUD5coOxpSGkVKbJiW84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135872; c=relaxed/simple;
	bh=cXqUfysGN/zZ5BwVyIHsGGvJvOI/R2vYmQimM+/9nKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xy7LUnQcr74/zk2xaqSSdUueKsph4k/DvrADcmcICeYgdGQkEkFVQS7Mf+2c3o8DKiUJUVKbaoZBwyVvWZDE5f/uGXaJClus5OULO+U0WaUPgDU7aNqophNwNZ2BfLVROSGwGvFF1Sk2Tq/s0TXH+dxuL1S4O2iYy4BnClqLOzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jAdZJd5l; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135871; x=1806671871;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cXqUfysGN/zZ5BwVyIHsGGvJvOI/R2vYmQimM+/9nKo=;
  b=jAdZJd5lrhv1fDR4SYgDV8H+yn2Ilbsy3W2mnUBCD2IauEvU1w0V7dq9
   0sI1rUL8ptWvBPhikVnW/OsShHwa2HRCW+0gK9Xt3FD076QshOZnve8vx
   16yasabVyhJXVPALjX/gD9TSnRgW+bZ0maw6QAcP+TsrmNzxrUd/LRRzn
   wUa+7ekf6kpvTQIAD/ZCehwpFwrBPW/DvwObqf6OH31ssIrKN4Vc1k0Vw
   HSDD3P30PRvbmXv7u5o9QYxjeXp/jSwMQsetNsREImuQpVAexPbUv1kdj
   mo8uwRtVtP9yrnzU1ZUzu6DW8bxafjx4WfsPqBY5noxxWXwxfjvmyqY7E
   g==;
X-CSE-ConnectionGUID: 4HC6NMk4SpqWQeBWD8jWuA==
X-CSE-MsgGUID: G4Wy0pVdRLK8Uy2czUorLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87650935"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87650935"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:51 -0700
X-CSE-ConnectionGUID: eAResiBvRui4V5BpryWkDA==
X-CSE-MsgGUID: lzcy99tsQX2CKy9mF1FMDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227241593"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.50])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:50 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 23/25] usb: xhci: move roothub port limit validation
Date: Thu,  2 Apr 2026 16:13:40 +0300
Message-ID: <20260402131342.2628648-24-mathias.nyman@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35888-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 10BFB389B72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Function xhci_setup_port_arrays() limits the number of roothub ports
for both USB 2 and 3, this causes code repetition.

Solve this by moving roothub port limits validation to
xhci_create_rhub_port_array().

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 45 +++++++++++++++----------------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 4156822eb000..a9fd26559e50 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2165,15 +2165,28 @@ static void xhci_add_in_port(struct xhci_hcd *xhci, unsigned int num_ports,
 	/* FIXME: Should we disable ports not in the Extended Capabilities? */
 }
 
-static void xhci_create_rhub_port_array(struct xhci_hcd *xhci,
-					struct xhci_hub *rhub, gfp_t flags)
+static void xhci_create_rhub_port_array(struct xhci_hcd *xhci, struct xhci_hub *rhub,
+					unsigned int max_ports, gfp_t flags)
 {
 	int port_index = 0;
 	int i;
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
 
-	if (!rhub->num_ports)
+	if (!rhub->num_ports) {
+		xhci_info(xhci, "USB%u root hub has no ports\n", rhub->maj_rev);
 		return;
+	}
+
+	/*
+	 * Place limits on the number of roothub ports so that the hub
+	 * descriptors aren't longer than the USB core will allocate.
+	 */
+	if (rhub->num_ports > max_ports) {
+		xhci->usb3_rhub.num_ports = max_ports;
+		xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Limiting USB%u root hub ports to %u",
+			       rhub->maj_rev, max_ports);
+	}
+
 	rhub->ports = kcalloc_node(rhub->num_ports, sizeof(*rhub->ports),
 			flags, dev_to_node(dev));
 	if (!rhub->ports)
@@ -2269,30 +2282,8 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 		       "Found %u USB 2.0 ports and %u USB 3.0 ports.",
 		       xhci->usb2_rhub.num_ports, xhci->usb3_rhub.num_ports);
 
-	/* Place limits on the number of roothub ports so that the hub
-	 * descriptors aren't longer than the USB core will allocate.
-	 */
-	if (xhci->usb3_rhub.num_ports > USB_SS_MAXPORTS) {
-		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-				"Limiting USB 3.0 roothub ports to %u.",
-				USB_SS_MAXPORTS);
-		xhci->usb3_rhub.num_ports = USB_SS_MAXPORTS;
-	}
-	if (xhci->usb2_rhub.num_ports > USB_MAXCHILDREN) {
-		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-				"Limiting USB 2.0 roothub ports to %u.",
-				USB_MAXCHILDREN);
-		xhci->usb2_rhub.num_ports = USB_MAXCHILDREN;
-	}
-
-	if (!xhci->usb2_rhub.num_ports)
-		xhci_info(xhci, "USB2 root hub has no ports\n");
-
-	if (!xhci->usb3_rhub.num_ports)
-		xhci_info(xhci, "USB3 root hub has no ports\n");
-
-	xhci_create_rhub_port_array(xhci, &xhci->usb2_rhub, flags);
-	xhci_create_rhub_port_array(xhci, &xhci->usb3_rhub, flags);
+	xhci_create_rhub_port_array(xhci, &xhci->usb2_rhub, USB_MAXCHILDREN, flags);
+	xhci_create_rhub_port_array(xhci, &xhci->usb3_rhub, USB_SS_MAXPORTS, flags);
 
 	return 0;
 }
-- 
2.43.0


