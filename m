Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 776F03B6648
	for <lists+linux-usb@lfdr.de>; Mon, 28 Jun 2021 17:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235901AbhF1P6J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Jun 2021 11:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235476AbhF1P57 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Jun 2021 11:57:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A9FBC061A2A
        for <linux-usb@vger.kernel.org>; Mon, 28 Jun 2021 08:53:14 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lxtZQ-0002x8-NM; Mon, 28 Jun 2021 17:53:12 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lxtZQ-0004QI-As; Mon, 28 Jun 2021 17:53:12 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, caleb.connolly@ideasonboard.com,
        paul.elder@ideasonboard.com, balbi@kernel.org,
        kernel@pengutronix.de
Subject: [PATCH v3 4/5] usb: gadget: uvc: add scatter gather support
Date:   Mon, 28 Jun 2021 17:53:10 +0200
Message-Id: <20210628155311.16762-5-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210628155311.16762-1-m.grzeschik@pengutronix.de>
References: <20210628155311.16762-1-m.grzeschik@pengutronix.de>
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

When streaming 1080p with request size of 1024 times 3 bytes top shows a
difference of about 6.4% CPU load applying this patch:

 PID USER      PR  NI    VIRT    RES  %CPU  %MEM     TIME+ S COMMAND

  64 root       0 -20    0.0m   0.0m   7.7   0.0   0:01.25 I [kworker/u5:0-uvcvideo]
  83 root       0 -20    0.0m   0.0m   4.5   0.0   0:03.71 I [kworker/u5:3-uvcvideo]
 307 root     -51   0    0.0m   0.0m   3.8   0.0   0:01.05 S [irq/51-dwc3]

vs.

  64 root       0 -20    0.0m   0.0m   5.8   0.0   0:01.79 I [kworker/u5:0-uvcvideo]
 306 root     -51   0    0.0m   0.0m   3.2   0.0   0:01.97 S [irq/51-dwc3]
  82 root       0 -20    0.0m   0.0m   0.6   0.0   0:01.86 I [kworker/u5:1-uvcvideo]

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2: - fixed missing VIDEOBUF2_DMA_SG select for legacy webcam found by kbuild-all
	  - ordered header files alphabetically
	  - used unsigned int in encode_isoc_sg where possible
	  - changed function parameter order in uvcg_queue_init
          - added and used UVCG_REQUEST_HEADER_LEN for the 2 header bytes
	  - added use_sg into uvc_video_queue instead of pocking through layers
	  - added sg_free_table to uvc_video_free_requests
	  - removed unneeded memset
v2 -> v3: - setting queue->dev directly to udc
          - removed setting of alloc_devs in uvc_queue_setup
	  - added measurement results to patch description
---
 drivers/usb/gadget/Kconfig              |  1 +
 drivers/usb/gadget/function/uvc.h       |  2 +
 drivers/usb/gadget/function/uvc_queue.c | 22 ++++++-
 drivers/usb/gadget/function/uvc_queue.h |  7 ++-
 drivers/usb/gadget/function/uvc_video.c | 82 +++++++++++++++++++++++--
 drivers/usb/gadget/function/uvc_video.h |  2 +
 drivers/usb/gadget/legacy/Kconfig       |  1 +
 7 files changed, 108 insertions(+), 9 deletions(-)

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
diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 52f894183ecf0..36b78f8b3cd4c 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -75,6 +75,8 @@ struct uvc_request {
 	struct usb_request *req;
 	u8 *req_buffer;
 	struct uvc_video *video;
+	struct sg_table sgt;
+	u8 header[2];
 };
 
 struct uvc_video {
diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
index ff0cc08531d2b..7d00ad7c154c2 100644
--- a/drivers/usb/gadget/function/uvc_queue.c
+++ b/drivers/usb/gadget/function/uvc_queue.c
@@ -17,6 +17,7 @@
 #include <linux/wait.h>
 
 #include <media/v4l2-common.h>
+#include <media/videobuf2-dma-sg.h>
 #include <media/videobuf2-vmalloc.h>
 
 #include "uvc.h"
@@ -76,7 +77,12 @@ static int uvc_buffer_prepare(struct vb2_buffer *vb)
 		return -ENODEV;
 
 	buf->state = UVC_BUF_STATE_QUEUED;
-	buf->mem = vb2_plane_vaddr(vb, 0);
+	if (queue->use_sg) {
+		buf->sgt = vb2_dma_sg_plane_desc(vb, 0);
+		buf->sg = buf->sgt->sgl;
+	} else {
+		buf->mem = vb2_plane_vaddr(vb, 0);
+	}
 	buf->length = vb2_plane_size(vb, 0);
 	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		buf->bytesused = 0;
@@ -116,9 +122,11 @@ static const struct vb2_ops uvc_queue_qops = {
 	.wait_finish = vb2_ops_wait_finish,
 };
 
-int uvcg_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type,
+int uvcg_queue_init(struct uvc_video_queue *queue, struct device *dev, enum v4l2_buf_type type,
 		    struct mutex *lock)
 {
+	struct uvc_video *video = container_of(queue, struct uvc_video, queue);
+	struct usb_composite_dev *cdev = video->uvc->func.config->cdev;
 	int ret;
 
 	queue->queue.type = type;
@@ -127,9 +135,17 @@ int uvcg_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type,
 	queue->queue.buf_struct_size = sizeof(struct uvc_buffer);
 	queue->queue.ops = &uvc_queue_qops;
 	queue->queue.lock = lock;
-	queue->queue.mem_ops = &vb2_vmalloc_memops;
+	if (cdev->gadget->sg_supported) {
+		queue->queue.mem_ops = &vb2_dma_sg_memops;
+		queue->use_sg = 1;
+	} else {
+		queue->queue.mem_ops = &vb2_vmalloc_memops;
+	}
+
 	queue->queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC
 				     | V4L2_BUF_FLAG_TSTAMP_SRC_EOF;
+	queue->queue.dev = dev;
+
 	ret = vb2_queue_init(&queue->queue);
 	if (ret)
 		return ret;
diff --git a/drivers/usb/gadget/function/uvc_queue.h b/drivers/usb/gadget/function/uvc_queue.h
index 2f0fff7698430..05360a0767f61 100644
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
@@ -50,6 +53,8 @@ struct uvc_video_queue {
 
 	unsigned int buf_used;
 
+	bool use_sg;
+
 	spinlock_t irqlock;	/* Protects flags and irqqueue */
 	struct list_head irqqueue;
 };
@@ -59,7 +64,7 @@ static inline int uvc_queue_streaming(struct uvc_video_queue *queue)
 	return vb2_is_streaming(&queue->queue);
 }
 
-int uvcg_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type,
+int uvcg_queue_init(struct uvc_video_queue *queue, struct device *dev, enum v4l2_buf_type type,
 		    struct mutex *lock);
 
 void uvcg_free_buffers(struct uvc_video_queue *queue);
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 303cb427f687e..2cefb8bd4f15b 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -27,10 +27,10 @@ static int
 uvc_video_encode_header(struct uvc_video *video, struct uvc_buffer *buf,
 		u8 *data, int len)
 {
-	data[0] = 2;
+	data[0] = UVCG_REQUEST_HEADER_LEN;
 	data[1] = UVC_STREAM_EOH | video->fid;
 
-	if (buf->bytesused - video->queue.buf_used <= len - 2)
+	if (buf->bytesused - video->queue.buf_used <= len - UVCG_REQUEST_HEADER_LEN)
 		data[1] |= UVC_STREAM_EOF;
 
 	return 2;
@@ -94,6 +94,71 @@ uvc_video_encode_bulk(struct usb_request *req, struct uvc_video *video,
 		video->payload_size = 0;
 }
 
+static void
+uvc_video_encode_isoc_sg(struct usb_request *req, struct uvc_video *video,
+		struct uvc_buffer *buf)
+{
+	unsigned int pending = buf->bytesused - video->queue.buf_used;
+	struct uvc_request *ureq = req->context;
+	struct scatterlist *sg, *iter;
+	unsigned int len = video->req_size;
+	unsigned int sg_left, part = 0;
+	unsigned int i;
+	int ret;
+
+	sg = ureq->sgt.sgl;
+	sg_init_table(sg, ureq->sgt.nents);
+
+	/* Init the header. */
+	ret = uvc_video_encode_header(video, buf, ureq->header,
+				      video->req_size);
+	sg_set_buf(sg, ureq->header, UVCG_REQUEST_HEADER_LEN);
+	len -= ret;
+
+	if (pending <= len)
+		len = pending;
+
+	req->length = (len == pending) ?
+		len + UVCG_REQUEST_HEADER_LEN : video->req_size;
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
+	video->queue.buf_used += req->length - UVCG_REQUEST_HEADER_LEN;
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
@@ -180,6 +245,8 @@ uvc_video_free_requests(struct uvc_video *video)
 
 	if (video->ureq) {
 		for (i = 0; i < video->uvc_num_requests; ++i) {
+			sg_free_table(&video->ureq[i].sgt);
+
 			if (video->ureq[i].req) {
 				usb_ep_free_request(video->ep, video->ureq[i].req);
 				video->ureq[i].req = NULL;
@@ -233,6 +300,10 @@ uvc_video_alloc_requests(struct uvc_video *video)
 		video->ureq[i].video = video;
 
 		list_add_tail(&video->ureq[i].req->list, &video->req_free);
+		/* req_size/PAGE_SIZE + 1 for overruns and + 1 for header */
+		sg_alloc_table(&video->ureq[i].sgt,
+			       DIV_ROUND_UP(req_size - 2, PAGE_SIZE) + 2,
+			       GFP_KERNEL);
 	}
 
 	video->req_size = req_size;
@@ -342,7 +413,8 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
 		video->encode = uvc_video_encode_bulk;
 		video->payload_size = 0;
 	} else
-		video->encode = uvc_video_encode_isoc;
+		video->encode = video->queue.use_sg ?
+			uvc_video_encode_isoc_sg : uvc_video_encode_isoc;
 
 	schedule_work(&video->pump);
 
@@ -366,8 +438,8 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 	video->imagesize = 320 * 240 * 2;
 
 	/* Initialize the video buffers queue. */
-	uvcg_queue_init(&video->queue, V4L2_BUF_TYPE_VIDEO_OUTPUT,
-			&video->mutex);
+	uvcg_queue_init(&video->queue, uvc->v4l2_dev.dev->parent,
+			V4L2_BUF_TYPE_VIDEO_OUTPUT, &video->mutex);
 	return 0;
 }
 
diff --git a/drivers/usb/gadget/function/uvc_video.h b/drivers/usb/gadget/function/uvc_video.h
index 03adeefa343b7..9bf19475f6f9a 100644
--- a/drivers/usb/gadget/function/uvc_video.h
+++ b/drivers/usb/gadget/function/uvc_video.h
@@ -12,6 +12,8 @@
 #ifndef __UVC_VIDEO_H__
 #define __UVC_VIDEO_H__
 
+#define UVCG_REQUEST_HEADER_LEN			2
+
 struct uvc_video;
 
 int uvcg_video_enable(struct uvc_video *video, int enable);
diff --git a/drivers/usb/gadget/legacy/Kconfig b/drivers/usb/gadget/legacy/Kconfig
index 11dd6e8adc8a7..de6668e584815 100644
--- a/drivers/usb/gadget/legacy/Kconfig
+++ b/drivers/usb/gadget/legacy/Kconfig
@@ -502,6 +502,7 @@ config USB_G_WEBCAM
 	tristate "USB Webcam Gadget"
 	depends on VIDEO_V4L2
 	select USB_LIBCOMPOSITE
+	select VIDEOBUF2_DMA_SG
 	select VIDEOBUF2_VMALLOC
 	select USB_F_UVC
 	help
-- 
2.30.2

