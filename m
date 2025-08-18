Return-Path: <linux-usb+bounces-26982-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD25B2A294
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 14:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 121604E2E90
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 12:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCC031CA5E;
	Mon, 18 Aug 2025 12:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J56PtNTa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04C23218B8
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 12:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521909; cv=none; b=cH3UQoy9m/ldslpYUByMt90XBVTjdNX3JbIMKCdU8I0/IwRB3hjczL5eyiCPtgqnVBlB44apg0i8FXYB6NiSe7QCjVkEWIohRbU5CLdbswSX3DMZ3qa+Tym3wPA5pezWgPgHjqCbsB9M/aPPWJN73ThDbwKLTNI04+McokgNgqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521909; c=relaxed/simple;
	bh=F6zoKmZKwAu2p2fLg6sF04gT4Qes+gLuFjjiWywaRKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b1KP2vEGR6VNsY75fOiV1O5zKDJWffLKmapMUG0hqZM8Cu4T/OG5QjIwqOWDzg9MCgis9SnAa6g/DYxAnQqlaH7755CdqUiUJaZEAXsn76UMUrNqFJt4d2Cwqf5kSfoVT7ESeoqbeHvIjcOyrVPHuWmQ3ZBljl2DqWCkENdqHgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J56PtNTa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755521908; x=1787057908;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F6zoKmZKwAu2p2fLg6sF04gT4Qes+gLuFjjiWywaRKI=;
  b=J56PtNTawo+L+7soD+W1Xmja097d8kIkDNrpWcMog9mreQ6y3YWs6kGW
   KRWv5vatgiPfRTgHV7lhMbEcWXHQmWpacj39FoXpLEQOF50xg7kZt+KqE
   gm7a2e5tsad+5pN2F5auy3OTBy29hsgVy0W6ICEqYbcctxzCR597fjbY6
   CRSgDVhH+PyvaJrh562Vk7dlFob9EsJI5YInOiaZ5Sp7vv+pCIS2WO5ci
   cbbycF87PsFr8LqhcY3Hvia9ZamJKlKtDSWyCpNyKa5kMFVmHwxs5yfKK
   iJAB7FtHyXBB+9TCY4n10Y5LpXhg3x2vaDm40f3AunzlGoW5L5ZA8nzc3
   Q==;
X-CSE-ConnectionGUID: Z4uKy869SOqLcGyfDzV1MA==
X-CSE-MsgGUID: T/RwB/WpRo29w658GOne5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="68452785"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68452785"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 05:58:26 -0700
X-CSE-ConnectionGUID: uE9m+0iTT0u9tiu5fHr1hw==
X-CSE-MsgGUID: 6sJJyHRtTFuzis47K4UNCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167071048"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2025 05:58:24 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 96A6795; Mon, 18 Aug 2025 14:58:23 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: michal.pecio@gmail.com,
	linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 4/4] usb: xhci: handle Set TR Deq Context State Error due to Endpoint state
Date: Mon, 18 Aug 2025 14:57:42 +0200
Message-ID: <20250818125742.3572487-5-niklas.neronin@linux.intel.com>
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

A Set TR Deq Context State Error occurs when the Slot state is Enabled or
the Endpoint state is Disabled, Running, or Halted. The Slot state is
already handled, leaving the Endpoint state to be addressed.

These are all possible Endpoint state:

 - Disabled: The Endpoint is not operational and cannot process any TDs.
   Release all canceled TDs in the same way as when the Slot state is
   Disabled or Enabled.

 - Running: Reason unknown, print a detailed warning.

 - Halted: Reason unknown, print a detailed warning.

 - Stopped: The state is correct? Something has fixed itself, so it should
   be safe to reissue a new Set TR Deq command. All TDs associated with the
   failed Set TR Deq command are marked as 'TD_DIRTY'. This marking ensures
   that they will be eligible for subsequent Set TR Deq command.

 - Error: The state is correct, similar to the Stopped state, reissue a
   new Set TR Deq command.

xHCI specification, rev 1.2:
 Slot State		section 4.5.3
 Endpoint State		section 4.8.3
 Set TR Dequeue Pointer	section 4.6.10

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index f4e4bd8db210..2c0238c37418 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1472,11 +1472,29 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 				goto td_cleanup;
 			}
 
-			xhci_warn(xhci, "WARN Set TR Deq Ptr cmd failed due to incorrect ep state.\n");
 			ep_state = GET_EP_CTX_STATE(ep_ctx);
-			xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
-					"Slot state = %u, EP state = %u",
-					slot_state, ep_state);
+			switch (ep_state) {
+			case EP_STATE_DISABLED:
+				xhci_warn(xhci, "Set TR Deq error slot %d ep %u is Disabled\n",
+					  slot_id, ep_index);
+				goto td_cleanup;
+			case EP_STATE_RUNNING:
+				xhci_warn(xhci, "Set TR Deq error ep Running slot %d ep %u ep flag 0x%x\n",
+					  slot_id, ep_index, ep->ep_state);
+				break;
+			case EP_STATE_HALTED:
+				xhci_warn(xhci, "Set TR Deq error ep Halted slot %d ep %u ep flag 0x%x\n",
+					  slot_id, ep_index, ep->ep_state);
+				break;
+			case EP_STATE_STOPPED:
+			case EP_STATE_ERROR:
+				xhci_warn(xhci, "Set TR Deq error with correct states, reissuing the command\n");
+				list_for_each_entry(td, &ep->cancelled_td_list, cancelled_td_list) {
+					if (td->cancel_status == TD_CLEARING_CACHE)
+						td->cancel_status = TD_DIRTY;
+				}
+				goto cleanup;
+			}
 			break;
 		default:
 			xhci_warn(xhci, "WARN Set TR Deq Ptr cmd with unknown completion code of %u.\n",
-- 
2.50.1


