Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3BC68810A
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 16:05:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbjBBPFk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 10:05:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbjBBPFj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 10:05:39 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96C1C921AB
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 07:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675350305; x=1706886305;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GEXkJI2/fCYhf0vShxdCqS4kcr54G40U5PelIHSnDR0=;
  b=LIypkaYDKMHKHwr+QbP00CSZ21e+qFc/32Ge3UTlByMi9qQ/PYanLAqu
   Xmf4dGEifvaNGD/FyPJMnLMmm7fnkUca8uTt65z4cVMEycZJmakYyBGR0
   mYmNGVkyS+3Ltd8gp2IQ8EU464hqJKjX45VpEjAiD68+bOddKRc+2/W9o
   73Lh44X3+8bmE+D4fdefmidvfBfw239zKtUPT3S4gHt2eqQKZ0wlOpdP8
   iX0vq76ER9hRm90jc+0qKlSwFwU9XBsdXxC5UthMKsSHZBUIEairvtD8w
   zjwXfXLx0RHMb3VcuXko+ElE9m4iTGvWSq/j1F4Kr0qukHrBI+VVx9nm5
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="327113955"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="327113955"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 07:03:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="728905666"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="728905666"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga008.fm.intel.com with ESMTP; 02 Feb 2023 07:03:51 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 02/11] xhci: remove xhci_test_trb_in_td_math early development check
Date:   Thu,  2 Feb 2023 17:04:56 +0200
Message-Id: <20230202150505.618915-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230202150505.618915-1-mathias.nyman@linux.intel.com>
References: <20230202150505.618915-1-mathias.nyman@linux.intel.com>
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

Time to remove this test trb in td math check that was added
in early stage of xhci driver development.

It verified that the size, alignment and boundaries of the event and
command rings allocated by the driver itself are correct.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 160 ------------------------------------
 1 file changed, 160 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 679befa97c7a..bf9bb29f924b 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1929,164 +1929,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci->usb3_rhub.bus_state.bus_suspended = 0;
 }
 
-static int xhci_test_trb_in_td(struct xhci_hcd *xhci,
-		struct xhci_segment *input_seg,
-		union xhci_trb *start_trb,
-		union xhci_trb *end_trb,
-		dma_addr_t input_dma,
-		struct xhci_segment *result_seg,
-		char *test_name, int test_number)
-{
-	unsigned long long start_dma;
-	unsigned long long end_dma;
-	struct xhci_segment *seg;
-
-	start_dma = xhci_trb_virt_to_dma(input_seg, start_trb);
-	end_dma = xhci_trb_virt_to_dma(input_seg, end_trb);
-
-	seg = trb_in_td(xhci, input_seg, start_trb, end_trb, input_dma, false);
-	if (seg != result_seg) {
-		xhci_warn(xhci, "WARN: %s TRB math test %d failed!\n",
-				test_name, test_number);
-		xhci_warn(xhci, "Tested TRB math w/ seg %p and "
-				"input DMA 0x%llx\n",
-				input_seg,
-				(unsigned long long) input_dma);
-		xhci_warn(xhci, "starting TRB %p (0x%llx DMA), "
-				"ending TRB %p (0x%llx DMA)\n",
-				start_trb, start_dma,
-				end_trb, end_dma);
-		xhci_warn(xhci, "Expected seg %p, got seg %p\n",
-				result_seg, seg);
-		trb_in_td(xhci, input_seg, start_trb, end_trb, input_dma,
-			  true);
-		return -1;
-	}
-	return 0;
-}
-
-/* TRB math checks for xhci_trb_in_td(), using the command and event rings. */
-static int xhci_check_trb_in_td_math(struct xhci_hcd *xhci)
-{
-	struct {
-		dma_addr_t		input_dma;
-		struct xhci_segment	*result_seg;
-	} simple_test_vector [] = {
-		/* A zeroed DMA field should fail */
-		{ 0, NULL },
-		/* One TRB before the ring start should fail */
-		{ xhci->event_ring->first_seg->dma - 16, NULL },
-		/* One byte before the ring start should fail */
-		{ xhci->event_ring->first_seg->dma - 1, NULL },
-		/* Starting TRB should succeed */
-		{ xhci->event_ring->first_seg->dma, xhci->event_ring->first_seg },
-		/* Ending TRB should succeed */
-		{ xhci->event_ring->first_seg->dma + (TRBS_PER_SEGMENT - 1)*16,
-			xhci->event_ring->first_seg },
-		/* One byte after the ring end should fail */
-		{ xhci->event_ring->first_seg->dma + (TRBS_PER_SEGMENT - 1)*16 + 1, NULL },
-		/* One TRB after the ring end should fail */
-		{ xhci->event_ring->first_seg->dma + (TRBS_PER_SEGMENT)*16, NULL },
-		/* An address of all ones should fail */
-		{ (dma_addr_t) (~0), NULL },
-	};
-	struct {
-		struct xhci_segment	*input_seg;
-		union xhci_trb		*start_trb;
-		union xhci_trb		*end_trb;
-		dma_addr_t		input_dma;
-		struct xhci_segment	*result_seg;
-	} complex_test_vector [] = {
-		/* Test feeding a valid DMA address from a different ring */
-		{	.input_seg = xhci->event_ring->first_seg,
-			.start_trb = xhci->event_ring->first_seg->trbs,
-			.end_trb = &xhci->event_ring->first_seg->trbs[TRBS_PER_SEGMENT - 1],
-			.input_dma = xhci->cmd_ring->first_seg->dma,
-			.result_seg = NULL,
-		},
-		/* Test feeding a valid end TRB from a different ring */
-		{	.input_seg = xhci->event_ring->first_seg,
-			.start_trb = xhci->event_ring->first_seg->trbs,
-			.end_trb = &xhci->cmd_ring->first_seg->trbs[TRBS_PER_SEGMENT - 1],
-			.input_dma = xhci->cmd_ring->first_seg->dma,
-			.result_seg = NULL,
-		},
-		/* Test feeding a valid start and end TRB from a different ring */
-		{	.input_seg = xhci->event_ring->first_seg,
-			.start_trb = xhci->cmd_ring->first_seg->trbs,
-			.end_trb = &xhci->cmd_ring->first_seg->trbs[TRBS_PER_SEGMENT - 1],
-			.input_dma = xhci->cmd_ring->first_seg->dma,
-			.result_seg = NULL,
-		},
-		/* TRB in this ring, but after this TD */
-		{	.input_seg = xhci->event_ring->first_seg,
-			.start_trb = &xhci->event_ring->first_seg->trbs[0],
-			.end_trb = &xhci->event_ring->first_seg->trbs[3],
-			.input_dma = xhci->event_ring->first_seg->dma + 4*16,
-			.result_seg = NULL,
-		},
-		/* TRB in this ring, but before this TD */
-		{	.input_seg = xhci->event_ring->first_seg,
-			.start_trb = &xhci->event_ring->first_seg->trbs[3],
-			.end_trb = &xhci->event_ring->first_seg->trbs[6],
-			.input_dma = xhci->event_ring->first_seg->dma + 2*16,
-			.result_seg = NULL,
-		},
-		/* TRB in this ring, but after this wrapped TD */
-		{	.input_seg = xhci->event_ring->first_seg,
-			.start_trb = &xhci->event_ring->first_seg->trbs[TRBS_PER_SEGMENT - 3],
-			.end_trb = &xhci->event_ring->first_seg->trbs[1],
-			.input_dma = xhci->event_ring->first_seg->dma + 2*16,
-			.result_seg = NULL,
-		},
-		/* TRB in this ring, but before this wrapped TD */
-		{	.input_seg = xhci->event_ring->first_seg,
-			.start_trb = &xhci->event_ring->first_seg->trbs[TRBS_PER_SEGMENT - 3],
-			.end_trb = &xhci->event_ring->first_seg->trbs[1],
-			.input_dma = xhci->event_ring->first_seg->dma + (TRBS_PER_SEGMENT - 4)*16,
-			.result_seg = NULL,
-		},
-		/* TRB not in this ring, and we have a wrapped TD */
-		{	.input_seg = xhci->event_ring->first_seg,
-			.start_trb = &xhci->event_ring->first_seg->trbs[TRBS_PER_SEGMENT - 3],
-			.end_trb = &xhci->event_ring->first_seg->trbs[1],
-			.input_dma = xhci->cmd_ring->first_seg->dma + 2*16,
-			.result_seg = NULL,
-		},
-	};
-
-	unsigned int num_tests;
-	int i, ret;
-
-	num_tests = ARRAY_SIZE(simple_test_vector);
-	for (i = 0; i < num_tests; i++) {
-		ret = xhci_test_trb_in_td(xhci,
-				xhci->event_ring->first_seg,
-				xhci->event_ring->first_seg->trbs,
-				&xhci->event_ring->first_seg->trbs[TRBS_PER_SEGMENT - 1],
-				simple_test_vector[i].input_dma,
-				simple_test_vector[i].result_seg,
-				"Simple", i);
-		if (ret < 0)
-			return ret;
-	}
-
-	num_tests = ARRAY_SIZE(complex_test_vector);
-	for (i = 0; i < num_tests; i++) {
-		ret = xhci_test_trb_in_td(xhci,
-				complex_test_vector[i].input_seg,
-				complex_test_vector[i].start_trb,
-				complex_test_vector[i].end_trb,
-				complex_test_vector[i].input_dma,
-				complex_test_vector[i].result_seg,
-				"Complex", i);
-		if (ret < 0)
-			return ret;
-	}
-	xhci_dbg(xhci, "TRB math tests passed.\n");
-	return 0;
-}
-
 static void xhci_set_hc_event_deq(struct xhci_hcd *xhci)
 {
 	u64 temp;
@@ -2506,8 +2348,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 					0, flags);
 	if (!xhci->event_ring)
 		goto fail;
-	if (xhci_check_trb_in_td_math(xhci) < 0)
-		goto fail;
 
 	ret = xhci_alloc_erst(xhci, xhci->event_ring, &xhci->erst, flags);
 	if (ret)
-- 
2.25.1

