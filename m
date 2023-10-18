Return-Path: <linux-usb+bounces-1864-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C898C7CE192
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 17:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 065381C20D01
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 15:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0963B7A6;
	Wed, 18 Oct 2023 15:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/iCTYgu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C450037167;
	Wed, 18 Oct 2023 15:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5582BC433C8;
	Wed, 18 Oct 2023 15:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697644032;
	bh=InG035hMLurwAeKeC47GtRoHkwnqDLCor7MaeAfrvrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F/iCTYgucw81j5t/RFOEvdBl8DFGb/olHT6bk2KuaDxwbmqGgWgXwZt6uhSCCh8J6
	 iiMHO9XX+z1cIxV1+FkRqR9NRC1NQPnerNOi7dCoS8MNaNIC7OBc8S3ymK5zRtnSc8
	 NNVgzrA9OXwGP4MRpbxmbcRFN8vC09nKz1oMcN2FDhT8farNjT55ivsos0qOoNtQfo
	 xkd/hZQ1GeHGSD4BcqSwkxxjZhyJg9JJZ1dSSSagNr0+It4bm4hn1Yjuu+rZnkaWu3
	 FmqS6lLRDHggp7YxES1oWyAOuUnB4vS8ByC/Lj5deDk77lVgtMCyRFsfUC5DWWw1dI
	 9PRhPZUHxs4tA==
Date: Wed, 18 Oct 2023 16:47:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Anand Moon <linux.amoon@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: vialab,vl817: remove reset-gpios
 from required list
Message-ID: <20231018-luminous-uncanny-f474a87bf2af@spud>
References: <20231018150448.1980-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RZusTGGTVMT5+wnc"
Content-Disposition: inline
In-Reply-To: <20231018150448.1980-1-jszhang@kernel.org>


--RZusTGGTVMT5+wnc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 11:04:48PM +0800, Jisheng Zhang wrote:
> The "reset-gpios" is optional in real case, for example reset pin is
> is hard wired to "high". And this fact is also reflected by the
> devm_gpio_get_optional() calling in driver code.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>=20
> since v1:
>  - remove th1520 usb dt-binding part, this isn't related.
>=20
>  Documentation/devicetree/bindings/usb/vialab,vl817.yaml | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml b/Do=
cumentation/devicetree/bindings/usb/vialab,vl817.yaml
> index 76db9071b352..c815010ba9c2 100644
> --- a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
> +++ b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
> @@ -37,7 +37,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - reset-gpios
>    - vdd-supply
>    - peer-hub
> =20
> --=20
> 2.40.1
>=20

--RZusTGGTVMT5+wnc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS/9+wAKCRB4tDGHoIJi
0pcOAQDuNchpYF/y/RhpvZGEw6IGgDbYw5KpnXkvSBk/zG0DQAD/VlbKt3FeHqNO
Yq/WDm0rrFeSleCyY2v6/pPl1EyEvAE=
=lUXz
-----END PGP SIGNATURE-----

--RZusTGGTVMT5+wnc--

