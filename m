Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0874D260C4A
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 09:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729347AbgIHHnh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 03:43:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:54408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728479AbgIHHnh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Sep 2020 03:43:37 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2AA7021D43;
        Tue,  8 Sep 2020 07:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599551016;
        bh=q7EYRvVQqGax2oHljlNysRfszrTe/m/uF1lUg7RM94M=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=opXTkki0o587TFz3BNbZGe4nhTZZeVKr4KCWDmyMAwJ5TXVG4Jl5c42a+IRWXIoNk
         JPpqtUJf5hoEpHZ61Q+wSFBGszO07cjb6Z316Ia5PFdbP6hOyS7amOT7iTymJdLLOb
         TBBMx1wCLB4lhizmkUHrKgikaSFV2xcggIkgJUlE=
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH 4/8] usb: cdns3: gadget: add CHAIN and ISP bit for sg
 list use case
In-Reply-To: <20200908072127.GD17366@b29397-desktop>
References: <20200901084454.28649-1-peter.chen@nxp.com>
 <20200901084454.28649-5-peter.chen@nxp.com> <87d02wn5xn.fsf@kernel.org>
 <20200908072127.GD17366@b29397-desktop>
Date:   Tue, 08 Sep 2020 10:43:29 +0300
Message-ID: <87v9golnmm.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Peter Chen <peter.chen@nxp.com> writes:
>> > For sg buffer list use case, we need to add ISP for each TRB, and
>> > add CHAIN bit for each TRB except for the last TRB.
>> >
>> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
>> > ---
>> >  drivers/usb/cdns3/gadget.c | 8 +++++++-
>> >  1 file changed, 7 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
>> > index 25e3ff1cdf61..a308a694abc5 100644
>> > --- a/drivers/usb/cdns3/gadget.c
>> > +++ b/drivers/usb/cdns3/gadget.c
>> > @@ -1221,8 +1221,14 @@ static int cdns3_ep_run_transfer(struct cdns3_e=
ndpoint *priv_ep,
>> >  		else
>> >  			priv_req->trb->control =3D cpu_to_le32(control);
>> >=20=20
>> > -		if (sg_supported)
>> > +		if (sg_supported) {
>> > +			trb->control |=3D TRB_ISP;
>> > +			/* Don't set chain bit for last TRB */
>> > +			if (sg_iter < num_trb - 1)
>> > +				trb->control |=3D TRB_CHAIN;
>> > +
>> >  			s =3D sg_next(s);
>> > +		}
>>=20
>> is this a bugfix?
>>=20
>
> The support for sg list is not good at current code, it needs all
> changes in this patch series to let it work well, so it is better
> let the whole things in this series as improvement.

Cool, thanks for clarifying :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9XNiERHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQbfPBAA32ReTXV9EGfJ1jJ41Or9H/uXVvaDHg/f
2Mnt9zUcN0KHpmpLwhQRTKKc6C13JzxgrL2vJmBil+GJSPCD2SMO5Scnyb/1hmI5
UxI1RN56oanRjvriLjANraIzcZulSKLRO3sERLi2RPcPza5Zq/HwWijLuuwEwgji
tWE+IM8/nTU1nXocnhlWWnQYs4s8gIKkPAmPQJm0i/d4nQUTjzh6NWpw+yv27PFP
6FstZcrI+KO6ss0KdbHRe0iH9irOJ49+BaJSNWL0k4QsNwU8+Oa+pq58HQn2e4Cr
V3EIPWgPSP4U0rnMzuCuwH3BONCCDt34Uyqzogy0h3ObtoIm3cUXBUM/QNLglgRR
vByNRxzIWVUGJUtuHWmDM3d77m2ksC6S0Qjuo5aoJakPGHI+xIErfKP0IiXoN/nG
kvPfLKuxPqU7owi1ZE1D5x3tDCn/y2cLawXqOdUv+HFpzWWpu87L5cwHL1IfY9N6
2Cs0UQivS07+UUHMBa5jDh39L6EiyzJDgblbPz5wb+vZSvTgJ0p3bH5U96YMTirG
NEyyreGtcYgUUYR3sTGu17hKDbjhl1HmaySTv2zW3a08nhpiiVlY9JtW/wGvRwhY
1UXoSKv932lC31ytFo8gz27LEw8WXvVWbI9TrcRixm4yjvEG3EH4kaLwEL2RbVPc
2Y1LlsFNJmY=
=OO1n
-----END PGP SIGNATURE-----
--=-=-=--
