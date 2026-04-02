Return-Path: <linux-usb+bounces-35886-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HufHGVvzmnxngYAu9opvQ
	(envelope-from <linux-usb+bounces-35886-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:30:13 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75463389BFA
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BD54316B3AD
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C929309F1D;
	Thu,  2 Apr 2026 13:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwLydMSJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDA73081DF
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135868; cv=none; b=dc6V3UXWxxuQcc3x6WaJ/Umxti9Jn4NStX3DQLYjvX68PJuGjMmAvgrFRbvxRA2pQZbZuAI0fctZOGrPL6q0C3FpEVB/6GhY/84QeCmYMeb0IU9a2lZnYI0y06aUVeISsbQR45C9bp2rXAD9xp28NTzxLHqiBpsFO19ArR9LJe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135868; c=relaxed/simple;
	bh=1hPDITlY6plfisap8V8yRn2EEgmFeomO3+suvpeQX24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rvq7JAaptTAJEXYCLaPp7dxMxERa9rew6z2H/wwzEgLBQREpVaoZ7V4mrcgHHB1Z35hgx8H5g6YvBTVRL64wyQU2V4BDv8S1DCyTBCZF2Pz5PI3DD5zqQiN5jkOWyFPuS7wSRTqJNF7kS+TKhrxBCbTXaqXDt8yPfdC/Z3H/VGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwLydMSJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135868; x=1806671868;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1hPDITlY6plfisap8V8yRn2EEgmFeomO3+suvpeQX24=;
  b=UwLydMSJfHuBSfqaWsTPgLl0+/Dp5cbTCDYo3r/eHMWiHu8eQsmd9bwp
   /e7LS8xBEhAiYFKD0JnO1MQvoVEIu/RBLAleX8gF+5d0O29BLM/nemGO7
   t9FMTCyLkC2kYQAzgWcINzZNpMpkoEBKSCToeLFKiTFCKVuFI+bsCuDze
   kS0/3CcXcTHf8KGuhcIWhzEfLkPCsBg9cn2DwQFbV9ZwsdqhduJ79hJxU
   T6Ot8yB1nYfK1VhWyB1hAdPpdcnjKkhRRBh+5cQxL7SkBkCESoUsPotq/
   Gqqzi2BPeaTIY8p7gH+UHX5NYxJ1toCnphhLcp6u+ElNMFkTYVHtpZzwm
   A==;
X-CSE-ConnectionGUID: 8C9ls303RlWjgNdKbtxL6Q==
X-CSE-MsgGUID: zER7HUMBSE+MZsAxQL7fdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87650921"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87650921"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:47 -0700
X-CSE-ConnectionGUID: 8QkuIZ/sTu+oWBcHrVKb4g==
X-CSE-MsgGUID: 8P3OZW1fSJO582VO+OnDBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227241588"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.50])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:46 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 21/25] usb: xhci: cleanup xhci_hub_report_usb3_link_state()
Date: Thu,  2 Apr 2026 16:13:38 +0300
Message-ID: <20260402131342.2628648-22-mathias.nyman@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35886-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,linux.intel.com:mid]
X-Rspamd-Queue-Id: 75463389BFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Improve readability of xhci_hub_report_usb3_link_state().

Comments are shortened and clarified, and the code now makes it explicit
when the Port Link State (PLS) value is modified versus when other status
bits are updated.

No functional changes.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 56 +++++++++++++------------------------
 1 file changed, 20 insertions(+), 36 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 8e134f6b4e37..bacd0ddd0d09 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -850,53 +850,37 @@ void xhci_test_and_clear_bit(struct xhci_hcd *xhci, struct xhci_port *port,
 }
 
 /* Updates Link Status for super Speed port */
-static void xhci_hub_report_usb3_link_state(struct xhci_hcd *xhci,
-		u32 *status, u32 portsc)
+static void xhci_hub_report_usb3_link_state(struct xhci_hcd *xhci, u32 *status, u32 portsc)
 {
 	u32 pls = portsc & PORT_PLS_MASK;
 
-	/* When the CAS bit is set then warm reset
-	 * should be performed on port
+	/*
+	 * CAS indicates that a warm reset is required, it may be set in any
+	 * link state and is only present on roothubs.
 	 */
 	if (portsc & PORT_CAS) {
-		/* The CAS bit can be set while the port is
-		 * in any link state.
-		 * Only roothubs have CAS bit, so we
-		 * pretend to be in compliance mode
-		 * unless we're already in compliance
-		 * or the inactive state.
+		/*
+		 * If not already in Compliance or Inactive state,
+		 * report Compliance Mode so the hub logic triggers a warm reset.
 		 */
-		if (pls != XDEV_COMP_MODE &&
-		    pls != XDEV_INACTIVE) {
+		if (pls != XDEV_COMP_MODE && pls != XDEV_INACTIVE)
 			pls = USB_SS_PORT_LS_COMP_MOD;
-		}
-		/* Return also connection bit -
-		 * hub state machine resets port
-		 * when this bit is set.
-		 */
-		pls |= USB_PORT_STAT_CONNECTION;
-	} else {
+
+		/* Signal a connection change to force a reset */
+		*status |= USB_PORT_STAT_CONNECTION;
+	} else if (pls == XDEV_RESUME) {
 		/*
-		 * Resume state is an xHCI internal state.  Do not report it to
-		 * usb core, instead, pretend to be U3, thus usb core knows
-		 * it's not ready for transfer.
+		 * Resume is an internal xHCI-only state and must not be exposed
+		 * to usbcore. Report it as U3 so transfers are blocked.
 		 */
-		if (pls == XDEV_RESUME) {
-			*status |= USB_SS_PORT_LS_U3;
-			return;
-		}
-
+		pls = USB_SS_PORT_LS_U3;
+	} else if (pls == XDEV_COMP_MODE) {
 		/*
-		 * If CAS bit isn't set but the Port is already at
-		 * Compliance Mode, fake a connection so the USB core
-		 * notices the Compliance state and resets the port.
-		 * This resolves an issue generated by the SN65LVPE502CP
-		 * in which sometimes the port enters compliance mode
-		 * caused by a delay on the host-device negotiation.
+		 * Some hardware may enter Compliance Mode without CAS.
+		 * Fake a connection event so usbcore notices and resets the port.
 		 */
-		if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
-				(pls == XDEV_COMP_MODE))
-			pls |= USB_PORT_STAT_CONNECTION;
+		if (xhci->quirks & XHCI_COMP_MODE_QUIRK)
+			*status |= USB_PORT_STAT_CONNECTION;
 	}
 
 	/* update status field */
-- 
2.43.0


