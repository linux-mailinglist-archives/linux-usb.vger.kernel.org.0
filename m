Return-Path: <linux-usb+bounces-31471-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA19CC070E
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 02:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06D513028F5D
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 01:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482EE25228C;
	Tue, 16 Dec 2025 01:22:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E837080E;
	Tue, 16 Dec 2025 01:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.248.49.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765848124; cv=none; b=QznxIBc4JqbgVeJsCgbyJXwTX6mXZX3GG3qEF8h71EJcpjSmJuVtofYMl+a3yMb/2FIybLBpJZwvjT3SbNFRVZ1+EDsyWgm6d6LxDz9pH3MkXuJMG6bVY6NP3HmFVIQ++4r42sLcKDBSYeBG/GdEQlX1A8r0JoxABxYIShmjDWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765848124; c=relaxed/simple;
	bh=gNzVPNX4pw8tXGYiqyYHp3Ne/jgNGmNpq0tdMtBol38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bqFN5yOWGDl5uHiuzJvLRmfBDIOCc0rDppW7MHgGKXJKtm4bz/XCBNjg/XQdA+OLjhUw7rEcLVmcdsoQ7sfDF6jQ+AlNyeRwYnUWb1q1304QQSJj6Umgd3ulfrKKUgGM4eClWCNnZq4el8lQG/kzqOixRc4fiH6AHzUW07sjxow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com; spf=pass smtp.mailfrom=socionext.com; arc=none smtp.client-ip=202.248.49.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO kinkan3-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 16 Dec 2025 10:20:52 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by kinkan3-ex.css.socionext.com (Postfix) with ESMTP id 6651D2069FC4;
	Tue, 16 Dec 2025 10:20:52 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Tue, 16 Dec 2025 10:20:52 +0900
Received: from [10.212.247.110] (unknown [10.212.247.110])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id 6BFA010A00E;
	Tue, 16 Dec 2025 10:20:51 +0900 (JST)
Message-ID: <0775e913-e531-44b5-b191-7ce0cf4d1e3a@socionext.com>
Date: Tue, 16 Dec 2025 10:20:54 +0900
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: Add Socionext Uniphier DWC3 controller
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251215212507.3317805-1-robh@kernel.org>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <20251215212507.3317805-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rob,

On 2025/12/16 6:25, Rob Herring (Arm) wrote:
> The Socionext Uniphier DWC3 controller binding is already in use, but
> undocumented. It's a straight-forward binding similar to other DWC3
> bindings.

After being pointed out by Krzysztof at OSSJapan, I've checked the bindings
and was preparing some additions or fixes to resolve the warning.

It's almost the same as my proposal, however, I add a little.

> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
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
> index 000000000000..892ae3458c1b
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
There's no problem, but how about the following description
following snps,dwc3.yaml?

   interrupt-names:
     oneOf:
       - const: dwc_usb3
       - items:
           enum: [host, peripheral]

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
> +    minItems: 2
> +    maxItems: 6

Since Pro4 only has one PHY, so:
     minItems: 1

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

Thank you,

-- 
---
Best Regards
Kunihiko Hayashi

