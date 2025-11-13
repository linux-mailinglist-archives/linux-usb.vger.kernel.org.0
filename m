Return-Path: <linux-usb+bounces-30488-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 67144C57836
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 14:00:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3E69D353F0F
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 12:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36320351FC6;
	Thu, 13 Nov 2025 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPcQKF+o"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0E5350A37
	for <linux-usb@vger.kernel.org>; Thu, 13 Nov 2025 12:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763038745; cv=none; b=WpPx6GU8240FM0Tm091DOhYd301lyG7hzHZdwAI0r8YYqmEebszRgO1eBk4aXrPmKX49BG+PYbhV88sfLXwi4C5pVBOH/pTS6dXZKdP9cT8IxhEVbExteopmi8AA4WlPqv4hycpdTMBT9KCVkn0wi57v2tyRams2AebQcT6rfWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763038745; c=relaxed/simple;
	bh=CT1CcfbZB8sXaYH5YLQkKysmaYfBybnenVfgEukJsUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VBDdyF+aUv3fzM4xjt++CYOajL/kU2cxQ5drHu3MjM/wZuH1+ccaqobuI/J5ONMbXD8RNjUKqg8ZTWHyaL2tunltfi45pu42mYaUSNpGIAaoYgnghxuGqXE9Ke35GfQRl63JJYzv0W1XuZgKRTOJRjhhTTwVTWj4Gj8trQVkUFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IPcQKF+o; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763038744; x=1794574744;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CT1CcfbZB8sXaYH5YLQkKysmaYfBybnenVfgEukJsUw=;
  b=IPcQKF+o7Rx410uqmB/pN7JEZLvO0eHlYF5ZdLSaKV3cXxjhH4DnD55m
   N27qxAM3WBNX+2QOpIL7e2MLX6kvKwVliKfKbFEOLMKv5wQIJeDeP4iZA
   S5ZZapXYjS4nFf9eKygMLGudIixx+IGcj0dyMP1sxWZ7UhFbDCZR9rS0I
   IFqO5HbnBTqjCo12ySGACzjBczGfI8MKA0IYRVxCkh9I9JuHeiVi+c5+8
   zTDVkw7DUmHZqqdjNWIf12cfszTY7qEkAe7P5H50tH8MV1GEuPq9MQire
   N533HhIT/q6IxSq5CXT+gFgZtkDFFT3Z8xiMiKOFCVXf/djvjzfQ+BhWG
   Q==;
X-CSE-ConnectionGUID: gUQh+UFyT22sVI+ltgBUrw==
X-CSE-MsgGUID: PwVhCyydQBaxGwDba73KOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65150409"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="65150409"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 04:59:01 -0800
X-CSE-ConnectionGUID: DPNxZ+3WTxS18vlnp23rKQ==
X-CSE-MsgGUID: HPw1BwlHQ26KgSodFw8POA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189673840"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 13 Nov 2025 04:59:00 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 7BB0B97; Thu, 13 Nov 2025 13:58:59 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 09/13] usb: xhci: simplify Max Scratchpad buffer macros
Date: Thu, 13 Nov 2025 13:56:36 +0100
Message-ID: <20251113125640.2875608-10-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251113125640.2875608-1-niklas.neronin@linux.intel.com>
References: <20251113125640.2875608-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Max Scratchpad Buffers consist of two bit-fields:
bits 25:21 - Max Scratchpad Buffers High, 5 Most significant bits
bits 27:31 - Max Scratchpad Buffers Low, 5 Least significant bits
Combined they create the Max Scratchpad Buffers value.

Add two new macros, 'HCS_MAX_SP_HI' and 'HCS_MAX_SP_LO', to separately
extract the high and low parts of the Max Scratchpad Buffers. These are
then combined using 'HCS_MAX_SCRATCHPAD' macro. This change simplifies
the code and makes it similar to other split value register macros in the
xhci driver.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-caps.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
index e772d5f30d36..af47aebc5ba8 100644
--- a/drivers/usb/host/xhci-caps.h
+++ b/drivers/usb/host/xhci-caps.h
@@ -37,9 +37,11 @@
 #define HCS_ERST_MAX(p)		(((p) >> 4) & 0xf)
 /* bits 20:8 - Rsvd */
 /* bits 25:21 - Max Scratchpad Buffers (Hi), 5 Most significant bits */
+#define HCS_MAX_SP_HI(p)	(((p) >> 21) & 0x1f)
 /* bit 26 - Scratchpad restore, for save/restore HW state */
 /* bits 31:27 - Max Scratchpad Buffers (Lo), 5 Least significant bits */
-#define HCS_MAX_SCRATCHPAD(p)   ((((p) >> 16) & 0x3e0) | (((p) >> 27) & 0x1f))
+#define HCS_MAX_SP_LO(p)	(((p) >> 27) & 0x1f)
+#define HCS_MAX_SCRATCHPAD(p)	(HCS_MAX_SP_HI(p) << 5 | HCS_MAX_SP_LO(p))
 
 /* HCSPARAMS3 - hcs_params3 - bitmasks */
 /* bits 7:0 - U1 Device Exit Latency, Max U1 to U0 latency for the roothub ports */
-- 
2.50.1


