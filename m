Return-Path: <linux-usb+bounces-3263-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9407F658C
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 18:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 602D71C20C85
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 17:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0387405EC;
	Thu, 23 Nov 2023 17:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21BEA11F
	for <linux-usb@vger.kernel.org>; Thu, 23 Nov 2023 09:36:17 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r6Dca-0000Hu-Og; Thu, 23 Nov 2023 18:36:12 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r6DcZ-00B5cU-BT; Thu, 23 Nov 2023 18:36:11 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r6DcZ-006qY3-2G; Thu, 23 Nov 2023 18:36:11 +0100
Date: Thu, 23 Nov 2023 18:36:10 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Frieder Schrempf <frieder@fris.de>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Anand Moon <linux.amoon@gmail.com>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	Icenowy Zheng <uwu@icenowy.me>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] usb: misc: onboard_usb_hub: Add support for clock
 input
Message-ID: <20231123173610.d6ytwlpbpcqng5pv@pengutronix.de>
References: <20231123134728.709533-1-frieder@fris.de>
 <2023112329-augmented-ecology-0753@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vdyxpcye55rpoaff"
Content-Disposition: inline
In-Reply-To: <2023112329-augmented-ecology-0753@gregkh>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org


--vdyxpcye55rpoaff
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Nov 23, 2023 at 01:55:57PM +0000, Greg Kroah-Hartman wrote:
> On Thu, Nov 23, 2023 at 02:47:20PM +0100, Frieder Schrempf wrote:
> > +	err =3D clk_prepare_enable(hub->clk);
> > +	if (err) {
> > +		dev_err(hub->dev, "failed to enable clock: %d\n", err);
> > +		return err;

I suggest to use %pe (and ERR_PTR(err)) here.

> > +	}
>=20
> But what happens if clk is not set here?

clk_prepare_enable() just does "return 0" if the clk argument is NULL.

> And doesn't clk_prepare_enable() print out a message if it fails?

clk_prepare_enable is silent on errors.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--vdyxpcye55rpoaff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVfjYoACgkQj4D7WH0S
/k60Sgf9EIMAyid9PgcCWUFFbJtFNmTeRepSh9ej1g3njBiFowXw/VM/cGKLZ6Pn
REMlndIq0Qy3BuRWLVGhpwM90rYyHEAXUZvAbaFZ1MTZEeP7yy1DDOY8LYuj6M1I
pxS837HVoDzyW7h+OdZn/PPcdi/JeUZJ+bB8noi0xI8HZB/eqQPs3GQzkV21kBaM
Su8HU85R3S0Ut3tuHcZLPphYoYzAPQnkWkGd1yEVvRBES3wal5idus7BsfWCVA/t
PmCu9WOZjuI4jwiaMe/4qYEaN//fEYATe+wkQbU0DY1qloJ/25G4vzrHblSaqBVz
2Re9n6rYDZz57NAfip8wvdSBRwy/pw==
=upyH
-----END PGP SIGNATURE-----

--vdyxpcye55rpoaff--

