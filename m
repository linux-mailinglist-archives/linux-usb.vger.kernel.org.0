Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD4D221F28E
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 15:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728092AbgGNNan (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 09:30:43 -0400
Received: from sender4-op-o17.zoho.com ([136.143.188.17]:17787 "EHLO
        sender4-op-o17.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgGNNan (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jul 2020 09:30:43 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1594733431; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=a4/bFkvIpFwG5LcsbUwHW050lXfCUc+YAXwi2/0OdkK/+aVS4B1dH3TwbL47zpOat2yBOFr/lYJfimRdiBk4qqTkh9LpTHel0jxhCnZjl0gkqRgijmwkkyLffqVXjYtLqnpbdhw9CqftpBZeaUNPrGHdeO9ut8x6/TOwHGMIx/I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1594733431; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=5aS2Om7zs7QC5qSvMF4Wg9nw45NYTT5ngFfOSHgfKhg=; 
        b=TJBt7X0wcY4Htu37AS/uU/8o7FCrOoA4JDcjji/0PyetbrBOAR65VsL2ePFlECS1GuXyIcXtbqSJPtnWJ9IKsNUhLWByT2bPjrYN5joQsolUvO6pHpyjl6Ap7jLc7JzzVrN9JYww+J3+07ZWWHBaSiweZP5Huxva0gorK8DCrRY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        spf=pass  smtp.mailfrom=dan@dlrobertson.com;
        dmarc=pass header.from=<dan@dlrobertson.com> header.from=<dan@dlrobertson.com>
Received: from gothmog.test (pool-108-28-30-30.washdc.fios.verizon.net [108.28.30.30]) by mx.zohomail.com
        with SMTPS id 1594733427187422.3583129792786; Tue, 14 Jul 2020 06:30:27 -0700 (PDT)
Date:   Tue, 14 Jul 2020 09:30:24 -0400
From:   Dan Robertson <dan@dlrobertson.com>
To:     Anand Moon <linux.amoon@gmail.com>
Cc:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/1] usb: dwc3: meson-g12a: fix shared reset control use
Message-ID: <20200714133024.GA27406@gothmog.test>
References: <20200713160522.19345-1-dan@dlrobertson.com>
 <CANAwSgR3ry19bxi8ZG026tHi-Bj+mP_O=PHuzUR_ujhjsdeLzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline
In-Reply-To: <CANAwSgR3ry19bxi8ZG026tHi-Bj+mP_O=PHuzUR_ujhjsdeLzA@mail.gmail.com>
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Anand!

On Tue, Jul 14, 2020 at 12:26:57PM +0530, Anand Moon wrote:
> hi Dan,
>=20
> On Mon, 13 Jul 2020 at 21:37, Dan Robertson <dan@dlrobertson.com> wrote:
> >
> > When testing suspend for another driver I noticed the following warning:
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
> >
> > In my limited experience and knowlege it appears that we hit this
> > because the reset control was switched to shared and the the use
> > of the reset control was not changed.
> >
> > > * Calling reset_control_assert without first calling reset_control_de=
assert
> > > * is not allowed on a shared reset control. Calling reset_control_res=
et is
> > > * also not allowed on a shared reset control.
> >
> > The above snippet from reset_control_get_shared() seems to indicate that
> > this is due to the use of reset_control_reset() in dwc3_meson_g12a_prob=
e()
> > and reset_control_deassert is not guaranteed to have been called
> > before dwc3_meson_g12a_suspend() and reset_control_assert().
> >
> > After some basic tests with the following patch I no longer hit the
> > warning. Comments and critiques on the patch are welcome. If there is a
> > reason for the current use of the reset control, I'd love to learn why!
> > Like I said before, I have not really looked at this driver before and
> > have verify limited experience with reset controls... Was working on
> > another driver, hit the warning, and thought I'd take a shot at the
> > fix :-)
> >
> Thanks, I was also looking into this issue

Awesome!

> So best Fix to this issue is to drop the call of reset_control_assert
> from dwc3_meson_g12a_suspend
> and drop the call of reset_control_deassert from dwc3_meson_g12a_resume
> With these changes we do not see the warning on suspend and resume

We definitely would avoid hitting the warning without the
reset_control_(de)assert calls in suspend and resume. That is a valid use of
the reset control, but why would that be best?

=46rom reset_control_reset():

> * Consumers must not use reset_control_(de)assert on shared reset lines w=
hen
> * reset_control_reset has been used.

If we use reset_control_reset() then we can not (de)assert the reset line
on suspend/resume or any other time. Wouldn't we want to be able to
(de)assert the reset line? And why do we no longer want to (de)assert the
reset line on suspend/resume?

> > Can you try this attached patch?
>=20
> Best Regards
> -Anand

I think I had already tested something similar. Removing the (de)assert cal=
ls
but keeping reset will definitely remove the warning, but it means we can n=
ot
(de)assert the line. My guess is that this is not what we want, but I could=
 be
wrong. Thoughts, input, or references to documentation on this would be
appreciated.

Cheers,

 - Dan

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEF5dO2RaKc5C+SCJ9RcSmUsR+QqUFAl8Ns24ACgkQRcSmUsR+
QqV1fA//TIDTawaZrYwSlXoTvSYzWf101qruw0k8D6Mk8/iX3lU7m9aTi8LIS7S8
82uAzZlLsufjz60YtWXiDFQzDUZDLEOc9Ga8lGpZRzdQlFDzpTe2ynr3aK69cpHW
/ix5ws2mYYtYaER8IZAeUFahvKppcyDpRhPzjzUcdkGj9PWvJdhWXtm7b7QE8/0e
lj9SEKaSFSoQB57coEs5Q2EDLPw907zu6kyiZsbhaad677EhaTS3jmikeVhD41SX
GEOoyl+RgK+TqD/+bjSvzjMIsfwXM4DnWXy6T/kcBCRaipKi/H8z9kiFyk3reKQj
mQ7M6+c0SZFz5yRL/n824dSr8QuYUQ0iCMtYs21GXzGafm2DBb6BU5HlildjsGxm
MBDt+3sMRVzbmiTJjs4w1i/jT7KM2Rs3KozFrYYBfnL/jJu8J7ntJI3mzRx6wQIq
L4NzU7fChJZyTLsQrWVyvBcXL7/PYk6lxM3+iu7XYfZ6leCfmRRkrTEGLSAECHUf
sFzmcz1oqM0cRGI8YfOPBwVqM905e9Tmwvb/jheUzEZcPQv95VnImHYTlVO10dL4
gaiYTtWj0GgfZJ/zKbcjLhi2zy39xlCxBh5A1hdPqGajjwSGDrg5qQt9+oTHQI5h
lIptHP8xcjWxx4JjVIQaB+YsACUEYXMllZzVejW/2AL4aJCAhQQ=
=OtX0
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
