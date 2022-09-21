Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 428D95BFDFA
	for <lists+linux-usb@lfdr.de>; Wed, 21 Sep 2022 14:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbiIUMdq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Sep 2022 08:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbiIUMde (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Sep 2022 08:33:34 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE3CD8052F
        for <linux-usb@vger.kernel.org>; Wed, 21 Sep 2022 05:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663763613; x=1695299613;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PZnpArWlMpfniqg1zekF1KYAo7d18CORYX2FkomSLKw=;
  b=IafSwMB3LtrHUioo1A4B7dHx75vJBSvdwcpcP78PPcXEgBDtD1XLAQ+5
   5pw8621a87fZDiVSOeyFB7dznR+KtYW3WigIBCXBIOVZs7zCVUz1EQGzq
   svc5yANXiAMCtqg38SuzSHML9QxVFJQESy66s7+xtmKNunC6481sESe9C
   PyF3wly9CasbBH9jAdQ1hX09wDqlWZqvvmrLbTUwWWtsAIC67/UCZJSv8
   dcLBXtfWSm8lq07rtB8PdfQ9HmAFsbRHj7t5AB+eTtnv8oTwuW+JiyFu9
   23JdzZkG6uSPPwemRD69utTJoUcqPHCNwdb5/e2u/0c87jTx0u7Snxri3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="363965090"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; 
   d="scan'208";a="363965090"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 05:33:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; 
   d="scan'208";a="708429447"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Sep 2022 05:33:32 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Jianglei Nie <niejianglei2021@163.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 1/6] usb: host: xhci: Fix potential memory leak in xhci_alloc_stream_info()
Date:   Wed, 21 Sep 2022 15:34:45 +0300
Message-Id: <20220921123450.671459-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921123450.671459-1-mathias.nyman@linux.intel.com>
References: <20220921123450.671459-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Jianglei Nie <niejianglei2021@163.com>

xhci_alloc_stream_info() allocates stream context array for stream_info
->stream_ctx_array with xhci_alloc_stream_ctx(). When some error occurs,
stream_info->stream_ctx_array is not released, which will lead to a
memory leak.

We can fix it by releasing the stream_info->stream_ctx_array with
xhci_free_stream_ctx() on the error path to avoid the potential memory
leak.

Signed-off-by: Jianglei Nie <niejianglei2021@163.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 8c19e151a945..9e56aa28efcd 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -641,7 +641,7 @@ struct xhci_stream_info *xhci_alloc_stream_info(struct xhci_hcd *xhci,
 			num_stream_ctxs, &stream_info->ctx_array_dma,
 			mem_flags);
 	if (!stream_info->stream_ctx_array)
-		goto cleanup_ctx;
+		goto cleanup_ring_array;
 	memset(stream_info->stream_ctx_array, 0,
 			sizeof(struct xhci_stream_ctx)*num_stream_ctxs);
 
@@ -702,6 +702,11 @@ struct xhci_stream_info *xhci_alloc_stream_info(struct xhci_hcd *xhci,
 	}
 	xhci_free_command(xhci, stream_info->free_streams_command);
 cleanup_ctx:
+	xhci_free_stream_ctx(xhci,
+		stream_info->num_stream_ctxs,
+		stream_info->stream_ctx_array,
+		stream_info->ctx_array_dma);
+cleanup_ring_array:
 	kfree(stream_info->stream_rings);
 cleanup_info:
 	kfree(stream_info);
-- 
2.25.1

