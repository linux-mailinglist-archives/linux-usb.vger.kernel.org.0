Return-Path: <linux-usb+bounces-932-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7197B5572
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 16:50:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 1B59A282BCB
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 14:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CBB1A70C;
	Mon,  2 Oct 2023 14:50:11 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF8C1A5BF
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 14:50:08 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C2B3B3
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 07:50:06 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnKFG-0006vn-V6; Mon, 02 Oct 2023 16:50:02 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnKFD-00AXvt-VV; Mon, 02 Oct 2023 16:49:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnKFD-007xLb-M9; Mon, 02 Oct 2023 16:49:59 +0200
Date: Mon, 2 Oct 2023 16:49:59 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH v2] usb: mtu3: Convert to platform remove callback
 returning void
Message-ID: <20231002144959.jc6wwfrvwd4cyu2l@pengutronix.de>
References: <20230914200251.919584-1-u.kleine-koenig@pengutronix.de>
 <2023100219-variety-genre-befe@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qdwkgsz6chxs3e5y"
Content-Disposition: inline
In-Reply-To: <2023100219-variety-genre-befe@gregkh>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


--qdwkgsz6chxs3e5y
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Greg,

On Mon, Oct 02, 2023 at 04:39:47PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Sep 14, 2023 at 10:02:51PM +0200, Uwe Kleine-K=F6nig wrote:
> > @@ -469,8 +469,17 @@ static int mtu3_remove(struct platform_device *pde=
v)
> >  		ssusb_gadget_exit(ssusb);
> >  		ssusb_host_exit(ssusb);
> >  		break;
> > -	default:
> > -		return -EINVAL;
> > +	case USB_DR_MODE_UNKNOWN:
> > +		/*
> > +		 * This cannot happen because with dr_mode =3D=3D
> > +		 * USB_DR_MODE_UNKNOWN, .probe() doesn't succeed and so
> > +		 * .remove() wouldn't be called at all. However (little
> > +		 * surprising) the compiler isn't smart enough to see that, so
> > +		 * we explicitly have this case item to not make the compiler
> > +		 * wail about an unhandled enumeration value.
> > +		 */
> > +		WARN_ON(1);
>=20
> Please don't add new WARN_ON() calls to the kernel, print out a big
> error message and return, don't reboot the machine.

Huh, printing out an loud error message was my intention. It's news to
me that WARN_ON() reboots the machine?! I thought BUG_ON() was the one
with the effects you describe that I shouldn't use.

I'll retest and assuming you're right, rework accordingly.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qdwkgsz6chxs3e5y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUa2JYACgkQj4D7WH0S
/k6yhQf8DEI9qtV/aE2bDaUfap1T6VCIOVmI4TUTMbDd9QRCSoOSJ6JF+8KcXPLa
cWPUfK0zSLB6xe0e11c3izgEZdwrXzWYxzWDO+HN6GH8NTDF4pZO5w7PApYLxM4B
R7xYSaKvmGx0UwHJp/5aGSKn8o/JzX1IHtr0otQJzWDjetTB53U67Kwnz4Y2Hiv6
c586Yfdyh0XRcTrfztxjM2VdZlXDRdl4iGEBs9oGj5S88K/Tq+Nkc3sJPzWWkOCQ
e0g7V5Tc+oOOecfjg5i46qr+6Fp/qYb9oG2nCuLSBgZVB+YZZRJrkZUQTcqPdl22
VH1ovN1PT2e0CcUaieYbtwMYTXeNYQ==
=bw9v
-----END PGP SIGNATURE-----

--qdwkgsz6chxs3e5y--

