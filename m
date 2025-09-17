Return-Path: <linux-usb+bounces-28243-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85118B81E45
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 23:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 407673ADDB7
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 21:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665F92EF646;
	Wed, 17 Sep 2025 21:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8EIQpvY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3938B2E22B4
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 21:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758143299; cv=none; b=ubeL/ClQN8DvJ/wF300bIL061LE8+SBwMKHTejjneMOtWuBPhgRwcbEE3bKwx9ts25I6hz3kmRVQr3/3PSJuj1zPgL8xDBGVd1Ylu+sC/1r12sIaz20Znzs5y81N6EbugAZ1mq/UOqsInsR3bKPvLYan9D3C2ypQXJZiJXW7ARQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758143299; c=relaxed/simple;
	bh=A431ew/Hed2x+AoBm68bFizrVCPRd1aU2UyFVPzRwhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zp+foPfp498uyTMnYRSqtG9/aQvArIzGKtU2Hv6dcT9yToc8xExsfNCgRJ5/TmRGNCPbp2nmuLXIJZT9ksXDS1lJW0USXYqFm/DMN0K2Ri3mhHO8G9CQ2vzQRs8p6vHN3uQGIxR1e55F/7iwLZzaCaL0ykW85JRwKSz46bsyxT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8EIQpvY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758143298; x=1789679298;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A431ew/Hed2x+AoBm68bFizrVCPRd1aU2UyFVPzRwhc=;
  b=m8EIQpvYjUd4kzCDjlYIN4kZjTYuYr6FnHqjQ2GI0oL32lNWT+MV3oy1
   hQp96iGVrvtM8nH/Lnp3x6wRZIo4ZD8kz5Gj9dxmKkRFfd8nOCfZ/smXv
   9ac7ImPCI873LI6ePD8w5qvA70jrTnfwcYvpBpRkOsgqkCpRGY/kbytv8
   zRwRoUGrtwMucsZAOyGK34Z4rrIPjw+IgdSpX0WweIcjPxDiKYfcN45sn
   CQtBOTcSIzZfViHupgmSLaO5IAMY5lw4twK859lND2hI+t+r7VgbEMf56
   H13z4kdig/m8/gbRXEXpanVL8YAQmIl/HzspVYzgH69nhNmyu0wqsQ2RY
   A==;
X-CSE-ConnectionGUID: ynsiiD25TnqRuipi9H6ePw==
X-CSE-MsgGUID: Ox6HGiJmQhWLzNs1iXVCjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="48038222"
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="48038222"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 14:08:18 -0700
X-CSE-ConnectionGUID: XAKLvQj6TVCYB68XDrYmgA==
X-CSE-MsgGUID: HGDvqEOqRDuAHuY8cHLcGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="175800219"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.42])
  by fmviesa009.fm.intel.com with ESMTP; 17 Sep 2025 14:08:17 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 5/6] usb: xhci: correct indentation for PORTSC tracing function
Date: Thu, 18 Sep 2025 00:07:24 +0300
Message-ID: <20250917210726.97100-6-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917210726.97100-1-mathias.nyman@linux.intel.com>
References: <20250917210726.97100-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Correct the indentation in USB Port Register Set (PORTSC) tracing.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
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
2.43.0


