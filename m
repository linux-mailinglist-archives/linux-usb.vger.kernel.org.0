Return-Path: <linux-usb+bounces-3872-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB9D808E37
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 18:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 276F31C20A6D
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 17:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9C2481DB;
	Thu,  7 Dec 2023 17:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3pcJdXB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF0F3D0D4;
	Thu,  7 Dec 2023 17:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27611C433C7;
	Thu,  7 Dec 2023 17:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701968913;
	bh=Ivbxa/OIqGXs9KhHgIDLrCuHTLfP3md/DLSZOBIeTB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S3pcJdXBZxEnLr8MH0skNm4fQ0SwZQ3oA9v3wm3j2pDom/9Y5PEYBgLI3+1C3z5BL
	 OBjk02+MgKcRQw6ybZ7SUnkJD2V/SkldnWO88tcaERC1XFC6JgGeky4xU/V/amu/l1
	 j4qfcNWHos9Q2uTrChxTLMy4fHRrRaHrGheg1/AaMOALAAtoANUbLFTVzVsNKS5YvY
	 cnZOdJJyuf5rpZDRGHaHi8BUfrvnoRZdS8w/mZNkNVRLDyt4smDOViqjaZ3nimm7iN
	 gbJG+Pxh1V350Ev1iYVhK8uvd9E1y+h+7/gacE2JwiysLEdiNLw5FjQCF470AjqcUe
	 Opo1sLLq1z4GQ==
Date: Thu, 7 Dec 2023 17:08:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Fabio Estevam <festevam@gmail.com>, gregkh@linuxfoundation.org,
	jun.li@nxp.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: usb: nxp,ptn5110: Fix typo in the title
Message-ID: <20231207-dental-paddle-fa3c34b324c2@spud>
References: <20231207163426.2651126-1-festevam@gmail.com>
 <11a53ffd-3bc1-cf27-ff01-b9502195f03e@omp.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ryy1Iyt8SVxnZ5qK"
Content-Disposition: inline
In-Reply-To: <11a53ffd-3bc1-cf27-ff01-b9502195f03e@omp.ru>


--Ryy1Iyt8SVxnZ5qK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 08:02:06PM +0300, Sergey Shtylyov wrote:
> On 12/7/23 7:34 PM, Fabio Estevam wrote:
>=20
> > From: Fabio Estevam <festevam@denx.de>
> >=20
> > Fix the misspelled "Controller" word.
> >=20
> > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> > Changes since v1:
> > - Use a single line in the commit log. (Krzysztof)
> >=20
> >  Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml b/D=
ocumentation/devicetree/bindings/usb/nxp,ptn5110.yaml
> > index 28eb25ecba74..f154fae290a4 100644
> > --- a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
> > +++ b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
> > @@ -4,7 +4,7 @@
> >  $id: http://devicetree.org/schemas/usb/nxp,ptn5110.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> > =20
> > -title: NXP PTN5110 Typec Port Cotroller
> > +title: NXP PTN5110 Typec Port Controller
>=20
>    Perhaps it's worth fixing Typec to Type C?

Isn't it actually "Type-C"?

--Ryy1Iyt8SVxnZ5qK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXH8DAAKCRB4tDGHoIJi
0usbAQCuYLcX7fBTVKhCObjqfJdc7BSSK0+YMAOP/GJfS19A3QEAoQL2YxzCt4s2
eZHpieAOJMhiJxFSreQyetwwzJehDQ8=
=VV6j
-----END PGP SIGNATURE-----

--Ryy1Iyt8SVxnZ5qK--

