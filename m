Return-Path: <linux-usb+bounces-27550-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DCAB440CE
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 17:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BD5458627D
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 15:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDD2280334;
	Thu,  4 Sep 2025 15:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c91LI2IW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA33526B955
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 15:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757000621; cv=none; b=SNnlkV7tUMcxMXD8PEdLX2d59NJUQTE8EATFjdeJSRNiZt69tHOfwQsBeNvSYSH2eYmO4/ILT/wRsHaAahFaD5teaoKS0GyjZc8pfDOH7NqmoKOfchhrjfgDR/Uj873nw7i0h5N01G6qx1Z5EmrFE61ifZx+jbtai0Wy2IPONTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757000621; c=relaxed/simple;
	bh=qy2Pgw22pEcnRbrKce2Tl/b/lvCTH3x1jYZFTfZGOno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WsFr8iWCzM+EvQaktY/vN0bWaWclql81iemif2O2paiAJ5eGgFhN1x6F6lptqSQolp3U+Dr5mVW9zmr6GLTVCjiF8E/e6XO42E6Ip5dTmdzGxj6Vm2oNeyinebL3IJ/+9MfJBRHScdVSIPTNGzU5ff9BMIvJccDxpSSrdjDaU5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c91LI2IW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757000619; x=1788536619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qy2Pgw22pEcnRbrKce2Tl/b/lvCTH3x1jYZFTfZGOno=;
  b=c91LI2IWbP1OQ/gdIE2d6KNau8+TgLEmKKavU0EsSiB/stPqmDHsuZ8q
   t167+BEMVejZIqf1ia+dKz7v77fdpxAFeeGIAb7aJaxga5F7+vOX8REoc
   BQMqTtW1bAacjtJCGjPTFAmnnukpauZFFKaPrL3q0Lf4a+Q34YouEkw86
   lE5CdmuPqDwm853Owhx2EWezjQUzs4r3F6hnWHnpmSrUYQxlehWebCIM7
   yeOIrD7gpjxX8QEJWhUMPvrLK9KU0gOi/5BRW15m8eKnpKE3a8n39LuFM
   J/29V7d67IXVoh7NWCyOhqnB6GtxfOQi8EpVTqV1a5uleHlVm5nQjsKtG
   g==;
X-CSE-ConnectionGUID: sl/z3oI8RWqtREYS6Ou+fA==
X-CSE-MsgGUID: xJyi7IAaRH6GWdvLmH5Y2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="62984728"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="62984728"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 08:43:39 -0700
X-CSE-ConnectionGUID: +RB7nqT2RJWteMjUpgcqNA==
X-CSE-MsgGUID: AHu72+AfT9uKlZm2lLR44g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="171477104"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 04 Sep 2025 08:43:38 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 9966194; Thu, 04 Sep 2025 17:43:37 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 1/7] usb: xhci: correct indentation for PORTCS tracing function
Date: Thu,  4 Sep 2025 17:42:14 +0200
Message-ID: <20250904154221.2314596-2-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250904154221.2314596-1-niklas.neronin@linux.intel.com>
References: <20250904154221.2314596-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the indentation in USB Port Register Set (PORTCS) tracing.

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


