Return-Path: <linux-usb+bounces-23987-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F3AAB88A9
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6653A00C69
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D6C1EA7E2;
	Thu, 15 May 2025 13:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aDbNj4oI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F7E1E3761
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317402; cv=none; b=gAiWuAOs7MrDs3IJU1PmSJfD8nU3hgyovlxyq/Xkrhzm8Lxi+0htJ+4XIZskRxReE/eCxn+M1CKHhJ2g7l+Y87mVsSw6lCvlWwAHeRxjORn1ECXASlau/7wx/lr8ZDdLVJogQAzdvesO9gj7fjZaggKrZ/qWihEXbSMZ2ODjEjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317402; c=relaxed/simple;
	bh=urSmvmg72cnrRySazUZGliv/lQ2oOuNBAQJMvUdez7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RrUU/vauMLpv7HQuypKBJQ0Dy+ZWuie38Ieyq753+tHdrqzzrHdQOIeHlyzlEpgHvwgr1px2N62P0jfHxtrtCyz2g4lbGOShJHrO5vIUDI6+So9/2H3gq/hf1Ivi29ID2qrWGmwxEUaDzW3kmMyl+ElI3wrdQNn7Qb2gIO8IKwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aDbNj4oI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317401; x=1778853401;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=urSmvmg72cnrRySazUZGliv/lQ2oOuNBAQJMvUdez7Q=;
  b=aDbNj4oISk3I6a9rx2/hHnY8yru79XQ+U0pICAQb7d/JCZMcQ1jMgbWl
   RGF+NufnGaGsjdam7QzkmD3maHPCwV80edBgz1n5Q20ceBDIuyx0Qj+mz
   AH1cwZOQHSd79xqZxTaW/r/j1CYJJP2V4jpOfUsuLNLAcgQTQ24B1duO5
   UrneNuY0r8Sc65lHXyDOy7OXrGp7+2vNSAA6QcYK/whC/8orYkKI1RKbl
   1GjR4RPUrFEjGzg3A2y04/2GyPh8x2dvP43w0F9YarLJgivEgDwtiqYYe
   W+EOBp7WOyFWXC5EYvBQT7+MGiiOTPwTP7JgqfcylT4b4eu3omWitzcg7
   Q==;
X-CSE-ConnectionGUID: kc6VRpZVRqCbOs0oXcV3mw==
X-CSE-MsgGUID: nPLWRmg6Sjms/9z/DZEvAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60270013"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60270013"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:56:41 -0700
X-CSE-ConnectionGUID: emdIgi45TG2Ftve9s2gkSw==
X-CSE-MsgGUID: YWluSq8MTRylakpuihUQXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372130"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:56:39 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 07/24] usb: xhci: move DCBAA pointer write
Date: Thu, 15 May 2025 16:56:04 +0300
Message-ID: <20250515135621.335595-8-mathias.nyman@linux.intel.com>
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

Move the Device Context Base Address Array (DCBAA) pointer write from
xhci_mem_init() to xhci_init(). This is part of the ongoing effort to
separate allocation and initialization.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 1 -
 drivers/usb/host/xhci.c     | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index c4b94f7bacfb..ac96f0155cab 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2434,7 +2434,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"// Device context base array address = 0x%pad (DMA), %p (virt)",
 			&xhci->dcbaa->dma, xhci->dcbaa);
-	xhci_write_64(xhci, dma, &xhci->op_regs->dcbaa_ptr);
 
 	/*
 	 * Initialize the ring segment pool.  The ring must be a contiguous
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 4c9174c5c7c7..e8c262865188 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -545,6 +545,9 @@ static int xhci_init(struct usb_hcd *hcd)
 	/* Set the address in the Command Ring Control register */
 	xhci_set_cmd_ring_deq(xhci);
 
+	/* Set Device Context Base Address Array pointer */
+	xhci_write_64(xhci, xhci->dcbaa->dma, &xhci->op_regs->dcbaa_ptr);
+
 	/* Initializing Compliance Mode Recovery Data If Needed */
 	if (xhci_compliance_mode_recovery_timer_quirk_check()) {
 		xhci->quirks |= XHCI_COMP_MODE_QUIRK;
-- 
2.43.0


