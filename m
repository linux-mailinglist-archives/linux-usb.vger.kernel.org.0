Return-Path: <linux-usb+bounces-22747-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1360FA80497
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 14:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E45A94A10CE
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 12:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800C526AAA3;
	Tue,  8 Apr 2025 11:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUFxD6ES"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8295226AA82
	for <linux-usb@vger.kernel.org>; Tue,  8 Apr 2025 11:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113597; cv=none; b=FAsgJKbG/NlcfpIKNms3NAUt6bvteTf5OugLopaspp/+vNphzGyX6g+SEzE7/9onUGT777M93o+dtpGyBAcq/B82vWse/ty0ORMB42WYp1d6UWkbG/gn5IP5Lmkdb+KvaIqpf47/w1a4diSOrB+vpJWCq9tNIwLdQBWfBZ/zfNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113597; c=relaxed/simple;
	bh=ju+24sM5izmCx9YopZ91b5iDG5thenrTBwdZmNSFnQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UZKnnda3YSqJcILmkQOHzPsEMqozGpocgmVMSyYZNieWxyZWa+ua1NRJn3oUYzvwvw3PXHIi4hMZlKUdvS/25F4f+xsNFmkUUEy9+Walx8RtAHeEosD4C6lZBuUhLzHLHFXtKITRMlh6PFQOfqvUzmCO64hwpuauU8uPV9OSfHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUFxD6ES; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744113595; x=1775649595;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ju+24sM5izmCx9YopZ91b5iDG5thenrTBwdZmNSFnQI=;
  b=bUFxD6ES4UpKrs3kqHSxuwGoElR6GRlrqfJ0b1lOlzeixgKHUGXKSYhU
   FyWAnJGck7g81PetaQLb+dFvmFObHmW1lmG6PFqHY6+UFdGz3y2fWKoLv
   qOCSwu66OHd/4SQZeCIDiUzhCfRZ+9Sq1ljF+eFj7GrwiUFNjmWXPwm96
   oep35wVQSZRxKWF/M/ObZkDR0Gl7NPbHDSpD/1zsNkAkm4V1bec5oa5Kg
   A6/LoO6MKn3+6HCOQoIf85IrKP4uNyg0gaQdJbApllWZWC8i9zANo9E7R
   butqM/rf5JwfiNVhDvoFyeJG/ZIRQVXvt1V2MPpI3UrLxM2j045FkvwoH
   A==;
X-CSE-ConnectionGUID: iLXq4LIdSTKVOf6Eq1YBSw==
X-CSE-MsgGUID: KveJW26qRWGM3szk6/vvyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45676471"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45676471"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 04:59:54 -0700
X-CSE-ConnectionGUID: tT44rNeBQC2OHXqcyiFWnA==
X-CSE-MsgGUID: wdZ9VxX9TfqQ3bMnjlzHKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="151428057"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 08 Apr 2025 04:59:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id EA591398; Tue, 08 Apr 2025 14:59:51 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 7/9] usb: xhci: cleanup IMOD register comments
Date: Tue,  8 Apr 2025 14:57:50 +0300
Message-ID: <20250408115752.1344901-8-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250408115752.1344901-1-niklas.neronin@linux.intel.com>
References: <20250408115752.1344901-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch does not contain any functional changes.

Add missing macro descriptions with specific bit definitions for each data
field and reordered them accordingly.

Remove "HW use only" from Interrupt Moderation Counter. xHCI Specification
1.2, section 5.5.2.2, states "This counter may be directly written by
software at any time to alter the interrupt rate."

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci.h | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 2a4beb6a6695..715b860995f3 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -211,14 +211,13 @@ struct xhci_op_regs {
 #define XHCI_PAGE_SIZE_MASK     0xffff
 
 /**
- * struct xhci_intr_reg - Interrupt Register Set
- * @irq_pending:	IMAN - Interrupt Management Register.  Used to enable
+ * struct xhci_intr_reg - Interrupt Register Set, v1.2 section 5.5.2.
+ * @irq_pending:	IMAN - Interrupt Management Register. Used to enable
  *			interrupts and check for pending interrupts.
- * @irq_control:	IMOD - Interrupt Moderation Register.
- * 			Used to throttle interrupts.
- * @erst_size:		Number of segments in the Event Ring Segment Table (ERST).
- * @erst_base:		ERST base address.
- * @erst_dequeue:	Event ring dequeue pointer.
+ * @irq_control:	IMOD - Interrupt Moderation Register. Used to throttle interrupts.
+ * @erst_size:		ERSTSZ - Number of segments in the Event Ring Segment Table (ERST).
+ * @erst_base:		ERSTBA - Event ring segment table base address.
+ * @erst_dequeue:	ERDP - Event ring dequeue pointer.
  *
  * Each interrupter (defined by a MSI-X vector) has an event ring and an Event
  * Ring Segment Table (ERST) associated with it.  The event ring is comprised of
@@ -243,12 +242,13 @@ struct xhci_intr_reg {
 #define	IMAN_IE			(1 << 1)
 
 /* irq_control bitmasks */
-/* Minimum interval between interrupts (in 250ns intervals).  The interval
- * between interrupts will be longer if there are no events on the event ring.
- * Default is 4000 (1 ms).
+/*
+ * bits 15:0 - Interrupt Moderation Interval, the minimum interval between interrupts
+ * (in 250ns intervals). The interval between interrupts will be longer if there are no
+ * events on the event ring. Default is 4000 (1 ms).
  */
 #define ER_IRQ_INTERVAL_MASK	(0xffff)
-/* Counter used to count down the time to the next interrupt - HW use only */
+/* bits 31:16 - Interrupt Moderation Counter, used to count down the time to the next interrupt */
 #define ER_IRQ_COUNTER_MASK	(0xffff << 16)
 
 /* erst_size bitmasks */
@@ -260,15 +260,18 @@ struct xhci_intr_reg {
 #define ERST_BASE_ADDRESS_MASK	GENMASK_ULL(63, 6)
 
 /* erst_dequeue bitmasks */
-/* Dequeue ERST Segment Index (DESI) - Segment number (or alias)
- * where the current dequeue pointer lies.  This is an optional HW hint.
+/*
+ * bits 2:0 - Dequeue ERST Segment Index (DESI), is the segment number (or alias) where the
+ * current dequeue pointer lies. This is an optional HW hint.
  */
 #define ERST_DESI_MASK		(0x7)
-/* Event Handler Busy (EHB) - is the event ring scheduled to be serviced by
+/*
+ * bit 3 - Event Handler Busy (EHB), whether the event ring is scheduled to be serviced by
  * a work queue (or delayed service routine)?
  */
 #define ERST_EHB		(1 << 3)
-#define ERST_PTR_MASK		(GENMASK_ULL(63, 4))
+/* bits 63:4 - Event Ring Dequeue Pointer */
+#define ERST_PTR_MASK		GENMASK_ULL(63, 4)
 
 /**
  * struct xhci_run_regs
-- 
2.47.2


