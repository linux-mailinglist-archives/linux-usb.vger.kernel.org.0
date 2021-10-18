Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56ADE431152
	for <lists+linux-usb@lfdr.de>; Mon, 18 Oct 2021 09:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbhJRHWu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Oct 2021 03:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbhJRHWu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Oct 2021 03:22:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B56AC06161C
        for <linux-usb@vger.kernel.org>; Mon, 18 Oct 2021 00:20:39 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mcMwn-000300-Qq; Mon, 18 Oct 2021 09:20:37 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mcMwn-0007AN-BB; Mon, 18 Oct 2021 09:20:37 +0200
Date:   Mon, 18 Oct 2021 09:20:37 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, paul.elder@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de
Subject: Re: [PATCH] usb: gadget: uvc: consistently use define for headerlen
Message-ID: <20211018072037.GM17524@pengutronix.de>
References: <20211017215017.18392-2-m.grzeschik@pengutronix.de>
 <20211018001139.29284-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UeXZ3FjlYZvuln/G"
Content-Disposition: inline
In-Reply-To: <20211018001139.29284-1-m.grzeschik@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:20:13 up 242 days, 10:44, 117 users,  load average: 0.61, 0.34,
 0.24
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--UeXZ3FjlYZvuln/G
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Oh, I forgot v4 in the subject. Will resend. Ignore this.

On Mon, Oct 18, 2021 at 02:11:39AM +0200, Michael Grzeschik wrote:
>The uvc request headerlen of 2 was defined as UVCG_REQUEST_HEADER_LEN
>in commit e81e7f9a0eb9 ("usb: gadget: uvc: add scatter gather support").
>We missed to use it consistently. This patch fixes that.
>
>Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
>Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>
>---
>v3: - fixed wrong use of define
>    - added missing use of define in uvc_video_encode_header
>v4: - fixed headersize in struct uvc_request to also use the define
>
> drivers/usb/gadget/function/uvc.h       | 4 +++-
> drivers/usb/gadget/function/uvc_video.c | 6 +++---
> drivers/usb/gadget/function/uvc_video.h | 2 --
> 3 files changed, 6 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/functi=
on/uvc.h
>index 9d5f17b551bbd..c3607a32b9862 100644
>--- a/drivers/usb/gadget/function/uvc.h
>+++ b/drivers/usb/gadget/function/uvc.h
>@@ -68,6 +68,8 @@ extern unsigned int uvc_gadget_trace_param;
> #define UVC_MAX_REQUEST_SIZE			64
> #define UVC_MAX_EVENTS				4
>
>+#define UVCG_REQUEST_HEADER_LEN			2
>+
> /* ----------------------------------------------------------------------=
--
>  * Structures
>  */
>@@ -76,7 +78,7 @@ struct uvc_request {
> 	u8 *req_buffer;
> 	struct uvc_video *video;
> 	struct sg_table sgt;
>-	u8 header[2];
>+	u8 header[UVCG_REQUEST_HEADER_LEN];
> };
>
> struct uvc_video {
>diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/=
function/uvc_video.c
>index 1bfca3cb42f9b..7bc865eab27b3 100644
>--- a/drivers/usb/gadget/function/uvc_video.c
>+++ b/drivers/usb/gadget/function/uvc_video.c
>@@ -33,7 +33,7 @@ uvc_video_encode_header(struct uvc_video *video, struct =
uvc_buffer *buf,
> 	if (buf->bytesused - video->queue.buf_used <=3D len - UVCG_REQUEST_HEADE=
R_LEN)
> 		data[1] |=3D UVC_STREAM_EOF;
>
>-	return 2;
>+	return UVCG_REQUEST_HEADER_LEN;
> }
>
> static int
>@@ -307,8 +307,8 @@ uvc_video_alloc_requests(struct uvc_video *video)
> 		list_add_tail(&video->ureq[i].req->list, &video->req_free);
> 		/* req_size/PAGE_SIZE + 1 for overruns and + 1 for header */
> 		sg_alloc_table(&video->ureq[i].sgt,
>-			       DIV_ROUND_UP(req_size - 2, PAGE_SIZE) + 2,
>-			       GFP_KERNEL);
>+			       DIV_ROUND_UP(req_size - UVCG_REQUEST_HEADER_LEN,
>+					    PAGE_SIZE) + 2, GFP_KERNEL);
> 	}
>
> 	video->req_size =3D req_size;
>diff --git a/drivers/usb/gadget/function/uvc_video.h b/drivers/usb/gadget/=
function/uvc_video.h
>index 9bf19475f6f9a..03adeefa343b7 100644
>--- a/drivers/usb/gadget/function/uvc_video.h
>+++ b/drivers/usb/gadget/function/uvc_video.h
>@@ -12,8 +12,6 @@
> #ifndef __UVC_VIDEO_H__
> #define __UVC_VIDEO_H__
>
>-#define UVCG_REQUEST_HEADER_LEN			2
>-
> struct uvc_video;
>
> int uvcg_video_enable(struct uvc_video *video, int enable);
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

--UeXZ3FjlYZvuln/G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmFtIEIACgkQC+njFXoe
LGS70g//eepNdLedJQJgRed+p5ua18QoEuzbhmdkYc4d9F+RGsDYpiY8jH2RUZ3h
PzlaYMm+uDQH2q+7QT5ooGZeRpyHWBY7+fUfBvZ/SPAlMkpeiwd9Hgeiv1zJULyZ
SrHXv4Szwv3DcrdfjwEtdjY2ShS65eiqlbMqf6S4fItm/GgguJ9hmAVNvL3y/wV1
02v0MQYzcNTymqonQ16NV3LPkYCaSnS+meDyiEvx502dHlAAEUm9kR0NzJ0sjGyP
adIClN/K7HdnBFJCeFGagK2eOM6yytwZ9d6oh+r2INaJyuAeX1Lu3vNRs3vlE7KH
MjGtVzxDti1kJBWLR4FOBkx9ebr46b67owdtkQ/XyBaFpwbkIlILOJGxdyuBfZJG
9KCAcZ7/kawvnFNwOggtbncFhJsEIbaos0tgvh6jiw0POx6ADLJfKTDAW01njW0K
FJwrpeUFH3DCGw2NjR00a1OyE0k/rIAcuf1elLtAYXH2ovR+xe8lus7+ibzVC6BO
WMYGrsek18YV8arrQbFINNjAC/euUcuNnWXDqvoS5+t1LTcriKuvRUIFYHrJlKgG
rNs/Wuw3Xqs3W91RkssspkTemlpTXgspcogGRiq17bAD1aQm1OPQxEsyLM29LaS+
4RbnVY0OUsAw7uHW1Z4IbD0QlnFe7kE/g/RjwwAE82M60h4RyWA=
=a6gX
-----END PGP SIGNATURE-----

--UeXZ3FjlYZvuln/G--
