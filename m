Return-Path: <linux-usb+bounces-23998-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E867AB88B4
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CE144E455C
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECAC31C5D72;
	Thu, 15 May 2025 13:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aON0iA8I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079B51C7013
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317420; cv=none; b=OynelbE2i1jevWx/hVVbS5byMkbIFc+/y7OoVplRoR9yvovKHw0BrLA5s5X7KBjLs4aeEyt5Gm4QeUidMGMse53SPfIymnr+pkzUUuxXsp6ZdAVB3aUkt9+CSRQtAM68KWINrLupTQYjBKskhqZcKhfuy/0eDm4A+lku1hS1wFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317420; c=relaxed/simple;
	bh=SXiypzDrS+KRMHOqGROjYTVYCkDONtv+xUn4GsxUIE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X+ow+rRH9/rw3RK23iQ8gJN5USml8RQkVkdSujmkDCpQHeditWi2kR7pVGxKq9ktSlo76iRyAjSWY4pm7jVzsXh9iQr4JMmN7zxTeNz2RkBqP+iB7Y+3FYqYmECxkWTDAOAPnvjwJuyaHjrOH5ns+37NE36pzkD4g6k9tzE8KPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aON0iA8I; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317419; x=1778853419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SXiypzDrS+KRMHOqGROjYTVYCkDONtv+xUn4GsxUIE4=;
  b=aON0iA8ITitr2G/xv+DhWT/Y5BZRvu7nCMiPaDjs9tGTsE91c/sbqWKF
   aQD50jaNbBr14kL6E1RePlMTrFZnm3oK+LcUdrnW61M5SOsbFU6pFb9dT
   JwRVUw6ieyfE0RIkHe90WwnBAypr4rm/tbnD329k1KBT3kpAF1YYpICRA
   GfiVsqpiMLw14h8trJZJxtpsk4LQhlm2h5W76xV4HkDaq5e4bmN2qHgVc
   oRUQR1nN00kx8qlAsPwxDljcMtHOCW4TA2ZV2EPqQ8EbCcKzLkVAJCH6m
   J2g9MHfoHvy9r9WjTRFHCfZ6p+xTUs25L4V0VocKLjGcfuPiLSyvEsJBV
   g==;
X-CSE-ConnectionGUID: gZOB8gT9Qx+1RiJwtwTP+A==
X-CSE-MsgGUID: mtlGQN3IT82ScO/a32c9AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60270082"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60270082"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:56:59 -0700
X-CSE-ConnectionGUID: w5x6/XFbTp2WYuiRkgyGtA==
X-CSE-MsgGUID: yUrobXpaRma4FiITXWkR0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372345"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:56:57 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 18/24] usb: xhci: rework Event Ring Segment Table Size mask
Date: Thu, 15 May 2025 16:56:15 +0300
Message-ID: <20250515135621.335595-19-mathias.nyman@linux.intel.com>
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

Event Ring Segment Table Size Register contain two fields:
 - Bits 15:0:	Event Ring Segment Table Size
 - Bits 31:16:	RsvdZ (Reserved and Zero)

The current mask 'ERST_SIZE_MASK' refers to the RsvdZ bits (31:16).
Change the mask to refer to bits 15:0, which are the Event Ring Segment
Table Size bits.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 4 ++--
 drivers/usb/host/xhci.h     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index dcfe7774e9ed..ec2c4851c689 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1831,7 +1831,7 @@ xhci_remove_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 	 */
 	if (ir->ir_set) {
 		tmp = readl(&ir->ir_set->erst_size);
-		tmp &= ERST_SIZE_MASK;
+		tmp &= ~ERST_SIZE_MASK;
 		writel(tmp, &ir->ir_set->erst_size);
 
 		xhci_update_erst_dequeue(xhci, ir, true);
@@ -2333,7 +2333,7 @@ void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num)
 
 	/* set ERST count with the number of entries in the segment table */
 	erst_size = readl(&ir->ir_set->erst_size);
-	erst_size &= ERST_SIZE_MASK;
+	erst_size &= ~ERST_SIZE_MASK;
 	erst_size |= ir->event_ring->num_segs;
 	writel(erst_size, &ir->ir_set->erst_size);
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index fc6b97add7fa..19dd47d76140 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -251,8 +251,8 @@ struct xhci_intr_reg {
 #define ER_IRQ_COUNTER_MASK	(0xffff << 16)
 
 /* erst_size bitmasks */
-/* Preserve bits 16:31 of erst_size */
-#define	ERST_SIZE_MASK		(0xffff << 16)
+/* bits 15:0 - Event Ring Segment Table Size, number of ERST entries */
+#define	ERST_SIZE_MASK		(0xffff)
 
 /* erst_base bitmasks */
 #define ERST_BASE_RSVDP		(GENMASK_ULL(5, 0))
-- 
2.43.0


