Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B834F1989A9
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2020 03:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729196AbgCaBy6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Mar 2020 21:54:58 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:47324 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729089AbgCaBy6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Mar 2020 21:54:58 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DD60EC0FDE;
        Tue, 31 Mar 2020 01:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1585619697; bh=uW1dLN1Bde+fzdsPKs7tCI6ZsuSSFNk6dYLaa6h1bxU=;
        h=Date:From:Subject:To:Cc:From;
        b=lngxnT+gwDCS6SD4Bopojhutc/3MwQ2f38f5PLfU9117aQFATrG6laYK4szWG48xZ
         NQ2M4Uhp4aMeKWqtHL0lHiB6nyNHO+hVcrv568RnKZKCSFnSfVnfbezt7An9tzIIM5
         nVt2AV6XLmSafZ/O+vHobg4gQrXQeAVDA+6O66a1+UntkBe9jcyQpWgPjcoUhNZdAL
         EbuhMN0bDudF6kSwcsEIpeicFcnVkBYfFdQ6CkxLF9FaSbl6qwKX6eIwph2NwtJu4D
         xOFMwyLsHm1zKG80PCBhJ5UNGxX2XGH9FHrkmvN7+YH0ucjmWpkNjfLjwYKcP19yEo
         UTScJ8wQxHb7Q==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 92E7FA007C;
        Tue, 31 Mar 2020 01:54:56 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 30 Mar 2020 18:54:56 -0700
Date:   Mon, 30 Mar 2020 18:54:56 -0700
Message-Id: <07653eda952a5afaca528a69f9b3d160ee695db1.1585619602.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 1/2] usb: dwc3: gadget: Fix request completion check
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A request may not be completed because not all the TRBs are prepared for
it. This happens when we run out of available TRBs. When some TRBs are
completed, the driver needs to prepare the rest of the TRBs for the
request. The check dwc3_gadget_ep_request_completed() shouldn't be
checking the amount of data received but rather the number of pending
TRBs. Revise this request completion check.

Fixes: e0c42ce590fe ("usb: dwc3: gadget: simplify IOC handling")
Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 1a4fc03742aa..c45853b14cff 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2550,14 +2550,7 @@ static int dwc3_gadget_ep_reclaim_trb_linear(struct dwc3_ep *dep,
 
 static bool dwc3_gadget_ep_request_completed(struct dwc3_request *req)
 {
-	/*
-	 * For OUT direction, host may send less than the setup
-	 * length. Return true for all OUT requests.
-	 */
-	if (!req->direction)
-		return true;
-
-	return req->request.actual == req->request.length;
+	return req->num_pending_sgs == 0;
 }
 
 static int dwc3_gadget_ep_cleanup_completed_request(struct dwc3_ep *dep,
@@ -2581,8 +2574,7 @@ static int dwc3_gadget_ep_cleanup_completed_request(struct dwc3_ep *dep,
 
 	req->request.actual = req->request.length - req->remaining;
 
-	if (!dwc3_gadget_ep_request_completed(req) ||
-			req->num_pending_sgs) {
+	if (!dwc3_gadget_ep_request_completed(req)) {
 		__dwc3_gadget_kick_transfer(dep);
 		goto out;
 	}
-- 
2.11.0

