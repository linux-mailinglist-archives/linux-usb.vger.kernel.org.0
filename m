Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE3B449DC7
	for <lists+linux-usb@lfdr.de>; Mon,  8 Nov 2021 22:16:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239881AbhKHVTi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Nov 2021 16:19:38 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:56892
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239940AbhKHVTh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Nov 2021 16:19:37 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 151713F1F0
        for <linux-usb@vger.kernel.org>; Mon,  8 Nov 2021 21:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636406212;
        bh=Ktl81v/Bz9DUD2tGXyt3QEXrDSC6xACsZ55UZL0LQHo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=KRK+SYi1Cgr4z0hoijMatYrZNzmstZABfXUMBfel5hkA39BM25FBomPAhMCLuiMV3
         hdXnDtgZlxoWz70REBGhOIhQLdUQg14w3n4gIJ1dL7zHUic6M1iFAYf6ER2L15vZ7e
         wXnZuUvwT8Jpt7qUxHDcFaOWg8wBmYc1EPywXiXGN9bltg/en2ORzVg5WDXlpFuMfO
         ykqJ/I0Eg2n7LeYaiNZWPFN/cfM2N9Kr6fo5rtrbm3Pt276djY7AFStJVFUIwOKLgm
         Y0yRMaPOLarMB5jSR28O5EhdlKJC8cKcjtLtMZ97pwFiKEval2kkKN5bhynSUZIT95
         +s77LD+Jx5DkQ==
Received: by mail-lf1-f70.google.com with SMTP id f15-20020a056512228f00b004037c0ab223so1198383lfu.16
        for <linux-usb@vger.kernel.org>; Mon, 08 Nov 2021 13:16:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ktl81v/Bz9DUD2tGXyt3QEXrDSC6xACsZ55UZL0LQHo=;
        b=BOuW5y1Lk77U0EAxFK5rzryZN4rAcLtnYqFYLoAkUUZSINRQ6LvLDAPezLvEtAuD6B
         ixSr7TNIpVRPpCaBPbD8sMdKcvJhs0ygdFtaQiuA56B4a6uvG+XUq8Fqekv+vwwl6pqB
         thp0y10AjXm6h+nEGGfhwtPXtJwQQNEr0Z1eDrSNvx8UEpYL24MqzXGeJOhZohvEAGPw
         yTvxwXAvjBJ6uytT1Fil0I/DWZN7XCMG3atZvspci5kGP/IrBs4xL2TgCLzHDAyg1UMW
         AJSkwBOS9q6nbr3v6dNkSZ8m4JZVePzhpKxp83Rjk2LEDZh5YgU1oZnZXCsPDlCuYj5T
         /+kQ==
X-Gm-Message-State: AOAM531uYqxmMX8qU+fsyfKS4zEx8xRo5/Ff5wLepIhuny41pWYmzQx8
        j5P4sc5DbcV2UfiO8M8Lv++hiAUf+HGwBGrs0CFVfx2vmqUPCS1UWNIEX0z7NiCboMvqjalAwQQ
        GKaw9dtUfdPRquzgxmqz0Loqms87FWsG81dk73w==
X-Received: by 2002:a05:6512:ac9:: with SMTP id n9mr2180478lfu.188.1636406211306;
        Mon, 08 Nov 2021 13:16:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOHL/9FtziDi6gx/33uA/2HxKYlDj46e0NYgoc72BGcMAuHzBgPINWumBlRSVqAb6ZuLjwSw==
X-Received: by 2002:a05:6512:ac9:: with SMTP id n9mr2180441lfu.188.1636406211057;
        Mon, 08 Nov 2021 13:16:51 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id u22sm1063187lff.118.2021.11.08.13.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 13:16:50 -0800 (PST)
Message-ID: <f60cf7e0-4f67-f4b3-2596-01114cff6623@canonical.com>
Date:   Mon, 8 Nov 2021 22:16:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 06/13] dt-bindings: rng: add bindings for microchip mpfs
 rng
Content-Language: en-US
To:     conor.dooley@microchip.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, lewis.hanly@microchip.com,
        daire.mcnamara@microchip.com, atish.patra@wdc.com,
        ivan.griffin@microchip.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     geert@linux-m68k.org, bin.meng@windriver.com
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-7-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211108150554.4457-7-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the hardware rng device accessed via
> the system services on the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/rng/microchip,mpfs-rng.yaml      | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> new file mode 100644
> index 000000000000..e8ecb3538a86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> @@ -0,0 +1,31 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/rng/microchip,mpfs-rng.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Microchip MPFS random number generator
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +properties:
> +  compatible:
> +    const: microchip,polarfire-soc-rng
> +
> +  syscontroller:
> +    maxItems: 1
> +    description: name of the system controller device node

There are several issues with this:
1. You need to describe the type.
2. Description is not helpful (just copying the name of property) and
actually misleading because you do not put there the name of device node.
3. What is it? Looks like syscon (or sometimes called sysreg). If yes,
please use existing syscon bindings.

> +
> +required:
> +  - compatible
> +  - "syscontroller"

No need for quotes.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hwrandom: hwrandom {
> +        compatible = "microchip,polarfire-soc-rng";
> +        syscontroller = <&syscontroller>;
> +    };
> 


Best regards,
Krzysztof
