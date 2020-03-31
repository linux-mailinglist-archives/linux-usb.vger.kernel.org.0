Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B45FA1989AA
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2020 03:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729239AbgCaBzF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Mar 2020 21:55:05 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:47330 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729089AbgCaBzF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Mar 2020 21:55:05 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 75380C0FDE;
        Tue, 31 Mar 2020 01:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1585619704; bh=8VlwsDwtSalujAW89F+NTDDWavApHp975EpzhHu3DZw=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=kU65Quq+ha9dMum83ciackTIzDvonyCUj7gQbFeCM5j5kj5y3SLKnQLFiaHBYEc7c
         aCjl8xxTgZ2Adt7x2Xj40LynfXmkWFB/lDhRzt7jrLSsa3jYYC+0kpJtRzs0ARUoLW
         ynpUF3EAGBdT8JMSPcmThc87oH/DeeEGo9JcJbum8jzCSidKFsM+iJDDeep/8KwAq/
         3SFtdwbsFBLSToBrK38o8A3M/YMOrhy7mSE8r+ltGAzS62BAfSdE0D954cVlZZvAfs
         ksvQnhxwQkYFmhLJmgn4m9/RN7ULbxBpVlzBHN85gYz3EsEhkd0OGoJa4S8IqeXVEk
         zQnQie4E2njQw==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 02A96A007B;
        Tue, 31 Mar 2020 01:55:02 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 30 Mar 2020 18:55:02 -0700
Date:   Mon, 30 Mar 2020 18:55:02 -0700
Message-Id: <23622902d05e7fc24f60de868bd4810f6194f64f.1585619602.git.thinhn@synopsys.com>
In-Reply-To: <07653eda952a5afaca528a69f9b3d160ee695db1.1585619602.git.thinhn@synopsys.com>
References: <07653eda952a5afaca528a69f9b3d160ee695db1.1585619602.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 2/2] usb: dwc3: gadget: Continue to process pending requests
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

