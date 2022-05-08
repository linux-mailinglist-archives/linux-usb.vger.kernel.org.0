Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09B8C51F1F5
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 00:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233373AbiEHWwl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 8 May 2022 18:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbiEHWwj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 8 May 2022 18:52:39 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD8523896
        for <linux-usb@vger.kernel.org>; Sun,  8 May 2022 15:48:47 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nnphl-0002uI-J1; Mon, 09 May 2022 00:48:45 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nnphj-0001Bd-Mc; Mon, 09 May 2022 00:48:43 +0200
Date:   Mon, 9 May 2022 00:48:43 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 2/5] usb: gadget: uvc: calculate the number of request
 depending on framesize
Message-ID: <20220508224843.GA22426@pengutronix.de>
References: <20220402233914.3625405-1-m.grzeschik@pengutronix.de>
 <20220402233914.3625405-3-m.grzeschik@pengutronix.de>
 <Yl8ftLtM4hOIVf/s@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline
In-Reply-To: <Yl8ftLtM4hOIVf/s@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 00:17:37 up 39 days, 10:47, 56 users,  load average: 0.03, 0.08,
 0.11
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


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Tue, Apr 19, 2022 at 11:46:44PM +0300, Laurent Pinchart wrote:
>Thank you for the patch.
>
>On Sun, Apr 03, 2022 at 01:39:11AM +0200, Michael Grzeschik wrote:
>> The current limitation of possible number of requests being handled is
>> dependent on the gadget speed. It makes more sense to depend on the
>> typical frame size when calculating the number of requests. This patch
>> is changing this and is using the previous limits as boundaries for
>> reasonable minimum and maximum number of requests.
>
>What are typical values you get for the number of requests in your use
>cases with this change ?

With this patch, for a 4k Video stream I get usually sizes of 3127808
bytes and 64 requests. With 1080p sizes is 800768 bytes and with this
patch I get 56 request.

>Could you mention them in the commit message ?

Yes, I will add them in the comment of v2.

>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> ---
>>  drivers/usb/gadget/function/uvc_queue.c | 15 ++++++++++-----
>>  1 file changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadge=
t/function/uvc_queue.c
>> index cfa0ac4adb04d5..2a091cf07981e1 100644
>> --- a/drivers/usb/gadget/function/uvc_queue.c
>> +++ b/drivers/usb/gadget/function/uvc_queue.c
>> @@ -44,7 +44,8 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>>  {
>>  	struct uvc_video_queue *queue =3D vb2_get_drv_priv(vq);
>>  	struct uvc_video *video =3D container_of(queue, struct uvc_video, queu=
e);
>> -	struct usb_composite_dev *cdev =3D video->uvc->func.config->cdev;
>> +	unsigned int req_size;
>> +	unsigned int nreq;
>>
>>  	if (*nbuffers > UVC_MAX_VIDEO_BUFFERS)
>>  		*nbuffers =3D UVC_MAX_VIDEO_BUFFERS;
>> @@ -53,10 +54,14 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>>
>>  	sizes[0] =3D video->imagesize;
>>
>> -	if (cdev->gadget->speed < USB_SPEED_SUPER)
>> -		video->uvc_num_requests =3D 4;
>> -	else
>> -		video->uvc_num_requests =3D 64;
>> +	req_size =3D video->ep->maxpacket
>> +		 * max_t(unsigned int, video->ep->maxburst, 1)
>> +		 * (video->ep->mult);
>> +
>> +	nreq =3D DIV_ROUND_UP(DIV_ROUND_UP(sizes[0], 2), req_size);
>
>Where does the division by 2 come from ?

That is a good question. I think that I used it as a tool to
come into the range inbetween 4 and 64 requests for 1080p video
streaming. Since the framesizes where more likely to run into
the 64 requests to be allocated.

>> +	nreq =3D min_t(unsigned int, nreq, 64);
>> +	nreq =3D max_t(unsigned int, nreq, 4);
>
>You can use clamp():
>
>	video->uvc_num_requests =3D clamp(nreq, 4U, 64U);

Thanks! I fixed that for v2.

>> +	video->uvc_num_requests =3D nreq;
>>
>>  	return 0;
>>  }

Regards,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmJ4SMcACgkQC+njFXoe
LGTm4xAAjvFldAhTOXhlxxEMqwWaoperDW+p9VMIT69pMcoO+UC40WZ73uZQwQ1Y
xaueHJncopQxd7AP767uJ85GgIw76/qdRg+R9IPrH3wdXFrpblVoE1m26o69wRRf
qcC4e/eiS8ynOD1HYbdnUYL9WO6PLd0Ywb6O7rG945989j4CmFskIZfkvyhGUwJT
DHaaO8uMpxKWaNQI4zP9Hg4AtgFGtc/COOyMsCpKqOzYiIyv9cn3KjMQAqVWlT8k
2GTP5309MPBzw6ZjyA4p2u+teOhlZyIR8bncnI8gPk623yVjVdlzmoV/rzhI38E7
fTSiQ/sDcv0CXciW4lsvHWHyLFYV+aPALEj4F+xxkGl7B6FX9isxAQQ3JozIr0Ln
9USKlfSdJ+xw7gvaHK+srIbH30G/MR4on8bx0RvYV4Ln0rGq0ejqJgyEOPTLPV6J
eP6fSBSigVhGTF/hkljUoGQthCqMfRUxwlwtCV4Ut/yhrJddAIOZHhITzu/OI0Qn
MDtQM7woW1yTceOw3AmV66KW8M4slXgEihbw+AhEzqeIaehwokJKuviRUKADwISQ
m3BZxTN0T0xP/C2Tww3Fjw1B/tT/MwOJpq7IWDNfqOqPDe0ichZQJMdCMciMAwcz
z7E9rW3qX6GzYVVfhR/aIiTUvrtdB85UuD8ffKgD/nl7oMuSJ3Y=
=70cw
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
