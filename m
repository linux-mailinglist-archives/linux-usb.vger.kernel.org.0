Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C622465B7B
	for <lists+linux-usb@lfdr.de>; Thu,  2 Dec 2021 01:59:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344170AbhLBBC2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Dec 2021 20:02:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232366AbhLBBC1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Dec 2021 20:02:27 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FDD6C061574
        for <linux-usb@vger.kernel.org>; Wed,  1 Dec 2021 16:59:06 -0800 (PST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1msaRD-00009Z-Hf; Thu, 02 Dec 2021 01:59:03 +0100
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1msaRC-00EqQy-U7; Thu, 02 Dec 2021 01:59:02 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de
Subject: [PATCH] usb: gadget: uvc: use pump call conditionally
Date:   Thu,  2 Dec 2021 01:58:52 +0100
Message-Id: <20211202005852.3538102-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Preparing the usb request is not very expensive, when using
scatter gather. In that case we can even remove the overhead
of the extra pump worker and call the pump function directly.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/gadget/function/uvc_v4l2.c  |  8 +++++--
 drivers/usb/gadget/function/uvc_video.c | 28 +++++++++++++++++++------
 drivers/usb/gadget/function/uvc_video.h |  2 ++
 3 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index a2c78690c5c288..020b4adc7840e0 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -169,8 +169,12 @@ uvc_v4l2_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
 	if (ret < 0)
 		return ret;
 
-	if (uvc->state == UVC_STATE_STREAMING)
-		schedule_work(&video->pump);
+	if (uvc->state == UVC_STATE_STREAMING) {
+		if (!video->queue.use_sg)
+			schedule_work(&video->pump);
+		else
+			uvcg_video_pump(video);
+	}
 
 	return ret;
 }
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 7f59a0c4740209..933c2b831fe747 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -268,8 +268,12 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 	list_add_tail(&req->list, &video->req_free);
 	spin_unlock_irqrestore(&video->req_lock, flags);
 
-	if (uvc->state == UVC_STATE_STREAMING)
-		schedule_work(&video->pump);
+	if (uvc->state == UVC_STATE_STREAMING) {
+		if (!queue->use_sg)
+			schedule_work(&video->pump);
+		else
+			uvcg_video_pump(video);
+	}
 }
 
 static int
@@ -359,9 +363,8 @@ uvc_video_alloc_requests(struct uvc_video *video)
  * This function fills the available USB requests (listed in req_free) with
  * video data from the queued buffers.
  */
-static void uvcg_video_pump(struct work_struct *work)
+void uvcg_video_pump(struct uvc_video *video)
 {
-	struct uvc_video *video = container_of(work, struct uvc_video, pump);
 	struct uvc_video_queue *queue = &video->queue;
 	struct usb_request *req = NULL;
 	struct uvc_buffer *buf;
@@ -427,6 +430,14 @@ static void uvcg_video_pump(struct work_struct *work)
 	return;
 }
 
+
+static void uvcg_video_pump_t(struct work_struct *work)
+{
+	struct uvc_video *video = container_of(work, struct uvc_video, pump);
+
+	uvcg_video_pump(video);
+}
+
 /*
  * Enable or disable the video stream.
  */
@@ -469,7 +480,10 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
 
 	video->req_int_count = 0;
 
-	schedule_work(&video->pump);
+	if (!video->queue.use_sg)
+		schedule_work(&video->pump);
+	else
+		uvcg_video_pump(video);
 
 	return ret;
 }
@@ -481,7 +495,9 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 {
 	INIT_LIST_HEAD(&video->req_free);
 	spin_lock_init(&video->req_lock);
-	INIT_WORK(&video->pump, uvcg_video_pump);
+
+	if (!video->queue.use_sg)
+		INIT_WORK(&video->pump, uvcg_video_pump_t);
 
 	video->uvc = uvc;
 	video->fcc = V4L2_PIX_FMT_YUYV;
diff --git a/drivers/usb/gadget/function/uvc_video.h b/drivers/usb/gadget/function/uvc_video.h
index 03adeefa343b71..d4ad61dd568974 100644
--- a/drivers/usb/gadget/function/uvc_video.h
+++ b/drivers/usb/gadget/function/uvc_video.h
@@ -14,6 +14,8 @@
 
 struct uvc_video;
 
+void uvcg_video_pump(struct uvc_video *video);
+
 int uvcg_video_enable(struct uvc_video *video, int enable);
 
 int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc);
-- 
2.30.2

