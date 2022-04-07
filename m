Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACC084F81E5
	for <lists+linux-usb@lfdr.de>; Thu,  7 Apr 2022 16:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241056AbiDGOhE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Apr 2022 10:37:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344190AbiDGOgu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Apr 2022 10:36:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F2441B48DB
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 07:34:35 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1ncTDS-0006W4-8i; Thu, 07 Apr 2022 16:34:30 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1ncTDR-0000iv-GC; Thu, 07 Apr 2022 16:34:29 +0200
Date:   Thu, 7 Apr 2022 16:34:29 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, paul.elder@ideasonboard.com,
        kieran.bingham@ideasonboard.com, nicolas@ndufresne.ca,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de
Subject: Re: [PATCH v7 0/7] usb: gadget: uvc: use configfs entries for
 negotiation and v4l2 VIDIOCS
Message-ID: <20220407143429.GC27216@pengutronix.de>
References: <20220315143356.3919911-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8NvZYKFJsRX2Djef"
Content-Disposition: inline
In-Reply-To: <20220315143356.3919911-1-m.grzeschik@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:29:28 up 8 days,  2:59, 73 users,  load average: 0.57, 0.30, 0.24
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--8NvZYKFJsRX2Djef
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

This series is laying around another two weeks after it was sent.

Some feedback would be appreciated to get this code mainline.

Thanks,
Michael

On Tue, Mar 15, 2022 at 03:33:49PM +0100, Michael Grzeschik wrote:
>This series improves the uvc video gadget by parsing the configfs
>entries. With the configfs data, the driver now is able to negotiate the
>format with the usb host in the kernel and also exports the supported
>frames/formats/intervals via the v4l2 VIDIOC interface.
>
>The uvc userspace stack is also under development. One example is an gener=
ic
>v4l2uvcsink gstreamer elemnt, which is currently under discussion. [1]
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
>v6: https://lore.kernel.org/linux-usb/20220105115527.3592860-1-m.grzeschik=
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
> drivers/media/usb/uvc/uvcvideo.h           | 144 -------
> drivers/media/v4l2-core/v4l2-common.c      |  82 ++++
> drivers/usb/gadget/function/f_uvc.c        | 271 +++++++++++++-
> drivers/usb/gadget/function/uvc.h          |  39 +-
> drivers/usb/gadget/function/uvc_configfs.c | 148 ++------
> drivers/usb/gadget/function/uvc_configfs.h | 120 +++++-
> drivers/usb/gadget/function/uvc_queue.c    |   3 +-
> drivers/usb/gadget/function/uvc_v4l2.c     | 412 ++++++++++++++++++---
> drivers/usb/gadget/function/uvc_video.c    |  71 +++-
> include/media/v4l2-common.h                |   4 +
> include/media/v4l2-uvc.h                   | 351 ++++++++++++++++++
> 14 files changed, 1336 insertions(+), 605 deletions(-)
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

--8NvZYKFJsRX2Djef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmJO9nIACgkQC+njFXoe
LGSPWRAArH8khwXSE7EFSbQiqbcWBtqvIvcoz3oyU+m0PHWWA2KfBZAN71z4jl1+
lHSU9iOIe63O1aOAIpUvFFJxx4OgFR0IacucUhmuXx9ElU/46cUhNHSFrzCY5aD9
5z0gRc4+UjvRYI1X+P1Ipqj9Rh+6Qllj2hffR7CiQ2o2CQ8z/D+nQwzoOy3DBu2h
FdpssiM/YJLtg6rjuQt86H0UAktZ+ibFVhCSqb2diNV0zDIlImcczbI0lfnMC9Ak
fymGMQJXEKYo28dgwzTKRHfq+RfP5B/xPA76CdT124PtICkLB0Xjz6dS2X4dDY5W
7vW9ea09UF3+HRrd0uuz7uk49F2zdfKju9eMGHeDyDkkHS3AuqLaT9XRamvuvyd/
jHXqw98vYQGYswEU5q70x6B+TWRDrwSNncg3epFm00o9AXrLVqNQXe93zXA22jmI
kih0gusniVM1ZBhPSGSRwBLIQe/oqDp8lz4VZrE5NeJsW7l2UFMguBoQWb45TAeb
X/wH4QQxa6Ve/4lER3620ZcgxEYMI9A4GwdP7bTVd7XNOCvhGdhSjanRQlEgS70V
8Gk6JPt3MNZNlNYlDtZ8P7JNSs+WfoT0o/JNI+NkOqAEXQwrKIJSxXaW2a/NpDM+
8sxeBkL1u0zqLFpoUcDMBOMyA5wFYvcHG0MRErSm+YgDGqEO1Rw=
=zSSd
-----END PGP SIGNATURE-----

--8NvZYKFJsRX2Djef--
