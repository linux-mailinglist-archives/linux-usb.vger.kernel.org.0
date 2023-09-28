Return-Path: <linux-usb+bounces-714-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A50E7B2327
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 19:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id C8524282569
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 17:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192A351240;
	Thu, 28 Sep 2023 17:04:47 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCD051235;
	Thu, 28 Sep 2023 17:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E686C433C7;
	Thu, 28 Sep 2023 17:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695920686;
	bh=Wa5+wcoD0RCFmFYWVgGcB7U1I7QiFdA487RkuAldz98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qg6fbIcrx5Vj8CmEFGDeDlMOKOwNkkpZVbd7KyXnsMGAVB34TrqEq13rNR5+BD2Y4
	 N/1HWPm6aeMkUGplQu3fVS47i0fbRQXetLXpRvkbXRHuLcBXmaZgUxlC+WhMgtb/Zb
	 9DYAFWEBnEje/CP2fWZiv3ELMfO+ujFbtjtBrAhTzSFw28Ks89G7Gw2CyRP3bVndUA
	 cYUsadG1UeyEveKcqSmQDGqY5puKDJxFvbxDYFfoQ32ovLub5m7eJ1bipXP0ck9FLj
	 CT1i7c22g2U2rVAHjJfOkpIAe9Ru8yaFa7VJgJZWCF603q9k7Q5eFzxdFO/vsxfYva
	 /j7GyKaPpoyGQ==
Date: Thu, 28 Sep 2023 18:04:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	andersson@kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, jun.li@nxp.com,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v3 2/2] dt-bindings: usb: gpio-sbu-mux: Make
 'mode-switch' not required
Message-ID: <20230928-machine-pushcart-6e68b11afc7c@spud>
References: <20230927123511.45085-1-festevam@gmail.com>
 <20230927123511.45085-2-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SZQAgijLO48x0NpN"
Content-Disposition: inline
In-Reply-To: <20230927123511.45085-2-festevam@gmail.com>


--SZQAgijLO48x0NpN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 09:35:11AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
>=20
> On a i.MX8QXP MEK board that has an NXP CBDTU02043 mux, there is
> no mode-switch, only an orientation switch.
>=20
> Make the 'mode-switch' property a non-required one.

There seem to be very few compatibles in this file, so I guess
everything uses the generic compatible. I'm not expecting you to know
why it's like this, but should we add a compatible for this particular
mux & only relax the requirement for it specifically?

>=20
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v2:
> - Newly introduced.
>=20
>  Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Do=
cumentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> index b61dcf8b4aad..d3b2b666ec2a 100644
> --- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> +++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> @@ -51,7 +51,6 @@ required:
>    - compatible
>    - enable-gpios
>    - select-gpios
> -  - mode-switch
>    - orientation-switch
>    - port
> =20
> --=20
> 2.34.1
>=20

--SZQAgijLO48x0NpN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRWyKQAKCRB4tDGHoIJi
0ourAP9RqkyoroV2HAfp8NC6KAXJmUwreI6OEnv7UCI/jN9pDQEA82oYm6aK2SPO
3u69XFx7piVPYX0gcl3ueW2YN0Jm1g0=
=5XE+
-----END PGP SIGNATURE-----

--SZQAgijLO48x0NpN--

