Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D69CB17B093
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2020 22:23:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbgCEVX5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Mar 2020 16:23:57 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:53404 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726143AbgCEVX5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Mar 2020 16:23:57 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A645843BE1;
        Thu,  5 Mar 2020 21:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1583443436; bh=214pxbdSMsKMcN2v9wPcKz8IvNgRgep1Z23xn7RhH6Y=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=Da85A0EL5V/WZ+dqwzgu5tHMfYY0OnY7dYBGi/Qk8utzJUk0x+ztlXox02LvGlvqf
         +RLs/vaE8U3dXaTyXgSphwZRHsMC8XoV2lxtjwA7OHXhCJynd4AiBKIiBjxu0PftG1
         96qjxGVhHcMK5bEYZD3l82Iv00ePgZcEZNjE85tPFHzADb+Jz4GXZmhTMcx9szRX8a
         ldl5YPtpKY5WHEEnh6o72EazZvl+a9zb3HWm+z6GZx9OOW3JUMJdpuKw7NmG8RreGe
         qlYkP08sK9mMtUgttq59qWft20MZqY9uqXWXvTKt+1sYeoptApmi88fIwFxIxPJRGh
         Xvd5ch1Lz9YRQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 90C4AA006D;
        Thu,  5 Mar 2020 21:23:55 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 05 Mar 2020 13:23:55 -0800
Date:   Thu, 05 Mar 2020 13:23:55 -0800
Message-Id: <4f9b6acbff2cd0be417fd4a943c1975bf41f8fda.1583443184.git.thinhn@synopsys.com>
In-Reply-To: <cover.1583443184.git.thinhn@synopsys.com>
References: <cover.1583443184.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 2/6] usb: dwc3: gadget: Properly handle ClearFeature(halt)
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DWC3 must not issue CLEAR_STALL command to control endpoints. The
controller automatically clears the STALL when it receives the SETUP
token. Also, when the driver receives ClearFeature(halt_ep), DWC3 must
stop any active transfer from the endpoint and give back all the
requests to the function drivers.

Fixes: 72246da40f37 ("usb: Introduce DesignWare USB3 DRD Driver")
Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index b87bdec84210..21b10364b888 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1501,6 +1501,10 @@ static void dwc3_gadget_ep_skip_trbs(struct dwc3_ep *dep, struct dwc3_request *r
 {
 	int i;
 
+	/* If req->trb is not set, then the request has not started */
+	if (!req->trb)
+		return;
+
 	/*
 	 * If request was already started, this means we had to
 	 * stop the transfer. With that we also need to ignore
@@ -1591,6 +1595,8 @@ int __dwc3_gadget_ep_set_halt(struct dwc3_ep *dep, int value, int protocol)
 {
 	struct dwc3_gadget_ep_cmd_params	params;
 	struct dwc3				*dwc = dep->dwc;
+	struct dwc3_request			*req;
+	struct dwc3_request			*tmp;
 	int					ret;
 
 	if (usb_endpoint_xfer_isoc(dep->endpoint.desc)) {
@@ -1627,13 +1633,37 @@ int __dwc3_gadget_ep_set_halt(struct dwc3_ep *dep, int value, int protocol)
 		else
 			dep->flags |= DWC3_EP_STALL;
 	} else {
+		/*
+		 * Don't issue CLEAR_STALL command to control endpoints. The
+		 * controller automatically clears the STALL when it receives
+		 * the SETUP token.
+		 */
+		if (dep->number <= 1) {
+			dep->flags &= ~(DWC3_EP_STALL | DWC3_EP_WEDGE);
+			return 0;
+		}
 
 		ret = dwc3_send_clear_stall_ep_cmd(dep);
-		if (ret)
+		if (ret) {
 			dev_err(dwc->dev, "failed to clear STALL on %s\n",
 					dep->name);
-		else
-			dep->flags &= ~(DWC3_EP_STALL | DWC3_EP_WEDGE);
+			return ret;
+		}
+
+		dep->flags &= ~(DWC3_EP_STALL | DWC3_EP_WEDGE);
+
+		dwc3_stop_active_transfer(dep, true, true);
+
+		list_for_each_entry_safe(req, tmp, &dep->started_list, list)
+			dwc3_gadget_move_cancelled_request(req);
+
+		list_for_each_entry_safe(req, tmp, &dep->pending_list, list)
+			dwc3_gadget_move_cancelled_request(req);
+
+		if (!(dep->flags & DWC3_EP_END_TRANSFER_PENDING)) {
+			dep->flags &= ~DWC3_EP_DELAY_START;
+			dwc3_gadget_ep_cleanup_cancelled_requests(dep);
+		}
 	}
 
 	return ret;
-- 
2.11.0

