Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5D0217B096
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2020 22:24:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgCEVYK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Mar 2020 16:24:10 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:47454 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726143AbgCEVYK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Mar 2020 16:24:10 -0500
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9306EC10CC;
        Thu,  5 Mar 2020 21:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1583443449; bh=tlrczmuj3wkip53r4dwXEWw86BROUDoqoipoiLsF5SI=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=JIG5lTXUAMSwwQ3yz9YEIRobHccY19BJ3fRwiqHGlsIpGTGy7mBEc6xt0sezk0Beo
         fZrNPL/TrvvOyRdpzs78ZcQxF/a3CtikR+pw73qw601YuLc9I+kxzDH9pjQwFs3YiK
         5/UUT/+OdOSCaGdjKKTE+E+N2y923FcZepfu01nSgIxfzr7rCY6jcIusadjWbjyd2B
         nA2//ZOkaRbSSKopRdntchBFhf5+53Vm9eQdSYNOVGb4awPzLJTJvZAOp2p13gQtw9
         9ow444HTZoaq+vrSI1GGncnNv/9rxthJzWzQzg+VvuOvP/VOoTMKJKXIeGMA4AbyzH
         dWpVBot9TKp3Q==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 5CA86A0096;
        Thu,  5 Mar 2020 21:24:08 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 05 Mar 2020 13:24:08 -0800
Date:   Thu, 05 Mar 2020 13:24:08 -0800
Message-Id: <a3732fbf370a2cf180c1c5757f46faed8399bbe5.1583443184.git.thinhn@synopsys.com>
In-Reply-To: <cover.1583443184.git.thinhn@synopsys.com>
References: <cover.1583443184.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 4/6] usb: dwc3: gadget: Give back staled requests
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If a request is dequeued, the transfer is cancelled. Give back all
the started requests.

In most scenarios, the function driver dequeues all requests of a
transfer when there's a failure. If the function driver follows this,
then it's fine. If not, then we'd be skipping TRBs at different points
within the dequeue and enqueue pointers, making dequeue/enqueue pointers
useless. To enforce and make sure that we're properly skipping TRBs,
cancel all the started requests and give back all the cancelled requests
to the function drivers.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 8c27c6ede7c4..42dc4973a997 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1553,6 +1553,11 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
 
 	spin_lock_irqsave(&dwc->lock, flags);
 
+	list_for_each_entry(r, &dep->cancelled_list, list) {
+		if (r == req)
+			goto out0;
+	}
+
 	list_for_each_entry(r, &dep->pending_list, list) {
 		if (r == req)
 			break;
@@ -1564,13 +1569,21 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
 				break;
 		}
 		if (r == req) {
+			struct dwc3_request *t;
+
 			/* wait until it is processed */
 			dwc3_stop_active_transfer(dep, true, true);
 
 			if (!r->trb)
 				goto out0;
 
-			dwc3_gadget_move_cancelled_request(req);
+			/*
+			 * Remove any started request if the transfer is
+			 * cancelled.
+			 */
+			list_for_each_entry_safe(r, t, &dep->started_list, list)
+				dwc3_gadget_move_cancelled_request(r);
+
 			if (dep->flags & DWC3_EP_TRANSFER_STARTED)
 				goto out0;
 			else
-- 
2.11.0

