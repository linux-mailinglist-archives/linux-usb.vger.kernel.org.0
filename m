Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7E2239532B
	for <lists+linux-usb@lfdr.de>; Mon, 31 May 2021 00:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbhE3WYb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 30 May 2021 18:24:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbhE3WY3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 30 May 2021 18:24:29 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60109C061761
        for <linux-usb@vger.kernel.org>; Sun, 30 May 2021 15:22:50 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lnTpW-0000Ev-36; Mon, 31 May 2021 00:22:46 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lnTpV-0002cm-9K; Mon, 31 May 2021 00:22:45 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        caleb.connolly@ideasonboard.com, paul.elder@ideasonboard.com,
        balbi@kernel.org, kernel@pengutronix.de
Subject: [PATCH 3/3] usb: gadget: uvc: add format/frame handling code
Date:   Mon, 31 May 2021 00:22:39 +0200
Message-Id: <20210530222239.8793-4-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210530222239.8793-1-m.grzeschik@pengutronix.de>
References: <20210530222239.8793-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The hostside format selection is currently only done in userspace, as
the events for SET_CUR and GET_CUR is allways moved to the application
layer. Since the v4l2 devices parses the configfs data, the format
negotiation can be done in the kernel. This patch adds the functions to
set the curent configuration and still forwards all unknown events to
the userspace level.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/gadget/function/f_uvc.c     | 270 ++++++++++++++++++++++--
 drivers/usb/gadget/function/uvc.h       |  14 ++
 drivers/usb/gadget/function/uvc_v4l2.c  |  16 +-
 drivers/usb/gadget/function/uvc_video.c |  15 +-
 4 files changed, 297 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 7945ea93a775a..cd40a063751ae 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -201,21 +201,253 @@ static const struct usb_descriptor_header * const uvc_ss_streaming[] = {
  * Control requests
  */
 
+void uvc_fill_streaming_control(struct uvc_device *uvc,
+			   struct uvc_streaming_control *ctrl,
+			   int iframe, int iformat, unsigned int ival)
+{
+	struct uvcg_format *ufmt;
+	struct uvcg_frame *ufrm;
+	unsigned int i;
+
+	/* Restrict the iformat, iframe and ival to valid values. Negative
+	 * values for ifrmat and iframe will result in the maximum valid value
+	 * being selected
+	 */
+	iformat = clamp((unsigned int)iformat, 1U, (unsigned int)uvc->nformats);
+	ufmt = uvc->fmt[iformat-1];
+
+	iframe = clamp((unsigned int)iframe, 1U, (unsigned int)uvc->nframes);
+	ufrm = find_frame_by_index(uvc, ufmt, iframe);
+	if (!ufrm)
+		return;
+
+	for (i = 0; i < ufrm->frame.b_frame_interval_type; i++) {
+		if (ival <= ufrm->dw_frame_interval[i]) {
+			ival = ufrm->dw_frame_interval[i];
+			break;
+		}
+	}
+
+	if (i == ufrm->frame.b_frame_interval_type)
+		ival = ufrm->dw_frame_interval[ufrm->frame.b_frame_interval_type-1];
+
+	memset(ctrl, 0, sizeof(*ctrl));
+
+	ctrl->bmHint = 1;
+	ctrl->bFormatIndex = iformat;
+	ctrl->bFrameIndex = iframe;
+	ctrl->dwFrameInterval = ival;
+	ctrl->dwMaxVideoFrameSize = ufrm->frame.dw_max_video_frame_buffer_size;
+
+	switch (uvc->func.config->cdev->gadget->speed) {
+	case USB_SPEED_SUPER:
+		ctrl->dwMaxPayloadTransferSize = uvc_ss_streaming_ep.wMaxPacketSize;
+		break;
+	case USB_SPEED_HIGH:
+		ctrl->dwMaxPayloadTransferSize = uvc_hs_streaming_ep.wMaxPacketSize;
+		break;
+	case USB_SPEED_FULL:
+	default:
+		ctrl->dwMaxPayloadTransferSize = uvc_fs_streaming_ep.wMaxPacketSize;
+		break;
+	}
+	ctrl->bmFramingInfo = 3;
+	ctrl->bPreferedVersion = 1;
+	ctrl->bMaxVersion = 1;
+}
+
+static int uvc_events_process_data(struct uvc_device *uvc, struct usb_request *req)
+{
+	struct uvc_video *video = &uvc->video;
+	struct uvc_streaming_control *target;
+	struct uvc_streaming_control *ctrl;
+	struct uvcg_frame *ufrm;
+	struct uvcg_format *ufmt;
+
+	switch (video->control) {
+	case UVC_VS_PROBE_CONTROL:
+		pr_debug("setting probe control, length = %d\n", req->actual);
+		target = &video->probe;
+		break;
+
+	case UVC_VS_COMMIT_CONTROL:
+		pr_debug("setting commit control, length = %d\n", req->actual);
+		target = &video->commit;
+		break;
+
+	default:
+		pr_debug("setting unknown control, length = %d\n", req->actual);
+		return -EOPNOTSUPP;
+	}
+
+	ctrl = (struct uvc_streaming_control *)req->buf;
+
+	if (video->control == UVC_VS_PROBE_CONTROL)
+		uvc_fill_streaming_control(uvc, target, ctrl->bFormatIndex,
+					   ctrl->bFrameIndex, ctrl->dwFrameInterval);
+
+	ufmt = uvc->fmt[target->bFormatIndex-1];
+	if (!ufmt)
+		return -EINVAL;
+
+	ufrm = find_frame_by_index(uvc, ufmt, ctrl->bFrameIndex);
+	if (!ufrm)
+		return -EINVAL;
+
+	if (video->control == UVC_VS_COMMIT_CONTROL) {
+		spin_lock(&video->frame_lock);
+
+		uvc_fill_streaming_control(uvc, target, ctrl->bFormatIndex,
+				   ctrl->bFrameIndex, ctrl->dwFrameInterval);
+
+		video->cur_frame = ufrm;
+		video->cur_format = ufmt;
+
+		spin_unlock(&video->frame_lock);
+	}
+
+	return 0;
+}
+
+static void
+uvc_events_process_streaming(struct uvc_device *uvc, uint8_t req, uint8_t cs,
+			     struct uvc_request_data *resp)
+{
+	struct uvc_streaming_control *ctrl;
+
+	pr_debug("streaming request (req %02x cs %02x)\n", req, cs);
+
+	if (cs != UVC_VS_PROBE_CONTROL && cs != UVC_VS_COMMIT_CONTROL)
+		return;
+
+	ctrl = (struct uvc_streaming_control *)&resp->data;
+	resp->length = sizeof(*ctrl);
+
+	switch (req) {
+	case UVC_SET_CUR:
+		uvc->video.control = cs;
+		resp->length = 34;
+		break;
+
+	case UVC_GET_CUR:
+		if (cs == UVC_VS_PROBE_CONTROL)
+			memcpy(ctrl, &uvc->video.probe, sizeof(*ctrl));
+		else
+			memcpy(ctrl, &uvc->video.commit, sizeof(*ctrl));
+		break;
+
+	case UVC_GET_MIN:
+	case UVC_GET_MAX:
+	case UVC_GET_DEF:
+		if (req == UVC_GET_MAX)
+			uvc_fill_streaming_control(uvc, ctrl, -1, -1, UINT_MAX);
+		else
+			uvc_fill_streaming_control(uvc, ctrl, 1, 1, 0);
+		break;
+
+	case UVC_GET_RES:
+		memset(ctrl, 0, sizeof(*ctrl));
+		break;
+
+	case UVC_GET_LEN:
+		resp->data[0] = 0x00;
+		resp->data[1] = 0x22;
+		resp->length = 2;
+		break;
+
+	case UVC_GET_INFO:
+		resp->data[0] = 0x03;
+		resp->length = 1;
+		break;
+	}
+}
+
+static int
+uvc_events_process_class(struct uvc_device *uvc, const struct usb_ctrlrequest *ctrl,
+			 struct uvc_request_data *resp)
+{
+	if ((ctrl->bRequestType & USB_RECIP_MASK) != USB_RECIP_INTERFACE)
+		return -EINVAL;
+
+	switch (ctrl->wIndex & 0xff) {
+	case UVC_INTF_VIDEO_CONTROL:
+		return -EOPNOTSUPP;
+
+	case UVC_INTF_VIDEO_STREAMING:
+		uvc_events_process_streaming(uvc, ctrl->bRequest, ctrl->wValue >> 8, resp);
+		break;
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int
+uvc_events_process_setup(struct uvc_device *uvc, const struct usb_ctrlrequest *ctrl,
+			 struct uvc_request_data *resp)
+{
+	uvc->video.control = 0;
+
+	pr_debug("bRequestType %02x bRequest %02x wValue %04x wIndex %04x wLength %04x\n",
+		ctrl->bRequestType, ctrl->bRequest, ctrl->wValue,
+		ctrl->wIndex, ctrl->wLength);
+
+	switch (ctrl->bRequestType & USB_TYPE_MASK) {
+	case USB_TYPE_STANDARD:
+		return -EOPNOTSUPP;
+
+	case USB_TYPE_CLASS:
+		return uvc_events_process_class(uvc, ctrl, resp);
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+/* --------------------------------------------------------------------------
+ * Requests handling
+ */
+
+static
+int uvc_send_response(struct uvc_device *uvc, struct uvc_request_data *data)
+{
+	struct usb_composite_dev *cdev = uvc->func.config->cdev;
+	struct usb_request *req = uvc->control_req;
+
+	if (data->length < 0)
+		return usb_ep_set_halt(cdev->gadget->ep0);
+
+	req->length = min_t(unsigned int, uvc->event_length, data->length);
+	req->zero = data->length < uvc->event_length;
+
+	memcpy(req->buf, data->data, req->length);
+
+	return usb_ep_queue(cdev->gadget->ep0, req, GFP_KERNEL);
+}
+
 static void
 uvc_function_ep0_complete(struct usb_ep *ep, struct usb_request *req)
 {
 	struct uvc_device *uvc = req->context;
-	struct v4l2_event v4l2_event;
-	struct uvc_event *uvc_event = (void *)&v4l2_event.u.data;
+	int ret;
 
 	if (uvc->event_setup_out) {
 		uvc->event_setup_out = 0;
+		ret = uvc_events_process_data(uvc, req);
+		if (ret == -EOPNOTSUPP) {
+			struct v4l2_event v4l2_event;
+			struct uvc_event *uvc_event = (void *)&v4l2_event.u.data;
 
-		memset(&v4l2_event, 0, sizeof(v4l2_event));
-		v4l2_event.type = UVC_EVENT_DATA;
-		uvc_event->data.length = req->actual;
-		memcpy(&uvc_event->data.data, req->buf, req->actual);
-		v4l2_event_queue(&uvc->vdev, &v4l2_event);
+			memset(&v4l2_event, 0, sizeof(v4l2_event));
+			v4l2_event.type = UVC_EVENT_DATA;
+			uvc_event->data.length = req->actual;
+			memcpy(&uvc_event->data.data, req->buf, req->actual);
+			v4l2_event_queue(&uvc->vdev, &v4l2_event);
+		}
 	}
 }
 
@@ -223,8 +455,8 @@ static int
 uvc_function_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 {
 	struct uvc_device *uvc = to_uvc(f);
-	struct v4l2_event v4l2_event;
-	struct uvc_event *uvc_event = (void *)&v4l2_event.u.data;
+	struct uvc_request_data resp;
+	int ret = 0;
 
 	if ((ctrl->bRequestType & USB_TYPE_MASK) != USB_TYPE_CLASS) {
 		uvcg_info(f, "invalid request type\n");
@@ -241,12 +473,22 @@ uvc_function_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 	uvc->event_setup_out = !(ctrl->bRequestType & USB_DIR_IN);
 	uvc->event_length = le16_to_cpu(ctrl->wLength);
 
-	memset(&v4l2_event, 0, sizeof(v4l2_event));
-	v4l2_event.type = UVC_EVENT_SETUP;
-	memcpy(&uvc_event->req, ctrl, sizeof(uvc_event->req));
-	v4l2_event_queue(&uvc->vdev, &v4l2_event);
+	ret = uvc_events_process_setup(uvc, ctrl, &resp);
+	if (ret == -EOPNOTSUPP) {
+		struct v4l2_event v4l2_event;
+		struct uvc_event *uvc_event = (void *)&v4l2_event.u.data;
 
-	return 0;
+		memset(&v4l2_event, 0, sizeof(v4l2_event));
+		v4l2_event.type = UVC_EVENT_SETUP;
+		memcpy(&uvc_event->req, ctrl, sizeof(uvc_event->req));
+		v4l2_event_queue(&uvc->vdev, &v4l2_event);
+
+		return 0;
+	} else if (ret) {
+		return ret;
+	}
+
+	return uvc_send_response(uvc, &resp);
 }
 
 void uvc_function_setup_continue(struct uvc_device *uvc)
diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 62d7420a25666..d06b5282b4058 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -13,6 +13,7 @@
 #include <linux/mutex.h>
 #include <linux/spinlock.h>
 #include <linux/usb/composite.h>
+#include <linux/usb/video.h>
 #include <linux/videodev2.h>
 
 #include <media/v4l2-device.h>
@@ -85,6 +86,12 @@ struct uvc_video {
 	struct uvcg_frame *cur_frame;
 
 	struct mutex mutex;	/* protects frame parameters */
+	spinlock_t frame_lock;
+
+	struct uvc_streaming_control probe;
+	struct uvc_streaming_control commit;
+
+	int control;
 
 	/* Requests */
 	unsigned int req_size;
@@ -170,4 +177,11 @@ extern void uvc_function_connect(struct uvc_device *uvc);
 extern void uvc_function_disconnect(struct uvc_device *uvc);
 
 extern int uvc_frame_default(struct uvcg_format *ufmt);
+extern struct uvcg_frame *find_frame_by_index(struct uvc_device *uvc,
+					      struct uvcg_format *ufmt,
+					      int index);
+extern void uvc_fill_streaming_control(struct uvc_device *uvc,
+			   struct uvc_streaming_control *ctrl,
+			   int iframe, int iformat, unsigned int ival);
+
 #endif /* _UVC_GADGET_H_ */
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 83830b8864a6e..a89d3d661d99f 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -205,7 +205,8 @@ uvc_v4l2_get_format(struct file *file, void *fh, struct v4l2_format *fmt)
 }
 
 static int _uvc_v4l2_try_fmt(struct uvc_video *video,
-	struct v4l2_format *fmt, struct uvcg_format **uvc_format, struct uvcg_frame **uvc_frame)
+	struct v4l2_format *fmt, struct uvc_streaming_control *probe,
+	struct uvcg_format **uvc_format, struct uvcg_frame **uvc_frame)
 {
 	struct uvc_device *uvc = video->uvc;
 	struct uvcg_format *ufmt;
@@ -253,6 +254,9 @@ static int _uvc_v4l2_try_fmt(struct uvc_video *video,
 		*uvc_format = ufmt;
 	if (uvc_frame != NULL)
 		*uvc_frame = ufrm;
+	if (probe)
+		uvc_fill_streaming_control(uvc, probe,
+				i + 1, ufrm->frame.b_frame_index, 0);
 
 	return 0;
 }
@@ -264,7 +268,7 @@ uvc_v4l2_try_fmt(struct file *file, void *fh, struct v4l2_format *fmt)
 	struct uvc_device *uvc = video_get_drvdata(vdev);
 	struct uvc_video *video = &uvc->video;
 
-	return _uvc_v4l2_try_fmt(video, fmt, NULL, NULL);
+	return _uvc_v4l2_try_fmt(video, fmt, NULL, NULL, NULL);
 }
 
 static int
@@ -273,17 +277,23 @@ uvc_v4l2_set_format(struct file *file, void *fh, struct v4l2_format *fmt)
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
 	struct uvc_video *video = &uvc->video;
+	struct uvc_streaming_control probe;
 	struct uvcg_format *ufmt;
 	struct uvcg_frame *ufrm;
 	int ret;
 
-	ret = _uvc_v4l2_try_fmt(video, fmt, &ufmt, &ufrm);
+	ret = _uvc_v4l2_try_fmt(video, fmt, &probe, &ufmt, &ufrm);
 	if (ret)
 		return ret;
 
+	spin_lock(&video->frame_lock);
+
+	video->commit = probe;
 	video->cur_format = ufmt;
 	video->cur_frame = ufrm;
 
+	spin_unlock(&video->frame_lock);
+
 	return ret;
 }
 
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index b14780bddd838..8f549fe608362 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -346,13 +346,26 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
  */
 int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 {
+	int framedef;
+
 	INIT_LIST_HEAD(&video->req_free);
 	spin_lock_init(&video->req_lock);
+	spin_lock_init(&video->frame_lock);
+
+	/* Allocate a stream specific work queue for asynchronous tasks. */
+	video->async_wq = alloc_workqueue("uvcvideo", WQ_UNBOUND | WQ_HIGHPRI | WQ_CPU_INTENSIVE, 0);
+	if (!video->async_wq)
+		return -EINVAL;
+
 	INIT_WORK(&video->pump, uvcg_video_pump);
 
 	video->uvc = uvc;
 	video->def_format = video->cur_format = uvc->fmt[0];
-	video->cur_frame = uvc->frm[uvc_frame_default(video->def_format) - 1];
+	framedef = uvc_frame_default(video->def_format);
+	video->cur_frame = uvc->frm[framedef - 1];
+
+	uvc_fill_streaming_control(uvc, &video->probe, 1, framedef, 0);
+	uvc_fill_streaming_control(uvc, &video->commit, 1, framedef, 0);
 
 	/* Initialize the video buffers queue. */
 	uvcg_queue_init(&video->queue, V4L2_BUF_TYPE_VIDEO_OUTPUT,
-- 
2.29.2

