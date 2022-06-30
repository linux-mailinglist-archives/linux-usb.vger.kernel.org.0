Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66D7E561DD7
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jun 2022 16:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235841AbiF3OTH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jun 2022 10:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236994AbiF3OR1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jun 2022 10:17:27 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B42B83F0D
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 07:02:21 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1o6ukO-00033x-25; Thu, 30 Jun 2022 16:02:20 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1o6ukJ-003bNf-QX; Thu, 30 Jun 2022 16:02:19 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1o6ukM-000mNy-QC; Thu, 30 Jun 2022 16:02:18 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, kernel@pengutronix.de
Subject: [PATCH] usb: dwc3: gadget: fix high-speed multiplier setting
Date:   Thu, 30 Jun 2022 16:02:16 +0200
Message-Id: <20220630140216.185919-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For high-speed transfers the __dwc3_prepare_one_trb function is
calculating the multiplier setting for the trb based on the length of
the trb currently prepared. This assumption is wrong. For trbs with a
sglist the length of the actual request has to be taken instead.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/dwc3/gadget.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 8716bece107208..0fc3ecfaa48baf 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1186,7 +1186,7 @@ static void __dwc3_prepare_one_trb(struct dwc3_ep *dep, struct dwc3_trb *trb,
 		dma_addr_t dma, unsigned int length, unsigned int chain,
 		unsigned int node, unsigned int stream_id,
 		unsigned int short_not_ok, unsigned int no_interrupt,
-		unsigned int is_last, bool must_interrupt)
+		unsigned int is_last, bool must_interrupt, int req_length)
 {
 	struct dwc3		*dwc = dep->dwc;
 	struct usb_gadget	*gadget = dwc->gadget;
@@ -1232,10 +1232,10 @@ static void __dwc3_prepare_one_trb(struct dwc3_ep *dep, struct dwc3_trb *trb,
 				unsigned int mult = 2;
 				unsigned int maxp = usb_endpoint_maxp(ep->desc);
 
-				if (length <= (2 * maxp))
+				if (req_length <= (2 * maxp))
 					mult--;
 
-				if (length <= maxp)
+				if (req_length <= maxp)
 					mult--;
 
 				trb->size |= DWC3_TRB_SIZE_PCM1(mult);
@@ -1350,7 +1350,7 @@ static void dwc3_prepare_one_trb(struct dwc3_ep *dep,
 
 	__dwc3_prepare_one_trb(dep, trb, dma, trb_length, chain, node,
 			stream_id, short_not_ok, no_interrupt, is_last,
-			must_interrupt);
+			must_interrupt, req->request.length);
 }
 
 static bool dwc3_needs_extra_trb(struct dwc3_ep *dep, struct dwc3_request *req)
-- 
2.30.2

