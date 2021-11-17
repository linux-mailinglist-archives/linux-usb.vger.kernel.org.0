Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CABF45465E
	for <lists+linux-usb@lfdr.de>; Wed, 17 Nov 2021 13:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236953AbhKQM1u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Nov 2021 07:27:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234448AbhKQM1p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Nov 2021 07:27:45 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCED5C0613B9
        for <linux-usb@vger.kernel.org>; Wed, 17 Nov 2021 04:24:46 -0800 (PST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mnJzZ-0005Ww-0n; Wed, 17 Nov 2021 13:24:45 +0100
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1mnJzY-00A6sK-3K; Wed, 17 Nov 2021 13:24:44 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de
Subject: [PATCH v3 7/7] usb: gadget: uvc: add format/frame handling code
Date:   Wed, 17 Nov 2021 13:24:35 +0100
Message-Id: <20211117122435.2409362-8-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211117122435.2409362-1-m.grzeschik@pengutronix.de>
References: <20211117122435.2409362-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Hostside format selection is currently only done in userspace, as
the events for SET_CUR and GET_CUR are allways moved to the application
layer. Since the v4l2 device parses the configfs data, the format
negotiation can be done in the kernel. This patch adds the functions to
set the current configuration while continuing to forward all unknown
events to the userspace level.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2:
   - fixed the commit message
   - changed pr_debug to pr_err in events_process_data
   - aligned many indentations
   - simplified uvc_events_process_data
   - fixed uvc_fill_streaming_control calls in uvcg_video_init
   - added setup_subcribed to decide if userspace takes over on EOPNOTSUPP
   - added data_subscribed to decide if userspace takes over on EOPNOTSUPP
   - removed duplicate send_response
   - wrting fmt and frm in full
v2 -> v3:
   - added find_format_index to set the right probe

 drivers/usb/gadget/function/f_uvc.c     | 232 +++++++++++++++++++++++-
 drivers/usb/gadget/function/uvc.h       |  18 ++
 drivers/usb/gadget/function/uvc_v4l2.c  |  52 +++++-
 drivers/usb/gadget/function/uvc_video.c |  12 +-
 4 files changed, 305 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index f1fd44e6062980..62fef6e002271a 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -16,7 +16,6 @@
 #include <linux/string.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
-#include <linux/usb/g_uvc.h>
 #include <linux/usb/video.h>
 #include <linux/vmalloc.h>
 #include <linux/wait.h>
@@ -200,16 +199,228 @@ static const struct usb_descriptor_header * const uvc_ss_streaming[] = {
  * Control requests
  */
 
+void uvc_fill_streaming_control(struct uvc_device *uvc,
+			   struct uvc_streaming_control *ctrl,
+			   int iframe, int iformat, unsigned int ival)
+{
+	struct uvcg_format *uformat;
+	struct uvcg_frame *uframe;
+
+	/* Restrict the iformat, iframe and ival to valid values. Negative
+	 * values for ifrmat and iframe will result in the maximum valid value
+	 * being selected
+	 */
+	iformat = clamp((unsigned int)iformat, 1U,
+			(unsigned int)uvc->header->num_fmt);
+	uformat = find_format_by_index(uvc, iformat);
+	if (!uformat)
+		return;
+
+	iframe = clamp((unsigned int)iframe, 1U,
+		       (unsigned int)uformat->num_frames);
+	uframe = find_frame_by_index(uvc, uformat, iframe);
+	if (!uframe)
+		return;
+
+	ival = clamp((unsigned int)ival, 1U,
+		     (unsigned int)uframe->frame.b_frame_interval_type);
+	if (!uframe->dw_frame_interval[ival - 1])
+		return;
+
+	memset(ctrl, 0, sizeof(*ctrl));
+
+	ctrl->bmHint = 1;
+	ctrl->bFormatIndex = iformat;
+	ctrl->bFrameIndex = iframe;
+	ctrl->dwFrameInterval = uframe->dw_frame_interval[ival - 1];
+	ctrl->dwMaxVideoFrameSize =
+		uframe->frame.dw_max_video_frame_buffer_size;
+
+	if (uvc->video.ep->desc)
+		ctrl->dwMaxPayloadTransferSize =
+			uvc->video.ep->desc->wMaxPacketSize;
+	ctrl->bmFramingInfo = 3;
+	ctrl->bPreferedVersion = 1;
+	ctrl->bMaxVersion = 1;
+}
+
+static int uvc_events_process_data(struct uvc_device *uvc,
+				   struct usb_request *req)
+{
+	struct uvc_video *video = &uvc->video;
+	struct uvc_streaming_control *target;
+	struct uvc_streaming_control *ctrl;
+	struct uvcg_frame *uframe;
+	struct uvcg_format *uformat;
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
+		pr_err("setting unknown control, length = %d\n", req->actual);
+		return -EOPNOTSUPP;
+	}
+
+	ctrl = (struct uvc_streaming_control *)req->buf;
+
+	uvc_fill_streaming_control(uvc, target, ctrl->bFormatIndex,
+			   ctrl->bFrameIndex, ctrl->dwFrameInterval);
+
+	if (video->control == UVC_VS_COMMIT_CONTROL) {
+		uformat = find_format_by_index(uvc, target->bFormatIndex);
+		if (!uformat)
+			return -EINVAL;
+
+		uframe = find_frame_by_index(uvc, uformat, ctrl->bFrameIndex);
+		if (!uframe)
+			return -EINVAL;
+
+		spin_lock(&video->frame_lock);
+
+		video->cur_frame = uframe;
+		video->cur_format = uformat;
+		video->cur_ival = ctrl->dwFrameInterval;
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
+uvc_events_process_class(struct uvc_device *uvc,
+			 const struct usb_ctrlrequest *ctrl,
+			 struct uvc_request_data *resp)
+{
+	if ((ctrl->bRequestType & USB_RECIP_MASK) != USB_RECIP_INTERFACE)
+		return -EINVAL;
+
+	if ((ctrl->wIndex & 0xff) == uvc->control_intf)
+		return -EOPNOTSUPP;
+	else if ((ctrl->wIndex & 0xff) == uvc->streaming_intf)
+		uvc_events_process_streaming(uvc, ctrl->bRequest,
+					     ctrl->wValue >> 8, resp);
+
+	return 0;
+}
+
+static int
+uvc_events_process_setup(struct uvc_device *uvc,
+			 const struct usb_ctrlrequest *ctrl,
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
 static void
 uvc_function_ep0_complete(struct usb_ep *ep, struct usb_request *req)
 {
 	struct uvc_device *uvc = req->context;
 	struct v4l2_event v4l2_event;
 	struct uvc_event *uvc_event = (void *)&v4l2_event.u.data;
+	struct uvc_request_data resp;
+	int ret;
 
 	if (uvc->event_setup_out) {
 		uvc->event_setup_out = 0;
 
+		memset(&resp, 0, sizeof(resp));
+		resp.length = -EL2HLT;
+
+		ret = uvc_events_process_data(uvc, req);
+		/* If we have no error on process */
+		if (!ret) {
+			uvc_send_response(uvc, &resp);
+			return;
+		}
+
+		/* If we have a real error on process */
+		if (ret != -EOPNOTSUPP)
+			return;
+
+		/* If we have -EOPNOTSUPP */
+		if (!uvc->data_subscribed)
+			return;
+
+		/* If we have data subscribed */
 		memset(&v4l2_event, 0, sizeof(v4l2_event));
 		v4l2_event.type = UVC_EVENT_DATA;
 		uvc_event->data.length = req->actual;
@@ -224,6 +435,8 @@ uvc_function_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 	struct uvc_device *uvc = to_uvc(f);
 	struct v4l2_event v4l2_event;
 	struct uvc_event *uvc_event = (void *)&v4l2_event.u.data;
+	struct uvc_request_data resp;
+	int ret = 0;
 
 	if ((ctrl->bRequestType & USB_TYPE_MASK) != USB_TYPE_CLASS) {
 		uvcg_info(f, "invalid request type\n");
@@ -240,6 +453,23 @@ uvc_function_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 	uvc->event_setup_out = !(ctrl->bRequestType & USB_DIR_IN);
 	uvc->event_length = le16_to_cpu(ctrl->wLength);
 
+	memset(&resp, 0, sizeof(resp));
+	resp.length = -EL2HLT;
+
+	ret = uvc_events_process_setup(uvc, ctrl, &resp);
+	/* If we have no error on process */
+	if (!ret)
+		return uvc_send_response(uvc, &resp);
+
+	/* If we have a real error on process */
+	if (ret != -EOPNOTSUPP)
+		return ret;
+
+	/* If we have -EOPNOTSUPP */
+	if (!uvc->setup_subscribed)
+		return uvc_send_response(uvc, &resp);
+
+	/* If we have setup subscribed */
 	memset(&v4l2_event, 0, sizeof(v4l2_event));
 	v4l2_event.type = UVC_EVENT_SETUP;
 	memcpy(&uvc_event->req, ctrl, sizeof(uvc_event->req));
diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 9d4db12f45fd30..cac5530a8b071e 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -13,6 +13,8 @@
 #include <linux/mutex.h>
 #include <linux/spinlock.h>
 #include <linux/usb/composite.h>
+#include <linux/usb/g_uvc.h>
+#include <linux/usb/video.h>
 #include <linux/videodev2.h>
 
 #include <media/v4l2-device.h>
@@ -93,6 +95,12 @@ struct uvc_video {
 	unsigned int cur_ival;
 
 	struct mutex mutex;	/* protects frame parameters */
+	spinlock_t frame_lock;
+
+	struct uvc_streaming_control probe;
+	struct uvc_streaming_control commit;
+
+	int control;
 
 	unsigned int uvc_num_requests;
 
@@ -128,6 +136,8 @@ struct uvc_device {
 	struct usb_function func;
 	struct uvc_video video;
 	bool func_connected;
+	bool setup_subscribed;
+	bool data_subscribed;
 
 	struct uvcg_streaming_header *header;
 
@@ -181,5 +191,13 @@ extern struct uvcg_format *find_format_by_index(struct uvc_device *uvc,
 extern struct uvcg_frame *find_frame_by_index(struct uvc_device *uvc,
 					      struct uvcg_format *uformat,
 					      int index);
+extern int find_format_index(struct uvc_device *uvc,
+			       struct uvcg_format *uformat);
+extern void uvc_fill_streaming_control(struct uvc_device *uvc,
+				       struct uvc_streaming_control *ctrl,
+				       int iframe, int iformat,
+				       unsigned int ival);
+extern int uvc_send_response(struct uvc_device *uvc,
+			     struct uvc_request_data *data);
 
 #endif /* _UVC_GADGET_H_ */
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 9128f02ff40d02..112db6503d645f 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -81,6 +81,20 @@ struct uvcg_format *find_format_by_index(struct uvc_device *uvc, int index)
 	return uformat;
 }
 
+int find_format_index(struct uvc_device *uvc, struct uvcg_format *uformat)
+{
+	struct uvcg_format_ptr *format;
+	int i = 1;
+
+	list_for_each_entry(format, &uvc->header->formats, entry) {
+		if (uformat == format->fmt)
+			return i;
+		i++;
+	}
+
+	return 0;
+}
+
 struct uvcg_frame *find_frame_by_index(struct uvc_device *uvc,
 				       struct uvcg_format *uformat,
 				       int index)
@@ -169,8 +183,7 @@ static struct uvcg_frame *find_closest_frame_by_size(struct uvc_device *uvc,
  * Requests handling
  */
 
-static int
-uvc_send_response(struct uvc_device *uvc, struct uvc_request_data *data)
+int uvc_send_response(struct uvc_device *uvc, struct uvc_request_data *data)
 {
 	struct usb_composite_dev *cdev = uvc->func.config->cdev;
 	struct usb_request *req = uvc->control_req;
@@ -229,12 +242,14 @@ uvc_v4l2_get_format(struct file *file, void *fh, struct v4l2_format *fmt)
 }
 
 static int _uvc_v4l2_try_fmt(struct uvc_video *video, struct v4l2_format *fmt,
+			     struct uvc_streaming_control *probe,
 			     struct uvcg_format **uvc_format,
 			     struct uvcg_frame **uvc_frame)
 {
 	struct uvc_device *uvc = video->uvc;
 	struct uvcg_format *uformat;
 	struct uvcg_frame *uframe;
+	int iformat;
 	u8 *fcc;
 
 	if (fmt->type != video->queue.queue.type)
@@ -250,6 +265,10 @@ static int _uvc_v4l2_try_fmt(struct uvc_video *video, struct v4l2_format *fmt,
 	if (!uformat)
 		return -EINVAL;
 
+	iformat = find_format_index(uvc, uformat);
+	if (!iformat)
+		return -EINVAL;
+
 	uframe = find_closest_frame_by_size(uvc, uformat,
 				fmt->fmt.pix.width, fmt->fmt.pix.height);
 	if (!uframe)
@@ -268,6 +287,10 @@ static int _uvc_v4l2_try_fmt(struct uvc_video *video, struct v4l2_format *fmt,
 		*uvc_format = uformat;
 	if (uvc_frame)
 		*uvc_frame = uframe;
+	if (probe)
+		uvc_fill_streaming_control(uvc, probe, iformat,
+					   uframe->frame.b_frame_index,
+					   video->cur_ival);
 
 	return 0;
 }
@@ -279,7 +302,7 @@ uvc_v4l2_try_fmt(struct file *file, void *fh, struct v4l2_format *fmt)
 	struct uvc_device *uvc = video_get_drvdata(vdev);
 	struct uvc_video *video = &uvc->video;
 
-	return _uvc_v4l2_try_fmt(video, fmt, NULL, NULL);
+	return _uvc_v4l2_try_fmt(video, fmt, NULL, NULL, NULL);
 }
 
 static int
@@ -288,17 +311,23 @@ uvc_v4l2_set_format(struct file *file, void *fh, struct v4l2_format *fmt)
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
 	struct uvc_video *video = &uvc->video;
+	struct uvc_streaming_control probe;
 	struct uvcg_format *uformat;
 	struct uvcg_frame *uframe;
 	int ret;
 
-	ret = _uvc_v4l2_try_fmt(video, fmt, &uformat, &uframe);
+	ret = _uvc_v4l2_try_fmt(video, fmt, &probe, &uformat, &uframe);
 	if (ret)
 		return ret;
 
+	spin_lock(&video->frame_lock);
+
+	video->commit = probe;
 	video->cur_format = uformat;
 	video->cur_frame = uframe;
 
+	spin_unlock(&video->frame_lock);
+
 	return ret;
 }
 
@@ -496,14 +525,20 @@ uvc_v4l2_subscribe_event(struct v4l2_fh *fh,
 	if (sub->type < UVC_EVENT_FIRST || sub->type > UVC_EVENT_LAST)
 		return -EINVAL;
 
-	if (sub->type == UVC_EVENT_SETUP && uvc->func_connected)
+	if (sub->type == UVC_EVENT_STREAMON && uvc->func_connected)
 		return -EBUSY;
 
 	ret = v4l2_event_subscribe(fh, sub, 2, NULL);
 	if (ret < 0)
 		return ret;
 
-	if (sub->type == UVC_EVENT_SETUP) {
+	if (sub->type == UVC_EVENT_SETUP)
+		uvc->setup_subscribed = true;
+
+	if (sub->type == UVC_EVENT_DATA)
+		uvc->data_subscribed = true;
+
+	if (sub->type == UVC_EVENT_STREAMON) {
 		uvc->func_connected = true;
 		handle->is_uvc_app_handle = true;
 		uvc_function_connect(uvc);
@@ -532,7 +567,10 @@ uvc_v4l2_unsubscribe_event(struct v4l2_fh *fh,
 	if (ret < 0)
 		return ret;
 
-	if (sub->type == UVC_EVENT_SETUP && handle->is_uvc_app_handle) {
+	if (sub->type == UVC_EVENT_SETUP)
+		uvc->setup_subscribed = false;
+
+	if (sub->type == UVC_EVENT_STREAMON && handle->is_uvc_app_handle) {
 		uvc_v4l2_disable(uvc);
 		handle->is_uvc_app_handle = false;
 	}
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 9fb2b9c575ed34..7eb5364997028b 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -517,10 +517,11 @@ static int uvc_default_frame_interval(struct uvc_video *video)
  */
 int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 {
-	int iframe;
+	int iframe, iformat;
 
 	INIT_LIST_HEAD(&video->req_free);
 	spin_lock_init(&video->req_lock);
+	spin_lock_init(&video->frame_lock);
 	INIT_WORK(&video->pump, uvcg_video_pump);
 
 	if (list_empty(&uvc->header->formats))
@@ -531,6 +532,10 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 	if (!video->cur_format)
 		return -EINVAL;
 
+	iformat = find_format_index(uvc, video->cur_format);
+	if (!iformat)
+		return -EINVAL;
+
 	iframe = uvc_frame_default(video->cur_format);
 	if (!iframe)
 		return -EINVAL;
@@ -541,6 +546,11 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 
 	video->cur_ival = uvc_default_frame_interval(video);
 
+	uvc_fill_streaming_control(uvc, &video->probe, iframe, iformat,
+				   video->cur_ival);
+	uvc_fill_streaming_control(uvc, &video->commit, iframe, iformat,
+				   video->cur_ival);
+
 	/* Initialize the video buffers queue. */
 	uvcg_queue_init(&video->queue, uvc->v4l2_dev.dev->parent,
 			V4L2_BUF_TYPE_VIDEO_OUTPUT, &video->mutex);
-- 
2.30.2

