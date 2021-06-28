Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D317D3B5A70
	for <lists+linux-usb@lfdr.de>; Mon, 28 Jun 2021 10:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232424AbhF1I2M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Jun 2021 04:28:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232399AbhF1I2L (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Jun 2021 04:28:11 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB61EC061766
        for <linux-usb@vger.kernel.org>; Mon, 28 Jun 2021 01:25:45 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lxmaO-0007jf-9l; Mon, 28 Jun 2021 10:25:44 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lxmaN-0002Kf-TY; Mon, 28 Jun 2021 10:25:43 +0200
Date:   Mon, 28 Jun 2021 10:25:43 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, caleb.connolly@ideasonboard.com,
        paul.elder@ideasonboard.com, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 0/5] usb: gadget: uvc: improve uvc gadget performance
Message-ID: <20210628082543.GA27508@pengutronix.de>
References: <20210628081600.14525-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
In-Reply-To: <20210628081600.14525-1-m.grzeschik@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:24:29 up 130 days, 11:48, 122 users,  load average: 0.24, 0.32,
 0.26
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Forget about this series. I just missed to point the queue->dev to
the right device in here. Will send v3 later today.

On Mon, Jun 28, 2021 at 10:15:55AM +0200, Michael Grzeschik wrote:
>This series improves the performance of the uvc video gadget by adding a
>zero copy routine using the scatter list interface of the gadget. The
>series also increases the amount of allocated requests depending of the
>speed and it also reduces the interrupt load by only trigger on every
>16th request in case of super-speed.
>
>Michael Grzeschik (5):
>  usb: dwc3: gadget: set gadgets parent to the right controller
>  usb: gadget: uvc: make uvc_num_requests depend on gadget speed
>  usb: gadget: uvc: set v4l2_dev->dev in f_uvc
>  usb: gadget: uvc: add scatter gather support
>  usb: gadget: uvc: decrease the interrupt load to a quarter
>
> drivers/usb/dwc3/gadget.c               |   2 +-
> drivers/usb/gadget/Kconfig              |   1 +
> drivers/usb/gadget/function/f_uvc.c     |   1 +
> drivers/usb/gadget/function/uvc.h       |  15 ++-
> drivers/usb/gadget/function/uvc_queue.c |  28 ++++-
> drivers/usb/gadget/function/uvc_queue.h |   7 +-
> drivers/usb/gadget/function/uvc_video.c | 155 +++++++++++++++++++-----
> drivers/usb/gadget/legacy/Kconfig       |   1 +
> 8 files changed, 175 insertions(+), 35 deletions(-)
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

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmDZh4IACgkQC+njFXoe
LGSroA//f4rJvfdaL+z5fBROmCNhBQKIq/V76pOcGS0txXlvZxnTlU8zFTg3dadp
FrLP/D4d0DjEiUFVAEodWpkFG5IEOGXTILdAxmF+qDrUaoAnuzFnT3/zLOfRv1K8
xWfZSxuD8vvIUHevQi8utlckTeK0MhZQzXIdF81cW4p0eZYflW8voEUBp8b2b8nm
fpNdL3BLdb8/VWoLEAc8C8TFsD8svu6YF+5AYLFQ7FEXLdUhfeJSBjdqdRW2N9Wv
Cd9OATmPtdmwKTsQM2+Vb2TfPGM3nkuv9CNvbHVO4tYxbqN2ULaNpaJGerh6FGr9
egJ3gs/jNdVdvPG5SvJiL6p/gVoE6qkmBUTuuyKw6qCXhSH5Y7n2sbz7W9MsyZ1+
QxqAlQhMjalFZh7hPuGxWKcCbR3xxfUnMoUYboFMRQnD2lKgAIAf1yxxI4dpwqW3
/2u17QTX4FJbpUCDAF6twJb0HpQOUrDVT6WYW/y9Nu7VMsWgHS/h29zwlOtLW1Io
zA6SEdqkHpittGgwVt698s4HXSZVrC99//rX0/1TsT+NdHQtP0rYFJfJLQENgFUl
WC83AapRUFrpiZyn2erxws3Z5+8sDljIfG8RPuP6LLlkUm6BYuF9waL8XjHNm9uM
lslatHuNzQGoCpqo3p09A85AHSvQA66XLfFL5fbCAbaqxoLbT5U=
=aFy6
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
