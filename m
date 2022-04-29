Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29120515514
	for <lists+linux-usb@lfdr.de>; Fri, 29 Apr 2022 22:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379877AbiD2UFC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Apr 2022 16:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378860AbiD2UFB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Apr 2022 16:05:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F4532996
        for <linux-usb@vger.kernel.org>; Fri, 29 Apr 2022 13:01:41 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nkWo7-0005lu-Qr; Fri, 29 Apr 2022 22:01:39 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nkWo5-0003P8-Sx; Fri, 29 Apr 2022 22:01:37 +0200
Date:   Fri, 29 Apr 2022 22:01:37 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Dan Vacura <w36195@motorola.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 3/5] usb: gadget: uvc: increase worker prio to WQ_HIGHPRI
Message-ID: <20220429200137.GE7671@pengutronix.de>
References: <20220402233914.3625405-1-m.grzeschik@pengutronix.de>
 <20220402233914.3625405-4-m.grzeschik@pengutronix.de>
 <Yl8fwdOuxYDVrujW@pendragon.ideasonboard.com>
 <YmwzxIV5/a+ZNLXI@p1g3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5oH/S/bF6lOfqCQb"
Content-Disposition: inline
In-Reply-To: <YmwzxIV5/a+ZNLXI@p1g3>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 21:51:36 up 30 days,  8:21, 71 users,  load average: 0.12, 0.08,
 0.07
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--5oH/S/bF6lOfqCQb
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dan,
Hi Laurent,

On Fri, Apr 29, 2022 at 01:51:48PM -0500, Dan Vacura wrote:
>Thanks for this change it improves the performance with the DWC3
>controller on QCOM chips in an Android 5.10 kernel. I haven't tested the
>scatter/gather path, so memcpy was used here via
>uvc_video_encode_isoc(). I was able to get around 30% improvement (fps
>on host side). I did modify the alloc to only set the WQ_HIGHPRI flag.
>
>On Tue, Apr 19, 2022 at 11:46:57PM +0300, Laurent Pinchart wrote:
>> Thank you for the patch.
>>
>> On Sun, Apr 03, 2022 at 01:39:12AM +0200, Michael Grzeschik wrote:
>> > Likewise to the uvcvideo hostside driver, this patch is changing the
>> > simple workqueue to an async_wq with higher priority. This ensures that
>> > the worker will not be scheduled away while the video stream is handle=
d.
>> >
>> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> > +	video->async_wq =3D alloc_workqueue("uvcvideo", WQ_UNBOUND | WQ_HIGH=
PRI, 0);
>>
>> Unless I'm mistaken, an unbound work queue means that multiple CPUs will
>> handle tasks in parallel. Is that safe ?
>
>I found that with the WQ_UNBOUND flag I didn't see any performance
>improvement to the baseline, perhaps related to cpu caching or
>scheduling delays. I didn't notice any stability problems or concurrent
>execution. Do you see any benefit to keeping the WQ_UNBOUND flag?

I actually copied this from drivers/media/usb/uvc/uvc_driver.c ,
which is also allocating the workqueue with WQ_UNBOUND.

Look into drivers/media/usb/uvc/uvc_driver.c + 486

	stream->async_wq =3D alloc_workqueue("uvcvideo", WQ_UNBOUND | WQ_HIGHPRI,

In my tests, continous streaming did not trigger any errors. In fact if
this would be unsafe, the issue would probably trigger early, numerous
and obvious on multicore cpus.

However, some users seem to have seen recent issues on unplugging the
cable while streaming. I have to check if this could be related.

>> > +	if (!video->async_wq)
>> > +		return -EINVAL;
>>
>> --
>> Regards,
>>
>> Laurent Pinchart
>
>Thanks,
>
>Dan
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--5oH/S/bF6lOfqCQb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmJsRB4ACgkQC+njFXoe
LGR10g/+NPKgppYwhMStAheYa7xrd2Tmk9e4IV4JsxRb0ZOrDvkQtPeQjKdl+Et0
3m8r0szDCVEn8GIAzsHl3EwQB+OqWR7WLaHPig/7qmMuVqUOUbZJr0YYsxbZcKaz
ApdX5VkWSo7y2tmOxLmnl5IHQBH3N0PTtodSfEf1Kb4zmG5iU6Md1vHgTtrnG8e5
t95xQGmtuFEOWIOIEzk3DvYdvxC25Wyofx6jatv0RB/adEPT9eZQBBNdSiwozjDl
Lir3W9Yly6t8qj/pN9pPwOp99GMyu392jWWsblK78CgijHVgyTiu3/uNOwbrUczH
BhXk4QMH9TcXqRsFqEEYYdVnBA3Mz09/PRqTu4mkKtsWStm/fT/qKvcnMMwTK/ld
SkygJDJbFnsjTsAVG2B/wq760Of1M9uhI65Eg97ISs+1T26rPZwhb1F+xtyXKly+
mE9jtDNhZr5ku8Mp1YHDd31qOXY+rvXrg4q552KNjARnBDl80Gy/RMfgZx48a92+
J09o/G0leTb9UrDqTCf84KS5xoPTYav3zLEBf5cCwjMjGGN2hNgsohVVYBzpF33X
azhQulzvP2eklxCzcG+Sm6y8cNB4mk+Mos1NmQnhTrXl3gdVJrgXySEAPq8bxCcF
34qMjAZynCXJANDvZVKdIGLRzlB89fRQRGplsnNDs9fC7KGpsCg=
=2xQW
-----END PGP SIGNATURE-----

--5oH/S/bF6lOfqCQb--
