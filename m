Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39FF2435FDB
	for <lists+linux-usb@lfdr.de>; Thu, 21 Oct 2021 13:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbhJULE4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Oct 2021 07:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbhJULEx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Oct 2021 07:04:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EA08C061749
        for <linux-usb@vger.kernel.org>; Thu, 21 Oct 2021 04:02:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mdVqC-0000p6-Cl; Thu, 21 Oct 2021 13:02:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mdVqB-0008Fo-8C; Thu, 21 Oct 2021 13:02:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mdVqB-0001Gb-79; Thu, 21 Oct 2021 13:02:31 +0200
Date:   Thu, 21 Oct 2021 13:02:31 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Peter Chen <peter.chen@nxp.com>,
        "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: imx25: provide a fixed regulator for usb phys
Message-ID: <20211021110231.pcdjjax67ygs3iok@pengutronix.de>
References: <20190625100412.11815-1-u.kleine-koenig@pengutronix.de>
 <VI1PR04MB5327E09DB0DFEB7E868DB59D8BE20@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <20190626055409.jjiwptyths6p6jty@pengutronix.de>
 <VI1PR04MB53270E979BA9817D47A7AFC88BFD0@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <20190724130939.43t66umrasbe4wwf@pengutronix.de>
 <20190923102825.zemkconnvdibke5h@pengutronix.de>
 <20191115090757.usc753lq7uujtqyy@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gdginxlkf2f7j5c4"
Content-Disposition: inline
In-Reply-To: <20191115090757.usc753lq7uujtqyy@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--gdginxlkf2f7j5c4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2019 at 10:07:57AM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> On Mon, Sep 23, 2019 at 12:28:25PM +0200, Uwe Kleine-K=F6nig wrote:
> > On Wed, Jul 24, 2019 at 03:09:39PM +0200, Uwe Kleine-K=F6nig wrote:
> > > On Thu, Jun 27, 2019 at 03:15:10AM +0000, Peter Chen wrote:
> > > > =20
> > > > > On 19-06-26 02:40, Peter Chen wrote:
> > > > > >
> > > > > > > Subject: [PATCH] ARM: imx25: provide a fixed regulator for us=
b phys
> > > > > > >
> > > > > > > The usb phys are internal to the SoC and so it their 5V suppl=
y. With
> > > > > > > this regulator added explicitly the following (harmless) boot=
 messages go away:
> > > > > > >
> > > > > > > 	usb_phy_generic usbphy:usb-phy@0: usbphy:usb-phy@0 supply vc=
c not found, using dummy regulator
> > > > > > > 	usb_phy_generic usbphy:usb-phy@1: usbphy:usb-phy@1 supply vc=
c not found, using dummy regulator
> > > > > > >
> > > > > >
> > > > > > To eliminate the warning message, I suggest doing below changes=
, as
> > > > > > vcc supply is not mandatory.
> > > > > >
> > > > > > diff --git a/drivers/usb/phy/phy-generic.c
> > > > > > b/drivers/usb/phy/phy-generic.c index a53b89be5324..01a5ff1a0515
> > > > > > 100644
> > > > > > --- a/drivers/usb/phy/phy-generic.c
> > > > > > +++ b/drivers/usb/phy/phy-generic.c
> > > > > > @@ -275,7 +275,7 @@ int usb_phy_gen_create_phy(struct device *d=
ev, struct usb_phy_generic *nop,
> > > > > >                 }
> > > > > >         }
> > > > > >
> > > > > > -       nop->vcc =3D devm_regulator_get(dev, "vcc");
> > > > > > +       nop->vcc =3D devm_regulator_get_optional(dev, "vcc");
> > > > >=20
> > > > > Is the regulator optional? IMHO this shouldn't be the fix. I thin=
k the right fix is Uwe's
> > > > > approach.
> > > > >=20
> > > >=20
> > > > Add Felipe.
> > > >=20
> > > > Some USB PHY's power are from the core system's power (eg, DDR), an=
d some are
> > > > fixed at the board and no switch for it. So, it is transparent for =
software at some cases.
> > >=20
> > > It's not clear to me how to proceed. There are two opposing opinions =
and
> > > I don't know enough about USB on mx25 to judge myself.
> > >=20
> > > Felipe?
> >=20
> > This thread is still open in my inbox. Felipe, how can I lure you into
> > giving your opinion?
> >=20
> > My original suggestion can be seen at
> > https://lore.kernel.org/linux-usb/20190625100412.11815-1-u.kleine-koeni=
g@pengutronix.de/,
> > Peter's alternative is still in the quotes above. Which is the
> > right/better one?
>=20
> The stuff said above is still true. I'd like to put this issue on file
> with "fixed in mainline", but currently this seems to be a stalemate.
> because nobody cares enough :-|

This topic is on stall since two years now and I still have the patch in
the patch stack for my mx25 boards.

In my eyes my patch is the right one, because no matter how, the usb
phys need some powering, so devm_regulator_get_optional() doesn't seem
to be the right approach.

Would resending the patch help?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--gdginxlkf2f7j5c4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFxSL4ACgkQwfwUeK3K
7AnS6ggAjw0nNGSQUE4mj6ul03QBEsSYmsAm+MYYaWAnmB7vSVXYQJb0RVxPsJJc
nG7X5xPTHn6mLZfznqkJxxcuSQcvBi0XhLzyFBE3MzqIUyHAJE5Rwq+1/LYpr56S
5qrzXNHWHrame3REZpFBtK6ocy+lxksqezMwrQscp1+LszOLq4tiTrVnExxeTEyR
l21R9J3Er1b/4icxCj/7R/W3WpTXEhHIDuEZJUAZNXkW4CRMU9RUWTm7SXC+7ly5
Oct6N2mbZXST5YKVXMF8pTQ4Mx2EZvWvUh6t2KDRT42wRGqEnMpL1LIZkSuyx45D
sezdxPdeLJyJSoT8UrpRa6LLJxNRpw==
=tWhJ
-----END PGP SIGNATURE-----

--gdginxlkf2f7j5c4--
