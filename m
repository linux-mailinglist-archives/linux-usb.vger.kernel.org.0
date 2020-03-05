Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 832BA17B097
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2020 22:24:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726209AbgCEVYQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Mar 2020 16:24:16 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:53418 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726184AbgCEVYP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Mar 2020 16:24:15 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8413343BE1;
        Thu,  5 Mar 2020 21:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1583443455; bh=i3rMXF7SBF5opHO2qJfGYBkbDJlOg5UEpxWLu7PbXVs=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=OQrNubxQMJDt16iP12ugdbQMTH12zZemCNWlxDvQIEcJJQxvTSKBmmVKvlqks7XVL
         TgmcX2HhPoLcOAwLwxEoJ1g0ypOjNxjB6jMN3CX1qWN0b77mshFKU5zJZ9Jh3awI2R
         foJRQ4IVEpJnH7k48RQwwxH/szSyyJANmHXy0kLRxcf0fl+PBlXfappEWy67al4MPt
         /ZRkvbdcRBiFOgTAk+Uz2moeWEHnR4jJ5kjQ4mOauVT36BJ12R4mwE9XmW9uzdhUQz
         zMHMMavdk8yhn5HZu9Xipp0tB3hmCfQ7mYo8L+2N6lrR3Z5kELEPtpAtIsD+OTUiLw
         D5yTB/BTLk9Dw==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 6F3F7A0078;
        Thu,  5 Mar 2020 21:24:14 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 05 Mar 2020 13:24:14 -0800
Date:   Thu, 05 Mar 2020 13:24:14 -0800
Message-Id: <7317cc35ba4aa18fbb19ef8048d38bd03f80bd10.1583443184.git.thinhn@synopsys.com>
In-Reply-To: <cover.1583443184.git.thinhn@synopsys.com>
References: <cover.1583443184.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 5/6] usb: dwc3: gadget: Remove unnecessary checks
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Remove 2 unnecessary checks:
1) A request in the started_list must have its trb field set. So
checking for req->trb is unnecessary.

2) An endpoint must have started (and have not ended) for the request to
still be in the started_list. There's no point to check if the endpoint
is started. We had this check because previously the driver didn't
handle the endpoint's started/ended flags for END_TRANSFER command
properly. See commit 9f45581f5eec ("usb: dwc3: gadget: early giveback
if End Transfer already completed").

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 42dc4973a997..cd00f2757cb5 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1574,9 +1574,6 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
 			/* wait until it is processed */
 			dwc3_stop_active_transfer(dep, true, true);
 
-			if (!r->trb)
-				goto out0;
-
 			/*
 			 * Remove any started request if the transfer is
 			 * cancelled.
@@ -1584,10 +1581,7 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
 			list_for_each_entry_safe(r, t, &dep->started_list, list)
 				dwc3_gadget_move_cancelled_request(r);
 
-			if (dep->flags & DWC3_EP_TRANSFER_STARTED)
-				goto out0;
-			else
-				goto out1;
+			goto out0;
 		}
 		dev_err(dwc->dev, "request %pK was not queued to %s\n",
 				request, ep->name);
@@ -1595,7 +1589,6 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
 		goto out0;
 	}
 
-out1:
 	dwc3_gadget_giveback(dep, req, -ECONNRESET);
 
 out0:
-- 
2.11.0

