Return-Path: <linux-usb+bounces-184-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6A27A2AFE
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 01:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BF731C20ABD
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 23:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE801BDD6;
	Fri, 15 Sep 2023 23:31:20 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3372918E1B
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 23:31:18 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C431FDE
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 16:31:17 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mgr@pengutronix.de>)
	id 1qhIHM-0008FV-4c; Sat, 16 Sep 2023 01:31:16 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1qhIHK-006dnH-KC; Sat, 16 Sep 2023 01:31:14 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mgr@pengutronix.de>)
	id 1qhIHK-00CBNx-1o;
	Sat, 16 Sep 2023 01:31:14 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
To: Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org,
	kernel@pengutronix.de
Subject: [PATCH] usb: dwc3: gadget: remove requests from any list before dealloc
Date: Sat, 16 Sep 2023 01:31:13 +0200
Message-Id: <20230915233113.2903645-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On the call of dwc3_gadget_ep_free_request the request is possibly
still queued in some list. To avoid use after free issues in the driver,
we ensure that the request is unlinked before it gets freed.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/dwc3/gadget.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 858fe4c299b7af..f4bc33590f570f 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1165,8 +1165,19 @@ static void dwc3_gadget_ep_free_request(struct usb_ep *ep,
 		struct usb_request *request)
 {
 	struct dwc3_request		*req = to_dwc3_request(request);
+	struct dwc3_ep			*dep = to_dwc3_ep(ep);
+	struct dwc3			*dwc = dep->dwc;
+	unsigned long			flags;
 
 	trace_dwc3_free_request(req);
+
+	spin_lock_irqsave(&dwc->lock, flags);
+
+	if (!list_is_singular(&req->list))
+		list_del(&req->list);
+
+	spin_unlock_irqrestore(&dwc->lock, flags);
+
 	kfree(req);
 }
 
-- 
2.39.2


