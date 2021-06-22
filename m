Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54C853B081F
	for <lists+linux-usb@lfdr.de>; Tue, 22 Jun 2021 17:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbhFVPCd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Jun 2021 11:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbhFVPCc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Jun 2021 11:02:32 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D814C061574
        for <linux-usb@vger.kernel.org>; Tue, 22 Jun 2021 08:00:16 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lvhst-0003BI-25; Tue, 22 Jun 2021 17:00:15 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lvhss-0000pM-G1; Tue, 22 Jun 2021 17:00:14 +0200
Date:   Tue, 22 Jun 2021 17:00:14 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, caleb.connolly@ideasonboard.com,
        paul.elder@ideasonboard.com, balbi@kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 1/3] usb: gadget: uvc: make uvc_num_requests depend on
 gadget speed
Message-ID: <20210622150014.GC24215@pengutronix.de>
References: <20210530223041.15320-1-m.grzeschik@pengutronix.de>
 <20210530223041.15320-2-m.grzeschik@pengutronix.de>
 <YMgCJAHV4vYYZKlv@pendragon.ideasonboard.com>
 <YMgElaUrfYuuZJMj@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1ccMZA6j1vT5UqiK"
Content-Disposition: inline
In-Reply-To: <YMgElaUrfYuuZJMj@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:57:03 up 124 days, 18:20, 127 users,  load average: 0.29, 0.13,
 0.10
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--1ccMZA6j1vT5UqiK
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent!

On Tue, Jun 15, 2021 at 04:38:29AM +0300, Laurent Pinchart wrote:
>Hi Michael,
>
>Another comment.
>
>On Tue, Jun 15, 2021 at 04:28:05AM +0300, Laurent Pinchart wrote:
>> On Mon, May 31, 2021 at 12:30:39AM +0200, Michael Grzeschik wrote:
>> > While sending bigger images is possible with USB_SPEED_SUPER it is
>> > better to use more isochronous requests in flight. This patch makes the
>> > number uvc_num_requests dynamic by changing it depending on the gadget
>> > speed.
>> >
>> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> > ---
>> > v1 -> v2: - fixed null pointer dereference in uvc_video_free_requests
>> >
>> >  drivers/usb/gadget/function/uvc.h       | 11 +++--
>> >  drivers/usb/gadget/function/uvc_queue.c |  7 ++++
>> >  drivers/usb/gadget/function/uvc_video.c | 56 +++++++++++++++----------
>> >  3 files changed, 48 insertions(+), 26 deletions(-)
>> >
>> > diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/fu=
nction/uvc.h
>> > index 23ee25383c1f7..83b9e945944e8 100644
>> > --- a/drivers/usb/gadget/function/uvc.h
>> > +++ b/drivers/usb/gadget/function/uvc.h
>> > @@ -65,13 +65,17 @@ extern unsigned int uvc_gadget_trace_param;
>> >   * Driver specific constants
>> >   */
>> >
>> > -#define UVC_NUM_REQUESTS			4
>> >  #define UVC_MAX_REQUEST_SIZE			64
>> >  #define UVC_MAX_EVENTS				4
>> >
>> >  /* ------------------------------------------------------------------=
------
>> >   * Structures
>> >   */
>> > +struct uvc_request {
>> > +	struct usb_request *req;
>> > +	__u8 *req_buffer;
>>
>> While at it, you could s/__u8/u8/ as this header isn't used by
>> userspace.
>>
>> > +	struct uvc_video *video;
>> > +};
>> >
>> >  struct uvc_video {
>> >  	struct uvc_device *uvc;
>> > @@ -87,10 +91,11 @@ struct uvc_video {
>> >  	unsigned int imagesize;
>> >  	struct mutex mutex;	/* protects frame parameters */
>> >
>> > +	int uvc_num_requests;
>>
>> Never negative, you can make it an unsigned int.
>>
>> > +
>> >  	/* Requests */
>> >  	unsigned int req_size;
>> > -	struct usb_request *req[UVC_NUM_REQUESTS];
>> > -	__u8 *req_buffer[UVC_NUM_REQUESTS];
>> > +	struct uvc_request *ureq;
>> >  	struct list_head req_free;
>> >  	spinlock_t req_lock;
>> >
>> > diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gad=
get/function/uvc_queue.c
>> > index 61e2c94cc0b0c..dcd71304d521c 100644
>> > --- a/drivers/usb/gadget/function/uvc_queue.c
>> > +++ b/drivers/usb/gadget/function/uvc_queue.c
>> > @@ -43,6 +43,8 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>> >  {
>> >  	struct uvc_video_queue *queue =3D vb2_get_drv_priv(vq);
>> >  	struct uvc_video *video =3D container_of(queue, struct uvc_video, qu=
eue);
>> > +	struct uvc_device *uvc =3D video->uvc;
>> > +	struct usb_composite_dev *cdev =3D uvc->func.config->cdev;
>>
>> 	struct usb_composite_dev *cdev =3D video->uvc->func.config->cdev;
>>
>> >
>> >  	if (*nbuffers > UVC_MAX_VIDEO_BUFFERS)
>> >  		*nbuffers =3D UVC_MAX_VIDEO_BUFFERS;
>> > @@ -51,6 +53,11 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>> >
>> >  	sizes[0] =3D video->imagesize;
>> >
>> > +	if (cdev->gadget->speed < USB_SPEED_SUPER)
>> > +		video->uvc_num_requests =3D 4;
>> > +	else
>> > +		video->uvc_num_requests =3D 64;
>> > +
>> >  	return 0;
>> >  }
>> >
>> > diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gad=
get/function/uvc_video.c
>> > index 633e23d58d868..57840083dfdda 100644
>> > --- a/drivers/usb/gadget/function/uvc_video.c
>> > +++ b/drivers/usb/gadget/function/uvc_video.c
>> > @@ -11,6 +11,7 @@
>> >  #include <linux/errno.h>
>> >  #include <linux/usb/ch9.h>
>> >  #include <linux/usb/gadget.h>
>> > +#include <linux/module.h>
>>
>> Alphabetical order please.
>
>Why is this header needed ? I can't see anything below related to it.

It must have slipped through. I removed the header and worked in all
your feedback.

Thanks for the Review!

Regards,

Michael Grzeschik

>> >  #include <linux/usb/video.h>
>> >
>> >  #include <media/v4l2-dev.h>
>> > @@ -145,7 +146,8 @@ static int uvcg_video_ep_queue(struct uvc_video *v=
ideo, struct usb_request *req)
>> >  static void
>> >  uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
>> >  {
>> > -	struct uvc_video *video =3D req->context;
>> > +	struct uvc_request *ureq =3D req->context;
>> > +	struct uvc_video *video =3D ureq->video;
>> >  	struct uvc_video_queue *queue =3D &video->queue;
>> >  	unsigned long flags;
>> >
>> > @@ -177,16 +179,19 @@ uvc_video_free_requests(struct uvc_video *video)
>> >  {
>> >  	unsigned int i;
>> >
>> > -	for (i =3D 0; i < UVC_NUM_REQUESTS; ++i) {
>> > -		if (video->req[i]) {
>> > -			usb_ep_free_request(video->ep, video->req[i]);
>> > -			video->req[i] =3D NULL;
>> > -		}
>> > -
>> > -		if (video->req_buffer[i]) {
>> > -			kfree(video->req_buffer[i]);
>> > -			video->req_buffer[i] =3D NULL;
>> > +	if (video->ureq) {
>> > +		for (i =3D 0; i < video->uvc_num_requests; ++i) {
>> > +			if (video->ureq[i].req) {
>> > +				usb_ep_free_request(video->ep, video->ureq[i].req);
>> > +				video->ureq[i].req =3D NULL;
>> > +			}
>>
>> Blank line here please.
>>
>> > +			if (video->ureq[i].req_buffer) {
>> > +				kfree(video->ureq[i].req_buffer);
>> > +				video->ureq[i].req_buffer =3D NULL;
>> > +			}
>> >  		}
>>
>> Here too.
>>
>> > +		kfree(video->ureq);
>> > +		video->ureq =3D NULL;
>> >  	}
>> >
>> >  	INIT_LIST_HEAD(&video->req_free);
>> > @@ -207,21 +212,26 @@ uvc_video_alloc_requests(struct uvc_video *video)
>> >  		 * max_t(unsigned int, video->ep->maxburst, 1)
>> >  		 * (video->ep->mult);
>> >
>> > -	for (i =3D 0; i < UVC_NUM_REQUESTS; ++i) {
>> > -		video->req_buffer[i] =3D kmalloc(req_size, GFP_KERNEL);
>> > -		if (video->req_buffer[i] =3D=3D NULL)
>> > +	video->ureq =3D kcalloc(video->uvc_num_requests, sizeof(struct uvc_r=
equest), GFP_KERNEL);
>> > +	if (video->ureq =3D=3D NULL)
>> > +		return ret;
>>
>> 		return -ENOMEM;
>>
>> would be more readable (I had to check the value of ret to review this
>> patch).
>>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> > +
>> > +	for (i =3D 0; i < video->uvc_num_requests; ++i) {
>> > +		video->ureq[i].req_buffer =3D kmalloc(req_size, GFP_KERNEL);
>> > +		if (video->ureq[i].req_buffer =3D=3D NULL)
>> >  			goto error;
>> >
>> > -		video->req[i] =3D usb_ep_alloc_request(video->ep, GFP_KERNEL);
>> > -		if (video->req[i] =3D=3D NULL)
>> > +		video->ureq[i].req =3D usb_ep_alloc_request(video->ep, GFP_KERNEL);
>> > +		if (video->ureq[i].req =3D=3D NULL)
>> >  			goto error;
>> >
>> > -		video->req[i]->buf =3D video->req_buffer[i];
>> > -		video->req[i]->length =3D 0;
>> > -		video->req[i]->complete =3D uvc_video_complete;
>> > -		video->req[i]->context =3D video;
>> > +		video->ureq[i].req->buf =3D video->ureq[i].req_buffer;
>> > +		video->ureq[i].req->length =3D 0;
>> > +		video->ureq[i].req->complete =3D uvc_video_complete;
>> > +		video->ureq[i].req->context =3D &video->ureq[i];
>> > +		video->ureq[i].video =3D video;
>> >
>> > -		list_add_tail(&video->req[i]->list, &video->req_free);
>> > +		list_add_tail(&video->ureq[i].req->list, &video->req_free);
>> >  	}
>> >
>> >  	video->req_size =3D req_size;
>> > @@ -312,9 +322,9 @@ int uvcg_video_enable(struct uvc_video *video, int=
 enable)
>> >  		cancel_work_sync(&video->pump);
>> >  		uvcg_queue_cancel(&video->queue, 0);
>> >
>> > -		for (i =3D 0; i < UVC_NUM_REQUESTS; ++i)
>> > -			if (video->req[i])
>> > -				usb_ep_dequeue(video->ep, video->req[i]);
>> > +		for (i =3D 0; i < video->uvc_num_requests; ++i)
>> > +			if (video->ureq && video->ureq[i].req)
>> > +				usb_ep_dequeue(video->ep, video->ureq[i].req);
>> >
>> >  		uvc_video_free_requests(video);
>> >  		uvcg_queue_enable(&video->queue, 0);
>
>--=20
>Regards,
>
>Laurent Pinchart
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--1ccMZA6j1vT5UqiK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmDR+vgACgkQC+njFXoe
LGTmpA//QHF3TFMlAFYV85qm9gxklORoHuTtFla6nhLdqM9vuTUobiDSMxIMy1G0
UIgDvCgsbQ6LrMv4pzuYRA5UP/Lf20Zx2Gl3J4tmRUKqPcn/bGSICimADRn7njRh
/LbdJ433qcrWCEnw6Zi9rnlGxprOS8yFMRtVzsdwLpJT/bT5WZA6fh5eTohajbRD
08JF17E8yfgim97OWFBVM65NBUGirUo3D7BzSHcjzO2lx95WyVCXJgHnnkpR0Yfs
NCqJiMp4pEshGW5mKXEQcr2/zszfjfYtsTFXz22Tl7bD5DvJ664itjJxt7k/lb3h
utwq0SxtABYxwPfBDNDFT2Su1YEOLlxyJ76kYC+jhk3D1sYtpgsuF5m3asXj3A8B
dtmY9N0zG6hY8YVXpVH2ypGppmIIfq9KMtKbswn0HrJe4jCtpda4RdBDR7JgWdJJ
gYyN5uTwJjU1zrNL5ssdpDpXsP7n2u1jUkM/K+vjZvV1/sG/+AAbEXg3OK2QeRkJ
YWQawPSOFu23RbuR3NA7NFPGRhdlT7H8Iuk0FQJEBw3h59XGnkm/S0HPGQ25S0GX
3JHTWoh1UxFYPfpW43DZfxvdqhuD9TssP7nZvuTMGFeCV3HMZma8IDFi35M/K746
lbwJG/qeIz7WAfHLJT2A75NLHpORanyIfuuCYuwUkJs/K1C5fsw=
=/L3Q
-----END PGP SIGNATURE-----

--1ccMZA6j1vT5UqiK--
