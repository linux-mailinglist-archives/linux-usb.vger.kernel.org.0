Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF6A3B4015
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jun 2021 11:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhFYJOy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Jun 2021 05:14:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbhFYJOx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Jun 2021 05:14:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D78C061574
        for <linux-usb@vger.kernel.org>; Fri, 25 Jun 2021 02:12:32 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lwhsx-0003eT-Nx; Fri, 25 Jun 2021 11:12:27 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lwhsx-0000hk-4V; Fri, 25 Jun 2021 11:12:27 +0200
Date:   Fri, 25 Jun 2021 11:12:27 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, caleb.connolly@ideasonboard.com,
        paul.elder@ideasonboard.com, balbi@kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 2/3] usb: gadget: uvc: add scatter gather support
Message-ID: <20210625091227.GA7708@pengutronix.de>
References: <20210530223041.15320-1-m.grzeschik@pengutronix.de>
 <20210530223041.15320-3-m.grzeschik@pengutronix.de>
 <YMgME17qpq03pirR@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline
In-Reply-To: <YMgME17qpq03pirR@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 17:03:16 up 124 days, 18:27, 127 users,  load average: 0.48, 0.43,
 0.23
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 15, 2021 at 05:10:27AM +0300, Laurent Pinchart wrote:
>Hi Michael,
>
>Thank you for the patch.
>
>On Mon, May 31, 2021 at 12:30:40AM +0200, Michael Grzeschik wrote:
>> This patch adds support for scatter gather transfers. If the underlying
>> gadgets sg_supported =3D=3D true, then the videeobuf2-dma-sg is used and=
 the
>> encode routine maps all scatter entries to separate scatterlists for the
>> usb gadget.
>
>This is interesting. Could you please share measurements that show how
>much CPU time is saved by this patch in typical use cases ?

When streaming 1080p with request size of 1024 times 3 bytes I see this
change in top when applying this patch:

  PID USER      PR  NI    VIRT    RES  %CPU  %MEM     TIME+ S COMMAND

   64 root       0 -20    0.0m   0.0m   7.7   0.0   0:01.25 I [kworker/u5:0=
-uvcvideo]
   83 root       0 -20    0.0m   0.0m   4.5   0.0   0:03.71 I [kworker/u5:3=
-uvcvideo]
  307 root     -51   0    0.0m   0.0m   3.8   0.0   0:01.05 S [irq/51-dwc3]

vs.

   64 root       0 -20    0.0m   0.0m   5.8   0.0   0:01.79 I [kworker/u5:0=
-uvcvideo]
  306 root     -51   0    0.0m   0.0m   3.2   0.0   0:01.97 S [irq/51-dwc3]
   82 root       0 -20    0.0m   0.0m   0.6   0.0   0:01.86 I [kworker/u5:1=
-uvcvideo]

So 6.4 % less CPU load tells the measurement.

>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> ---
>> v1 -> v2: -
>>
>>  drivers/usb/gadget/Kconfig              |  1 +
>>  drivers/usb/gadget/function/f_uvc.c     |  1 +
>>  drivers/usb/gadget/function/uvc.h       |  2 +
>>  drivers/usb/gadget/function/uvc_queue.c | 23 ++++++-
>>  drivers/usb/gadget/function/uvc_queue.h |  5 +-
>>  drivers/usb/gadget/function/uvc_video.c | 80 ++++++++++++++++++++++++-
>>  6 files changed, 105 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
>> index 2d152571a7de8..dd58094f0b85b 100644
>> --- a/drivers/usb/gadget/Kconfig
>> +++ b/drivers/usb/gadget/Kconfig
>> @@ -450,6 +450,7 @@ config USB_CONFIGFS_F_UVC
>>  	depends on USB_CONFIGFS
>>  	depends on VIDEO_V4L2
>>  	depends on VIDEO_DEV
>> +	select VIDEOBUF2_DMA_SG
>>  	select VIDEOBUF2_VMALLOC
>>  	select USB_F_UVC
>>  	help
>> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/fu=
nction/f_uvc.c
>> index f48a00e497945..9d87c0fb8f92e 100644
>> --- a/drivers/usb/gadget/function/f_uvc.c
>> +++ b/drivers/usb/gadget/function/f_uvc.c
>> @@ -418,6 +418,7 @@ uvc_register_video(struct uvc_device *uvc)
>>
>>  	/* TODO reference counting. */
>>  	uvc->vdev.v4l2_dev =3D &uvc->v4l2_dev;
>> +	uvc->vdev.v4l2_dev->dev =3D &cdev->gadget->dev;
>
>A good change, which could possibly be split to its own patch.

Right. I will move it to a single patch.

>>  	uvc->vdev.fops =3D &uvc_v4l2_fops;
>>  	uvc->vdev.ioctl_ops =3D &uvc_v4l2_ioctl_ops;
>>  	uvc->vdev.release =3D video_device_release_empty;
>> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/func=
tion/uvc.h
>> index 83b9e945944e8..c1f06d9df5820 100644
>> --- a/drivers/usb/gadget/function/uvc.h
>> +++ b/drivers/usb/gadget/function/uvc.h
>> @@ -75,6 +75,8 @@ struct uvc_request {
>>  	struct usb_request *req;
>>  	__u8 *req_buffer;
>>  	struct uvc_video *video;
>> +	struct sg_table sgt;
>> +	u8 header[2];
>>  };
>>
>>  struct uvc_video {
>> diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadge=
t/function/uvc_queue.c
>> index dcd71304d521c..e36a3506842b7 100644
>> --- a/drivers/usb/gadget/function/uvc_queue.c
>> +++ b/drivers/usb/gadget/function/uvc_queue.c
>> @@ -18,6 +18,7 @@
>>
>>  #include <media/v4l2-common.h>
>>  #include <media/videobuf2-vmalloc.h>
>> +#include <media/videobuf2-dma-sg.h>
>
>Alphabetical order please.

ok.

>>
>>  #include "uvc.h"
>>
>> @@ -52,6 +53,7 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>>  	*nplanes =3D 1;
>>
>>  	sizes[0] =3D video->imagesize;
>> +	alloc_devs[0] =3D video->uvc->v4l2_dev.dev->parent;
>
>Is there a guarantee that the gadget's parent is always the UDC ?

No, we can not be sure. Especially the dwc3 core has the dts parameter
"linux,sysdev_is_parent" where the parent can point to another dev.

I will add a function called gadget_to_udc that will always provide the udc
device. But while being at it I can also remove this alloc_devs assignment
since the queue.dev can be set to the udc dev instead, since we don't need =
any
per plane allocation.

>>
>>  	if (cdev->gadget->speed < USB_SPEED_SUPER)
>>  		video->uvc_num_requests =3D 4;
>> @@ -66,6 +68,9 @@ static int uvc_buffer_prepare(struct vb2_buffer *vb)
>>  	struct uvc_video_queue *queue =3D vb2_get_drv_priv(vb->vb2_queue);
>>  	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
>>  	struct uvc_buffer *buf =3D container_of(vbuf, struct uvc_buffer, buf);
>> +	struct uvc_video *video =3D container_of(queue, struct uvc_video, queu=
e);
>> +	struct uvc_device *uvc =3D video->uvc;
>> +	struct usb_composite_dev *cdev =3D uvc->func.config->cdev;
>>
>>  	if (vb->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT &&
>>  	    vb2_get_plane_payload(vb, 0) > vb2_plane_size(vb, 0)) {
>> @@ -77,7 +82,12 @@ static int uvc_buffer_prepare(struct vb2_buffer *vb)
>>  		return -ENODEV;
>>
>>  	buf->state =3D UVC_BUF_STATE_QUEUED;
>> -	buf->mem =3D vb2_plane_vaddr(vb, 0);
>> +	if (cdev->gadget->sg_supported) {
>
>How about storing a use_sg flag in uvc_video_queue, to avoid poking
>through layers ? The flag can also be used in uvcg_queue_init().

Yes. This makes sense. I added a bool use_sg to uvc_video_queue and
use it instead in v3.

>> +		buf->sgt =3D vb2_dma_sg_plane_desc(vb, 0);
>> +		buf->sg =3D buf->sgt->sgl;
>> +	} else {
>> +		buf->mem =3D vb2_plane_vaddr(vb, 0);
>> +	}
>>  	buf->length =3D vb2_plane_size(vb, 0);
>>  	if (vb->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)
>>  		buf->bytesused =3D 0;
>> @@ -117,9 +127,11 @@ static const struct vb2_ops uvc_queue_qops =3D {
>>  	.wait_finish =3D vb2_ops_wait_finish,
>>  };
>>
>> -int uvcg_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type t=
ype,
>> +int uvcg_queue_init(struct device *dev, struct uvc_video_queue *queue, =
enum v4l2_buf_type type,
>
>Please move the dev parameter after queue, to pass as the first
>parameter the object that the function operates on.

ok. will change in v3.

>>  		    struct mutex *lock)
>>  {
>> +	struct uvc_video *video =3D container_of(queue, struct uvc_video, queu=
e);
>> +	struct usb_composite_dev *cdev =3D video->uvc->func.config->cdev;
>>  	int ret;
>>
>>  	queue->queue.type =3D type;
>> @@ -128,9 +140,14 @@ int uvcg_queue_init(struct uvc_video_queue *queue, =
enum v4l2_buf_type type,
>>  	queue->queue.buf_struct_size =3D sizeof(struct uvc_buffer);
>>  	queue->queue.ops =3D &uvc_queue_qops;
>>  	queue->queue.lock =3D lock;
>> -	queue->queue.mem_ops =3D &vb2_vmalloc_memops;
>> +	if (cdev->gadget->sg_supported)
>> +		queue->queue.mem_ops =3D &vb2_dma_sg_memops;
>> +	else
>> +		queue->queue.mem_ops =3D &vb2_vmalloc_memops;
>> +
>>  	queue->queue.timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC
>>  				     | V4L2_BUF_FLAG_TSTAMP_SRC_EOF;
>> +	queue->queue.dev =3D dev;
>>  	ret =3D vb2_queue_init(&queue->queue);
>>  	if (ret)
>>  		return ret;
>> diff --git a/drivers/usb/gadget/function/uvc_queue.h b/drivers/usb/gadge=
t/function/uvc_queue.h
>> index 2f0fff7698430..bb8753b26074f 100644
>> --- a/drivers/usb/gadget/function/uvc_queue.h
>> +++ b/drivers/usb/gadget/function/uvc_queue.h
>> @@ -34,6 +34,9 @@ struct uvc_buffer {
>>
>>  	enum uvc_buffer_state state;
>>  	void *mem;
>> +	struct sg_table *sgt;
>> +	struct scatterlist *sg;
>> +	unsigned int offset;
>>  	unsigned int length;
>>  	unsigned int bytesused;
>>  };
>> @@ -59,7 +62,7 @@ static inline int uvc_queue_streaming(struct uvc_video=
_queue *queue)
>>  	return vb2_is_streaming(&queue->queue);
>>  }
>>
>> -int uvcg_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type t=
ype,
>> +int uvcg_queue_init(struct device *d, struct uvc_video_queue *queue, en=
um v4l2_buf_type type,
>>  		    struct mutex *lock);
>>
>>  void uvcg_free_buffers(struct uvc_video_queue *queue);
>> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadge=
t/function/uvc_video.c
>> index 57840083dfdda..240d361a45a44 100644
>> --- a/drivers/usb/gadget/function/uvc_video.c
>> +++ b/drivers/usb/gadget/function/uvc_video.c
>> @@ -95,6 +95,71 @@ uvc_video_encode_bulk(struct usb_request *req, struct=
 uvc_video *video,
>>  		video->payload_size =3D 0;
>>  }
>>
>> +static void
>> +uvc_video_encode_isoc_sg(struct usb_request *req, struct uvc_video *vid=
eo,
>> +		struct uvc_buffer *buf)
>> +{
>> +	int pending =3D buf->bytesused - video->queue.buf_used;
>> +	struct uvc_request *ureq =3D req->context;
>> +	struct scatterlist *sg, *iter;
>> +	int len =3D video->req_size;
>> +	int sg_left, part =3D 0;
>> +	int ret;
>> +	int i;
>
>unsigned int for pending, len, sg_left, part and i.

Right.

>> +
>> +	sg =3D ureq->sgt.sgl;
>> +	sg_init_table(sg, ureq->sgt.nents);
>> +
>> +	/* Init the header. */
>> +	memset(ureq->header, 0, 2);
>
>Can you add
>
>#define UVCG_REQUEST_HEADER_LEN		2
>
>somewhere, and use it here, in the uvc_request structure definition, and
>in uvc_video_encode_header() ? Otherwise I fear we'll forget to update
>one of the locations when we'll add support for longer headers.

Makes sense. I will change the code to use the define instead.

>Is the memset() needed though ?
>

Yes, it is not needed. I will remove it.

>> +	ret =3D uvc_video_encode_header(video, buf, ureq->header,
>> +				      video->req_size);
>> +	sg_set_buf(sg, ureq->header, 2);
>> +	len -=3D ret;
>> +
>> +	if (pending <=3D len)
>> +		len =3D pending;
>> +
>> +	req->length =3D (len =3D=3D pending) ? len + 2 : video->req_size;
>> +
>> +	/* Init the pending sgs with payload */
>> +	sg =3D sg_next(sg);
>> +
>> +	for_each_sg(sg, iter, ureq->sgt.nents - 1, i) {
>> +		if (!len || !buf->sg)
>> +			break;
>> +
>> +		sg_left =3D sg_dma_len(buf->sg) - buf->offset;
>> +		part =3D min_t(unsigned int, len, sg_left);
>> +
>> +		sg_set_page(iter, sg_page(buf->sg), part, buf->offset);
>> +
>> +		if (part =3D=3D sg_left) {
>> +			buf->offset =3D 0;
>> +			buf->sg =3D sg_next(buf->sg);
>> +		} else {
>> +			buf->offset +=3D part;
>> +		}
>> +		len -=3D part;
>> +	}
>> +
>> +	/* Assign the video data with header. */
>> +	req->buf =3D NULL;
>> +	req->sg	=3D ureq->sgt.sgl;
>> +	req->num_sgs =3D i + 1;
>
>Given that you construct the request scatterlist manually anyway,
>wouldn't it be much simpler to use the vb2 dma contig allocator for the
>V4L2 buffer ? Or do you expect that the device would run out of dma
>contig space (which I expect to be provided by CMA or an IOMMU) ?

Yes, it would be simpler. But with dma contig you are limited to get contig
memory. When we always use sg_lists it is even possible to get the data
directly from the gpu.

>It would also likely help to fill every sg entry as much as possible,
>while the above code potentially creates smaller entries in the request
>sgt when reaching the boundary between two entries in the V4L2 buffer
>sgt.

In case we get the sg_table from an contig allocator it would be a table wi=
th
one big entry. So this is also a possible use case with the current
implementation. It will never run into any boundary in that case and will r=
un
in maximum filled chunks.

>I also wonder if this couldn't be further optimized by creating an sgt
>with two entries, one for the header and one for the data,
>unconditionally.

That is exactly what it already does.

>What's the maximum possible request size, could it be larger than what
>an sgt entry can support ?

The request size is usb maxpacket size for isoc (1024) times mult (<=3D3)
times burst (<=3D15). I think an sgt entry has no size limitation.

>> +
>> +	req->length -=3D len;
>> +	video->queue.buf_used +=3D req->length - 2;
>> +
>> +	if (buf->bytesused =3D=3D video->queue.buf_used || !buf->sg) {
>> +		video->queue.buf_used =3D 0;
>> +		buf->state =3D UVC_BUF_STATE_DONE;
>> +		buf->offset =3D 0;
>> +		uvcg_queue_next_buffer(&video->queue, buf);
>> +		video->fid ^=3D UVC_STREAM_FID;
>> +	}
>> +}
>> +
>>  static void
>>  uvc_video_encode_isoc(struct usb_request *req, struct uvc_video *video,
>>  		struct uvc_buffer *buf)
>> @@ -232,6 +297,10 @@ uvc_video_alloc_requests(struct uvc_video *video)
>>  		video->ureq[i].video =3D video;
>>
>>  		list_add_tail(&video->ureq[i].req->list, &video->req_free);
>> +		/* req_size/PAGE_SIZE + 1 for overruns and + 1 for header */
>> +		sg_alloc_table(&video->ureq[i].sgt,
>> +			       DIV_ROUND_UP(req_size - 2, PAGE_SIZE) + 2,
>> +			       GFP_KERNEL);
>
>It looks like this is leaked.

Oh, you are right. I will add an corresponding sg_free_table in uvc_video_f=
ree_requests.

>>  	}
>>
>>  	video->req_size =3D req_size;
>> @@ -309,6 +378,7 @@ static void uvcg_video_pump(struct work_struct *work)
>>   */
>>  int uvcg_video_enable(struct uvc_video *video, int enable)
>>  {
>> +	struct usb_composite_dev *cdev =3D video->uvc->func.config->cdev;
>>  	unsigned int i;
>>  	int ret;
>>
>> @@ -340,8 +410,12 @@ int uvcg_video_enable(struct uvc_video *video, int =
enable)
>>  	if (video->max_payload_size) {
>>  		video->encode =3D uvc_video_encode_bulk;
>>  		video->payload_size =3D 0;
>> -	} else
>> -		video->encode =3D uvc_video_encode_isoc;
>> +	} else {
>> +		if (cdev->gadget->sg_supported)
>> +			video->encode =3D uvc_video_encode_isoc_sg;
>> +		else
>> +			video->encode =3D uvc_video_encode_isoc;
>> +	}
>>
>>  	schedule_work(&video->pump);
>>
>> @@ -365,7 +439,7 @@ int uvcg_video_init(struct uvc_video *video, struct =
uvc_device *uvc)
>>  	video->imagesize =3D 320 * 240 * 2;
>>
>>  	/* Initialize the video buffers queue. */
>> -	uvcg_queue_init(&video->queue, V4L2_BUF_TYPE_VIDEO_OUTPUT,
>> +	uvcg_queue_init(uvc->v4l2_dev.dev, &video->queue, V4L2_BUF_TYPE_VIDEO_=
OUTPUT,
>>  			&video->mutex);

This argument will be uvc->v4l2_dev.dev->parent or the result of gadget_to_=
udc(uvc->v4l2_dev.dev) instead.

>>  	return 0;
>>  }

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmDVnfUACgkQC+njFXoe
LGQrJg//cENrM9WbRP30GnzIC2oLtBFgSoOWnJToNDQDvGBOD5P4Ob01rCOshbV5
bMmYibM6z3xs2MZ+vlnP/jgbakzuGidYhCyBXOY6Zk9YpLFp7IsYrwoW9TNDYmhO
iK/TvZW8fw+T82Jnbs8qWvjX2KBk3hvOoYCoOjb59BxtgJsZC1KMeJpgf1PMufeH
ATg9/3tDEVSPuNu+r080yFom6w4c2UQulY4fTMU9yUgH+8+o2oci+FY+OEe21UOr
NqT1sEHkJ3rublF5G/YLtP32kxsNK2LlPyCnq3xUgt+MztKXiFwjeAovbhdnBEKI
4cGpuH+tloddbfBnTEcXbgpIULWbk5so5YiLHF//DmcdvG7ui5/LF5HUWpqayHLU
Zs94kCdPUkjOgT1A0o4OORE3jyjwzWPUHw25l842OEUIoagSUJhTWM8Luw/t2oFB
YvjL+fqAqi62rVuwNMt7h24fpXaSqDAqO/dCDmOPTlxR90mxaZc76q+1isRsmTkt
ksF6LScG8VGFnp4sH+Fip2bViSHIBuNgLEx7HkIx8Puwc1y2HlEaVD+9YkXqKfBu
sw3Uc9LeCoRZcNiw6AxzEyKr/zK7ymolWu86aevOaUUQTljH9GcUP+p3Mj10SUPS
OVGxzJwKp1507IhwcmaMpESdwzoXmFZmtgwpI7LwR2tBt/Ci34I=
=vpQa
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
