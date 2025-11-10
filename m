Return-Path: <linux-usb+bounces-30286-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D048C47804
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 16:23:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A02A44EF434
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 15:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C3D31961F;
	Mon, 10 Nov 2025 15:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cOKQhDHW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE73A31987E
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 15:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762787714; cv=none; b=DG5/YIKrmQtzAK/QlRbs/wyuLXauiT2D1L8hOBgJFeRkwUdfDZLuh55DfacUIftHcD0M0fTVg076DM4X4F0KehJ2qr5bJLciwSLylbF5sHoA8ihTpDVVQXPJkS0CyeKCmNZFg3UKYj3cDI2TedJ31eMI1I2+OJYeN1ly4WxyRgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762787714; c=relaxed/simple;
	bh=WmkBs79CxxXT9W+EVMvmTH6oIOEnBew+A4AaGiOiruQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R5K9TClCaaFsrE76xQMLJQbIhfztMcVJs/hAHkV/bnEIofSbxjqhMLRAwOm8W5gsfWklzUo9VoDMMtCKRV9ZZE0LQjs4Zr2wRA8621e6FO/2fF+NBcHbFu3AZfE3MArmT2PEhkny/EZbueC9XhX4EkP8GwH60ufHSO9IDoALkYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cOKQhDHW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762787713; x=1794323713;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WmkBs79CxxXT9W+EVMvmTH6oIOEnBew+A4AaGiOiruQ=;
  b=cOKQhDHWLO3Ixd+r+ltnoS+xFwvOjLQIohkuR/fXNtEXpRsR/2m9qiHf
   eKKdoeo8YIxfahin119odBeWEBPKXQ+Kso4OfT6Vk4aTeJoQsSOfrhdRm
   HFWUElrT+CdPKRka0upThN8lND2OnoY3y/fvPIPB+LqTzlQq4532UvL9W
   QOmhbQMLHriHaiVC/UpTLDcDpK00rJk0pEy6tJv9TYRpPwRG8mzyO8hXN
   ew0JJ9EEOgK+XToXCiJpLEucwvmChIY72OiGFM678N5a/PHVRFc/Pebb6
   B+T50tZlULopkfc4p26l8408NWuhd15yGgMr7lgHdB5zRiGaHVNTI8KWl
   g==;
X-CSE-ConnectionGUID: XXfyyOYGR4m5Gc+Rla0rbw==
X-CSE-MsgGUID: 23/GebPORZSmoORHHsAsYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64878557"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="64878557"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 07:15:12 -0800
X-CSE-ConnectionGUID: 1EM5kPjESby+F00+O+g1/g==
X-CSE-MsgGUID: G3AXxQ7YQE+jJeA/nf0u8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="188003988"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 10 Nov 2025 07:15:11 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 82D7C95; Mon, 10 Nov 2025 16:15:10 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 01/13] usb: xhci: remove deprecated TODO comment
Date: Mon, 10 Nov 2025 16:14:38 +0100
Message-ID: <20251110151450.635410-2-niklas.neronin@linux.intel.com>
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

The Device Context Base Address Array (DCBAA) contains pointers to device
contexts. These fields are 64-bit registers, capable of holding 64-bit
addresses.

When struct 'xhci_device_context_array' was introduced in commit [1],
the entries were represented as pairs of 'u32', requiring a custom helper
function to set 64-bit addresses. This was later made redundant by
commit [2], which changed the representation to a single 'u64', allowing
direct assignment.

The associated TODO comment referencing the old 32-bit representation is
no longer relevant and is removed.

Link: https://git.kernel.org/torvalds/c/a74588f94655 [1]
Link: https://git.kernel.org/torvalds/c/8e595a5d30a5 [2]
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 58a51f09cceb..8792692ba236 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -800,7 +800,6 @@ struct xhci_device_context_array {
 	/* private xHCD pointers */
 	dma_addr_t	dma;
 };
-/* TODO: write function to set the 64-bit device DMA address */
 /*
  * TODO: change this to be dynamically sized at HC mem init time since the HC
  * might not be able to handle the maximum number of devices possible.
-- 
2.50.1


