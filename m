Return-Path: <linux-usb+bounces-23999-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 497D0AB88B7
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCEAA4E4A72
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F311AAE13;
	Thu, 15 May 2025 13:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HTDiUd29"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD4C1FECD3
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317422; cv=none; b=FnDXTxwQdTsUboLQlThIWpN0gsM2ege6yNfJOd4XJtJ0wCbsMPu1fd1ocXMCaCUqGPAV44M0xm2uVbwUM9pvEKfXS7cAMZhQemAh2feec8fXvL8GLtEKldTXlSKCwZHsSaKVps9xnOiX8E86TCetl/98lHso1gay5vFpQLZrDb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317422; c=relaxed/simple;
	bh=ZnPVSt0T1VO8v43cvOGNjk4r5PSCnocyhK1LdwZ8Dto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YDyQ/7zMKquE633px4wzqbyFWBS2LG/+z8JlDrCxCiz0jVKmTKsBJNHRknCwbZk4UvfeeWR7S9KbBFbU10oLoVeaZDiISOpHf4M3ZnZI+2cBbJXo647fU1+bFOGJh3iE12cjG6hEBXjpwuBVO468Cg/dwu3IU8+SjpHyhr9FqLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HTDiUd29; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317421; x=1778853421;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZnPVSt0T1VO8v43cvOGNjk4r5PSCnocyhK1LdwZ8Dto=;
  b=HTDiUd292nVmM17tkDjbnQZb2c3TIb2SRpDRFtCPD/U1RcxYNqAfmuli
   WL62YfP/0+QYd/XfJrCcdKDS5UReYo6cggfN9/gqTkr8Vf9ZHHqkw8FoH
   MCXfkz8MW8luoWiSxOFuM+3g9494Sz+XVPzaijb1qZMIsEvbLXrkQiudQ
   unPhBNI26WV9adH+Rox2WHUIAUuCzX1foizs++W0phxkFUzux+V5BNKxS
   hf8JwitcBtl2E1eHizwu7HEgsq9vjMTPLtBvj7NEFt0fP0kEy/BqnAK+L
   QTvBOYqYDpG2EKXFJfunnKO94ryWLXhJxgoKzefBK0fv5wNJH3pp2rf+q
   w==;
X-CSE-ConnectionGUID: K8m61cEKQSmAERPv5FgXrw==
X-CSE-MsgGUID: jRyB7HIeRi+4gquXl8ICpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60270085"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60270085"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:57:01 -0700
X-CSE-ConnectionGUID: ziil7t5KSYOwyDqqrzaFXw==
X-CSE-MsgGUID: DbDtb2IxQeewcQkw/bbnbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372363"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:56:59 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 19/24] usb: xhci: rework Event Ring Segment Table Address mask
Date: Thu, 15 May 2025 16:56:16 +0300
Message-ID: <20250515135621.335595-20-mathias.nyman@linux.intel.com>
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

Event Ring Segment Table Base Address Register contain two fields:
 - Bits 5:0:	RsvdP (Reserved and Preserved)
 - Bits 63:6:	Event Ring Segment Table Base Address

Currently, an inverted RsvdP mask (ERST_BASE_RSVDP) is used to extract
bits 63:6. Replaces the inverted mask with a non-inverted mask,
'ERST_BASE_ADDRESS_MASK', which makes the code easier to read.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 4 ++--
 drivers/usb/host/xhci.h     | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index ec2c4851c689..bd745a0f2f78 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2338,8 +2338,8 @@ void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num)
 	writel(erst_size, &ir->ir_set->erst_size);
 
 	erst_base = xhci_read_64(xhci, &ir->ir_set->erst_base);
-	erst_base &= ERST_BASE_RSVDP;
-	erst_base |= ir->erst.erst_dma_addr & ~ERST_BASE_RSVDP;
+	erst_base &= ~ERST_BASE_ADDRESS_MASK;
+	erst_base |= ir->erst.erst_dma_addr & ERST_BASE_ADDRESS_MASK;
 	if (xhci->quirks & XHCI_WRITE_64_HI_LO)
 		hi_lo_writeq(erst_base, &ir->ir_set->erst_base);
 	else
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 19dd47d76140..7865e21f0b1f 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -255,7 +255,8 @@ struct xhci_intr_reg {
 #define	ERST_SIZE_MASK		(0xffff)
 
 /* erst_base bitmasks */
-#define ERST_BASE_RSVDP		(GENMASK_ULL(5, 0))
+/* bits 63:6 - Event Ring Segment Table Base Address Register */
+#define ERST_BASE_ADDRESS_MASK	GENMASK_ULL(63, 6)
 
 /* erst_dequeue bitmasks */
 /* Dequeue ERST Segment Index (DESI) - Segment number (or alias)
-- 
2.43.0


