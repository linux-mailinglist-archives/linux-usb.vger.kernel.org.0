Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B83A9197109
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2020 01:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbgC2XNA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 29 Mar 2020 19:13:00 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:45286 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726382AbgC2XNA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 29 Mar 2020 19:13:00 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 91E3CC0084;
        Sun, 29 Mar 2020 23:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1585523580; bh=RCGxBtxYv8rVaTq3wV0YTMUlztC7z8o6YvFJ+dJwEaA=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=RWaJtr713SG6j4Rwki7YR2+FlRzkPoksboI9p+JycmJ5bjd5Vifg7A91oKfzuYerH
         g/yMdzvmO9K46qnrn/d0HklHSKQqn610g53MlAmZ2GOYODo9tCYUTMU8f/Niec+S8R
         w728eOXlbha5usv3QpEotNE/BMnUttQtqQIHJhENdcZFDNJMrltFrvGZrIzZG6Yby2
         qisfvd9Tn7fWqCX9EN4mJSBKlAYlrMNYiHJ4rUfj8/4uB8NDckM7w2m97PWXKxGKXN
         n45WMgD7AQn6loN+T1aug40HtHlVTi8+82RD5iWc3xSzCQJNoS0/AMy8gYq3wH6jbL
         Ab1DKDAClZAeA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id E2941A006D;
        Sun, 29 Mar 2020 23:12:57 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Sun, 29 Mar 2020 16:12:57 -0700
Date:   Sun, 29 Mar 2020 16:12:57 -0700
Message-Id: <e20a7c12313427787fc22f0a4318ee632245d041.1585523081.git.thinhn@synopsys.com>
In-Reply-To: <cover.1585523081.git.thinhn@synopsys.com>
References: <cover.1585523081.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 1/4] usb: dwc3: gadget: Properly handle failed kick_transfer
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If dwc3 fails to issue START_TRANSFER/UPDATE_TRANSFER command, then we
should properly end an active transfer and give back all the started
requests. However if it's for an isoc endpoint, the failure maybe due to
bus-expiry status. In this case, don't give back the requests and wait
for the next retry.

Fixes: 72246da40f37 ("usb: Introduce DesignWare USB3 DRD Driver")
Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 6d2b3de455cc..b02832ad9e72 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1220,6 +1220,8 @@ static void dwc3_prepare_trbs(struct dwc3_ep *dep)
 	}
 }
 
+static void dwc3_gadget_ep_cleanup_cancelled_requests(struct dwc3_ep *dep);
+
 static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep)
 {
 	struct dwc3_gadget_ep_cmd_params params;
@@ -1259,14 +1261,20 @@ static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep)
 
 	ret = dwc3_send_gadget_ep_cmd(dep, cmd, &params);
 	if (ret < 0) {
-		/*
-		 * FIXME we need to iterate over the list of requests
-		 * here and stop, unmap, free and del each of the linked
-		 * requests instead of what we do now.
-		 */
-		if (req->trb)
-			memset(req->trb, 0, sizeof(struct dwc3_trb));
-		dwc3_gadget_del_and_unmap_request(dep, req, ret);
+		struct dwc3_request *tmp;
+
+		if (ret == -EAGAIN)
+			return ret;
+
+		dwc3_stop_active_transfer(dep, true, true);
+
+		list_for_each_entry_safe(req, tmp, &dep->started_list, list)
+			dwc3_gadget_move_cancelled_request(req);
+
+		/* If ep isn't started, then there's no end transfer pending */
+		if (!(dep->flags & DWC3_EP_END_TRANSFER_PENDING))
+			dwc3_gadget_ep_cleanup_cancelled_requests(dep);
+
 		return ret;
 	}
 
-- 
2.11.0

