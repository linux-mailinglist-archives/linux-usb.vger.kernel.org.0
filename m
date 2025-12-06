Return-Path: <linux-usb+bounces-31217-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 368E0CAA51B
	for <lists+linux-usb@lfdr.de>; Sat, 06 Dec 2025 12:28:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49041313D3E3
	for <lists+linux-usb@lfdr.de>; Sat,  6 Dec 2025 11:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765CE2F3C28;
	Sat,  6 Dec 2025 11:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Gy3Zp7rU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64531FE451
	for <linux-usb@vger.kernel.org>; Sat,  6 Dec 2025 11:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765020477; cv=none; b=oxxgW8ovL4uM9r6Xa0T0wq9o8PCPHIxy87cVrBHiOtclB43lquVzq73ETsEMMc/mS0DNhBP0LITRZ/o+XosB789xqHi3JHYkjg5S2zesjtYQCfewk2YVWoGMxDjqc1DXC/lDd5GoM5zocZhPr1bhzkbxxDLIk7R6DRO4dduc4UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765020477; c=relaxed/simple;
	bh=XaNiArVUEN4ZsQecQjF6gbv7SF9bNnSkov1ro/kUthE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XFIeEnqRxkSSDLDdqX+kDIAhUgdygrTJOZ+92jIMnJuAQFLPxVbSPDtNB6w55SQs85X0un7w/Y32cFQl/t+HDQPGc1Z9ZyBSh/jfbzTfcF6d7CBOIPjekDqWnchGXk4fS8FzAnwJ+UQLA7WrRcS/gOFtOSwEav6QvcYV68uPgiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Gy3Zp7rU; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477770019e4so30079725e9.3
        for <linux-usb@vger.kernel.org>; Sat, 06 Dec 2025 03:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765020473; x=1765625273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=54ozK3Z1QShV9IRHsBfnCuV50Wy1Uh8rW7bx3u1PONQ=;
        b=Gy3Zp7rU8uTvPrWpHslNpe5sk8Uo4lUaftPiYN7NlJEkjNB0vCnlz+wn7nEDoZCuzR
         ArpP/Ip0O7qhTIlg2YMyfxbory6ebAxCRE4ytwn9izpPVDsvMNQbh7mvrKin0v1j1qQG
         SkcC2UGVTEa4R+DjfmtQqJoHlxrExteZLw7ZdoKTlBaQi1tXXN5+8jOVvVsYS16gtHdG
         iU7+IhMkEoIJAhxwp4cNq0syOOc7jzkCvpEMUuR5w8MnQs4w9uIQ23V8pGuILVKsUxo1
         hu5j6KbXS0a55PrZO2bPDvKyTsSjKazG5sRgOnj/SWx6qWHXXF5SPtojl3m33LG1QXBY
         VZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765020473; x=1765625273;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54ozK3Z1QShV9IRHsBfnCuV50Wy1Uh8rW7bx3u1PONQ=;
        b=OYq1ncB+CsEogpsIuC4rxxWk+iCmDBjTEYVL6UFkpC550OJzhTo/xt4q9TyFLXfmld
         oSW/PnR91hvM1Q4anBxWBumPrTEY26CyQqlTyGCIEB8lq0Vk+0A0a3MjFurv6LBSF4ie
         hrYiRWGDAkyOuPqx0HJYqX9qBCQQ81bqMiYqZJe5vLBb8D1mkX4vz/lKpUIWdmQACt7C
         vt+kTXGBFtxNxMoWZJfi5up/235SbolgaPiAZeTek9GKI7Qy3XYJK0a5OQy5YKNozGW+
         0302gS7ufGcXSWDnIjsJvrfs1WMlcKBYwNaeYGrVEAW7ayMhcxSFz30zlhsdPOhiqr6c
         Z7Qg==
X-Forwarded-Encrypted: i=1; AJvYcCXT/EYG+6a5Fx0fXdOpng8lzwfyS/gXDk5QlmiOxU0rxQHbfJxbql467KKnc9356sWTmywNfvsmbDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTjCXmsw4q43pHdbamn6g5aFlwbsSv2RGrZrAo8PTTsqO4h0GT
	zi1RzAL959aXykZNWkLsrIGPINt+265KGKq2zZG5bhVxt0qW81gUBUuQ9XVxauEKWFMcnEl9oCb
	DdLUp
X-Gm-Gg: ASbGncvakP8rYy7ZqgXXrZxZrEiFDHbToP78ZlLX8Z0jBI3qkRo6FzA/4WRu5Oo0v6r
	hzzwna38ZLpFvQ3N+ijqOh/dSOGm7lY1I2461q+dIbjoPvs1hVre8P6THjDvwtqJRsl1zYY089h
	Qu0hoSUdn/01r2bZVi3sfgH3q0JnRlZZZ7vs54QVtoqPi4DKrEgJCdaea+07aZOtUdNtjpyJBnp
	DelY6TQSDi7tj9o+WsaHA/773q4jtK+XGv/Nwlk8yyV5xUadbE4oFaoM+GLow6MSg/50tLjIu2D
	ZeVZqMuIvbsCufDDEdh3m5whYMA+yCpaN8cEuzJNi2VP0gN26H7xwY6qSBJ1mzK14EAPFeH+SwD
	JKLZi4jQv/5BsgG8p1mcaAB3tNm6Lcd3Gdtabh2qYpSMYHYjcPUhm1Rh7Zcb6/TB5Z4t/IOoNYS
	o8PnFRdkaod5XwKKCBknY=
X-Google-Smtp-Source: AGHT+IGuJHqRDLXzE6pBV+O5clnghz1M3R3qGXhTy8JipjIwofYQPlM3zKjZV4m7mJ7/Nt62yMVZiw==
X-Received: by 2002:a05:600c:8b34:b0:477:7f4a:44b0 with SMTP id 5b1f17b1804b1-47939e49385mr21133625e9.33.1765020473081;
        Sat, 06 Dec 2025 03:27:53 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353f80sm14204709f8f.41.2025.12.06.03.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 03:27:52 -0800 (PST)
Message-ID: <99b0dbae-0014-4d09-8724-092c03393dac@tuxon.dev>
Date: Sat, 6 Dec 2025 13:27:50 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: usb: Add Microchip LAN969x support
To: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org,
 nicolas.ferre@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 richardcochran@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com
Cc: luka.perkov@sartura.hr
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251203122313.1287950-1-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Robert,

On 12/3/25 14:21, Robert Marko wrote:
> Microchip LAN969x has DWC3 compatible controller, though limited to 2.0(HS)
> speed, so document it.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  .../bindings/usb/microchip,lan9691-dwc3.yaml  | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml b/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
> new file mode 100644
> index 000000000000..7ffcbbd1e0f4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/microchip,lan9691-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip LAN969x SuperSpeed DWC3 USB SoC controller
> +
> +maintainers:
> +  - Robert Marko <robert.marko@sartura.hr>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - microchip,lan9691-dwc3
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - microchip,lan9691-dwc3
> +      - const: snps,dwc3
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Gated USB DRD clock
> +      - description: Controller reference clock
> +
> +  clock-names:
> +    items:
> +      - const: bus_early
> +      - const: ref
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +allOf:
> +  - $ref: snps,dwc3.yaml#
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/microchip,lan969x.h>
> +
> +    usb@300000 {
> +      compatible = "microchip,lan9691-dwc3", "snps,dwc3";

AFICT, the examples should be indented by 4 spaces.

> +      reg = <0x300000 0x80000>;
> +      interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&clks GCK_GATE_USB_DRD>,
> +               <&clks GCK_ID_USB_REFCLK>;
> +      clock-names = "bus_early", "ref";
> +    };


