Return-Path: <linux-usb+bounces-24000-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FBBAB88B9
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B88B1893DCD
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E56C208961;
	Thu, 15 May 2025 13:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UAAbEpZ8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F7C19E99E
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317423; cv=none; b=OmcWFcUESbBpxPzr9+A9sAISZxJ39DcwAQVwe7Dgjff4qX+TmgIqpeh/5+DlM20jKU713/NeX9flERUx2BH1swsADvoaP2tpl3ZBTBxKPqhso9XZDSQOZxpXBFUGnFqKbVkWrz4Etcn9XbH6GZ5kg1cFLii7+18lzNm86/jEUMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317423; c=relaxed/simple;
	bh=DpG26/AwLNnDH13mRaJw8plDnODYPHbzK9krmrHUPSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IRp+Wrycitlfo278int9N9lirThtZxeP8biTb2pYBqVpaYIzX0W9DeidAFdQrGq1XHz/x+H/DiZa65IPLPtudDnkwlWihKKR2ux9SO8MEr1iHZ/clSPETyeJq+Z9nLxBwYD3dVY4p4xTKVJoA/sJBrcSulm5fbP6w/aVAQD/BmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UAAbEpZ8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317423; x=1778853423;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DpG26/AwLNnDH13mRaJw8plDnODYPHbzK9krmrHUPSs=;
  b=UAAbEpZ8OEF5j1tf0vRqMrCaGYwKsAkkclkC+7XaxPJbmlbPcNTDTwbU
   9ZRj/iBHoj5pp00+WPuKgQzqzrBCOMNszXGl6xY2X6x+GFQhlGK2nZCQ9
   8/deq90g9OJIpe56C6uKlX61ooo8jH2ECmdpz4kQmmzaqUqeRLinBwB8O
   em7beGH8+xpNhsg+VuZLIRetBiMP/Mr4lLQVoqiaCIUgGUm7uyf6mW1me
   TLsUbTVJ3jFxS/ZJ/M+0m1WhjzCvOi3KzwI9X2mcv0Bg2XGzbsP9umHtJ
   PL0D9w4nV6CNBVcYbVJkfCz8AF9B3DNTea5ARgg2Pw8iSTrpgEFYSGNWu
   Q==;
X-CSE-ConnectionGUID: BKHm49OyROezhwDFFbcLDQ==
X-CSE-MsgGUID: G6NfDM1HQdOn6ODJsmtSUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60270089"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60270089"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:57:03 -0700
X-CSE-ConnectionGUID: YmJ7dm/5QhmXdi3I3VC/hw==
X-CSE-MsgGUID: oYIbv8ksRxKhjkY320HTQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372386"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:57:01 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 20/24] usb: xhci: cleanup IMOD register comments
Date: Thu, 15 May 2025 16:56:17 +0300
Message-ID: <20250515135621.335595-21-mathias.nyman@linux.intel.com>
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

Patch does not contain any functional changes.

Add missing macro descriptions with specific bit definitions for each data
field and reordered them accordingly.

Remove "HW use only" from Interrupt Moderation Counter. xHCI Specification
1.2, section 5.5.2.2, states "This counter may be directly written by
software at any time to alter the interrupt rate."

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.h | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 7865e21f0b1f..4a4ce6784bf0 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -210,14 +210,13 @@ struct xhci_op_regs {
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
@@ -242,12 +241,13 @@ struct xhci_intr_reg {
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
@@ -259,15 +259,18 @@ struct xhci_intr_reg {
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
2.43.0


