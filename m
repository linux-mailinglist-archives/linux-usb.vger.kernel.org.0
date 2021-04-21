Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 161523674B5
	for <lists+linux-usb@lfdr.de>; Wed, 21 Apr 2021 23:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243471AbhDUVPv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Apr 2021 17:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240757AbhDUVPu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Apr 2021 17:15:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8D22C06138A
        for <linux-usb@vger.kernel.org>; Wed, 21 Apr 2021 14:15:16 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lZKBn-0007Ym-AS; Wed, 21 Apr 2021 23:15:15 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lZKBm-0007e8-Q5; Wed, 21 Apr 2021 23:15:14 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: [PATCH 2/3] usb: gadget: uvc: add scatter gather support
Date:   Wed, 21 Apr 2021 23:15:12 +0200
Message-Id: <20210421211513.29002-3-m.grzeschik@pengutronix.de>
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

This patch adds support for scatter gather transfers. If the underlying
gadgets sg_supported == true, then the videeobuf2-dma-sg is used and the
encode routine maps all scatter entries to separate scatterlists for the
usb gadget.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/gadget/Kconfig              |  1 +
 drivers/usb/gadget/function/f_uvc.c     |  1 +
 drivers/usb/gadget/function/uvc.h       |  2 +
 drivers/usb/gadget/function/uvc_queue.c | 23 ++++++-
 drivers/usb/gadget/function/uvc_queue.h |  5 +-
 drivers/usb/gadget/function/uvc_video.c | 80 ++++++++++++++++++++++++-
 6 files changed, 105 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
index 2d152571a7de8..dd58094f0b85b 100644
--- a/drivers/usb/gadget/Kconfig
+++ b/drivers/usb/gadget/Kconfig
@@ -450,6 +450,7 @@ config USB_CONFIGFS_F_UVC
 	depends on USB_CONFIGFS
 	depends on VIDEO_V4L2
 	depends on VIDEO_DEV
+	select VIDEOBUF2_DMA_SG
 	select VIDEOBUF2_VMALLOC
 	select USB_F_UVC
 	help
diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index f48a00e497945..9d87c0fb8f92e 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -418,6 +418,7 @@ uvc_register_video(struct uvc_device *uvc)
 
 	/* TODO reference counting. */
 	uvc->vdev.v4l2_dev = &uvc->v4l2_dev;
+	uvc->vdev.v4l2_dev->dev = &cdev->gadget->dev;
 	uvc->vdev.fops = &uvc_v4l2_fops;
 	uvc->vdev.ioctl_ops = &uvc_v4l2_ioctl_ops;
 	uvc->vdev.release = video_device_release_empty;
diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 83b9e945944e8..c1f06d9df5820 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -75,6 +75,8 @@ struct uvc_request {
 	struct usb_request *req;
 	__u8 *req_buffer;
 	struct uvc_video *video;
+	struct sg_table sgt;
+	u8 header[2];
 };
 
 struct uvc_video {
diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
index dcd71304d521c..e36a3506842b7 100644
--- a/drivers/usb/gadget/function/uvc_queue.c
+++ b/drivers/usb/gadget/function/uvc_queue.c
@@ -18,6 +18,7 @@
 
 #include <media/v4l2-common.h>
 #include <media/videobuf2-vmalloc.h>
+#include <media/videobuf2-dma-sg.h>
 
 #include "uvc.h"
 
@@ -52,6 +53,7 @@ static int uvc_queue_setup(struct vb2_queue *vq,
 	*nplanes = 1;
 
 	sizes[0] = video->imagesize;
+	alloc_devs[0] = video->uvc->v4l2_dev.dev->parent;
 
 	if (cdev->gadget->speed < USB_SPEED_SUPER)
 		video->uvc_num_requests = 4;
@@ -66,6 +68,9 @@ static int uvc_buffer_prepare(struct vb2_buffer *vb)
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vb->vb2_queue);
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct uvc_buffer *buf = container_of(vbuf, struct uvc_buffer, buf);
+	struct uvc_video *video = container_of(queue, struct uvc_video, queue);
+	struct uvc_device *uvc = video->uvc;
+	struct usb_composite_dev *cdev = uvc->func.config->cdev;
 
 	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT &&
 	    vb2_get_plane_payload(vb, 0) > vb2_plane_size(vb, 0)) {
@@ -77,7 +82,12 @@ static int uvc_buffer_prepare(struct vb2_buffer *vb)
 		return -ENODEV;
 
 	buf->state = UVC_BUF_STATE_QUEUED;
-	buf->mem = vb2_plane_vaddr(vb, 0);
+	if (cdev->gadget->sg_supported) {
+		buf->sgt = vb2_dma_sg_plane_desc(vb, 0);
+		buf->sg = buf->sgt->sgl;
+	} else {
+		buf->mem = vb2_plane_vaddr(vb, 0);
+	}
 	buf->length = vb2_plane_size(vb, 0);
 	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		buf->bytesused = 0;
@@ -117,9 +127,11 @@ static const struct vb2_ops uvc_queue_qops = {
 	.wait_finish = vb2_ops_wait_finish,
 };
 
-int uvcg_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type,
+int uvcg_queue_init(struct device *dev, struct uvc_video_queue *queue, enum v4l2_buf_type type,
 		    struct mutex *lock)
 {
+	struct uvc_video *video = container_of(queue, struct uvc_video, queue);
+	struct usb_composite_dev *cdev = video->uvc->func.config->cdev;
 	int ret;
 
 	queue->queue.type = type;
@@ -128,9 +140,14 @@ int uvcg_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type,
 	queue->queue.buf_struct_size = sizeof(struct uvc_buffer);
 	queue->queue.ops = &uvc_queue_qops;
 	queue->queue.lock = lock;
-	queue->queue.mem_ops = &vb2_vmalloc_memops;
+	if (cdev->gadget->sg_supported)
+		queue->queue.mem_ops = &vb2_dma_sg_memops;
+	else
+		queue->queue.mem_ops = &vb2_vmalloc_memops;
+
 	queue->queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC
 				     | V4L2_BUF_FLAG_TSTAMP_SRC_EOF;
+	queue->queue.dev = dev;
 	ret = vb2_queue_init(&queue->queue);
 	if (ret)
 		return ret;
diff --git a/drivers/usb/gadget/function/uvc_queue.h b/drivers/usb/gadget/function/uvc_queue.h
index 2f0fff7698430..bb8753b26074f 100644
--- a/drivers/usb/gadget/function/uvc_queue.h
+++ b/drivers/usb/gadget/function/uvc_queue.h
@@ -34,6 +34,9 @@ struct uvc_buffer {
 
 	enum uvc_buffer_state state;
 	void *mem;
+	struct sg_table *sgt;
+	struct scatterlist *sg;
+	unsigned int offset;
 	unsigned int length;
 	unsigned int bytesused;
 };
@@ -59,7 +62,7 @@ static inline int uvc_queue_streaming(struct uvc_video_queue *queue)
 	return vb2_is_streaming(&queue->queue);
 }
 
-int uvcg_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type,
+int uvcg_queue_init(struct device *d, struct uvc_video_queue *queue, enum v4l2_buf_type type,
 		    struct mutex *lock);
 
 void uvcg_free_buffers(struct uvc_video_queue *queue);
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index e7910615c8faa..85b6a4c080065 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -95,6 +95,71 @@ uvc_video_encode_bulk(struct usb_request *req, struct uvc_video *video,
 		video->payload_size = 0;
 }
 
+static void
+uvc_video_encode_isoc_sg(struct usb_request *req, struct uvc_video *video,
+		struct uvc_buffer *buf)
+{
+	int pending = buf->bytesused - video->queue.buf_used;
+	struct uvc_request *ureq = req->context;
+	struct scatterlist *sg, *iter;
+	int len = video->req_size;
+	int sg_left, part = 0;
+	int ret;
+	int i;
+
+	sg = ureq->sgt.sgl;
+	sg_init_table(sg, ureq->sgt.nents);
+
+	/* Init the header. */
+	memset(ureq->header, 0, 2);
+	ret = uvc_video_encode_header(video, buf, ureq->header,
+				      video->req_size);
+	sg_set_buf(sg, ureq->header, 2);
+	len -= ret;
+
+	if (pending <= len)
+		len = pending;
+
+	req->length = (len == pending) ? len + 2 : video->req_size;
+
+	/* Init the pending sgs with payload */
+	sg = sg_next(sg);
+
+	for_each_sg(sg, iter, ureq->sgt.nents - 1, i) {
+		if (!len || !buf->sg)
+			break;
+
+		sg_left = sg_dma_len(buf->sg) - buf->offset;
+		part = min_t(unsigned int, len, sg_left);
+
+		sg_set_page(iter, sg_page(buf->sg), part, buf->offset);
+
+		if (part == sg_left) {
+			buf->offset = 0;
+			buf->sg = sg_next(buf->sg);
+		} else {
+			buf->offset += part;
+		}
+		len -= part;
+	}
+
+	/* Assign the video data with header. */
+	req->buf = NULL;
+	req->sg	= ureq->sgt.sgl;
+	req->num_sgs = i + 1;
+
+	req->length -= len;
+	video->queue.buf_used += req->length - 2;
+
+	if (buf->bytesused == video->queue.buf_used || !buf->sg) {
+		video->queue.buf_used = 0;
+		buf->state = UVC_BUF_STATE_DONE;
+		buf->offset = 0;
+		uvcg_queue_next_buffer(&video->queue, buf);
+		video->fid ^= UVC_STREAM_FID;
+	}
+}
+
 static void
 uvc_video_encode_isoc(struct usb_request *req, struct uvc_video *video,
 		struct uvc_buffer *buf)
@@ -229,6 +294,10 @@ uvc_video_alloc_requests(struct uvc_video *video)
 		video->ureq[i].video = video;
 
 		list_add_tail(&video->ureq[i].req->list, &video->req_free);
+		/* req_size/PAGE_SIZE + 1 for overruns and + 1 for header */
+		sg_alloc_table(&video->ureq[i].sgt,
+			       DIV_ROUND_UP(req_size - 2, PAGE_SIZE) + 2,
+			       GFP_KERNEL);
 	}
 
 	video->req_size = req_size;
@@ -306,6 +375,7 @@ static void uvcg_video_pump(struct work_struct *work)
  */
 int uvcg_video_enable(struct uvc_video *video, int enable)
 {
+	struct usb_composite_dev *cdev = video->uvc->func.config->cdev;
 	unsigned int i;
 	int ret;
 
@@ -337,8 +407,12 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
 	if (video->max_payload_size) {
 		video->encode = uvc_video_encode_bulk;
 		video->payload_size = 0;
-	} else
-		video->encode = uvc_video_encode_isoc;
+	} else {
+		if (cdev->gadget->sg_supported)
+			video->encode = uvc_video_encode_isoc_sg;
+		else
+			video->encode = uvc_video_encode_isoc;
+	}
 
 	schedule_work(&video->pump);
 
@@ -362,7 +436,7 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 	video->imagesize = 320 * 240 * 2;
 
 	/* Initialize the video buffers queue. */
-	uvcg_queue_init(&video->queue, V4L2_BUF_TYPE_VIDEO_OUTPUT,
+	uvcg_queue_init(uvc->v4l2_dev.dev, &video->queue, V4L2_BUF_TYPE_VIDEO_OUTPUT,
 			&video->mutex);
 	return 0;
 }
-- 
2.29.2

