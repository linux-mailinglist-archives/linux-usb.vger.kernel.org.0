Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0401163D19B
	for <lists+linux-usb@lfdr.de>; Wed, 30 Nov 2022 10:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232809AbiK3JSd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Nov 2022 04:18:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232606AbiK3JSZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Nov 2022 04:18:25 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5213A45A17
        for <linux-usb@vger.kernel.org>; Wed, 30 Nov 2022 01:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669799904; x=1701335904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f+olfHVWLYLSBmpEuHjX0mkPJmfiix4o9GVabHZAKZI=;
  b=HFbXf/BkC0uC9mGI6ylBy8rL4RZD+l2pqK67oeE/F7i+STRNFCl8RO1q
   c4c2c84kxbTKdJysbf971/ZA1KJ24zS5G4KmHCb0cW8vpf8LgYrF8GyTY
   GZPisMTGY+KfWQGyJozOgcIbfCXzOzQUYQtWa7nWXIZ702nFArR6I6FBC
   KX08rOeXGoAINzXFJOyInk96qVxgE3UF4/j4XFzveP/r9bN5Y2jDEsFA1
   FHZdFXo0kI2e1Y3/cbI3ZnBdPsCQYkjgfxSvSLFFGwrSjLkFfu9dCHrDl
   rFQvuedFNnICdRe0yxqIDHcZ4bqbPEnR+mqDb6fERp2p3gdMRyCirilI/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="295711304"
X-IronPort-AV: E=Sophos;i="5.96,205,1665471600"; 
   d="scan'208";a="295711304"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 01:18:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="674962729"
X-IronPort-AV: E=Sophos;i="5.96,205,1665471600"; 
   d="scan'208";a="674962729"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga008.jf.intel.com with ESMTP; 30 Nov 2022 01:18:22 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 6/6] xhci: remove unused stream_id parameter from xhci_handle_halted_endpoint()
Date:   Wed, 30 Nov 2022 11:19:44 +0200
Message-Id: <20221130091944.2171610-7-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221130091944.2171610-1-mathias.nyman@linux.intel.com>
References: <20221130091944.2171610-1-mathias.nyman@linux.intel.com>
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

The stream_id parameter is no longer used when handling halted endpoints.
Remove it

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 039ec9734fcd..ddc30037f9ce 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -896,7 +896,7 @@ static int xhci_reset_halted_ep(struct xhci_hcd *xhci, unsigned int slot_id,
 }
 
 static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
-				struct xhci_virt_ep *ep, unsigned int stream_id,
+				struct xhci_virt_ep *ep,
 				struct xhci_td *td,
 				enum xhci_ep_reset_type reset_type)
 {
@@ -1110,8 +1110,7 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 					td->status = -EPROTO;
 			}
 			/* reset ep, reset handler cleans up cancelled tds */
-			err = xhci_handle_halted_endpoint(xhci, ep, 0, td,
-							  reset_type);
+			err = xhci_handle_halted_endpoint(xhci, ep, td, reset_type);
 			if (err)
 				break;
 			ep->ep_state &= ~EP_STOP_CMD_PENDING;
@@ -2183,8 +2182,7 @@ static int finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		}
 		/* Almost same procedure as for STALL_ERROR below */
 		xhci_clear_hub_tt_buffer(xhci, td, ep);
-		xhci_handle_halted_endpoint(xhci, ep, ep_ring->stream_id, td,
-					    EP_HARD_RESET);
+		xhci_handle_halted_endpoint(xhci, ep, td, EP_HARD_RESET);
 		return 0;
 	case COMP_STALL_ERROR:
 		/*
@@ -2200,8 +2198,7 @@ static int finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		if (ep->ep_index != 0)
 			xhci_clear_hub_tt_buffer(xhci, td, ep);
 
-		xhci_handle_halted_endpoint(xhci, ep, ep_ring->stream_id, td,
-					    EP_HARD_RESET);
+		xhci_handle_halted_endpoint(xhci, ep, td, EP_HARD_RESET);
 
 		return 0; /* xhci_handle_halted_endpoint marked td cancelled */
 	default:
@@ -2490,8 +2487,7 @@ static int process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 
 		td->status = 0;
 
-		xhci_handle_halted_endpoint(xhci, ep, ep_ring->stream_id, td,
-					    EP_SOFT_RESET);
+		xhci_handle_halted_endpoint(xhci, ep, td, EP_SOFT_RESET);
 		return 0;
 	default:
 		/* do nothing */
@@ -2568,10 +2564,10 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 			xhci_dbg(xhci, "Stream transaction error ep %u no id\n",
 				 ep_index);
 			if (ep->err_count++ > MAX_SOFT_RETRY)
-				xhci_handle_halted_endpoint(xhci, ep, 0, NULL,
+				xhci_handle_halted_endpoint(xhci, ep, NULL,
 							    EP_HARD_RESET);
 			else
-				xhci_handle_halted_endpoint(xhci, ep, 0, NULL,
+				xhci_handle_halted_endpoint(xhci, ep, NULL,
 							    EP_SOFT_RESET);
 			goto cleanup;
 		case COMP_RING_UNDERRUN:
@@ -2755,9 +2751,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 			if (trb_comp_code == COMP_STALL_ERROR ||
 			    xhci_requires_manual_halt_cleanup(xhci, ep_ctx,
 							      trb_comp_code)) {
-				xhci_handle_halted_endpoint(xhci, ep,
-							    ep_ring->stream_id,
-							    NULL,
+				xhci_handle_halted_endpoint(xhci, ep, NULL,
 							    EP_HARD_RESET);
 			}
 			goto cleanup;
@@ -2850,9 +2844,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 			if (trb_comp_code == COMP_STALL_ERROR ||
 			    xhci_requires_manual_halt_cleanup(xhci, ep_ctx,
 							      trb_comp_code))
-				xhci_handle_halted_endpoint(xhci, ep,
-							    ep_ring->stream_id,
-							    td, EP_HARD_RESET);
+				xhci_handle_halted_endpoint(xhci, ep, td,
+							    EP_HARD_RESET);
 			goto cleanup;
 		}
 
-- 
2.25.1

