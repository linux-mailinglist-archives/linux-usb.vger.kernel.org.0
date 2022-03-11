Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77AF54D6886
	for <lists+linux-usb@lfdr.de>; Fri, 11 Mar 2022 19:38:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345760AbiCKSjE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Mar 2022 13:39:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350957AbiCKSjC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Mar 2022 13:39:02 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA41127572
        for <linux-usb@vger.kernel.org>; Fri, 11 Mar 2022 10:37:49 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nSk95-0004gs-Q8; Fri, 11 Mar 2022 19:37:47 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nSk94-0004U3-Ue; Fri, 11 Mar 2022 19:37:46 +0100
Date:   Fri, 11 Mar 2022 19:37:46 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     paul.elder@ideasonboard.com
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 1/2] usb: gadget: uvc: clean and rename
 uvcg_queue_next_buffer to uvcg_complete_buffer
Message-ID: <20220311183746.GB23776@pengutronix.de>
References: <20220228141659.775302-1-m.grzeschik@pengutronix.de>
 <20220311070444.GC1046627@pyrite.rasen.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Content-Disposition: inline
In-Reply-To: <20220311070444.GC1046627@pyrite.rasen.tech>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 19:33:49 up 91 days,  3:19, 78 users,  load average: 0.01, 0.06,
 0.08
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 11, 2022 at 04:04:44PM +0900, paul.elder@ideasonboard.com wrote:
>Thanks for the patch.
>
>On Mon, Feb 28, 2022 at 03:16:58PM +0100, Michael Grzeschik wrote:
>> The functions purpose is different to its name. We change the function
>> name and remove all unused code.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> ---
>>  drivers/usb/gadget/function/uvc_queue.c | 18 +-----------------
>>  drivers/usb/gadget/function/uvc_queue.h |  2 +-
>>  drivers/usb/gadget/function/uvc_video.c |  6 +++---
>>  3 files changed, 5 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadge=
t/function/uvc_queue.c
>> index d852ac9e47e72c..73ff56043d2e6a 100644
>> --- a/drivers/usb/gadget/function/uvc_queue.c
>> +++ b/drivers/usb/gadget/function/uvc_queue.c
>> @@ -326,24 +326,10 @@ int uvcg_queue_enable(struct uvc_video_queue *queu=
e, int enable)
>>  }
>>
>>  /* called with &queue_irqlock held.. */
>> -struct uvc_buffer *uvcg_queue_next_buffer(struct uvc_video_queue *queue,
>> +void uvcg_complete_buffer(struct uvc_video_queue *queue,
>>  					  struct uvc_buffer *buf)
>>  {
>> -	struct uvc_buffer *nextbuf;
>> -
>> -	if ((queue->flags & UVC_QUEUE_DROP_INCOMPLETE) &&
>> -	     buf->length !=3D buf->bytesused) {
>> -		buf->state =3D UVC_BUF_STATE_QUEUED;
>> -		vb2_set_plane_payload(&buf->buf.vb2_buf, 0, 0);
>> -		return buf;
>> -	}
>> -
>>  	list_del(&buf->queue);
>> -	if (!list_empty(&queue->irqqueue))
>> -		nextbuf =3D list_first_entry(&queue->irqqueue, struct uvc_buffer,
>> -					   queue);
>> -	else
>> -		nextbuf =3D NULL;
>
>Is it fine to drop these? They look important to me. If they're not,
>then the reason should be explained in the commit message.

As UVC_QUEUE_DROP_INCOMPLETE is not used anywhere in the whole gadget,
removing it should be save. However this should probably be handled in
an extra patch before.

The pulling of nextbuf from the irequeue is done only to handover the
next_buffer like the functions purpose actually was intended for. Since
the function does not do this anymore, we can savely remove the code.

I will improve the description in v2.

>>
>>  	buf->buf.field =3D V4L2_FIELD_NONE;
>>  	buf->buf.sequence =3D queue->sequence++;
>> @@ -351,8 +337,6 @@ struct uvc_buffer *uvcg_queue_next_buffer(struct uvc=
_video_queue *queue,
>>
>>  	vb2_set_plane_payload(&buf->buf.vb2_buf, 0, buf->bytesused);
>>  	vb2_buffer_done(&buf->buf.vb2_buf, VB2_BUF_STATE_DONE);
>> -
>> -	return nextbuf;
>
>This looks fine since all callers ignore it anyway.

Right, and beacause of that the above list_first_entry assignment can be
dropped.

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmIrlvgACgkQC+njFXoe
LGTwZw/+MuE0Zs8FVlrc7TYF0mQkW2mdZ3fgtKst7tFhP8sMjbH6qPwalEvP1DVC
Xh/mRa+tktTx+SmBmIh0gf2y0Hr+MV/7NPnO1w5PK3gKpxUVZApK7dz5hDkiYs5r
kx0FmezPo8L0VS2+o4VOE/gtoi+hicyjUxcFBFyIncw7iBANqRfECnFq91IMQ7fi
MHtRh2nyQopIXnOfTVLeVhTfFwZIbzdv2dnlSBwZdxVwNFLpt9szOfCHKr6C3LWd
+YMxO031iHkIup0nOxAIVipTTSHS2Ff+73pYpOECoutdXEuAeyxY+SA+p0UxmE0l
i0VHn39LnCOhnCDnpl6baiXA6/nIyILwv+qUOUfoNnUGsJ9awWtP6fusNfacJA0r
WqRngoeG8lZPdQqCaZUjRN5ZXOKoUZK9HjcK3+YzZnbKgzpxNmCjRO9bUHMwvjAd
fhyet/IGfIcZM0ujPKAjJ90pNVXh9tQgQLWsVAzu9gxY8n2N5EDJqL6UqsImFEjg
NiLDS2xLXHH7iwKLCkpB/XR6zV1lQDUeUgnPhpJWivy9txpRKFEQRn4ofe7HmwFm
oOQnNjo7MUS5xrSckl6f4h8yXs3W7YuBuV+75r3etQhdqcPjhfJ7srVOjbkMZfxq
+f36mHr1tl+eqtyJgALYxN1r/aQ6FXidxLfdtmKrN6qvKUH7oMQ=
=nBxq
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--
