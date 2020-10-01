Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB1827F6D6
	for <lists+linux-usb@lfdr.de>; Thu,  1 Oct 2020 02:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731620AbgJAAoW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Sep 2020 20:44:22 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:55872 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731339AbgJAAoV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Sep 2020 20:44:21 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2433FC07AC;
        Thu,  1 Oct 2020 00:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1601513061; bh=C1i18HhTqcOBBY5KMc2PThgsWna5b6k9srAXBCru+pU=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=ElCDQP5ACojZOGUjmM5SIwdaxsgWpw7lWiB8XXnG/MhYtB8xkVajZmwZs5QP8Petu
         /1XUiLdbyhZ2wBwXFQ/vyfuUAySN5a+aBwmCjg/d62uYlI/I7EfLQCatDoQHIsj88G
         6uTpIAPVVy4a2HTp5lwt6Wpe6RIRCTwcyujMOOoIQD8eMXXgtLXGfFark9JtzkqeUV
         wzsSWjblIR45KSKIGbqDF4on6evkekoEFu+5I6XWumGectk2MBEubkndvFKiGuzgyt
         +p6uPkOpqcH3RaajO5UJqtzSidGY6oTFhYVUq/xRdOJdoo6XE/I7z63hJ2f7s15NSB
         brMzF0UYs3Tag==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id B00D0A01F1;
        Thu,  1 Oct 2020 00:44:19 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 30 Sep 2020 17:44:19 -0700
Date:   Wed, 30 Sep 2020 17:44:19 -0700
Message-Id: <47c8050ffbf1f7747969a46ef7f04babbc736c29.1601511883.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1601511883.git.Thinh.Nguyen@synopsys.com>
References: <cover.1601511883.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 1/4] usb: dwc3: gadget: Look ahead when setting IOC
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Previously if we run out of TRBs for the last SG entry that requires
an extra TRB, we set interrupt-on-completion (IOC) bit to an already
prepared TRB (i.e. HWO=1). This logic is not clean, and it's not a
typical way to prepare TRB. Also, this prevents showing IOC setup in
tracepoint when __dwc3_prepare_one_trb() is executed. Instead, let's
look ahead when preparing TRB to know whether to set the IOC bit before
the last SG entry. This requires adding a new parameter "must_interrupt"
to dwc3_prepare_one_trb().

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 72 +++++++++++++++++++++------------------
 1 file changed, 39 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 76c383eecfd3..0387b94b8f94 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -947,7 +947,7 @@ static void __dwc3_prepare_one_trb(struct dwc3_ep *dep, struct dwc3_trb *trb,
 		dma_addr_t dma, unsigned int length, unsigned int chain,
 		unsigned int node, unsigned int stream_id,
 		unsigned int short_not_ok, unsigned int no_interrupt,
-		unsigned int is_last)
+		unsigned int is_last, bool must_interrupt)
 {
 	struct dwc3		*dwc = dep->dwc;
 	struct usb_gadget	*gadget = dwc->gadget;
@@ -1034,7 +1034,7 @@ static void __dwc3_prepare_one_trb(struct dwc3_ep *dep, struct dwc3_trb *trb,
 			trb->ctrl |= DWC3_TRB_CTRL_ISP_IMI;
 	}
 
-	if ((!no_interrupt && !chain) ||
+	if ((!no_interrupt && !chain) || must_interrupt ||
 			(dwc3_calc_trbs_left(dep) == 1))
 		trb->ctrl |= DWC3_TRB_CTRL_IOC;
 
@@ -1061,10 +1061,12 @@ static void __dwc3_prepare_one_trb(struct dwc3_ep *dep, struct dwc3_trb *trb,
  * @chain: should this TRB be chained to the next?
  * @node: only for isochronous endpoints. First TRB needs different type.
  * @use_bounce_buffer: set to use bounce buffer
+ * @must_interrupt: set to interrupt on TRB completion
  */
 static void dwc3_prepare_one_trb(struct dwc3_ep *dep,
 		struct dwc3_request *req, unsigned int trb_length,
-		unsigned int chain, unsigned int node, bool use_bounce_buffer)
+		unsigned int chain, unsigned int node, bool use_bounce_buffer,
+		bool must_interrupt)
 {
 	struct dwc3_trb		*trb;
 	dma_addr_t		dma;
@@ -1091,7 +1093,21 @@ static void dwc3_prepare_one_trb(struct dwc3_ep *dep,
 	req->num_trbs++;
 
 	__dwc3_prepare_one_trb(dep, trb, dma, trb_length, chain, node,
-			stream_id, short_not_ok, no_interrupt, is_last);
+			stream_id, short_not_ok, no_interrupt, is_last,
+			must_interrupt);
+}
+
+static bool dwc3_needs_extra_trb(struct dwc3_ep *dep, struct dwc3_request *req)
+{
+	unsigned int maxp = usb_endpoint_maxp(dep->endpoint.desc);
+	unsigned int rem = req->request.length % maxp;
+
+	if ((req->request.length && req->request.zero && !rem &&
+			!usb_endpoint_xfer_isoc(dep->endpoint.desc)) ||
+			(!req->direction && rem))
+		return true;
+
+	return false;
 }
 
 /**
@@ -1111,9 +1127,7 @@ static int dwc3_prepare_last_sg(struct dwc3_ep *dep,
 	unsigned int rem = req->request.length % maxp;
 	unsigned int num_trbs = 1;
 
-	if ((req->request.length && req->request.zero && !rem &&
-			!usb_endpoint_xfer_isoc(dep->endpoint.desc)) ||
-			(!req->direction && rem))
+	if (dwc3_needs_extra_trb(dep, req))
 		num_trbs++;
 
 	if (dwc3_calc_trbs_left(dep) < num_trbs)
@@ -1124,13 +1138,13 @@ static int dwc3_prepare_last_sg(struct dwc3_ep *dep,
 	/* Prepare a normal TRB */
 	if (req->direction || req->request.length)
 		dwc3_prepare_one_trb(dep, req, entry_length,
-				req->needs_extra_trb, node, false);
+				req->needs_extra_trb, node, false, false);
 
 	/* Prepare extra TRBs for ZLP and MPS OUT transfer alignment */
 	if ((!req->direction && !req->request.length) || req->needs_extra_trb)
 		dwc3_prepare_one_trb(dep, req,
 				req->direction ? 0 : maxp - rem,
-				false, 1, true);
+				false, 1, true, false);
 
 	return num_trbs;
 }
@@ -1145,6 +1159,7 @@ static int dwc3_prepare_trbs_sg(struct dwc3_ep *dep,
 	unsigned int remaining = req->request.num_mapped_sgs
 		- req->num_queued_sgs;
 	unsigned int num_trbs = req->num_trbs;
+	bool needs_extra_trb = dwc3_needs_extra_trb(dep, req);
 
 	/*
 	 * If we resume preparing the request, then get the remaining length of
@@ -1155,6 +1170,7 @@ static int dwc3_prepare_trbs_sg(struct dwc3_ep *dep,
 
 	for_each_sg(sg, s, remaining, i) {
 		unsigned int trb_length;
+		bool must_interrupt = false;
 		bool last_sg = false;
 
 		trb_length = min_t(unsigned int, length, sg_dma_len(s));
@@ -1176,9 +1192,20 @@ static int dwc3_prepare_trbs_sg(struct dwc3_ep *dep,
 
 		if (last_sg) {
 			if (!dwc3_prepare_last_sg(dep, req, trb_length, i))
-				goto out;
+				break;
 		} else {
-			dwc3_prepare_one_trb(dep, req, trb_length, 1, i, false);
+			/*
+			 * Look ahead to check if we have enough TRBs for the
+			 * last SG entry. If not, set interrupt on this TRB to
+			 * resume preparing the last SG entry when more TRBs are
+			 * free.
+			 */
+			if (needs_extra_trb && dwc3_calc_trbs_left(dep) <= 2 &&
+					sg_dma_len(sg_next(s)) >= length)
+				must_interrupt = true;
+
+			dwc3_prepare_one_trb(dep, req, trb_length, 1, i, false,
+					must_interrupt);
 		}
 
 		/*
@@ -1203,31 +1230,10 @@ static int dwc3_prepare_trbs_sg(struct dwc3_ep *dep,
 			break;
 		}
 
-		if (!dwc3_calc_trbs_left(dep))
+		if (!dwc3_calc_trbs_left(dep) || must_interrupt)
 			break;
 	}
 
-	return req->num_trbs - num_trbs;
-
-out:
-	/*
-	 * If we run out of TRBs for MPS alignment setup, then set IOC on the
-	 * previous TRB to get notified for TRB completion to resume when more
-	 * TRBs are available.
-	 *
-	 * Note: normally we shouldn't update the TRB after the HWO bit is set.
-	 * However, the controller doesn't update its internal cache to handle
-	 * the newly prepared TRBs until UPDATE_TRANSFER or START_TRANSFER
-	 * command is executed. At this point, it doesn't happen yet, so we
-	 * should be fine modifying it here.
-	 */
-	if (i) {
-		struct dwc3_trb	*trb;
-
-		trb = dwc3_ep_prev_trb(dep, dep->trb_enqueue);
-		trb->ctrl |= DWC3_TRB_CTRL_IOC;
-	}
-
 	return req->num_trbs - num_trbs;
 }
 
-- 
2.28.0

