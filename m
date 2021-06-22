Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF1B3B0828
	for <lists+linux-usb@lfdr.de>; Tue, 22 Jun 2021 17:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232016AbhFVPFO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Jun 2021 11:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230332AbhFVPFO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Jun 2021 11:05:14 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D25C061574
        for <linux-usb@vger.kernel.org>; Tue, 22 Jun 2021 08:02:58 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lvhvV-0003Yo-0Q; Tue, 22 Jun 2021 17:02:57 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lvhvU-0001oL-Lt; Tue, 22 Jun 2021 17:02:56 +0200
Date:   Tue, 22 Jun 2021 17:02:56 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     paul.elder@ideasonboard.com, linux-usb@vger.kernel.org,
        caleb.connolly@ideasonboard.com, balbi@kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 3/3] usb: gadget: uvc: decrease the interrupt load to
 a quarter
Message-ID: <20210622150256.GD24215@pengutronix.de>
References: <20210530223041.15320-1-m.grzeschik@pengutronix.de>
 <20210530223041.15320-4-m.grzeschik@pengutronix.de>
 <20210614103558.GB1234605@pyrite.rasen.tech>
 <YMgENcJoomZULu+J@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0/kgSOzhNoDC5T3a"
Content-Disposition: inline
In-Reply-To: <YMgENcJoomZULu+J@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 17:00:37 up 124 days, 18:24, 127 users,  load average: 0.56, 0.28,
 0.15
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--0/kgSOzhNoDC5T3a
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent!

On Tue, Jun 15, 2021 at 04:36:53AM +0300, Laurent Pinchart wrote:
>Hi Michael,
>
>Thank you for the patch.
>
>On Mon, Jun 14, 2021 at 07:35:58PM +0900, paul.elder@ideasonboard.com wrot=
e:
>> On Mon, May 31, 2021 at 12:30:41AM +0200, Michael Grzeschik wrote:
>> > With usb3 we handle much more requests. It only enables the interrupt =
on
>>
>> s/much/many/
>>
>> > every quarter of the allocated requests. This patch decreases the
>> > interrupt load.
>>
>> The last two sentences might be better combined, like:
>>
>> "Decrease the interrupt load by only enabling the interrupt every
>> quarter of the allocated requests."
>>
>> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>
>> Other than that, looks good to me.
>>
>> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
>>
>> > ---
>> >  drivers/usb/gadget/function/uvc.h       |  2 ++
>> >  drivers/usb/gadget/function/uvc_video.c | 12 ++++++++++++
>> >  2 files changed, 14 insertions(+)
>> >
>> > diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/fu=
nction/uvc.h
>> > index c1f06d9df5820..5a76e9351b530 100644
>> > --- a/drivers/usb/gadget/function/uvc.h
>> > +++ b/drivers/usb/gadget/function/uvc.h
>> > @@ -101,6 +101,8 @@ struct uvc_video {
>> >  	struct list_head req_free;
>> >  	spinlock_t req_lock;
>> >
>> > +	int req_int_count;
>
>unsigned int.
>
>> > +
>> >  	void (*encode) (struct usb_request *req, struct uvc_video *video,
>> >  			struct uvc_buffer *buf);
>> >
>> > diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gad=
get/function/uvc_video.c
>> > index 240d361a45a44..66754687ce217 100644
>> > --- a/drivers/usb/gadget/function/uvc_video.c
>> > +++ b/drivers/usb/gadget/function/uvc_video.c
>> > @@ -357,6 +357,16 @@ static void uvcg_video_pump(struct work_struct *w=
ork)
>> >
>> >  		video->encode(req, video, buf);
>> >
>
>A comment to explain the logic would be useful.
>
>> > +		if (list_empty(&video->req_free) ||
>> > +		    (buf->state =3D=3D UVC_BUF_STATE_DONE) ||
>
>No need for parentheses here.
>
>> > +		    (!(video->req_int_count %
>> > +		       DIV_ROUND_UP(video->uvc_num_requests, 4)))) {
>> > +			video->req_int_count =3D 0;
>> > +			req->no_interrupt =3D 0;
>> > +		} else {
>> > +			req->no_interrupt =3D 1;
>> > +		}
>> > +
>> >  		/* Queue the USB request */
>> >  		ret =3D uvcg_video_ep_queue(video, req);
>> >  		spin_unlock_irqrestore(&queue->irqlock, flags);
>> > @@ -365,6 +375,7 @@ static void uvcg_video_pump(struct work_struct *wo=
rk)
>> >  			uvcg_queue_cancel(queue, 0);
>> >  			break;
>> >  		}
>> > +		video->req_int_count++;
>> >  	}
>> >
>> >  	spin_lock_irqsave(&video->req_lock, flags);
>> > @@ -437,6 +448,7 @@ int uvcg_video_init(struct uvc_video *video, struc=
t uvc_device *uvc)
>> >  	video->width =3D 320;
>> >  	video->height =3D 240;
>> >  	video->imagesize =3D 320 * 240 * 2;
>> > +	video->req_int_count =3D 0;
>
>Should this be initialized to 0 in uvcg_video_enable() instead of
>uvcg_video_init(), to ensure that stop/start cycles will operate in a
>predictable way ?

This makes total sense. I don't see why it should not start by 0 on
every enable. I worked in yours and Paul's feedback and moved the
req_int_count initialization to uvcg_video_enable.

Thanks!

Michael Grzeschik

>> >
>> >  	/* Initialize the video buffers queue. */
>> >  	uvcg_queue_init(uvc->v4l2_dev.dev, &video->queue, V4L2_BUF_TYPE_VIDE=
O_OUTPUT,
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

--0/kgSOzhNoDC5T3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmDR+6AACgkQC+njFXoe
LGTtDBAAkJkKivvHwTKYb1p2fsNSTqWV6X2TkbkyKBMHVNM4zP5ERDPaq7r65j4a
uwxMHd/p4e5rYbekjAqrXozlnr5xtMh5gFtpwGBA3+3nYYE9NTlU1WP/ylFRVb+D
Ilt1eY8CssDoKHGxvkG6ues0ijwFfENiVxQQMrBVHUkOLiBHXHgzSnBshnG+ji3g
s3XQrKDPWGtScJEBzYTdIYuMgUVWFTcD2G1VYqHE0dTnPzCrpv33+2OJKmhnlvbA
+lkP3t/plochxQL6RzwO1B2+HFIKDrH2i9ESCNvfQx73FegcaCItfwKlXh3SgrA5
i4GjqBmEiuAwh2m5l2Q7nSubNKc48BUUSufeoE7LWdto9s/BBZPM4QT/IUxb7fmt
79dPolXCztmyJWvzqYCtiJkO1HSFkbhGy2RK4DqcT9zOKYJdudU7S2TVkZJdAvkQ
nyziJphiCBvCypVAdGdq71avrNhAJihXxyACQJrOdht2CokdwzM4xoSpqzcFpo+F
KABzMx1CMPdORniRuubTWnwHPHuoYfzXC28Vyzc7EP4ExlAb690pPVNHKpyfr+7u
7j1MbIEmPNr6KNK2JTfKVhQRnWNRenQHlz7Fzbe7vb2dbSrEZPSYjPAfHtC4KMDn
vwFx/hAqOxqqXRpswAPk2c+layOJ7Kb545l+aC8hxiW109AxM+g=
=TyUX
-----END PGP SIGNATURE-----

--0/kgSOzhNoDC5T3a--
