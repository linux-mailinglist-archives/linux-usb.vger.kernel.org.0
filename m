Return-Path: <linux-usb+bounces-17181-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5029BE3D8
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:13:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEF391C21D44
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138101DD53E;
	Wed,  6 Nov 2024 10:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LwH2CkfB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5E41DD0DB
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887976; cv=none; b=YqlMfsLoyMmkmJloTgfpsuyf78bZu4e/AU9ryFV9Tz9jx9xCrvZFgpHggcxXacACWBFCbOYHR8GWvwJlNgfs5YMiWg5/lLSOXaS4QZT+h7+qT4Ym95+w2gT3+Q0Fwce0FRue4uKyklL5QpRwjFfFHdPyakd8viSec+kd2QV6QHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887976; c=relaxed/simple;
	bh=JoQ1CBEaiqezRi7Pl4xsz42mS/3FJZnELzXTpLU1uDc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gm5rloRivEXzNlvLfHJ5f+Yj4TZRCebMXzWix6LcKaFx6iVF8c4+eiZtlDIjqw/SyllvYd3+7hD6EiaiOnSUgC96NJRGpCqMUAmShrkDhN9R6B+UgeIzZABHfD3PLgIL3DAJa0IlcuLV+7dgQ9kvGL2ZoXfH9Fxb3wJ4D07bnJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LwH2CkfB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730887975; x=1762423975;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JoQ1CBEaiqezRi7Pl4xsz42mS/3FJZnELzXTpLU1uDc=;
  b=LwH2CkfBptBLzlWFRCTcj69t0BBFjCBIJh33iX393TqFQVEczXKpwV2L
   Byb4WR7nDlG2NzrHZV4eQ3HaAXdQqoEupzxlBVO+mrQMxUUlSe/VAbJwS
   A9iMUtIa/9ZagOYAkrhoYY/GGL10yCFZC58R+d3QqNTGsQB2CwPp7S96z
   2TEdqh09Marde4uXRG2FWS/roN8pufeJobTmLxqG/I2IuiEFLALlt/J1f
   hPsN30tzNSZy43Xlet29vay49XYsGVeDb26ny9c7HiJBgLMAMfcsm623z
   prT2lRYDGmAfADRuFhRuRhjJ3kl9w6alqusOD+PbGRWyQDh67kiZFln7R
   w==;
X-CSE-ConnectionGUID: PykhPBP5QpCZAXQY8Ixcxg==
X-CSE-MsgGUID: 42ZLOJXaSqSzAXAoGFdxIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059385"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059385"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:12:54 -0800
X-CSE-ConnectionGUID: i1huEtcjSHOBu0sEw1Zm0g==
X-CSE-MsgGUID: 08FuPZ0ISmuhHcnGHGuTlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84812979"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:12:54 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 06/33] xhci: Don't trace ring at every enqueue or dequeue increase
Date: Wed,  6 Nov 2024 12:14:32 +0200
Message-Id: <20241106101459.775897-7-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241106101459.775897-1-mathias.nyman@linux.intel.com>
References: <20241106101459.775897-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Don't trace ring pointers every time driver increases enqueue pointer
after queuing a TRB, or dequeue pointer after handling an event.

These xhci_inc_deq: and xhci_inc_enq: trace entries fill up the trace and
provides little useful info now that the TRB DMA address is printed with
the TRB itself.

Only trace ring during xhci_inc_enq() and xhci_inc_deq() in case we move
to a new ring segment.

Also don't show both segment and TRB addess in trace.
Segment is just TRB with 0xfff masked off.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c  | 16 +++++++++-------
 drivers/usb/host/xhci-trace.h | 10 +++-------
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 3c19f58fcefd..f7f7b0a818f8 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -167,13 +167,16 @@ void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring)
 	if (ring->type == TYPE_EVENT) {
 		if (!last_trb_on_seg(ring->deq_seg, ring->dequeue)) {
 			ring->dequeue++;
-			goto out;
+			return;
 		}
 		if (last_trb_on_ring(ring, ring->deq_seg, ring->dequeue))
 			ring->cycle_state ^= 1;
 		ring->deq_seg = ring->deq_seg->next;
 		ring->dequeue = ring->deq_seg->trbs;
-		goto out;
+
+		trace_xhci_inc_deq(ring);
+
+		return;
 	}
 
 	/* All other rings have link trbs */
@@ -188,14 +191,13 @@ void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring)
 		ring->deq_seg = ring->deq_seg->next;
 		ring->dequeue = ring->deq_seg->trbs;
 
+		trace_xhci_inc_deq(ring);
+
 		if (link_trb_count++ > ring->num_segs) {
 			xhci_warn(xhci, "Ring is an endless link TRB loop\n");
 			break;
 		}
 	}
-out:
-	trace_xhci_inc_deq(ring);
-
 	return;
 }
 
@@ -264,13 +266,13 @@ static void inc_enq(struct xhci_hcd *xhci, struct xhci_ring *ring,
 		ring->enqueue = ring->enq_seg->trbs;
 		next = ring->enqueue;
 
+		trace_xhci_inc_enq(ring);
+
 		if (link_trb_count++ > ring->num_segs) {
 			xhci_warn(xhci, "%s: Ring link TRB loop\n", __func__);
 			break;
 		}
 	}
-
-	trace_xhci_inc_enq(ring);
 }
 
 /*
diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index cc916e58a329..57b8cb5a8d19 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -458,8 +458,6 @@ DECLARE_EVENT_CLASS(xhci_log_ring,
 		__field(void *, ring)
 		__field(dma_addr_t, enq)
 		__field(dma_addr_t, deq)
-		__field(dma_addr_t, enq_seg)
-		__field(dma_addr_t, deq_seg)
 		__field(unsigned int, num_segs)
 		__field(unsigned int, stream_id)
 		__field(unsigned int, cycle_state)
@@ -470,17 +468,15 @@ DECLARE_EVENT_CLASS(xhci_log_ring,
 		__entry->type = ring->type;
 		__entry->num_segs = ring->num_segs;
 		__entry->stream_id = ring->stream_id;
-		__entry->enq_seg = ring->enq_seg->dma;
-		__entry->deq_seg = ring->deq_seg->dma;
 		__entry->cycle_state = ring->cycle_state;
 		__entry->bounce_buf_len = ring->bounce_buf_len;
 		__entry->enq = xhci_trb_virt_to_dma(ring->enq_seg, ring->enqueue);
 		__entry->deq = xhci_trb_virt_to_dma(ring->deq_seg, ring->dequeue);
 	),
-	TP_printk("%s %p: enq %pad(%pad) deq %pad(%pad) segs %d stream %d bounce %d cycle %d",
+	TP_printk("%s %p: enq %pad deq %pad segs %d stream %d bounce %d cycle %d",
 			xhci_ring_type_string(__entry->type), __entry->ring,
-			&__entry->enq, &__entry->enq_seg,
-			&__entry->deq, &__entry->deq_seg,
+			&__entry->enq,
+			&__entry->deq,
 			__entry->num_segs,
 			__entry->stream_id,
 			__entry->bounce_buf_len,
-- 
2.25.1


