Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B14E543ACA
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jun 2022 19:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232814AbiFHRtd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jun 2022 13:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232256AbiFHRtb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jun 2022 13:49:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E4431183C
        for <linux-usb@vger.kernel.org>; Wed,  8 Jun 2022 10:49:28 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CCC8D6CF;
        Wed,  8 Jun 2022 19:49:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654710567;
        bh=HyJ8AGkbnBXfKtCSywrM6TTe8v64Z/5g6UKNsQ7sLnM=;
        h=From:To:Cc:Subject:Date:From;
        b=JMeANnkSZRgjaWJjBDqdQQQRC+SlfhbHgFOKd9xWvZzxmVcWM8ad9NZce2lDDnw9s
         JRBl4gADvZCcLpt7A1LFyhHrto84Y6reIue2GkEnwzSen6Rf9AezY3e4C1tN+ILshg
         yX4+/X7YYVzU/1zY+KnMVKytcoKI7/4ZG+XgDy04=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        kieran.bingham@ideasonboard.com
Subject: [PATCH] usb: gadget: uvc: Fix comment blocks style
Date:   Wed,  8 Jun 2022 20:49:18 +0300
Message-Id: <20220608174918.14656-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The UVC gadget driver historically uses the

/* Comment
 * style
 */

for multi-line block comments, which is frowned upon. Patches for the
driver are required to use the more standard

/*
 * Comment
 * style
 */

style. This result in inconsistencies. Fix it by converting all
remaining instances of the old style.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/usb/gadget/function/f_uvc.c     | 30 ++++++++++++++++---------
 drivers/usb/gadget/function/uvc_queue.c |  6 +++--
 drivers/usb/gadget/function/uvc_video.c | 12 ++++++----
 3 files changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index d3feeeb50841..71669e0e4d00 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -141,7 +141,8 @@ static struct usb_endpoint_descriptor uvc_fs_streaming_ep = {
 	.bEndpointAddress	= USB_DIR_IN,
 	.bmAttributes		= USB_ENDPOINT_SYNC_ASYNC
 				| USB_ENDPOINT_XFER_ISOC,
-	/* The wMaxPacketSize and bInterval values will be initialized from
+	/*
+	 * The wMaxPacketSize and bInterval values will be initialized from
 	 * module parameters.
 	 */
 };
@@ -152,7 +153,8 @@ static struct usb_endpoint_descriptor uvc_hs_streaming_ep = {
 	.bEndpointAddress	= USB_DIR_IN,
 	.bmAttributes		= USB_ENDPOINT_SYNC_ASYNC
 				| USB_ENDPOINT_XFER_ISOC,
-	/* The wMaxPacketSize and bInterval values will be initialized from
+	/*
+	 * The wMaxPacketSize and bInterval values will be initialized from
 	 * module parameters.
 	 */
 };
@@ -164,7 +166,8 @@ static struct usb_endpoint_descriptor uvc_ss_streaming_ep = {
 	.bEndpointAddress	= USB_DIR_IN,
 	.bmAttributes		= USB_ENDPOINT_SYNC_ASYNC
 				| USB_ENDPOINT_XFER_ISOC,
-	/* The wMaxPacketSize and bInterval values will be initialized from
+	/*
+	 * The wMaxPacketSize and bInterval values will be initialized from
 	 * module parameters.
 	 */
 };
@@ -172,7 +175,8 @@ static struct usb_endpoint_descriptor uvc_ss_streaming_ep = {
 static struct usb_ss_ep_comp_descriptor uvc_ss_streaming_comp = {
 	.bLength		= sizeof(uvc_ss_streaming_comp),
 	.bDescriptorType	= USB_DT_SS_ENDPOINT_COMP,
-	/* The bMaxBurst, bmAttributes and wBytesPerInterval values will be
+	/*
+	 * The bMaxBurst, bmAttributes and wBytesPerInterval values will be
 	 * initialized from module parameters.
 	 */
 };
@@ -234,7 +238,8 @@ uvc_function_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 	if (le16_to_cpu(ctrl->wLength) > UVC_MAX_REQUEST_SIZE)
 		return -EINVAL;
 
-	/* Tell the complete callback to generate an event for the next request
+	/*
+	 * Tell the complete callback to generate an event for the next request
 	 * that will be enqueued by UVCIOC_SEND_RESPONSE.
 	 */
 	uvc->event_setup_out = !(ctrl->bRequestType & USB_DIR_IN);
@@ -500,7 +505,8 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
 	if (!uvc_control_desc || !uvc_streaming_cls)
 		return ERR_PTR(-ENODEV);
 
-	/* Descriptors layout
+	/*
+	 * Descriptors layout
 	 *
 	 * uvc_iad
 	 * uvc_control_intf
@@ -597,8 +603,7 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 	uvcg_info(f, "%s()\n", __func__);
 
 	opts = fi_to_f_uvc_opts(f->fi);
-	/* Sanity check the streaming endpoint module parameters.
-	 */
+	/* Sanity check the streaming endpoint module parameters. */
 	opts->streaming_interval = clamp(opts->streaming_interval, 1U, 16U);
 	opts->streaming_maxpacket = clamp(opts->streaming_maxpacket, 1U, 3072U);
 	opts->streaming_maxburst = min(opts->streaming_maxburst, 15U);
@@ -611,7 +616,8 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 			  opts->streaming_maxpacket);
 	}
 
-	/* Fill in the FS/HS/SS Video Streaming specific descriptors from the
+	/*
+	 * Fill in the FS/HS/SS Video Streaming specific descriptors from the
 	 * module parameters.
 	 *
 	 * NOTE: We assume that the user knows what they are doing and won't
@@ -895,7 +901,8 @@ static void uvc_function_unbind(struct usb_configuration *c,
 
 	uvcg_info(f, "%s()\n", __func__);
 
-	/* If we know we're connected via v4l2, then there should be a cleanup
+	/*
+	 * If we know we're connected via v4l2, then there should be a cleanup
 	 * of the device from userspace either via UVC_EVENT_DISCONNECT or
 	 * though the video device removal uevent. Allow some time for the
 	 * application to close out before things get deleted.
@@ -912,7 +919,8 @@ static void uvc_function_unbind(struct usb_configuration *c,
 	v4l2_device_unregister(&uvc->v4l2_dev);
 
 	if (uvc->func_connected) {
-		/* Wait for the release to occur to ensure there are no longer any
+		/*
+		 * Wait for the release to occur to ensure there are no longer any
 		 * pending operations that may cause panics when resources are cleaned
 		 * up.
 		 */
diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
index d25edc3d2174..951934aa4454 100644
--- a/drivers/usb/gadget/function/uvc_queue.c
+++ b/drivers/usb/gadget/function/uvc_queue.c
@@ -104,7 +104,8 @@ static void uvc_buffer_queue(struct vb2_buffer *vb)
 	if (likely(!(queue->flags & UVC_QUEUE_DISCONNECTED))) {
 		list_add_tail(&buf->queue, &queue->irqqueue);
 	} else {
-		/* If the device is disconnected return the buffer to userspace
+		/*
+		 * If the device is disconnected return the buffer to userspace
 		 * directly. The next QBUF call will fail with -ENODEV.
 		 */
 		buf->state = UVC_BUF_STATE_ERROR;
@@ -255,7 +256,8 @@ void uvcg_queue_cancel(struct uvc_video_queue *queue, int disconnect)
 	}
 	queue->buf_used = 0;
 
-	/* This must be protected by the irqlock spinlock to avoid race
+	/*
+	 * This must be protected by the irqlock spinlock to avoid race
 	 * conditions between uvc_queue_buffer and the disconnection event that
 	 * could result in an interruptible wait in uvc_dequeue_buffer. Do not
 	 * blindly replace this logic by checking for the UVC_DEV_DISCONNECTED
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index a9bb4553db84..5876bc73f929 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -378,7 +378,8 @@ static void uvcg_video_pump(struct work_struct *work)
 	int ret;
 
 	while (video->ep->enabled) {
-		/* Retrieve the first available USB request, protected by the
+		/*
+		 * Retrieve the first available USB request, protected by the
 		 * request lock.
 		 */
 		spin_lock_irqsave(&video->req_lock, flags);
@@ -391,7 +392,8 @@ static void uvcg_video_pump(struct work_struct *work)
 		list_del(&req->list);
 		spin_unlock_irqrestore(&video->req_lock, flags);
 
-		/* Retrieve the first available video buffer and fill the
+		/*
+		 * Retrieve the first available video buffer and fill the
 		 * request, protected by the video queue irqlock.
 		 */
 		spin_lock_irqsave(&queue->irqlock, flags);
@@ -403,9 +405,11 @@ static void uvcg_video_pump(struct work_struct *work)
 
 		video->encode(req, video, buf);
 
-		/* With usb3 we have more requests. This will decrease the
+		/*
+		 * With usb3 we have more requests. This will decrease the
 		 * interrupt load to a quarter but also catches the corner
-		 * cases, which needs to be handled */
+		 * cases, which needs to be handled.
+		 */
 		if (list_empty(&video->req_free) ||
 		    buf->state == UVC_BUF_STATE_DONE ||
 		    !(video->req_int_count %

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
Regards,

Laurent Pinchart

