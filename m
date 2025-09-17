Return-Path: <linux-usb+bounces-28216-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89784B7F0CF
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 15:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 040D81781F2
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 13:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001A832E731;
	Wed, 17 Sep 2025 12:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDDzjt6R"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA41632E736
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 12:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758113947; cv=none; b=DWFqNwzo4XBlQMmuYRHONZSsdod81fEJb7YenvuJJDAVnbF1qeh0M0BEaLUnjhxLyQDSB7IJ9eOnK+FJ8UwEWW2pbuBOdwmv2ELznhN+5ZRHVa7xKDLiEY6v6cHB38RHMe5nU60waEjblqLK53NZHJcPZdGyQLTGNySyBdgGxOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758113947; c=relaxed/simple;
	bh=uaGlrp++3asZUZkysht9jI7J7sldwCjQPGfAHfmSs3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nCG0sFOvbxTwMJkq+AfQwtHK1kHQPPIo0ITYHInPKBekbwwSHS/PO8yxnoy4Z3W9qHv5cJN+GyVH7z7Sg11XfFiT2Cn+t75Xx+7L/R3wWcFpqc39diVCu3EWJ3OR9v0nEA2PTnnlkXqrIIavWgbFvQ7phYSaAc074R6SrKjn+kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDDzjt6R; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758113946; x=1789649946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uaGlrp++3asZUZkysht9jI7J7sldwCjQPGfAHfmSs3I=;
  b=XDDzjt6R4Z1FpGctiwaYwfknzXnFlNaC74nfgEI22xetKOAnQeaIAw+Q
   9E8Cjhq6o0JkLiTrOV5ie7HTgVBKrrCYAa6kf3ZitVYlDc1MsQ/iYKklW
   BIwA5JRBo7lM/9USeAxCnenOm9hKWBE9vouu6L8+jUfnNO8zVZBPgHh8h
   li79L9OhFg5dHRhfYRb7D4PpPMi8xy0WqkLb236C+EziHQfRnNP9m8on1
   hm37TdUdtZgYAZbDbUTmV9f1cLbJOT+y797Ku6KsyEFJgfY7q8yt8urOs
   pPsA/ofuAf0tPtsrD7dONeWQ0uaIiwhiii0es2xCeOBwTJgBngG+j56oG
   g==;
X-CSE-ConnectionGUID: LJcN1ok0QX2IDxEox70Dhw==
X-CSE-MsgGUID: MQl2HkUmRiqzr3XqOUlh/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60484585"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="60484585"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 05:59:04 -0700
X-CSE-ConnectionGUID: QuZ6eQOmRPWmaAPShKnoFA==
X-CSE-MsgGUID: n+p11/L9QY2+gsDlBcULng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="175159041"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 17 Sep 2025 05:59:02 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 0BDE798; Wed, 17 Sep 2025 14:59:02 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	peter.chen@kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 1/8] usb: xhci: correct indentation for PORTSC tracing function
Date: Wed, 17 Sep 2025 14:58:42 +0200
Message-ID: <20250917125850.3380560-2-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250917125850.3380560-1-niklas.neronin@linux.intel.com>
References: <20250917125850.3380560-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the indentation in USB Port Register Set (PORTSC) tracing.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-trace.h | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index bfb5c5c17012..f303ce600ff5 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -541,23 +541,23 @@ DEFINE_EVENT(xhci_log_ring, xhci_inc_deq,
 );
 
 DECLARE_EVENT_CLASS(xhci_log_portsc,
-		    TP_PROTO(struct xhci_port *port, u32 portsc),
-		    TP_ARGS(port, portsc),
-		    TP_STRUCT__entry(
-				     __field(u32, busnum)
-				     __field(u32, portnum)
-				     __field(u32, portsc)
-				     ),
-		    TP_fast_assign(
-				   __entry->busnum = port->rhub->hcd->self.busnum;
-				   __entry->portnum = port->hcd_portnum;
-				   __entry->portsc = portsc;
-				   ),
-		    TP_printk("port %d-%d: %s",
-			      __entry->busnum,
-			      __entry->portnum,
-			      xhci_decode_portsc(__get_buf(XHCI_MSG_MAX), __entry->portsc)
-			      )
+	TP_PROTO(struct xhci_port *port, u32 portsc),
+	TP_ARGS(port, portsc),
+	TP_STRUCT__entry(
+		__field(u32, busnum)
+		__field(u32, portnum)
+		__field(u32, portsc)
+	),
+	TP_fast_assign(
+		__entry->busnum = port->rhub->hcd->self.busnum;
+		__entry->portnum = port->hcd_portnum;
+		__entry->portsc = portsc;
+	),
+	TP_printk("port %d-%d: %s",
+		__entry->busnum,
+		__entry->portnum,
+		xhci_decode_portsc(__get_buf(XHCI_MSG_MAX), __entry->portsc)
+	)
 );
 
 DEFINE_EVENT(xhci_log_portsc, xhci_handle_port_status,
-- 
2.50.1


