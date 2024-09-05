Return-Path: <linux-usb+bounces-14723-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAF096DBD6
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 16:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 726231F22DA6
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 14:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4A174413;
	Thu,  5 Sep 2024 14:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5r8kLp0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C354C17557
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 14:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725546696; cv=none; b=P0LkwshnN1IJ4hRXeILHSkcvcAMRRZvxsxjv7V6wqwWpoZRuvPPli2m1OaeVDAG+EKDWt6fNjMAoVtLI/F0eA5PXYaOJjDj43AE6QChbdnsomybzi5xIA0x4xFan2m4JaaUMmC3A5KsYvAJ+5EUyzDzI5LxGKnZmauPt94t2Vws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725546696; c=relaxed/simple;
	bh=mWX9bAzpDZP9VWo0vn5ZVc9iJPwQi09Lvho/X43VJ80=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Afvpukto93BGKaBcy107SkbFcpEpUOWpl0i/TGFZ5/v1EwRnUh3URYnME74MEsN8RCMMGqpJH1QbwYcR792OULRCo7bBbk+SJJbtYZGnjoXF3ryG4hldGkmDc3P/OQg1DPvFMpwJBKQU9BTrimebCyvUmbLU5CGG8V/sPo6nkaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5r8kLp0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725546695; x=1757082695;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mWX9bAzpDZP9VWo0vn5ZVc9iJPwQi09Lvho/X43VJ80=;
  b=V5r8kLp0S7P59zZIi3R6bRjyJCXR/pf4KXyayL+B+XOB7fgvwF4L4rKy
   HYdioRmKf0ygz/4putF/rq/GwVFmVnur3z7VSGG32hQQR5fmSt6XR+UeS
   HAbjzqOhAqiQU/UmPT3YVLlszPgzLruVrYnjOpZs9gDoftT1m0sexqaCd
   hdry1OwgvOpkgbJvksXTnTc09ArZkyt/1kkMDnaWdUJyrfzq5Kvvs6mql
   rlw1IpJSU9cDmYCWx/EpNbJVA0OtH6ep2dTn2TE3qHNZzoRU+loRtWaDv
   PmnU5EBMf9VmTnJof4zfxf3kpSIuo00ZYAaZsNmwbChxK54VRWdCfFnOB
   g==;
X-CSE-ConnectionGUID: mHFwIeoTSsCi2kUCMbe6AQ==
X-CSE-MsgGUID: 9g95+a+pTZekE81Stg7lVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="49677567"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="49677567"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 07:31:34 -0700
X-CSE-ConnectionGUID: zRcD1Ih+QtmhZPnl1T9F/w==
X-CSE-MsgGUID: F3/JC7xwROSi9GUKU63Bvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="88883247"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa002.fm.intel.com with ESMTP; 05 Sep 2024 07:31:33 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH 12/12] xhci: support setting interrupt moderation IMOD for secondary interrupters
Date: Thu,  5 Sep 2024 17:33:00 +0300
Message-Id: <20240905143300.1959279-13-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240905143300.1959279-1-mathias.nyman@linux.intel.com>
References: <20240905143300.1959279-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow creators of seconday interrupters to specify the interrupt
moderation interval value in nanoseconds when creating the interrupter.

If not sure what value to use then use the xhci driver default
xhci->imod_interval

Suggested-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 8 +++++++-
 drivers/usb/host/xhci.c     | 4 ++--
 drivers/usb/host/xhci.h     | 5 ++++-
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 937ce5fd5809..d2900197a49e 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2332,7 +2332,8 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 }
 
 struct xhci_interrupter *
-xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs)
+xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
+				  u32 imod_interval)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_interrupter *ir;
@@ -2365,6 +2366,11 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs)
 		return NULL;
 	}
 
+	err = xhci_set_interrupter_moderation(ir, imod_interval);
+	if (err)
+		xhci_warn(xhci, "Failed to set interrupter %d moderation to %uns\n",
+			  i, imod_interval);
+
 	xhci_dbg(xhci, "Add secondary interrupter %d, max interrupters %d\n",
 		 i, xhci->max_interrupters);
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a69245074395..899c0effb5d3 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -347,8 +347,8 @@ static int xhci_disable_interrupter(struct xhci_interrupter *ir)
 }
 
 /* interrupt moderation interval imod_interval in nanoseconds */
-static int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
-					   u32 imod_interval)
+int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
+				    u32 imod_interval)
 {
 	u32 imod;
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index d41523c9b15c..1e50ebbe9514 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1826,7 +1826,8 @@ struct xhci_container_ctx *xhci_alloc_container_ctx(struct xhci_hcd *xhci,
 void xhci_free_container_ctx(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *ctx);
 struct xhci_interrupter *
-xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs);
+xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
+				  u32 imod_interval);
 void xhci_remove_secondary_interrupter(struct usb_hcd
 				       *hcd, struct xhci_interrupter *ir);
 
@@ -1866,6 +1867,8 @@ int xhci_alloc_tt_info(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
 		struct usb_device *hdev,
 		struct usb_tt *tt, gfp_t mem_flags);
+int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
+				    u32 imod_interval);
 
 /* xHCI ring, segment, TRB, and TD functions */
 dma_addr_t xhci_trb_virt_to_dma(struct xhci_segment *seg, union xhci_trb *trb);
-- 
2.25.1


