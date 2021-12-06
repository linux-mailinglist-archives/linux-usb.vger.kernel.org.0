Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78506469709
	for <lists+linux-usb@lfdr.de>; Mon,  6 Dec 2021 14:30:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244515AbhLFNdq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Dec 2021 08:33:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244503AbhLFNdo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Dec 2021 08:33:44 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 511F8C061746
        for <linux-usb@vger.kernel.org>; Mon,  6 Dec 2021 05:30:15 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1muE4L-0000Nh-Jj; Mon, 06 Dec 2021 14:30:13 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1muE4K-0000jq-Hb; Mon, 06 Dec 2021 14:30:12 +0100
Date:   Mon, 6 Dec 2021 14:30:12 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Greg KH <greg@kroah.com>, linux-usb@vger.kernel.org,
        balbi@kernel.org, paul.elder@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: gadget: uvc: use pump call conditionally
Message-ID: <20211206133012.GA6361@pengutronix.de>
References: <20211202005852.3538102-1-m.grzeschik@pengutronix.de>
 <YaoTpQ0nNa+sUQ/y@kroah.com>
 <20211205214958.GB31430@pengutronix.de>
 <Ya28+RJGvqT8s8nw@kroah.com>
 <Ya3+xr8Z4P25l5My@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
In-Reply-To: <Ya3+xr8Z4P25l5My@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:28:42 up 291 days, 16:52, 149 users,  load average: 0.10, 0.17,
 0.18
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 06, 2021 at 02:15:02PM +0200, Laurent Pinchart wrote:
>Hello,
>
>On Mon, Dec 06, 2021 at 08:34:17AM +0100, Greg KH wrote:
>> On Sun, Dec 05, 2021 at 10:49:58PM +0100, Michael Grzeschik wrote:
>> > On Fri, Dec 03, 2021 at 01:55:01PM +0100, Greg KH wrote:
>> > > On Thu, Dec 02, 2021 at 01:58:52AM +0100, Michael Grzeschik wrote:
>> > > > Preparing the usb request is not very expensive, when using
>> > > > scatter gather. In that case we can even remove the overhead
>> > > > of the extra pump worker and call the pump function directly.
>> > > >
>> > > > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> > > > ---
>> > > >  drivers/usb/gadget/function/uvc_v4l2.c  |  8 +++++--
>> > > >  drivers/usb/gadget/function/uvc_video.c | 28 +++++++++++++++++++-=
-----
>> > > >  drivers/usb/gadget/function/uvc_video.h |  2 ++
>> > > >  3 files changed, 30 insertions(+), 8 deletions(-)
>> > > >
>> > > > diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/=
gadget/function/uvc_v4l2.c
>> > > > index a2c78690c5c288..020b4adc7840e0 100644
>> > > > --- a/drivers/usb/gadget/function/uvc_v4l2.c
>> > > > +++ b/drivers/usb/gadget/function/uvc_v4l2.c
>> > > > @@ -169,8 +169,12 @@ uvc_v4l2_qbuf(struct file *file, void *fh, st=
ruct v4l2_buffer *b)
>> > > >  	if (ret < 0)
>> > > >  		return ret;
>> > > >
>> > > > -	if (uvc->state =3D=3D UVC_STATE_STREAMING)
>> > > > -		schedule_work(&video->pump);
>> > > > +	if (uvc->state =3D=3D UVC_STATE_STREAMING) {
>> > > > +		if (!video->queue.use_sg)
>> > > > +			schedule_work(&video->pump);
>> > > > +		else
>> > > > +			uvcg_video_pump(video);
>> > >
>> > > Wouldn't it be easier to understand this if you flip the if test aro=
und:
>> > > 		if (video->queue.use_sg)
>> > > 			uvcg_video_pump(video);
>> > > 		else
>> > > 			schedule_work(&video->pump);
>> > > ?
>> > >
>> > > Negagive logic is never fun to read...
>> >
>> > Yes, you are not wrong.
>> >
>> > > Also, are you sure that sg really is not expensive on all systems?  =
What
>> > > did you test this on, and what was the results?
>> >
>> > I tested it on an zynqmp arm64 machine. I tried to test the sg case on
>> > an 32 bit IMX with chipidea, but the driver was complaining a lot about
>> > "not page aligned sg buffers". So if needed, I would first need to find
>> > a working machine to compare this with.
>> >
>> > However I would think that assigning some pointers on a scatterlist
>> > instead of doing memcpy of 1024 bytes should be less expensive.
>>
>> Not true on many systems, memcpy can be _very_ fast, especially for
>> small amounts like 1024 bytes.  So please, measure this to be sure.
>
>We've moved memcpy()s to a work queue in the host UVC driver for
>high-bandwidth devices, which brough massive performance improvements
>(if I recall correctly, at least partly due to the parallelization of
>memcpy operations). I'm not sure we have measured performances in the
>gadget driver with the same level of accuracy and care though.
>
>Michael, do you plan to make measurements ?

I would do it, but only if I can find time and hardware to test it on.
For now, my agenda says to get the other patches mainline first. So yes,
but only in some later undefined time.

Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmGuEGEACgkQC+njFXoe
LGTrIQ/5AZtbI5xTKejXzwArg4Iy5ABtvI/NBMnaSWOHRQ9QoA0nCi77if4947T6
D5FeHP30NEtzq0i78w/tRrKvlWII8398fmfMreQlYfQjq23B8oQbSp1eroaLURVt
aTMa8EbDqwqI2z2ygcK0W3toqWz8p0UWudON6aFQ2Srl/6kvYM+4GvvmRfZq1itw
hM/6Vm7momrRX9eV9WSG5Y5P9fG3tKEcHdX569H9rKLJ24HQfT8GYiRhUw96dbXr
PZqpTaikWV4yrzn/X6GH/IxZdMX1BrB4hPPdi/Iw6So+daP+vfMm3LFajUAyYzSc
CSu0rWCviUt2GT+AfFFw82BvmuwfUMNQmJRwHNNyD6C0OvBLhDTnTMjiQ5IGA3zg
xAen0aA03w47TJgHgFqvOe3bT+MrpOUcQKr1nEe/dnFQy9IO5vMoZyH0eIKrDWis
7Tn7t2xD6sPL/Ul/FifH/NOyeyWQSc24KLP6zCDUnexlDXnNOyj+UCQy4Fi5Wxca
BJepWF65b9lWA+H4lnV9XvZmbXN88hP/1Q1Yzlb3a43GQUGm/I5RUnQWb8T6R+ag
g9bNOHhU3SbU/w/FKWtR98HKrwByX9G/8a3vQIirCTJWph/abNKg/tVuNaOIQRur
Kwg/9/BfSkKra5dL+cfqhtRtlye4gCvX2OrYpEb7Y1J8saUyHhk=
=ubxr
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
