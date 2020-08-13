Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08D01243402
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 08:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbgHMGZu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Aug 2020 02:25:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:38146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726167AbgHMGZs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Aug 2020 02:25:48 -0400
Received: from saruman.elisa-laajakaista.fi (unknown [194.34.132.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 474B62078D;
        Thu, 13 Aug 2020 06:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597299948;
        bh=3l06lVbHyKOg+g6w8AjVaqYHrYNKKb/MzVL/EIbgA7w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=InyJYVatEhZ2kY9mY8h+SyJcd6od85JJxzWYeqVHhrJC/qlA8G8IUzk3KFweUCHgg
         cSOvd73WZrKgh2DFnGvrHOlNSXDwK7C2gfCWTiUTvSp1/CuXgW/fQ4sLcuF5wzn+nQ
         Dg5VcgXbLlrTT1ykNE1OB5UKkPkatXQLAoRayrng=
From:   balbi@kernel.org
To:     Linux USB <linux-usb@vger.kernel.org>
Cc:     Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 08/11] dwc3: gadget: fix checkpatch warnings
Date:   Thu, 13 Aug 2020 09:25:29 +0300
Message-Id: <20200813062532.829720-8-balbi@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813062532.829720-1-balbi@kernel.org>
References: <20200813062532.829720-1-balbi@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Felipe Balbi <balbi@kernel.org>

no functional changes

Signed-off-by: Felipe Balbi <balbi@kernel.org>
---
 drivers/usb/dwc3/gadget.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index e44bfc3b5096..6b9f891b7e40 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -227,7 +227,8 @@ void dwc3_gadget_giveback(struct dwc3_ep *dep, struct dwc3_request *req,
  * Caller should take care of locking. Issue @cmd with a given @param to @dwc
  * and wait for its completion.
  */
-int dwc3_send_gadget_generic_command(struct dwc3 *dwc, unsigned cmd, u32 param)
+int dwc3_send_gadget_generic_command(struct dwc3 *dwc, unsigned int cmd,
+		u32 param)
 {
 	u32		timeout = 500;
 	int		status = 0;
@@ -268,7 +269,7 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc);
  * Caller should handle locking. This function will issue @cmd with given
  * @params to @dep and wait for its completion.
  */
-int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned cmd,
+int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
 		struct dwc3_gadget_ep_cmd_params *params)
 {
 	const struct usb_endpoint_descriptor *desc = dep->endpoint.desc;
@@ -564,6 +565,7 @@ static int dwc3_gadget_set_ep_config(struct dwc3_ep *dep, unsigned int action)
 	/* Burst size is only needed in SuperSpeed mode */
 	if (dwc->gadget.speed >= USB_SPEED_SUPER) {
 		u32 burst = dep->endpoint.maxburst;
+
 		params.param0 |= DWC3_DEPCFG_BURST_SIZE(burst - 1);
 	}
 
@@ -942,9 +944,10 @@ static u32 dwc3_calc_trbs_left(struct dwc3_ep *dep)
 }
 
 static void __dwc3_prepare_one_trb(struct dwc3_ep *dep, struct dwc3_trb *trb,
-		dma_addr_t dma, unsigned length, unsigned chain, unsigned node,
-		unsigned stream_id, unsigned short_not_ok,
-		unsigned no_interrupt, unsigned is_last)
+		dma_addr_t dma, unsigned int length, unsigned int chain,
+		unsigned int node, unsigned int stream_id,
+		unsigned int short_not_ok, unsigned int no_interrupt,
+		unsigned int is_last)
 {
 	struct dwc3		*dwc = dep->dwc;
 	struct usb_gadget	*gadget = &dwc->gadget;
@@ -1058,15 +1061,15 @@ static void __dwc3_prepare_one_trb(struct dwc3_ep *dep, struct dwc3_trb *trb,
  * @node: only for isochronous endpoints. First TRB needs different type.
  */
 static void dwc3_prepare_one_trb(struct dwc3_ep *dep,
-		struct dwc3_request *req, unsigned chain, unsigned node)
+		struct dwc3_request *req, unsigned int chain, unsigned int node)
 {
 	struct dwc3_trb		*trb;
+	unsigned int		stream_id = req->request.stream_id;
+	unsigned int		short_not_ok = req->request.short_not_ok;
+	unsigned int		no_interrupt = req->request.no_interrupt;
+	unsigned int		is_last = req->request.is_last;
 	unsigned int		length;
 	dma_addr_t		dma;
-	unsigned		stream_id = req->request.stream_id;
-	unsigned		short_not_ok = req->request.short_not_ok;
-	unsigned		no_interrupt = req->request.no_interrupt;
-	unsigned		is_last = req->request.is_last;
 
 	if (req->request.num_sgs > 0) {
 		length = sg_dma_len(req->start_sg);
@@ -1104,7 +1107,7 @@ static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 		unsigned int length = req->request.length;
 		unsigned int maxp = usb_endpoint_maxp(dep->endpoint.desc);
 		unsigned int rem = length % maxp;
-		unsigned chain = true;
+		unsigned int chain = true;
 
 		/*
 		 * IOMMU driver is coalescing the list of sgs which shares a
@@ -1586,9 +1589,8 @@ static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct dwc3_request *req)
 			return 0;
 
 		if ((dep->flags & DWC3_EP_PENDING_REQUEST)) {
-			if (!(dep->flags & DWC3_EP_TRANSFER_STARTED)) {
+			if (!(dep->flags & DWC3_EP_TRANSFER_STARTED))
 				return __dwc3_gadget_start_isoc(dep);
-			}
 		}
 	}
 
@@ -1726,8 +1728,8 @@ int __dwc3_gadget_ep_set_halt(struct dwc3_ep *dep, int value, int protocol)
 	if (value) {
 		struct dwc3_trb *trb;
 
-		unsigned transfer_in_flight;
-		unsigned started;
+		unsigned int transfer_in_flight;
+		unsigned int started;
 
 		if (dep->number > 1)
 			trb = dwc3_ep_prev_trb(dep, dep->trb_enqueue);
-- 
2.28.0

