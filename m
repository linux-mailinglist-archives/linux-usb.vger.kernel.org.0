Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 738543A7413
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jun 2021 04:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhFOCiG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Jun 2021 22:38:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbhFOCiF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Jun 2021 22:38:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C14C061574
        for <linux-usb@vger.kernel.org>; Mon, 14 Jun 2021 19:36:02 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B71CC5D03;
        Tue, 15 Jun 2021 04:10:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623723047;
        bh=sjEsuQC1cvfP6CBKH8J3mpkS2TQB4sMat4waJfkjGQw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D5TTK94KS9HJBkgFkbRpqiGkIeTW7YpPYHFK01Cdquph5X4Qgsc3qloOvtzV4B7hH
         tS1EUNVlXfFxOoROGripAJx2Iy8UU3Gm4UARaMrCEuFcA4JunaVSQLY8NK438pKnee
         G/GXa+3cHPiWLkFCd0sLAj5sM3tWAKNyfZiIN2Bg=
Date:   Tue, 15 Jun 2021 05:10:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, caleb.connolly@ideasonboard.com,
        paul.elder@ideasonboard.com, balbi@kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 2/3] usb: gadget: uvc: add scatter gather support
Message-ID: <YMgME17qpq03pirR@pendragon.ideasonboard.com>
References: <20210530223041.15320-1-m.grzeschik@pengutronix.de>
 <20210530223041.15320-3-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210530223041.15320-3-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Mon, May 31, 2021 at 12:30:40AM +0200, Michael Grzeschik wrote:
> This patch adds support for scatter gather transfers. If the underlying
> gadgets sg_supported == true, then the videeobuf2-dma-sg is used and the
> encode routine maps all scatter entries to separate scatterlists for the
> usb gadget.

This is interesting. Could you please share measurements that show how
much CPU time is saved by this patch in typical use cases ?

> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
> v1 -> v2: -
> 
>  drivers/usb/gadget/Kconfig              |  1 +
>  drivers/usb/gadget/function/f_uvc.c     |  1 +
>  drivers/usb/gadget/function/uvc.h       |  2 +
>  drivers/usb/gadget/function/uvc_queue.c | 23 ++++++-
>  drivers/usb/gadget/function/uvc_queue.h |  5 +-
>  drivers/usb/gadget/function/uvc_video.c | 80 ++++++++++++++++++++++++-
>  6 files changed, 105 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
> index 2d152571a7de8..dd58094f0b85b 100644
> --- a/drivers/usb/gadget/Kconfig
> +++ b/drivers/usb/gadget/Kconfig
> @@ -450,6 +450,7 @@ config USB_CONFIGFS_F_UVC
>  	depends on USB_CONFIGFS
>  	depends on VIDEO_V4L2
>  	depends on VIDEO_DEV
> +	select VIDEOBUF2_DMA_SG
>  	select VIDEOBUF2_VMALLOC
>  	select USB_F_UVC
>  	help
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> index f48a00e497945..9d87c0fb8f92e 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -418,6 +418,7 @@ uvc_register_video(struct uvc_device *uvc)
>  
>  	/* TODO reference counting. */
>  	uvc->vdev.v4l2_dev = &uvc->v4l2_dev;
> +	uvc->vdev.v4l2_dev->dev = &cdev->gadget->dev;

A good change, which could possibly be split to its own patch.

>  	uvc->vdev.fops = &uvc_v4l2_fops;
>  	uvc->vdev.ioctl_ops = &uvc_v4l2_ioctl_ops;
>  	uvc->vdev.release = video_device_release_empty;
> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> index 83b9e945944e8..c1f06d9df5820 100644
> --- a/drivers/usb/gadget/function/uvc.h
> +++ b/drivers/usb/gadget/function/uvc.h
> @@ -75,6 +75,8 @@ struct uvc_request {
>  	struct usb_request *req;
>  	__u8 *req_buffer;
>  	struct uvc_video *video;
> +	struct sg_table sgt;
> +	u8 header[2];
>  };
>  
>  struct uvc_video {
> diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
> index dcd71304d521c..e36a3506842b7 100644
> --- a/drivers/usb/gadget/function/uvc_queue.c
> +++ b/drivers/usb/gadget/function/uvc_queue.c
> @@ -18,6 +18,7 @@
>  
>  #include <media/v4l2-common.h>
>  #include <media/videobuf2-vmalloc.h>
> +#include <media/videobuf2-dma-sg.h>

Alphabetical order please.

>  
>  #include "uvc.h"
>  
> @@ -52,6 +53,7 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>  	*nplanes = 1;
>  
>  	sizes[0] = video->imagesize;
> +	alloc_devs[0] = video->uvc->v4l2_dev.dev->parent;

Is there a guarantee that the gadget's parent is always the UDC ?

>  
>  	if (cdev->gadget->speed < USB_SPEED_SUPER)
>  		video->uvc_num_requests = 4;
> @@ -66,6 +68,9 @@ static int uvc_buffer_prepare(struct vb2_buffer *vb)
>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vb->vb2_queue);
>  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>  	struct uvc_buffer *buf = container_of(vbuf, struct uvc_buffer, buf);
> +	struct uvc_video *video = container_of(queue, struct uvc_video, queue);
> +	struct uvc_device *uvc = video->uvc;
> +	struct usb_composite_dev *cdev = uvc->func.config->cdev;
>  
>  	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT &&
>  	    vb2_get_plane_payload(vb, 0) > vb2_plane_size(vb, 0)) {
> @@ -77,7 +82,12 @@ static int uvc_buffer_prepare(struct vb2_buffer *vb)
>  		return -ENODEV;
>  
>  	buf->state = UVC_BUF_STATE_QUEUED;
> -	buf->mem = vb2_plane_vaddr(vb, 0);
> +	if (cdev->gadget->sg_supported) {

How about storing a use_sg flag in uvc_video_queue, to avoid poking
through layers ? The flag can also be used in uvcg_queue_init().

> +		buf->sgt = vb2_dma_sg_plane_desc(vb, 0);
> +		buf->sg = buf->sgt->sgl;
> +	} else {
> +		buf->mem = vb2_plane_vaddr(vb, 0);
> +	}
>  	buf->length = vb2_plane_size(vb, 0);
>  	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
>  		buf->bytesused = 0;
> @@ -117,9 +127,11 @@ static const struct vb2_ops uvc_queue_qops = {
>  	.wait_finish = vb2_ops_wait_finish,
>  };
>  
> -int uvcg_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type,
> +int uvcg_queue_init(struct device *dev, struct uvc_video_queue *queue, enum v4l2_buf_type type,

Please move the dev parameter after queue, to pass as the first
parameter the object that the function operates on.

>  		    struct mutex *lock)
>  {
> +	struct uvc_video *video = container_of(queue, struct uvc_video, queue);
> +	struct usb_composite_dev *cdev = video->uvc->func.config->cdev;
>  	int ret;
>  
>  	queue->queue.type = type;
> @@ -128,9 +140,14 @@ int uvcg_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type,
>  	queue->queue.buf_struct_size = sizeof(struct uvc_buffer);
>  	queue->queue.ops = &uvc_queue_qops;
>  	queue->queue.lock = lock;
> -	queue->queue.mem_ops = &vb2_vmalloc_memops;
> +	if (cdev->gadget->sg_supported)
> +		queue->queue.mem_ops = &vb2_dma_sg_memops;
> +	else
> +		queue->queue.mem_ops = &vb2_vmalloc_memops;
> +
>  	queue->queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC
>  				     | V4L2_BUF_FLAG_TSTAMP_SRC_EOF;
> +	queue->queue.dev = dev;
>  	ret = vb2_queue_init(&queue->queue);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/usb/gadget/function/uvc_queue.h b/drivers/usb/gadget/function/uvc_queue.h
> index 2f0fff7698430..bb8753b26074f 100644
> --- a/drivers/usb/gadget/function/uvc_queue.h
> +++ b/drivers/usb/gadget/function/uvc_queue.h
> @@ -34,6 +34,9 @@ struct uvc_buffer {
>  
>  	enum uvc_buffer_state state;
>  	void *mem;
> +	struct sg_table *sgt;
> +	struct scatterlist *sg;
> +	unsigned int offset;
>  	unsigned int length;
>  	unsigned int bytesused;
>  };
> @@ -59,7 +62,7 @@ static inline int uvc_queue_streaming(struct uvc_video_queue *queue)
>  	return vb2_is_streaming(&queue->queue);
>  }
>  
> -int uvcg_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type,
> +int uvcg_queue_init(struct device *d, struct uvc_video_queue *queue, enum v4l2_buf_type type,
>  		    struct mutex *lock);
>  
>  void uvcg_free_buffers(struct uvc_video_queue *queue);
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index 57840083dfdda..240d361a45a44 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -95,6 +95,71 @@ uvc_video_encode_bulk(struct usb_request *req, struct uvc_video *video,
>  		video->payload_size = 0;
>  }
>  
> +static void
> +uvc_video_encode_isoc_sg(struct usb_request *req, struct uvc_video *video,
> +		struct uvc_buffer *buf)
> +{
> +	int pending = buf->bytesused - video->queue.buf_used;
> +	struct uvc_request *ureq = req->context;
> +	struct scatterlist *sg, *iter;
> +	int len = video->req_size;
> +	int sg_left, part = 0;
> +	int ret;
> +	int i;

unsigned int for pending, len, sg_left, part and i.

> +
> +	sg = ureq->sgt.sgl;
> +	sg_init_table(sg, ureq->sgt.nents);
> +
> +	/* Init the header. */
> +	memset(ureq->header, 0, 2);

Can you add

#define UVCG_REQUEST_HEADER_LEN		2

somewhere, and use it here, in the uvc_request structure definition, and
in uvc_video_encode_header() ? Otherwise I fear we'll forget to update
one of the locations when we'll add support for longer headers.

Is the memset() needed though ?

> +	ret = uvc_video_encode_header(video, buf, ureq->header,
> +				      video->req_size);
> +	sg_set_buf(sg, ureq->header, 2);
> +	len -= ret;
> +
> +	if (pending <= len)
> +		len = pending;
> +
> +	req->length = (len == pending) ? len + 2 : video->req_size;
> +
> +	/* Init the pending sgs with payload */
> +	sg = sg_next(sg);
> +
> +	for_each_sg(sg, iter, ureq->sgt.nents - 1, i) {
> +		if (!len || !buf->sg)
> +			break;
> +
> +		sg_left = sg_dma_len(buf->sg) - buf->offset;
> +		part = min_t(unsigned int, len, sg_left);
> +
> +		sg_set_page(iter, sg_page(buf->sg), part, buf->offset);
> +
> +		if (part == sg_left) {
> +			buf->offset = 0;
> +			buf->sg = sg_next(buf->sg);
> +		} else {
> +			buf->offset += part;
> +		}
> +		len -= part;
> +	}
> +
> +	/* Assign the video data with header. */
> +	req->buf = NULL;
> +	req->sg	= ureq->sgt.sgl;
> +	req->num_sgs = i + 1;

Given that you construct the request scatterlist manually anyway,
wouldn't it be much simpler to use the vb2 dma contig allocator for the
V4L2 buffer ? Or do you expect that the device would run out of dma
contig space (which I expect to be provided by CMA or an IOMMU) ? It
would also likely help to fill every sg entry as much as possible, while
the above code potentially creates smaller entries in the request sgt
when reaching the boundary between two entries in the V4L2 buffer sgt.

I also wonder if this couldn't be further optimized by creating an sgt
with two entries, one for the header and one for the data,
unconditionally. What's the maximum possible request size, could it be
larger than what an sgt entry can support ?

> +
> +	req->length -= len;
> +	video->queue.buf_used += req->length - 2;
> +
> +	if (buf->bytesused == video->queue.buf_used || !buf->sg) {
> +		video->queue.buf_used = 0;
> +		buf->state = UVC_BUF_STATE_DONE;
> +		buf->offset = 0;
> +		uvcg_queue_next_buffer(&video->queue, buf);
> +		video->fid ^= UVC_STREAM_FID;
> +	}
> +}
> +
>  static void
>  uvc_video_encode_isoc(struct usb_request *req, struct uvc_video *video,
>  		struct uvc_buffer *buf)
> @@ -232,6 +297,10 @@ uvc_video_alloc_requests(struct uvc_video *video)
>  		video->ureq[i].video = video;
>  
>  		list_add_tail(&video->ureq[i].req->list, &video->req_free);
> +		/* req_size/PAGE_SIZE + 1 for overruns and + 1 for header */
> +		sg_alloc_table(&video->ureq[i].sgt,
> +			       DIV_ROUND_UP(req_size - 2, PAGE_SIZE) + 2,
> +			       GFP_KERNEL);

It looks like this is leaked.

>  	}
>  
>  	video->req_size = req_size;
> @@ -309,6 +378,7 @@ static void uvcg_video_pump(struct work_struct *work)
>   */
>  int uvcg_video_enable(struct uvc_video *video, int enable)
>  {
> +	struct usb_composite_dev *cdev = video->uvc->func.config->cdev;
>  	unsigned int i;
>  	int ret;
>  
> @@ -340,8 +410,12 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
>  	if (video->max_payload_size) {
>  		video->encode = uvc_video_encode_bulk;
>  		video->payload_size = 0;
> -	} else
> -		video->encode = uvc_video_encode_isoc;
> +	} else {
> +		if (cdev->gadget->sg_supported)
> +			video->encode = uvc_video_encode_isoc_sg;
> +		else
> +			video->encode = uvc_video_encode_isoc;
> +	}
>  
>  	schedule_work(&video->pump);
>  
> @@ -365,7 +439,7 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
>  	video->imagesize = 320 * 240 * 2;
>  
>  	/* Initialize the video buffers queue. */
> -	uvcg_queue_init(&video->queue, V4L2_BUF_TYPE_VIDEO_OUTPUT,
> +	uvcg_queue_init(uvc->v4l2_dev.dev, &video->queue, V4L2_BUF_TYPE_VIDEO_OUTPUT,
>  			&video->mutex);
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
