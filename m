Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB87E2202DC
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 05:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbgGODS2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 23:18:28 -0400
Received: from sender4-op-o17.zoho.com ([136.143.188.17]:17767 "EHLO
        sender4-op-o17.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbgGODS1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jul 2020 23:18:27 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1594783094; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=M8jFZ5w31BGSKuDrRQFUlAWEZdPssNSV1ybtkuWCfaneZLF0NSCrHFbNGxzAwvwK1p+Nn5IhZXQOJfKcNNng39pWSlwZOuKxG4S2VGQdksF0wfhOKYs8aRBA7DSKVnImxrLG+caBEappQs9WcQFh0NVe9X9BKRER0sBJzaJOXVk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1594783094; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=f+1eAUhYomjoHe1caTpLxfdRQP9aa8Lrm5dd0dEOGWw=; 
        b=kQrLDj3chvXKzVfsNZWAP7Y4ILOnpl5N5sx9i+Awl43fOBZh9miWNGsk6lVDBO0Zfgy0b5TjX6nyL1q9+MFj6tOlrou0dTRdsvk2vC4SaLUrAWy1/TmGVkdjiZtU81863rwTdlm4xO776DqPv9XU6hGayQsBA37vKbl+M4dAWpc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        spf=pass  smtp.mailfrom=dan@dlrobertson.com;
        dmarc=pass header.from=<dan@dlrobertson.com> header.from=<dan@dlrobertson.com>
Received: from nessie (pool-108-28-30-30.washdc.fios.verizon.net [108.28.30.30]) by mx.zohomail.com
        with SMTPS id 1594783091744625.0831092958844; Tue, 14 Jul 2020 20:18:11 -0700 (PDT)
Date:   Wed, 15 Jul 2020 02:58:49 +0000
From:   Dan Robertson <dan@dlrobertson.com>
To:     Anand Moon <linux.amoon@gmail.com>
Cc:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/1] usb: dwc3: meson-g12a: fix shared reset control use
Message-ID: <20200715025849.GA8160@nessie>
References: <20200713160522.19345-1-dan@dlrobertson.com>
 <CANAwSgR3ry19bxi8ZG026tHi-Bj+mP_O=PHuzUR_ujhjsdeLzA@mail.gmail.com>
 <20200714133024.GA27406@gothmog.test>
 <CANAwSgQJgqHC41D8f+9J5cEpeg71PD-Oc08wQgzdjRPY6ZsuLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
In-Reply-To: <CANAwSgQJgqHC41D8f+9J5cEpeg71PD-Oc08wQgzdjRPY6ZsuLQ@mail.gmail.com>
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2020 at 08:57:35PM +0530, Anand Moon wrote:
> Hi Dan,
>=20
> On Tue, 14 Jul 2020 at 19:00, Dan Robertson <dan@dlrobertson.com> wrote:
> >
> > Hi Anand!
> >
> > On Tue, Jul 14, 2020 at 12:26:57PM +0530, Anand Moon wrote:
> > > hi Dan,
> > >
> > > On Mon, 13 Jul 2020 at 21:37, Dan Robertson <dan@dlrobertson.com> wro=
te:
> > > >
> > > > When testing suspend for another driver I noticed the following war=
ning:
> > > >
> > > > WARNING: CPU: 1 PID: 5530 at drivers/reset/core.c:355 reset_control=
_assert+0x184/0x19c
> > > > Hardware name: Hardkernel ODROID-N2 (DT)
> > > > [..]
> > > > pc : reset_control_assert+0x184/0x19c
> > > > lr : dwc3_meson_g12a_suspend+0x68/0x7c
> > > > [..]
> > > > Call trace:
> > > >  reset_control_assert+0x184/0x19c
> > > >  dwc3_meson_g12a_suspend+0x68/0x7c
> > > >  platform_pm_suspend+0x28/0x54
> > > >  __device_suspend+0x590/0xabc
> > > >  dpm_suspend+0x104/0x404
> > > >  dpm_suspend_start+0x84/0x1bc
> > > >  suspend_devices_and_enter+0xc4/0x4fc
> > > >
> > > > In my limited experience and knowlege it appears that we hit this
> > > > because the reset control was switched to shared and the the use
> > > > of the reset control was not changed.
> > > >
> > > > > * Calling reset_control_assert without first calling reset_contro=
l_deassert
> > > > > * is not allowed on a shared reset control. Calling reset_control=
_reset is
> > > > > * also not allowed on a shared reset control.
> > > >
> > > > The above snippet from reset_control_get_shared() seems to indicate=
 that
> > > > this is due to the use of reset_control_reset() in dwc3_meson_g12a_=
probe()
> > > > and reset_control_deassert is not guaranteed to have been called
> > > > before dwc3_meson_g12a_suspend() and reset_control_assert().
> > > >
> > > > After some basic tests with the following patch I no longer hit the
> > > > warning. Comments and critiques on the patch are welcome. If there =
is a
> > > > reason for the current use of the reset control, I'd love to learn =
why!
> > > > Like I said before, I have not really looked at this driver before =
and
> > > > have verify limited experience with reset controls... Was working on
> > > > another driver, hit the warning, and thought I'd take a shot at the
> > > > fix :-)
> > > >
> > > Thanks, I was also looking into this issue
> >
> > Awesome!
> >
> > > So best Fix to this issue is to drop the call of reset_control_assert
> > > from dwc3_meson_g12a_suspend
> > > and drop the call of reset_control_deassert from dwc3_meson_g12a_resu=
me
> > > With these changes we do not see the warning on suspend and resume
> >
> > We definitely would avoid hitting the warning without the
> > reset_control_(de)assert calls in suspend and resume. That is a valid u=
se of
> > the reset control, but why would that be best?
> >
> > From reset_control_reset():
>=20
> Before entering the suspend state the code tries to do following
>      clk_bulk_disable_unprepare
>      regulator_disable
>      phy_power_off
>      phy_exit
>=20
> After this operation it's needless to call *reset_control_assert*
> I tried to move this call before all the above operations
> but still no success with this.

How so? Once the reset() is removed prope() and deassert() is guaranteed
to have been called before suspend, like what is in the patch and similar
to other uses of shared reset controllers, this is possible.

> Similarly on resume we should avoid calling resume
> *reset_control_deassert* earlier
> as the core is just reinitializing the devices.
>       clk_bulk_prepare_enable
>       usb_init
>       phy_init
>       phy_power_on
>       regulator_enable
> >
> > > * Consumers must not use reset_control_(de)assert on shared reset lin=
es when
> > > * reset_control_reset has been used.
> >
> > If we use reset_control_reset() then we can not (de)assert the reset li=
ne
> > on suspend/resume or any other time. Wouldn't we want to be able to
> > (de)assert the reset line? And why do we no longer want to (de)assert t=
he
> > reset line on suspend/resume?
> >
> > > > Can you try this attached patch?
> > >
> > I think I had already tested something similar. Removing the (de)assert=
 calls
> > but keeping reset will definitely remove the warning, but it means we c=
an not
> > (de)assert the line. My guess is that this is not what we want, but I c=
ould be
> > wrong. Thoughts, input, or references to documentation on this would be
> > appreciated.
> >
>=20
> As per my knowledge suspend to mem will do complete power down of the
> devices with support suspend and resume feature sequentially and then it =
tries
> to bring the device up one by one.
> So it should also take care of reset lines as well.

So do we only _actually_ care about the reset line in the probe? Seems like=
 we
should remove the reset controller from the structure if that is the case.

Cheers,

 - Dan

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEF5dO2RaKc5C+SCJ9RcSmUsR+QqUFAl8OcOcACgkQRcSmUsR+
QqXV9g//Xrbt00SopkjisgfWqpjjMVmZ5rp3V6VXDUuu6vw8xK8zwu3QS6icnuNd
6K0VAmrPr/3pye6ArrYi0K0O61oyh6xpDGUx2psu3XM0tDWWoKXIuoGLtnZsaT85
781I0iU08oFtTmIVzm0qxMH1acDg4EiQNBwQou6Nh3Xu8qNWntgT5JkpV9VTQxAU
+uzvz6g8SlEDaRRTEV/vRlrog0Afmg1Cj5CSW8fn0M6TFUUn7xL4cPw8q1uBXKvu
IHYS88jmWjapGVcKO8NveQFsq0jIoooHTn1QDt1mLdJ6b5AoUc4RMxQaY6wb+sPH
KUFtoNleGeCO+pHEbTwZj/hHHlJEjWuAJgpLZ3Anw5HJFH2qJb0zKxlSkzpdBaAD
V+GfcgPNPqP3QT9b7E3FkPC6ZoFiwTybHmDQNx3TSUsVenBEGW+kCW8AnhK4ISQH
gDjXGWjvQxmx7MEafjJBmqO9MuJjG1E9Du4QkFBMK9iZ4agdyrEvBsws3dh6fQ+w
XhzO5exC9RzBSJ8JXfvDONDNDorsEaVWFC6OmAVmXZcZTcytlR3z4tO+QxOX75CZ
bf/uk/UMbDVdde4Yw9TWbF0m4RGRl06KwYDcGZiWfYBNUZcnnO6JsLpWNS01nqPv
D0NGL0UOu7ypPRkRQe1k6fx/N9iD5jF6OvOFyZqAc+9XqMvQfTo=
=R7ca
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
