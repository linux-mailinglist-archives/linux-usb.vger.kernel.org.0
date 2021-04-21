Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD6723674B7
	for <lists+linux-usb@lfdr.de>; Wed, 21 Apr 2021 23:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243890AbhDUVPv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Apr 2021 17:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236316AbhDUVPu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Apr 2021 17:15:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE272C06138B
        for <linux-usb@vger.kernel.org>; Wed, 21 Apr 2021 14:15:16 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lZKBn-0007Yl-AS; Wed, 21 Apr 2021 23:15:15 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lZKBm-0007e4-Pc; Wed, 21 Apr 2021 23:15:14 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: [PATCH 1/3] usb: gadget: uvc: make uvc_num_requests depend on gadget speed
Date:   Wed, 21 Apr 2021 23:15:11 +0200
Message-Id: <20210421211513.29002-2-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210421211513.29002-1-m.grzeschik@pengutronix.de>
References: <20210421211513.29002-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

While sending bigger images is possible with USB_SPEED_SUPER it is
better to use more isochronous requests in flight. This patch makes the
number uvc_num_requests dynamic by changing it depending on the gadget
speed.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/gadget/function/uvc.h       | 11 ++++--
 drivers/usb/gadget/function/uvc_queue.c |  7 ++++
 drivers/usb/gadget/function/uvc_video.c | 51 ++++++++++++++-----------
 3 files changed, 44 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 23ee25383c1f7..83b9e945944e8 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -65,13 +65,17 @@ extern unsigned int uvc_gadget_trace_param;
  * Driver specific constants
  */
 
-#define UVC_NUM_REQUESTS			4
 #define UVC_MAX_REQUEST_SIZE			64
 #define UVC_MAX_EVENTS				4
 
 /* ------------------------------------------------------------------------
  * Structures
  */
+struct uvc_request {
+	struct usb_request *req;
+	__u8 *req_buffer;
+	struct uvc_video *video;
+};
 
 struct uvc_video {
 	struct uvc_device *uvc;
@@ -87,10 +91,11 @@ struct uvc_video {
 	unsigned int imagesize;
 	struct mutex mutex;	/* protects frame parameters */
 
+	int uvc_num_requests;
+
 	/* Requests */
 	unsigned int req_size;
-	struct usb_request *req[UVC_NUM_REQUESTS];
-	__u8 *req_buffer[UVC_NUM_REQUESTS];
+	struct uvc_request *ureq;
 	struct list_head req_free;
 	spinlock_t req_lock;
 
diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
index 61e2c94cc0b0c..dcd71304d521c 100644
--- a/drivers/usb/gadget/function/uvc_queue.c
+++ b/drivers/usb/gadget/function/uvc_queue.c
@@ -43,6 +43,8 @@ static int uvc_queue_setup(struct vb2_queue *vq,
 {
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
 	struct uvc_video *video = container_of(queue, struct uvc_video, queue);
+	struct uvc_device *uvc = video->uvc;
+	struct usb_composite_dev *cdev = uvc->func.config->cdev;
 
 	if (*nbuffers > UVC_MAX_VIDEO_BUFFERS)
 		*nbuffers = UVC_MAX_VIDEO_BUFFERS;
@@ -51,6 +53,11 @@ static int uvc_queue_setup(struct vb2_queue *vq,
 
 	sizes[0] = video->imagesize;
 
+	if (cdev->gadget->speed < USB_SPEED_SUPER)
+		video->uvc_num_requests = 4;
+	else
+		video->uvc_num_requests = 64;
+
 	return 0;
 }
 
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 633e23d58d868..e7910615c8faa 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -11,6 +11,7 @@
 #include <linux/errno.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
+#include <linux/module.h>
 #include <linux/usb/video.h>
 
 #include <media/v4l2-dev.h>
@@ -145,7 +146,8 @@ static int uvcg_video_ep_queue(struct uvc_video *video, struct usb_request *req)
 static void
 uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 {
-	struct uvc_video *video = req->context;
+	struct uvc_request *ureq = req->context;
+	struct uvc_video *video = ureq->video;
 	struct uvc_video_queue *queue = &video->queue;
 	unsigned long flags;
 
@@ -177,17 +179,17 @@ uvc_video_free_requests(struct uvc_video *video)
 {
 	unsigned int i;
 
-	for (i = 0; i < UVC_NUM_REQUESTS; ++i) {
-		if (video->req[i]) {
-			usb_ep_free_request(video->ep, video->req[i]);
-			video->req[i] = NULL;
+	for (i = 0; i < video->uvc_num_requests; ++i) {
+		if (video->ureq[i].req) {
+			usb_ep_free_request(video->ep, video->ureq[i].req);
+			video->ureq[i].req = NULL;
 		}
-
-		if (video->req_buffer[i]) {
-			kfree(video->req_buffer[i]);
-			video->req_buffer[i] = NULL;
+		if (video->ureq[i].req_buffer) {
+			kfree(video->ureq[i].req_buffer);
+			video->ureq[i].req_buffer = NULL;
 		}
 	}
+	kfree(video->ureq);
 
 	INIT_LIST_HEAD(&video->req_free);
 	video->req_size = 0;
@@ -207,21 +209,26 @@ uvc_video_alloc_requests(struct uvc_video *video)
 		 * max_t(unsigned int, video->ep->maxburst, 1)
 		 * (video->ep->mult);
 
-	for (i = 0; i < UVC_NUM_REQUESTS; ++i) {
-		video->req_buffer[i] = kmalloc(req_size, GFP_KERNEL);
-		if (video->req_buffer[i] == NULL)
+	video->ureq = kcalloc(video->uvc_num_requests, sizeof(struct uvc_request), GFP_KERNEL);
+	if (video->ureq == NULL)
+		return ret;
+
+	for (i = 0; i < video->uvc_num_requests; ++i) {
+		video->ureq[i].req_buffer = kmalloc(req_size, GFP_KERNEL);
+		if (video->ureq[i].req_buffer == NULL)
 			goto error;
 
-		video->req[i] = usb_ep_alloc_request(video->ep, GFP_KERNEL);
-		if (video->req[i] == NULL)
+		video->ureq[i].req = usb_ep_alloc_request(video->ep, GFP_KERNEL);
+		if (video->ureq[i].req == NULL)
 			goto error;
 
-		video->req[i]->buf = video->req_buffer[i];
-		video->req[i]->length = 0;
-		video->req[i]->complete = uvc_video_complete;
-		video->req[i]->context = video;
+		video->ureq[i].req->buf = video->ureq[i].req_buffer;
+		video->ureq[i].req->length = 0;
+		video->ureq[i].req->complete = uvc_video_complete;
+		video->ureq[i].req->context = &video->ureq[i];
+		video->ureq[i].video = video;
 
-		list_add_tail(&video->req[i]->list, &video->req_free);
+		list_add_tail(&video->ureq[i].req->list, &video->req_free);
 	}
 
 	video->req_size = req_size;
@@ -312,9 +319,9 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
 		cancel_work_sync(&video->pump);
 		uvcg_queue_cancel(&video->queue, 0);
 
-		for (i = 0; i < UVC_NUM_REQUESTS; ++i)
-			if (video->req[i])
-				usb_ep_dequeue(video->ep, video->req[i]);
+		for (i = 0; i < video->uvc_num_requests; ++i)
+			if (video->ureq[i].req)
+				usb_ep_dequeue(video->ep, video->ureq[i].req);
 
 		uvc_video_free_requests(video);
 		uvcg_queue_enable(&video->queue, 0);
-- 
2.29.2

