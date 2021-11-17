Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0F8454664
	for <lists+linux-usb@lfdr.de>; Wed, 17 Nov 2021 13:26:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbhKQM3k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Nov 2021 07:29:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbhKQM3k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Nov 2021 07:29:40 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86779C061570
        for <linux-usb@vger.kernel.org>; Wed, 17 Nov 2021 04:26:41 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mnK1P-0006Fu-UY; Wed, 17 Nov 2021 13:26:39 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mnK1P-0000xy-KT; Wed, 17 Nov 2021 13:26:39 +0100
Date:   Wed, 17 Nov 2021 13:26:39 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, paul.elder@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de
Subject: Re: [PATCH v2 0/7] usb: gadget: uvc: use configfs entries for
 negotiation and v4l2 VIDIOCS
Message-ID: <20211117122639.GA28784@pengutronix.de>
References: <20211117004432.3763306-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline
In-Reply-To: <20211117004432.3763306-1-m.grzeschik@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 13:26:11 up 272 days, 15:50, 151 users,  load average: 0.92, 0.54,
 0.32
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Please skip reviewing this series. I just send out v3.

Thanks,
Michael

On Wed, Nov 17, 2021 at 01:44:25AM +0100, Michael Grzeschik wrote:
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
> drivers/media/usb/uvc/uvc_driver.c         | 281 +---------------
> drivers/media/usb/uvc/uvc_v4l2.c           |  14 +-
> drivers/media/usb/uvc/uvcvideo.h           | 144 --------
> drivers/media/v4l2-core/v4l2-common.c      |  82 +++++
> drivers/usb/gadget/function/f_uvc.c        | 256 +++++++++++++-
> drivers/usb/gadget/function/uvc.h          |  33 +-
> drivers/usb/gadget/function/uvc_configfs.c | 153 +++------
> drivers/usb/gadget/function/uvc_configfs.h | 125 ++++++-
> drivers/usb/gadget/function/uvc_queue.c    |   4 +-
> drivers/usb/gadget/function/uvc_v4l2.c     | 374 ++++++++++++++++++---
> drivers/usb/gadget/function/uvc_video.c    |  72 +++-
> include/media/v4l2-common.h                |   4 +
> include/media/v4l2-uvc.h                   | 351 +++++++++++++++++++
> 14 files changed, 1291 insertions(+), 603 deletions(-)
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

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmGU9PwACgkQC+njFXoe
LGQvoBAAi4nT0PFjpYc76GOq2C3zpWdueXQbDXZr0B37iubbx4wMnI6onjQCcvtk
F7ESGJ3itLaoXOoVWU1h3dpZG0FstmD1g2S6Wq9c0+WFG1UuJ/rZjoUAyl+vvG5y
MyFqyaNgSfa1ACKS3vTbYMP2u4jKlC55FWIUwUFHhhdX+pZndc/Eh0YHtnktri3c
3r2AbIArLp+hsw1AmR/fa+FnOOM3D3rABPMdO1/9Wyt96DC+jpaaQxdH7+wS7HLE
d+0TFcua8ZkfsXiyZ5ayhsd1EDNkFWAPP6Rr+zq5SgIFFp2xTrPE4usXycPIfZIo
WgH33WNX5mThMXOwZzNwgeINqD/oxbyL2/Dk/phHeRAkrnLpam1S5+1NcYN6gWfX
8B9y6KdjLtM2pSDF65Tyn2T0KGY9kQySUhQttpSTlvt/EQFbmXmYHLURXB5NcX8b
/gMiJP/R6I9+7GfAlF+QK+65hrH2O6aXSKHWIcurqvBkrDXD1fzv0fJlrB1wvKOk
yHh4UliI1MRJs8WgLPE1WRH4WtCYiHIADuP1SvZScMVVBWQL/HSLOqzEin34I0R5
IsWbGNLmangiCUPzXv+dgX5YyAQhz7p6Tgi6Vkj8vsB5U8rKw5v1mlCDVclrntFd
qH0jbYKWIjRc5avxbvcBXvKtm1+bEHkkHdTQ+7rgXrFOWl6IRPc=
=EU4r
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
