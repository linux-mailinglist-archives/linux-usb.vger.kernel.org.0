Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F24623D4D5
	for <lists+linux-usb@lfdr.de>; Thu,  6 Aug 2020 02:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgHFApR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Aug 2020 20:45:17 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:35930 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726524AbgHFApM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Aug 2020 20:45:12 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 660BF4010A;
        Thu,  6 Aug 2020 00:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1596674711; bh=E9/ce8z2b6XrMqHaDqROB8cslV/6jQSH9geuyWDaWsY=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=Id1pjZPjkWi8BECtNIOTHREMdKO9CN1U42vtkL0t9Fm1L9PuqGxPu87s4Fhrx63CI
         cxIVKct8vT7Ef2zS3SIeJrAp9H2k3U4h4UQo3Xc3di6rjBcXcIOZeX96vrZRj28uEu
         8h+87QLYozSLk+aIqOZ+Y5wCP4FNCHARBz4WHZsvDDxucyfcVnJ0ies80Q6gW3AxYO
         Zi2fR0B6BaQk7B7hp5pmKLf9Iu+TAb9GOjVIAINhdmnDvF10+8G9Gg8V54hQM/gfNK
         96LNsJo1oZGd01i6m72CKsmZV/vsAdN9qmfcgMmgluLNsg2wjhu8ufPoMIDg2lZ+tK
         NkzjXn0AJqtRQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 4AB84A006F;
        Thu,  6 Aug 2020 00:45:10 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 05 Aug 2020 17:45:10 -0700
Date:   Wed, 05 Aug 2020 17:45:10 -0700
Message-Id: <6edf79575ee98732714e916111730a87e017f262.1596674377.git.thinhn@synopsys.com>
In-Reply-To: <cover.1596674377.git.thinhn@synopsys.com>
References: <cover.1596674377.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 4/7] usb: dwc3: gadget: Refactor preparing TRBs
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There are a lot of common codes for preparing SG and linear TRBs. Let's
refactor them for easier read. No functional change here.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 176 +++++++++++++++-----------------------
 1 file changed, 67 insertions(+), 109 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index ced229aeccec..dcadef105c2a 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1088,6 +1088,65 @@ static void dwc3_prepare_one_trb(struct dwc3_ep *dep,
 			stream_id, short_not_ok, no_interrupt, is_last);
 }
 
+/**
+ * dwc3_prepare_last_sg - prepare TRBs for the last SG entry
+ * @dep: The endpoint that the request belongs to
+ * @req: The request to prepare
+ * @entry_length: The last SG entry size
+ * @node: Indicates whether this is not the first entry (for isoc only)
+ */
+static void dwc3_prepare_last_sg(struct dwc3_ep *dep,
+				 struct dwc3_request *req,
+				 unsigned int entry_length,
+				 unsigned int node)
+{
+	unsigned int maxp = usb_endpoint_maxp(dep->endpoint.desc);
+	unsigned int rem = req->request.length % maxp;
+	unsigned int num_extra_trbs = 0;
+	unsigned int i;
+	bool do_zlp = false;
+
+	if (!usb_endpoint_xfer_isoc(dep->endpoint.desc) &&
+	    req->request.zero && req->request.length && !rem) {
+		num_extra_trbs++;
+		do_zlp = true;
+	}
+
+	if (!req->direction && (!req->request.length || rem || do_zlp))
+		num_extra_trbs++;
+
+	if (num_extra_trbs > 0)
+		req->needs_extra_trb = true;
+
+	/* Prepare a normal TRB */
+	dwc3_prepare_one_trb(dep, req, entry_length, req->needs_extra_trb, node);
+
+	/* Prepare extra TRBs for ZLP and MPS OUT transfer alignment */
+	for (i = 0; i < num_extra_trbs; i++) {
+		struct dwc3 *dwc = dep->dwc;
+		struct dwc3_trb	*trb;
+		unsigned int extra_trb_length;
+		bool chain = true;
+
+		if (do_zlp && !i)
+			extra_trb_length = 0;
+		else
+			extra_trb_length = maxp - rem;
+
+		if (i == num_extra_trbs - 1)
+			chain = false;
+
+		trb = &dep->trb_pool[dep->trb_enqueue];
+		req->num_trbs++;
+		__dwc3_prepare_one_trb(dep, trb, dwc->bounce_addr,
+				       extra_trb_length, chain, 1,
+				       req->request.stream_id,
+				       req->request.short_not_ok,
+				       req->request.no_interrupt,
+				       req->request.is_last);
+	}
+}
+
 static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 		struct dwc3_request *req)
 {
@@ -1103,7 +1162,7 @@ static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 		unsigned int maxp = usb_endpoint_maxp(dep->endpoint.desc);
 		unsigned int rem = length % maxp;
 		unsigned int trb_length;
-		unsigned chain = true;
+		bool last_sg = false;
 
 		trb_length = min_t(unsigned int, length, sg_dma_len(req->start_sg));
 
@@ -1117,60 +1176,12 @@ static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 		 * mapped sg.
 		 */
 		if ((i == remaining - 1) || !length)
-			chain = false;
+			last_sg = true;
 
-		if (rem && usb_endpoint_dir_out(dep->endpoint.desc) && !chain) {
-			struct dwc3	*dwc = dep->dwc;
-			struct dwc3_trb	*trb;
-
-			req->needs_extra_trb = true;
-
-			/* prepare normal TRB */
-			dwc3_prepare_one_trb(dep, req, trb_length, true, i);
-
-			/* Now prepare one extra TRB to align transfer size */
-			trb = &dep->trb_pool[dep->trb_enqueue];
-			req->num_trbs++;
-			__dwc3_prepare_one_trb(dep, trb, dwc->bounce_addr,
-					maxp - rem, false, 1,
-					req->request.stream_id,
-					req->request.short_not_ok,
-					req->request.no_interrupt,
-					req->request.is_last);
-		} else if (req->request.zero && req->request.length &&
-			   !usb_endpoint_xfer_isoc(dep->endpoint.desc) &&
-			   !rem && !chain) {
-			struct dwc3	*dwc = dep->dwc;
-			struct dwc3_trb	*trb;
-
-			req->needs_extra_trb = true;
-
-			/* Prepare normal TRB */
-			dwc3_prepare_one_trb(dep, req, trb_length, true, i);
-
-			/* Prepare one extra TRB to handle ZLP */
-			trb = &dep->trb_pool[dep->trb_enqueue];
-			req->num_trbs++;
-			__dwc3_prepare_one_trb(dep, trb, dwc->bounce_addr, 0,
-					       !req->direction, 1,
-					       req->request.stream_id,
-					       req->request.short_not_ok,
-					       req->request.no_interrupt,
-					       req->request.is_last);
-
-			/* Prepare one more TRB to handle MPS alignment */
-			if (!req->direction) {
-				trb = &dep->trb_pool[dep->trb_enqueue];
-				req->num_trbs++;
-				__dwc3_prepare_one_trb(dep, trb, dwc->bounce_addr, maxp,
-						       false, 1, req->request.stream_id,
-						       req->request.short_not_ok,
-						       req->request.no_interrupt,
-						       req->request.is_last);
-			}
-		} else {
-			dwc3_prepare_one_trb(dep, req, trb_length, chain, i);
-		}
+		if (last_sg)
+			dwc3_prepare_last_sg(dep, req, trb_length, i);
+		else
+			dwc3_prepare_one_trb(dep, req, trb_length, 1, i);
 
 		/*
 		 * There can be a situation where all sgs in sglist are not
@@ -1179,7 +1190,7 @@ static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 		 * we have free trbs we can continue queuing from where we
 		 * previously stopped
 		 */
-		if (chain)
+		if (!last_sg)
 			req->start_sg = sg_next(s);
 
 		req->num_queued_sgs++;
@@ -1202,60 +1213,7 @@ static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 static void dwc3_prepare_one_trb_linear(struct dwc3_ep *dep,
 		struct dwc3_request *req)
 {
-	unsigned int length = req->request.length;
-	unsigned int maxp = usb_endpoint_maxp(dep->endpoint.desc);
-	unsigned int rem = length % maxp;
-
-	if ((!length || rem) && usb_endpoint_dir_out(dep->endpoint.desc)) {
-		struct dwc3	*dwc = dep->dwc;
-		struct dwc3_trb	*trb;
-
-		req->needs_extra_trb = true;
-
-		/* prepare normal TRB */
-		dwc3_prepare_one_trb(dep, req, length, true, 0);
-
-		/* Now prepare one extra TRB to align transfer size */
-		trb = &dep->trb_pool[dep->trb_enqueue];
-		req->num_trbs++;
-		__dwc3_prepare_one_trb(dep, trb, dwc->bounce_addr, maxp - rem,
-				false, 1, req->request.stream_id,
-				req->request.short_not_ok,
-				req->request.no_interrupt,
-				req->request.is_last);
-	} else if (req->request.zero && req->request.length &&
-		   !usb_endpoint_xfer_isoc(dep->endpoint.desc) &&
-		   (IS_ALIGNED(req->request.length, maxp))) {
-		struct dwc3	*dwc = dep->dwc;
-		struct dwc3_trb	*trb;
-
-		req->needs_extra_trb = true;
-
-		/* prepare normal TRB */
-		dwc3_prepare_one_trb(dep, req, length, true, 0);
-
-		/* Prepare one extra TRB to handle ZLP */
-		trb = &dep->trb_pool[dep->trb_enqueue];
-		req->num_trbs++;
-		__dwc3_prepare_one_trb(dep, trb, dwc->bounce_addr, 0,
-				!req->direction, 1, req->request.stream_id,
-				req->request.short_not_ok,
-				req->request.no_interrupt,
-				req->request.is_last);
-
-		/* Prepare one more TRB to handle MPS alignment for OUT */
-		if (!req->direction) {
-			trb = &dep->trb_pool[dep->trb_enqueue];
-			req->num_trbs++;
-			__dwc3_prepare_one_trb(dep, trb, dwc->bounce_addr, maxp,
-					       false, 1, req->request.stream_id,
-					       req->request.short_not_ok,
-					       req->request.no_interrupt,
-					       req->request.is_last);
-		}
-	} else {
-		dwc3_prepare_one_trb(dep, req, length, false, 0);
-	}
+	dwc3_prepare_last_sg(dep, req, req->request.length, 0);
 }
 
 /*
-- 
2.28.0

