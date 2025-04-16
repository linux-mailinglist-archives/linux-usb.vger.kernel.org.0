Return-Path: <linux-usb+bounces-23138-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C195A90536
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 16:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25D93463006
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 13:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5F1221D94;
	Wed, 16 Apr 2025 13:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFeomQCu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B532222C1
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 13:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811176; cv=none; b=FjQN5x1klhL8C3GaTqYpi+WE/75GbusCMkGVtumzN9VOjBkAC2Wzi+wtd2nhLixur8ui2pLPwsLg9Xx7SNCBLDygMnaazxxTKVUTLEdPsxXmExGWNcMiNV0uqNZi9KLik3Nia1vrlp77/q8R55EPxQl2n1lqt6oa60GF/3/0K24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811176; c=relaxed/simple;
	bh=EjeFrOL5eAp0/SdAcdF2XgvSTf4oY3qxoSe+f7PX0x4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=toCsZc6ipsF+RRCZcEpyLxC84gAEKKUAdD2oRR8uSvJ3vIXVHfP+7Sjq31ssgtwqimxLfIFFt/w6jWS6fQe/bG5yRe2IYAD7U9Z/rgZLo2MJNOUUPBkA01o1gmTNMZq9Y4y1lZnmJeZFegWmXaVLGXt5QKZ/3PEeW5+blgIp86k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFeomQCu; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744811175; x=1776347175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EjeFrOL5eAp0/SdAcdF2XgvSTf4oY3qxoSe+f7PX0x4=;
  b=MFeomQCultBLSRymCXeLC2/Xe59D/BKcgZ27rcRQ0051opSxD7fy260v
   ZJ0HdtD5G7QvSaggiFPHzlEPeRXHEeRD5bUb6aFSGyGBYaaNCuiBtGowE
   iVx5IwdfEovv02+z6JB1mvkMMXggSU9T1ZAdTUpBgjIIwQ8r6cfE0wEXk
   KEKClkDArTqCTtPBNxgtv9ZoP46uqCCQE/VWYSRQPzE9UsYq8gGsiNlLq
   ik8MJVFcJ/j4g8N8jw9os9ZLbkM1qB/wgK7ldjHTBt/2At34QVB4wB3J4
   2tqjBhxASm3xL2KPaxogiKkOp9TnTJeNbPDTbPhaiWPNxZQjhj/SQaQmw
   w==;
X-CSE-ConnectionGUID: SiJNWMZmTYSqhHoiavf06g==
X-CSE-MsgGUID: 5ySUErX3Rdq7odpF6lZR9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50168105"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="50168105"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 06:46:14 -0700
X-CSE-ConnectionGUID: 2juTqg7DRMqq8wRgkv7cvg==
X-CSE-MsgGUID: nOXo4LOkSRaU2N/XA8MYCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135290234"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 16 Apr 2025 06:46:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 687CC81D; Wed, 16 Apr 2025 16:46:11 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	sergei.shtylyov@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 05/11] usb: xhci: move DCBAA pointer write
Date: Wed, 16 Apr 2025 16:45:04 +0300
Message-ID: <20250416134510.2406543-6-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250416134510.2406543-1-niklas.neronin@linux.intel.com>
References: <20250416134510.2406543-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the Device Context Base Address Array (DCBAA) pointer write from
xhci_mem_init() to xhci_init(). This is part of the ongoing effort to
separate allocation and initialization.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
v2:
 * Add "Array" to "Set Device Context Base Address pointer" comment.

 drivers/usb/host/xhci-mem.c | 1 -
 drivers/usb/host/xhci.c     | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 46156e99bbbe..19f756a57cb7 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2400,7 +2400,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"// Device context base array address = 0x%pad (DMA), %p (virt)",
 			&xhci->dcbaa->dma, xhci->dcbaa);
-	xhci_write_64(xhci, dma, &xhci->op_regs->dcbaa_ptr);
 
 	/*
 	 * Initialize the ring segment pool.  The ring must be a contiguous
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index d4f3da2c074b..ef93c1ae5215 100644
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
2.47.2


