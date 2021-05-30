Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D371E39532C
	for <lists+linux-usb@lfdr.de>; Mon, 31 May 2021 00:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbhE3WYb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 30 May 2021 18:24:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbhE3WY3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 30 May 2021 18:24:29 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC51C061574
        for <linux-usb@vger.kernel.org>; Sun, 30 May 2021 15:22:50 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lnTpW-0000Eu-36; Mon, 31 May 2021 00:22:46 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lnTpV-0002cj-8r; Mon, 31 May 2021 00:22:45 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        caleb.connolly@ideasonboard.com, paul.elder@ideasonboard.com,
        balbi@kernel.org, kernel@pengutronix.de
Subject: [PATCH 2/3] usb: gadget: uvc: add VIDIOC function
Date:   Mon, 31 May 2021 00:22:38 +0200
Message-Id: <20210530222239.8793-3-m.grzeschik@pengutronix.de>
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

This patch adds support to the v4l2 VIDIOC for enum_format,
enum_framesizes, enum_frameintervals and try_fmt. The configfs userspace
setup gets parsed and this configfs data is used in the v4l2 interface
functions.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/gadget/function/f_uvc.c        |  54 ++++
 drivers/usb/gadget/function/uvc.h          |  18 +-
 drivers/usb/gadget/function/uvc_configfs.c |   5 +
 drivers/usb/gadget/function/uvc_configfs.h |   2 +
 drivers/usb/gadget/function/uvc_queue.c    |   4 +-
 drivers/usb/gadget/function/uvc_v4l2.c     | 325 ++++++++++++++++++---
 drivers/usb/gadget/function/uvc_v4l2.h     |   1 +
 drivers/usb/gadget/function/uvc_video.c    |  10 +-
 8 files changed, 369 insertions(+), 50 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index f48a00e497945..7945ea93a775a 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -410,6 +410,44 @@ static ssize_t function_name_show(struct device *dev,
 
 static DEVICE_ATTR_RO(function_name);
 
+static int
+uvc_analyze_configfs(struct uvc_device *uvc)
+{
+	struct uvcg_streaming_header *src_hdr = uvc->h;
+	struct config_item *item;
+	struct config_group *grp;
+	struct uvcg_format_ptr *f;
+	int i = 0, j = 0;
+
+	if (!src_hdr->linked)
+		return -EBUSY;
+
+	list_for_each_entry(f, &src_hdr->formats, entry)
+		uvc->nframes += f->fmt->num_frames;
+
+	uvc->nformats = src_hdr->num_fmt;
+
+	uvc->frm = kcalloc(uvc->nframes, sizeof(struct uvcg_frame *), GFP_KERNEL);
+	if (!uvc->frm)
+		return -ENOMEM;
+
+	uvc->fmt = kcalloc(uvc->nformats, sizeof(struct uvcg_format *), GFP_KERNEL);
+	if (!uvc->fmt) {
+		kfree(uvc->frm);
+		return -ENOMEM;
+	}
+
+	list_for_each_entry(f, &src_hdr->formats, entry) {
+		uvc->fmt[i++] = f->fmt;
+		grp = &f->fmt->group;
+		list_for_each_entry(item, &grp->cg_children, ci_entry) {
+			uvc->frm[j++] = to_uvcg_frame(item);
+		}
+	}
+
+	return 0;
+}
+
 static int
 uvc_register_video(struct uvc_device *uvc)
 {
@@ -742,6 +780,13 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 		goto error;
 	}
 
+	/* Register configfs formats and frames. */
+	ret = uvc_analyze_configfs(uvc);
+	if (ret < 0) {
+		uvcg_err(f, "failed to read configfs\n");
+		goto v4l2_error;
+	}
+
 	/* Initialise video. */
 	ret = uvcg_video_init(&uvc->video, uvc);
 	if (ret < 0)
@@ -905,6 +950,8 @@ static struct usb_function *uvc_alloc(struct usb_function_instance *fi)
 	struct uvc_device *uvc;
 	struct f_uvc_opts *opts;
 	struct uvc_descriptor_header **strm_cls;
+	struct config_item *item;
+	struct config_group *grp;
 
 	uvc = kzalloc(sizeof(*uvc), GFP_KERNEL);
 	if (uvc == NULL)
@@ -936,6 +983,13 @@ static struct usb_function *uvc_alloc(struct usb_function_instance *fi)
 	uvc->desc.fs_streaming = opts->fs_streaming;
 	uvc->desc.hs_streaming = opts->hs_streaming;
 	uvc->desc.ss_streaming = opts->ss_streaming;
+
+	grp = &opts->func_inst.group;
+	item = config_group_find_item(grp, "streaming");
+	item = config_group_find_item(to_config_group(item), "header");
+	item = config_group_find_item(to_config_group(item), "h");
+	uvc->h = to_uvcg_streaming_header(item);
+
 	++opts->refcnt;
 	mutex_unlock(&opts->lock);
 
diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 23ee25383c1f7..62d7420a25666 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -80,11 +80,10 @@ struct uvc_video {
 	struct work_struct pump;
 
 	/* Frame parameters */
-	u8 bpp;
-	u32 fcc;
-	unsigned int width;
-	unsigned int height;
-	unsigned int imagesize;
+	struct uvcg_format *def_format;
+	struct uvcg_format *cur_format;
+	struct uvcg_frame *cur_frame;
+
 	struct mutex mutex;	/* protects frame parameters */
 
 	/* Requests */
@@ -118,6 +117,14 @@ struct uvc_device {
 	struct usb_function func;
 	struct uvc_video video;
 
+	struct uvcg_streaming_header *h;
+
+	struct uvcg_frame **frm;
+	int nframes;
+
+	struct uvcg_format **fmt;
+	int nformats;
+
 	/* Descriptors */
 	struct {
 		const struct uvc_descriptor_header * const *fs_control;
@@ -162,4 +169,5 @@ extern void uvc_endpoint_stream(struct uvc_device *dev);
 extern void uvc_function_connect(struct uvc_device *uvc);
 extern void uvc_function_disconnect(struct uvc_device *uvc);
 
+extern int uvc_frame_default(struct uvcg_format *ufmt);
 #endif /* _UVC_GADGET_H_ */
diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 86463bb2639ed..009c80d0e1780 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -11,6 +11,7 @@
  */
 
 #include <linux/sort.h>
+#include <linux/videodev2.h>
 
 #include "u_uvc.h"
 #include "uvc_configfs.h"
@@ -1547,6 +1548,8 @@ static struct config_group *uvcg_uncompressed_make(struct config_group *group,
 	h->desc.bCopyProtect		= 0;
 
 	h->fmt.type = UVCG_UNCOMPRESSED;
+	h->fmt.fcc = V4L2_PIX_FMT_YUYV;
+	h->fmt.name = "YUV 4:2:2 (YUYV)";
 	config_group_init_type_name(&h->fmt.group, name,
 				    &uvcg_uncompressed_type);
 
@@ -1721,6 +1724,8 @@ static struct config_group *uvcg_mjpeg_make(struct config_group *group,
 	h->desc.bCopyProtect		= 0;
 
 	h->fmt.type = UVCG_MJPEG;
+	h->fmt.fcc = V4L2_PIX_FMT_MJPEG;
+	h->fmt.name = "MJPEG";
 	config_group_init_type_name(&h->fmt.group, name,
 				    &uvcg_mjpeg_type);
 
diff --git a/drivers/usb/gadget/function/uvc_configfs.h b/drivers/usb/gadget/function/uvc_configfs.h
index f905d29570eb4..8ed966275f838 100644
--- a/drivers/usb/gadget/function/uvc_configfs.h
+++ b/drivers/usb/gadget/function/uvc_configfs.h
@@ -52,6 +52,8 @@ struct uvcg_format {
 	enum uvcg_format_type	type;
 	unsigned		linked;
 	unsigned		num_frames;
+	char			*name;
+	u32			fcc;
 	__u8			bmaControls[UVCG_STREAMING_CONTROL_SIZE];
 };
 
diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
index 61e2c94cc0b0c..6afc4b79adfe9 100644
--- a/drivers/usb/gadget/function/uvc_queue.c
+++ b/drivers/usb/gadget/function/uvc_queue.c
@@ -20,6 +20,8 @@
 #include <media/videobuf2-vmalloc.h>
 
 #include "uvc.h"
+#include "u_uvc.h"
+#include "uvc_configfs.h"
 
 /* ------------------------------------------------------------------------
  * Video buffers queue management.
@@ -49,7 +51,7 @@ static int uvc_queue_setup(struct vb2_queue *vq,
 
 	*nplanes = 1;
 
-	sizes[0] = video->imagesize;
+	sizes[0] = video->cur_frame->frame.dw_max_video_frame_buffer_size;
 
 	return 0;
 }
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 4ca89eab61590..83830b8864a6e 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -24,6 +24,127 @@
 #include "uvc_queue.h"
 #include "uvc_video.h"
 #include "uvc_v4l2.h"
+#include "u_uvc.h"
+#include "uvc_configfs.h"
+
+u32 uvc_v4l2_get_bytesperline(struct uvcg_format *fmt, struct uvcg_frame *frm)
+{
+	struct uvcg_uncompressed *u;
+
+	switch (fmt->type) {
+	case UVCG_UNCOMPRESSED:
+		u = to_uvcg_uncompressed(&fmt->group.cg_item);
+		if (!u)
+			return 0;
+
+		return u->desc.bBitsPerPixel * frm->frame.w_width / 8;
+	case UVCG_MJPEG:
+		return frm->frame.w_width;
+	}
+
+	return 0;
+}
+
+struct uvcg_frame *find_frame_by_index(struct uvc_device *uvc,
+					      struct uvcg_format *ufmt,
+					      int index)
+{
+	int i;
+
+	for (i = 0; i < uvc->nframes; i++) {
+		if (uvc->frm[i]->fmt_type != ufmt->type)
+			continue;
+
+		if (index == uvc->frm[i]->frame.b_frame_index)
+			break;
+	}
+
+	if (i == uvc->nframes)
+		return NULL;
+
+	return uvc->frm[i];
+}
+
+static struct uvcg_format *find_format_by_pix(struct uvc_device *uvc,
+						    u32 pixelformat)
+{
+	int i;
+
+	for (i = 0; i < uvc->nformats; i++)
+		if (uvc->fmt[i]->fcc == pixelformat)
+			break;
+
+	if (i == uvc->nformats)
+		return NULL;
+
+	return uvc->fmt[i];
+}
+
+int uvc_frame_default(struct uvcg_format *ufmt)
+{
+	struct uvcg_uncompressed *m;
+	struct uvcg_uncompressed *u;
+	int ret = 1;
+
+	switch (ufmt->type) {
+	case UVCG_UNCOMPRESSED:
+		u = to_uvcg_uncompressed(&ufmt->group.cg_item);
+		if (u)
+			ret = u->desc.bDefaultFrameIndex;
+		break;
+	case UVCG_MJPEG:
+		m = to_uvcg_uncompressed(&ufmt->group.cg_item);
+		if (m)
+			ret = m->desc.bDefaultFrameIndex;
+		break;
+	}
+
+	if (!ret)
+		ret = 1;
+
+	return ret;
+}
+
+static struct uvcg_frame *find_frm_by_size(struct uvc_device *uvc,
+					   struct uvcg_format *ufmt,
+					   u16 rw, u16 rh)
+{
+	struct uvc_video *video = &uvc->video;
+	struct uvcg_frame *ufrm = NULL;
+	unsigned int d, maxd;
+	int i;
+
+	/* Find the closest image size. The distance between image sizes is
+	 * the size in pixels of the non-overlapping regions between the
+	 * requested size and the frame-specified size.
+	 */
+	maxd = (unsigned int)-1;
+
+	for (i = 0; i < uvc->nframes; i++) {
+		u16 w, h;
+
+		if (uvc->frm[i]->fmt_type != ufmt->type)
+			continue;
+
+		w = uvc->frm[i]->frame.w_width;
+		h = uvc->frm[i]->frame.w_height;
+
+		d = min(w, rw) * min(h, rh);
+		d = w*h + rw*rh - 2*d;
+		if (d < maxd) {
+			maxd = d;
+			ufrm = uvc->frm[i];
+		}
+
+		if (maxd == 0)
+			break;
+	}
+
+	if (ufrm == NULL)
+		uvcg_dbg(&video->uvc->func, "Unsupported size %ux%u\n", rw, rh);
+
+	return ufrm;
+}
 
 /* --------------------------------------------------------------------------
  * Requests handling
@@ -50,16 +171,6 @@ uvc_send_response(struct uvc_device *uvc, struct uvc_request_data *data)
  * V4L2 ioctls
  */
 
-struct uvc_format {
-	u8 bpp;
-	u32 fcc;
-};
-
-static struct uvc_format uvc_formats[] = {
-	{ 16, V4L2_PIX_FMT_YUYV  },
-	{ 0,  V4L2_PIX_FMT_MJPEG },
-};
-
 static int
 uvc_v4l2_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 {
@@ -81,55 +192,187 @@ uvc_v4l2_get_format(struct file *file, void *fh, struct v4l2_format *fmt)
 	struct uvc_device *uvc = video_get_drvdata(vdev);
 	struct uvc_video *video = &uvc->video;
 
-	fmt->fmt.pix.pixelformat = video->fcc;
-	fmt->fmt.pix.width = video->width;
-	fmt->fmt.pix.height = video->height;
+	fmt->fmt.pix.pixelformat = video->cur_format->fcc;
+	fmt->fmt.pix.width = video->cur_frame->frame.w_width;
+	fmt->fmt.pix.height = video->cur_frame->frame.w_height;
+	fmt->fmt.pix.field = V4L2_FIELD_NONE;
+	fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(video->cur_format, video->cur_frame);
+	fmt->fmt.pix.sizeimage = video->cur_frame->frame.dw_max_video_frame_buffer_size;
+	fmt->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
+	fmt->fmt.pix.priv = 0;
+
+	return 0;
+}
+
+static int _uvc_v4l2_try_fmt(struct uvc_video *video,
+	struct v4l2_format *fmt, struct uvcg_format **uvc_format, struct uvcg_frame **uvc_frame)
+{
+	struct uvc_device *uvc = video->uvc;
+	struct uvcg_format *ufmt;
+	struct uvcg_frame *ufrm;
+	u8 *fcc;
+	int i;
+
+	if (fmt->type != video->queue.queue.type)
+		return -EINVAL;
+
+	fcc = (u8 *)&fmt->fmt.pix.pixelformat;
+	uvcg_dbg(&uvc->func, "Trying format 0x%08x (%c%c%c%c): %ux%u\n",
+		fmt->fmt.pix.pixelformat,
+		fcc[0], fcc[1], fcc[2], fcc[3],
+		fmt->fmt.pix.width, fmt->fmt.pix.height);
+
+	for (i = 0; i < uvc->nformats; i++)
+		if (uvc->fmt[i]->fcc == fmt->fmt.pix.pixelformat)
+			break;
+
+	if (i == uvc->nformats)
+		ufmt = video->def_format;
+
+	ufmt = uvc->fmt[i];
+
+	ufrm = find_frm_by_size(uvc, ufmt,
+				fmt->fmt.pix.width, fmt->fmt.pix.height);
+	if (!ufrm)
+		return -EINVAL;
+
+	fmt->fmt.pix.width = ufrm->frame.w_width;
+	fmt->fmt.pix.height = ufrm->frame.w_height;
 	fmt->fmt.pix.field = V4L2_FIELD_NONE;
-	fmt->fmt.pix.bytesperline = video->bpp * video->width / 8;
-	fmt->fmt.pix.sizeimage = video->imagesize;
+	fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(ufmt, ufrm);
+	fmt->fmt.pix.sizeimage = ufrm->frame.dw_max_video_frame_buffer_size;
+	fmt->fmt.pix.pixelformat = ufmt->fcc;
 	fmt->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
 	fmt->fmt.pix.priv = 0;
 
+	if (!fmt->fmt.pix.sizeimage && fmt->fmt.pix.bytesperline)
+		fmt->fmt.pix.sizeimage = fmt->fmt.pix.bytesperline *
+				fmt->fmt.pix.height;
+
+	if (uvc_format != NULL)
+		*uvc_format = ufmt;
+	if (uvc_frame != NULL)
+		*uvc_frame = ufrm;
+
 	return 0;
 }
 
+static int
+uvc_v4l2_try_fmt(struct file *file, void *fh, struct v4l2_format *fmt)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct uvc_device *uvc = video_get_drvdata(vdev);
+	struct uvc_video *video = &uvc->video;
+
+	return _uvc_v4l2_try_fmt(video, fmt, NULL, NULL);
+}
+
 static int
 uvc_v4l2_set_format(struct file *file, void *fh, struct v4l2_format *fmt)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
 	struct uvc_video *video = &uvc->video;
-	struct uvc_format *format;
-	unsigned int imagesize;
-	unsigned int bpl;
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(uvc_formats); ++i) {
-		format = &uvc_formats[i];
-		if (format->fcc == fmt->fmt.pix.pixelformat)
+	struct uvcg_format *ufmt;
+	struct uvcg_frame *ufrm;
+	int ret;
+
+	ret = _uvc_v4l2_try_fmt(video, fmt, &ufmt, &ufrm);
+	if (ret)
+		return ret;
+
+	video->cur_format = ufmt;
+	video->cur_frame = ufrm;
+
+	return ret;
+}
+
+static int
+uvc_v4l2_enum_frameintervals(struct file *file, void *fh,
+		struct v4l2_frmivalenum *fival)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct uvc_device *uvc = video_get_drvdata(vdev);
+	struct uvcg_format *ufmt = NULL;
+	struct uvcg_frame *ufrm = NULL;
+	int i;
+
+	ufmt = find_format_by_pix(uvc, fival->pixel_format);
+	if (!ufmt)
+		return -EINVAL;
+
+	for (i = 0; i < uvc->nframes; ++i) {
+		if (uvc->frm[i]->fmt_type != ufmt->type)
+			continue;
+
+		if (uvc->frm[i]->frame.w_width == fival->width &&
+				uvc->frm[i]->frame.w_height == fival->height) {
+			ufrm = uvc->frm[i];
 			break;
+		}
 	}
+	if (!ufrm)
+		return -EINVAL;
 
-	if (i == ARRAY_SIZE(uvc_formats)) {
-		uvcg_info(&uvc->func, "Unsupported format 0x%08x.\n",
-			  fmt->fmt.pix.pixelformat);
+	if (fival->index >= ufrm->frame.b_frame_interval_type)
 		return -EINVAL;
-	}
 
-	bpl = format->bpp * fmt->fmt.pix.width / 8;
-	imagesize = bpl ? bpl * fmt->fmt.pix.height : fmt->fmt.pix.sizeimage;
+	/* TODO: handle V4L2_FRMIVAL_TYPE_STEPWISE */
+	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
+	fival->discrete.numerator = ufrm->dw_frame_interval[fival->index];
+	fival->discrete.denominator = 10000000;
+	v4l2_simplify_fraction(&fival->discrete.numerator,
+		&fival->discrete.denominator, 8, 333);
 
-	video->fcc = format->fcc;
-	video->bpp = format->bpp;
-	video->width = fmt->fmt.pix.width;
-	video->height = fmt->fmt.pix.height;
-	video->imagesize = imagesize;
+	return 0;
+}
 
-	fmt->fmt.pix.field = V4L2_FIELD_NONE;
-	fmt->fmt.pix.bytesperline = bpl;
-	fmt->fmt.pix.sizeimage = imagesize;
-	fmt->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
-	fmt->fmt.pix.priv = 0;
+static int
+uvc_v4l2_enum_framesizes(struct file *file, void *fh,
+		struct v4l2_frmsizeenum *fsize)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct uvc_device *uvc = video_get_drvdata(vdev);
+	struct uvcg_format *ufmt = NULL;
+	struct uvcg_frame *ufrm = NULL;
+
+	ufmt = find_format_by_pix(uvc, fsize->pixel_format);
+	if (!ufmt)
+		return -EINVAL;
+
+	if (fsize->index >= ufmt->num_frames)
+		return -EINVAL;
+
+	ufrm = find_frame_by_index(uvc, ufmt, fsize->index + 1);
+	if (!ufrm)
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
+	fsize->discrete.width = ufrm->frame.w_width;
+	fsize->discrete.height = ufrm->frame.w_height;
+
+	return 0;
+}
+
+static int
+uvc_v4l2_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct uvc_device *uvc = video_get_drvdata(vdev);
+	struct uvcg_format *ufmt;
+
+	if (f->index >= uvc->nformats)
+		return -EINVAL;
+
+	ufmt = uvc->fmt[f->index];
+	if (!ufmt)
+		return -EINVAL;
+
+	f->pixelformat = ufmt->fcc;
+	f->flags |= V4L2_FMT_FLAG_COMPRESSED;
+
+	strscpy(f->description, ufmt->name, sizeof(f->description));
+	f->description[sizeof(f->description) - 1] = 0;
 
 	return 0;
 }
@@ -258,8 +501,12 @@ uvc_v4l2_ioctl_default(struct file *file, void *fh, bool valid_prio,
 
 const struct v4l2_ioctl_ops uvc_v4l2_ioctl_ops = {
 	.vidioc_querycap = uvc_v4l2_querycap,
+	.vidioc_try_fmt_vid_out = uvc_v4l2_try_fmt,
 	.vidioc_g_fmt_vid_out = uvc_v4l2_get_format,
 	.vidioc_s_fmt_vid_out = uvc_v4l2_set_format,
+	.vidioc_enum_frameintervals = uvc_v4l2_enum_frameintervals,
+	.vidioc_enum_framesizes = uvc_v4l2_enum_framesizes,
+	.vidioc_enum_fmt_vid_out = uvc_v4l2_enum_fmt,
 	.vidioc_reqbufs = uvc_v4l2_reqbufs,
 	.vidioc_querybuf = uvc_v4l2_querybuf,
 	.vidioc_qbuf = uvc_v4l2_qbuf,
diff --git a/drivers/usb/gadget/function/uvc_v4l2.h b/drivers/usb/gadget/function/uvc_v4l2.h
index 1576005b61fd3..6e45103bbf793 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.h
+++ b/drivers/usb/gadget/function/uvc_v4l2.h
@@ -15,5 +15,6 @@
 
 extern const struct v4l2_ioctl_ops uvc_v4l2_ioctl_ops;
 extern const struct v4l2_file_operations uvc_v4l2_fops;
+extern u32 uvc_v4l2_get_bytesperline(struct uvcg_format *fmt, struct uvcg_frame *frm);
 
 #endif /* __UVC_V4L2_H__ */
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 633e23d58d868..b14780bddd838 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -17,7 +17,10 @@
 
 #include "uvc.h"
 #include "uvc_queue.h"
+#include "uvc_v4l2.h"
 #include "uvc_video.h"
+#include "u_uvc.h"
+#include "uvc_configfs.h"
 
 /* --------------------------------------------------------------------------
  * Video codecs
@@ -348,11 +351,8 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 	INIT_WORK(&video->pump, uvcg_video_pump);
 
 	video->uvc = uvc;
-	video->fcc = V4L2_PIX_FMT_YUYV;
-	video->bpp = 16;
-	video->width = 320;
-	video->height = 240;
-	video->imagesize = 320 * 240 * 2;
+	video->def_format = video->cur_format = uvc->fmt[0];
+	video->cur_frame = uvc->frm[uvc_frame_default(video->def_format) - 1];
 
 	/* Initialize the video buffers queue. */
 	uvcg_queue_init(&video->queue, V4L2_BUF_TYPE_VIDEO_OUTPUT,
-- 
2.29.2

