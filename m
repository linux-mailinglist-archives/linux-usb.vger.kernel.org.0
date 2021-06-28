Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7B6B3B66FA
	for <lists+linux-usb@lfdr.de>; Mon, 28 Jun 2021 18:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231926AbhF1Qtz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Jun 2021 12:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231896AbhF1Qty (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Jun 2021 12:49:54 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8224EC061574
        for <linux-usb@vger.kernel.org>; Mon, 28 Jun 2021 09:47:28 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lxuPu-0000YO-Tb; Mon, 28 Jun 2021 18:47:26 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lxuPu-0000YS-DE; Mon, 28 Jun 2021 18:47:26 +0200
Date:   Mon, 28 Jun 2021 18:47:26 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, caleb.connolly@ideasonboard.com,
        paul.elder@ideasonboard.com, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH v3 0/5] usb: gadget: uvc: improve uvc gadget performance
Message-ID: <20210628164726.GB27508@pengutronix.de>
References: <20210628155311.16762-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WhfpMioaduB5tiZL"
Content-Disposition: inline
In-Reply-To: <20210628155311.16762-1-m.grzeschik@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 18:44:07 up 130 days, 20:07, 107 users,  load average: 0.43, 0.22,
 0.16
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--WhfpMioaduB5tiZL
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I just realized that the previous series already should have been v3 and
this v4. However, the changelog of the patches is right and this is the
latest version. So there should be no need for resend.

Sorry for the mess, next time I will keep better bookkeeping.

Michael

On Mon, Jun 28, 2021 at 05:53:06PM +0200, Michael Grzeschik wrote:
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
> drivers/usb/gadget/function/uvc_video.h |   2 +
> drivers/usb/gadget/legacy/Kconfig       |   1 +
> 9 files changed, 176 insertions(+), 36 deletions(-)
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

--WhfpMioaduB5tiZL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmDZ/RgACgkQC+njFXoe
LGRqFA/+PW3n15d7noFTFWCXigjxkS1lwAgfHlz2kbA8bV4bjoo9rWKPDKnyFhR+
V0PYx6W8E635aG+3Zy8NMRbfOfw9DRQvdxHcY48LBbMUVkdeoGytWws5K1Ni1Mtf
h5M0rQfQVBYEgaM0CyAhbTazPU46mtNBwrpJRCCrDth0f+Z2Aw5CoamV3zGxuMh5
9wO71ZN/ToSEZTMOEiHgVgRfZK7oIw1fpGI9FNXs+Z3jByqGkfUZ6yhNgTtqth1d
HlRll7Rq1yHu8lFj42xe08ku7olsn23SHAGElEaVKhzoRudUcr9zD/kZkDQj4Un7
vtYnpYL4c4Pf+RjXBpk/rs0tX8rP1oYp02UAF5lnnkhry2zF9TsjLCoBzUTW/AVQ
J8OVQdbIBJ3ZmZH+hfjf4tBxiRMCRpupuDOXENJmlyB5QuUhRrcsBaHPqWhNlFgq
LnVHLVoW54gh6MEfICsbDnzm7D6M0zb4NuF4JQL/d7ekjU5flMZlGA2Phi+287yl
ZOxjfdoWiL8e+NyxJCvawuxF8OMtSiHIaU3FYYBWlSJZoZxYpQAUh9DSjh9gKh95
tP0rkJbRNhndquTIi1VGxHrIVDYjIgNccGcRASGTtAzDKufwziRBpaboLaaU8gMn
c00DAzx1GQjUqytKSx50Pu/SM2jWE6+deInzpflxPBoXN6vzWUg=
=/NyP
-----END PGP SIGNATURE-----

--WhfpMioaduB5tiZL--
