Return-Path: <linux-usb+bounces-2757-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0217E752B
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 00:34:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 392B8B21188
	for <lists+linux-usb@lfdr.de>; Thu,  9 Nov 2023 23:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F6B38FAD;
	Thu,  9 Nov 2023 23:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F21038FA1
	for <linux-usb@vger.kernel.org>; Thu,  9 Nov 2023 23:33:51 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548CE449A
	for <linux-usb@vger.kernel.org>; Thu,  9 Nov 2023 15:33:51 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mgr@pengutronix.de>)
	id 1r1EWz-0005qA-LH; Fri, 10 Nov 2023 00:33:49 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1r1EWz-007tIM-06; Fri, 10 Nov 2023 00:33:49 +0100
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mgr@pengutronix.de>)
	id 1r1EWy-00AKd2-35;
	Fri, 10 Nov 2023 00:33:48 +0100
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
To: linux-usb@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	dan.scally@ideasonboard.com,
	gregkh@linuxfoundation.org,
	kernel@pengutronix.de
Subject: [PATCH] usb: gadget: uvc: reduce the request size to increase the throughput
Date: Fri, 10 Nov 2023 00:33:41 +0100
Message-Id: <20231109233341.2461129-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031231841.dbhtrgqounu2rvgn@synopsys.com>
References: <20231031231841.dbhtrgqounu2rvgn@synopsys.com>
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

One misconception of queueing request to the usb gadget controller is,
that the amount of data that one usb_request is representing is the same
as the hardware is able to transfer in one interval.

This exact idea applies to the uvc_video gadget that assumes that the
request needs to have the size as the gadgets bandwidth parameters are
configured with. (maxpacket, multiplier and burst)

Although it is actually no problem for the hardware to queue a big
request, in the case of isochronous transfers it is impractical to queue
big amount of data per request to the hardware. Especially if the
necessary bandwidth was increased on purpose to maintain high amounts of
data.

E.g. in the dwc3-controller it has the negative impact that the endpoint
FIFO will not be filled fast enough by the internal hardware engine.
Since each transfer buffer (TRB) represents one big request, the
hardware will need a long time to prefill the hardware FIFO. This can be
avoided by queueing more smaller requests which will then lead to
smaller TRBs which the hardware engine can keep up with.

This patch is simply dropping the maxburst as an multiplier for the size
calculation and therefor decreases the overall maximum request size.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
This patch is created as an result from the discussion in the following thread:

https://lore.kernel.org/linux-usb/20231031231841.dbhtrgqounu2rvgn@synopsys.com/

 drivers/usb/gadget/function/uvc_queue.c | 1 -
 drivers/usb/gadget/function/uvc_video.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
index 0aa3d7e1f3cc32..1d3c3c09ff97cb 100644
--- a/drivers/usb/gadget/function/uvc_queue.c
+++ b/drivers/usb/gadget/function/uvc_queue.c
@@ -55,7 +55,6 @@ static int uvc_queue_setup(struct vb2_queue *vq,
 	sizes[0] = video->imagesize;
 
 	req_size = video->ep->maxpacket
-		 * max_t(unsigned int, video->ep->maxburst, 1)
 		 * (video->ep->mult);
 
 	/* We divide by two, to increase the chance to run
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 91af3b1ef0d412..c6b61843bad3d7 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -329,7 +329,6 @@ uvc_video_alloc_requests(struct uvc_video *video)
 	BUG_ON(video->req_size);
 
 	req_size = video->ep->maxpacket
-		 * max_t(unsigned int, video->ep->maxburst, 1)
 		 * (video->ep->mult);
 
 	video->ureq = kcalloc(video->uvc_num_requests, sizeof(struct uvc_request), GFP_KERNEL);
-- 
2.39.2


