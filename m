Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6710E23E608
	for <lists+linux-usb@lfdr.de>; Fri,  7 Aug 2020 04:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbgHGCqz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Aug 2020 22:46:55 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:57070 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726058AbgHGCqz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Aug 2020 22:46:55 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3D574408EF;
        Fri,  7 Aug 2020 02:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1596768415; bh=NETiTmPFwyd0pBZY5f9RdybB0n5bkhMbDLqFbPP5nWE=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=h6gxOn9IUoEUd9gK4TNleXGwyUK1SKjspGfCkQvGUxZ3zqYu1c19HKg0UqLNC6mt1
         +nj93OfyT8MlewDamEAE45OIKKblEl2mWPp75v/ozkqYp8OlKet45SzzWg8rN8tTNJ
         mr5ulATWgwbjYYznffRVhWd67KqN9saX03Cu6OfKGONgJF78WXnj4hHOCXI7OcoFNg
         DKr1aPvmXCGzVvBiCoQ+rb459fz9cmR2d2lifwDXp98ACVq1XlSkok0+lhEicIrZGC
         VKIMpMxzsmNpN5tWTQKoTcpz7E4DxB+HOpx7EnI+3NGISvV74QX5X9KK8Mb5pXcfcd
         2x9R4ULJstd4g==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 24B9EA0096;
        Fri,  7 Aug 2020 02:46:54 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 06 Aug 2020 19:46:54 -0700
Date:   Thu, 06 Aug 2020 19:46:54 -0700
Message-Id: <554c6d34c5936630bbe292114fad9c3322a7161e.1596767991.git.thinhn@synopsys.com>
In-Reply-To: <cover.1596767991.git.thinhn@synopsys.com>
References: <cover.1596767991.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 6/7] usb: dwc3: gadget: Rename misleading function names
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The functions dwc3_prepare_one_trb_sg and dwc3_prepare_one_trb_linear
are not necessarily preparing "one" TRB, it can prepare multiple TRBs.
Rename these functions as follow:

dwc3_prepare_one_trb_sg -> dwc3_prepare_trbs_sg
dwc3_prepare_one_trb_linear -> dwc3_prepare_trbs_linear

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 Changes in v2:
 - None

 drivers/usb/dwc3/gadget.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 138f1b96bdf7..24cc4f2c2e1b 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1161,7 +1161,7 @@ static int dwc3_prepare_last_sg(struct dwc3_ep *dep,
 	return 0;
 }
 
-static int dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
+static int dwc3_prepare_trbs_sg(struct dwc3_ep *dep,
 		struct dwc3_request *req)
 {
 	struct scatterlist *sg = req->start_sg;
@@ -1231,7 +1231,7 @@ static int dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 	return 0;
 }
 
-static int dwc3_prepare_one_trb_linear(struct dwc3_ep *dep,
+static int dwc3_prepare_trbs_linear(struct dwc3_ep *dep,
 		struct dwc3_request *req)
 {
 	return dwc3_prepare_last_sg(dep, req, req->request.length, 0);
@@ -1266,7 +1266,7 @@ static int dwc3_prepare_trbs(struct dwc3_ep *dep)
 	 */
 	list_for_each_entry(req, &dep->started_list, list) {
 		if (req->num_pending_sgs > 0) {
-			ret = dwc3_prepare_one_trb_sg(dep, req);
+			ret = dwc3_prepare_trbs_sg(dep, req);
 			if (ret)
 				return ret;
 		}
@@ -1294,9 +1294,9 @@ static int dwc3_prepare_trbs(struct dwc3_ep *dep)
 		req->num_pending_sgs	= req->request.num_mapped_sgs;
 
 		if (req->num_pending_sgs > 0)
-			ret = dwc3_prepare_one_trb_sg(dep, req);
+			ret = dwc3_prepare_trbs_sg(dep, req);
 		else
-			ret = dwc3_prepare_one_trb_linear(dep, req);
+			ret = dwc3_prepare_trbs_linear(dep, req);
 
 		if (ret)
 			return ret;
-- 
2.28.0

