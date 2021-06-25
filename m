Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 942003B40AE
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jun 2021 11:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbhFYJke (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Jun 2021 05:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbhFYJkd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Jun 2021 05:40:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F5E8C061574
        for <linux-usb@vger.kernel.org>; Fri, 25 Jun 2021 02:38:13 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lwiHr-0006xk-Nf; Fri, 25 Jun 2021 11:38:11 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lwiHr-0001ex-Dd; Fri, 25 Jun 2021 11:38:11 +0200
Date:   Fri, 25 Jun 2021 11:38:11 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     paul.elder@ideasonboard.com, linux-usb@vger.kernel.org,
        caleb.connolly@ideasonboard.com, balbi@kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/3] usb: gadget: uvc: add VIDIOC function
Message-ID: <20210625093811.GB7708@pengutronix.de>
References: <20210530222239.8793-1-m.grzeschik@pengutronix.de>
 <20210530222239.8793-3-m.grzeschik@pengutronix.de>
 <20210611064015.GA940767@pyrite.rasen.tech>
 <YMf/sPkyQGuLd+N/@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="A6N2fC+uXW/VQSAv"
Content-Disposition: inline
In-Reply-To: <YMf/sPkyQGuLd+N/@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:13:01 up 127 days, 12:36, 122 users,  load average: 0.05, 0.18,
 0.17
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent!

On Tue, Jun 15, 2021 at 04:17:36AM +0300, Laurent Pinchart wrote:
>Hi Michael,
>
>Thank you for the patch.
>
>On Fri, Jun 11, 2021 at 03:40:35PM +0900, paul.elder@ideasonboard.com wrot=
e:
>> On Mon, May 31, 2021 at 12:22:38AM +0200, Michael Grzeschik wrote:
>> > This patch adds support to the v4l2 VIDIOC for enum_format,
>> > enum_framesizes, enum_frameintervals and try_fmt. The configfs userspa=
ce
>> > setup gets parsed and this configfs data is used in the v4l2 interface
>> > functions.
>
>Could you please expand the commit message with an explanation of why
>this is a good idea ?

The Idea behind this, is to use the v4l2 api to get the configurable
formats. So the userspace has not to bring its own configfs parser
like in the uvc-gadget tool.

Why not use the interface that is already there?

I will add those details to the commit message.

>> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> > ---
>> >  drivers/usb/gadget/function/f_uvc.c        |  54 ++++
>> >  drivers/usb/gadget/function/uvc.h          |  18 +-
>> >  drivers/usb/gadget/function/uvc_configfs.c |   5 +
>> >  drivers/usb/gadget/function/uvc_configfs.h |   2 +
>> >  drivers/usb/gadget/function/uvc_queue.c    |   4 +-
>> >  drivers/usb/gadget/function/uvc_v4l2.c     | 325 ++++++++++++++++++---
>> >  drivers/usb/gadget/function/uvc_v4l2.h     |   1 +
>> >  drivers/usb/gadget/function/uvc_video.c    |  10 +-
>> >  8 files changed, 369 insertions(+), 50 deletions(-)
>> >
>> > diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/=
function/f_uvc.c
>> > index f48a00e497945..7945ea93a775a 100644
>> > --- a/drivers/usb/gadget/function/f_uvc.c
>> > +++ b/drivers/usb/gadget/function/f_uvc.c
>> > @@ -410,6 +410,44 @@ static ssize_t function_name_show(struct device *=
dev,
>> >
>> >  static DEVICE_ATTR_RO(function_name);
>> >
>> > +static int
>> > +uvc_analyze_configfs(struct uvc_device *uvc)
>> > +{
>> > +	struct uvcg_streaming_header *src_hdr =3D uvc->h;
>
>Why 'src' ? There's no source here. You can name the variable header.

I will rename it to header.

>
>> > +	struct config_item *item;
>> > +	struct config_group *grp;
>
>And I'd group in full.

Right.

>
>> > +	struct uvcg_format_ptr *f;
>
>I'd make all those pointers const if possible.

const sounds good. I will fix it.

>
>> > +	int i =3D 0, j =3D 0;
>
>i and j are never negative, you can make them unsigned int.

OK.

>
>> > +
>> > +	if (!src_hdr->linked)
>> > +		return -EBUSY;
>> > +
>> > +	list_for_each_entry(f, &src_hdr->formats, entry)
>> > +		uvc->nframes +=3D f->fmt->num_frames;
>
>Can this overflow uvc->nframes if userspace creates a malicious config
>with a large number of formats and frames ? Or are there limits set
>elsewhere that would prevent this from happening ?

I will check this and handle it in v2. Thanks

>
>> > +
>> > +	uvc->nformats =3D src_hdr->num_fmt;
>> > +
>> > +	uvc->frm =3D kcalloc(uvc->nframes, sizeof(struct uvcg_frame *), GFP_=
KERNEL);
>
>sizeof(*uvc->frm)

Right.

>
>> > +	if (!uvc->frm)
>> > +		return -ENOMEM;
>> > +
>> > +	uvc->fmt =3D kcalloc(uvc->nformats, sizeof(struct uvcg_format *), GF=
P_KERNEL);
>
>sizeof(*uvc->fmt)

Right.

>
>> > +	if (!uvc->fmt) {
>> > +		kfree(uvc->frm);
>> > +		return -ENOMEM;
>> > +	}
>>
>> nformats/nframes should be set to zero if the kcalloc(s) fail.
>>
>> > +
>> > +	list_for_each_entry(f, &src_hdr->formats, entry) {
>> > +		uvc->fmt[i++] =3D f->fmt;
>> > +		grp =3D &f->fmt->group;
>> > +		list_for_each_entry(item, &grp->cg_children, ci_entry) {
>> > +			uvc->frm[j++] =3D to_uvcg_frame(item);
>> > +		}
>> > +	}
>> > +
>> > +	return 0;
>> > +}
>> > +
>> >  static int
>> >  uvc_register_video(struct uvc_device *uvc)
>> >  {
>> > @@ -742,6 +780,13 @@ uvc_function_bind(struct usb_configuration *c, st=
ruct usb_function *f)
>> >  		goto error;
>> >  	}
>> >
>> > +	/* Register configfs formats and frames. */
>> > +	ret =3D uvc_analyze_configfs(uvc);
>> > +	if (ret < 0) {
>> > +		uvcg_err(f, "failed to read configfs\n");
>> > +		goto v4l2_error;
>>
>> s/v4l2_error/error/ ?
>
>I think v4l2_error is correct as this code is just after
>v4l2_device_register().


Yes. I will keep it.

>
>> > +	}
>> > +
>> >  	/* Initialise video. */
>> >  	ret =3D uvcg_video_init(&uvc->video, uvc);
>> >  	if (ret < 0)
>> > @@ -905,6 +950,8 @@ static struct usb_function *uvc_alloc(struct usb_f=
unction_instance *fi)
>> >  	struct uvc_device *uvc;
>> >  	struct f_uvc_opts *opts;
>> >  	struct uvc_descriptor_header **strm_cls;
>> > +	struct config_item *item;
>> > +	struct config_group *grp;
>
>s/grp/group/

Right.

>
>> >
>> >  	uvc =3D kzalloc(sizeof(*uvc), GFP_KERNEL);
>> >  	if (uvc =3D=3D NULL)
>> > @@ -936,6 +983,13 @@ static struct usb_function *uvc_alloc(struct usb_=
function_instance *fi)
>> >  	uvc->desc.fs_streaming =3D opts->fs_streaming;
>> >  	uvc->desc.hs_streaming =3D opts->hs_streaming;
>> >  	uvc->desc.ss_streaming =3D opts->ss_streaming;
>> > +
>> > +	grp =3D &opts->func_inst.group;
>> > +	item =3D config_group_find_item(grp, "streaming");
>
>As grp is used once only, you could also write
>
>	item =3D config_group_find_item(&opts->func_inst.group, "streaming");
>
>> > +	item =3D config_group_find_item(to_config_group(item), "header");
>> > +	item =3D config_group_find_item(to_config_group(item), "h");
>>
>> These return values should be checked. It's conceivable that userspace
>> neglects to create these directories (either by accident or on purpose).
>
>Furthermore, config_group_find_item() increases the refcout on the
>returned item, which needs to be released.


I will handle the release in v2.

>
>> > +	uvc->h =3D to_uvcg_streaming_header(item);
>
>As a pointer to the last item is indirectly stored here, that refcount
>must be released only when uvc->h isn't needed anymore.


Right. Will fix it.

>
>> > +
>> >  	++opts->refcnt;
>> >  	mutex_unlock(&opts->lock);
>> >
>> > diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/fu=
nction/uvc.h
>> > index 23ee25383c1f7..62d7420a25666 100644
>> > --- a/drivers/usb/gadget/function/uvc.h
>> > +++ b/drivers/usb/gadget/function/uvc.h
>> > @@ -80,11 +80,10 @@ struct uvc_video {
>> >  	struct work_struct pump;
>> >
>> >  	/* Frame parameters */
>> > -	u8 bpp;
>> > -	u32 fcc;
>> > -	unsigned int width;
>> > -	unsigned int height;
>> > -	unsigned int imagesize;
>> > +	struct uvcg_format *def_format;
>> > +	struct uvcg_format *cur_format;
>> > +	struct uvcg_frame *cur_frame;
>> > +
>> >  	struct mutex mutex;	/* protects frame parameters */
>> >
>> >  	/* Requests */
>> > @@ -118,6 +117,14 @@ struct uvc_device {
>> >  	struct usb_function func;
>> >  	struct uvc_video video;
>> >
>> > +	struct uvcg_streaming_header *h;
>> > +
>> > +	struct uvcg_frame **frm;
>> > +	int nframes;
>> > +
>> > +	struct uvcg_format **fmt;
>
>Please spell frames and formats in full.

Right.

>
>> > +	int nformats;
>
>nframes and nformats should be unsigned int.

Right.

>
>> > +
>> >  	/* Descriptors */
>> >  	struct {
>> >  		const struct uvc_descriptor_header * const *fs_control;
>> > @@ -162,4 +169,5 @@ extern void uvc_endpoint_stream(struct uvc_device =
*dev);
>> >  extern void uvc_function_connect(struct uvc_device *uvc);
>> >  extern void uvc_function_disconnect(struct uvc_device *uvc);
>> >
>> > +extern int uvc_frame_default(struct uvcg_format *ufmt);
>> >  #endif /* _UVC_GADGET_H_ */
>> > diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/=
gadget/function/uvc_configfs.c
>> > index 86463bb2639ed..009c80d0e1780 100644
>> > --- a/drivers/usb/gadget/function/uvc_configfs.c
>> > +++ b/drivers/usb/gadget/function/uvc_configfs.c
>> > @@ -11,6 +11,7 @@
>> >   */
>> >
>> >  #include <linux/sort.h>
>> > +#include <linux/videodev2.h>
>> >
>> >  #include "u_uvc.h"
>> >  #include "uvc_configfs.h"
>> > @@ -1547,6 +1548,8 @@ static struct config_group *uvcg_uncompressed_ma=
ke(struct config_group *group,
>> >  	h->desc.bCopyProtect		=3D 0;
>> >
>> >  	h->fmt.type =3D UVCG_UNCOMPRESSED;
>> > +	h->fmt.fcc =3D V4L2_PIX_FMT_YUYV;
>> > +	h->fmt.name =3D "YUV 4:2:2 (YUYV)";
>
>Uncompressed formats are not limited to YUYV, you need to support any
>uncompressed format, or this will be a regression.

Right. These are currently the defaults that will be set when a new
uncompressed entry in the configfs will be created. We will have to make
sure that these can be overwritten by the userspace.

>> >  	config_group_init_type_name(&h->fmt.group, name,
>> >  				    &uvcg_uncompressed_type);
>> >
>> > @@ -1721,6 +1724,8 @@ static struct config_group *uvcg_mjpeg_make(stru=
ct config_group *group,
>> >  	h->desc.bCopyProtect		=3D 0;
>> >
>> >  	h->fmt.type =3D UVCG_MJPEG;
>> > +	h->fmt.fcc =3D V4L2_PIX_FMT_MJPEG;
>> > +	h->fmt.name =3D "MJPEG";
>> >  	config_group_init_type_name(&h->fmt.group, name,
>> >  				    &uvcg_mjpeg_type);
>> >
>> > diff --git a/drivers/usb/gadget/function/uvc_configfs.h b/drivers/usb/=
gadget/function/uvc_configfs.h
>> > index f905d29570eb4..8ed966275f838 100644
>> > --- a/drivers/usb/gadget/function/uvc_configfs.h
>> > +++ b/drivers/usb/gadget/function/uvc_configfs.h
>> > @@ -52,6 +52,8 @@ struct uvcg_format {
>> >  	enum uvcg_format_type	type;
>> >  	unsigned		linked;
>> >  	unsigned		num_frames;
>> > +	char			*name;
>> > +	u32			fcc;
>> >  	__u8			bmaControls[UVCG_STREAMING_CONTROL_SIZE];
>> >  };
>> >
>> > diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gad=
get/function/uvc_queue.c
>> > index 61e2c94cc0b0c..6afc4b79adfe9 100644
>> > --- a/drivers/usb/gadget/function/uvc_queue.c
>> > +++ b/drivers/usb/gadget/function/uvc_queue.c
>> > @@ -20,6 +20,8 @@
>> >  #include <media/videobuf2-vmalloc.h>
>> >
>> >  #include "uvc.h"
>> > +#include "u_uvc.h"
>> > +#include "uvc_configfs.h"
>> >
>> >  /* ------------------------------------------------------------------=
------
>> >   * Video buffers queue management.
>> > @@ -49,7 +51,7 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>> >
>> >  	*nplanes =3D 1;
>> >
>> > -	sizes[0] =3D video->imagesize;
>> > +	sizes[0] =3D video->cur_frame->frame.dw_max_video_frame_buffer_size;
>> >
>> >  	return 0;
>> >  }
>> > diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadg=
et/function/uvc_v4l2.c
>> > index 4ca89eab61590..83830b8864a6e 100644
>> > --- a/drivers/usb/gadget/function/uvc_v4l2.c
>> > +++ b/drivers/usb/gadget/function/uvc_v4l2.c
>> > @@ -24,6 +24,127 @@
>> >  #include "uvc_queue.h"
>> >  #include "uvc_video.h"
>> >  #include "uvc_v4l2.h"
>> > +#include "u_uvc.h"
>> > +#include "uvc_configfs.h"
>> > +
>> > +u32 uvc_v4l2_get_bytesperline(struct uvcg_format *fmt, struct uvcg_fr=
ame *frm)
>> > +{
>> > +	struct uvcg_uncompressed *u;
>> > +
>> > +	switch (fmt->type) {
>> > +	case UVCG_UNCOMPRESSED:
>> > +		u =3D to_uvcg_uncompressed(&fmt->group.cg_item);
>> > +		if (!u)
>> > +			return 0;
>> > +
>> > +		return u->desc.bBitsPerPixel * frm->frame.w_width / 8;
>> > +	case UVCG_MJPEG:
>> > +		return frm->frame.w_width;
>>
>> From the struct v4l2_pix_format documentation:
>> "For compressed formats the bytesperline value makes no sense.
>> Applications and drivers must set this to 0 in that case."
>>
>> Which means that some sizeimage calculations in uvc_v4l2.c would have to
>> be adjusted accordingly.
>>
>> > +	}
>> > +
>> > +	return 0;
>> > +}
>> > +
>> > +struct uvcg_frame *find_frame_by_index(struct uvc_device *uvc,
>> > +					      struct uvcg_format *ufmt,
>> > +					      int index)
>>
>> Indentation.
>>
>> > +{
>> > +	int i;
>> > +
>> > +	for (i =3D 0; i < uvc->nframes; i++) {
>> > +		if (uvc->frm[i]->fmt_type !=3D ufmt->type)
>> > +			continue;
>> > +
>> > +		if (index =3D=3D uvc->frm[i]->frame.b_frame_index)
>> > +			break;
>> > +	}
>> > +
>> > +	if (i =3D=3D uvc->nframes)
>> > +		return NULL;
>> > +
>> > +	return uvc->frm[i];
>> > +}
>> > +
>> > +static struct uvcg_format *find_format_by_pix(struct uvc_device *uvc,
>> > +						    u32 pixelformat)
>>
>> Indentation.
>>
>> > +{
>> > +	int i;
>> > +
>> > +	for (i =3D 0; i < uvc->nformats; i++)
>> > +		if (uvc->fmt[i]->fcc =3D=3D pixelformat)
>> > +			break;
>> > +
>> > +	if (i =3D=3D uvc->nformats)
>> > +		return NULL;
>> > +
>> > +	return uvc->fmt[i];
>> > +}
>> > +
>> > +int uvc_frame_default(struct uvcg_format *ufmt)
>> > +{
>> > +	struct uvcg_uncompressed *m;
>> > +	struct uvcg_uncompressed *u;
>> > +	int ret =3D 1;
>> > +
>> > +	switch (ufmt->type) {
>> > +	case UVCG_UNCOMPRESSED:
>> > +		u =3D to_uvcg_uncompressed(&ufmt->group.cg_item);
>> > +		if (u)
>> > +			ret =3D u->desc.bDefaultFrameIndex;
>> > +		break;
>> > +	case UVCG_MJPEG:
>> > +		m =3D to_uvcg_uncompressed(&ufmt->group.cg_item);
>> > +		if (m)
>> > +			ret =3D m->desc.bDefaultFrameIndex;
>> > +		break;
>> > +	}
>> > +
>> > +	if (!ret)
>> > +		ret =3D 1;
>>
>> Isn't 1 a valid frame index? Should this (and the initialization above)
>> be -1 instead?
>>
>> > +
>> > +	return ret;
>> > +}
>> > +
>> > +static struct uvcg_frame *find_frm_by_size(struct uvc_device *uvc,
>> > +					   struct uvcg_format *ufmt,
>> > +					   u16 rw, u16 rh)
>>
>> Also, since you have find_frame_by_index, maybe this should be
>> find_frame_by_size for consistency. Or maybe find_closest_frame_by_size?
>> Up to you.
>>
>> > +{
>> > +	struct uvc_video *video =3D &uvc->video;
>> > +	struct uvcg_frame *ufrm =3D NULL;
>> > +	unsigned int d, maxd;
>> > +	int i;
>> > +
>> > +	/* Find the closest image size. The distance between image sizes is
>> > +	 * the size in pixels of the non-overlapping regions between the
>> > +	 * requested size and the frame-specified size.
>> > +	 */
>> > +	maxd =3D (unsigned int)-1;
>> > +
>> > +	for (i =3D 0; i < uvc->nframes; i++) {
>> > +		u16 w, h;
>> > +
>> > +		if (uvc->frm[i]->fmt_type !=3D ufmt->type)
>> > +			continue;
>> > +
>> > +		w =3D uvc->frm[i]->frame.w_width;
>> > +		h =3D uvc->frm[i]->frame.w_height;
>> > +
>> > +		d =3D min(w, rw) * min(h, rh);
>> > +		d =3D w*h + rw*rh - 2*d;
>> > +		if (d < maxd) {
>> > +			maxd =3D d;
>> > +			ufrm =3D uvc->frm[i];
>> > +		}
>> > +
>> > +		if (maxd =3D=3D 0)
>> > +			break;
>> > +	}
>> > +
>> > +	if (ufrm =3D=3D NULL)
>> > +		uvcg_dbg(&video->uvc->func, "Unsupported size %ux%u\n", rw, rh);
>> > +
>> > +	return ufrm;
>> > +}
>> >
>> >  /* ------------------------------------------------------------------=
--------
>> >   * Requests handling
>> > @@ -50,16 +171,6 @@ uvc_send_response(struct uvc_device *uvc, struct u=
vc_request_data *data)
>> >   * V4L2 ioctls
>> >   */
>> >
>> > -struct uvc_format {
>> > -	u8 bpp;
>> > -	u32 fcc;
>> > -};
>> > -
>> > -static struct uvc_format uvc_formats[] =3D {
>> > -	{ 16, V4L2_PIX_FMT_YUYV  },
>> > -	{ 0,  V4L2_PIX_FMT_MJPEG },
>> > -};
>> > -
>> >  static int
>> >  uvc_v4l2_querycap(struct file *file, void *fh, struct v4l2_capability=
 *cap)
>> >  {
>> > @@ -81,55 +192,187 @@ uvc_v4l2_get_format(struct file *file, void *fh,=
 struct v4l2_format *fmt)
>> >  	struct uvc_device *uvc =3D video_get_drvdata(vdev);
>> >  	struct uvc_video *video =3D &uvc->video;
>> >
>> > -	fmt->fmt.pix.pixelformat =3D video->fcc;
>> > -	fmt->fmt.pix.width =3D video->width;
>> > -	fmt->fmt.pix.height =3D video->height;
>> > +	fmt->fmt.pix.pixelformat =3D video->cur_format->fcc;
>> > +	fmt->fmt.pix.width =3D video->cur_frame->frame.w_width;
>> > +	fmt->fmt.pix.height =3D video->cur_frame->frame.w_height;
>> > +	fmt->fmt.pix.field =3D V4L2_FIELD_NONE;
>> > +	fmt->fmt.pix.bytesperline =3D uvc_v4l2_get_bytesperline(video->cur_f=
ormat, video->cur_frame);
>> > +	fmt->fmt.pix.sizeimage =3D video->cur_frame->frame.dw_max_video_fram=
e_buffer_size;
>> > +	fmt->fmt.pix.colorspace =3D V4L2_COLORSPACE_SRGB;
>> > +	fmt->fmt.pix.priv =3D 0;
>> > +
>> > +	return 0;
>> > +}
>> > +
>> > +static int _uvc_v4l2_try_fmt(struct uvc_video *video,
>> > +	struct v4l2_format *fmt, struct uvcg_format **uvc_format, struct uvc=
g_frame **uvc_frame)
>>
>> Indentation.
>>
>> > +{
>> > +	struct uvc_device *uvc =3D video->uvc;
>> > +	struct uvcg_format *ufmt;
>> > +	struct uvcg_frame *ufrm;
>> > +	u8 *fcc;
>> > +	int i;
>> > +
>> > +	if (fmt->type !=3D video->queue.queue.type)
>> > +		return -EINVAL;
>> > +
>> > +	fcc =3D (u8 *)&fmt->fmt.pix.pixelformat;
>> > +	uvcg_dbg(&uvc->func, "Trying format 0x%08x (%c%c%c%c): %ux%u\n",
>> > +		fmt->fmt.pix.pixelformat,
>> > +		fcc[0], fcc[1], fcc[2], fcc[3],
>> > +		fmt->fmt.pix.width, fmt->fmt.pix.height);
>> > +
>> > +	for (i =3D 0; i < uvc->nformats; i++)
>> > +		if (uvc->fmt[i]->fcc =3D=3D fmt->fmt.pix.pixelformat)
>> > +			break;
>> > +
>> > +	if (i =3D=3D uvc->nformats)
>> > +		ufmt =3D video->def_format;
>>
>> This means we don't support the requested format. Shouldn't we return
>> -EINVAL at this point?
>>
>> > +
>> > +	ufmt =3D uvc->fmt[i];
>> > +
>> > +	ufrm =3D find_frm_by_size(uvc, ufmt,
>> > +				fmt->fmt.pix.width, fmt->fmt.pix.height);
>> > +	if (!ufrm)
>> > +		return -EINVAL;
>> > +
>> > +	fmt->fmt.pix.width =3D ufrm->frame.w_width;
>> > +	fmt->fmt.pix.height =3D ufrm->frame.w_height;
>> >  	fmt->fmt.pix.field =3D V4L2_FIELD_NONE;
>> > -	fmt->fmt.pix.bytesperline =3D video->bpp * video->width / 8;
>> > -	fmt->fmt.pix.sizeimage =3D video->imagesize;
>> > +	fmt->fmt.pix.bytesperline =3D uvc_v4l2_get_bytesperline(ufmt, ufrm);
>>
>> As mentioned earlier, this should be 0 for compressed formats.
>>
>> > +	fmt->fmt.pix.sizeimage =3D ufrm->frame.dw_max_video_frame_buffer_siz=
e;
>> > +	fmt->fmt.pix.pixelformat =3D ufmt->fcc;
>> >  	fmt->fmt.pix.colorspace =3D V4L2_COLORSPACE_SRGB;
>> >  	fmt->fmt.pix.priv =3D 0;
>> >
>> > +	if (!fmt->fmt.pix.sizeimage && fmt->fmt.pix.bytesperline)
>> > +		fmt->fmt.pix.sizeimage =3D fmt->fmt.pix.bytesperline *
>> > +				fmt->fmt.pix.height;
>>
>> Since the configfs configuration is required to configure the driver, I
>> think it should be fine to just take the value from there, especially
>> since bytesperline will be zero for compressed formats anyway.
>>
>> Maybe for uncompressed we could just use what's requested?
>>
>> > +
>> > +	if (uvc_format !=3D NULL)
>> > +		*uvc_format =3D ufmt;
>> > +	if (uvc_frame !=3D NULL)
>> > +		*uvc_frame =3D ufrm;
>> > +
>> >  	return 0;
>> >  }
>> >
>> > +static int
>> > +uvc_v4l2_try_fmt(struct file *file, void *fh, struct v4l2_format *fmt)
>> > +{
>> > +	struct video_device *vdev =3D video_devdata(file);
>> > +	struct uvc_device *uvc =3D video_get_drvdata(vdev);
>> > +	struct uvc_video *video =3D &uvc->video;
>> > +
>> > +	return _uvc_v4l2_try_fmt(video, fmt, NULL, NULL);
>> > +}
>> > +
>> >  static int
>> >  uvc_v4l2_set_format(struct file *file, void *fh, struct v4l2_format *=
fmt)
>> >  {
>> >  	struct video_device *vdev =3D video_devdata(file);
>> >  	struct uvc_device *uvc =3D video_get_drvdata(vdev);
>> >  	struct uvc_video *video =3D &uvc->video;
>> > -	struct uvc_format *format;
>> > -	unsigned int imagesize;
>> > -	unsigned int bpl;
>> > -	unsigned int i;
>> > -
>> > -	for (i =3D 0; i < ARRAY_SIZE(uvc_formats); ++i) {
>> > -		format =3D &uvc_formats[i];
>> > -		if (format->fcc =3D=3D fmt->fmt.pix.pixelformat)
>> > +	struct uvcg_format *ufmt;
>> > +	struct uvcg_frame *ufrm;
>> > +	int ret;
>> > +
>> > +	ret =3D _uvc_v4l2_try_fmt(video, fmt, &ufmt, &ufrm);
>> > +	if (ret)
>> > +		return ret;
>> > +
>> > +	video->cur_format =3D ufmt;
>> > +	video->cur_frame =3D ufrm;
>> > +
>> > +	return ret;
>> > +}
>> > +
>> > +static int
>> > +uvc_v4l2_enum_frameintervals(struct file *file, void *fh,
>> > +		struct v4l2_frmivalenum *fival)
>> > +{
>> > +	struct video_device *vdev =3D video_devdata(file);
>> > +	struct uvc_device *uvc =3D video_get_drvdata(vdev);
>> > +	struct uvcg_format *ufmt =3D NULL;
>> > +	struct uvcg_frame *ufrm =3D NULL;
>> > +	int i;
>> > +
>> > +	ufmt =3D find_format_by_pix(uvc, fival->pixel_format);
>> > +	if (!ufmt)
>> > +		return -EINVAL;
>> > +
>> > +	for (i =3D 0; i < uvc->nframes; ++i) {
>> > +		if (uvc->frm[i]->fmt_type !=3D ufmt->type)
>> > +			continue;
>> > +
>> > +		if (uvc->frm[i]->frame.w_width =3D=3D fival->width &&
>> > +				uvc->frm[i]->frame.w_height =3D=3D fival->height) {
>>
>> Indentation.
>>
>> > +			ufrm =3D uvc->frm[i];
>> >  			break;
>> > +		}
>> >  	}
>> > +	if (!ufrm)
>> > +		return -EINVAL;
>> >
>> > -	if (i =3D=3D ARRAY_SIZE(uvc_formats)) {
>> > -		uvcg_info(&uvc->func, "Unsupported format 0x%08x.\n",
>> > -			  fmt->fmt.pix.pixelformat);
>> > +	if (fival->index >=3D ufrm->frame.b_frame_interval_type)
>> >  		return -EINVAL;
>> > -	}
>> >
>> > -	bpl =3D format->bpp * fmt->fmt.pix.width / 8;
>> > -	imagesize =3D bpl ? bpl * fmt->fmt.pix.height : fmt->fmt.pix.sizeima=
ge;
>> > +	/* TODO: handle V4L2_FRMIVAL_TYPE_STEPWISE */
>> > +	fival->type =3D V4L2_FRMIVAL_TYPE_DISCRETE;
>> > +	fival->discrete.numerator =3D ufrm->dw_frame_interval[fival->index];
>> > +	fival->discrete.denominator =3D 10000000;
>> > +	v4l2_simplify_fraction(&fival->discrete.numerator,
>>
>> Where does this function come from?
>>
>> > +		&fival->discrete.denominator, 8, 333);
>> >
>> > -	video->fcc =3D format->fcc;
>> > -	video->bpp =3D format->bpp;
>> > -	video->width =3D fmt->fmt.pix.width;
>> > -	video->height =3D fmt->fmt.pix.height;
>> > -	video->imagesize =3D imagesize;
>> > +	return 0;
>> > +}
>> >
>> > -	fmt->fmt.pix.field =3D V4L2_FIELD_NONE;
>> > -	fmt->fmt.pix.bytesperline =3D bpl;
>> > -	fmt->fmt.pix.sizeimage =3D imagesize;
>> > -	fmt->fmt.pix.colorspace =3D V4L2_COLORSPACE_SRGB;
>> > -	fmt->fmt.pix.priv =3D 0;
>> > +static int
>> > +uvc_v4l2_enum_framesizes(struct file *file, void *fh,
>> > +		struct v4l2_frmsizeenum *fsize)
>> > +{
>> > +	struct video_device *vdev =3D video_devdata(file);
>> > +	struct uvc_device *uvc =3D video_get_drvdata(vdev);
>> > +	struct uvcg_format *ufmt =3D NULL;
>> > +	struct uvcg_frame *ufrm =3D NULL;
>> > +
>> > +	ufmt =3D find_format_by_pix(uvc, fsize->pixel_format);
>> > +	if (!ufmt)
>> > +		return -EINVAL;
>> > +
>> > +	if (fsize->index >=3D ufmt->num_frames)
>> > +		return -EINVAL;
>> > +
>> > +	ufrm =3D find_frame_by_index(uvc, ufmt, fsize->index + 1);
>> > +	if (!ufrm)
>> > +		return -EINVAL;
>> > +
>> > +	fsize->type =3D V4L2_FRMSIZE_TYPE_DISCRETE;
>> > +	fsize->discrete.width =3D ufrm->frame.w_width;
>> > +	fsize->discrete.height =3D ufrm->frame.w_height;
>> > +
>> > +	return 0;
>> > +}
>> > +
>> > +static int
>> > +uvc_v4l2_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
>> > +{
>> > +	struct video_device *vdev =3D video_devdata(file);
>> > +	struct uvc_device *uvc =3D video_get_drvdata(vdev);
>> > +	struct uvcg_format *ufmt;
>> > +
>> > +	if (f->index >=3D uvc->nformats)
>> > +		return -EINVAL;
>> > +
>> > +	ufmt =3D uvc->fmt[f->index];
>> > +	if (!ufmt)
>> > +		return -EINVAL;
>> > +
>> > +	f->pixelformat =3D ufmt->fcc;
>> > +	f->flags |=3D V4L2_FMT_FLAG_COMPRESSED;
>>
>> This shouldn't be set if the format isn't compressed.
>>
>> > +
>> > +	strscpy(f->description, ufmt->name, sizeof(f->description));
>> > +	f->description[sizeof(f->description) - 1] =3D 0;
>>
>> If sizeof(ufmt->name) < sizeof(f->description), then the string won't be
>> properly null-terminated.
>>
>> >
>> >  	return 0;
>> >  }
>> > @@ -258,8 +501,12 @@ uvc_v4l2_ioctl_default(struct file *file, void *f=
h, bool valid_prio,
>> >
>> >  const struct v4l2_ioctl_ops uvc_v4l2_ioctl_ops =3D {
>> >  	.vidioc_querycap =3D uvc_v4l2_querycap,
>> > +	.vidioc_try_fmt_vid_out =3D uvc_v4l2_try_fmt,
>> >  	.vidioc_g_fmt_vid_out =3D uvc_v4l2_get_format,
>> >  	.vidioc_s_fmt_vid_out =3D uvc_v4l2_set_format,
>> > +	.vidioc_enum_frameintervals =3D uvc_v4l2_enum_frameintervals,
>> > +	.vidioc_enum_framesizes =3D uvc_v4l2_enum_framesizes,
>> > +	.vidioc_enum_fmt_vid_out =3D uvc_v4l2_enum_fmt,
>
>What's the point of implementing these functions, when userspace will
>have created the descriptors in configfs, and thus know what the
>supported formats, sizes and frame intervals are ?

The application that is creating the configfs entries does not necessary
have to be the application that serves the uvc gadget. Look at different
composite gadgets that serve different functions over the interface.

To separate the tasks of creating the gadget and serving the gadget the
latter can use the already available v4l2 api that many applications
like gstreamer already understand.

>To be honest, I'm not thrilled by this series. Unless there's a very
>good reason to handle all this on the kernel side, I think it just
>increases the complexity of the kernel code without much benefit.

It does not really increase complexity.

Just look into

https://git.ideasonboard.org/uvc-gadget.git/blob/HEAD:/lib/configfs.c

which implements its own configfs parser for the userspace, just to be
flexible enough to handle the different formats that some other
userspace tool configured. The idea is to get rid of thus extras and
just use the v4l2 api on the v4l2 dev.

While being here; I see that the s_fmt_vid_out callback can actually be
removed. This userspace callback is not very usefull for an uvc v4l2
device thats format should only be set by the host that it is connected to.
When you look into my implementation, this callback is even competing with
the host api and currently needs to be locked. This obviously makes no
sense.

>> >  	.vidioc_reqbufs =3D uvc_v4l2_reqbufs,
>> >  	.vidioc_querybuf =3D uvc_v4l2_querybuf,
>> >  	.vidioc_qbuf =3D uvc_v4l2_qbuf,
>> > diff --git a/drivers/usb/gadget/function/uvc_v4l2.h b/drivers/usb/gadg=
et/function/uvc_v4l2.h
>> > index 1576005b61fd3..6e45103bbf793 100644
>> > --- a/drivers/usb/gadget/function/uvc_v4l2.h
>> > +++ b/drivers/usb/gadget/function/uvc_v4l2.h
>> > @@ -15,5 +15,6 @@
>> >
>> >  extern const struct v4l2_ioctl_ops uvc_v4l2_ioctl_ops;
>> >  extern const struct v4l2_file_operations uvc_v4l2_fops;
>> > +extern u32 uvc_v4l2_get_bytesperline(struct uvcg_format *fmt, struct =
uvcg_frame *frm);
>>
>> Do you need this here? Nobody outside of uvc_v4l2.c uses it.
>>
>> >
>> >  #endif /* __UVC_V4L2_H__ */
>> > diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gad=
get/function/uvc_video.c
>> > index 633e23d58d868..b14780bddd838 100644
>> > --- a/drivers/usb/gadget/function/uvc_video.c
>> > +++ b/drivers/usb/gadget/function/uvc_video.c
>> > @@ -17,7 +17,10 @@
>> >
>> >  #include "uvc.h"
>> >  #include "uvc_queue.h"
>> > +#include "uvc_v4l2.h"
>> >  #include "uvc_video.h"
>> > +#include "u_uvc.h"
>> > +#include "uvc_configfs.h"
>> >
>> >  /* ------------------------------------------------------------------=
--------
>> >   * Video codecs
>> > @@ -348,11 +351,8 @@ int uvcg_video_init(struct uvc_video *video, stru=
ct uvc_device *uvc)
>> >  	INIT_WORK(&video->pump, uvcg_video_pump);
>> >
>> >  	video->uvc =3D uvc;
>> > -	video->fcc =3D V4L2_PIX_FMT_YUYV;
>> > -	video->bpp =3D 16;
>> > -	video->width =3D 320;
>> > -	video->height =3D 240;
>> > -	video->imagesize =3D 320 * 240 * 2;
>> > +	video->def_format =3D video->cur_format =3D uvc->fmt[0];
>
>There's nothing in the UVC specification that requires the first format
>to be the default. It's entirely conceivable that a device could select
>the default dynamically.

In the UVC spec there is bDefaultFrameIndex.

But I did not find any bDefaultFormatIndex. So I thought just
take the first in the configfs pool.

The host will call GET_CUR to get the current format before deciding
which format and frame to choose. So I think in the beginning we can
take over the decision. As long as we also offer the formats that is
selected by default there should be no problem.

>
>> > +	video->cur_frame =3D uvc->frm[uvc_frame_default(video->def_format) -=
 1];
>>
>> I think we'll need something here to validate the configfs, to make sure
>> it's filled corretly. I anticipate that uvc->fmt[0] might cause problems
>> if no format is set in configfs.
>>
>> Or maybe such protection is already around and I'm not aware of it.
>>
>> >  	/* Initialize the video buffers queue. */
>> >  	uvcg_queue_init(&video->queue, V4L2_BUF_TYPE_VIDEO_OUTPUT,
>


Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--A6N2fC+uXW/VQSAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmDVpAAACgkQC+njFXoe
LGT5iw//aI4WSbYuLVRlrMA4AFAgemienvx3pjIHTjN0SWIsWJVXYWObfX/vjssk
Eurd1FoF1fuFkHtXBQmyhhKIlbUCFbbLsp6AecHfROGJDw+A+B0929mGRhl0Dzrt
cwGN4E1xD//Z4qFTP0sVX+icwWg6OsFm0N5RR/AnPMIeEJl69FGw/jJb91VYq8S4
giruhvI344AOaOUmDRmSL9Ge87rpz1IYNjHotqvXaFMvGpWrfCwE1y3ckzwAzT1j
kMIRfLyUhdQPuxHou7ZU3cpoGhFAYRp4ehcKm5LXfjnbYo153F0mDYogK3yQwsfP
zomQtiKzFotAzkV1JmW7V3lL0C0jxzrQZVvDPcKKqe9O0sMfdYBCvB1Wl5PK51OB
XiM1lnud/qaETRMKAAX8GdVY9hiGK9Cv8Vom6645PSG5gb7ADNaJqtBrwCkZuMb9
QoGpMF+NCrrzg+QvIljPxwfYkNYVvl6vjOI1WBM+vl4yn+tENo5Q+rEjfdYoWGLg
p8Lzvoq+0/Ihdy/gStrwT52lza2hWSTRya3wzzcWSOG6boQ7EFth8HT4R6R2xgEc
f4Gyldxc/4SWpU9b36Wy+kFodd5a5+0+b8YDPVeek6BA6WsGgOAjP6IJ3i3+oIwT
3hFPbCfpVn0sXVV0diAuZGv9jK8sc+2m+LpBFENn2+kQAwvN7+o=
=5c7o
-----END PGP SIGNATURE-----

--A6N2fC+uXW/VQSAv--
