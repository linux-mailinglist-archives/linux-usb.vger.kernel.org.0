Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF97F4048AD
	for <lists+linux-usb@lfdr.de>; Thu,  9 Sep 2021 12:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234326AbhIIKq3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Sep 2021 06:46:29 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:41132 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233654AbhIIKq2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Sep 2021 06:46:28 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 33FCEC0D8B;
        Thu,  9 Sep 2021 10:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1631184319; bh=QKosPAIyqu7iBfV18X43yhKaIJWKSF1xiLS5RGqOGDE=;
        h=Date:From:Subject:To:Cc:From;
        b=Ct5KDQKx0S4GhBIzftQhy3DMbHf6Uek4zksCnP/rjKNBWa3+aTQYAU94oiMD2SjIb
         LcBD52YDIc57i78z5kle/l0tBIofRryOc16KOG7BWMkeauVgOck9jCsggWmGw8DjEL
         cCZR67cBRfjt3vyt4qyCQGdcYGG+0XbqRljgnzmslMMHtAK9wb11i1++XuBaEpzhaE
         4L/7EKA2WOz6xelBOMDfotrXD30ku4qwNzVLBuLZkKgHOCTeQk9xms6XNnPL9qmcHJ
         t3qr/8oz0foV0OfxFrloiazoJooHpdXR2ZKJD14OHpdgsb+D63lzNzZ2VcAGWYkKd4
         p7LrMTxuIkz8w==
Received: from hminas-z420 (hminas-z420.internal.synopsys.com [10.116.75.77])
        (using TLSv1 with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 04416A005C;
        Thu,  9 Sep 2021 10:45:15 +0000 (UTC)
Received: by hminas-z420 (sSMTP sendmail emulation); Thu, 09 Sep 2021 14:45:15 +0400
Date:   Thu, 09 Sep 2021 14:45:15 +0400
Message-Id: <95d1423adf4b0f68187c9894820c4b7e964a3f7f.1631175721.git.Minas.Harutyunyan@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH] usb: dwc2: gadget: Fix ISOC flow for BDMA and Slave
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

According USB spec each ISOC transaction should be performed in a
designated for that transaction interval. On bus errors or delays
in operating system scheduling of client software can result in no
packet being transferred for a (micro)frame. An error indication
should be returned as status to the client software in such a case.

Current implementation in case of missed/dropped interval send same
data in next possible interval instead of reporting missed isoc.

This fix complete requests with -ENODATA if interval elapsed.

HSOTG core in BDMA and Slave modes haven't HW support for
(micro)frames tracking, this is why SW should care about tracking
of (micro)frames. Because of that method and consider operating
system scheduling delays, added few additional checking's of elapsed
target (micro)frame:
1. Immediately before enabling EP to start transfer.
2. With any transfer completion interrupt.
3. With incomplete isoc in/out interrupt.
4. With EP disabled interrupt because of incomplete transfer.
5. With OUT token received while EP disabled interrupt (for OUT
transfers).
6. With NAK replied to IN token interrupt (for IN transfers).

As part of ISOC flow, additionally fixed 'current' and 'target' frame
calculation functions. In HS mode SOF limits provided by DSTS register
is 0x3fff, but in non HS mode this limit is 0x7ff.

Tested by internal tool which also using for dwc3 testing.

Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 drivers/usb/dwc2/gadget.c | 189 ++++++++++++++++++++++++++--------------------
 1 file changed, 106 insertions(+), 83 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 837237e4bc96..f09cbdfac9df 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -115,10 +115,16 @@ static inline bool using_desc_dma(struct dwc2_hsotg *hsotg)
  */
 static inline void dwc2_gadget_incr_frame_num(struct dwc2_hsotg_ep *hs_ep)
 {
+	struct dwc2_hsotg *hsotg = hs_ep->parent;
+	u16 limit = DSTS_SOFFN_LIMIT;
+
+	if (hsotg->gadget.speed != USB_SPEED_HIGH)
+		limit >>= 3;
+
 	hs_ep->target_frame += hs_ep->interval;
-	if (hs_ep->target_frame > DSTS_SOFFN_LIMIT) {
+	if (hs_ep->target_frame > limit) {
 		hs_ep->frame_overrun = true;
-		hs_ep->target_frame &= DSTS_SOFFN_LIMIT;
+		hs_ep->target_frame &= limit;
 	} else {
 		hs_ep->frame_overrun = false;
 	}
@@ -136,10 +142,16 @@ static inline void dwc2_gadget_incr_frame_num(struct dwc2_hsotg_ep *hs_ep)
  */
 static inline void dwc2_gadget_dec_frame_num_by_one(struct dwc2_hsotg_ep *hs_ep)
 {
+	struct dwc2_hsotg *hsotg = hs_ep->parent;
+	u16 limit = DSTS_SOFFN_LIMIT;
+
+	if (hsotg->gadget.speed != USB_SPEED_HIGH)
+		limit >>= 3;
+
 	if (hs_ep->target_frame)
 		hs_ep->target_frame -= 1;
 	else
-		hs_ep->target_frame = DSTS_SOFFN_LIMIT;
+		hs_ep->target_frame = limit;
 }
 
 /**
@@ -1018,6 +1030,12 @@ static void dwc2_gadget_start_isoc_ddma(struct dwc2_hsotg_ep *hs_ep)
 	dwc2_writel(hsotg, ctrl, depctl);
 }
 
+static bool dwc2_gadget_target_frame_elapsed(struct dwc2_hsotg_ep *hs_ep);
+static void dwc2_hsotg_complete_request(struct dwc2_hsotg *hsotg,
+					struct dwc2_hsotg_ep *hs_ep,
+				       struct dwc2_hsotg_req *hs_req,
+				       int result);
+
 /**
  * dwc2_hsotg_start_req - start a USB request from an endpoint's queue
  * @hsotg: The controller state.
@@ -1170,14 +1188,19 @@ static void dwc2_hsotg_start_req(struct dwc2_hsotg *hsotg,
 		}
 	}
 
-	if (hs_ep->isochronous && hs_ep->interval == 1) {
-		hs_ep->target_frame = dwc2_hsotg_read_frameno(hsotg);
-		dwc2_gadget_incr_frame_num(hs_ep);
-
-		if (hs_ep->target_frame & 0x1)
-			ctrl |= DXEPCTL_SETODDFR;
-		else
-			ctrl |= DXEPCTL_SETEVENFR;
+	if (hs_ep->isochronous) {
+		if (!dwc2_gadget_target_frame_elapsed(hs_ep)) {
+			if (hs_ep->interval == 1) {
+				if (hs_ep->target_frame & 0x1)
+					ctrl |= DXEPCTL_SETODDFR;
+				else
+					ctrl |= DXEPCTL_SETEVENFR;
+			}
+			ctrl |= DXEPCTL_CNAK;
+		} else {
+			dwc2_hsotg_complete_request(hsotg, hs_ep, hs_req, -ENODATA);
+			return;
+		}
 	}
 
 	ctrl |= DXEPCTL_EPENA;	/* ensure ep enabled */
@@ -1325,12 +1348,16 @@ static bool dwc2_gadget_target_frame_elapsed(struct dwc2_hsotg_ep *hs_ep)
 	u32 target_frame = hs_ep->target_frame;
 	u32 current_frame = hsotg->frame_number;
 	bool frame_overrun = hs_ep->frame_overrun;
+	u16 limit = DSTS_SOFFN_LIMIT;
+
+	if (hsotg->gadget.speed != USB_SPEED_HIGH)
+		limit >>= 3;
 
 	if (!frame_overrun && current_frame >= target_frame)
 		return true;
 
 	if (frame_overrun && current_frame >= target_frame &&
-	    ((current_frame - target_frame) < DSTS_SOFFN_LIMIT / 2))
+	    ((current_frame - target_frame) < limit / 2))
 		return true;
 
 	return false;
@@ -1713,11 +1740,9 @@ static struct dwc2_hsotg_req *get_ep_head(struct dwc2_hsotg_ep *hs_ep)
  */
 static void dwc2_gadget_start_next_request(struct dwc2_hsotg_ep *hs_ep)
 {
-	u32 mask;
 	struct dwc2_hsotg *hsotg = hs_ep->parent;
 	int dir_in = hs_ep->dir_in;
 	struct dwc2_hsotg_req *hs_req;
-	u32 epmsk_reg = dir_in ? DIEPMSK : DOEPMSK;
 
 	if (!list_empty(&hs_ep->queue)) {
 		hs_req = get_ep_head(hs_ep);
@@ -1733,9 +1758,6 @@ static void dwc2_gadget_start_next_request(struct dwc2_hsotg_ep *hs_ep)
 	} else {
 		dev_dbg(hsotg->dev, "%s: No more ISOC-OUT requests\n",
 			__func__);
-		mask = dwc2_readl(hsotg, epmsk_reg);
-		mask |= DOEPMSK_OUTTKNEPDISMSK;
-		dwc2_writel(hsotg, mask, epmsk_reg);
 	}
 }
 
@@ -2306,19 +2328,6 @@ static void dwc2_hsotg_ep0_zlp(struct dwc2_hsotg *hsotg, bool dir_in)
 	dwc2_hsotg_program_zlp(hsotg, hsotg->eps_out[0]);
 }
 
-static void dwc2_hsotg_change_ep_iso_parity(struct dwc2_hsotg *hsotg,
-					    u32 epctl_reg)
-{
-	u32 ctrl;
-
-	ctrl = dwc2_readl(hsotg, epctl_reg);
-	if (ctrl & DXEPCTL_EOFRNUM)
-		ctrl |= DXEPCTL_SETEVENFR;
-	else
-		ctrl |= DXEPCTL_SETODDFR;
-	dwc2_writel(hsotg, ctrl, epctl_reg);
-}
-
 /*
  * dwc2_gadget_get_xfersize_ddma - get transferred bytes amount from desc
  * @hs_ep - The endpoint on which transfer went
@@ -2439,20 +2448,11 @@ static void dwc2_hsotg_handle_outdone(struct dwc2_hsotg *hsotg, int epnum)
 			dwc2_hsotg_ep0_zlp(hsotg, true);
 	}
 
-	/*
-	 * Slave mode OUT transfers do not go through XferComplete so
-	 * adjust the ISOC parity here.
-	 */
-	if (!using_dma(hsotg)) {
-		if (hs_ep->isochronous && hs_ep->interval == 1)
-			dwc2_hsotg_change_ep_iso_parity(hsotg, DOEPCTL(epnum));
-		else if (hs_ep->isochronous && hs_ep->interval > 1)
-			dwc2_gadget_incr_frame_num(hs_ep);
-	}
-
 	/* Set actual frame number for completed transfers */
-	if (!using_desc_dma(hsotg) && hs_ep->isochronous)
-		req->frame_number = hsotg->frame_number;
+	if (!using_desc_dma(hsotg) && hs_ep->isochronous) {
+		req->frame_number = hs_ep->target_frame;
+		dwc2_gadget_incr_frame_num(hs_ep);
+	}
 
 	dwc2_hsotg_complete_request(hsotg, hs_ep, hs_req, result);
 }
@@ -2766,6 +2766,12 @@ static void dwc2_hsotg_complete_in(struct dwc2_hsotg *hsotg,
 		return;
 	}
 
+	/* Set actual frame number for completed transfers */
+	if (!using_desc_dma(hsotg) && hs_ep->isochronous) {
+		hs_req->req.frame_number = hs_ep->target_frame;
+		dwc2_gadget_incr_frame_num(hs_ep);
+	}
+
 	dwc2_hsotg_complete_request(hsotg, hs_ep, hs_req, 0);
 }
 
@@ -2826,23 +2832,18 @@ static void dwc2_gadget_handle_ep_disabled(struct dwc2_hsotg_ep *hs_ep)
 
 		dwc2_hsotg_txfifo_flush(hsotg, hs_ep->fifo_index);
 
-		if (hs_ep->isochronous) {
-			dwc2_hsotg_complete_in(hsotg, hs_ep);
-			return;
-		}
-
 		if ((epctl & DXEPCTL_STALL) && (epctl & DXEPCTL_EPTYPE_BULK)) {
 			int dctl = dwc2_readl(hsotg, DCTL);
 
 			dctl |= DCTL_CGNPINNAK;
 			dwc2_writel(hsotg, dctl, DCTL);
 		}
-		return;
-	}
+	} else {
 
-	if (dctl & DCTL_GOUTNAKSTS) {
-		dctl |= DCTL_CGOUTNAK;
-		dwc2_writel(hsotg, dctl, DCTL);
+		if (dctl & DCTL_GOUTNAKSTS) {
+			dctl |= DCTL_CGOUTNAK;
+			dwc2_writel(hsotg, dctl, DCTL);
+		}
 	}
 
 	if (!hs_ep->isochronous)
@@ -2863,8 +2864,6 @@ static void dwc2_gadget_handle_ep_disabled(struct dwc2_hsotg_ep *hs_ep)
 		/* Update current frame number value. */
 		hsotg->frame_number = dwc2_hsotg_read_frameno(hsotg);
 	} while (dwc2_gadget_target_frame_elapsed(hs_ep));
-
-	dwc2_gadget_start_next_request(hs_ep);
 }
 
 /**
@@ -2881,8 +2880,8 @@ static void dwc2_gadget_handle_ep_disabled(struct dwc2_hsotg_ep *hs_ep)
 static void dwc2_gadget_handle_out_token_ep_disabled(struct dwc2_hsotg_ep *ep)
 {
 	struct dwc2_hsotg *hsotg = ep->parent;
+	struct dwc2_hsotg_req *hs_req;
 	int dir_in = ep->dir_in;
-	u32 doepmsk;
 
 	if (dir_in || !ep->isochronous)
 		return;
@@ -2896,28 +2895,39 @@ static void dwc2_gadget_handle_out_token_ep_disabled(struct dwc2_hsotg_ep *ep)
 		return;
 	}
 
-	if (ep->interval > 1 &&
-	    ep->target_frame == TARGET_FRAME_INITIAL) {
+	if (ep->target_frame == TARGET_FRAME_INITIAL) {
 		u32 ctrl;
 
 		ep->target_frame = hsotg->frame_number;
-		dwc2_gadget_incr_frame_num(ep);
+		if (ep->interval > 1) {
+			ctrl = dwc2_readl(hsotg, DOEPCTL(ep->index));
+			if (ep->target_frame & 0x1)
+				ctrl |= DXEPCTL_SETODDFR;
+			else
+				ctrl |= DXEPCTL_SETEVENFR;
 
-		ctrl = dwc2_readl(hsotg, DOEPCTL(ep->index));
-		if (ep->target_frame & 0x1)
-			ctrl |= DXEPCTL_SETODDFR;
-		else
-			ctrl |= DXEPCTL_SETEVENFR;
+			dwc2_writel(hsotg, ctrl, DOEPCTL(ep->index));
+		}
+	}
+
+	while (dwc2_gadget_target_frame_elapsed(ep)) {
+		hs_req = get_ep_head(ep);
+		if (hs_req)
+			dwc2_hsotg_complete_request(hsotg, ep, hs_req, -ENODATA);
 
-		dwc2_writel(hsotg, ctrl, DOEPCTL(ep->index));
+		dwc2_gadget_incr_frame_num(ep);
+		/* Update current frame number value. */
+		hsotg->frame_number = dwc2_hsotg_read_frameno(hsotg);
 	}
 
-	dwc2_gadget_start_next_request(ep);
-	doepmsk = dwc2_readl(hsotg, DOEPMSK);
-	doepmsk &= ~DOEPMSK_OUTTKNEPDISMSK;
-	dwc2_writel(hsotg, doepmsk, DOEPMSK);
+	if (!ep->req)
+		dwc2_gadget_start_next_request(ep);
+
 }
 
+static void dwc2_hsotg_ep_stop_xfr(struct dwc2_hsotg *hsotg,
+				   struct dwc2_hsotg_ep *hs_ep);
+
 /**
  * dwc2_gadget_handle_nak - handle NAK interrupt
  * @hs_ep: The endpoint on which interrupt is asserted.
@@ -2935,7 +2945,9 @@ static void dwc2_gadget_handle_out_token_ep_disabled(struct dwc2_hsotg_ep *ep)
 static void dwc2_gadget_handle_nak(struct dwc2_hsotg_ep *hs_ep)
 {
 	struct dwc2_hsotg *hsotg = hs_ep->parent;
+	struct dwc2_hsotg_req *hs_req;
 	int dir_in = hs_ep->dir_in;
+	u32 ctrl;
 
 	if (!dir_in || !hs_ep->isochronous)
 		return;
@@ -2977,13 +2989,29 @@ static void dwc2_gadget_handle_nak(struct dwc2_hsotg_ep *hs_ep)
 
 			dwc2_writel(hsotg, ctrl, DIEPCTL(hs_ep->index));
 		}
-
-		dwc2_hsotg_complete_request(hsotg, hs_ep,
-					    get_ep_head(hs_ep), 0);
 	}
 
-	if (!using_desc_dma(hsotg))
+	if (using_desc_dma(hsotg))
+		return;
+
+	ctrl = dwc2_readl(hsotg, DIEPCTL(hs_ep->index));
+	if (ctrl & DXEPCTL_EPENA)
+		dwc2_hsotg_ep_stop_xfr(hsotg, hs_ep);
+	else
+		dwc2_hsotg_txfifo_flush(hsotg, hs_ep->fifo_index);
+
+	while (dwc2_gadget_target_frame_elapsed(hs_ep)) {
+		hs_req = get_ep_head(hs_ep);
+		if (hs_req)
+			dwc2_hsotg_complete_request(hsotg, hs_ep, hs_req, -ENODATA);
+
 		dwc2_gadget_incr_frame_num(hs_ep);
+		/* Update current frame number value. */
+		hsotg->frame_number = dwc2_hsotg_read_frameno(hsotg);
+	}
+
+	if (!hs_ep->req)
+		dwc2_gadget_start_next_request(hs_ep);
 }
 
 /**
@@ -3048,12 +3076,8 @@ static void dwc2_hsotg_epint(struct dwc2_hsotg *hsotg, unsigned int idx,
 			 * need to look at completing IN requests here
 			 * if operating slave mode
 			 */
-			if (hs_ep->isochronous && hs_ep->interval > 1)
-				dwc2_gadget_incr_frame_num(hs_ep);
-
-			dwc2_hsotg_complete_in(hsotg, hs_ep);
-			if (ints & DXEPINT_NAKINTRPT)
-				ints &= ~DXEPINT_NAKINTRPT;
+			if (!hs_ep->isochronous || !(ints & DXEPINT_NAKINTRPT))
+				dwc2_hsotg_complete_in(hsotg, hs_ep);
 
 			if (idx == 0 && !hs_ep->req)
 				dwc2_hsotg_enqueue_setup(hsotg);
@@ -3062,10 +3086,8 @@ static void dwc2_hsotg_epint(struct dwc2_hsotg *hsotg, unsigned int idx,
 			 * We're using DMA, we need to fire an OutDone here
 			 * as we ignore the RXFIFO.
 			 */
-			if (hs_ep->isochronous && hs_ep->interval > 1)
-				dwc2_gadget_incr_frame_num(hs_ep);
-
-			dwc2_hsotg_handle_outdone(hsotg, idx);
+			if (!hs_ep->isochronous || !(ints & DXEPINT_OUTTKNEPDIS))
+				dwc2_hsotg_handle_outdone(hsotg, idx);
 		}
 	}
 
@@ -4085,6 +4107,7 @@ static int dwc2_hsotg_ep_enable(struct usb_ep *ep,
 			mask |= DIEPMSK_NAKMSK;
 			dwc2_writel(hsotg, mask, DIEPMSK);
 		} else {
+			epctrl |= DXEPCTL_SNAK;
 			mask = dwc2_readl(hsotg, DOEPMSK);
 			mask |= DOEPMSK_OUTTKNEPDISMSK;
 			dwc2_writel(hsotg, mask, DOEPMSK);

base-commit: 1b4f3dfb4792f03b139edf10124fcbeb44e608e6
-- 
2.11.0

