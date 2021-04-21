Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63083367467
	for <lists+linux-usb@lfdr.de>; Wed, 21 Apr 2021 22:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245694AbhDUUtU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Apr 2021 16:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245688AbhDUUtU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Apr 2021 16:49:20 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9E10C06174A
        for <linux-usb@vger.kernel.org>; Wed, 21 Apr 2021 13:48:46 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lZJm8-000542-NU; Wed, 21 Apr 2021 22:48:44 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lZJm8-000180-Ef; Wed, 21 Apr 2021 22:48:44 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Thinh.Nguyen@synopsys.com, kernel@pengutronix.de
Subject: [PATCH 2/2] dwc3: gadget: fix tracking of used sgs in request
Date:   Wed, 21 Apr 2021 22:48:37 +0200
Message-Id: <20210421204837.4185-3-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210421204837.4185-1-m.grzeschik@pengutronix.de>
References: <20210421204837.4185-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The variable pending_sgs was used to keep track of handled
sgs in one request. But instead queued_sgs is being decremented
on every handled sg. This patch fixes the usage of the variable
to use queued_sgs instead as intended.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/dwc3/gadget.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 118b5bcc565d6..2d7d861b13b31 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2856,7 +2856,7 @@ static int dwc3_gadget_ep_reclaim_trb_sg(struct dwc3_ep *dep,
 	struct dwc3_trb *trb = &dep->trb_pool[dep->trb_dequeue];
 	struct scatterlist *sg = req->sg;
 	struct scatterlist *s;
-	unsigned int pending = req->num_pending_sgs;
+	unsigned int pending = req->num_queued_sgs;
 	unsigned int i;
 	int ret = 0;
 
@@ -2864,7 +2864,7 @@ static int dwc3_gadget_ep_reclaim_trb_sg(struct dwc3_ep *dep,
 		trb = &dep->trb_pool[dep->trb_dequeue];
 
 		req->sg = sg_next(s);
-		req->num_pending_sgs--;
+		req->num_queued_sgs--;
 
 		ret = dwc3_gadget_ep_reclaim_completed_trb(dep, req,
 				trb, event, status, true);
@@ -2887,7 +2887,7 @@ static int dwc3_gadget_ep_reclaim_trb_linear(struct dwc3_ep *dep,
 
 static bool dwc3_gadget_ep_request_completed(struct dwc3_request *req)
 {
-	return req->num_pending_sgs == 0;
+	return req->num_queued_sgs == 0;
 }
 
 static int dwc3_gadget_ep_cleanup_completed_request(struct dwc3_ep *dep,
@@ -2896,7 +2896,7 @@ static int dwc3_gadget_ep_cleanup_completed_request(struct dwc3_ep *dep,
 {
 	int ret;
 
-	if (req->num_pending_sgs)
+	if (req->num_queued_sgs)
 		ret = dwc3_gadget_ep_reclaim_trb_sg(dep, req, event,
 				status);
 	else
-- 
2.29.2

