Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E97BC720494
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 16:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236016AbjFBOi6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jun 2023 10:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235054AbjFBOi4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jun 2023 10:38:56 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A9D1A7
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 07:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685716736; x=1717252736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lQ3OiAlNbXTGe/TqIU7sck5WWHAuec1i+TYH1O93SlU=;
  b=I9+QMY7L01oy8E60tHiUhJN8mJ/D2ZC40A7PRTHcETUnDJL9xds55SqD
   3peZbTXngGlwn8C/6XAkXo8IY7f/R0CJN/k3f3ZvBXCDPR0C+Mkx+q6gi
   Hn1dPYBiqIIm667ZyRGEw7go39aV5h/h8IS56hkYvMC2nnbRTdrWm+RkB
   A3gQIJioj+QEsQcI8jb76GPvFaHL98uQr8MNiA11/M3V4tYkTggf24nfZ
   pXoPBaS7w+EAPNx9KRzXX/c8uT49uPOHa27OjgTfhBogJjvAnizdMwct6
   3NRMabss2UVN86QQpAJ9XuwAzEP8bhZaOuUhaJVtmcV2ey+Unk4Rjn7yL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="358311214"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="358311214"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 07:38:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="707877436"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="707877436"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga002.jf.intel.com with ESMTP; 02 Jun 2023 07:38:53 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Udipto Goswami <quic_ugoswami@quicinc.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 01/11] usb: xhci: Remove unused udev from xhci_log_ctx trace event
Date:   Fri,  2 Jun 2023 17:39:59 +0300
Message-Id: <20230602144009.1225632-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230602144009.1225632-1-mathias.nyman@linux.intel.com>
References: <20230602144009.1225632-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Udipto Goswami <quic_ugoswami@quicinc.com>

xhci_log_ctx event is not utilizing the extracted udev to
print out anything, hence removing it.

Fixes: 1d27fabec068 ("xhci: add xhci_address_ctx trace event")
Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-trace.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index 4286dba5b157..7555c4ea7c4b 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -80,20 +80,16 @@ DECLARE_EVENT_CLASS(xhci_log_ctx,
 		__field(dma_addr_t, ctx_dma)
 		__field(u8 *, ctx_va)
 		__field(unsigned, ctx_ep_num)
-		__field(int, slot_id)
 		__dynamic_array(u32, ctx_data,
 			((HCC_64BYTE_CONTEXT(xhci->hcc_params) + 1) * 8) *
 			((ctx->type == XHCI_CTX_TYPE_INPUT) + ep_num + 1))
 	),
 	TP_fast_assign(
-		struct usb_device *udev;
 
-		udev = to_usb_device(xhci_to_hcd(xhci)->self.controller);
 		__entry->ctx_64 = HCC_64BYTE_CONTEXT(xhci->hcc_params);
 		__entry->ctx_type = ctx->type;
 		__entry->ctx_dma = ctx->dma;
 		__entry->ctx_va = ctx->bytes;
-		__entry->slot_id = udev->slot_id;
 		__entry->ctx_ep_num = ep_num;
 		memcpy(__get_dynamic_array(ctx_data), ctx->bytes,
 			((HCC_64BYTE_CONTEXT(xhci->hcc_params) + 1) * 32) *
-- 
2.25.1

