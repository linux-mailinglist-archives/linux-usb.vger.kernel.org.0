Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 639FD276BAB
	for <lists+linux-usb@lfdr.de>; Thu, 24 Sep 2020 10:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727271AbgIXIVi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 04:21:38 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:40370 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727244AbgIXIVi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 04:21:38 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1C645402F6;
        Thu, 24 Sep 2020 08:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1600935698; bh=3K3pF/0A9zBNNE1uqiXkkWwBDyKeN4kKvcR4MyEa+yM=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=ZN18XPz1JsfpWgeU2Mp3HhnmGa11neFTtE9bepclssarnB0ot6CwtOgnR2J2xMOk9
         ccajwCkWDjSrrRYd59sbf0NmCATbiZsvE94EN67ogei4qE30/SFADVEfp93oOHtIzl
         lG009urWpHSai3wEzjvBongC7Ly3hrMDLJ2rVOFsfsGHvJL+0FkXnXFMAtj/H4lyn0
         6A5wZFHJf46mq5luJg7CfkKUD69aGWJnkzWNfNjAbmtxf4ozwpahKTZhPnupMinVxB
         77ptwu6beoQxw5PV11ePfgFM/8qnu947Dq0pw5U02wfSgEvbUuJgLpX5vdL0uxOWHC
         mvQhV3nDKM/SQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 06415A0096;
        Thu, 24 Sep 2020 08:21:37 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 24 Sep 2020 01:21:36 -0700
Date:   Thu, 24 Sep 2020 01:21:36 -0700
Message-Id: <a1af83c8fea6cccbb861ccb08d2776bfd1b525f7.1600935293.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1600935293.git.Thinh.Nguyen@synopsys.com>
References: <cover.1600935293.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 04/10] usb: dwc3: gadget: Improve TRB ZLP setup
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For OUT requests that requires extra TRBs for ZLP. We don't need to
prepare the 0-length TRB and simply prepare the MPS size TRB. This
reduces 1 TRB needed to prepare for ZLP.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 50 ++++++++++++++-------------------------
 1 file changed, 18 insertions(+), 32 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index c0309ad34d28..e49930a7acae 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1132,11 +1132,12 @@ static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 			chain = false;
 
 		if (rem && usb_endpoint_dir_out(dep->endpoint.desc) && !chain) {
-			req->needs_extra_trb = true;
-
 			/* prepare normal TRB */
-			dwc3_prepare_one_trb(dep, req, trb_length,
+			if (req->request.length) {
+				req->needs_extra_trb = true;
+				dwc3_prepare_one_trb(dep, req, trb_length,
 					true, i, false);
+			}
 
 			/* Now prepare one extra TRB to align transfer size */
 			dwc3_prepare_one_trb(dep, req, maxp - rem,
@@ -1151,13 +1152,9 @@ static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 					true, i, false);
 
 			/* Prepare one extra TRB to handle ZLP */
-			dwc3_prepare_one_trb(dep, req, 0,
-					!req->direction, 1, true);
-
-			/* Prepare one more TRB to handle MPS alignment */
-			if (!req->direction)
-				dwc3_prepare_one_trb(dep, req, maxp,
-						false, 1, true);
+			dwc3_prepare_one_trb(dep, req,
+					req->direction ? 0 : maxp,
+					false, 1, true);
 		} else {
 			dwc3_prepare_one_trb(dep, req, trb_length,
 					chain, i, false);
@@ -1198,10 +1195,11 @@ static void dwc3_prepare_one_trb_linear(struct dwc3_ep *dep,
 	unsigned int rem = length % maxp;
 
 	if ((!length || rem) && usb_endpoint_dir_out(dep->endpoint.desc)) {
-		req->needs_extra_trb = true;
-
 		/* prepare normal TRB */
-		dwc3_prepare_one_trb(dep, req, length, true, 0, false);
+		if (req->request.length) {
+			req->needs_extra_trb = true;
+			dwc3_prepare_one_trb(dep, req, length, true, 0, false);
+		}
 
 		/* Now prepare one extra TRB to align transfer size */
 		dwc3_prepare_one_trb(dep, req, maxp - rem, false, 1, true);
@@ -1214,11 +1212,8 @@ static void dwc3_prepare_one_trb_linear(struct dwc3_ep *dep,
 		dwc3_prepare_one_trb(dep, req, length, true, 0, false);
 
 		/* Prepare one extra TRB to handle ZLP */
-		dwc3_prepare_one_trb(dep, req, 0, !req->direction, 1, true);
-
-		/* Prepare one more TRB to handle MPS alignment for OUT */
-		if (!req->direction)
-			dwc3_prepare_one_trb(dep, req, maxp, false, 1, true);
+		dwc3_prepare_one_trb(dep, req, req->direction ? 0 : maxp,
+				false, 1, true);
 	} else {
 		dwc3_prepare_one_trb(dep, req, length, false, 0, false);
 	}
@@ -2615,12 +2610,12 @@ static int dwc3_gadget_ep_reclaim_completed_trb(struct dwc3_ep *dep,
 	}
 
 	/*
-	 * If we're dealing with unaligned size OUT transfer, we will be left
-	 * with one TRB pending in the ring. We need to manually clear HWO bit
-	 * from that TRB.
+	 * We use bounce buffer for requests that needs extra TRB or OUT ZLP. If
+	 * this TRB points to the bounce buffer address, it's a MPS alignment
+	 * TRB. Don't add it to req->remaining calculation.
 	 */
-
-	if (req->needs_extra_trb && !(trb->ctrl & DWC3_TRB_CTRL_CHN)) {
+	if (trb->bpl == lower_32_bits(dep->dwc->bounce_addr) &&
+	    trb->bph == upper_32_bits(dep->dwc->bounce_addr)) {
 		trb->ctrl &= ~DWC3_TRB_CTRL_HWO;
 		return 1;
 	}
@@ -2701,17 +2696,8 @@ static int dwc3_gadget_ep_cleanup_completed_request(struct dwc3_ep *dep,
 		goto out;
 
 	if (req->needs_extra_trb) {
-		unsigned int maxp = usb_endpoint_maxp(dep->endpoint.desc);
-
 		ret = dwc3_gadget_ep_reclaim_trb_linear(dep, req, event,
 				status);
-
-		/* Reclaim MPS padding TRB for ZLP */
-		if (!req->direction && req->request.zero && req->request.length &&
-		    !usb_endpoint_xfer_isoc(dep->endpoint.desc) &&
-		    (IS_ALIGNED(req->request.length, maxp)))
-			ret = dwc3_gadget_ep_reclaim_trb_linear(dep, req, event, status);
-
 		req->needs_extra_trb = false;
 	}
 
-- 
2.28.0

