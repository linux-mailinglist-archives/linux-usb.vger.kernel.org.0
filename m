Return-Path: <linux-usb+bounces-31944-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3291CF6AA6
	for <lists+linux-usb@lfdr.de>; Tue, 06 Jan 2026 05:35:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D4FB302B10C
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jan 2026 04:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27FA281503;
	Tue,  6 Jan 2026 04:35:08 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0EE1C695;
	Tue,  6 Jan 2026 04:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.248.49.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767674108; cv=none; b=puDXwUtetQXd5YGxgJOYEPiEcNFtB+gVqkLrbw2uf2A85YSKuP0KS4rn1l/nzAZcd9wzqRiqvc4toJueaDjadAJU/rXxhlIwBjmAwn6EeLnnvxGrBr6x9Gi4ops+N834vfDWYmKILM7UvrGS80yeXQ2obfCSr+d39hbbRu1VHAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767674108; c=relaxed/simple;
	bh=L+jEmFQETdzHWRv3HazDBegfYXdNx2zNcl/X42sqhs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BzDhrRobMlW8vBfS56cB1NXO7yXmvYX1obxIvmWd49h11mWTnqdWF+t6/BgKRG113ttm7ULX3Ib366RD7tLt3kjm7h8Cueoaov9nmMg8rIIFDCDxEH7DAiik7kVHMVNUKfi17Vq+ciq2f93dHDbaOIOvr+ThqlUEeS3qU4wS4Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com; spf=pass smtp.mailfrom=socionext.com; arc=none smtp.client-ip=202.248.49.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO iyokan3-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 06 Jan 2026 13:33:54 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by iyokan3-ex.css.socionext.com (Postfix) with ESMTP id 1E82D2091484;
	Tue,  6 Jan 2026 13:33:54 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Tue, 6 Jan 2026 13:33:53 +0900
Received: from [10.212.247.110] (unknown [10.212.247.110])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id 0C09F10A003;
	Tue,  6 Jan 2026 13:33:53 +0900 (JST)
Message-ID: <2dde6891-a0e3-4e60-a773-302061a8e5a5@socionext.com>
Date: Tue, 6 Jan 2026 13:33:56 +0900
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: usb: Add Socionext Uniphier DWC3
 controller
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260105162418.2842825-1-robh@kernel.org>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <20260105162418.2842825-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rob,

On 2026/01/06 1:24, Rob Herring (Arm) wrote:
> The Socionext Uniphier DWC3 controller binding is already in use, but
> undocumented. It's a straight-forward binding similar to other DWC3
> bindings.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>   - Allow 1 phy entry for Pro4
> ---
>   .../bindings/usb/socionext,uniphier-dwc3.yaml | 89 +++++++++++++++++++
>   1 file changed, 89 insertions(+)
>   create mode 100644
> Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
> 
> diff --git
> a/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
> b/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
> new file mode 100644
> index 000000000000..2b253339c199
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/socionext,uniphier-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Socionext Uniphier SuperSpeed DWC3 USB SoC controller
> +
> +maintainers:
> +  - Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> +  - Masami Hiramatsu <mhiramat@kernel.org>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: socionext,uniphier-dwc3
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: socionext,uniphier-dwc3
> +      - const: snps,dwc3
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: Host or single combined interrupt
> +      - description: Peripheral interrupt
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - enum:
> +          - dwc_usb3
> +          - host
> +      - const: peripheral
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +      - const: bus_early
> +      - const: suspend
> +
> +  phys:
> +    description: 1 to 4 HighSpeed PHYs followed by 1 or 2 SuperSpeed PHYs
> +    minItems: 1
> +    maxItems: 6
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - phys
> +
> +unevaluatedProperties: false
> +
> +allOf:
> +  - $ref: snps,dwc3.yaml#
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    usb@65a00000 {
> +        compatible = "socionext,uniphier-dwc3", "snps,dwc3";
> +        reg = <0x65a00000 0xcd00>;
> +        interrupt-names = "dwc_usb3";
> +        interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
> +        clock-names = "ref", "bus_early", "suspend";
> +        clocks = <&sys_clk 12>, <&sys_clk 12>, <&sys_clk 12>;
> +        resets = <&usb0_rst 15>;
> +        phys = <&usb0_hsphy0>, <&usb0_hsphy1>,
> +               <&usb0_ssphy0>, <&usb0_ssphy1>;
> +        dr_mode = "host";
> +    };

I've checked this with ARCH=arm and ARCH=arm64.

Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Thank you,

---
Best Regards
Kunihiko Hayashi

