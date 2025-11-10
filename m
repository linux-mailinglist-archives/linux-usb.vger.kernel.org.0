Return-Path: <linux-usb+bounces-30288-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 67294C4780D
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 16:24:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 70AA14F145B
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 15:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA72D31CA4A;
	Mon, 10 Nov 2025 15:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aU7pbG/i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A68031BC8F
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 15:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762787716; cv=none; b=O0wdC9vQwYJOZ/7/cxMvxg4/qO4DfyoxRwu+BobVfh5bHaj5nSyFgx8QBp6yktdkIOl+w6iQ0RX/pD6TB/X5nlw7uDE8bUwaqJyGVdYH7n0KRSi91oIMi+lqKsioovUJvtLtgHm5omqRxLHyMmcUbbi26y5euC7esUSzUZygupc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762787716; c=relaxed/simple;
	bh=oQ5EUSqOZG4R3pUMbL7n4qkaHbZ/F2Cxrfy1JQC86kE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TIRrpKN6kW4MKIMz0QjoIgpr8RGMkwxZod+RJexFuOYqu3Yzw+mrKsvSsxv3rsMb32xN8Olc4rXi69JiFVUDw3SWXm6CDW0aGVa2Idr1XbXNZQgapS4yvIJWZns+VG07tMulKFeNih5HpVJgWknQtKoN4dCYjCsPjLLqS/LMT9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aU7pbG/i; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762787714; x=1794323714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oQ5EUSqOZG4R3pUMbL7n4qkaHbZ/F2Cxrfy1JQC86kE=;
  b=aU7pbG/illwgM/tUFXB5TmyDl+x5YOVpfadZag/nmuBw1H3g2FDaNYe0
   VUjaZ7BHd5JpIkr5B0EFDjB7tlJwvDnVu0OpFg1yS1ns6vU8hvGqrC3DS
   SOCsYC4VptNFROZAhzi9Yh4f7I8YoAjE0kfG8sN+hj5LJ1Z4QPnTvVOKb
   LmfSVFhm1JTS/zWLaIO8okvkhXozkBjQwfPOs8q2M5i/BooI7DYGjC/m1
   TlnzUctm+0PCV8Um/L7IUoPUGfa27rQmjbmvU1W30QEZP6kElVUMr8D9u
   k1frEUP3fp7nu6HFuTHsIg1jzwJ1D+XvTNRuap5sFIa0PZIp8inGbCz4X
   g==;
X-CSE-ConnectionGUID: U8Mw+gllTeuCeq7zwiOckA==
X-CSE-MsgGUID: ArGBQWvIT/++lYaKu3XoiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64767772"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64767772"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 07:15:14 -0800
X-CSE-ConnectionGUID: faNN7QGGShuJxTtrqRkkTg==
X-CSE-MsgGUID: hscAV3i0TgySQAs4ht6FzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="219353895"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 10 Nov 2025 07:15:13 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 84DE895; Mon, 10 Nov 2025 16:15:12 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 03/13] usb: xhci: use cached HCSPARAMS1 value
Date: Mon, 10 Nov 2025 16:14:40 +0100
Message-ID: <20251110151450.635410-4-niklas.neronin@linux.intel.com>
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

The Structural Parameters 1 (HCSPARAMS1) register is read and cached in
'xhci->hcs_params1' during host controller initialization. Since this
register is read-only and its value remains constant for the lifetime of
the controller, re-reading it later is unnecessary.

Replace subsequent register reads with the cached 'xhci->hcs_params1'
value to avoid redundant MMIO access.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 42975df517cb..0630269e5ab7 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4222,8 +4222,7 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
 		xhci_err(xhci, "Error while assigning device slot ID: %s\n",
 			 xhci_trb_comp_code_string(command->status));
 		xhci_err(xhci, "Max number of devices this xHCI host supports is %u.\n",
-				HCS_MAX_SLOTS(
-					readl(&xhci->cap_regs->hcs_params1)));
+			 HCS_MAX_SLOTS(xhci->hcs_params1));
 		xhci_free_command(xhci, command);
 		return 0;
 	}
-- 
2.50.1


