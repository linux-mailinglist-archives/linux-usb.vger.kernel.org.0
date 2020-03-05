Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 919E317B098
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2020 22:24:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgCEVYW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Mar 2020 16:24:22 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:53428 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726184AbgCEVYV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Mar 2020 16:24:21 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 95AAD43BE1;
        Thu,  5 Mar 2020 21:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1583443461; bh=3/XMRGShBnl0C1pKRoEEBidRVlpCQ65FOlu6h1QXl1w=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=h55bMNdPCboO3IntyLISNxGpeCxLqhnfaYcoRfK72GF2MURuE7Hm3M38GV7rAp5VA
         hYhezFquVOvfpM0sgb/QzIQjz1arQTP3yQP8cO1m832H5HtwpZ7FqGB51RnBe07NTG
         uVIWOXkf9Q49e1ShBqh8yEMO8sNUsJUlA+IIG6aBfQTkLBnASiWd410Wo5MKk//65i
         hGp4XIA0zJdm2O8cSL0p/4FEKkXWaI9rgaUf2b+p/GsR4tZopvASzsm2YgoTxvUUCj
         3TqBVn/htCLRnHjRxYI4JxxgFhgvMaFd/I5wRiYfwUMKWBKlThoLkQaxwf5+s9bQN6
         ylTTs5QWf3bPQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 8180EA006E;
        Thu,  5 Mar 2020 21:24:20 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 05 Mar 2020 13:24:20 -0800
Date:   Thu, 05 Mar 2020 13:24:20 -0800
Message-Id: <17318e194eea91aca59a1965967f953a55629d1e.1583443184.git.thinhn@synopsys.com>
In-Reply-To: <cover.1583443184.git.thinhn@synopsys.com>
References: <cover.1583443184.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 6/6] usb: dwc3: gadget: Refactor dwc3_gadget_ep_dequeue
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The flow from function dwc3_gadget_ep_dequeue() is not easy to follow.
Refactor it for easier read. No functional change in this commit.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index cd00f2757cb5..39c92df6e188 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1555,19 +1555,17 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
 
 	list_for_each_entry(r, &dep->cancelled_list, list) {
 		if (r == req)
-			goto out0;
+			goto out;
 	}
 
 	list_for_each_entry(r, &dep->pending_list, list) {
-		if (r == req)
-			break;
+		if (r == req) {
+			dwc3_gadget_giveback(dep, req, -ECONNRESET);
+			goto out;
+		}
 	}
 
-	if (r != req) {
-		list_for_each_entry(r, &dep->started_list, list) {
-			if (r == req)
-				break;
-		}
+	list_for_each_entry(r, &dep->started_list, list) {
 		if (r == req) {
 			struct dwc3_request *t;
 
@@ -1581,17 +1579,14 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
 			list_for_each_entry_safe(r, t, &dep->started_list, list)
 				dwc3_gadget_move_cancelled_request(r);
 
-			goto out0;
+			goto out;
 		}
-		dev_err(dwc->dev, "request %pK was not queued to %s\n",
-				request, ep->name);
-		ret = -EINVAL;
-		goto out0;
 	}
 
-	dwc3_gadget_giveback(dep, req, -ECONNRESET);
-
-out0:
+	dev_err(dwc->dev, "request %pK was not queued to %s\n",
+		request, ep->name);
+	ret = -EINVAL;
+out:
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	return ret;
-- 
2.11.0

