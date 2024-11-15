Return-Path: <linux-usb+bounces-17633-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B04189CF442
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2024 19:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1A2EB31D6D
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2024 18:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A0F1CF7A2;
	Fri, 15 Nov 2024 18:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tTTcZkCT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608A9152E1C;
	Fri, 15 Nov 2024 18:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731695696; cv=none; b=tGMgkxOW0fONNaCotLGFMH1Hme0PgMwfq8cfmvuw2LMt8OjwxwzRKeEMO9l/Fd9IM4xkBUpVl+mUSwxGYtzx770aAp1KZ5b4VYVIT0DuT9yo0eBilY3eiraM5qmGkT65PvLy8aOmjCBzXdMc0j+D+aqwWdX6Db+O8GDDNlIYfbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731695696; c=relaxed/simple;
	bh=X9vWYFVz8BcjMAxz3u0utMXx6m8g2WY5vbDXySCXt6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9fyD/NxU7ocOzV+2hza71S6Sk8AftSHImn2yIuQeZPtIuJc7lfBsgrLvDPEOBcENGzOVkFYfqoeQK5xQWS02LvnJXQeK6QDK5WDfvMHQUvxoetuI9bGztUSym6mpgXyUoq/1AfhTC+ro1W2khvpvzTGIm03/1IXAPiI0OS/5jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tTTcZkCT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02047C4CECF;
	Fri, 15 Nov 2024 18:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731695695;
	bh=X9vWYFVz8BcjMAxz3u0utMXx6m8g2WY5vbDXySCXt6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tTTcZkCTMkcgCbLKF12B7wo9jFmgkOedDi1F09VwVuBVzlALusVFrk9ZzxpWco/WM
	 gWn5QYPE+lL5V3uclzDbF+96nts3psn/sE2s8g2YRHwbKAWXgJI2n4lqFLTmKAQYv3
	 0Xww5hv/Hgm5rps8193SwsiebhD6eCVqz2Kf5CUD5hfcl3+d+qnyapyvr4dbeJ9V+5
	 pqsEc074oOuVWjcZAT7lJiKgo2nDvEyHEuaMus/sRALo3jsJIShF1mJOFlnYgBSPwC
	 ABvX8DXAIpbm6Acb3Yd7ZWUuuKaZNAdxZxBucyW1sGy1ROJwJvAvZS8xRKzfJ5EHPv
	 OPj5vnrW0ZF8Q==
Date: Fri, 15 Nov 2024 18:34:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	jun.li@nxp.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: imx8mq-usb: optionally refer to
 usb-switch.yaml
Message-ID: <20241115-bladder-legislate-7daef7a750ad@spud>
References: <20241114102203.4065533-1-xu.yang_2@nxp.com>
 <20241114-marmalade-bottling-8fe656515ee7@spud>
 <20241115020045.qlrkyrelpgdwpxxk@hippo>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qWspPwlOiJv9Bk4P"
Content-Disposition: inline
In-Reply-To: <20241115020045.qlrkyrelpgdwpxxk@hippo>


--qWspPwlOiJv9Bk4P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 10:00:45AM +0800, Xu Yang wrote:
> On Thu, Nov 14, 2024 at 05:45:07PM +0000, Conor Dooley wrote:
> > On Thu, Nov 14, 2024 at 06:22:03PM +0800, Xu Yang wrote:
> > > The i.MX95 usb-phy can work with or without orientation-switch. With
> > > current setting, if usb-phy works without orientation-switch, the
> > > dt-schema check will show below error:
> > >=20
> > > phy@4c1f0040: 'oneOf' conditional failed, one must be fixed:
> > >         'port' is a required property
> > >         'ports' is a required property
> > >         from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq=
-usb-phy.yaml#
> > >=20
> > > This will add a condition to optionally refer to usb-switch.yaml.
> > >=20
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >=20
> > $subject is not what the patch does.
>=20
> I look through other yaml and find below format could achieve the
> restriction on one property:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/tree/Docum=
entation/devicetree/bindings/usb/gpio-sbu-mux.yaml?h=3Dusb-testing#n54
>=20
>   - if:
>       required:
>         - mode-switch
>     then:
>       required:
>         - enable-gpios
>=20
> If mode-switch is present, then enable-gpios is required. If not, then
> enable-gpios is not required.
>=20
> For my case, if compatible contains "fsl,imx95-usb-phy" and orientation-s=
witch
> is present, then this schema needs to refer to usb-switch.yaml. If not. t=
hen
> this schema will not refer to usb-switch.yaml. So the subject could refle=
ct
> the thing this patch does.
>=20
> Is this feasible? If not, could you give some advices?=20

Hmm, I guess I can now see an interpretation of the wording that
reflects what the patch contents contains. However, you need a hardware
based justification for the condition you're adding since it disables
mode-switch and defining port nodes etc if orientation-switch isn't present.
That's fine if that hardware doesn't support mode switching or ports
without orientation switching, but not if it does.

Cheers,
Conor.

>=20
> Thanks,
> Xu Yang
>=20
> >=20
> > > ---
> > >  Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy=
=2Eyaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> > > index 6d6d211883ae..1238792157f8 100644
> > > --- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> > > @@ -118,6 +118,8 @@ allOf:
> > >            contains:
> > >              enum:
> > >                - fsl,imx95-usb-phy
> > > +      required:
> > > +        - orientation-switch
> > >      then:
> > >        $ref: /schemas/usb/usb-switch.yaml#
> > > =20
> > > --=20
> > > 2.34.1
> > >=20
>=20
>=20

--qWspPwlOiJv9Bk4P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzeUSgAKCRB4tDGHoIJi
0nmLAP41b2HVcBe/oDDoqT3FelaZ+a2IvuVeK6Hmd+l+FjRdbAD+NvRvcHrjfcUp
l7LuK5Nnt6oS3qIiOHl2p00S970odgw=
=TUzT
-----END PGP SIGNATURE-----

--qWspPwlOiJv9Bk4P--

