Return-Path: <linux-usb+bounces-1993-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4C57D12EC
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 17:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39E45B2156B
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 15:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4401DDF5;
	Fri, 20 Oct 2023 15:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pNHvl4mY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F861DDDC;
	Fri, 20 Oct 2023 15:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D730CC433C8;
	Fri, 20 Oct 2023 15:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697816184;
	bh=s1xV3JBd6JIKm+NQbSAbEH6DMv5wORv7APbuEHALwfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pNHvl4mYVct+XX8kx8UXf2TT0nVK+m3RiqBgFauhIyP34BfS24P6w3cN+sNYgh86L
	 zIefFNd8SChjbE5mt0RcnCDDVnHQI9kiZ34N/Ndcb99gaYfbftUXfVN2jHE+rGi3tm
	 n1WJoP51Ny99stXZhmuo1Jrobgy4wuqH2wA5OViwEeNmvPtRxtmTZNsEomW/GeuStz
	 E56SShxBTIycb5PteKMvF+cjGSX68RZRJUltSn2U6mia4caFYA/aHgilLqBlYv75n1
	 XaB4EfF6m1ZGVqn9pgmCTZdSpN7ahbLcycEwthBAeTyHfVar01kDyclkbMcSWk/O7u
	 O/Z9xWkCKirLA==
Date: Fri, 20 Oct 2023 16:36:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v4 1/3] dt-bindings: usb: add rk3588 compatible to
 rockchip,dwc3
Message-ID: <20231020-shudder-tackle-cc98a82f1cd0@spud>
References: <20231020150022.48725-1-sebastian.reichel@collabora.com>
 <20231020150022.48725-2-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xK1bQfKTFhB0MwbA"
Content-Disposition: inline
In-Reply-To: <20231020150022.48725-2-sebastian.reichel@collabora.com>


--xK1bQfKTFhB0MwbA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 04:11:40PM +0200, Sebastian Reichel wrote:
> RK3588 has three DWC3 controllers. Two of them are fully functional in
> host, device and OTG mode including USB2 support. They are connected to
> dedicated PHYs, that also support USB-C's DisplayPort alternate mode.
>=20
> The third controller is connected to one of the combphy's shared
> with PCIe and SATA. It can only be used in host mode and does not
> support USB2. Compared to the other controllers this one needs
> some extra clocks.
>=20
> While adding the extra clocks required by RK3588, I noticed grf_clk
> is not available on RK3568, so I disallowed it for that platform.
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/usb/rockchip,dwc3.yaml           | 60 +++++++++++++++++--
>  1 file changed, 55 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml b/D=
ocumentation/devicetree/bindings/usb/rockchip,dwc3.yaml
> index 291844c8f3e1..264c2178d61d 100644
> --- a/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
> @@ -20,9 +20,6 @@ description:
>    Type-C PHY
>    Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
> =20
> -allOf:
> -  - $ref: snps,dwc3.yaml#
> -
>  select:
>    properties:
>      compatible:
> @@ -30,6 +27,7 @@ select:
>          enum:
>            - rockchip,rk3328-dwc3
>            - rockchip,rk3568-dwc3
> +          - rockchip,rk3588-dwc3
>    required:
>      - compatible
> =20
> @@ -39,6 +37,7 @@ properties:
>        - enum:
>            - rockchip,rk3328-dwc3
>            - rockchip,rk3568-dwc3
> +          - rockchip,rk3588-dwc3
>        - const: snps,dwc3
> =20
>    reg:
> @@ -58,7 +57,9 @@ properties:
>            Master/Core clock, must to be >=3D 62.5 MHz for SS
>            operation and >=3D 30MHz for HS operation
>        - description:
> -          Controller grf clock
> +          Controller grf clock OR UTMI clock
> +      - description:
> +          PIPE clock
> =20
>    clock-names:
>      minItems: 3
> @@ -66,7 +67,10 @@ properties:
>        - const: ref_clk
>        - const: suspend_clk
>        - const: bus_clk
> -      - const: grf_clk
> +      - enum:
> +          - grf_clk
> +          - utmi
> +      - const: pipe
> =20
>    power-domains:
>      maxItems: 1
> @@ -86,6 +90,52 @@ required:
>    - clocks
>    - clock-names
> =20
> +allOf:
> +  - $ref: snps,dwc3.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3328-dwc3
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3

minItems for clocks and clock-names is already 3, is it not?

Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> +          maxItems: 4
> +        clock-names:
> +          minItems: 3
> +          items:
> +            - const: ref_clk
> +            - const: suspend_clk
> +            - const: bus_clk
> +            - const: grf_clk
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3568-dwc3
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 3
> +        clock-names:
> +          maxItems: 3
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3588-dwc3
> +    then:
> +      properties:
> +        clock-names:
> +          minItems: 3
> +          items:
> +            - const: ref_clk
> +            - const: suspend_clk
> +            - const: bus_clk
> +            - const: utmi
> +            - const: pipe
> +
>  examples:
>    - |
>      #include <dt-bindings/clock/rk3328-cru.h>
> --=20
> 2.42.0
>=20

--xK1bQfKTFhB0MwbA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTKecwAKCRB4tDGHoIJi
0nobAP9gB+qsHrTFsAFDJu4+fvKBpfSdY02kTL2MPTojpyy3eAD8C3SFcHdhD6T3
zRXBywGwE+6lPmCkSRVvQByGqxESRAk=
=vfSY
-----END PGP SIGNATURE-----

--xK1bQfKTFhB0MwbA--

