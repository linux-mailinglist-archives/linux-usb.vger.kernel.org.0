Return-Path: <linux-usb+bounces-977-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 507C97B5C8B
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 23:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id F279E281DD3
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 21:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4742033E;
	Mon,  2 Oct 2023 21:42:13 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA211F934
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 21:42:10 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0252FBF
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 14:42:03 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnQfw-00023R-MI; Mon, 02 Oct 2023 23:42:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnQfu-00Acl9-QP; Mon, 02 Oct 2023 23:41:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnQfu-008GRu-H5; Mon, 02 Oct 2023 23:41:58 +0200
Date: Mon, 2 Oct 2023 23:41:58 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH v2] usb: mtu3: Convert to platform remove callback
 returning void
Message-ID: <20231002214158.wvhals4ywezftepo@pengutronix.de>
References: <20230914200251.919584-1-u.kleine-koenig@pengutronix.de>
 <2023100219-variety-genre-befe@gregkh>
 <20231002144959.jc6wwfrvwd4cyu2l@pengutronix.de>
 <2023100253-amino-pencil-9a96@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hg27zwbq4ewyulrd"
Content-Disposition: inline
In-Reply-To: <2023100253-amino-pencil-9a96@gregkh>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


--hg27zwbq4ewyulrd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Greg,

On Mon, Oct 02, 2023 at 04:53:05PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Oct 02, 2023 at 04:49:59PM +0200, Uwe Kleine-K=F6nig wrote:
> > On Mon, Oct 02, 2023 at 04:39:47PM +0200, Greg Kroah-Hartman wrote:
> > > On Thu, Sep 14, 2023 at 10:02:51PM +0200, Uwe Kleine-K=F6nig wrote:
> > > > @@ -469,8 +469,17 @@ static int mtu3_remove(struct platform_device =
*pdev)
> > > >  		ssusb_gadget_exit(ssusb);
> > > >  		ssusb_host_exit(ssusb);
> > > >  		break;
> > > > -	default:
> > > > -		return -EINVAL;
> > > > +	case USB_DR_MODE_UNKNOWN:
> > > > +		/*
> > > > +		 * This cannot happen because with dr_mode =3D=3D
> > > > +		 * USB_DR_MODE_UNKNOWN, .probe() doesn't succeed and so
> > > > +		 * .remove() wouldn't be called at all. However (little
> > > > +		 * surprising) the compiler isn't smart enough to see that, so
> > > > +		 * we explicitly have this case item to not make the compiler
> > > > +		 * wail about an unhandled enumeration value.
> > > > +		 */
> > > > +		WARN_ON(1);
> > >=20
> > > Please don't add new WARN_ON() calls to the kernel, print out a big
> > > error message and return, don't reboot the machine.
> >=20
> > Huh, printing out an loud error message was my intention. It's news to
> > me that WARN_ON() reboots the machine?! I thought BUG_ON() was the one
> > with the effects you describe that I shouldn't use.
>=20
> panic-on-warn is set for zillions[1] of Linux systems out there, so syste=
ms
> will reboot.

The people enabling panic-on-warn *ask* for a reboot if something
strange happens, right? If ssusb->dr_mode is USB_DR_MODE_UNKNOWN in
=2Eremove() but wasn't in .probe(), that's strange, right? If I don't
enable panic-on-warn, my system just emits a warning and then the driver
copes with what it has, right? Sounds to me as if WARN_ON does exactly
what is the right thing here.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--hg27zwbq4ewyulrd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUbOSUACgkQj4D7WH0S
/k73VAf/bYOpCEbYJH0iGNvkDefNZLTcSn9QJ7WebUaLIjOe6+f4f0djN+kP4vrg
OGSxlu57k6P1LmlUSBQRPM2lgiYhXdkYiPKy+hLwMFPHJZjjDvKg+ehYkMuJM8ak
DclcequZV219HDC2z687M6Xw13s4cyE2UGtMXjYzwKnPKDtXJ9d+puvjAhfZNOdu
UDRwgHuJ02J0SyQ3IdqgwH2E3ftI9zD2b0NEPscXdKvA5UHY/Hj1e79ogW74dmaO
Jqo7paa/IBXFEi9sB8bRi+E6K+D7Q1c6i7Ymu6FAla3PZirGhrv7Q/69718utVuT
xuKImDDI7RbiEu1LvGV4c9/PFlVcSQ==
=UXJW
-----END PGP SIGNATURE-----

--hg27zwbq4ewyulrd--

