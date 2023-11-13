Return-Path: <linux-usb+bounces-2811-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7057E97FB
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 09:44:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FC5EB20968
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 08:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF8615AD6;
	Mon, 13 Nov 2023 08:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97A2168A9
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 08:43:53 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1336C7
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 00:43:51 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mgr@pengutronix.de>)
	id 1r2SXu-0002IH-De; Mon, 13 Nov 2023 09:43:50 +0100
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1r2SXt-008gwc-4G; Mon, 13 Nov 2023 09:43:49 +0100
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1r2SXs-003kxc-R9; Mon, 13 Nov 2023 09:43:48 +0100
Date: Mon, 13 Nov 2023 09:43:48 +0100
From: Michael Grzeschik <mgr@pengutronix.de>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH] usb: gadget: uvc: reduce the request size to increase
 the throughput
Message-ID: <ZVHhxJWkesokGU3o@pengutronix.de>
References: <20231031231841.dbhtrgqounu2rvgn@synopsys.com>
 <20231109233341.2461129-1-m.grzeschik@pengutronix.de>
 <20231110021655.cgj2lk62p4ez7zhp@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PNo2GoNH3ugTvfde"
Content-Disposition: inline
In-Reply-To: <20231110021655.cgj2lk62p4ez7zhp@synopsys.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org


--PNo2GoNH3ugTvfde
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 02:16:59AM +0000, Thinh Nguyen wrote:
>On Fri, Nov 10, 2023, Michael Grzeschik wrote:
>> One misconception of queueing request to the usb gadget controller is,
>> that the amount of data that one usb_request is representing is the same
>> as the hardware is able to transfer in one interval.
>>
>> This exact idea applies to the uvc_video gadget that assumes that the
>> request needs to have the size as the gadgets bandwidth parameters are
>> configured with. (maxpacket, multiplier and burst)
>>
>> Although it is actually no problem for the hardware to queue a big
>> request, in the case of isochronous transfers it is impractical to queue
>> big amount of data per request to the hardware. Especially if the
>> necessary bandwidth was increased on purpose to maintain high amounts of
>> data.
>>
>> E.g. in the dwc3-controller it has the negative impact that the endpoint
>> FIFO will not be filled fast enough by the internal hardware engine.
>> Since each transfer buffer (TRB) represents one big request, the
>> hardware will need a long time to prefill the hardware FIFO. This can be
>> avoided by queueing more smaller requests which will then lead to
>> smaller TRBs which the hardware engine can keep up with.
>
>Just want to clarify here to avoid any confusion, the hardware TX FIFO
>size is relatively small, usually can be smaller than the TRB. It should
>be fine whether the TRB is larger or smaller than the FIFO size. The
>hardware does not "prefill" the FIFO. It just fills whichever TRB it's
>currently processing (I think you may be mixing up with TRB cache).

What I see is, that by using bigger TRBs the hardware is not able
to keep up with reading from the memory when the system is under
heavy memory pressure. This is the main reason for this change.

Since we found out that increasing the FIFO size had an effect to how
high we are able to set the hardware endpoint configuration on our
gadget side (params.param0), until we saw the issue reoccur.

So the Idea here was to have a tweak on how the hardware handles the
data from the memory to the Hardware-FIFO which seems not to underrun
with smaller TRBs.

>The performance impact from this change is to reduce the USB bandwidth
>usage. The current calculation in uvc function can use 48KB/uframe for
>each request in SuperSpeed, the max size for isoc in SuperSpeed. I know
>many hosts can't handle this kind of transfer rate from their hardware.
>(e.g. It gets worse when scheduling transfers for multiple endpoints and
>under multiple tier hubs).

I think I don't fully understand here.

We change the overall buffersize of the usb_request and therefor limit
the size of possible TRBs. This should even only have most effect on the
trbsize for the memcopy path, since the scatter gather requests are
already split into multiple trbs which is capped to the maximum mappable
memory range of PAGE_SIZE (4k).

Other then that, the parameterization of the endpoint on our gadget side
is not changed by this patch. The endpoint configuration is set as follows:

params.param0 |=3D DWC3_DEPCFG_BURST_SIZE(burst - 1) |
                  DWC3_DEPCFG_MAX_PACKET_SIZE(usb_endpoint_maxp(desc));

So by changing the request_size there should not be any other change in the
gadget side hardware configuration.

How is the overall bandwidth usage affected by this change then other
than we have more smaller potential trbs in the queue.

If the Intervallength is not coupled to the amount of to be transfered
TRBs in any case, it should not have an effect to the bandwidth.

If I am mistaken here, can you point me to some code?

>The bandwidth can be impacted by multiple factors and not just from the
>gadget side as noted in the discussion before.

Right.

>> This patch is simply dropping the maxburst as an multiplier for the size
>> calculation and therefor decreases the overall maximum request size.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> ---
>> This patch is created as an result from the discussion in the following =
thread:
>>
>> https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/2023103123=
1841.dbhtrgqounu2rvgn@synopsys.com/__;!!A4F2R9G_pg!fTaIo4tDljSbEvUY5SZLkNvK=
Wcz0YeN0Ekzs0CPWyD73RGRmErRC2frODFgnMB1M4Nse0oKKgwxC65gePhGAtauKJq1Vnzlj$
>>
>>  drivers/usb/gadget/function/uvc_queue.c | 1 -
>>  drivers/usb/gadget/function/uvc_video.c | 1 -
>>  2 files changed, 2 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadge=
t/function/uvc_queue.c
>> index 0aa3d7e1f3cc32..1d3c3c09ff97cb 100644
>> --- a/drivers/usb/gadget/function/uvc_queue.c
>> +++ b/drivers/usb/gadget/function/uvc_queue.c
>> @@ -55,7 +55,6 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>>  	sizes[0] =3D video->imagesize;
>>
>>  	req_size =3D video->ep->maxpacket
>> -		 * max_t(unsigned int, video->ep->maxburst, 1)
>
>I think you're reducing a bit too much here? Also, take advantage of
>burst. So, perhaps keep request size to max(16K, MPS * maxburst)?
>
>Can be more or less depending on how much video data is needed to
>transfer over a video frame.
>
>BR,
>Thinh
>
>>  		 * (video->ep->mult);
>>
>>  	/* We divide by two, to increase the chance to run
>> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadge=
t/function/uvc_video.c
>> index 91af3b1ef0d412..c6b61843bad3d7 100644
>> --- a/drivers/usb/gadget/function/uvc_video.c
>> +++ b/drivers/usb/gadget/function/uvc_video.c
>> @@ -329,7 +329,6 @@ uvc_video_alloc_requests(struct uvc_video *video)
>>  	BUG_ON(video->req_size);
>>
>>  	req_size =3D video->ep->maxpacket
>> -		 * max_t(unsigned int, video->ep->maxburst, 1)
>>  		 * (video->ep->mult);
>>
>>  	video->ureq =3D kcalloc(video->uvc_num_requests, sizeof(struct uvc_req=
uest), GFP_KERNEL);
>> --
>> 2.39.2
>>
>>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--PNo2GoNH3ugTvfde
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmVR4cIACgkQC+njFXoe
LGQCKA//e+VBMTyWNOPLOGjjNZgLTvTQ5aFeOW/DM1En3utjProcFbswT322Bh3D
C6BfcAyCh43wDMdJyMDJGIC4QmUhZ/+cYxmAypluZnCnz9ZDgzVNnueVgEmfcyu6
OBSpsPmdOvNGSz985ypY5a5+JlIhrY8EO7KczoenfDpVa5NikVNcRv1jMhuATa4z
+JdwTxLmFdh2ljMn0+1niX8OG6SRqt2NWS+39TOW2zEh7nLOPcq+cedBTPKz8m15
XwYeq0tJ+tRwXV1bO/25CVqK8rE5oYMWyV7xkilNAQghKSd1Lb/do3HGEW2euHeF
vezMGa4VUwYh3tT2m8XOgV1njZPoicgAiReKV9piAEkp7SRVRzfBnLUQRqG5wwVa
ZPB/cqoTfnG17a9u091zHijF8lW3MDyXEancPuph8JXloBV8aGhCjn4bwiZkf4sI
uECuy0je8o/h/9OvG36cPQI0vM8U1jdu5klM0LFVwGWBa/8N8jtJ4ruGxaCS9OKg
ybgmSN8CaU+LFVncO/QRfMLQHqVnlaoQzh7JaBjhxZo4/Kc0CUIRAhWWSHFKJTiN
tINURN1Gw/3Sa/x8YGnfThmjXa4pjQePVAZL2wF7+vPfVMea7d7TbbZj7PSA0W8N
Bxo3xIqNI8Dj7gJpyUhHh4piKpphqMjXjvTwhrTdk05Ee2tlg6Q=
=GWxZ
-----END PGP SIGNATURE-----

--PNo2GoNH3ugTvfde--

