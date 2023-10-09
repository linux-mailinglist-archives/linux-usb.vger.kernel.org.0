Return-Path: <linux-usb+bounces-1286-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 108C17BE851
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 19:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45DCD281718
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 17:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080AE38DE1;
	Mon,  9 Oct 2023 17:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eoYNRHQh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6525636B06;
	Mon,  9 Oct 2023 17:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C289DC433C8;
	Mon,  9 Oct 2023 17:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696873022;
	bh=h7WrtdvD0ju8NFCMVMHvu7LpOnWmQlsK4wC5k7i7cNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eoYNRHQh44pwHrreECTkWOEwcbgWryF14RmC6nCXWKULnzeD2Qm71vk0RhhjdwFMg
	 JCrD+7aEuCYP6xcfuHTMhafCW1lMgSbn7JooBQ1kxUTZ7535R59gGT3sJglxUde6qz
	 mHK8bWHSfbaR1xIv2XiXrq8QPpFLKVtof7wgQBLejkwsoYlwmCdHY5hHC8m5dHiW7O
	 sBAwUfo/u+YVtemTMrtXR9UV/sjqhYPh3J7f80YPvgn0hUBzOhPvKKXJQpPtGybzUd
	 KO9oB/A8DmdCejC4peYDAYwH+E4A4e4AiWoqjgZ3MgQ88ZKwcMl4mPDhht9Mx9zDxj
	 eTdAoaaBEsucA==
Date: Mon, 9 Oct 2023 18:36:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	andersson@kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, jun.li@nxp.com,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v3 2/2] dt-bindings: usb: gpio-sbu-mux: Make
 'mode-switch' not required
Message-ID: <20231009-faculty-rascal-d1d1e2106188@spud>
References: <20230927123511.45085-1-festevam@gmail.com>
 <20230927123511.45085-2-festevam@gmail.com>
 <20230928-machine-pushcart-6e68b11afc7c@spud>
 <CAOMZO5B=MEDUE4bEnkri1npUG93KQZSp=JYaV8R8hKNY2qQtQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v42yTMsuEvy/0/GJ"
Content-Disposition: inline
In-Reply-To: <CAOMZO5B=MEDUE4bEnkri1npUG93KQZSp=JYaV8R8hKNY2qQtQA@mail.gmail.com>


--v42yTMsuEvy/0/GJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2023 at 03:41:58PM -0300, Fabio Estevam wrote:
> Hi Conor,
>=20
> On Thu, Sep 28, 2023 at 2:04=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Wed, Sep 27, 2023 at 09:35:11AM -0300, Fabio Estevam wrote:
> > > From: Fabio Estevam <festevam@denx.de>
> > >
> > > On a i.MX8QXP MEK board that has an NXP CBDTU02043 mux, there is
> > > no mode-switch, only an orientation switch.
> > >
> > > Make the 'mode-switch' property a non-required one.
> >
> > There seem to be very few compatibles in this file, so I guess
> > everything uses the generic compatible. I'm not expecting you to know
> > why it's like this, but should we add a compatible for this particular
> > mux & only relax the requirement for it specifically?
>=20
> I am not sure.
>=20
> Bjorn, do you have any suggestions, please?

FWIW,
Acked-by: Conor Dooley <conor.dooley@microchip.com>
although I do think that adding more compatibles if there is gonna be
divergence in capabilities is a good idea..

Cheers,
Conor.

>=20
> > > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > > ---
> > > Changes since v2:
> > > - Newly introduced.
> > >
> > >  Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml =
b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > > index b61dcf8b4aad..d3b2b666ec2a 100644
> > > --- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > > @@ -51,7 +51,6 @@ required:
> > >    - compatible
> > >    - enable-gpios
> > >    - select-gpios
> > > -  - mode-switch
> > >    - orientation-switch
> > >    - port
> > >
> > > --
> > > 2.34.1
> > >

--v42yTMsuEvy/0/GJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSQ6OgAKCRB4tDGHoIJi
0t20AQCIbfrg7u2vMvyARpCBKHTuC/MJaUiO8XVq97Ks1cf67QEAlrsZ2uJ4LLvo
FTdIVicRARp1r6L+VdPmHDkQmxqUxQY=
=HyoM
-----END PGP SIGNATURE-----

--v42yTMsuEvy/0/GJ--

