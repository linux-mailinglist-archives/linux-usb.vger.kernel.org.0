Return-Path: <linux-usb+bounces-26981-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57555B2A2DA
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 15:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEC313BD5A1
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 12:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264C331A063;
	Mon, 18 Aug 2025 12:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HCYH70/5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCA3280035
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 12:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521907; cv=none; b=WPBBofSXTvx7fsQjkpUjYudLkDbmyY3toqW5Ks9F8HrED1+8M/5lsRSs18wLdXg3uZH2YupD9GPmbpOnXZYU2xl6hj/nmO3A5EvU2Vkk4bvuagIailL/AYp0suoDGgsDIajORnwvtju6WXE6206RTmdBwDcUWHaS+Jny8ymqD8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521907; c=relaxed/simple;
	bh=Q/5sqP8gCckaB0FO0hMqNFVqDvBQ/yJL23pOYRMRYeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pn1kPvci5+dB7RP4yNMjn0393fdSamts5MK3YX3YidZXGCbVipXYHKMxZ3KqmYqRE61Oxu2EzfrUjADjgAaZ0ENEPGpSf0jbzatGsNTUKJBJx1HKfHIsLyyZatKjfSRadZjSvFr4g87TuRS8et1JO58IuRBSnqoC61G9Qs14wiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HCYH70/5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755521906; x=1787057906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q/5sqP8gCckaB0FO0hMqNFVqDvBQ/yJL23pOYRMRYeE=;
  b=HCYH70/5+jjfPfrCRE1gRufjxkmp66VS/p1HzIQSsV++hBflkkW0Km6j
   YNqESs02WXRafGEULoS/BhupZCLqxeJIzT26Horp/CW41d9yK9GasRRft
   u1B4IKFQMm207VrlaJTM5ANVIi6hDBxk6/ikWAaOVxY66TMPSkOd8V23n
   IZmW9juUK0DigL0nhzU0CLDQrhMMYF+hOQmPK5eqc/yBZ6PA6cMuDgp9n
   LsT3PDnTHy33se+65LfdXND4lpCNnWFwlpLdDDbC0qYp2bPJWJvwtCnob
   3TxwdOt/qpPlg8zOJ+zN22x3dVtX902ZLTPSoJuga6MguwvYlgwWxv1C1
   A==;
X-CSE-ConnectionGUID: T3NvISKrSvClIceDQYBm1w==
X-CSE-MsgGUID: 2UIpPzuFSiqx6SE81xRF2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="68452780"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68452780"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 05:58:24 -0700
X-CSE-ConnectionGUID: ZK0Rra/lQHOhYvhVLcKOHA==
X-CSE-MsgGUID: JFIMNLSRQJaVJpsZCn2ryw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167071043"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2025 05:58:23 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 9707C97; Mon, 18 Aug 2025 14:58:22 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: michal.pecio@gmail.com,
	linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 3/4] usb: xhci: handle Set TR Deq Context State Error due to Slot state
Date: Mon, 18 Aug 2025 14:57:41 +0200
Message-ID: <20250818125742.3572487-4-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818125742.3572487-1-niklas.neronin@linux.intel.com>
References: <20250818125742.3572487-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One of the reasons for a Set TR Deq Context State Error, is that the Slot
state is not Default, Configured, or Addressed. This leaves it 2 options;
Enabled and Disabled. If the slot state was Disabled, HW would have
returned a Slot Not Enabled Error, which only leaves Enabled Slot state.

Devices with a slot state of Enabled must have previously been in a
Disabled slot state. Both Enabled and Disabled slot states have the
Doorbell register disabled, meaning they do not receive or handle TDs.
Consequently, all cancelled TDs are released.

xHCI specification, rev 1.2:
 Slot State		section 4.5.3
 Set TR Dequeue Pointer	section 4.6.10

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 79c15dbae43b..f4e4bd8db210 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1465,10 +1465,15 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 			xhci_warn(xhci, "Set TR Deq error slot %d is Disabled\n", slot_id);
 			goto td_cleanup;
 		case COMP_CONTEXT_STATE_ERROR:
-			xhci_warn(xhci, "WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.\n");
-			ep_state = GET_EP_CTX_STATE(ep_ctx);
 			slot_state = le32_to_cpu(slot_ctx->dev_state);
 			slot_state = GET_SLOT_STATE(slot_state);
+			if (slot_state == SLOT_STATE_ENABLED) {
+				xhci_warn(xhci, "Set TR Deq error slot %d is Enabled\n", slot_id);
+				goto td_cleanup;
+			}
+
+			xhci_warn(xhci, "WARN Set TR Deq Ptr cmd failed due to incorrect ep state.\n");
+			ep_state = GET_EP_CTX_STATE(ep_ctx);
 			xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
 					"Slot state = %u, EP state = %u",
 					slot_state, ep_state);
-- 
2.50.1


