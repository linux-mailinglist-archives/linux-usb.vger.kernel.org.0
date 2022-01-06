Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44742486D27
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jan 2022 23:23:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244930AbiAFWXe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jan 2022 17:23:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244638AbiAFWXd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jan 2022 17:23:33 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29DDCC061245
        for <linux-usb@vger.kernel.org>; Thu,  6 Jan 2022 14:23:33 -0800 (PST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1n5bAR-0007vN-FZ; Thu, 06 Jan 2022 23:23:31 +0100
Received: from mgr by pty.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1n5bAQ-0054Jo-CM; Thu, 06 Jan 2022 23:23:30 +0100
Date:   Thu, 6 Jan 2022 23:23:30 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, paul.elder@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v6 0/7] usb: gadget: uvc: use configfs entries for
 negotiation and v4l2 VIDIOCS
Message-ID: <Yddr4rE05cLSj6TE@pengutronix.de>
References: <20220105115527.3592860-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CsPTRgMF6YWVbUD/"
Content-Disposition: inline
In-Reply-To: <20220105115527.3592860-1-m.grzeschik@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 23:10:40 up 140 days, 14:44, 23 users,  load average: 0.54, 0.31,
 0.13
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--CsPTRgMF6YWVbUD/
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Ccing Nicolas and Kieran.

BTW: I have some wip patches in my queue to get isoc support running on
the dummy_hcd driver. With those patches, it is easy to test this series
on any system (like qemu) without the need of an actual udc device.

If interested, I could improve and send them on the list.

Thanks,
Michael

On Wed, Jan 05, 2022 at 12:55:20PM +0100, Michael Grzeschik wrote:
>This series improves the uvc video gadget by parsing the configfs
>entries. With the configfs data, the driver now is able to negotiate the
>format with the usb host in the kernel and also exports the supported
>frames/formats/intervals via the v4l2 VIDIOC interface.
>
>The uvc userspace stack is also under development. One example is an gener=
ic
>v4l2uvcsink gstreamer elemnt, which is currently under duiscussion. [1]
>
>[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/13=
04
>
>With the libusbgx library [1] used by the gadget-tool [2] it is now also
>possible to fully describe the configfs layout of the uvc gadget with sche=
me
>files.
>
>[2] https://github.com/linux-usb-gadgets/libusbgx/pull/61/commits/53231c76=
f9d512f59fdc23b65cd5c46b7fb09eb4
>
>[3] https://github.com/linux-usb-gadgets/gt/tree/master/examples/systemd
>
>The bigger picture of these patches is to provide a more versatile interfa=
ce to
>the uvc gadget. The goal is to simply start a uvc-gadget with the following
>commands:
>
>$ gt load uvc.scheme
>$ gst-launch v4l2src ! v4l2uvcsink
>
>--
>
>v1: https://lore.kernel.org/linux-usb/20210530222239.8793-1-m.grzeschik@pe=
ngutronix.de/
>v2: https://lore.kernel.org/linux-usb/20211117004432.3763306-1-m.grzeschik=
@pengutronix.de/
>v3: https://lore.kernel.org/linux-usb/20211117122435.2409362-1-m.grzeschik=
@pengutronix.de/
>v4: https://lore.kernel.org/linux-usb/20211205225803.268492-1-m.grzeschik@=
pengutronix.de/
>v5: https://lore.kernel.org/linux-usb/20211209084322.2662616-1-m.grzeschik=
@pengutronix.de/
>
>Regards,
>Michael
>
>Michael Grzeschik (7):
>  media: v4l: move helper functions for fractions from uvc to
>    v4l2-common
>  media: uvcvideo: move uvc_format_desc to common header
>  usb: gadget: uvc: prevent index variables to start from 0
>  usb: gadget: uvc: move structs to common header
>  usb: gadget: uvc: track frames in format entries
>  usb: gadget: uvc: add VIDIOC function
>  usb: gadget: uvc: add format/frame handling code
>
> drivers/media/usb/uvc/uvc_ctrl.c           |   1 +
> drivers/media/usb/uvc/uvc_driver.c         | 281 +-------------
> drivers/media/usb/uvc/uvc_v4l2.c           |  14 +-
> drivers/media/usb/uvc/uvcvideo.h           | 144 --------
> drivers/media/v4l2-core/v4l2-common.c      |  82 +++++
> drivers/usb/gadget/function/f_uvc.c        | 263 +++++++++++++-
> drivers/usb/gadget/function/uvc.h          |  38 +-
> drivers/usb/gadget/function/uvc_configfs.c | 148 ++------
> drivers/usb/gadget/function/uvc_configfs.h | 120 +++++-
> drivers/usb/gadget/function/uvc_queue.c    |   3 +-
> drivers/usb/gadget/function/uvc_v4l2.c     | 404 ++++++++++++++++++---
> drivers/usb/gadget/function/uvc_video.c    |  71 +++-
> include/media/v4l2-common.h                |   4 +
> include/media/v4l2-uvc.h                   | 351 ++++++++++++++++++
> 14 files changed, 1319 insertions(+), 605 deletions(-)
> create mode 100644 include/media/v4l2-uvc.h
>
>--=20
>2.30.2
>
>
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--CsPTRgMF6YWVbUD/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmHXa9wACgkQC+njFXoe
LGSi6A//QcoEbiC0TOSHJIOazyTr9JoCyaJq21eFX+TvDx87ybw5tm5kDKCDXJWV
fjZtGU3Bw1ePA7auyAkPtIuHUQVEZW4DWg7M3/KclaEPJuxdqiuY0y1JZisIJW06
Fou0p72Y9olRXPcmBg0SexD9OCWVz0L3qZMgqc0PsxCZ6mlu3sj3wbTUkNLAeJLJ
QR1CFMXYUKohF+e/crMh2D676YbBsY5d0n8e2ncCnstN1kw4brXj/rx/SVRZhRVD
TRbfzDWfK+0fk/NbO4VfB8/dR+QCpeOOWsEJ9bt2y07IXhIo19uINhJfQYswopQa
6g6trG2XVwBaGGSc4mUoeMzwynWM08n6akGUWWvuRE68EItfFJorVZDnXAC8asEo
jaHgnF/nl2KQfJWPuRm+SJosDdXtYsc5bU8VpELanITL4jzdmPBLtfAMHc8dv5+I
W7IqFKwU7TpcEjdPsSBGOrM+0/RwkM/I02pifpdq/AFTVnPins1DvxwdnEFnq+08
ypuBurBeBmqAO0hkqDnkhi8WgVManXw8qaBQHJS3uYQmykb4+sGTCljLWPZbrxMg
gklkzT4FAEgO39ZOBEGi/oOhV6tORFX9U9LmwS88AvBOxvIRTsn6jVz9EHo2fwL9
Py/kb3IvM0Kkd1gQcwE8R2hkTktLTSVEzm1Nr2+ZDmJmEC77JWs=
=3o8h
-----END PGP SIGNATURE-----

--CsPTRgMF6YWVbUD/--
