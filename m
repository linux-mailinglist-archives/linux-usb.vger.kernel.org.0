Return-Path: <linux-usb+bounces-1903-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F05ED7CF539
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 12:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC29628210B
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 10:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D0F182CC;
	Thu, 19 Oct 2023 10:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y20y2DxY"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF30018B10
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 10:28:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F91124
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 03:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697711295; x=1729247295;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hAEEwwvoa6XlYzfh0F63K/IXNPTwimW5mNkdb+vh2lM=;
  b=Y20y2DxYhinQbwziKWxK+XLJMCLR6kDU8SfeurbqXwKAaGIeFqQ7e/3D
   Nz0hc3ULCp9/DEv2oJB7RHHEuogGoWEzMPiU+aWnfuX0Xi7YFnvjsICGR
   gelSZNyPwHG/Xx1GkgubB2FwyHPQjWUmxd3acA/tF/Myeqxo0/5aIIh+8
   t7LdD7fHYv37+EEknRqXU/+NiYdeQ4NRQ8f6SHyFpwHszRJgcUc8Cr1bV
   w6MPdbg3ef2qPolWkEBzVXgJl1In5AuBCzcrY2pSCRbgWqNCAoBgIlSyH
   3VRGO8xR9u9M7u6jyxUm9CYZOKqJTL3DJh0uQaJL/lvSr2O1HLRz7Syan
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389075847"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="389075847"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 03:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930557688"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="930557688"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 03:28:13 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 08/19] xhci: Expose segment numbers in debugfs
Date: Thu, 19 Oct 2023 13:29:13 +0300
Message-Id: <20231019102924.2797346-9-mathias.nyman@linux.intel.com>
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

Ring segments have just been amended with a monotonically increasing
number.

To allow developers to inspect the segment numbers and ensure
correctness in particular after ring expansion, expose them in each
ring's "trbs" file in debugfs.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 99baa60ef50f..6d142cd61bd6 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -204,7 +204,7 @@ static void xhci_ring_dump_segment(struct seq_file *s,
 	for (i = 0; i < TRBS_PER_SEGMENT; i++) {
 		trb = &seg->trbs[i];
 		dma = seg->dma + i * sizeof(*trb);
-		seq_printf(s, "%pad: %s\n", &dma,
+		seq_printf(s, "%2u %pad: %s\n", seg->num, &dma,
 			   xhci_decode_trb(str, XHCI_MSG_MAX, le32_to_cpu(trb->generic.field[0]),
 					   le32_to_cpu(trb->generic.field[1]),
 					   le32_to_cpu(trb->generic.field[2]),
-- 
2.25.1


