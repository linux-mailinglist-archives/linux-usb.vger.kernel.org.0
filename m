Return-Path: <linux-usb+bounces-25902-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3CBB086BE
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 09:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B2B17A8EE6
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 07:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6E525C81E;
	Thu, 17 Jul 2025 07:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sp+0ZHt0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD8225A2CF
	for <linux-usb@vger.kernel.org>; Thu, 17 Jul 2025 07:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752737487; cv=none; b=jMRe/bRpEQqGTv8CQ+/OF6eENM38+AL6Qu2By18olUpznORhkUEBf7vmEXQDg3qSfLs+zaqBTNSl6H2/c4T5wyzrFtiVxTcUccfDEU376BVO/JBxNj/S8Ym4xdKnTxcs1kS5rbFk+xjapY9urcJD+SNkQ7iMB+KoIr9qcgU+Mp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752737487; c=relaxed/simple;
	bh=/wpyMLqTaYAIRbjSdvBn9lNshQ/khCX6KIzrcV/k+24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ntWouQ/fr1OCk4D4m84QzDJxMi1aFQzFfpePZq+7rlxw41DoSHnXENaGa++dO4+c3qP8K21tk4RYKsxp2ne5UeYmSKcNPrqwiwWdo2ivamb/4GOV2n+aiqSrKBkb6sfDNDb7tx/NuHOl5PeHooO1ayWyhGgSMwRyZI56Rspmt70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sp+0ZHt0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752737486; x=1784273486;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/wpyMLqTaYAIRbjSdvBn9lNshQ/khCX6KIzrcV/k+24=;
  b=Sp+0ZHt0gUo+dm8zktYI+hW9C1/EmtIvBHLey1AAtOhfRvXvMFDBv/Eq
   XROPuW+ZtqAY6uZ6jb9MkTWdTIPmDDus9CJJ26tQk2QI+KAqG7yxMZkrO
   bit4SjurQnyoKFq3DPB/T0i2e3s+3Hchhifi5A++dBwoAyKEsDFocKy6J
   DtMJ7ONW5NVfGChSb8gIIZ6TTobPpEykmcOc9aoHyDNwql3gJecBCfV52
   LqFvJxK46zWf2fGER9qGp4NhcLMo7n5r75Imeo2zBXzgX/23Bx3pr5u1O
   CmUGwRPwFmayUfbXccMj0o2SeYws6XxU+COsLVmVXyJ4EFlGPsSmsWP3L
   A==;
X-CSE-ConnectionGUID: C+rjFM8jT06NH6At00XIAw==
X-CSE-MsgGUID: w/yFq7BSQmCd0NTN1bciog==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="80449336"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="80449336"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 00:31:25 -0700
X-CSE-ConnectionGUID: 3PPkSG2rRYeHGubkX78Plw==
X-CSE-MsgGUID: kZQRc4RJQIKEW7M1f2UogA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="188721576"
Received: from ettammin-desk.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.50])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jul 2025 00:31:24 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Jay Chen <shawn2000100@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 3/3] usb: xhci: Set avg_trb_len = 8 for EP0 during Address Device Command
Date: Thu, 17 Jul 2025 10:31:07 +0300
Message-ID: <20250717073107.488599-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250717073107.488599-1-mathias.nyman@linux.intel.com>
References: <20250717073107.488599-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jay Chen <shawn2000100@gmail.com>

There is a subtle contradiction between sections of the xHCI 1.2 spec
regarding the initialization of Input Endpoint Context fields. Section
4.8.2 ("Endpoint Context Initialization") states that all fields should
be initialized to 0. However, Section 6.2.3 ("Endpoint Context", p.453)
specifies that the Average TRB Length (avg_trb_len) field shall be
greater than 0, and explicitly notes (p.454): "Software shall set
Average TRB Length to '8' for control endpoints."

Strictly setting all fields to 0 during initialization conflicts with
the specific recommendation for control endpoints. In practice, setting
avg_trb_len = 0 is not meaningful for the hardware/firmware, as the
value is used for bandwidth calculation.

Motivation: Our company is developing a custom Virtual xHC hardware
platform that strictly follows the xHCI spec and its recommendations.
During validation, we observed that enumeration fails and a parameter
error (TRB Completion Code = 5) is reported if avg_trb_len for EP0 is
not set to 8 as recommended by Section 6.2.3. This demonstrates the
importance of assigning a meaningful, non-zero value to avg_trb_len,
even in virtualized or emulated environments.

This patch explicitly sets avg_trb_len to 8 for EP0 in
xhci_setup_addressable_virt_dev(), as recommended in Section 6.2.3, to
prevent potential issues with xHCI host controllers that enforce the
spec strictly.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220033
Signed-off-by: Jay Chen <shawn2000100@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 6680afa4f596..07289333a1e8 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1195,6 +1195,8 @@ int xhci_setup_addressable_virt_dev(struct xhci_hcd *xhci, struct usb_device *ud
 	ep0_ctx->deq = cpu_to_le64(dev->eps[0].ring->first_seg->dma |
 				   dev->eps[0].ring->cycle_state);
 
+	ep0_ctx->tx_info = cpu_to_le32(EP_AVG_TRB_LENGTH(8));
+
 	trace_xhci_setup_addressable_virt_device(dev);
 
 	/* Steps 7 and 8 were done in xhci_alloc_virt_device() */
-- 
2.43.0


