Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 850683C5B46
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jul 2021 13:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234832AbhGLLIV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jul 2021 07:08:21 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:59750 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232342AbhGLLIT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jul 2021 07:08:19 -0400
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 32DBC402B6;
        Mon, 12 Jul 2021 11:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1626087928; bh=fur5uN/n30DBkPg371j+ZqlIcqe492t21rKDFnodID4=;
        h=Date:From:Subject:To:Cc:From;
        b=JNHjjarRL+PRrb8uY5h6LSyZes47QqYIK9YuhNNvYZd2LR2FCvBzcbjDvu4eWRvb+
         zGJU5wzP0Z19sg6qMhkUYfJfMGDzmfozlxctdTuSropnhzyKazcL+DTk/Fq+/wHUx4
         4tzJtGClvlZVspQnTRDPJYNApHr4GZKmP7IuSlOFkvnAbPt3rZrT1mg8iEY0Zt6hJl
         S0VBib02pSkSuh7yiyPWWPDMzZ7b59vmjlsYO9tjNA7yCiuVV7H390YoIpsTZdh26v
         AWYhSpjgcH5g64faxr11w0A9pAQ/5NSfxXKFc3g+y/zivUEEGQRPuKTZHgFBZu+n+d
         LU6Q0GLQ8Iowg==
Received: from hminas-z420 (hminas-z420.internal.synopsys.com [10.116.75.77])
        (using TLSv1 with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 36B47A005C;
        Mon, 12 Jul 2021 11:05:24 +0000 (UTC)
Received: by hminas-z420 (sSMTP sendmail emulation); Mon, 12 Jul 2021 15:05:23 +0400
Date:   Mon, 12 Jul 2021 15:05:23 +0400
Message-Id: <3143ea6b8eee08761709a6c2788216292be46a34.1626087390.git.Minas.Harutyunyan@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH v2] usb: dwc2: gadget: Add endpoint wedge support
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

Add enpoint wedge support. Tested by USBCV MSC tests.

Signed-off-by: Argishti Aleksanyan <Argishti.Aleksanyan@synopsys.com>
Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
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

