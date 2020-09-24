Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A63F0276BCE
	for <lists+linux-usb@lfdr.de>; Thu, 24 Sep 2020 10:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727237AbgIXI1m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 04:27:42 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:36044 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727031AbgIXI1l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 04:27:41 -0400
X-Greylist: delayed 356 seconds by postgrey-1.27 at vger.kernel.org; Thu, 24 Sep 2020 04:27:41 EDT
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3D3D4C0358;
        Thu, 24 Sep 2020 08:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1600935735; bh=q78RPO7lq6RVCF3Lh3j0ZFxwGtGsivEE4E76RnVjC0c=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=UtIgfyzdWCJfapVM6FNG070GukzYr5ka5dH63vArPKKrx97NWfIotHj3jz8NZRbve
         If+h+Fd5+O/z41lp6ziExzLJ3v674g3mitvPGUfCpjGumJKUmCfwKw6v6fz30lKgKV
         Mmrsf0RAL1WiIqgIij9vFNczWqBIfZlWaZNOaRD2frIsC1803rwujBStMhUSb9yGm7
         Jo5oKa1mkVPIi1hdS2IDWR09tA5OZJ586o0cxFxfRPdyubgpgNTdYfMQaqXS2JBsxG
         hmeJmZbJZ46yPu++kZD6uDgW+kk4aGvcImlpVc75KPsr6QN4wihPV+evMvC7SFoeLS
         gWXczUwV/YpWg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 0FDB3A009A;
        Thu, 24 Sep 2020 08:22:14 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 24 Sep 2020 01:22:14 -0700
Date:   Thu, 24 Sep 2020 01:22:14 -0700
Message-Id: <4ae2ecebcd9fd1c72aa40e5808fe016631dc0879.1600935293.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1600935293.git.Thinh.Nguyen@synopsys.com>
References: <cover.1600935293.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 10/10] usb: dwc3: gadget: Rename misleading function names
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The functions dwc3_prepare_one_trb_sg and dwc3_prepare_one_trb_linear
are not necessarily preparing "one" TRB, it can prepare multiple TRBs.
Rename these functions as follow:

dwc3_prepare_one_trb_sg -> dwc3_prepare_trbs_sg
dwc3_prepare_one_trb_linear -> dwc3_prepare_trbs_linear

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index e6fa2d295439..ca10619c64a3 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1135,7 +1135,7 @@ static int dwc3_prepare_last_sg(struct dwc3_ep *dep,
 	return num_trbs;
 }
 
-static int dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
+static int dwc3_prepare_trbs_sg(struct dwc3_ep *dep,
 		struct dwc3_request *req)
 {
 	struct scatterlist *sg = req->start_sg;
@@ -1231,7 +1231,7 @@ static int dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 	return req->num_trbs - num_trbs;
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
 			if (!ret)
 				return ret;
 		}
@@ -1297,9 +1297,9 @@ static int dwc3_prepare_trbs(struct dwc3_ep *dep)
 		req->num_pending_sgs	= req->request.num_mapped_sgs;
 
 		if (req->num_pending_sgs > 0)
-			ret = dwc3_prepare_one_trb_sg(dep, req);
+			ret = dwc3_prepare_trbs_sg(dep, req);
 		else
-			ret = dwc3_prepare_one_trb_linear(dep, req);
+			ret = dwc3_prepare_trbs_linear(dep, req);
 
 		if (!ret || !dwc3_calc_trbs_left(dep))
 			return ret;
-- 
2.28.0

