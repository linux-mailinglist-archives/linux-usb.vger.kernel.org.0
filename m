Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52108276BA8
	for <lists+linux-usb@lfdr.de>; Thu, 24 Sep 2020 10:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727268AbgIXIVc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 04:21:32 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:40364 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727265AbgIXIVc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 04:21:32 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 08BAE401AA;
        Thu, 24 Sep 2020 08:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1600935692; bh=dqHUPplraHZeVjkJ+HRF3MCQmDTuBVDEFzE0+gIxUAo=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=bTxvw80ALmkQMvRoZbEf3yIYIytqCGFscJ9gDC9Yo67cfMELx+8S8sSgdNG4eRvL4
         UsVC9nZzngHUlBCyraf+0plTYfzZ2ZHQrSUlMJrrBlBLogHp2Z8I0PqPwdbQ7Ily5r
         +tSxhcPWTlY2MUDZxi7aeoE+URJx/pNiVEndQMKWiVPF9+Yccyfe6B9CVVB2wLbUjv
         syqREJ6+0w05E1NojwnA4rkj7/8PQmO6dxqorXer041VM8Y3pcXDekhpM0noaB70r3
         VqW4NZ9c8IewCSRoe+lKhUdqfckEeU96WM7840qHIo1k4leQBGOukPXx294R/SeJ2u
         EVwE7CrKJUimw==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id A6D59A0099;
        Thu, 24 Sep 2020 08:21:30 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 24 Sep 2020 01:21:30 -0700
Date:   Thu, 24 Sep 2020 01:21:30 -0700
Message-Id: <f440a675bb5ca2d3e61fa5fb9287eaf30244e28e.1600935293.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1600935293.git.Thinh.Nguyen@synopsys.com>
References: <cover.1600935293.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 03/10] usb: dwc3: gadget: Refactor preparing extra TRB
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the driver prepares the extra TRB, it uses bounce buffer. If we
just add a new parameter to dwc3_prepare_one_trb() to indicate this,
then we can refactor and simplify the driver quite a bit.
dwc3_prepare_one_trb() also checks if a request had been moved to the
started list. This is a prerequisite to subsequence patches improving
the handling of extra TRBs.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 93 +++++++++++----------------------------
 1 file changed, 25 insertions(+), 68 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 6017263929f3..c0309ad34d28 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1060,10 +1060,11 @@ static void __dwc3_prepare_one_trb(struct dwc3_ep *dep, struct dwc3_trb *trb,
  * @trb_length: buffer size of the TRB
  * @chain: should this TRB be chained to the next?
  * @node: only for isochronous endpoints. First TRB needs different type.
+ * @use_bounce_buffer: set to use bounce buffer
  */
 static void dwc3_prepare_one_trb(struct dwc3_ep *dep,
 		struct dwc3_request *req, unsigned int trb_length,
-		unsigned int chain, unsigned int node)
+		unsigned int chain, unsigned int node, bool use_bounce_buffer)
 {
 	struct dwc3_trb		*trb;
 	dma_addr_t		dma;
@@ -1072,7 +1073,9 @@ static void dwc3_prepare_one_trb(struct dwc3_ep *dep,
 	unsigned int		no_interrupt = req->request.no_interrupt;
 	unsigned int		is_last = req->request.is_last;
 
-	if (req->request.num_sgs > 0)
+	if (use_bounce_buffer)
+		dma = dep->dwc->bounce_addr;
+	else if (req->request.num_sgs > 0)
 		dma = sg_dma_address(req->start_sg);
 	else
 		dma = req->request.dma;
@@ -1129,56 +1132,35 @@ static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 			chain = false;
 
 		if (rem && usb_endpoint_dir_out(dep->endpoint.desc) && !chain) {
-			struct dwc3	*dwc = dep->dwc;
-			struct dwc3_trb	*trb;
-
 			req->needs_extra_trb = true;
 
 			/* prepare normal TRB */
-			dwc3_prepare_one_trb(dep, req, trb_length, true, i);
+			dwc3_prepare_one_trb(dep, req, trb_length,
+					true, i, false);
 
 			/* Now prepare one extra TRB to align transfer size */
-			trb = &dep->trb_pool[dep->trb_enqueue];
-			req->num_trbs++;
-			__dwc3_prepare_one_trb(dep, trb, dwc->bounce_addr,
-					maxp - rem, false, 1,
-					req->request.stream_id,
-					req->request.short_not_ok,
-					req->request.no_interrupt,
-					req->request.is_last);
+			dwc3_prepare_one_trb(dep, req, maxp - rem,
+					false, 1, true);
 		} else if (req->request.zero && req->request.length &&
 			   !usb_endpoint_xfer_isoc(dep->endpoint.desc) &&
 			   !rem && !chain) {
-			struct dwc3	*dwc = dep->dwc;
-			struct dwc3_trb	*trb;
-
 			req->needs_extra_trb = true;
 
 			/* Prepare normal TRB */
-			dwc3_prepare_one_trb(dep, req, trb_length, true, i);
+			dwc3_prepare_one_trb(dep, req, trb_length,
+					true, i, false);
 
 			/* Prepare one extra TRB to handle ZLP */
-			trb = &dep->trb_pool[dep->trb_enqueue];
-			req->num_trbs++;
-			__dwc3_prepare_one_trb(dep, trb, dwc->bounce_addr, 0,
-					       !req->direction, 1,
-					       req->request.stream_id,
-					       req->request.short_not_ok,
-					       req->request.no_interrupt,
-					       req->request.is_last);
+			dwc3_prepare_one_trb(dep, req, 0,
+					!req->direction, 1, true);
 
 			/* Prepare one more TRB to handle MPS alignment */
-			if (!req->direction) {
-				trb = &dep->trb_pool[dep->trb_enqueue];
-				req->num_trbs++;
-				__dwc3_prepare_one_trb(dep, trb, dwc->bounce_addr, maxp,
-						       false, 1, req->request.stream_id,
-						       req->request.short_not_ok,
-						       req->request.no_interrupt,
-						       req->request.is_last);
-			}
+			if (!req->direction)
+				dwc3_prepare_one_trb(dep, req, maxp,
+						false, 1, true);
 		} else {
-			dwc3_prepare_one_trb(dep, req, trb_length, chain, i);
+			dwc3_prepare_one_trb(dep, req, trb_length,
+					chain, i, false);
 		}
 
 		/*
@@ -1216,54 +1198,29 @@ static void dwc3_prepare_one_trb_linear(struct dwc3_ep *dep,
 	unsigned int rem = length % maxp;
 
 	if ((!length || rem) && usb_endpoint_dir_out(dep->endpoint.desc)) {
-		struct dwc3	*dwc = dep->dwc;
-		struct dwc3_trb	*trb;
-
 		req->needs_extra_trb = true;
 
 		/* prepare normal TRB */
-		dwc3_prepare_one_trb(dep, req, length, true, 0);
+		dwc3_prepare_one_trb(dep, req, length, true, 0, false);
 
 		/* Now prepare one extra TRB to align transfer size */
-		trb = &dep->trb_pool[dep->trb_enqueue];
-		req->num_trbs++;
-		__dwc3_prepare_one_trb(dep, trb, dwc->bounce_addr, maxp - rem,
-				false, 1, req->request.stream_id,
-				req->request.short_not_ok,
-				req->request.no_interrupt,
-				req->request.is_last);
+		dwc3_prepare_one_trb(dep, req, maxp - rem, false, 1, true);
 	} else if (req->request.zero && req->request.length &&
 		   !usb_endpoint_xfer_isoc(dep->endpoint.desc) &&
 		   (IS_ALIGNED(req->request.length, maxp))) {
-		struct dwc3	*dwc = dep->dwc;
-		struct dwc3_trb	*trb;
-
 		req->needs_extra_trb = true;
 
 		/* prepare normal TRB */
-		dwc3_prepare_one_trb(dep, req, length, true, 0);
+		dwc3_prepare_one_trb(dep, req, length, true, 0, false);
 
 		/* Prepare one extra TRB to handle ZLP */
-		trb = &dep->trb_pool[dep->trb_enqueue];
-		req->num_trbs++;
-		__dwc3_prepare_one_trb(dep, trb, dwc->bounce_addr, 0,
-				!req->direction, 1, req->request.stream_id,
-				req->request.short_not_ok,
-				req->request.no_interrupt,
-				req->request.is_last);
+		dwc3_prepare_one_trb(dep, req, 0, !req->direction, 1, true);
 
 		/* Prepare one more TRB to handle MPS alignment for OUT */
-		if (!req->direction) {
-			trb = &dep->trb_pool[dep->trb_enqueue];
-			req->num_trbs++;
-			__dwc3_prepare_one_trb(dep, trb, dwc->bounce_addr, maxp,
-					       false, 1, req->request.stream_id,
-					       req->request.short_not_ok,
-					       req->request.no_interrupt,
-					       req->request.is_last);
-		}
+		if (!req->direction)
+			dwc3_prepare_one_trb(dep, req, maxp, false, 1, true);
 	} else {
-		dwc3_prepare_one_trb(dep, req, length, false, 0);
+		dwc3_prepare_one_trb(dep, req, length, false, 0, false);
 	}
 }
 
-- 
2.28.0

