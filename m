Return-Path: <linux-usb+bounces-8971-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 019A6899780
	for <lists+linux-usb@lfdr.de>; Fri,  5 Apr 2024 10:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2568D1C21C55
	for <lists+linux-usb@lfdr.de>; Fri,  5 Apr 2024 08:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3CA9144D28;
	Fri,  5 Apr 2024 08:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A4U22bbT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365E0144D24;
	Fri,  5 Apr 2024 08:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712304291; cv=none; b=J06fxz85HqcnGLN0uTM6KA2IRR/VXq+ENEy30oAonl8k9tbWWA9ipSfAOsykMPFrrcDXii1rBbo0GKkGVnVNjGa6I9ShRO5DIYdd6e3TTf2vX9rGdJdP2gMGXBwyHhVO1j2/4sFJ/F0fkE4s9VsorfA40SaNi0Lhj7LyJTSYVUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712304291; c=relaxed/simple;
	bh=c0LkwmvSHMlRpLdHO0hREWTP589I0lIinpLEAKQxt0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SPrqyZvpooaKrt4WqRZSAXDheYc24Dgd2H/HkxyEGHMFeLbLz9NpsahGu5p9tyk11aV0m7wQ2EFi5bkChZM7kU7jJG4GmOK3hi1uzfFWKkI9GooZvAXZb0oeF/WJnfMVBGL6RXYL9XpCDZFsguexJMGhl8v9YEbGP0WI8bYxsB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A4U22bbT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F37C433C7;
	Fri,  5 Apr 2024 08:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712304290;
	bh=c0LkwmvSHMlRpLdHO0hREWTP589I0lIinpLEAKQxt0E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A4U22bbTg3WVNLU/BRer47MTlfnCmpFviRskEIvVSrwNgP28WvtRyj+r8DuHydbf/
	 NoxKqChaUOEIxON2Z1UTrTIZyPyFWx+CptFNa0VVHYI24cBD4/qlxx6hQcsoD5Ma+M
	 bl73oUAFGKyWiFVtgTiuqT14ebCsw1aHw2qWIQCNXUlawpVW0OfyKGlQx2rhGWu5ce
	 V5w5iWs383eobmbidmdYvr4l0I7vQBlDXkP3XkkDuZ5xZ6+omww9zXWS4TW1d5WVQZ
	 1JVXu9G1sVH5kNxUAlqtcJq5VlLYIdXmpRWOvy1kgy0mO+MMU3sXW2jd4i4jAtWh0t
	 YSaKSslQoO1Ng==
Message-ID: <5741de00-11a0-4163-bfc2-a22c1995c96d@kernel.org>
Date: Fri, 5 Apr 2024 10:04:44 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: Document the Microchip USB2514 hub
To: Fabio Estevam <festevam@gmail.com>, gregkh@linuxfoundation.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@denx.de>
References: <20240404164140.662361-1-festevam@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <20240404164140.662361-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/04/2024 18:41, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Document the Microchip USB2514, USB2412, and USB2417 USB hubs.

There is 2514b already. Why it cannot be there? Is the existing file
only for I2C interface and here you add on-board-hub approach interface?

If so, mention it briefly in commit msg (one sentence is enough).


> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  .../bindings/usb/microchip,usb2514.yaml       | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml b/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
> new file mode 100644
> index 000000000000..8df7a5adfbe8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/microchip,usb2514.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip USB2514 Hub Controller
> +
> +maintainers:
> +  - Fabio Estevam <festevam@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - usb424,2412
> +      - usb424,2514
> +      - usb424,2417

Please keep the list ordered.

> +
> +  reg: true
> +
> +  reset-gpios:
> +    description: GPIO connected to the RESET_N pin.
> +
> +  vdd-supply:
> +    description: 3.3V power supply.
> +
> +  clocks:
> +    description: External 24MHz clock connected to the CLKIN pin.

maxItems.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: true

No, this must be false.

This does not make really sense. You miss $ref... and when you do not
have $ref you should use additionalProperties: false. Open existing
bindings for device of the same class.


> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx6qdl-clock.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    usb {
> +        dr_mode = "host";

Drop property, it's kind of expected/obvious and we want to limit
chances schema will complain about something unrelated to your device.

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        hub@1 {
> +          compatible = "usb424,2514";

Inconsistent indentation. Use 4 spaces for example indentation.

> +          reg = <1>;
> +          clocks = <&clks IMX6QDL_CLK_CKO>;
> +          reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
> +          vdd-supply = <&reg_3v3_hub>;
> +        };
> +    };

Best regards,
Krzysztof


