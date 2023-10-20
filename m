Return-Path: <linux-usb+bounces-1970-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D67357D0C5A
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 11:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64CCC282421
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 09:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C1D14F6B;
	Fri, 20 Oct 2023 09:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE7C4668E
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 09:53:30 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F17011B
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 02:53:29 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qtmC7-0004uT-3O; Fri, 20 Oct 2023 11:53:27 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qtmC6-002zgc-26; Fri, 20 Oct 2023 11:53:26 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qtmC5-002RSf-Os; Fri, 20 Oct 2023 11:53:25 +0200
Date: Fri, 20 Oct 2023 11:53:25 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH v2] usb: mtu3: Convert to platform remove callback
 returning void
Message-ID: <20231020095325.qgymq46sj4isaoqa@pengutronix.de>
References: <20230914200251.919584-1-u.kleine-koenig@pengutronix.de>
 <2023100219-variety-genre-befe@gregkh>
 <20231002144959.jc6wwfrvwd4cyu2l@pengutronix.de>
 <2023100253-amino-pencil-9a96@gregkh>
 <20231002214158.wvhals4ywezftepo@pengutronix.de>
 <2023100530-degree-overlap-6aff@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ool7rnea7jvwuayn"
Content-Disposition: inline
In-Reply-To: <2023100530-degree-overlap-6aff@gregkh>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org


--ool7rnea7jvwuayn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Greg,

On Thu, Oct 05, 2023 at 09:13:18AM +0200, Greg Kroah-Hartman wrote:
> On Mon, Oct 02, 2023 at 11:41:58PM +0200, Uwe Kleine-K=F6nig wrote:
> > On Mon, Oct 02, 2023 at 04:53:05PM +0200, Greg Kroah-Hartman wrote:
> > > On Mon, Oct 02, 2023 at 04:49:59PM +0200, Uwe Kleine-K=F6nig wrote:
> > > > On Mon, Oct 02, 2023 at 04:39:47PM +0200, Greg Kroah-Hartman wrote:
> > > > > On Thu, Sep 14, 2023 at 10:02:51PM +0200, Uwe Kleine-K=F6nig wrot=
e:
> > > > > > @@ -469,8 +469,17 @@ static int mtu3_remove(struct platform_dev=
ice *pdev)
> > > > > >  		ssusb_gadget_exit(ssusb);
> > > > > >  		ssusb_host_exit(ssusb);
> > > > > >  		break;
> > > > > > -	default:
> > > > > > -		return -EINVAL;
> > > > > > +	case USB_DR_MODE_UNKNOWN:
> > > > > > +		/*
> > > > > > +		 * This cannot happen because with dr_mode =3D=3D
> > > > > > +		 * USB_DR_MODE_UNKNOWN, .probe() doesn't succeed and so
> > > > > > +		 * .remove() wouldn't be called at all. However (little
> > > > > > +		 * surprising) the compiler isn't smart enough to see that, =
so
> > > > > > +		 * we explicitly have this case item to not make the compiler
> > > > > > +		 * wail about an unhandled enumeration value.
> > > > > > +		 */
> > > > > > +		WARN_ON(1);
> > > > >=20
> > > > > Please don't add new WARN_ON() calls to the kernel, print out a b=
ig
> > > > > error message and return, don't reboot the machine.
> > > >=20
> > > > Huh, printing out an loud error message was my intention. It's news=
 to
> > > > me that WARN_ON() reboots the machine?! I thought BUG_ON() was the =
one
> > > > with the effects you describe that I shouldn't use.
> > >=20
> > > panic-on-warn is set for zillions[1] of Linux systems out there, so s=
ystems
> > > will reboot.
> >=20
> > The people enabling panic-on-warn *ask* for a reboot if something
> > strange happens, right? If ssusb->dr_mode is USB_DR_MODE_UNKNOWN in
> > .remove() but wasn't in .probe(), that's strange, right? If I don't
> > enable panic-on-warn, my system just emits a warning and then the driver
> > copes with what it has, right? Sounds to me as if WARN_ON does exactly
> > what is the right thing here.
>=20
> I really don't want to add more WARN_ON() to the kernel if at all
> possible.
>=20
> If this "can not happen" then just don't even add code for it, why have
> this at all?  The compiler warning can be handled a different way,
> right?

Sure, what do you suggest? A dev_warn()?

=2E.ooOO(But maybe there are people who reboot on dev_warn(), too?)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ool7rnea7jvwuayn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUyThQACgkQj4D7WH0S
/k5jSwgAp5YNj993FNmTlIMWvOQxZBYBD2kPR/ndxoxZPIrrKaVD4h4zxrZIgU8e
32V3nBj/O47Wbko0LDaye8KnHnhCjIuM1WENg74n6xTfnKyvYn1Sj+8eumMz95ff
A2AtSIIw5dXSF5XwUN0UwXnoQ7pg4ZijoQPmJ/ScQZSupw2dEJzX9lfM9EJm266J
rEIp7fQ2Jh4TT16n3kly3wU8tN3PuPBwHRjHSSlCzKhyNrAXG4QUjZVZthXzzYJE
ygKsb58SVehnnPYdAq7Kh/ttxyne6nXSr3MZiDvcujS9gvGi+RvylNfooQgRnD4+
vPZHBw/1/nZ2l3Ib6zoml5CW4WDO/Q==
=AAas
-----END PGP SIGNATURE-----

--ool7rnea7jvwuayn--

