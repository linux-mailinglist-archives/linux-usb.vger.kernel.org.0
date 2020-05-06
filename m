Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 542811C65F7
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2020 04:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgEFCql (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 May 2020 22:46:41 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:35324 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725915AbgEFCqk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 May 2020 22:46:40 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 742DA407EB;
        Wed,  6 May 2020 02:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588733200; bh=fVQGphNaK6vsw+djrlG972AwxHW+TxpYNDAmECvVKeA=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=HSjcrW0Ezlw80H7aOWNLE+EUL3KixgvX93sroe2FRcBFrUX+ZdCWlfNZxAmpQ61zt
         wZRm9CqdwZni3egJ4nnTgGrveW6z6jo9DxWMqyUIFHBlFn2LJr6pRUiWuKX/GP94Cu
         Nt0OhGjZsjnVudhVY/qF2VeutgMm5QsNb8Of44zob+kwI7jfOtNtjVFVTtwJyiMzK2
         pxnOK+/FZIQIlHeXwweM7Xqi8ADvBqJbmr9vrnqNirmJSu9JRhpx7JvBOUTCCIQCDG
         MtGfxSy+RAQGIaTdDeotL3fzUFvVYSxiqhdadVPAAu6pergn1O15uCiWm9A4XQqIU6
         rpO+CoNcl+p4w==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 5DBE7A025B;
        Wed,  6 May 2020 02:46:39 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 05 May 2020 19:46:39 -0700
Date:   Tue, 05 May 2020 19:46:39 -0700
Message-Id: <74771c4ae93eb67e16f868b7b62f576c03d866a7.1588732815.git.thinhn@synopsys.com>
In-Reply-To: <cover.1588732815.git.thinhn@synopsys.com>
References: <cover.1588732815.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 05/11] usb: dwc3: gadget: Refactor TRB completion handler
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To prepare for handling of XferComplete event, let's refactor and split
up dwc3_gadget_endpoint_transfer_in_progress() to handle TRBs completion
for different events. The handling of TRBs completion will be the same,
but the status of XferComplete event is different than XferInProgress.
No functional change in this commit.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 45 ++++++++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 3bb6f847a865..5f98b424f20b 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2654,34 +2654,22 @@ static void dwc3_gadget_endpoint_frame_from_event(struct dwc3_ep *dep,
 	dep->frame_number = event->parameters;
 }
 
-static void dwc3_gadget_endpoint_transfer_in_progress(struct dwc3_ep *dep,
-		const struct dwc3_event_depevt *event)
+static bool dwc3_gadget_endpoint_trbs_complete(struct dwc3_ep *dep,
+		const struct dwc3_event_depevt *event, int status)
 {
 	struct dwc3		*dwc = dep->dwc;
-	unsigned		status = 0;
-	bool			stop = false;
-
-	dwc3_gadget_endpoint_frame_from_event(dep, event);
-
-	if (event->status & DEPEVT_STATUS_BUSERR)
-		status = -ECONNRESET;
-
-	if (event->status & DEPEVT_STATUS_MISSED_ISOC) {
-		status = -EXDEV;
-
-		if (list_empty(&dep->started_list))
-			stop = true;
-	}
+	bool			no_started_trb = true;
 
 	dwc3_gadget_ep_cleanup_completed_requests(dep, event, status);
 
 	if (dep->flags & DWC3_EP_END_TRANSFER_PENDING)
 		goto out;
 
-	if (stop)
+	if (status == -EXDEV && list_empty(&dep->started_list))
 		dwc3_stop_active_transfer(dep, true, true);
 	else if (dwc3_gadget_ep_should_continue(dep))
-		__dwc3_gadget_kick_transfer(dep);
+		if (__dwc3_gadget_kick_transfer(dep) == 0)
+			no_started_trb = false;
 
 out:
 	/*
@@ -2699,7 +2687,7 @@ static void dwc3_gadget_endpoint_transfer_in_progress(struct dwc3_ep *dep,
 				continue;
 
 			if (!list_empty(&dep->started_list))
-				return;
+				return no_started_trb;
 		}
 
 		reg = dwc3_readl(dwc->regs, DWC3_DCTL);
@@ -2708,6 +2696,25 @@ static void dwc3_gadget_endpoint_transfer_in_progress(struct dwc3_ep *dep,
 
 		dwc->u1u2 = 0;
 	}
+
+	return no_started_trb;
+}
+
+static void dwc3_gadget_endpoint_transfer_in_progress(struct dwc3_ep *dep,
+		const struct dwc3_event_depevt *event)
+{
+	int status = 0;
+
+	if (usb_endpoint_xfer_isoc(dep->endpoint.desc))
+		dwc3_gadget_endpoint_frame_from_event(dep, event);
+
+	if (event->status & DEPEVT_STATUS_BUSERR)
+		status = -ECONNRESET;
+
+	if (event->status & DEPEVT_STATUS_MISSED_ISOC)
+		status = -EXDEV;
+
+	dwc3_gadget_endpoint_trbs_complete(dep, event, status);
 }
 
 static void dwc3_gadget_endpoint_transfer_not_ready(struct dwc3_ep *dep,
-- 
2.11.0

