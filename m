Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B615276BAE
	for <lists+linux-usb@lfdr.de>; Thu, 24 Sep 2020 10:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbgIXIV5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 04:21:57 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:40384 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727229AbgIXIV5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 04:21:57 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E2A27402F6;
        Thu, 24 Sep 2020 08:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1600935716; bh=hDa0Qt9akU1Do2fIdEZ7HtG8sq5HfGsbKvKMfweQDFQ=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=AAKUsSqVCjx04X0qdsBXsB5wxzAiu/HYJMObyOcAor6Znxr2HATABtKnRGAb3Voq3
         HBi9Q932iJx3i8nNQ9rvaFERpHa1N3PpiH8eLEeip/UpoFxk1Vpw8lwLTfcKpPFreq
         FZqBH3u+6THwmyprIiOYPFLipWNRZzbZwySPO0AgIyXj7d3gkZIrgEMeb4MqaXPn7v
         KLjZtrqNutYD1w9Ll/b+MmZla7lz2pJvfhu/EsQhqclQ23FfCBiJy1AAI9amLYXXhQ
         l1cscdGLdLTMppVLOokp5N7ml7LzcBBdyW6nxXPj5pemuf3pGtsH0UXaMYr+ZKj7F0
         TvMErEPDuYhwg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id CD577A0072;
        Thu, 24 Sep 2020 08:21:55 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 24 Sep 2020 01:21:55 -0700
Date:   Thu, 24 Sep 2020 01:21:55 -0700
Message-Id: <ca6e3d1717721e058cf3658eadbe98855416208f.1600935293.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1600935293.git.Thinh.Nguyen@synopsys.com>
References: <cover.1600935293.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 07/10] usb: dwc3: gadget: Check for number of TRBs prepared
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

By returning the number of TRBs prepared, we know whether to execute
__dwc3_gadget_kick_transfer(). This allows us to check if we ran out of
TRBs when extra TRBs are needed for OUT transfers. It also allows us to
properly handle usb_gadget_map_request_by_dev() error.

Fixes: c6267a51639b ("usb: dwc3: gadget: align transfers to wMaxPacketSize")
Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index d3896657ddbd..f43421246f89 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1257,10 +1257,13 @@ static int dwc3_prepare_one_trb_linear(struct dwc3_ep *dep,
  * The function goes through the requests list and sets up TRBs for the
  * transfers. The function returns once there are no more TRBs available or
  * it runs out of requests.
+ *
+ * Returns the number of TRBs prepared or negative errno.
  */
-static void dwc3_prepare_trbs(struct dwc3_ep *dep)
+static int dwc3_prepare_trbs(struct dwc3_ep *dep)
 {
 	struct dwc3_request	*req, *n;
+	int			ret = 0;
 
 	BUILD_BUG_ON_NOT_POWER_OF_2(DWC3_TRB_NUM);
 
@@ -1275,11 +1278,14 @@ static void dwc3_prepare_trbs(struct dwc3_ep *dep)
 	 * break things.
 	 */
 	list_for_each_entry(req, &dep->started_list, list) {
-		if (req->num_pending_sgs > 0)
-			dwc3_prepare_one_trb_sg(dep, req);
+		if (req->num_pending_sgs > 0) {
+			ret = dwc3_prepare_one_trb_sg(dep, req);
+			if (!ret)
+				return ret;
+		}
 
 		if (!dwc3_calc_trbs_left(dep))
-			return;
+			return ret;
 
 		/*
 		 * Don't prepare beyond a transfer. In DWC_usb32, its transfer
@@ -1287,17 +1293,16 @@ static void dwc3_prepare_trbs(struct dwc3_ep *dep)
 		 * active transfer instead of stopping.
 		 */
 		if (dep->stream_capable && req->request.is_last)
-			return;
+			return ret;
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
@@ -1305,12 +1310,12 @@ static void dwc3_prepare_trbs(struct dwc3_ep *dep)
 		req->num_pending_sgs	= req->request.num_mapped_sgs;
 
 		if (req->num_pending_sgs > 0)
-			dwc3_prepare_one_trb_sg(dep, req);
+			ret = dwc3_prepare_one_trb_sg(dep, req);
 		else
-			dwc3_prepare_one_trb_linear(dep, req);
+			ret = dwc3_prepare_one_trb_linear(dep, req);
 
-		if (!dwc3_calc_trbs_left(dep))
-			return;
+		if (!ret || !dwc3_calc_trbs_left(dep))
+			return ret;
 
 		/*
 		 * Don't prepare beyond a transfer. In DWC_usb32, its transfer
@@ -1318,8 +1323,10 @@ static void dwc3_prepare_trbs(struct dwc3_ep *dep)
 		 * active transfer instead of stopping.
 		 */
 		if (dep->stream_capable && req->request.is_last)
-			return;
+			return ret;
 	}
+
+	return ret;
 }
 
 static void dwc3_gadget_ep_cleanup_cancelled_requests(struct dwc3_ep *dep);
@@ -1332,12 +1339,12 @@ static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep)
 	int				ret;
 	u32				cmd;
 
-	if (!dwc3_calc_trbs_left(dep))
-		return 0;
+	ret = dwc3_prepare_trbs(dep);
+	if (ret <= 0)
+		return ret;
 
 	starting = !(dep->flags & DWC3_EP_TRANSFER_STARTED);
 
-	dwc3_prepare_trbs(dep);
 	req = next_request(&dep->started_list);
 	if (!req) {
 		dep->flags |= DWC3_EP_PENDING_REQUEST;
-- 
2.28.0

