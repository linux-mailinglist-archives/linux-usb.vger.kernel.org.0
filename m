Return-Path: <linux-usb+bounces-31830-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B250ECE8E74
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 08:36:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DB3830133FF
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 07:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6865A2DCF45;
	Tue, 30 Dec 2025 07:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uwIE5jix"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E6D2236F0;
	Tue, 30 Dec 2025 07:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767080170; cv=none; b=TDBxkkFYejRyvvae7gk96dM83BSr2opXyWLb9zriMmurMNOja6PV9JYq/U79vQUbd9hzkH17a3JkIzm0uUKXs3QlDomfJaKveMYXO/hAderRXb7tOIycv6OQaoSo9YerW4wH1rr5N8RiSunWtaDlJYHdtdfykrS9TZBpiJ3ZPmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767080170; c=relaxed/simple;
	bh=3spopZsNXxvl9VFGdm0Har22/l2edY2y+GJxsqfjeSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TioaGpNQbewukLjw5THpIoBVVMtJaxHJjQzL+JipEbqbN9faGqNaaXwSL2fWehGN8NNVPgEfN7X1spGXwbL3iORBawMPWwymC1Fv/UNSZmd+hfe/W8Qhue357h9OosBjYFFeW/bc8KsNWlghPfnCTngM8aMZpVaftZv6w868Tgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uwIE5jix; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D02C4CEFB;
	Tue, 30 Dec 2025 07:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767080169;
	bh=3spopZsNXxvl9VFGdm0Har22/l2edY2y+GJxsqfjeSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uwIE5jixzPny/vITlv9VBaDQIxhslgJ4JV0TrJH1QEr24JDi0JrFvAZ3z/u3yzFA4
	 cgpEhQBzWzMaKaMCXwhjmIYU8FjSj7aiy9rOSvJj2s9v+NTzHA6jaoU+erq7pLnqxj
	 ZbISZ6x/kyNQuHao5YQrZIIYTymTOBQtucJMkddQU51xsxq94Amio06NLvHkb4djgI
	 ch+0nRuN6P2ii2DcbEIYjmKf/g8yY2W11/WfZ/7EJQ/fIZsusVHwFhb/VAGzZ7YlBC
	 Ok5pSKwdUDUiC5y1jDNNt1xnhsRAwWHr0BSNShW0SUCTUHNdNdGAYKXJAxmXgT4vfS
	 /ooaRpuP47oNw==
Date: Tue, 30 Dec 2025 08:36:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: conor@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	neil.armstrong@linaro.org, krzk+dt@kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: phy: Add Canaan K230 USB2.0 PHY DT
 schema
Message-ID: <20251230-tricky-hasty-koala-2fc9f0@quoll>
References: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20251230023725.15966-2-jiayu.riscv@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251230023725.15966-2-jiayu.riscv@isrc.iscas.ac.cn>

On Tue, Dec 30, 2025 at 10:37:20AM +0800, Jiayu Du wrote:
> k230-usb-phy driver supports USB 2.0 phys integrated in Canaan

Describe hardware, not driver.

> K230 SoC. Add YAML schema for its binding.

There is no such stuff as YAML schema for a binding. Look at other
commits how they phrase it.

> 
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> ---
>  .../bindings/phy/canaan,k230-usb-phy.yaml     | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml b/Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml
> new file mode 100644
> index 000000000000..f1c9511c873f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/canaan,k230-usb-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan K230 USB2.0 PHY
> +
> +maintainers:
> +  - Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> +
> +properties:
> +  compatible:
> +    const: canaan,k230-usb-phy
> +
> +  reg:
> +    description:
> +      Two register regions for USB PHY in HiSysConfig syscon block.

Drop

> +    items:
> +      - description: USB PHY test control reg (pullup/pulldown config)
> +      - description: USB PHY core control reg (PLL/transceiver tuning)
> +    minItems: 2
> +    maxItems: 2

You didn't ever test it, did you? Drop last two lines.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg

clocks

> +  - "#phy-cells"
> +
> +additionalProperties: false

Missing example.

> -- 
> 2.52.0
> 

