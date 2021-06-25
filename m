Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B381A3B3C9A
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jun 2021 08:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233130AbhFYGYK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Jun 2021 02:24:10 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:35538 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230386AbhFYGYK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Jun 2021 02:24:10 -0400
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DADDF41566;
        Fri, 25 Jun 2021 06:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1624602110; bh=Os0DTWcOcOk3QpFDcU5w0G8hHuaDVcQsW4AJfy8j8eM=;
        h=Date:From:Subject:To:Cc:From;
        b=ApLq220/zKFtI46eI6SddG4+2UhnvUgJ9j+QumBQ9Sie7od0dlc1O6is6VElHeFyl
         UxeNWb954H8QtzznL0e+Akom08rG/rRT2XALprcP5zkRF0CBLSlTi1G42n/il0FdwU
         5OrDpHUBxWJEzLNrXQJddlz5fYYWBLzbZiLKPyIZEfbSVgMB6GblU6XsX8H5h+5T0m
         jYeLJFVSqz7ZCMzUXChdQTjEwkhYhixZ3BPSkAheIjhqsRZCMBflXnfFcMYQYR2SXl
         WxAXM9kLT3xC6kXqD6hctQa9x8aYZLBZ5l5L2ON8THX39pGP8G0u4V+PtBypvTpsgb
         g6Fq/lzREhNdg==
Received: from Armenia_lab (armenia_lab.internal.synopsys.com [10.116.75.26])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 9EE5FA005E;
        Fri, 25 Jun 2021 06:21:46 +0000 (UTC)
Received: by Armenia_lab (sSMTP sendmail emulation); Thu, 24 Jun 2021 23:21:45 -0700
Date:   Thu, 24 Jun 2021 23:21:45 -0700
Message-Id: <2fc584eee4d5959ca3a54c3901ca9b2b958f1ffe.1624599316.git.Minas.Harutyunyan@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH] usb: dwc2: gadget: Add endpoint wedge support
To:     linux-usb@vger.kernel.org
Cc:     John.Youn@synopsys.com, balbi@kernel.org,
        Argishti.Aleksanyan@synopsys.com
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Addd endpoint wedge support. Tested by USBCV MSC tests.

Signed-off-by: Argishti Aleksanyan <Argishti.Aleksanyan@synopsys.com>
Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
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
index c581ee41ac81..fe567069dcb2 100644
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
@@ -4046,6 +4047,7 @@ static int dwc2_hsotg_ep_enable(struct usb_ep *ep,
 	hs_ep->isochronous = 0;
 	hs_ep->periodic = 0;
 	hs_ep->halted = 0;
+	hs_ep->wedged = 0;
 	hs_ep->interval = desc->bInterval;
 
 	switch (ep_type) {
@@ -4286,6 +4288,27 @@ static int dwc2_hsotg_ep_dequeue(struct usb_ep *ep, struct usb_request *req)
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
@@ -4337,6 +4360,7 @@ static int dwc2_hsotg_ep_sethalt(struct usb_ep *ep, int value, bool now)
 				epctl |= DXEPCTL_EPDIS;
 		} else {
 			epctl &= ~DXEPCTL_STALL;
+			hs_ep->wedged = 0;
 			xfertype = epctl & DXEPCTL_EPTYPE_MASK;
 			if (xfertype == DXEPCTL_EPTYPE_BULK ||
 			    xfertype == DXEPCTL_EPTYPE_INTERRUPT)
@@ -4353,6 +4377,7 @@ static int dwc2_hsotg_ep_sethalt(struct usb_ep *ep, int value, bool now)
 			// STALL bit will be set in GOUTNAKEFF interrupt handler
 		} else {
 			epctl &= ~DXEPCTL_STALL;
+			hs_ep->wedged = 0;
 			xfertype = epctl & DXEPCTL_EPTYPE_MASK;
 			if (xfertype == DXEPCTL_EPTYPE_BULK ||
 			    xfertype == DXEPCTL_EPTYPE_INTERRUPT)
@@ -4392,6 +4417,7 @@ static const struct usb_ep_ops dwc2_hsotg_ep_ops = {
 	.queue		= dwc2_hsotg_ep_queue_lock,
 	.dequeue	= dwc2_hsotg_ep_dequeue,
 	.set_halt	= dwc2_hsotg_ep_sethalt_lock,
+	.set_wedge	= dwc2_gadget_ep_set_wedge,
 	/* note, don't believe we have any call for the fifo routines */
 };
 

base-commit: 00a738b86ec0c88ad4745f658966f951cbe4c885
-- 
2.11.0

