Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1D027F6D8
	for <lists+linux-usb@lfdr.de>; Thu,  1 Oct 2020 02:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731339AbgJAAoe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Sep 2020 20:44:34 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:33832 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730155AbgJAAoe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Sep 2020 20:44:34 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 15CF1408D3;
        Thu,  1 Oct 2020 00:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1601513074; bh=H8pvtbzYvnHhzhJEWU7eLnvcq6Ah9qf2Mytq96+2LhE=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=Q9LIkBBkuxTl+tb3wh8AwEEjo6HMvNRckfRUjZqp38/tnBCJOJNQZ8K6wbFOF+w5Z
         xrgt+d4hyUAG0MywMKFuinH4BPMFTrrLZHMq90HAA/1DWEI0qoswl+51DhRUJ0j3nf
         zCsPgoQR7cDnd+h92SRUzIS4ImX3zGROEx2NIF6PBsNFUKeinyS5p0dbgqc3OXbxyX
         WxZKs5ATs6eDadt1vxsVTqzDBMvjPUSGlDAG8VHivtwMoxfxxL/MXXMGNZXBaVs/jv
         c5tN8LGTAsljLyeghJfBMdTOcMcBH1I/P9MqPPXhFaF3JsMJGgLIHs8R+SG0hmI7NP
         WBoYndJfiuCQQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id CE918A0099;
        Thu,  1 Oct 2020 00:44:32 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 30 Sep 2020 17:44:32 -0700
Date:   Wed, 30 Sep 2020 17:44:32 -0700
Message-Id: <b3b8cf0a64dea2f04fc564b73cae9346a42f9166.1601511883.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1601511883.git.Thinh.Nguyen@synopsys.com>
References: <cover.1601511883.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 3/4] usb: dwc3: gadget: Keep TRBs in request order
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If we couldn't finish preparing all the TRBs of a request, don't prepare
the next request. Otherwise, the TRBs order will be mixed up and the
controller will process the wrong TRB. This is a corner case where
there's not enough TRBs for a request that needs the extra TRB but
there's still 1 available TRB in the pool.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 327cd556e8db..ff924656f690 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1274,7 +1274,7 @@ static int dwc3_prepare_trbs(struct dwc3_ep *dep)
 	list_for_each_entry(req, &dep->started_list, list) {
 		if (req->num_pending_sgs > 0) {
 			ret = dwc3_prepare_trbs_sg(dep, req);
-			if (!ret)
+			if (!ret || req->num_pending_sgs)
 				return ret;
 		}
 
@@ -1303,10 +1303,13 @@ static int dwc3_prepare_trbs(struct dwc3_ep *dep)
 		req->num_queued_sgs	= 0;
 		req->num_pending_sgs	= req->request.num_mapped_sgs;
 
-		if (req->num_pending_sgs > 0)
+		if (req->num_pending_sgs > 0) {
 			ret = dwc3_prepare_trbs_sg(dep, req);
-		else
+			if (req->num_pending_sgs)
+				return ret;
+		} else {
 			ret = dwc3_prepare_trbs_linear(dep, req);
+		}
 
 		if (!ret || !dwc3_calc_trbs_left(dep))
 			return ret;
-- 
2.28.0

