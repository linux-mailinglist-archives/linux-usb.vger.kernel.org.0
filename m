Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1FB4B84EF
	for <lists+linux-usb@lfdr.de>; Wed, 16 Feb 2022 10:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232520AbiBPJvf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Feb 2022 04:51:35 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:49000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232478AbiBPJvb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 04:51:31 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA19A29C103
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 01:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645005068; x=1676541068;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=99YnMQbApcc0QAzHaMFoAdEXgK/fCyyygtJXRBUm/tc=;
  b=WQXsblzsf6t+Hq6tYh8HLLlZVruf6bilJBq+OXERPCd2LghY+S+mMUkj
   Dqn/ut3g4SrnKa3IqBbcC+C90+v/w2d9NV5FzQ6Ed+19ObNP6xwXC3B2j
   p3Foz/QJpOhD+7DlbFK9uMYQQQJilEYl8qzKBchznl5S/2u7y3oiYH1Ty
   LbUCmHiHTTMQB1uC3fsi5vuYzxIsvK3uh4b1OsbCRnl2i+ZAulTpTM9bq
   lM343t5BqYOVhoedQStpmEJ+p8hyZFEr3cI31oB/dhdFMKrhBrOAUZpHl
   QdMEhwlDHYEm4ZMIGFRWvvhCcIc1QdyadXTv/E8oBRBhvRd38L/4fqz8D
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="249396978"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="249396978"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 01:50:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="636410414"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga004.jf.intel.com with ESMTP; 16 Feb 2022 01:50:34 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>, kernel test robot <lkp@intel.com>,
        Julia Lawall <julia.lawall@inria.fr>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 9/9] usb: xhci: fix minmax.cocci warnings
Date:   Wed, 16 Feb 2022 11:51:53 +0200
Message-Id: <20220216095153.1303105-10-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220216095153.1303105-1-mathias.nyman@linux.intel.com>
References: <20220216095153.1303105-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: kernel test robot <lkp@intel.com>

Simplify the code using max().

Generated by: scripts/coccinelle/misc/minmax.cocci

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
Signed-off-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 7a2dce730e9a..f8c2b6c79543 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -433,8 +433,7 @@ int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 				(TRBS_PER_SEGMENT - 1);
 
 	/* Allocate number of segments we needed, or double the ring size */
-	num_segs = ring->num_segs > num_segs_needed ?
-			ring->num_segs : num_segs_needed;
+	num_segs = max(ring->num_segs, num_segs_needed);
 
 	ret = xhci_alloc_segments_for_ring(xhci, &first, &last,
 			num_segs, ring->cycle_state, ring->type,
-- 
2.25.1

