Return-Path: <linux-usb+bounces-21093-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B62CA46456
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 16:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 694243AF5A4
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 15:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68D6226CE5;
	Wed, 26 Feb 2025 15:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/wIh6/0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC65222370F
	for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2025 15:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740582934; cv=none; b=u06jmRT1kfgro4gT+bSeZcl6E9uDBhgOwNvhu7QlUNYr3JIVamZ6XlfXQ93bDF+5W4ymgEztMQNUnM8RDvpIsRTuYIvp3X/b87CmwFoWSTdRjfnLCvF0N+DSAZ+C6NI6Ay1P9Ng+7oqAuI7UwG4MmBWEQyeyQmrPJYjHMnMk9YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740582934; c=relaxed/simple;
	bh=uVtNKgifQ8RX0go6U9Oj2r9OTLSAFCvsxV1KVRPab8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QZO4bOjMMY5GiGtzIfOA2ZNVocq/g/KsupijUIJcLMPwmYQ7q5iDC7SwP5yzA50/shEWIKH66oh8j93gxHt77/yTBWuJrj45tX0J0tC0aAXI5gnqSflJE2On1MWI/3xK6byzHLTUpIibrLDWS4pv4Zu0/nEGoGEZjq34etanUHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/wIh6/0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740582933; x=1772118933;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uVtNKgifQ8RX0go6U9Oj2r9OTLSAFCvsxV1KVRPab8o=;
  b=m/wIh6/0uAsiuTifKLSytF+OwhMOmvxcyKGuHm8NJV7cnasESq0ToDIE
   V5BOURWuBXDEK+mBj68o48zRyhtjebmTJzwFCMCsjXldxJ02L1D2N4KgT
   lUa9SHmflS7OlHPeFKi2S/MYjxtUISw6gonYu6APlYpvf6OTbwIHjahSv
   ZrxoV0QqvUT5rvHZ5/+45RznplpnJi5leVpP7x6SG1nCPmftO97cXbp7W
   006zmTIgM/F25+eSAuNWoR7SG4MdmPegBJoXThPoYWGGIoCzLXRzHQEqo
   AhWPrPjmUGgJQ3AyZIF2CS/t8G/bTsdnFIdEAQBNBdM/OtD5G/CesUc5r
   Q==;
X-CSE-ConnectionGUID: lP/2pYfsS8iEyObQ2JUU8w==
X-CSE-MsgGUID: BZp1t8sgSbqTObbdXOlMtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41687023"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="41687023"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 07:15:31 -0800
X-CSE-ConnectionGUID: 2QljMHPuRvOPeMBmqDF2Vg==
X-CSE-MsgGUID: L5pzjq3ySUuoIP34F4OynA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="121828548"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 26 Feb 2025 07:15:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 668BF5C2; Wed, 26 Feb 2025 17:15:28 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 1/3] usb: xhci: use correct TR Dequeue pointer mask
Date: Wed, 26 Feb 2025 17:14:55 +0200
Message-ID: <20250226151458.3871867-2-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250226151458.3871867-1-niklas.neronin@linux.intel.com>
References: <20250226151458.3871867-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Endpoint Context Field at Offset 0x08 is defined as follows:
 - Bit 0:	Dequeue Cycle State (DCS)
 - Bits 3:1:	RsvdZ (Reserved and Zero)
 - Bits 63:4:	TR Dequeue Pointer

When reading the TR Dequeue Pointer for an Endpoint without Streams,
the inverted Dequeue Cycle State mask ('~EP_CTX_CYCLE_MASK') is used,
which include the Reserved bits. Although bits 3:1 are typically zero,
using the incorrect mask could potentially cause issues.

Swap mask 'EP_CTX_CYCLE_MASK' for 'SCTX_DEQ_MASK'.
i.e. ~(1 << 0) for (~0xfL).

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 965bffce301e..d4ec1e707107 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1464,7 +1464,7 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 				stream_ctx->reserved[1] = 0;
 			}
 		} else {
-			deq = le64_to_cpu(ep_ctx->deq) & ~EP_CTX_CYCLE_MASK;
+			deq = le64_to_cpu(ep_ctx->deq) & SCTX_DEQ_MASK;
 		}
 		xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
 			"Successful Set TR Deq Ptr cmd, deq = @%08llx", deq);
-- 
2.47.2


