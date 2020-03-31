Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEA29198EB9
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2020 10:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730131AbgCaIko (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 04:40:44 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:33664 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726488AbgCaIko (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Mar 2020 04:40:44 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AB76C401AB;
        Tue, 31 Mar 2020 08:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1585644043; bh=orwox/7oEKwbKl44skozLhJL5crpioMAIG9/u5SFNTw=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=CcSaew1JkJ4v1+pWQwkhskpA8EzVGMe4bJ2d0l1uyiyv2sauKf4D+OA2T/rGgu6En
         h9H4dryxZkpP4Z/n/JbpEb2v1GmP2RMLaZEBA+UNXtTmZp2ibTHViutJmWOq1aJwCd
         HhS/xQmjlRLIjXnfuZsnazqzLTtqwLpjzd44UvDuFZXFLm5/aJ2lsIR8t/xG41+nnG
         Z2bvyisQhbP1BCpo/zDYSZiP/RGFk3dkBiZpmx+USWDYaFYWd5QNhAvv2HjWMcxugd
         yw+7NVDxZJC2WhsNBLwAK/VTpaXzHzxu4TXR0kPN3GzqdaSOl6KFqjQm6U/v4cwhwZ
         Odaytl0tcs1hw==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 56F32A007B;
        Tue, 31 Mar 2020 08:40:42 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 31 Mar 2020 01:40:42 -0700
Date:   Tue, 31 Mar 2020 01:40:42 -0700
Message-Id: <c9e842b927f4050ac4a76e86aa5579d772af5135.1585643834.git.thinhn@synopsys.com>
In-Reply-To: <bed19f474892bb74be92b762c6727a6a7d0106e4.1585643834.git.thinhn@synopsys.com>
References: <bed19f474892bb74be92b762c6727a6a7d0106e4.1585643834.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 2/2] usb: dwc3: gadget: Continue to process pending requests
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If there are still pending requests because no TRB was available,
prepare more when started requests are completed.

Introduce dwc3_gadget_ep_should_continue() to check for incomplete and
pending requests to resume updating new TRBs to the controller's TRB
cache.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
Changes in v2:
 - None

 drivers/usb/dwc3/gadget.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index c45853b14cff..3c4024d34434 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2574,10 +2574,8 @@ static int dwc3_gadget_ep_cleanup_completed_request(struct dwc3_ep *dep,
 
 	req->request.actual = req->request.length - req->remaining;
 
-	if (!dwc3_gadget_ep_request_completed(req)) {
-		__dwc3_gadget_kick_transfer(dep);
+	if (!dwc3_gadget_ep_request_completed(req))
 		goto out;
-	}
 
 	dwc3_gadget_giveback(dep, req, status);
 
@@ -2601,6 +2599,24 @@ static void dwc3_gadget_ep_cleanup_completed_requests(struct dwc3_ep *dep,
 	}
 }
 
+static bool dwc3_gadget_ep_should_continue(struct dwc3_ep *dep)
+{
+	struct dwc3_request	*req;
+
+	if (!list_empty(&dep->pending_list))
+		return true;
+
+	/*
+	 * We only need to check the first entry of the started list. We can
+	 * assume the completed requests are removed from the started list.
+	 */
+	req = next_request(&dep->started_list);
+	if (!req)
+		return false;
+
+	return !dwc3_gadget_ep_request_completed(req);
+}
+
 static void dwc3_gadget_endpoint_frame_from_event(struct dwc3_ep *dep,
 		const struct dwc3_event_depevt *event)
 {
@@ -2630,6 +2646,8 @@ static void dwc3_gadget_endpoint_transfer_in_progress(struct dwc3_ep *dep,
 
 	if (stop)
 		dwc3_stop_active_transfer(dep, true, true);
+	else if (dwc3_gadget_ep_should_continue(dep))
+		__dwc3_gadget_kick_transfer(dep);
 
 	/*
 	 * WORKAROUND: This is the 2nd half of U1/U2 -> U0 workaround.
-- 
2.11.0

