Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18CFB276BD1
	for <lists+linux-usb@lfdr.de>; Thu, 24 Sep 2020 10:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727283AbgIXI1m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 04:27:42 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:36046 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727088AbgIXI1m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 04:27:42 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2DE96C0344;
        Thu, 24 Sep 2020 08:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1600935729; bh=q5eRa53m7YjEo7Nc4vG9SexuD65UBAFQQ0v8uYk2hEM=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=KF1lxuwaFaDKiCd4tUXnOeLfnMQAgibmHfjICGi0W4kUMAZjVU8UQPqSF8RW6TXli
         pkGn5LV1F1NBINdh1BDMHMGvRwlaia6hljOTEsYbfZJKl+/9Gl+60y2LXGRb7K9AQf
         Y+f6fhaO7d1Oy2K2XRQhDmAQRieSTPjllZLo8IuBb86weP21KdvksSvKD/DPd2LuwQ
         a9A3Em4oLA4hlxLUa1ojAhm00gdn7RCWY9tljbNIsj+IFIyCuIC+D8SPNCswF6nVVr
         1FfLMOXZt3NTugMesIY5CD1NZeOw5i/TQWsN1seEM+8zPbMVZ/BLgqPW01wIVtIGqa
         JFixGr0DedzVQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id F2158A0072;
        Thu, 24 Sep 2020 08:22:07 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 24 Sep 2020 01:22:07 -0700
Date:   Thu, 24 Sep 2020 01:22:07 -0700
Message-Id: <8001e64c304f1526838fe6302580c84b43b47d82.1600935293.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1600935293.git.Thinh.Nguyen@synopsys.com>
References: <cover.1600935293.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 09/10] usb: dwc3: gadget: Refactor preparing last TRBs
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There are a lot of common codes for preparing SG and linear TRBs.
Refactor them for easier read.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 129 ++++++++++++++------------------------
 1 file changed, 48 insertions(+), 81 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 840d6e49f668..e6fa2d295439 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1094,6 +1094,47 @@ static void dwc3_prepare_one_trb(struct dwc3_ep *dep,
 			stream_id, short_not_ok, no_interrupt, is_last);
 }
 
+/**
+ * dwc3_prepare_last_sg - prepare TRBs for the last SG entry
+ * @dep: The endpoint that the request belongs to
+ * @req: The request to prepare
+ * @entry_length: The last SG entry size
+ * @node: Indicates whether this is not the first entry (for isoc only)
+ *
+ * Return the number of TRBs prepared.
+ */
+static int dwc3_prepare_last_sg(struct dwc3_ep *dep,
+		struct dwc3_request *req, unsigned int entry_length,
+		unsigned int node)
+{
+	unsigned int maxp = usb_endpoint_maxp(dep->endpoint.desc);
+	unsigned int rem = req->request.length % maxp;
+	unsigned int num_trbs = 1;
+
+	if ((req->request.length && req->request.zero && !rem &&
+			!usb_endpoint_xfer_isoc(dep->endpoint.desc)) ||
+			(!req->direction && rem))
+		num_trbs++;
+
+	if (dwc3_calc_trbs_left(dep) < num_trbs)
+		return 0;
+
+	req->needs_extra_trb = num_trbs > 1;
+
+	/* Prepare a normal TRB */
+	if (req->direction || req->request.length)
+		dwc3_prepare_one_trb(dep, req, entry_length,
+				req->needs_extra_trb, node, false);
+
+	/* Prepare extra TRBs for ZLP and MPS OUT transfer alignment */
+	if ((!req->direction && !req->request.length) || req->needs_extra_trb)
+		dwc3_prepare_one_trb(dep, req,
+				req->direction ? 0 : maxp - rem,
+				false, 1, true);
+
+	return num_trbs;
+}
+
 static int dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 		struct dwc3_request *req)
 {
@@ -1101,8 +1142,6 @@ static int dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 	struct scatterlist *s;
 	int		i;
 	unsigned int length = req->request.length;
-	unsigned int maxp = usb_endpoint_maxp(dep->endpoint.desc);
-	unsigned int rem = length % maxp;
 	unsigned int remaining = req->request.num_mapped_sgs
 		- req->num_queued_sgs;
 	unsigned int num_trbs = req->num_trbs;
@@ -1116,7 +1155,7 @@ static int dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 
 	for_each_sg(sg, s, remaining, i) {
 		unsigned int trb_length;
-		unsigned int chain = true;
+		bool last_sg = false;
 
 		trb_length = min_t(unsigned int, length, sg_dma_len(s));
 
@@ -1130,45 +1169,16 @@ static int dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 		 * mapped sg.
 		 */
 		if ((i == remaining - 1) || !length)
-			chain = false;
+			last_sg = true;
 
 		if (!dwc3_calc_trbs_left(dep))
 			break;
 
-		if (rem && usb_endpoint_dir_out(dep->endpoint.desc) && !chain) {
-			/* prepare normal TRB */
-			if (req->request.length) {
-				if (dwc3_calc_trbs_left(dep) < 2)
-					goto out;
-
-				req->needs_extra_trb = true;
-				dwc3_prepare_one_trb(dep, req, trb_length,
-					true, i, false);
-			}
-
-			/* Now prepare one extra TRB to align transfer size */
-			dwc3_prepare_one_trb(dep, req, maxp - rem,
-					false, 1, true);
-		} else if (req->request.zero && req->request.length &&
-			   !usb_endpoint_xfer_isoc(dep->endpoint.desc) &&
-			   !rem && !chain) {
-
-			if (dwc3_calc_trbs_left(dep) < 2)
+		if (last_sg) {
+			if (!dwc3_prepare_last_sg(dep, req, trb_length, i))
 				goto out;
-
-			req->needs_extra_trb = true;
-
-			/* Prepare normal TRB */
-			dwc3_prepare_one_trb(dep, req, trb_length,
-					true, i, false);
-
-			/* Prepare one extra TRB to handle ZLP */
-			dwc3_prepare_one_trb(dep, req,
-					req->direction ? 0 : maxp,
-					false, 1, true);
 		} else {
-			dwc3_prepare_one_trb(dep, req, trb_length,
-					chain, i, false);
+			dwc3_prepare_one_trb(dep, req, trb_length, 1, i, false);
 		}
 
 		/*
@@ -1178,7 +1188,7 @@ static int dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 		 * we have free trbs we can continue queuing from where we
 		 * previously stopped
 		 */
-		if (chain)
+		if (!last_sg)
 			req->start_sg = sg_next(s);
 
 		req->num_queued_sgs++;
@@ -1224,50 +1234,7 @@ static int dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 static int dwc3_prepare_one_trb_linear(struct dwc3_ep *dep,
 		struct dwc3_request *req)
 {
-	unsigned int length = req->request.length;
-	unsigned int maxp = usb_endpoint_maxp(dep->endpoint.desc);
-	unsigned int rem = length % maxp;
-	unsigned int num_trbs = req->num_trbs;
-
-	if (!dwc3_calc_trbs_left(dep))
-		goto out;
-
-	if ((!length || rem) && usb_endpoint_dir_out(dep->endpoint.desc)) {
-		/* prepare normal TRB */
-		if (req->request.length) {
-			if (dwc3_calc_trbs_left(dep) < 2)
-				goto out;
-
-			req->needs_extra_trb = true;
-			dwc3_prepare_one_trb(dep, req, length, true, 0, false);
-		}
-
-		/* Now prepare one extra TRB to align transfer size */
-		dwc3_prepare_one_trb(dep, req, maxp - rem, false, 1, true);
-	} else if (req->request.zero && req->request.length &&
-		   !usb_endpoint_xfer_isoc(dep->endpoint.desc) &&
-		   (IS_ALIGNED(req->request.length, maxp))) {
-
-		if (dwc3_calc_trbs_left(dep) < 2)
-			goto out;
-
-		req->needs_extra_trb = true;
-
-		/* prepare normal TRB */
-		dwc3_prepare_one_trb(dep, req, length, true, 0, false);
-
-		/* Prepare one extra TRB to handle ZLP */
-		dwc3_prepare_one_trb(dep, req, req->direction ? 0 : maxp,
-				false, 1, true);
-	} else {
-		if (!dwc3_calc_trbs_left(dep))
-			goto out;
-
-		dwc3_prepare_one_trb(dep, req, length, false, 0, false);
-	}
-
-out:
-	return req->num_trbs - num_trbs;
+	return dwc3_prepare_last_sg(dep, req, req->request.length, 0);
 }
 
 /*
-- 
2.28.0

