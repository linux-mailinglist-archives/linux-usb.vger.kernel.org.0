Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFF1F468D7F
	for <lists+linux-usb@lfdr.de>; Sun,  5 Dec 2021 22:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239450AbhLEVxc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Dec 2021 16:53:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232165AbhLEVxc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 5 Dec 2021 16:53:32 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D759C061714
        for <linux-usb@vger.kernel.org>; Sun,  5 Dec 2021 13:50:04 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mtzOS-0008US-5X; Sun, 05 Dec 2021 22:50:00 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mtzOQ-0005fR-WB; Sun, 05 Dec 2021 22:49:58 +0100
Date:   Sun, 5 Dec 2021 22:49:58 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Greg KH <greg@kroah.com>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, paul.elder@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: gadget: uvc: use pump call conditionally
Message-ID: <20211205214958.GB31430@pengutronix.de>
References: <20211202005852.3538102-1-m.grzeschik@pengutronix.de>
 <YaoTpQ0nNa+sUQ/y@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+g7M9IMkV8truYOl"
Content-Disposition: inline
In-Reply-To: <YaoTpQ0nNa+sUQ/y@kroah.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 22:31:26 up 291 days, 55 min, 130 users,  load average: 0.42, 0.21,
 0.16
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--+g7M9IMkV8truYOl
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 03, 2021 at 01:55:01PM +0100, Greg KH wrote:
>On Thu, Dec 02, 2021 at 01:58:52AM +0100, Michael Grzeschik wrote:
>> Preparing the usb request is not very expensive, when using
>> scatter gather. In that case we can even remove the overhead
>> of the extra pump worker and call the pump function directly.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> ---
>>  drivers/usb/gadget/function/uvc_v4l2.c  |  8 +++++--
>>  drivers/usb/gadget/function/uvc_video.c | 28 +++++++++++++++++++------
>>  drivers/usb/gadget/function/uvc_video.h |  2 ++
>>  3 files changed, 30 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget=
/function/uvc_v4l2.c
>> index a2c78690c5c288..020b4adc7840e0 100644
>> --- a/drivers/usb/gadget/function/uvc_v4l2.c
>> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
>> @@ -169,8 +169,12 @@ uvc_v4l2_qbuf(struct file *file, void *fh, struct v=
4l2_buffer *b)
>>  	if (ret < 0)
>>  		return ret;
>>
>> -	if (uvc->state =3D=3D UVC_STATE_STREAMING)
>> -		schedule_work(&video->pump);
>> +	if (uvc->state =3D=3D UVC_STATE_STREAMING) {
>> +		if (!video->queue.use_sg)
>> +			schedule_work(&video->pump);
>> +		else
>> +			uvcg_video_pump(video);
>
>Wouldn't it be easier to understand this if you flip the if test around:
>		if (video->queue.use_sg)
>			uvcg_video_pump(video);
>		else
>			schedule_work(&video->pump);
>?
>
>Negagive logic is never fun to read...

Yes, you are not wrong.

>Also, are you sure that sg really is not expensive on all systems?  What
>did you test this on, and what was the results?

I tested it on an zynqmp arm64 machine. I tried to test the sg case on
an 32 bit IMX with chipidea, but the driver was complaining a lot about
"not page aligned sg buffers". So if needed, I would first need to find
a working machine to compare this with.

However I would think that assigning some pointers on a scatterlist
instead of doing memcpy of 1024 bytes should be less expensive.

Regards,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--+g7M9IMkV8truYOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmGtNAIACgkQC+njFXoe
LGT+ZhAAmhoEx7d5QzLJng6SDYRh8TTrr4bDZCm3MEBv4Hip0Y0iy5TJZ+8vEKyd
bkGKI4ZEFYXwOLN5lygu73blsNFu7uDbodnchuKZNIvL8P8HUwVnDsClb9Qe83Vy
RtvA80mWU9EkXMnmDRMXhXwnWDFt7kRxaQd20MY03lf7qs4yDe1zwkjpnLG1S1bI
glXZdeY4lqmiPpzLleAO2XgNL4b8Xvyq4CtGdB/cYNoDO216xgSafZ0VBn87oWSp
bg1u8lx3Hlt9aMSYfnA3v1rTZz9uDX9Fy1gc+7CHI0TGJxmcssBwZBy8RuUWJ/4E
KXb9jAzGOSh3IWSbzOqmOSCadsgGtYLECTF0+09wBZgSwY/5hloyCISAoRMBfQh7
jPQO07Pq+g3W2cOLPxNKDa6DwmUrx6l/DdaPTD3BlW2djDfeh9jVNCAfaDObygxR
z0poXiRBot1TlI8v/xQHCzRT5unfG8oGwGyUTVprLbBJOAtmn85cw6XdCK6oxiTD
v9HB1IKN5dKuziQg2H6iY+LyCzkJnrIt99ywCyY7dmWspLE8Ed5CVfcHWqWQqvNg
L5WzU7H3zVBNg8epNLqwKPuzPj6zeRCYeevcailjYbSZnLQlkTXME7H5xi4EN3iK
AvDF6mda9lOMdC7Epua/yYGvtDondSCB91FfczqafrUVCVEYwQI=
=lyDt
-----END PGP SIGNATURE-----

--+g7M9IMkV8truYOl--
