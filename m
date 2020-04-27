Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A14B11BB17E
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 00:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgD0W2C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Apr 2020 18:28:02 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:53204 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726224AbgD0W2B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Apr 2020 18:28:01 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8E9694051C;
        Mon, 27 Apr 2020 22:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588026481; bh=U5CZar/afv5i69i1A78hC8Ou7v8FLEKSOTY8SKYcWok=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=I+M/dPrZIIqRipNLv4Ry+DD2VulBqm9UmiGiOqASeBjdwy7RGG3JTJuKoi+uQzfZs
         slbc/qoyQNJYHGOZnJo4GivNPpzQle+hnH/cmKsGQzr6NLDO0Z5SVKz/oRv81v61l+
         tDoeBjst0m+zvN/Aa68wh5dNW1lut+2zUihErvY0e3B/6HhV6nn38dXViS1RE0ggCj
         eimNPRZ620zTlCFV6YAx7nuve6AXWshjxmwS3OzWEKrYS0pYNwTkOCVtodVwJ78Lcv
         b//jxlQTloeshscIX10UaWXWY5cB+nfzru0PAGxwB1D0ax3EtGXn4smgD20S47CQZ2
         ldyj+2h8fuQBA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 3AEDAA006D;
        Mon, 27 Apr 2020 22:28:00 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 27 Apr 2020 15:27:59 -0700
Date:   Mon, 27 Apr 2020 15:27:59 -0700
Message-Id: <70555c2202529c6e0bdd23124003d0d4bc637cdc.1588025916.git.thinhn@synopsys.com>
In-Reply-To: <cover.1588025916.git.thinhn@synopsys.com>
References: <cover.1588025916.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 4/5] usb: dwc3: gadget: Handle transfer completion
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

With the new usb_request->is_last field, now the function drivers can
inform which request is the end of a transfer, dwc3 can program its TRBs
to let the controller know when to free its resources when a transfer
completes. This is required for stream transfers. The controller needs
to know where one stream starts and ends to properly allocate resources
for different streams.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/core.h   |   1 +
 drivers/usb/dwc3/gadget.c | 107 ++++++++++++++++++++++++++++++++--------------
 2 files changed, 77 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 7204a838ec06..b11183a715a7 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -701,6 +701,7 @@ struct dwc3_ep {
 #define DWC3_EP_END_TRANSFER_PENDING BIT(4)
 #define DWC3_EP_PENDING_REQUEST	BIT(5)
 #define DWC3_EP_DELAY_START	BIT(6)
+#define DWC3_EP_WAIT_TRANSFER_COMPLETE	BIT(7)
 
 	/* This last one is specific to EP0 */
 #define DWC3_EP0_DIR_IN		BIT(31)
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 865e6fbb7360..628f9d142876 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -579,6 +579,7 @@ static int dwc3_gadget_set_ep_config(struct dwc3_ep *dep, unsigned int action)
 
 	if (usb_ss_max_streams(comp_desc) && usb_endpoint_xfer_bulk(desc)) {
 		params.param1 |= DWC3_DEPCFG_STREAM_CAPABLE
+			| DWC3_DEPCFG_XFER_COMPLETE_EN
 			| DWC3_DEPCFG_STREAM_EVENT_EN;
 		dep->stream_capable = true;
 	}
@@ -917,8 +918,9 @@ static u32 dwc3_calc_trbs_left(struct dwc3_ep *dep)
 }
 
 static void __dwc3_prepare_one_trb(struct dwc3_ep *dep, struct dwc3_trb *trb,
-		dma_addr_t dma, unsigned length, unsigned chain, unsigned node,
-		unsigned stream_id, unsigned short_not_ok, unsigned no_interrupt)
+		dma_addr_t dma, unsigned length, unsigned chain,
+		unsigned is_last, unsigned node, unsigned stream_id,
+		unsigned short_not_ok, unsigned no_interrupt)
 {
 	struct dwc3		*dwc = dep->dwc;
 	struct usb_gadget	*gadget = &dwc->gadget;
@@ -1011,6 +1013,8 @@ static void __dwc3_prepare_one_trb(struct dwc3_ep *dep, struct dwc3_trb *trb,
 
 	if (chain)
 		trb->ctrl |= DWC3_TRB_CTRL_CHN;
+	else if (!usb_endpoint_xfer_isoc(dep->endpoint.desc) && is_last)
+		trb->ctrl |= DWC3_TRB_CTRL_LST;
 
 	if (usb_endpoint_xfer_bulk(dep->endpoint.desc) && dep->stream_capable)
 		trb->ctrl |= DWC3_TRB_CTRL_SID_SOFN(stream_id);
@@ -1038,6 +1042,7 @@ static void dwc3_prepare_one_trb(struct dwc3_ep *dep,
 	unsigned		stream_id = req->request.stream_id;
 	unsigned		short_not_ok = req->request.short_not_ok;
 	unsigned		no_interrupt = req->request.no_interrupt;
+	unsigned		is_last = req->request.is_last;
 
 	if (req->request.num_sgs > 0) {
 		length = sg_dma_len(req->start_sg);
@@ -1057,7 +1062,7 @@ static void dwc3_prepare_one_trb(struct dwc3_ep *dep,
 
 	req->num_trbs++;
 
-	__dwc3_prepare_one_trb(dep, trb, dma, length, chain, node,
+	__dwc3_prepare_one_trb(dep, trb, dma, length, chain, is_last, node,
 			stream_id, short_not_ok, no_interrupt);
 }
 
@@ -1100,7 +1105,8 @@ static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 			trb = &dep->trb_pool[dep->trb_enqueue];
 			req->num_trbs++;
 			__dwc3_prepare_one_trb(dep, trb, dwc->bounce_addr,
-					maxp - rem, false, 1,
+					maxp - rem, false,
+					req->request.is_last, 1,
 					req->request.stream_id,
 					req->request.short_not_ok,
 					req->request.no_interrupt);
@@ -1145,7 +1151,8 @@ static void dwc3_prepare_one_trb_linear(struct dwc3_ep *dep,
 		trb = &dep->trb_pool[dep->trb_enqueue];
 		req->num_trbs++;
 		__dwc3_prepare_one_trb(dep, trb, dwc->bounce_addr, maxp - rem,
-				false, 1, req->request.stream_id,
+				false, req->request.is_last, 1,
+				req->request.stream_id,
 				req->request.short_not_ok,
 				req->request.no_interrupt);
 	} else if (req->request.zero && req->request.length &&
@@ -1162,7 +1169,8 @@ static void dwc3_prepare_one_trb_linear(struct dwc3_ep *dep,
 		trb = &dep->trb_pool[dep->trb_enqueue];
 		req->num_trbs++;
 		__dwc3_prepare_one_trb(dep, trb, dwc->bounce_addr, 0,
-				false, 1, req->request.stream_id,
+				false, req->request.is_last, 1,
+				req->request.stream_id,
 				req->request.short_not_ok,
 				req->request.no_interrupt);
 	} else {
@@ -1223,6 +1231,10 @@ static void dwc3_prepare_trbs(struct dwc3_ep *dep)
 
 		if (!dwc3_calc_trbs_left(dep))
 			return;
+
+		/* Don't prepare ahead. This is not an option for DWC_usb32. */
+		if (req->request.is_last)
+			return;
 	}
 }
 
@@ -1284,6 +1296,9 @@ static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep)
 		return ret;
 	}
 
+	if (req->request.is_last)
+		dep->flags |= DWC3_EP_WAIT_TRANSFER_COMPLETE;
+
 	return 0;
 }
 
@@ -1490,6 +1505,9 @@ static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct dwc3_request *req)
 	list_add_tail(&req->list, &dep->pending_list);
 	req->status = DWC3_REQUEST_STATUS_QUEUED;
 
+	if (dep->flags & DWC3_EP_WAIT_TRANSFER_COMPLETE)
+		return 0;
+
 	/* Start the transfer only after the END_TRANSFER is completed */
 	if (dep->flags & DWC3_EP_END_TRANSFER_PENDING) {
 		dep->flags |= DWC3_EP_DELAY_START;
@@ -2648,37 +2666,22 @@ static bool dwc3_gadget_ep_should_continue(struct dwc3_ep *dep)
 	return !dwc3_gadget_ep_request_completed(req);
 }
 
-static void dwc3_gadget_endpoint_frame_from_event(struct dwc3_ep *dep,
-		const struct dwc3_event_depevt *event)
-{
-	dep->frame_number = event->parameters;
-}
-
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
 
-	if (stop)
+	if (dep->flags & DWC3_EP_END_TRANSFER_PENDING)
+		return no_started_trb;
+
+	if (status == -EXDEV && list_empty(&dep->started_list))
 		dwc3_stop_active_transfer(dep, true, true);
 	else if (dwc3_gadget_ep_should_continue(dep))
-		__dwc3_gadget_kick_transfer(dep);
+		if (__dwc3_gadget_kick_transfer(dep) == 0)
+			no_started_trb = false;
 
 	/*
 	 * WORKAROUND: This is the 2nd half of U1/U2 -> U0 workaround.
@@ -2695,7 +2698,7 @@ static void dwc3_gadget_endpoint_transfer_in_progress(struct dwc3_ep *dep,
 				continue;
 
 			if (!list_empty(&dep->started_list))
-				return;
+				return no_started_trb;
 		}
 
 		reg = dwc3_readl(dwc->regs, DWC3_DCTL);
@@ -2704,6 +2707,45 @@ static void dwc3_gadget_endpoint_transfer_in_progress(struct dwc3_ep *dep,
 
 		dwc->u1u2 = 0;
 	}
+
+	return no_started_trb;
+}
+
+static void dwc3_gadget_endpoint_frame_from_event(struct dwc3_ep *dep,
+		const struct dwc3_event_depevt *event)
+{
+	dep->frame_number = event->parameters;
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
+}
+
+static void dwc3_gadget_endpoint_transfer_complete(struct dwc3_ep *dep,
+		const struct dwc3_event_depevt *event)
+{
+	int status = 0;
+
+	dep->flags &= ~DWC3_EP_TRANSFER_STARTED;
+
+	if (event->status & DEPEVT_STATUS_BUSERR)
+		status = -ECONNRESET;
+
+	if (dwc3_gadget_endpoint_trbs_complete(dep, event, status))
+		dep->flags &= ~DWC3_EP_WAIT_TRANSFER_COMPLETE;
 }
 
 static void dwc3_gadget_endpoint_transfer_not_ready(struct dwc3_ep *dep,
@@ -2770,7 +2812,10 @@ static void dwc3_endpoint_interrupt(struct dwc3 *dwc,
 		}
 		break;
 	case DWC3_DEPEVT_STREAMEVT:
+		break;
 	case DWC3_DEPEVT_XFERCOMPLETE:
+		dwc3_gadget_endpoint_transfer_complete(dep, event);
+		break;
 	case DWC3_DEPEVT_RXTXFIFOEVT:
 		break;
 	}
-- 
2.11.0

