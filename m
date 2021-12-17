Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62F48478E93
	for <lists+linux-usb@lfdr.de>; Fri, 17 Dec 2021 15:54:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237613AbhLQOyA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Dec 2021 09:54:00 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:36288
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237622AbhLQOx7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Dec 2021 09:53:59 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C72D43FFD8
        for <linux-usb@vger.kernel.org>; Fri, 17 Dec 2021 14:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639752838;
        bh=GqzX2VxzFw4eQfFWT0YAjK60guUkBXetROhM4dzVpro=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=OlmHgTuuD6BokXGCIyu18F/5ZBFSpida6Q2Zrel5K7LV9FPnIVqHqiNdpKWYIac+1
         Pi8ClU8kHTfp7biQBMOlCBU6ydPz9upftp1Z/nnEEMb45zpaoUN7tuY4zvesoZc/Rp
         bJIxa0ooMsJpjBKJ9PdcRar2f/d+Ft7ikjHv90IoQ3rhh8fLdpAXh8tiplFak32zlm
         hgoJHuXb4N0JgAzytj1ZPFzSUGhFh21quk236aXd70i2A6qwp/czl/2LctBB1RbiYg
         pqGeZAg/yQIzvb/kxa11W1wSKmiWwo8ge24HzgHGJqdg8HnIhcFKMSAq5ZFK6Z9qB3
         KwRl/QAevZSyg==
Received: by mail-lf1-f70.google.com with SMTP id j9-20020a05651231c900b004037efe9fddso993786lfe.18
        for <linux-usb@vger.kernel.org>; Fri, 17 Dec 2021 06:53:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GqzX2VxzFw4eQfFWT0YAjK60guUkBXetROhM4dzVpro=;
        b=qSQp9MpY3kW6aaZhRfQbqnCZghq1FM21FhFghf3+AdafH6E1CSKQIc8Zkwlo8mbxVo
         a50bHsoDCNcECXZFYRehdTXPX+WTWOq9FlR1gLDoYO2xYhSKJivnx5e6DdsFz4hw0YLB
         ip27JSgtBcYJ0swhKEyLe4MtKq+exd3JJYi7Tzug5Eau7HLAoVJZQX0zP2uLgz6XH6nS
         1ciEq6qCckb1/UcFyXioW6ZWehQM/USQ2hK2J42GDPVGAmSSrFfFX/5AgQhXD4WlM+q1
         HuHpHaC85TbBocL6rPcwqPclgC9qS+qYQKke/lXlB02za/REZFFBEOfaEQgM9e93088I
         Tbng==
X-Gm-Message-State: AOAM530XfYNrre5ru4MdhZqEYJiU+fRGl5+m4R0e9MbqmGsqlWlrxnmO
        s7Q7u0mPsAVJAL+HyDEjw0rA4LCZTCenCECDNh6adecPvnYuh/S1ZdU/MbFYNwTQmFtLpzTik/r
        565HFcUMKcuLTJCJOsbY1AM+pSyVh1yc/pTNsxw==
X-Received: by 2002:a05:6512:2250:: with SMTP id i16mr361839lfu.24.1639752826430;
        Fri, 17 Dec 2021 06:53:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWZAhKPzpNiuI3jFYeXfUrK3lYJtF2bSZiJkAI3tx170rbCKWelfdxX/kRZ9W0bjHvtpmAig==
X-Received: by 2002:a05:6512:2250:: with SMTP id i16mr361809lfu.24.1639752826232;
        Fri, 17 Dec 2021 06:53:46 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id 76sm1687531ljj.69.2021.12.17.06.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 06:53:45 -0800 (PST)
Message-ID: <e59a60d5-4397-1f7f-66ab-3dd522e166a0@canonical.com>
Date:   Fri, 17 Dec 2021 15:53:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 06/17] dt-bindings: rng: add bindings for microchip
 mpfs rng
Content-Language: en-US
To:     conor.dooley@microchip.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     geert@linux-m68k.org, bin.meng@windriver.com, heiko@sntech.de,
        lewis.hanly@microchip.com, daire.mcnamara@microchip.com,
        ivan.griffin@microchip.com, atish.patra@wdc.com
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-7-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211217093325.30612-7-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 17/12/2021 10:33, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the hardware rng device accessed via
> the system services on the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/rng/microchip,mpfs-rng.yaml      | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> new file mode 100644
> index 000000000000..32cbc37c9292
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> @@ -0,0 +1,29 @@
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
> +description: |
> +  The hardware random number generator on the Polarfire SoC is
> +  accessed via the mailbox interface provided by the system controller
> +
> +properties:
> +  compatible:
> +    const: microchip,mpfs-rng
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hwrandom: hwrandom {

Three topics:
1. Node name (as most of others are using): rng
2. skip the label, not helping in example.
3. This looks very simple, so I wonder if the bindings are complete. No
IO space/address... How is it going to be instantiated?

> +        compatible = "microchip,mpfs-rng";
> +    };
> 


Best regards,
Krzysztof
