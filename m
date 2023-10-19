Return-Path: <linux-usb+bounces-1904-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF327CF53D
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 12:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 866BDB212CE
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 10:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B92A1DFD3;
	Thu, 19 Oct 2023 10:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9YeYS4R"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5AB199A6
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 10:28:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE8D119
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 03:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697711297; x=1729247297;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MeAm84MnsY8xX680R2L1bUnEZxA2Mokp+/4U4m7bGuA=;
  b=F9YeYS4Rd60xI1YdfqhDjBZRBbZLs5/GacvGKXGdw0R7Z5/oPlFbcjaH
   im8RfEl1re5c+eJg9wNUklSEqKC3AB5uLsBdJS17EqLODTA0kGjFxcnxB
   ndpwHwG+pGDnbH4HdhLR+socv89mlOcsIP6HojX7PjS/gCd5HvkWWwhwo
   g63pRqkOyFJahjMuFAHPoyBzMkjr6NljZPgPuX4K5wBLW6rwxZa3PC1Cp
   Rabb9rcJtrwpFNjfsVk19pgyuKuh6Oq8M2263eawvtqw2r7YEApf1vQin
   XuvVlV8KpIzFwr8Ffscrne/Lb/RlKFwJtBi+OIOO83w6s8+HUn7C8nBew
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389075858"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="389075858"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 03:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930557726"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="930557726"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 03:28:15 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 09/19] xhci: Clean up ERST_PTR_MASK inversion
Date: Thu, 19 Oct 2023 13:29:14 +0300
Message-Id: <20231019102924.2797346-10-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
References: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Wunner <lukas@wunner.de>

Mathias notes that the ERST_PTR_MASK macro is named as if it's masking
the Event Ring Dequeue Pointer in the ERDP register, but in actuality
it's masking the inverse.

Invert the macro's value for clarity.

Migrate it to the modern GENMASK_ULL() syntax to avoid u64 casts.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c  | 3 +--
 drivers/usb/host/xhci-ring.c | 5 ++---
 drivers/usb/host/xhci.c      | 2 +-
 drivers/usb/host/xhci.h      | 2 +-
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index d4123e6f2549..b133817ad180 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1952,8 +1952,7 @@ static void xhci_set_hc_event_deq(struct xhci_hcd *xhci, struct xhci_interrupter
 	 */
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 		       "// Write event ring dequeue pointer, preserving EHB bit");
-	xhci_write_64(xhci, ((u64) deq & (u64) ~ERST_PTR_MASK),
-			&ir->ir_set->erst_dequeue);
+	xhci_write_64(xhci, deq & ERST_PTR_MASK, &ir->ir_set->erst_dequeue);
 }
 
 static void xhci_add_in_port(struct xhci_hcd *xhci, unsigned int num_ports,
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 173c2068eb64..17404b14d1bf 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3013,13 +3013,12 @@ static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 		 * Per 4.9.4, Software writes to the ERDP register shall
 		 * always advance the Event Ring Dequeue Pointer value.
 		 */
-		if ((temp_64 & (u64) ~ERST_PTR_MASK) ==
-				((u64) deq & (u64) ~ERST_PTR_MASK))
+		if ((temp_64 & ERST_PTR_MASK) == (deq & ERST_PTR_MASK))
 			return;
 
 		/* Update HC event ring dequeue pointer */
 		temp_64 = ir->event_ring->deq_seg->num & ERST_DESI_MASK;
-		temp_64 |= ((u64) deq & (u64) ~ERST_PTR_MASK);
+		temp_64 |= deq & ERST_PTR_MASK;
 	}
 
 	/* Clear the event handler busy flag (RW1C) */
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index e1b1b64a0723..68920cb96044 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -520,7 +520,7 @@ int xhci_run(struct usb_hcd *hcd)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "xhci_run");
 
 	temp_64 = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
-	temp_64 &= ~ERST_PTR_MASK;
+	temp_64 &= ERST_PTR_MASK;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"ERST deq = 64'h%0lx", (long unsigned int) temp_64);
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 41820fd97c00..f97896740c3f 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -525,7 +525,7 @@ struct xhci_intr_reg {
  * a work queue (or delayed service routine)?
  */
 #define ERST_EHB		(1 << 3)
-#define ERST_PTR_MASK		(0xf)
+#define ERST_PTR_MASK		(GENMASK_ULL(63, 4))
 
 /**
  * struct xhci_run_regs
-- 
2.25.1


