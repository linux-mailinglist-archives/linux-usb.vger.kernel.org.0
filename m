Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5E025B890
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 04:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727877AbgICCGU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 22:06:20 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:51392 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726177AbgICCGU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Sep 2020 22:06:20 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4CE8CC00B2;
        Thu,  3 Sep 2020 02:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1599098779; bh=lVUoTK2xo8L4aao3QiDjjis/Gwdvfpq5T1QFtk8eB7k=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=aAlCmDd9l+SfD5nAW7G6QvImwCn/PZV48IKx2xnDCvSjxbRy6bB5rvCdeIvvkCPll
         UUIBPdvigxvmjPLg0QG0Wga6sZWzBDwAt3hmzr1Q9j3ZG+vluNRGqRQoSI0XGttKtm
         t5RtW8teKipe2oxjoHMopDjhkjUXooMQlCyvkIdfgjUlOeTQ1hOQK7p3devB2lUf95
         1XHQiK6XrSsRsP5PrgdfuLFBBxZ5x/TqWFUmsNMRGCo7MNDeCj5Sp620plOfucYzhY
         7mtM1vuUIPp43vr/NDPF94qP1wr+xVgImMfDTcCFGENkE6V8wAiciIPOLN0z547ifh
         AorZ33yPwiCnw==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 1F14AA006D;
        Thu,  3 Sep 2020 02:06:18 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 02 Sep 2020 19:06:18 -0700
Date:   Wed, 02 Sep 2020 19:06:18 -0700
Message-Id: <3a914ab743485860aeffeb55d46b312491d7d811.1599098161.git.thinhn@synopsys.com>
In-Reply-To: <cover.1599098161.git.thinhn@synopsys.com>
References: <cover.1599098161.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v3 2/4] usb: dwc3: gadget: Account for extra TRB
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When checking for how many TRB remaining, make sure to account for extra
TRBs for ZLP or MPS alignment transfers. Since the dwc3_prepare_trb*
functions should know if we need the extra TRBs, make those functions
return a status code -EAGAIN if there isn't enough TRB. Check against
those status when preparing TRB instead.

Fixes: c6267a51639b ("usb: dwc3: gadget: align transfers to wMaxPacketSize")
Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
Changes in v3:
- None
Changes in v2:
- Add a missing "return 0" for dwc3_prepare_trbs()
- Update doc indicate dwc3_prepare_trbs() can return other -errno

 drivers/usb/dwc3/gadget.c | 82 ++++++++++++++++++++++++---------------
 1 file changed, 51 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 09810ca537bc..7c95ac3186be 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1060,8 +1060,10 @@ static void __dwc3_prepare_one_trb(struct dwc3_ep *dep, struct dwc3_trb *trb,
  * @trb_length: buffer size of the TRB
  * @chain: should this TRB be chained to the next?
  * @node: only for isochronous endpoints. First TRB needs different type.
+ *
+ * Return 0 on success or -EAGAIN if there is not enough TRBs.
  */
-static void dwc3_prepare_one_trb(struct dwc3_ep *dep,
+static int dwc3_prepare_one_trb(struct dwc3_ep *dep,
 		struct dwc3_request *req, unsigned int trb_length,
 		unsigned int chain, unsigned int node)
 {
@@ -1072,6 +1074,9 @@ static void dwc3_prepare_one_trb(struct dwc3_ep *dep,
 	unsigned int		no_interrupt = req->request.no_interrupt;
 	unsigned int		is_last = req->request.is_last;
 
+	if (!dwc3_calc_trbs_left(dep))
+		return -EAGAIN;
+
 	if (req->request.num_sgs > 0)
 		dma = sg_dma_address(req->start_sg);
 	else
@@ -1089,6 +1094,8 @@ static void dwc3_prepare_one_trb(struct dwc3_ep *dep,
 
 	__dwc3_prepare_one_trb(dep, trb, dma, trb_length, chain, node,
 			stream_id, short_not_ok, no_interrupt, is_last);
+
+	return 0;
 }
 
 /**
@@ -1097,11 +1104,13 @@ static void dwc3_prepare_one_trb(struct dwc3_ep *dep,
  * @req: The request to prepare
  * @entry_length: The last SG entry size
  * @node: Indicates whether this is not the first entry (for isoc only)
+ *
+ * Returns 0 on success or -EAGAIN if there is not enough TRBs.
  */
-static void dwc3_prepare_last_sg(struct dwc3_ep *dep,
-				 struct dwc3_request *req,
-				 unsigned int entry_length,
-				 unsigned int node)
+static int dwc3_prepare_last_sg(struct dwc3_ep *dep,
+				struct dwc3_request *req,
+				unsigned int entry_length,
+				unsigned int node)
 {
 	unsigned int maxp = usb_endpoint_maxp(dep->endpoint.desc);
 	unsigned int rem = req->request.length % maxp;
@@ -1121,6 +1130,9 @@ static void dwc3_prepare_last_sg(struct dwc3_ep *dep,
 	if (num_extra_trbs > 0)
 		req->needs_extra_trb = true;
 
+	if (dwc3_calc_trbs_left(dep) < num_extra_trbs + 1)
+		return -EAGAIN;
+
 	/* Prepare a normal TRB */
 	dwc3_prepare_one_trb(dep, req, entry_length, req->needs_extra_trb, node);
 
@@ -1148,9 +1160,11 @@ static void dwc3_prepare_last_sg(struct dwc3_ep *dep,
 				       req->request.no_interrupt,
 				       req->request.is_last);
 	}
+
+	return 0;
 }
 
-static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
+static int dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 		struct dwc3_request *req)
 {
 	struct scatterlist *sg = req->start_sg;
@@ -1170,6 +1184,7 @@ static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 	for_each_sg(sg, s, remaining, i) {
 		unsigned int trb_length;
 		bool last_sg = false;
+		int ret;
 
 		trb_length = min_t(unsigned int, length, sg_dma_len(s));
 
@@ -1186,9 +1201,13 @@ static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 			last_sg = true;
 
 		if (last_sg)
-			dwc3_prepare_last_sg(dep, req, trb_length, i);
+			ret = dwc3_prepare_last_sg(dep, req, trb_length, i);
 		else
-			dwc3_prepare_one_trb(dep, req, trb_length, 1, i);
+			ret = dwc3_prepare_one_trb(dep, req, trb_length, 1, i);
+
+		/* Ran out of TRBs */
+		if (ret)
+			return ret;
 
 		/*
 		 * There can be a situation where all sgs in sglist are not
@@ -1211,16 +1230,14 @@ static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 			req->num_pending_sgs -= req->request.num_mapped_sgs - req->num_queued_sgs;
 			break;
 		}
-
-		if (!dwc3_calc_trbs_left(dep))
-			break;
 	}
+	return 0;
 }
 
-static void dwc3_prepare_one_trb_linear(struct dwc3_ep *dep,
+static int dwc3_prepare_one_trb_linear(struct dwc3_ep *dep,
 		struct dwc3_request *req)
 {
-	dwc3_prepare_last_sg(dep, req, req->request.length, 0);
+	return dwc3_prepare_last_sg(dep, req, req->request.length, 0);
 }
 
 /*
@@ -1230,10 +1247,13 @@ static void dwc3_prepare_one_trb_linear(struct dwc3_ep *dep,
  * The function goes through the requests list and sets up TRBs for the
  * transfers. The function returns once there are no more TRBs available or
  * it runs out of requests.
+ *
+ * Returns 0 on success or negative errno.
  */
-static void dwc3_prepare_trbs(struct dwc3_ep *dep)
+static int dwc3_prepare_trbs(struct dwc3_ep *dep)
 {
 	struct dwc3_request	*req, *n;
+	int ret = 0;
 
 	BUILD_BUG_ON_NOT_POWER_OF_2(DWC3_TRB_NUM);
 
@@ -1248,11 +1268,11 @@ static void dwc3_prepare_trbs(struct dwc3_ep *dep)
 	 * break things.
 	 */
 	list_for_each_entry(req, &dep->started_list, list) {
-		if (req->num_pending_sgs > 0)
-			dwc3_prepare_one_trb_sg(dep, req);
-
-		if (!dwc3_calc_trbs_left(dep))
-			return;
+		if (req->num_pending_sgs > 0) {
+			ret = dwc3_prepare_one_trb_sg(dep, req);
+			if (ret)
+				return ret;
+		}
 
 		/*
 		 * Don't prepare beyond a transfer. In DWC_usb32, its transfer
@@ -1260,17 +1280,16 @@ static void dwc3_prepare_trbs(struct dwc3_ep *dep)
 		 * active transfer instead of stopping.
 		 */
 		if (dep->stream_capable && req->request.is_last)
-			return;
+			return 0;
 	}
 
 	list_for_each_entry_safe(req, n, &dep->pending_list, list) {
 		struct dwc3	*dwc = dep->dwc;
-		int		ret;
 
 		ret = usb_gadget_map_request_by_dev(dwc->sysdev, &req->request,
 						    dep->direction);
 		if (ret)
-			return;
+			return ret;
 
 		req->sg			= req->request.sg;
 		req->start_sg		= req->sg;
@@ -1278,12 +1297,12 @@ static void dwc3_prepare_trbs(struct dwc3_ep *dep)
 		req->num_pending_sgs	= req->request.num_mapped_sgs;
 
 		if (req->num_pending_sgs > 0)
-			dwc3_prepare_one_trb_sg(dep, req);
+			ret = dwc3_prepare_one_trb_sg(dep, req);
 		else
-			dwc3_prepare_one_trb_linear(dep, req);
+			ret = dwc3_prepare_one_trb_linear(dep, req);
 
-		if (!dwc3_calc_trbs_left(dep))
-			return;
+		if (ret)
+			return ret;
 
 		/*
 		 * Don't prepare beyond a transfer. In DWC_usb32, its transfer
@@ -1291,8 +1310,9 @@ static void dwc3_prepare_trbs(struct dwc3_ep *dep)
 		 * active transfer instead of stopping.
 		 */
 		if (dep->stream_capable && req->request.is_last)
-			return;
+			return 0;
 	}
+	return 0;
 }
 
 static void dwc3_gadget_ep_cleanup_cancelled_requests(struct dwc3_ep *dep);
@@ -1305,12 +1325,12 @@ static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep)
 	int				ret;
 	u32				cmd;
 
-	if (!dwc3_calc_trbs_left(dep))
-		return 0;
-
 	starting = !(dep->flags & DWC3_EP_TRANSFER_STARTED);
 
-	dwc3_prepare_trbs(dep);
+	ret = dwc3_prepare_trbs(dep);
+	if (ret)
+		return 0;
+
 	req = next_request(&dep->started_list);
 	if (!req) {
 		dep->flags |= DWC3_EP_PENDING_REQUEST;
-- 
2.28.0

