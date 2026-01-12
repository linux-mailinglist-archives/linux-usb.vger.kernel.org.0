Return-Path: <linux-usb+bounces-32170-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEB2D11547
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 09:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18560304F8B6
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 08:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA713451CA;
	Mon, 12 Jan 2026 08:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHK8UKem"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6677A33C51B;
	Mon, 12 Jan 2026 08:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768207840; cv=none; b=j7tcqG3SOq5YgSJg7Q0J+67+zpj9Bt8dlVe20R+FOpc4E8bgXAGc9TBzJIzmh7lsPcZSePh+QhI13jFMC77iFnMG2CndCvvCdMcJ9Tdd5u0HO7WSx9IcuF5OiQ5iBGOwVGjtEBOJprr6Pex2RcBb17Cr/f2wZAv/FldSLxNoUNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768207840; c=relaxed/simple;
	bh=WNiMZmCXbtCUCtjSuHYY/XW9lCniSthvEMeQbEklHlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/0pJEc41ctrLy0RgN8K1jFdoYAyhXbc2iob//Cbx4m6RB2ufMgmnalr7kCzQcn0beIAEhsx3Tu9+BTBRSsfXM/KMevklG+RQIcRitkMFutj8dpHRDYZxRLa4x1XmjkX9dVlU1d0ed1bryO75N4YOy/53aI4dwTOlBRhzq8rofw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHK8UKem; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA40C116D0;
	Mon, 12 Jan 2026 08:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768207840;
	bh=WNiMZmCXbtCUCtjSuHYY/XW9lCniSthvEMeQbEklHlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FHK8UKem2IQ7gNmRRtwxlDFrk/hmM9XfMvkqmXrU9zKruNNHlsTSSB6spvDdcxN4Z
	 y5UZ4gZTBZp4DmoZbqZLhP0WrksQaZ16uzId3BLzgs10APPyb0h/1d6idDffdM1hSy
	 6aZSmQWCIwbdGXv8mnYpNi8pHqBrsmTBPmUNj2tZBDqmDzw5ikyLPyj+b8SOzVkkBS
	 3EDknigcKxctvvDyR3H0ul+3KSB8eMc5BIJ9gUtnDnnA+jI29pzLw41LcgdhgZR97+
	 vuWHzVRFzJPS4vk4dtVw0dOAcXpSdZmy221xOqSedaNJgZsP9Maj6ym5LtDZV5fIs9
	 VihrwMQOg20tg==
Date: Mon, 12 Jan 2026 09:50:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Jonas Karlman <jonas@kwiboo.se>, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>, Hsun Lai <i@chainsx.cn>, John Clark <inindev@gmail.com>, 
	Jimmy Hon <honyuenkwun@gmail.com>, Dragan Simic <dsimic@manjaro.org>, 
	Michael Riesch <michael.riesch@collabora.com>, Peter Robinson <pbrobinson@gmail.com>, 
	Alexey Charkov <alchark@gmail.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: usb: Add binding for WCH CH334/CH335
 hub controller
Message-ID: <20260112-lively-hallowed-beetle-fc15b2@quoll>
References: <20260112022823.91-1-kernel@airkyi.com>
 <20260112022823.91-2-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260112022823.91-2-kernel@airkyi.com>

On Mon, Jan 12, 2026 at 10:28:21AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The WCH CH334/CH335[0] are USB2.0 protocol compliant 4-port USB HUB
> controller chips, supporting USB2.0 high-speed and full-speed for
> upstream ports, and USB2.0 high-speed 480Mbps, full-speed 12Mbps and
> low-speed 1.5Mbps for downstream ports, supporting not only low-cost STT
> mode (single TT schedules 4 downstream ports in time share), but also
> supports high performance MTT mode (4 TTs each corresponding to 1 port,
> concurrent processing).
> 
> Add a device tree binding for it.
> 
> [0]: https://www.wch-ic.com/downloads/CH334DS1_PDF.html
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  .../devicetree/bindings/usb/wch,ch334.yaml    | 65 +++++++++++++++++++

This must be separate patch. Do not combine independent subsystems into
one patchset.

>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/wch,ch334.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/wch,ch334.yaml b/Documentation/devicetree/bindings/usb/wch,ch334.yaml
> new file mode 100644
> index 000000000000..2eeb92f25b4c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/wch,ch334.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/wch,ch334.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: WCH CH334/CH335 USB 2.0 Hub Controller
> +
> +maintainers:
> +  - Chaoyi Chen <kernel@airkyi.com>
> +
> +allOf:
> +  - $ref: usb-hub.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - usb1a86,8091
> +
> +  reg: true
> +
> +  reset-gpios:
> +    description: GPIO controlling the RESET# pin.
> +
> +  vdd-supply:
> +    description:
> +      The regulator that provides 3.3V core power to the hub.
> +
> +  vdd2-supply:
> +    description:
> +      The regulator that provides 3.3V or 5V power to the hub.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    patternProperties:
> +      '^port@':
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +        properties:
> +          reg:
> +            minimum: 1
> +            maximum: 4
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    usb {
> +        dr_mode = "host";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        hub: hub@1 {
> +            compatible = "usb1a86,8091";
> +            reg = <1>;
> +            reset-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;

Are you sure?

Best regards,
Krzysztof


