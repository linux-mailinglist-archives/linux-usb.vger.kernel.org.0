Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0EFF1ECA33
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jun 2020 09:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgFCHKz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jun 2020 03:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgFCHKz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Jun 2020 03:10:55 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F78C05BD43
        for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2020 00:10:54 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id s1so1397317ljo.0
        for <linux-usb@vger.kernel.org>; Wed, 03 Jun 2020 00:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=A5KJfQO/lM6a9GlX3AQS56h1ed0amroSZdSU94hdRH8=;
        b=fjYALaUVl8UuzSCuFq1diL0PQlLm7k9+SOW1+VDQsZJnCgZb9whkZghhDCTE0+kUkB
         LcXd4nCkWJQdybUS1RSwDEW1Sxbl+a7d1S6XvuF+ZNAZZxhfzMYPcmkzdLjkRcTcOFPY
         y1CZU7Kfp2xlPvyGQxVdacmGS9JCvlW6nYJRD9IGTZ9BVgLgzOatjVhqT5y6q2rhfPHc
         lVpEGCG1Pu2bYoTs9Rs4ARuypVsVZq6SZPYSLZFxQnFbcI1DBgMPvsiOsdgXtYyO4uZ1
         SA4HauDWwY364pH1vYn6UAKYV+e79TrXv0RA0EXelwUbhUQP2+CFd4mm31iFXYoJWnYM
         H/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=A5KJfQO/lM6a9GlX3AQS56h1ed0amroSZdSU94hdRH8=;
        b=ttJ+GKGfJN2lNqwhoxGezjZQ88aGLSSL0gmXNoXUB2lQ+nryy4JEgGWrgnDWlwdTFO
         qSjQQ7oeveWvZ9Bp/XtweNlo9i0YtNo21TPxZj5ZKlf6lTbEuD+mhYzHvmpLUon0Cpoq
         zCxpYoyl56fx+KTPc7ldY2VBfqpeMCkmk8Tzu5o50w12ylFRuBueqNSggD5h6zW+2ImH
         RYJcCw3mZq3ilwMliyZh1AroG8o+EbFpo9gPKaRP7vNLbtl13+SYdAvBBTzJT7dUWGr5
         o0tWYt26SwFU/b8BJb8ISm50DUM2rg4u1hHOkiwoN7dFqoWX/l6PKmXoTRjmmYRGbpXc
         QQ4g==
X-Gm-Message-State: AOAM530zhDqerwkLf42jy57SmkHCk+uhyaR6LHgZ0uLO/RHD/HeKWwZr
        rUUysmBt/y8YyAzjz0v/1UO4yTRF9b0=
X-Google-Smtp-Source: ABdhPJwjnZ03YT1BUGtlTGrCyASj3ZyL9XcEjAOFnfo9zO5NL7x9Nd1azQ9SgGDRIv6j9WTOPshJ7g==
X-Received: by 2002:a05:651c:508:: with SMTP id o8mr1294150ljp.112.1591168253011;
        Wed, 03 Jun 2020 00:10:53 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id o4sm360151lff.78.2020.06.03.00.10.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jun 2020 00:10:51 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
        dri-devel@lists.freedesktop.org
Cc:     linux-usb@vger.kernel.org, sam@ravnborg.org
Subject: Re: [PATCH v3 6/6] usb: gadget: function: Add Generic USB Display support
In-Reply-To: <0d0ec3f5-4b9a-e128-5d50-9e7096b3f984@tronnes.org>
References: <20200529175643.46094-1-noralf@tronnes.org> <20200529175643.46094-7-noralf@tronnes.org> <87k10p1jr6.fsf@kernel.org> <0d0ec3f5-4b9a-e128-5d50-9e7096b3f984@tronnes.org>
Date:   Wed, 03 Jun 2020 10:10:47 +0300
Message-ID: <87h7vs1v60.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

Noralf Tr=C3=B8nnes <noralf@tronnes.org> writes:
>> I missed this completely until now.
>> Noralf Tr=C3=B8nnes <noralf@tronnes.org> writes:
>>> This adds the gadget side support for the Generic USB Display. It prese=
nts
>>> a DRM display device as a USB Display configured through configfs.
>>>
>>> The display is implemented as a vendor type USB interface with one bulk
>>> out endpoint. The protocol is implemented using control requests.
>>> lz4 compressed framebuffer data/pixels are sent over the bulk endpoint.
>>>
>>> The DRM part of the gadget is placed in the DRM subsystem since it reac=
hes
>>> into the DRM internals.
>>=20
>> First and foremost, could this be done in userspace using the raw gadget
>> or f_fs?
>>=20
>
> An uncompressed 1920x1080-RGB565 frame is ~4MB. All frames can be
> compressed (lz4) even if just a little, so this is decompressed into the
> framebuffer of the attached DRM device. AFAIU I would need to be able to
> mmap the received bulk buffer if I were to do this from userspace
> without killing performance. So it doesn't look like I can use raw
> gadget or f_fs.

oh, yeah we couldn't map that much. I was thinking that maybe we could
transfer several small buffers instead of a single large one, but
perhaps that would complicate decompression?

>>> diff --git a/drivers/usb/gadget/function/f_gud_drm.c b/drivers/usb/gadg=
et/function/f_gud_drm.c
>>> new file mode 100644
>>> index 000000000000..9a2d6bb9739f
>>> --- /dev/null
>>> +++ b/drivers/usb/gadget/function/f_gud_drm.c
>>> @@ -0,0 +1,678 @@
>>> +struct f_gud_drm {
>>> +	struct usb_function func;
>>> +	struct work_struct worker;
>>=20
>> why do you need a worker?
>>=20
>
> The gadget runs in interrupt context and I need to call into the DRM
> subsystem which can sleep.

At some point someone wanted to provide a patch to run endpoint giveback
routine in process context, much like usb host stack does if
requested. That's currently not implemented, but should be doable by
modifying usb_gadget_giveback_request().

>>> +	size_t max_buffer_size;
>>> +	void *ctrl_req_buf;
>>> +
>>> +	u8 interface_id;
>>> +	struct usb_request *ctrl_req;
>>> +
>>> +	struct usb_ep *bulk_ep;
>>> +	struct usb_request *bulk_req;
>>=20
>> single request? Don't you want to amortize the latency of
>> queue->complete by using a series of requests?
>>=20
>
> I use only one request per update or partial update.
> I kmalloc the biggest buffer I can get (default 4MB) and tell the host
> about this size. If a frame doesn't fit, the host splits it up into
> partial updates. I already support partial updates so this is built in.
> Userspace can tell the graphics driver which portion of the framebuffer
> it has touched to avoid sending the full frame each time.
> Having one continous buffer simplifies decompression.

got it

> There's a control request preceding the bulk request which tells the
> area the update is for and whether it is compressed or not.
> I did some testing to see if I should avoid the control request overhead
> for split updates, but it turns out that the bottleneck is the
> decompression. The control request is just 400-500us, while the total
> time from control request to buffer is decompressed is 50-100ms
> (depending on how well the frame compresses).

yeah, that makes sense.

>>> +	struct gud_drm_gadget *gdg;
>>> +
>>> +	spinlock_t lock; /* Protects the following members: */
>>> +	bool ctrl_pending;
>>> +	bool status_pending;
>>> +	bool bulk_pending;
>>> +	bool disable_pending;
>>=20
>> could this be a single u32 with #define'd flags? That would be atomic,
>> right?
>>=20
>
> I have never grasped all the concurrency issues, but wouldn't I need
> memory barriers as well?

As far as I understand, {test_and_,}{set,clear,change}_bit() handle all
the required steps to guarantee proper atomic behavior. I haven't looked
at the implementation myself, though.

>>> +	u8 errno;
>>=20
>> a global per-function error? Why?
>>=20
>
> This is the result of the previously request operation. The host will
> request this value to see how it went. I might switch to using a bulk
> endpoint for status following a discussion with Alan Stern in the host
> driver thread in this patch series. If so I might not need this.

got it.

>>> +	u16 request;
>>> +	u16 value;
>>=20
>> also why? Looks odd
>>=20
>
> These values contains the operation (in addition to the payload) that
> the worker shall perform following the control-OUT requests.
>
> control-IN requests can run in interrupt context so in that case the
> payload is queued up immediately.

cool

>>> +static void f_gud_drm_bulk_complete(struct usb_ep *ep, struct usb_requ=
est *req)
>>> +{
>>> +	struct f_gud_drm *fgd =3D req->context;
>>> +	unsigned long flags;
>>> +
>>> +	if (req->status || req->actual !=3D req->length)
>>> +		return;
>>=20
>> so, if we complete with an erroneous status or a short packet, you'll
>> ignore it?
>>=20
>
> Hmm yeah. When I wrote this I thought that the bottleneck was the USB
> transfers, so I didn't want the host to slow down performance by
> requesting this status. Now I know it's the decompression that takes
> time, so I could actually do a status check and retry the frame if the
> device detects an error.

sounds good :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl7XTPcACgkQzL64meEa
mQYaCQ//ZFRfURu4ur1htkBbgGKl6+cF/EZXLfGtqPCvkH6208dFeU4+1MlFp9kN
Ng+Bi2gj0+HjisKQpDZkl0lv0LyT6ANsRU9oW1OcNR9ToDrP2eFNLs7p4cHNt3W+
yJDryq3fTUOoFTVvJlholSaC1FQiCch5Ar2R8ol+BBFc2lfuSytGlc8zS1m3GGCk
ViIMHsd4Iw+PEhWSDD+8G1pyb47p9r9eQN1tVHITBpZGd4LZIU8EhtzLTXYkT7Xf
Rmok/xebYcm7VYKqZoOfU3EAFXFJmpOQdBIPJogm/MszX5t+EgCTWKyHvdsuB0w6
ghZ3a07xc3GTxCZ6kulxIc9FA+p1sbkAZO77eDUtRV35O9alJjtoZDayBJR7NluS
rWetktED0ISu0KrUJ4wilFieTT5blrdzL6wbgKvLxXMqhfvW+cjG23/7KvOcjrec
5Er6ZrYVu2k/EE5aDKA+hLCur1cuBbDFBhh0M2TugLV2W0L5J8cED0blkIHxwyOd
u8Io2+87Emo8vCFxro3G6g/7TK531RkegbPlyVbEqub6yl96k2+jCEe92CWJLCIO
kdnDtWyy50U6z56Jg1u18WzoWfoKT5v4ZtA+eTJOLEoB+SNITCMv/V0mUgCv3zZj
yTTU76LZrHeWkytMchWUeNNcPiBZenq9v2vDEYzjOchaYAmmvMU=
=Jumd
-----END PGP SIGNATURE-----
--=-=-=--
