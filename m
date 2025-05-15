Return-Path: <linux-usb+bounces-24003-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E9FAB88BD
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1531A06682
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62BE20C004;
	Thu, 15 May 2025 13:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f3CvUmno"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECFC198833
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317428; cv=none; b=PpRoIrIKPz6LAg3qLfimOch/AxwAXBOshksh+te9K6S0FDtpufP/cLbnjpzokdUx5AcxkjKjR4KDgdPy6+UHMPwbIY6lbCOtazetG90/XrV1xCAaZDClW3TO/1pd8avJd6l3DBJ5TAKG8eubGP5ZVp/SNPFPwF3YlkJS8ls9U3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317428; c=relaxed/simple;
	bh=fHt1Q37+hSpmb+4RlUzon/peOqB+pG7j5DWBJIOE5eI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iNuc2hN9gOPi6x6ntdzgzYrn00dr05oUJleRVN++G5R68pJoBZ/JS6RcyAmG6aPTVfJSQOT7UtsFP928YyJP9BrRTcMTn2dhUVggdRZaFDGsITKC/OeCH/oHKhxofHcVLT7Ep66zSFjl5QD4uIsA696G8VLyEGIJkuDhuSP0sJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f3CvUmno; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317428; x=1778853428;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fHt1Q37+hSpmb+4RlUzon/peOqB+pG7j5DWBJIOE5eI=;
  b=f3CvUmnoUwFGvPkmWY9Bp3oTcwoRFn2lnPYT3n8f+GeAkqugMUEPPT1D
   Xr6sCqvPzEMEGWeaKWBBf2YqR10ApxOjpdeUVVJ12Fy+ANJjKGCwhhb9Z
   83ORa4LEyK5GYXFnAY4Ph6DA56bBnlvAOeBy/WmSABIeF9xcdZq6tg/mQ
   gBDTtbqePioMQu+G3bpZo3l0GfTyyE+SEuBfObCDk02q+xKv+X8RKvNTR
   9ECpkLVo1Y4TiivVydq3Y5rUnWXEIeC6BbFhD1sRkvmaLKaKTqxtxcDbC
   Yr916PyJ8mjVQvEIntrVPwALa5DstyEd0/UBv98oRWZTdAvgQvcer5Wn4
   g==;
X-CSE-ConnectionGUID: gbvltt54QRmoGb68hkPx6Q==
X-CSE-MsgGUID: QSfNqhoeTTO9ifnRJFcf1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60270110"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60270110"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:57:07 -0700
X-CSE-ConnectionGUID: y75w/r3dQv68/+K3HGPq4Q==
X-CSE-MsgGUID: 1QCAq5KdTiqV9Y4Nmw9H3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372440"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:57:05 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 23/24] usb: xhci: add warning message specifying which Set TR Deq failed
Date: Thu, 15 May 2025 16:56:20 +0300
Message-ID: <20250515135621.335595-24-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
References: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Currently, errors from the Set TR Deq command are not handled.
Add a warning message to specify the slot, endpoint, and TRB address when
a Set TR Deq command fails. This additional information will aid in
debugging such failures.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e3c823e1caee..eff6b84dc915 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1448,6 +1448,11 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 		unsigned int ep_state;
 		unsigned int slot_state;
 
+		xhci_warn(xhci, "Set TR Deq error for TRB 0x%llx in slot %d ep %u\n",
+			  (unsigned long long)xhci_trb_virt_to_dma(ep->queued_deq_seg,
+								   ep->queued_deq_ptr),
+			  slot_id, ep_index);
+
 		switch (cmd_comp_code) {
 		case COMP_TRB_ERROR:
 			xhci_warn(xhci, "WARN Set TR Deq Ptr cmd invalid because of stream ID configuration\n");
-- 
2.43.0


