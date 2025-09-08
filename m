Return-Path: <linux-usb+bounces-27747-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1097AB495A4
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C90A520134E
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9638D31A059;
	Mon,  8 Sep 2025 16:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mclkEwUH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A9431A067
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349167; cv=none; b=EFJR8ExbatMOE1/FNfi26rczMDMqpwjsHyN9cZfU4iHqd7C8GN5VI0UP9y1myyco+iXe4fTco4ZO6svcIbvwG/wBYTcTmF5SKJkTNzwk2qsMToBjNw9HHuGS3EXQjBHAK2yL7pyjTy9pjrzeEXN4jIua6X+rnO4/zJSdbIco7HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349167; c=relaxed/simple;
	bh=FCdCVq8Ztz1PEVK/mVFD4z4B4t06d+59fuHbV187b+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OOxkYdMClD9YqQeZDFzs6EfB3rmQQueG/wEq4+9/wd6JBDXCc3YQcqIGCgg92KEM6Cg3F5STFAyIypzY6aUjP+xt4/S5UahJbcBBcrqch8hyO/RLMeAEKdhf2QwbMbr4MKC8CKQI6PLbVXoVO5dPocaBX2Tfci4HOpNJQI6LscM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mclkEwUH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349164; x=1788885164;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FCdCVq8Ztz1PEVK/mVFD4z4B4t06d+59fuHbV187b+0=;
  b=mclkEwUHTFqkdFYIS8A6x/msK9XGoKBVsEj0eUvG7sQj9sHVWCcQ9kkU
   wPQlwNZmarbHLjQgXh1Y/8k8KbRdlz/FtrqbE8ZocEevqZJq/Xvnwg394
   LeRKoE2uhce7pbj+v73jJXKGFMM8FGJyQGVzW5bG34/7VQupqQ9JVX1kS
   I7nNytpB/WLqNd70bfy19Ef2iJkj4HHlwKPE0DI/9Z/ETM9FX6z4vyGeO
   WUPImCkKq7ykStIn4N1Ta0HPFlx/M9Z6kcgZQfG5skiefz+zGtcU4FP8y
   /7deOXd8zx0ympH+bU2eqgVR2oPUDtw3BkXkLJ/miLaekxD8+5Ud6jQIR
   Q==;
X-CSE-ConnectionGUID: hyvqgWlwRfOMjHBsVtu2ng==
X-CSE-MsgGUID: CWl/wpXjStKlfvIszWuVuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63443087"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63443087"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:38 -0700
X-CSE-ConnectionGUID: p7TbU5WzRHapVydibSr8qg==
X-CSE-MsgGUID: 3EiuBKy4THa/yQ6tJFLhiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="173291163"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2025 09:32:36 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 2225FAE; Mon, 08 Sep 2025 18:32:31 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 26/26] thunderbolt: Update thunderbolt.h header file
Date: Mon,  8 Sep 2025 18:32:30 +0200
Message-ID: <20250908163230.2614397-27-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908163230.2614397-1-mika.westerberg@linux.intel.com>
References: <20250908163230.2614397-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Make Thunderbolt header file compliant with current kernel-doc
standards. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 include/linux/thunderbolt.h | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 75247486616b..0ba112175bb3 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -213,7 +213,7 @@ enum tb_link_width {
  *		queried first
  * @service_ids: Used to generate IDs for the services
  * @in_hopids: Input HopIDs for DMA tunneling
- * @out_hopids; Output HopIDs for DMA tunneling
+ * @out_hopids: Output HopIDs for DMA tunneling
  * @local_property_block: Local block of properties
  * @local_property_block_gen: Generation of @local_property_block
  * @local_property_block_len: Length of the @local_property_block in dwords
@@ -356,7 +356,7 @@ int tb_xdomain_request(struct tb_xdomain *xd, const void *request,
 		       unsigned int timeout_msec);
 
 /**
- * tb_protocol_handler - Protocol specific handler
+ * struct tb_protocol_handler - Protocol specific handler
  * @uuid: XDomain messages with this UUID are dispatched to this handler
  * @callback: Callback called with the XDomain message. Returning %1
  *	      here tells the XDomain core that the message was handled
@@ -437,7 +437,7 @@ static inline struct tb_service *tb_to_service(struct device *dev)
 }
 
 /**
- * tb_service_driver - Thunderbolt service driver
+ * struct tb_service_driver - Thunderbolt service driver
  * @driver: Driver structure
  * @probe: Called when the driver is probed
  * @remove: Called when the driver is removed (optional)
@@ -519,6 +519,7 @@ struct tb_nhi {
  * @head: Head of the ring (write next descriptor here)
  * @tail: Tail of the ring (complete next descriptor here)
  * @descriptors: Allocated descriptors for this ring
+ * @descriptors_dma: DMA address of descriptors for this ring
  * @queue: Queue holding frames to be transferred over this ring
  * @in_flight: Queue holding frames that are currently in flight
  * @work: Interrupt work structure
@@ -571,12 +572,12 @@ typedef void (*ring_cb)(struct tb_ring *, struct ring_frame *, bool canceled);
 
 /**
  * enum ring_desc_flags - Flags for DMA ring descriptor
- * %RING_DESC_ISOCH: Enable isonchronous DMA (Tx only)
- * %RING_DESC_CRC_ERROR: In frame mode CRC check failed for the frame (Rx only)
- * %RING_DESC_COMPLETED: Descriptor completed (set by NHI)
- * %RING_DESC_POSTED: Always set this
- * %RING_DESC_BUFFER_OVERRUN: RX buffer overrun
- * %RING_DESC_INTERRUPT: Request an interrupt on completion
+ * @RING_DESC_ISOCH: Enable isonchronous DMA (Tx only)
+ * @RING_DESC_CRC_ERROR: In frame mode CRC check failed for the frame (Rx only)
+ * @RING_DESC_COMPLETED: Descriptor completed (set by NHI)
+ * @RING_DESC_POSTED: Always set this
+ * @RING_DESC_BUFFER_OVERRUN: RX buffer overrun
+ * @RING_DESC_INTERRUPT: Request an interrupt on completion
  */
 enum ring_desc_flags {
 	RING_DESC_ISOCH = 0x1,
@@ -636,7 +637,7 @@ int __tb_ring_enqueue(struct tb_ring *ring, struct ring_frame *frame);
  * If ring_stop() is called after the packet has been enqueued
  * @frame->callback will be called with canceled set to true.
  *
- * Return: Returns %-ESHUTDOWN if ring_stop has been called. Zero otherwise.
+ * Return: %-ESHUTDOWN if ring_stop() has been called, %0 otherwise.
  */
 static inline int tb_ring_rx(struct tb_ring *ring, struct ring_frame *frame)
 {
@@ -657,7 +658,7 @@ static inline int tb_ring_rx(struct tb_ring *ring, struct ring_frame *frame)
  * If ring_stop() is called after the packet has been enqueued @frame->callback
  * will be called with canceled set to true.
  *
- * Return: Returns %-ESHUTDOWN if ring_stop has been called. Zero otherwise.
+ * Return: %-ESHUTDOWN if ring_stop has been called, %0 otherwise.
  */
 static inline int tb_ring_tx(struct tb_ring *ring, struct ring_frame *frame)
 {
@@ -675,6 +676,8 @@ void tb_ring_poll_complete(struct tb_ring *ring);
  *
  * Use this function when you are mapping DMA for buffers that are
  * passed to the ring for sending/receiving.
+ *
+ * Return: Pointer to device used for DMA mapping.
  */
 static inline struct device *tb_ring_dma_device(struct tb_ring *ring)
 {
-- 
2.50.1


