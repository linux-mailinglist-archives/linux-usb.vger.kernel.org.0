Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2B913C69BB
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jul 2021 07:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232344AbhGMFf2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jul 2021 01:35:28 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:42402 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231998AbhGMFf2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jul 2021 01:35:28 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 80C5240409;
        Tue, 13 Jul 2021 05:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1626154359; bh=WpFrQrfdMzcuc7hU+DSi0EQ/CbGaT7SVeV36HBCJUdA=;
        h=Date:From:Subject:To:Cc:From;
        b=GlZWUGGHF8SQtXS6yb4Sz6fwW9PvkG9+PUVFtKVx/Rj2Dksblgdn64UJboSE0KbvN
         Fff5LkcHZ4sZKgH7GbRh5Ndpem1Zm1szzT2Lb4uBvgMeYu4CbhHjTfe5oDaZwQjHSo
         ULEQgBQZO9JgrQ5UATbZJlSuLwW70LZVBwsbi8zAimkty9NLpvowboxDlJWO6ppx1N
         32YEdO6knTDBIPmRoEM7lHqIYUJHtUJ5IqB2wn0kKWwRQUNLwFlZtIww1cebptnIwa
         b+NZEYzMnIPWf18OIhyJ3VwLzcWNfbhz4U21rGRIYAtVnk3PrFZn5E6jsje1GTasYn
         ea7C/peN1wJbw==
Received: from hminas-z420 (hminas-z420.internal.synopsys.com [10.116.75.77])
        (using TLSv1 with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 4C2DEA005E;
        Tue, 13 Jul 2021 05:32:34 +0000 (UTC)
Received: by hminas-z420 (sSMTP sendmail emulation); Tue, 13 Jul 2021 09:32:32 +0400
Date:   Tue, 13 Jul 2021 09:32:32 +0400
Message-Id: <3143ea6b8eee08761709a6c2788216292be46a34.1626087390.git.Minas.Harutyunyan@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH v3] usb: dwc2: gadget: Add usb_ep_set_wedge support
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Argishti Aleksanyan <Argishti.Aleksanyan@synopsys.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Added usb_ep_set_wedge support.
Use this to stall an endpoint and ignore CLEAR_FEATURE(HALT_ENDPOINT) requests.
If the gadget driver clears the halt status, it will automatically unwedge the
endpoint.
Before this update usb_ep_set_wedge call replaced by usb_ep_set_halt which is
not wedge the endpoint.

Tested by USBCV MSC tests.

Signed-off-by: Argishti Aleksanyan <Argishti.Aleksanyan@synopsys.com>
Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
Changes in v3:
 - Update commit message
Changes in v2:
 - Updated mail recipient list

 drivers/usb/dwc2/core.h   |  2 ++
 drivers/usb/dwc2/gadget.c | 28 +++++++++++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index ab6b815e0089..1f14bcc94b69 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -122,6 +122,7 @@ struct dwc2_hsotg_req;
  * @periodic: Set if this is a periodic ep, such as Interrupt
  * @isochronous: Set if this is a isochronous ep
  * @send_zlp: Set if we need to send a zero-length packet.
+ * @wedged: Set if ep is wedged.
  * @desc_list_dma: The DMA address of descriptor chain currently in use.
  * @desc_list: Pointer to descriptor DMA chain head currently in use.
  * @desc_count: Count of entries within the DMA descriptor chain of EP.
@@ -172,6 +173,7 @@ struct dwc2_hsotg_ep {
 	unsigned int            periodic:1;
 	unsigned int            isochronous:1;
 	unsigned int            send_zlp:1;
+	unsigned int            wedged:1;
 	unsigned int            target_frame;
 #define TARGET_FRAME_INITIAL   0xFFFFFFFF
 	bool			frame_overrun;
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index bf456b4e191f..7352f2720963 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -1806,7 +1806,8 @@ static int dwc2_hsotg_process_req_feature(struct dwc2_hsotg *hsotg,
 		case USB_ENDPOINT_HALT:
 			halted = ep->halted;
 
-			dwc2_hsotg_ep_sethalt(&ep->ep, set, true);
+			if (!ep->wedged)
+				dwc2_hsotg_ep_sethalt(&ep->ep, set, true);
 
 			ret = dwc2_hsotg_send_reply(hsotg, ep0, NULL, 0);
 			if (ret) {
@@ -4048,6 +4049,7 @@ static int dwc2_hsotg_ep_enable(struct usb_ep *ep,
 	hs_ep->isochronous = 0;
 	hs_ep->periodic = 0;
 	hs_ep->halted = 0;
+	hs_ep->wedged = 0;
 	hs_ep->interval = desc->bInterval;
 
 	switch (ep_type) {
@@ -4288,6 +4290,27 @@ static int dwc2_hsotg_ep_dequeue(struct usb_ep *ep, struct usb_request *req)
 	return 0;
 }
 
+/**
+ * dwc2_gadget_ep_set_wedge - set wedge on a given endpoint
+ * @ep: The endpoint to be wedged.
+ *
+ */
+static int dwc2_gadget_ep_set_wedge(struct usb_ep *ep)
+{
+	struct dwc2_hsotg_ep *hs_ep = our_ep(ep);
+	struct dwc2_hsotg *hs = hs_ep->parent;
+
+	unsigned long	flags;
+	int		ret;
+
+	spin_lock_irqsave(&hs->lock, flags);
+	hs_ep->wedged = 1;
+	ret = dwc2_hsotg_ep_sethalt(ep, 1, false);
+	spin_unlock_irqrestore(&hs->lock, flags);
+
+	return ret;
+}
+
 /**
  * dwc2_hsotg_ep_sethalt - set halt on a given endpoint
  * @ep: The endpoint to set halt.
@@ -4339,6 +4362,7 @@ static int dwc2_hsotg_ep_sethalt(struct usb_ep *ep, int value, bool now)
 				epctl |= DXEPCTL_EPDIS;
 		} else {
 			epctl &= ~DXEPCTL_STALL;
+			hs_ep->wedged = 0;
 			xfertype = epctl & DXEPCTL_EPTYPE_MASK;
 			if (xfertype == DXEPCTL_EPTYPE_BULK ||
 			    xfertype == DXEPCTL_EPTYPE_INTERRUPT)
@@ -4355,6 +4379,7 @@ static int dwc2_hsotg_ep_sethalt(struct usb_ep *ep, int value, bool now)
 			// STALL bit will be set in GOUTNAKEFF interrupt handler
 		} else {
 			epctl &= ~DXEPCTL_STALL;
+			hs_ep->wedged = 0;
 			xfertype = epctl & DXEPCTL_EPTYPE_MASK;
 			if (xfertype == DXEPCTL_EPTYPE_BULK ||
 			    xfertype == DXEPCTL_EPTYPE_INTERRUPT)
@@ -4394,6 +4419,7 @@ static const struct usb_ep_ops dwc2_hsotg_ep_ops = {
 	.queue		= dwc2_hsotg_ep_queue_lock,
 	.dequeue	= dwc2_hsotg_ep_dequeue,
 	.set_halt	= dwc2_hsotg_ep_sethalt_lock,
+	.set_wedge	= dwc2_gadget_ep_set_wedge,
 	/* note, don't believe we have any call for the fifo routines */
 };
 

base-commit: 106acd249c1a5db9e106010d21b51cdda3a21354
-- 
2.11.0

