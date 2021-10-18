Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53EC2432874
	for <lists+linux-usb@lfdr.de>; Mon, 18 Oct 2021 22:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbhJRUaw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Oct 2021 16:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbhJRUaw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Oct 2021 16:30:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ED3FC06161C
        for <linux-usb@vger.kernel.org>; Mon, 18 Oct 2021 13:28:40 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mcZFM-0001Un-W4; Mon, 18 Oct 2021 22:28:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mcZFM-0001PP-1Q; Mon, 18 Oct 2021 22:28:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mcZFM-0000vj-0Z; Mon, 18 Oct 2021 22:28:36 +0200
Date:   Mon, 18 Oct 2021 22:28:35 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     David Mosberger <davidm@egauge.net>, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: max-3421: Use driver data instead of maintaining a
 list of bound devices
Message-ID: <20211018202835.txyjkm54ddwmwpsu@pengutronix.de>
References: <20211018120055.2902897-1-u.kleine-koenig@pengutronix.de>
 <YW2K6iWveIPAQSiM@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kkpwlrla7z2mhz3z"
Content-Disposition: inline
In-Reply-To: <YW2K6iWveIPAQSiM@kroah.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--kkpwlrla7z2mhz3z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Greg,

On Mon, Oct 18, 2021 at 04:55:38PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Oct 18, 2021 at 02:00:55PM +0200, Uwe Kleine-K=F6nig wrote:
> > @@ -1881,10 +1877,8 @@ max3421_probe(struct spi_device *spi)
> >  		goto error;
> >  	}
> >  	set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
> > -	max3421_hcd =3D hcd_to_max3421(hcd);
>=20
> I don't think you should have deleted this line :(
>=20
> Did you test this?

Only compile tested (and the warning the kernel robot found didn't
happen in my amd64 build).

I'll respin this patch.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--kkpwlrla7z2mhz3z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFt2PAACgkQwfwUeK3K
7AnP7QgAoDLJkI3J/ibNaSwWf4EkCCGnR6hJYPsAkjeG/YxrRYP2QkA0J147c2P9
qWfVLiXLymtR/cPrezr+i2dBm8jvspRPmdrtz+Dy2z9XL9OC67NrA5oxxZtLhLPT
2kFTvw6h1eMsNXqEV8jCjlXi2y44XVcoiAQ6yQYMjgICmMT7ZTygEhQO+onJqf3x
FPO7hnK1Xs8NRa04XtPjZreqvOoFG3Na4ii7PyfrpgC+0eXlW1B+uJ3O4kCf5dc2
XyLmVaIOyM8uw3zVfeDNM0+xDE2IRQb8AJAHSQ45NOJERnnMBL32/AEdV+9hbx1T
Eze0jV5xvzN0+GWylq2t2ugL9vKXpw==
=0t+Q
-----END PGP SIGNATURE-----

--kkpwlrla7z2mhz3z--
