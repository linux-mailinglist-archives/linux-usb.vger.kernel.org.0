Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D46E936E520
	for <lists+linux-usb@lfdr.de>; Thu, 29 Apr 2021 08:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237501AbhD2Gwi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Apr 2021 02:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237222AbhD2Gwi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Apr 2021 02:52:38 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 597F4C06138B
        for <linux-usb@vger.kernel.org>; Wed, 28 Apr 2021 23:51:52 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lc0Wa-0002fe-B4; Thu, 29 Apr 2021 08:51:48 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lc0WZ-0002A5-8O; Thu, 29 Apr 2021 08:51:47 +0200
Date:   Thu, 29 Apr 2021 08:51:47 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 2/2] dwc3: gadget: fix tracking of used sgs in request
Message-ID: <20210429065147.GA31996@pengutronix.de>
References: <20210423131807.GE6975@pengutronix.de>
 <87k0osksgo.fsf@kernel.org>
 <20210424091206.GF6975@pengutronix.de>
 <87eeezlrvm.fsf@kernel.org>
 <68ae9066-b349-ba70-59c6-c2388b386b66@synopsys.com>
 <50e13b71-bdc1-6279-a224-bfc99cf10dc8@synopsys.com>
 <20210427201232.GG6975@pengutronix.de>
 <144ed647-86f3-3aee-8ea5-2c8e4d02e2f9@synopsys.com>
 <20210428073756.GH6975@pengutronix.de>
 <04126a67-136d-41ee-dc21-b46eaeb7ba19@synopsys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
In-Reply-To: <04126a67-136d-41ee-dc21-b46eaeb7ba19@synopsys.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:43:42 up 70 days, 10:07, 75 users,  load average: 0.18, 0.11,
 0.14
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 11:25:05PM +0000, Thinh Nguyen wrote:
>Michael Grzeschik wrote:
>> Hi Thinh,
>>
>> On Wed, Apr 28, 2021 at 01:45:11AM +0000, Thinh Nguyen wrote:
>>> Michael Grzeschik wrote:
>>>> On Tue, Apr 27, 2021 at 03:18:57AM +0000, Thinh Nguyen wrote:
>>>>> Hi Michael,
>>>>>
>>>>> Thinh Nguyen wrote:
>>>>>> Felipe Balbi wrote:
>>>>>>>
>>>>>>> HI,
>>>>>>>
>>>>>>> Michael Grzeschik <mgr@pengutronix.de> writes:
>>>>>>>
>>>>>>> <big snip>
>>>>>>>
>>>>>
>>>>>
>>>>> <bigger snip>
>>>>>
>>>>>
>>>>>> I think I see the issue that Michael reported.
>>>>>>
>>>>>> The problem is that we're using num_pending_sgs to track both
>>>>>> pending SG
>>>>>> entries and queued SG entries. num_pending_sgs doesn't get updated
>>>>>> until
>>>>>> TRB completion interrupt (ie XferInProgress). Before the driver queu=
es
>>>>>> more SG requests, it will check if there's any pending SG in the
>>>>>> started
>>>>>> request list before it prepares more. Since the num_pending_sgs
>>>>>> doesn't
>>>>>> get updated until the request is completed, the driver doesn't proce=
ss
>>>>>> more until the request is completed.
>>>>>>
>>>>>> I need to review more on Michael's patches next week, but I think wh=
at
>>>>>> he suggested makes sense (in term of properly usage of queued sgs vs
>>>>>> pending sgs). BTW, please correct me if I'm wrong, but we do modify
>>>>>> num_queued_sgs.
>>>>>>
>>>>>
>>>>> There's still some issue with your patch. I think this should cover i=
t.
>>>>> Let me know if it works for you.
>>>>
>>>> This works for me! Will you spin a proper patch from that?
>>>
>>> Sure. I can do that after 5.13-rc1 is released
>>
>> Great!
>>
>>>>
>>>>> Note: this however probably needs more "Tested-by" and reviews
>>>>> to make sure I'm not missing anything. I only ran some basic tests,
>>>>> and will need to run more.
>>>>
>>>> You may already have mine:
>>>>
>>>> Tested-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>>>
>>>>> Let me know if this makes sense.
>>>>
>>>> From what I understand about the issue and the purpose of all
>>>> variables this makes total sense to me. So thanks for taking over
>>>> and make a proper solution.
>>>>
>>>> Thanks,
>>>> Michael
>>>>
>>>
>>> Thanks for the Tested-by.
>>>
>>> Btw, any reason for using SG with transfer less than PAGE_SIZE? I assume
>>> your platform is 4KB, but you're splitting your 3KB transfer to smaller.
>>> Was it like this before? Note that DWC3 has a limited number of internal
>>> TRB cache. But what you're doing now is fine and doesn't impact
>>> performance.
>>
>> It all comes from the limitation of the uvc_video gadget. Look into the
>> patches I send to support sg in uvc_video driver. It just maps entries
>> from an sg list comming from videobuf2 to an req->sg list. In
>> uvc_video_alloc_requests the req->length will be set to req_size which
>> is calculated with:
>>
>> =A0ep->maxpacket(1024) * maxburst(1-15) * mult(1-3)
>>
>> With maxburst =3D 1 and mult =3D 3 it currently reults in an req->length=
 of:
>>
>> =A01024 * 1 * 3 =3D 3072
>
>I wasn't referring to this, I was just wondering why uvc uses SG.
>Correct me if I'm wrong, but isn't uvc allocates and uses contiguous
>buffer?

Not necessarily. Depending on the source creating vb2 buffers with mmu
enabled or directly you may get different patterns. The patches I send
are able to also handle contiguous buffers. In that case vb2 would just
hand over a scatter list with one big entry, which would be totally fine.
In that case we would not have to scatter it for the gadget controller.

>Depend on the setup, normal request may show better performance.

Right. In my setup the data is coming from an mmu.

>> This request will use one extra sg created from the uvc driver adding
>> a header of 2 bytes per request and then has 3070 bytes left for the
>> payload which will look into the vb2 sg list and increment every sg
>> entrie with the the used offset until it reaches sg page boundaries
>> and in that case will have to add one extra sg.
>>
>> So this results in the funny patterns you see.
>>
>> We can increase the req->length to 46080 with a maxburst of 15 for usb3
>> but I did not try that out yet.
>>
>
>I wouldn't recommend that. Unless you know you're using both DWC3x
>device and host, most other controllers we know cannot handle high isoc
>throughput, especially at bInterval=3D1.

Right. I think Felipe mentioned that as well.

As the parameters are possible to tweak from userspace this is all fine.
The user just will have to find the compromise between performance and
stability.

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmCKV4AACgkQC+njFXoe
LGR5jw/+LKTL7cEhDG9EdppRAY4fet3v+rqoMBmynbZIZT/b7bt2EdIRvQapYDVL
sXqNpvXtwXZXS0uUf6BORyde30WK9oLK2/b0lJvWanRpgJKp7TP+GMQVDsOrU83r
+SdiZJwf54RrujRe9KkADEGmLEANoh3jVZrldSDWlyWC2a2t/MPOr6WrDBo5D/Ic
M1/njH3JL78DF11NTTvQIXF+xtQ35zSj22Zohf8Cb0qr6GBd1+2M8Cm0pqWK4nHy
UK877+RgWACmmevlCOIOLMLsr/mWe1TP+pYoJiihrT1fW0i1mfkwCIxLNf0s6Q1o
pAg9gUFxfibRrICw/j4KfaWy688diPHNUm1QSfPKX/rTjYCDedxiisWL8tmuLlWl
NvynWskiEnplIPKC18gNaytKPoBAw5PAKIW/+Q42pjZ1fA3ECroXQ0yuy0ILmHfK
LFe7y1rzeZvBaQ37pwIKyv06tw7rKpuDS5AIZIZ+l5xquI7U4UqQpeLpyWOcSj4a
Si9nVju4ggv6SnQgsFQ3oE0VGxQfHrWIoxHrO5wwHVTYXaKUPPCpKW3VRrKxakKq
HaBrSYugWG5fm2OG6VMH+0Iqttq3U4W814v2N6+LtdGCDZPUJAvhMY3I8Y9y95yw
OyIEgmEB54qmK2oGbfAkTU08yHPL4BO0VI5Lz4JSclO9nyZ8tlM=
=05cp
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
