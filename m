Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D92D11C65F9
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2020 04:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbgEFCqx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 May 2020 22:46:53 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:35330 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726267AbgEFCqw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 May 2020 22:46:52 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 99AC2407EB;
        Wed,  6 May 2020 02:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588733212; bh=tWvLRuvfGh5JXlk8gPVgcTVAjJHe67SDYV/sJT9UvmM=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=IZlrOMGHHIG2LWIdIZHwTJM97wk4lX0nj/RGyYsF12roZQ/G2T08u1LJJeG9CdmtI
         eb+Qrd1cyVsIAkkJkncgoeypfc6/fPRRnbncM1r61ZxsUpzcjFhgGhINDL4PJzg/uv
         MYFGogE17xHE9hK4w2Co4Dbks5kp7xQNorD553Xpi1wlN2/lRcY1/O6sHQzei1odps
         MB0u4wkmbl7OWsdVsISlzRlnF6YdUzNAlq0/AIhmGG3vARVMJn4/pAEQ2lC1cv2+TA
         Gzbd7e+At0pdhbF5VqvLF48xgtge/Gq0WmDuU0ZVuNAIWBNZ9yCnN37KPwdAbQfgdQ
         Uqd04RuUvpBuQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 8352AA006D;
        Wed,  6 May 2020 02:46:51 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 05 May 2020 19:46:51 -0700
Date:   Tue, 05 May 2020 19:46:51 -0700
Message-Id: <379e73bfe1f4afc51be8b4ee3247387f3196fcb0.1588732815.git.thinhn@synopsys.com>
In-Reply-To: <cover.1588732815.git.thinhn@synopsys.com>
References: <cover.1588732815.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 07/11] usb: dwc3: gadget: Handle XferComplete for streams
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In DWC3, to prepare TRBs for streams, all the TRBs of a transfer will
use the same stream ID. To start a new stream, the driver needs to wait
for the current transfer to complete or ended (by END_TRANFER command).
As a result, inform the controller of the last TRB of a transfer so that
it knows when a transfer completes and start a new transfer of a new
stream.

Even though the transfer completion handling can be applied for other
non-isoc endpoints, only do it for streams due to its requirement.
It's better to keep the controller's TRB cache full than waiting for
transfer completion and starting a new transfer.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 81aa7de4cb17..052f6dc52a51 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -919,7 +919,8 @@ static u32 dwc3_calc_trbs_left(struct dwc3_ep *dep)
 
 static void __dwc3_prepare_one_trb(struct dwc3_ep *dep, struct dwc3_trb *trb,
 		dma_addr_t dma, unsigned length, unsigned chain, unsigned node,
-		unsigned stream_id, unsigned short_not_ok, unsigned no_interrupt)
+		unsigned stream_id, unsigned short_not_ok,
+		unsigned no_interrupt, unsigned is_last)
 {
 	struct dwc3		*dwc = dep->dwc;
 	struct usb_gadget	*gadget = &dwc->gadget;
@@ -1012,6 +1013,8 @@ static void __dwc3_prepare_one_trb(struct dwc3_ep *dep, struct dwc3_trb *trb,
 
 	if (chain)
 		trb->ctrl |= DWC3_TRB_CTRL_CHN;
+	else if (dep->stream_capable && is_last)
+		trb->ctrl |= DWC3_TRB_CTRL_LST;
 
 	if (usb_endpoint_xfer_bulk(dep->endpoint.desc) && dep->stream_capable)
 		trb->ctrl |= DWC3_TRB_CTRL_SID_SOFN(stream_id);
@@ -1039,6 +1042,7 @@ static void dwc3_prepare_one_trb(struct dwc3_ep *dep,
 	unsigned		stream_id = req->request.stream_id;
 	unsigned		short_not_ok = req->request.short_not_ok;
 	unsigned		no_interrupt = req->request.no_interrupt;
+	unsigned		is_last = req->request.is_last;
 
 	if (req->request.num_sgs > 0) {
 		length = sg_dma_len(req->start_sg);
@@ -1059,7 +1063,7 @@ static void dwc3_prepare_one_trb(struct dwc3_ep *dep,
 	req->num_trbs++;
 
 	__dwc3_prepare_one_trb(dep, trb, dma, length, chain, node,
-			stream_id, short_not_ok, no_interrupt);
+			stream_id, short_not_ok, no_interrupt, is_last);
 }
 
 static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
@@ -1104,7 +1108,8 @@ static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 					maxp - rem, false, 1,
 					req->request.stream_id,
 					req->request.short_not_ok,
-					req->request.no_interrupt);
+					req->request.no_interrupt,
+					req->request.is_last);
 		} else {
 			dwc3_prepare_one_trb(dep, req, chain, i);
 		}
@@ -1148,7 +1153,8 @@ static void dwc3_prepare_one_trb_linear(struct dwc3_ep *dep,
 		__dwc3_prepare_one_trb(dep, trb, dwc->bounce_addr, maxp - rem,
 				false, 1, req->request.stream_id,
 				req->request.short_not_ok,
-				req->request.no_interrupt);
+				req->request.no_interrupt,
+				req->request.is_last);
 	} else if (req->request.zero && req->request.length &&
 		   (IS_ALIGNED(req->request.length, maxp))) {
 		struct dwc3	*dwc = dep->dwc;
@@ -1165,7 +1171,8 @@ static void dwc3_prepare_one_trb_linear(struct dwc3_ep *dep,
 		__dwc3_prepare_one_trb(dep, trb, dwc->bounce_addr, 0,
 				false, 1, req->request.stream_id,
 				req->request.short_not_ok,
-				req->request.no_interrupt);
+				req->request.no_interrupt,
+				req->request.is_last);
 	} else {
 		dwc3_prepare_one_trb(dep, req, false, 0);
 	}
@@ -2718,6 +2725,19 @@ static void dwc3_gadget_endpoint_transfer_in_progress(struct dwc3_ep *dep,
 	dwc3_gadget_endpoint_trbs_complete(dep, event, status);
 }
 
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
+	dwc3_gadget_endpoint_trbs_complete(dep, event, status);
+}
+
 static void dwc3_gadget_endpoint_transfer_not_ready(struct dwc3_ep *dep,
 		const struct dwc3_event_depevt *event)
 {
@@ -2781,8 +2801,10 @@ static void dwc3_endpoint_interrupt(struct dwc3 *dwc,
 			dep->flags &= ~DWC3_EP_DELAY_START;
 		}
 		break;
-	case DWC3_DEPEVT_STREAMEVT:
 	case DWC3_DEPEVT_XFERCOMPLETE:
+		dwc3_gadget_endpoint_transfer_complete(dep, event);
+		break;
+	case DWC3_DEPEVT_STREAMEVT:
 	case DWC3_DEPEVT_RXTXFIFOEVT:
 		break;
 	}
-- 
2.11.0

