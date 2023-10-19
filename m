Return-Path: <linux-usb+bounces-1902-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 527DD7CF537
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 12:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50F2C1C20F6F
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 10:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED71199BB;
	Thu, 19 Oct 2023 10:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="huwinCg0"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8389A199A6
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 10:28:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DA6D11F
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 03:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697711294; x=1729247294;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iYM1aDx7pf/XEGo0EPiys5ylzRV6EJ1IIrUjwUAi288=;
  b=huwinCg0R63HnbBIYZyelLVu1wTZ8yLXqkjFKqeGuTLd3ujcppdKIpFn
   q2DqEVNYiCPD+ScydwkVP/aG7L1Ap1wpaDtog0oBUsstsk95xhY2JK7bL
   dPGLzch+dfMs2CNFv/SVv0BvNdtdOvYbxBeUV5mr9B8HYtAv0EPQlEO5Q
   JGBQRunzMuh+cS3WNnyw+y76rh0IKvoNNtDRjI80R/zZtu/4J0LWFpYp8
   H/oWzEO7ugRhTNsOXAcFxMV31FMjjELFEwQJX1Gsd/gU72q4EfTp3VWII
   vAKZK/ukHlZ1+DyMQah4dN7Svwqc54AFH8Hu25jnHxlvEva3l4ynvyAQ5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389075833"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="389075833"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 03:28:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930557657"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="930557657"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 03:28:11 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 07/19] xhci: Update last segment pointer after Event Ring expansion
Date: Thu, 19 Oct 2023 13:29:12 +0300
Message-Id: <20231019102924.2797346-8-mathias.nyman@linux.intel.com>
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

When expanding a ring at its "end", ring->last_seg needs to be updated
for Event Rings as well, not just for all the other ring types.

This is not a fix because ring expansion currently isn't done on the
Event Ring.  It's just in preparation for when it's added.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 1c0f5263cf81..d4123e6f2549 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -146,11 +146,13 @@ static void xhci_link_rings(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	xhci_link_segments(last, next, ring->type, chain_links);
 	ring->num_segs += num_segs;
 
-	if (ring->type != TYPE_EVENT && ring->enq_seg == ring->last_seg) {
-		ring->last_seg->trbs[TRBS_PER_SEGMENT-1].link.control
-			&= ~cpu_to_le32(LINK_TOGGLE);
-		last->trbs[TRBS_PER_SEGMENT-1].link.control
-			|= cpu_to_le32(LINK_TOGGLE);
+	if (ring->enq_seg == ring->last_seg) {
+		if (ring->type != TYPE_EVENT) {
+			ring->last_seg->trbs[TRBS_PER_SEGMENT-1].link.control
+				&= ~cpu_to_le32(LINK_TOGGLE);
+			last->trbs[TRBS_PER_SEGMENT-1].link.control
+				|= cpu_to_le32(LINK_TOGGLE);
+		}
 		ring->last_seg = last;
 	}
 
-- 
2.25.1


