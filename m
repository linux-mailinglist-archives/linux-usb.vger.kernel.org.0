Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBEF927739A
	for <lists+linux-usb@lfdr.de>; Thu, 24 Sep 2020 16:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728129AbgIXOIo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 10:08:44 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:51934 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728064AbgIXOIo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 10:08:44 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 02104403EA;
        Thu, 24 Sep 2020 14:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1600956524; bh=iCBvqzybadtOxzv8g7UNo/5yiGNBoSB3RTa0zNy3EzU=;
        h=Date:From:Subject:To:From;
        b=HojKEanIsRiS6W3Rrt94Tga3KDKnn9Pk4YlpLNkvajGfTkk4fiXMJcGGk/swVZR+Y
         40Ex/CD+mr1HH61mCBm8GMtEAvHlq/60nxqNAHltmDzhZOK8Gp7MekpJ39vn6IOJAl
         87iilJlgvwRRPvNiXaZosJohS4dtUHnCgS4d4/m5X+crrc2mQysLObZHNPg5jw3e8O
         CV9sIJM4Aorv0yB5IkZQnum97aFmTKLbMndeSGTqwcm8XRzl1+VUpYvimX/cHRmsrA
         UatNwXXIRUyQp8HwWXUmK0ruyX+echfHjcGe1G8n7bQfXVbNJ6fi47QmeO7qR6Qip/
         cGNstgQ8JY5kw==
Received: from hminas-z420 (hminas-z420.internal.synopsys.com [10.116.126.211])
        (using TLSv1 with cipher AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 3429DA005E;
        Thu, 24 Sep 2020 14:08:40 +0000 (UTC)
Received: by hminas-z420 (sSMTP sendmail emulation); Thu, 24 Sep 2020 18:08:39 +0400
Date:   Thu, 24 Sep 2020 18:08:39 +0400
Message-Id: <938ffff91049c2322b4263492e70eb2f5aaa4668.1600956452.git.hminas@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH] usb: dwc2: Fix INTR OUT transfers in DDMA mode.
To:     John Youn <John.Youn@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In DDMA mode if INTR OUT transfers mps not multiple of 4 then single packet
corresponds to single descriptor.

Descriptor limit set to mps and desc chain limit set to mps *
MAX_DMA_DESC_NUM_GENERIC. On that descriptors complete, to calculate
transfer size should be considered correction value for each descriptor.

In start request function, if "continue" is true then dma buffer address
should be incremmented by offset for all type of transfers, not only for
Control DATA_OUT transfers.

Fixes: cf77b5fb9b394 ("usb: dwc2: gadget: Transfer length limit checking for DDMA")
Fixes: e02f9aa6119e0 ("usb: dwc2: gadget: EP 0 specific DDMA programming")
Fixes: aa3e8bc81311e ("usb: dwc2: gadget: DDMA transfer start and complete")

Signed-off-by: Minas Harutyunyan <hminas@synopsys.com>
---
 drivers/usb/dwc2/gadget.c | 40 +++++++++++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 16c5f976f141..0a0d11151cfb 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -713,8 +713,11 @@ static u32 dwc2_hsotg_read_frameno(struct dwc2_hsotg *hsotg)
  */
 static unsigned int dwc2_gadget_get_chain_limit(struct dwc2_hsotg_ep *hs_ep)
 {
+	const struct usb_endpoint_descriptor *ep_desc = hs_ep->ep.desc;
 	int is_isoc = hs_ep->isochronous;
 	unsigned int maxsize;
+	u32 mps = hs_ep->ep.maxpacket;
+	int dir_in = hs_ep->dir_in;
 
 	if (is_isoc)
 		maxsize = (hs_ep->dir_in ? DEV_DMA_ISOC_TX_NBYTES_LIMIT :
@@ -723,6 +726,11 @@ static unsigned int dwc2_gadget_get_chain_limit(struct dwc2_hsotg_ep *hs_ep)
 	else
 		maxsize = DEV_DMA_NBYTES_LIMIT * MAX_DMA_DESC_NUM_GENERIC;
 
+	/* Interrupt OUT EP with mps not multiple of 4 */
+	if (hs_ep->index)
+		if (usb_endpoint_xfer_int(ep_desc) && !dir_in && (mps % 4))
+			maxsize = mps * MAX_DMA_DESC_NUM_GENERIC;
+
 	return maxsize;
 }
 
@@ -738,11 +746,14 @@ static unsigned int dwc2_gadget_get_chain_limit(struct dwc2_hsotg_ep *hs_ep)
  * Isochronous - descriptor rx/tx bytes bitfield limit,
  * Control In/Bulk/Interrupt - multiple of mps. This will allow to not
  * have concatenations from various descriptors within one packet.
+ * Interrupt OUT - if mps not multiple of 4 then a single packet corresponds
+ * to a single descriptor.
  *
  * Selects corresponding mask for RX/TX bytes as well.
  */
 static u32 dwc2_gadget_get_desc_params(struct dwc2_hsotg_ep *hs_ep, u32 *mask)
 {
+	const struct usb_endpoint_descriptor *ep_desc = hs_ep->ep.desc;
 	u32 mps = hs_ep->ep.maxpacket;
 	int dir_in = hs_ep->dir_in;
 	u32 desc_size = 0;
@@ -766,6 +777,13 @@ static u32 dwc2_gadget_get_desc_params(struct dwc2_hsotg_ep *hs_ep, u32 *mask)
 		desc_size -= desc_size % mps;
 	}
 
+	/* Interrupt OUT EP with mps not multiple of 4 */
+	if (hs_ep->index)
+		if (usb_endpoint_xfer_int(ep_desc) && !dir_in && (mps % 4)) {
+			desc_size = mps;
+			*mask = DEV_DMA_NBYTES_MASK;
+		}
+
 	return desc_size;
 }
 
@@ -1123,13 +1141,7 @@ static void dwc2_hsotg_start_req(struct dwc2_hsotg *hsotg,
 				length += (mps - (length % mps));
 		}
 
-		/*
-		 * If more data to send, adjust DMA for EP0 out data stage.
-		 * ureq->dma stays unchanged, hence increment it by already
-		 * passed passed data count before starting new transaction.
-		 */
-		if (!index && hsotg->ep0_state == DWC2_EP0_DATA_OUT &&
-		    continuing)
+		if (continuing)
 			offset = ureq->actual;
 
 		/* Fill DDMA chain entries */
@@ -2320,22 +2332,36 @@ static void dwc2_hsotg_change_ep_iso_parity(struct dwc2_hsotg *hsotg,
  */
 static unsigned int dwc2_gadget_get_xfersize_ddma(struct dwc2_hsotg_ep *hs_ep)
 {
+	const struct usb_endpoint_descriptor *ep_desc = hs_ep->ep.desc;
 	struct dwc2_hsotg *hsotg = hs_ep->parent;
 	unsigned int bytes_rem = 0;
+	unsigned int bytes_rem_correction = 0;
 	struct dwc2_dma_desc *desc = hs_ep->desc_list;
 	int i;
 	u32 status;
+	u32 mps = hs_ep->ep.maxpacket;
+	int dir_in = hs_ep->dir_in;
 
 	if (!desc)
 		return -EINVAL;
 
+	/* Interrupt OUT EP with mps not multiple of 4 */
+	if (hs_ep->index)
+		if (usb_endpoint_xfer_int(ep_desc) && !dir_in && (mps % 4))
+			bytes_rem_correction = 4 - (mps % 4);
+
 	for (i = 0; i < hs_ep->desc_count; ++i) {
 		status = desc->status;
 		bytes_rem += status & DEV_DMA_NBYTES_MASK;
+		bytes_rem -= bytes_rem_correction;
 
 		if (status & DEV_DMA_STS_MASK)
 			dev_err(hsotg->dev, "descriptor %d closed with %x\n",
 				i, status & DEV_DMA_STS_MASK);
+
+		if (status & DEV_DMA_L)
+			break;
+
 		desc++;
 	}
 
-- 
2.11.0

