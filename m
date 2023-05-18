Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B9CD7084AA
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 17:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231282AbjERPJH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 May 2023 11:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231309AbjERPJF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 May 2023 11:09:05 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D893A3
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 08:08:57 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzfFL-0006nM-5f; Thu, 18 May 2023 17:08:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzfFI-00171u-92; Thu, 18 May 2023 17:08:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzfFH-005gKr-Hd; Thu, 18 May 2023 17:08:47 +0200
Date:   Thu, 18 May 2023 17:08:47 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 83/97] usb: xhci-plat: Convert to platform remove
 callback returning void
Message-ID: <20230518150847.yukjre456py42de6@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-84-u.kleine-koenig@pengutronix.de>
 <TYBPR01MB5341DBF2AD2729EA2A40786BD87F9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="37qiwezbcd5d3pzt"
Content-Disposition: inline
In-Reply-To: <TYBPR01MB5341DBF2AD2729EA2A40786BD87F9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--37qiwezbcd5d3pzt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, May 18, 2023 at 02:28:44AM +0000, Yoshihiro Shimoda wrote:
> > From: Uwe Kleine-K=F6nig, Sent: Thursday, May 18, 2023 8:02 AM
> >=20
> > The .remove() callback for a platform driver returns an int which makes
> > many driver authors wrongly assume it's possible to do error handling by
> > returning an error code. However the value returned is ignored (apart f=
rom
> > emitting a warning) and this typically results in resource leaks. To im=
prove
> > here there is a quest to make the remove callback return void. In the f=
irst
> > step of this quest all drivers are converted to .remove_new() which alr=
eady
> > returns void. Eventually after all drivers are converted, .remove_new()=
 is
> > renamed to .remove().
> >=20
> > Trivially convert this driver from always returning zero in the remove
> > callback to the void returning variant.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/usb/host/xhci-plat.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> > index b0c8e8efc43b..523e3843db5e 100644
> > --- a/drivers/usb/host/xhci-plat.c
> > +++ b/drivers/usb/host/xhci-plat.c
> > @@ -399,7 +399,7 @@ static int xhci_generic_plat_probe(struct platform_=
device *pdev)
> >  	return xhci_plat_probe(pdev, sysdev, priv_match);
> >  }
> >=20
> > -int xhci_plat_remove(struct platform_device *dev)
> > +void xhci_plat_remove(struct platform_device *dev)
>=20
> We should change the prototype in the xhci-plat.h. Otherwise
> the following build error happens:
> ---
> drivers/usb/host/xhci-plat.c:398:6: error: conflicting types for 'xhci_pl=
at_remove'; have 'void(struct platform_device *)'
>   398 | void xhci_plat_remove(struct platform_device *dev)
>       |      ^~~~~~~~~~~~~~~~
> In file included from drivers/usb/host/xhci-plat.c:25:
> drivers/usb/host/xhci-plat.h:28:5: note: previous declaration of 'xhci_pl=
at_remove' with type 'int(struct platform_device *)'
>    28 | int xhci_plat_remove(struct platform_device *dev);
>       |     ^~~~~~~~~~~~~~~~
> In file included from ./include/linux/linkage.h:7,
>                  from ./include/linux/kernel.h:17,
>                  from ./include/linux/clk.h:13,
>                  from drivers/usb/host/xhci-plat.c:11:
> drivers/usb/host/xhci-plat.c:430:19: error: conflicting types for 'xhci_p=
lat_remove'; have 'void(struct platform_device *)'
> ---
>=20
> Since the xhci-rcar.c uses xhci_plat_remove(), we should change
> the xhci-rcar.c in this patch too, I think.

indeed, I squashed the following change into this patch in my tree:


diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
index 83b5b5aa9f8e..2d15386f2c50 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/drivers/usb/host/xhci-plat.h
@@ -25,7 +25,7 @@ struct xhci_plat_priv {
 int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev,
 		    const struct xhci_plat_priv *priv_match);
=20
-int xhci_plat_remove(struct platform_device *dev);
+void xhci_plat_remove(struct platform_device *dev);
 extern const struct dev_pm_ops xhci_plat_pm_ops;
=20
 #endif	/* _XHCI_PLAT_H */
diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index ad966b797b89..bf5261fed32c 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -276,10 +276,10 @@ static int xhci_renesas_probe(struct platform_device =
*pdev)
 }
=20
 static struct platform_driver usb_xhci_renesas_driver =3D {
-	.probe	=3D xhci_renesas_probe,
-	.remove	=3D xhci_plat_remove,
+	.probe =3D xhci_renesas_probe,
+	.remove_new =3D xhci_plat_remove,
 	.shutdown =3D usb_hcd_platform_shutdown,
-	.driver	=3D {
+	.driver =3D {
 		.name =3D "xhci-renesas-hcd",
 		.pm =3D &xhci_plat_pm_ops,
 		.of_match_table =3D usb_xhci_of_match,

(which also "fixes" the alignments of =3D).

@Greg: Assuming it will be you who picks up this series, I suggest you
skip this patch for now and I address this together with the other
changes that need still be done for drivers/usb before we switch back to
=2Eremove() with the fixed prototype. (There are a few drivers[1] that
might return an error code in .remove(), didn't look into those yet.)

Best regards
Uwe

[1] drivers/usb/gadget/udc/aspeed_udc.c
    drivers/usb/gadget/udc/at91_udc.c
    drivers/usb/gadget/udc/fsl_udc_core.c
    drivers/usb/gadget/udc/gr_udc.c
    drivers/usb/gadget/udc/lpc32xx_udc.c
    drivers/usb/gadget/udc/pxa25x_udc.c
    drivers/usb/misc/onboard_usb_hub.c
    drivers/usb/mtu3/mtu3_plat.c

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--37qiwezbcd5d3pzt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRmP3kACgkQj4D7WH0S
/k63RwgAm0pgUXOHe8iYOT5/c0zOnpLakYBObnJ8aUbCkKtOZrd68AWi/daIRPFf
jZ4AoHNl/YywLPtgHpksfpMPZP6O5F48SnA+Pwofa7/u/wUSsU4f4lSBn2Ls6mio
KkFxVQHx+Rd35InGsB5P1V0BoijI4DVlkHEPtJlj5npET4QUnMJNLQd+y0KIo3SI
GlLa1vNQdXQ8mMwTi1a+ff7KNc8jIHnfYEY5U2m+xE9p2iMN5A9G9G1MHNVW/euT
CXvg3ajRk0bM9ZZ89BTaYo6tmPIeNWMO6XEon2NutF3j0SzRoT4f4EyVq4t6qplK
fiavB/RsqVuzVzJYEpKo0iS752JKNw==
=am1U
-----END PGP SIGNATURE-----

--37qiwezbcd5d3pzt--
