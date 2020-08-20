Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEC1424C61D
	for <lists+linux-usb@lfdr.de>; Thu, 20 Aug 2020 21:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728003AbgHTTFI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Aug 2020 15:05:08 -0400
Received: from sender4-op-o17.zoho.com ([136.143.188.17]:17784 "EHLO
        sender4-op-o17.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727833AbgHTTFH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Aug 2020 15:05:07 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1597950288; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=nVYoRHTP5nihvDHd9H33RYFU/a3bcpIrCByItMnzjIsmCDL1WsGTynuy3+zJmo5T/LXRbQCRybTfss+saEzpMz3TVvVIti4mkaZ25Md597zZC3OPtXgvTz1pOFSoNYHosWcOiFc8X9t4bBWrcgoRMeUUWnP060BHD6c6pTD8GTE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1597950288; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=2wY6PlH5/NsVxj4VbcKZj0ucBST8105Nldk4fm+SueU=; 
        b=i3y37MKTud9bq15sZzglwvDkJi3k8VrYj+PlnzDvZXB95PBKhhgdziOBgJSLumuRVVmSC/O4jG4dRi3yUlGyow4zWsAW+vYw+vZIJjMOGwtzWw+8TV4wyRUJ0+P3pSju4qWQQpMvNEZNY5bxJ9CEUyiKswUbgLnFVrJYI1+Nzfc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        spf=pass  smtp.mailfrom=dan@dlrobertson.com;
        dmarc=pass header.from=<dan@dlrobertson.com> header.from=<dan@dlrobertson.com>
Received: from nessie (pool-108-28-30-30.washdc.fios.verizon.net [108.28.30.30]) by mx.zohomail.com
        with SMTPS id 159795028151961.6841726816898; Thu, 20 Aug 2020 12:04:41 -0700 (PDT)
Date:   Thu, 20 Aug 2020 18:44:37 +0000
From:   Dan Robertson <dan@dlrobertson.com>
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, aouledameur@baylibre.com
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
Message-ID: <20200820184437.GA4528@nessie>
References: <20200713160522.19345-1-dan@dlrobertson.com>
 <20200713160522.19345-2-dan@dlrobertson.com>
 <1jy2maekzf.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <1jy2maekzf.fsf@starbuckisacylon.baylibre.com>
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2020 at 05:03:32PM +0200, Jerome Brunet wrote:
>=20
> On Mon 13 Jul 2020 at 18:05, Dan Robertson <dan@dlrobertson.com> wrote:
>=20
> > The reset is a shared reset line, but reset_control_reset is still used
> > and reset_control_deassert is not guaranteed to have been called before
> > the first reset_control_assert call. When suspending the following
> > warning may be seen:
>=20
> And now the same type of warning maybe seen on boot. This is
> happening for me on the libretech-cc (s905x - gxl).
>=20
> [    1.863469] ------------[ cut here ]------------
> [    1.867914] WARNING: CPU: 1 PID: 16 at drivers/reset/core.c:309 reset_=
control_reset+0x130/0x150
> [    1.876525] Modules linked in:
> [    1.879548] CPU: 1 PID: 16 Comm: kworker/1:0 Not tainted 5.9.0-rc1-001=
67-ga2e4e3a34775 #64
> [    1.887737] Hardware name: Libre Computer AML-S905X-CC V2 (DT)
> [    1.893525] Workqueue: events deferred_probe_work_func
> [    1.898607] pstate: 80000005 (Nzcv daif -PAN -UAO BTYPE=3D--)
> [    1.904126] pc : reset_control_reset+0x130/0x150
> [    1.908700] lr : phy_meson_gxl_usb2_init+0x24/0x70
> [    1.913439] sp : ffff8000123ebad0
> [    1.916717] x29: ffff8000123ebad0 x28: 0000000000000000=20
> [    1.921978] x27: ffff00007c4b1ac8 x26: ffff00007c4b1ab0=20
> [    1.927239] x25: ffff00007fc149b0 x24: ffff00007c4b1ab0=20
> [    1.932500] x23: ffff00007cd03800 x22: ffff800011fb9000=20
> [    1.937761] x21: ffff00007c60db08 x20: ffff00007c468a80=20
> [    1.943023] x19: ffff00007c466b00 x18: ffffffffffffffff=20
> [    1.948284] x17: 0000000000000000 x16: 000000000000000e=20
> [    1.953545] x15: ffff800011fb9948 x14: ffffffffffffffff=20
> [    1.958806] x13: ffffffff00000000 x12: ffffffffffffffff=20
> [    1.964068] x11: 0000000000000020 x10: 7f7f7f7f7f7f7f7f=20
> [    1.969329] x9 : 78676f2c32617274 x8 : 0000000000000000=20
> [    1.974590] x7 : ffffffffffffffff x6 : 0000000000000000=20
> [    1.979851] x5 : 0000000000000000 x4 : 0000000000000000=20
> [    1.985112] x3 : 0000000000000000 x2 : ffff8000107aa370=20
> [    1.990374] x1 : 0000000000000001 x0 : 0000000000000001=20
> [    1.995636] Call trace:
> [    1.998054]  reset_control_reset+0x130/0x150
> [    2.002279]  phy_meson_gxl_usb2_init+0x24/0x70
> [    2.006677]  phy_init+0x78/0xd0
> [    2.009784]  dwc3_meson_g12a_probe+0x2c8/0x560
> [    2.014182]  platform_drv_probe+0x58/0xa8
> [    2.018149]  really_probe+0x114/0x3d8
> [    2.021770]  driver_probe_device+0x5c/0xb8
> [    2.025824]  __device_attach_driver+0x98/0xb8
> [    2.030138]  bus_for_each_drv+0x74/0xd8
> [    2.033933]  __device_attach+0xec/0x148
> [    2.037726]  device_initial_probe+0x24/0x30
> [    2.041868]  bus_probe_device+0x9c/0xa8
> [    2.045663]  deferred_probe_work_func+0x7c/0xb8
> [    2.050150]  process_one_work+0x1f0/0x4b0
> [    2.054115]  worker_thread+0x210/0x480
> [    2.057824]  kthread+0x158/0x160
> [    2.061017]  ret_from_fork+0x10/0x18
> [    2.064550] ---[ end trace 94d737efe593c6f6 ]---
> [    2.069158] phy phy-d0078000.phy.0: phy init failed --> -22
> [    2.074858] dwc3-meson-g12a: probe of d0078080.usb failed with error -=
22
>=20
> This breaks USB on this device. reverting the change brings it back.
>=20
> Looking at the reset framework code, I don't think drivers sharing the
> same reset line should mix using reset_control_reset() VS
> reset_control_assert()/reset_control_deassert()
>=20

Thanks for finding this. I was only able to test on the Odroid N2

> >
> > WARNING: CPU: 1 PID: 5530 at drivers/reset/core.c:355 reset_control_ass=
ert+0x184/0x19c
> > Hardware name: Hardkernel ODROID-N2 (DT)
> > [..]
> > pc : reset_control_assert+0x184/0x19c
> > lr : dwc3_meson_g12a_suspend+0x68/0x7c
> > [..]
> > Call trace:
> >  reset_control_assert+0x184/0x19c
> >  dwc3_meson_g12a_suspend+0x68/0x7c
> >  platform_pm_suspend+0x28/0x54
> >  __device_suspend+0x590/0xabc
> >  dpm_suspend+0x104/0x404
> >  dpm_suspend_start+0x84/0x1bc
> >  suspend_devices_and_enter+0xc4/0x4fc
> >  pm_suspend+0x198/0x2d4
> >
> > Fixes: 6d9fa35a347a87 ("usb: dwc3: meson-g12a: get the reset as shared")
> > Signed-off-by: Dan Robertson <dan@dlrobertson.com>
> > ---
> >  drivers/usb/dwc3/dwc3-meson-g12a.c | 15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3=
-meson-g12a.c
> > index 1f7f4d88ed9d..88b75b5a039c 100644
> > --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> > +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> > @@ -737,13 +737,13 @@ static int dwc3_meson_g12a_probe(struct platform_=
device *pdev)
> >  		goto err_disable_clks;
> >  	}
> > =20
> > -	ret =3D reset_control_reset(priv->reset);
> > +	ret =3D reset_control_deassert(priv->reset);
>=20
> The change introduced here is significant. If the reset is not initially
> asserted, it never will be before the life of the device.
>=20
> This means that Linux will have to deal which whatever state is left by t=
he
> bootloader. This looks sketchy ...
>=20
> I think the safer way solve the problem here would be to keep using
> reset_control_reset() and introduce a new API in the reset
> framework to decrement the reset line "triggered_count"
> (reset_control_clear() ??)

I have very limited experience with reset controls, but phy_meson_gxl_usb2_=
init
calls reset_control_reset on a shared reset line, which should not be done
according to the reset control docs. Would removing the use of reset_contro=
l_reset,
or using reset_control_(de)assert in phy_meson_gxl_usb2_init also resolve t=
he
issue?

> That way, if all device using the reset line go to suspend, the line will
> be "reset-able" again by the first device coming out of suspend ?
>=20
> Philip, would you be ok with such new API ?
>=20
> In the meantime, I think this change should be reverted. A warning on
> suspend seems less critical than a regression breaking USB completly.

The reset_control_(de)assert() calls could also be removed from the
suspend/resume calls for now.

> >  	if (ret)
> > -		goto err_disable_clks;
> > +		goto err_assert_reset;
> > =20
> >  	ret =3D dwc3_meson_g12a_get_phys(priv);
> >  	if (ret)
> > -		goto err_disable_clks;
> > +		goto err_assert_reset;
> > =20
> >  	ret =3D priv->drvdata->setup_regmaps(priv, base);
> >  	if (ret)
> > @@ -752,7 +752,7 @@ static int dwc3_meson_g12a_probe(struct platform_de=
vice *pdev)
> >  	if (priv->vbus) {
> >  		ret =3D regulator_enable(priv->vbus);
> >  		if (ret)
> > -			goto err_disable_clks;
> > +			goto err_assert_reset;
> >  	}
> > =20
> >  	/* Get dr_mode */
> > @@ -765,13 +765,13 @@ static int dwc3_meson_g12a_probe(struct platform_=
device *pdev)
> > =20
> >  	ret =3D priv->drvdata->usb_init(priv);
> >  	if (ret)
> > -		goto err_disable_clks;
> > +		goto err_assert_reset;
> > =20
> >  	/* Init PHYs */
> >  	for (i =3D 0 ; i < PHY_COUNT ; ++i) {
> >  		ret =3D phy_init(priv->phys[i]);
> >  		if (ret)
> > -			goto err_disable_clks;
> > +			goto err_assert_reset;
> >  	}
> > =20
> >  	/* Set PHY Power */
> > @@ -809,6 +809,9 @@ static int dwc3_meson_g12a_probe(struct platform_de=
vice *pdev)
> >  	for (i =3D 0 ; i < PHY_COUNT ; ++i)
> >  		phy_exit(priv->phys[i]);
> > =20
> > +err_assert_reset:
> > +	reset_control_assert(priv->reset);
> > +
> >  err_disable_clks:
> >  	clk_bulk_disable_unprepare(priv->drvdata->num_clks,
> >  				   priv->drvdata->clks);
> >
> >
> > _______________________________________________
> > linux-amlogic mailing list
> > linux-amlogic@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-amlogic
>=20

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEF5dO2RaKc5C+SCJ9RcSmUsR+QqUFAl8+xJMACgkQRcSmUsR+
QqV/iQ/+MjU7tkSy/m/QlIsfgh/+YpRS+n/prRA3hWbdBnnkpw9DN8DEU6lrrDam
2QQsGX0jmvHy6tq5SZ/n8mIlTN2MnCZ/nN3khZwsx+DSAPhjQV7G9yi+k0LZ1/aX
QeqmWdm62VG+PpIzR/MvfxvPNRW0pfZLg+qSCjlMtTsFCgaZcHZqBgBV4HcQzh2q
/JMedaSwyGaPBmbrU4wO6esF5E2/yWNx6s/eY8yss7xSDEsEdpJKBBpvfCk6zRff
rrboqfyoTVoY5EqehDLVIw8+53XDcYLcHiOfG4jVp4hFKGufL0g8mGjhUN+0HUJn
ZVf1QzSV+cJ9GnSwCjP2svgyO690YerOptXbGDiSecE/Iw9yEyY+7S10AnGNp9r0
JWadcfp8WNsEAgh/NDW5ka7r84G1FE25fjSZLi177qGJOHiIFBCcrWJ99Tde7awG
plpTCg7UbxrsDknv/5m48MyeKgRhC6DJT/6njWBXwqakDPxYKFyTUEERY8Uj4N2J
/nYVe9QHEsFeI+IcfQwITGgO4yhl0hs0raP9F4rl3dR4g9oDksYxP8VcmWUku63I
SuOXGafvGLIyflBvfH+CvB/NYhoQ9xpO4grsqwvUD7GtzsRmZHdfzmmdezTGK7u+
XvxLztDwqpHqOvnNtqD0qxec8kWoWvHKagr4nILGDJiW4Ih4AUc=
=LF+n
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
