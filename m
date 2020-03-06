Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28E2817B50D
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2020 04:44:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgCFDoH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Mar 2020 22:44:07 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:37856 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726317AbgCFDoG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Mar 2020 22:44:06 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0464E4016D;
        Fri,  6 Mar 2020 03:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1583466246; bh=HmbQJCi+eo9JezlYLH6Ua90jQbJXejR56X1WA0GoD7g=;
        h=Date:From:Subject:To:Cc:From;
        b=P9L6XcYY7lihT+pWr59JU4eTRezZ8UXaUcyD6MmLbnnR/qPlENAPY8lQFVm0ClKTf
         uN7qHeYh2eS0MjITotpfQUzO32rey78ct6XggdVyXGAviZDRyGVg6RS4vWb4y4IlzL
         2GW8Xa58hKi4VJ7uEeNzr0EGuVJevjL1r2Q6LAcbTm7V2msv+zFakO6C/RqA9wAWIU
         +zMThgs5Qf3cmNcU1do95CEaee84tHKSlZNUhUCGANXY1Fw+EkaqL6UnlEqS5/u12p
         6qrf11LetvIbsmfHyq4CykWhB1qkOVt1sSNDclDn1FpMZ4u39IGKYoFK7I3/2XPjFe
         Ddg6Lys0YwaZg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 844E3A006D;
        Fri,  6 Mar 2020 03:44:04 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 05 Mar 2020 19:44:04 -0800
Date:   Thu, 05 Mar 2020 19:44:04 -0800
Message-Id: <660a74249e64b3b62ca9b394584387baee67a119.1583466150.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: dwc3: gadget: Remove incomplete check
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We only care to resume transfer for SG because the request maybe
partially completed. dwc3_gadget_ep_request_completed() doesn't check
that of a request, at least not fully.

1) It doesn't account for OUT direction.
2) It doesn't account for isoc. For isoc, a request maybe completed with
partial data.

Remove this check.

Fixes: e0c42ce590fe ("usb: dwc3: gadget: simplify IOC handling")
Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 39c92df6e188..9f46c8bc1114 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2506,18 +2506,6 @@ static int dwc3_gadget_ep_reclaim_trb_linear(struct dwc3_ep *dep,
 			event, status, false);
 }
 
-static bool dwc3_gadget_ep_request_completed(struct dwc3_request *req)
-{
-	/*
-	 * For OUT direction, host may send less than the setup
-	 * length. Return true for all OUT requests.
-	 */
-	if (!req->direction)
-		return true;
-
-	return req->request.actual == req->request.length;
-}
-
 static int dwc3_gadget_ep_cleanup_completed_request(struct dwc3_ep *dep,
 		const struct dwc3_event_depevt *event,
 		struct dwc3_request *req, int status)
@@ -2539,8 +2527,7 @@ static int dwc3_gadget_ep_cleanup_completed_request(struct dwc3_ep *dep,
 
 	req->request.actual = req->request.length - req->remaining;
 
-	if (!dwc3_gadget_ep_request_completed(req) ||
-			req->num_pending_sgs) {
+	if (req->num_pending_sgs) {
 		__dwc3_gadget_kick_transfer(dep);
 		goto out;
 	}
-- 
2.11.0

