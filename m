Return-Path: <linux-usb+bounces-1377-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 678327C0194
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 18:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21C0A281F5D
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 16:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481F32FE02;
	Tue, 10 Oct 2023 16:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rw30bMW6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65D218639;
	Tue, 10 Oct 2023 16:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26365C433C7;
	Tue, 10 Oct 2023 16:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696955245;
	bh=t4PzobXZJtCe2x1U9eIGmA6015uE27joZNtgWmnO0IA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rw30bMW6+kCwj0bQ0XJCl02xwmXUjxDC3O97DswIyyA5f79Vz1CsAoyiwlnwI1u5D
	 +E4uzeAwjpbuocOd1mekTSSqSmo/qW443P2zp4DFE/vurKgdny9URSly2jBIy2YwZN
	 2FBZcAHRRhuq8sYAlSSlXMxoMfoia7kDd7qdXt1x9THtFTpMFcCUwT5IAvA25RB7Hw
	 dzjMC9ayTvTgtRq9oYdYq5GhIYCf/b7Q2a3nXRQYFhEIhfwxQ90pwuSUMh/SxuO2Gf
	 cNpIMmJ9ZYcwHQqWIhJ0b3ZWZYMyTAYXqmkUOmjlCeul5j8qNGFunRkAqquAKw4inC
	 ncO72LLPNRVSQ==
Received: (nullmailer pid 1012386 invoked by uid 1000);
	Tue, 10 Oct 2023 16:27:22 -0000
Date: Tue, 10 Oct 2023 11:27:22 -0500
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v3 1/3] dt-bindings: usb: add rk3588 compatible to
 rockchip,dwc3
Message-ID: <20231010162722.GA1006254-robh@kernel.org>
References: <20231009172129.43568-1-sebastian.reichel@collabora.com>
 <20231009172129.43568-2-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009172129.43568-2-sebastian.reichel@collabora.com>

On Mon, Oct 09, 2023 at 07:20:09PM +0200, Sebastian Reichel wrote:
> RK3588 has three DWC3 controllers. Two of them are fully functional in
> host, device and OTG mode including USB2 support. They are connected to
> dedicated PHYs, that also support USB-C's DisplayPort alternate mode.
> 
> The third controller is connected to one of the combphy's shared
> with PCIe and SATA. It can only be used in host mode and does not
> support USB2. Compared to the other controllers this one needs
> some extra clocks.
> 
> While adding the extra clocks required by RK3588, I noticed grf_clk
> is not available on RK3568, so I disallowed it for that platform.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/usb/rockchip,dwc3.yaml           | 66 +++++++++++++++++--
>  1 file changed, 61 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml b/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
> index 291844c8f3e1..517879290099 100644
> --- a/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
> @@ -20,9 +20,6 @@ description:
>    Type-C PHY
>    Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
>  
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
>  
> @@ -39,6 +37,7 @@ properties:
>        - enum:
>            - rockchip,rk3328-dwc3
>            - rockchip,rk3568-dwc3
> +          - rockchip,rk3588-dwc3
>        - const: snps,dwc3
>  
>    reg:
> @@ -58,7 +57,9 @@ properties:
>            Master/Core clock, must to be >= 62.5 MHz for SS
>            operation and >= 30MHz for HS operation
>        - description:
> -          Controller grf clock
> +          Controller grf clock OR UTMI clock
> +      - description:
> +          PIPE clock
>  
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
>  
>    power-domains:
>      maxItems: 1
> @@ -86,6 +90,58 @@ required:
>    - clocks
>    - clock-names
>  
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
> +          maxItems: 4
> +        clock-names:
> +          minItems: 3
> +          items:
> +            - const: ref_clk
> +            - const: suspend_clk
> +            - const: bus_clk
> +            - const: grf_clk

No need to list everything again. Just:

contains:
  const: grf_clk

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
> +          items:
> +            - const: ref_clk
> +            - const: suspend_clk
> +            - const: bus_clk

Just 'maxItems: 3' is sufficient here.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3588-dwc3
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3

3 is already the min.

> +          maxItems: 5

And 5 is already the max.

> +        clock-names:
> +          minItems: 3
> +          items:
> +            - const: ref_clk
> +            - const: suspend_clk
> +            - const: bus_clk
> +            - const: utmi
> +            - const: pipe

Again, can use 'contains' here. Where 'utmi' is in the list is already 
defined by the top-level schema.

Rob

