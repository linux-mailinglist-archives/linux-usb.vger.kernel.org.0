Return-Path: <linux-usb+bounces-30297-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD514C47873
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 16:27:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A8963A3EB9
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 15:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810E726B96A;
	Mon, 10 Nov 2025 15:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHx+ceiH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92666246BC5
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 15:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762787725; cv=none; b=Akdx61zstlprf3gROrljHY4xFO8VMmq8DQuA/M4AZ2FNN9F5+Q3zzknNcC6tbaDVTskWz6f+F/OO4yhT5cUJNrO13NzOHcNt0X3pV+9o3n38NkG58ydCGHHtRBvCfILcKMRDtDW8t1QQyshW6T8sSxkomRfjxWIxjNBjzPBTBWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762787725; c=relaxed/simple;
	bh=WQCY93oVfivecS1o5iYr9Aiigl200opDbw3B4rrSBFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B1uNB4tAofbLbllWVq5WaZN9/aRMll8qCed5KSuClfVTqXxdw6pWiFIwl9iLpBhQWp37KbQiU/EI1NYrgu1RFIME+R9JS0ICHRCHNOcT1G94S3IjJ/8ichbs1e3FX3v82qyc80XoTsdIqKqrwD0jlQ/7kj7vbnEKmX39KheqK5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHx+ceiH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762787723; x=1794323723;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WQCY93oVfivecS1o5iYr9Aiigl200opDbw3B4rrSBFE=;
  b=QHx+ceiHmp9XwyGUuhV0JR6Ta6X4eZkX7FrEGu7om42mjzKNGLEVjfZd
   psZvoEUp5PWbc0KISB0x0YBGhYcYHpdUWgI03tXe7H/k6hFo/Ff/3SpG0
   GlmMHcMk2P6ZzxAc3zASGDcvn97NvJM+n61Yc/0+ZCr+G4DdNq5o87xQP
   ysnGbcnxim+z2TCKJCdl8U2FlRIxGX2mQ9TMK92S87xQxWHDXVt3bygsf
   91vmHDWjUH8t7X/1cWTkDQQOcJKaphPTP611ccteA+BJLC00QTCFoS6HO
   TpByYGX80SAz5tj/NeWGhqbRGedTmsNE+iHD65pwhVu8HHi9MHaMgW5lA
   A==;
X-CSE-ConnectionGUID: me0/j58VQIG/0gVsW5dgWw==
X-CSE-MsgGUID: Cl390T8hRdyL0fmY/9i6lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64767794"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64767794"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 07:15:23 -0800
X-CSE-ConnectionGUID: cCSFB/EgSkyVVDT7sqotsw==
X-CSE-MsgGUID: QIPQLQR3RJyuWoJ7l8fF7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="219353923"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 10 Nov 2025 07:15:23 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 1E26495; Mon, 10 Nov 2025 16:15:22 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 13/13] usb: xhci: use 64-bit Addressing Capability macro
Date: Mon, 10 Nov 2025 16:14:50 +0100
Message-ID: <20251110151450.635410-14-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110151450.635410-1-niklas.neronin@linux.intel.com>
References: <20251110151450.635410-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify by replace BIT(0) call with its relevant macro.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 79e707686c1a..294cc9226328 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5480,7 +5480,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	 * DMA_BIT_MASK(32)) in this xhci_gen_setup().
 	 */
 	if (xhci->quirks & XHCI_NO_64BIT_SUPPORT)
-		xhci->hcc_params &= ~BIT(0);
+		xhci->hcc_params &= ~HCC_64BIT_ADDR;
 
 	/* Set dma_mask and coherent_dma_mask to 64-bits,
 	 * if xHC supports 64-bit addressing */
-- 
2.50.1


