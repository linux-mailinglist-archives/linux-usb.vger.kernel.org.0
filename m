Return-Path: <linux-usb+bounces-11674-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EEB91814A
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 14:47:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFF55285E9E
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 12:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B217B1850A4;
	Wed, 26 Jun 2024 12:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mAjfPhMo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9E9181D0E
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 12:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719406006; cv=none; b=F/0MM2y34hCcY6KI4druYUbv95a2NrDzEJfJL2eRcmOdN8Pg/4D8De0yCQ90nWj7J7Ed5pk+/KR9lK/HI/mQWPb2ljJba9dyNt0MKj/FZR3n/8GF4kAn7rPy50GrKKLUT1EjAvN/UI19pOcsLl0tTkCBYI/a4JfsYSFhtEpRzKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719406006; c=relaxed/simple;
	bh=u39ZLQFVHadxLT8eot8yRJbsUgjzR6QW3AwD4UZL8RE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ja6vWwNJE0skKxMjLmbHjNqTnHGhspuP9KTO8gUKo9/gxvq6CJlPcClItsMnA6W/XZtOL5a0dgS0zZOWLUEo3mdV+k8kl3xiFEsX9HAOTkG5twIc09I3Nxc2YPIZYjo3lXUZuAkydPgAi69xbrkJhNsbWe561NnHzZh62cutLh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mAjfPhMo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719406005; x=1750942005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u39ZLQFVHadxLT8eot8yRJbsUgjzR6QW3AwD4UZL8RE=;
  b=mAjfPhMoqXrfm4MnPepIzejkw1ihuORqOpTICf8ltawML8xUDbkYaeXt
   tEVjpU0U+QllFETqRli0W37gbzWY1gr1LxuZSyK8byPJ14aQAcOPkY9Qp
   P4kC8x0t3Qlum/5u+AmYrQ4cK1rQubzTeKV5sX5dcP0TOSNJ7B0bwnlxk
   cvdHu2TCH9xAJw81mvjGGUA4+RPvgt4HVcVxq3DX0FATfxYwqa0Y8du+r
   TMOYOQYUCxMsPvtMAO0bIXS2Fdk8+bElvpbg9+ZbFu1g9Ql2TTMbZ8t3k
   c9XESAQ5ea9cnCjhDJ3/AFs4DOtdjUaR6mACKz5c1SZGkakUTuEH4scK+
   w==;
X-CSE-ConnectionGUID: MvWBPavqSpebl8JxquoAbA==
X-CSE-MsgGUID: EoM1KkZoT7WclV0OT9Szrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16353363"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16353363"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 05:46:44 -0700
X-CSE-ConnectionGUID: BSKhjCujQqS6lU/myTgofw==
X-CSE-MsgGUID: ArLqbhkcT/m+DK3qe/fmiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="48442560"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 05:46:42 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	niklas.neronin@linux.intel.com,
	Hector Martin <marcan@marcan.st>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 01/21] xhci: Remove dead code in xhci_move_dequeue_past_td()
Date: Wed, 26 Jun 2024 15:48:15 +0300
Message-Id: <20240626124835.1023046-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626124835.1023046-1-mathias.nyman@linux.intel.com>
References: <20240626124835.1023046-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hector Martin <marcan@marcan.st>

This codepath is trivially dead, since the function is never called with
a non-NULL td (the only callsite is immediately preceded by a NULL guard).

[remove unused label 'deq_found' -Mathias]
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index fd0cde3d1569..ffb3ebb72eaa 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -654,25 +654,6 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 			  stream_id);
 		return -ENODEV;
 	}
-	/*
-	 * A cancelled TD can complete with a stall if HW cached the trb.
-	 * In this case driver can't find td, but if the ring is empty we
-	 * can move the dequeue pointer to the current enqueue position.
-	 * We shouldn't hit this anymore as cached cancelled TRBs are given back
-	 * after clearing the cache, but be on the safe side and keep it anyway
-	 */
-	if (!td) {
-		if (list_empty(&ep_ring->td_list)) {
-			new_seg = ep_ring->enq_seg;
-			new_deq = ep_ring->enqueue;
-			new_cycle = ep_ring->cycle_state;
-			xhci_dbg(xhci, "ep ring empty, Set new dequeue = enqueue");
-			goto deq_found;
-		} else {
-			xhci_warn(xhci, "Can't find new dequeue state, missing td\n");
-			return -EINVAL;
-		}
-	}
 
 	hw_dequeue = xhci_get_hw_deq(xhci, dev, ep_index, stream_id);
 	new_seg = ep_ring->deq_seg;
@@ -709,8 +690,6 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 
 	} while (!cycle_found || !td_last_trb_found);
 
-deq_found:
-
 	/* Don't update the ring cycle state for the producer (us). */
 	addr = xhci_trb_virt_to_dma(new_seg, new_deq);
 	if (addr == 0) {
-- 
2.25.1


