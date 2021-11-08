Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49FF9449DB1
	for <lists+linux-usb@lfdr.de>; Mon,  8 Nov 2021 22:10:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239856AbhKHVN0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Nov 2021 16:13:26 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:42632
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238547AbhKHVNX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Nov 2021 16:13:23 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6B8C43F1DB
        for <linux-usb@vger.kernel.org>; Mon,  8 Nov 2021 21:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636405837;
        bh=mwPFRn0AEGOneXePTnmoZQRi4asMCrfCLz0IrMjqCXA=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=L06ce1S7CebcXKfk9w/1VnAZa7HKWSH/CDXoHgwnJNpRXbIA4LkMXXo/uLR2uZR+o
         mTqQ6tqWADK91HZ09kylWKlDO5Z1hwD4Yr9FtemJNEeIzRbil2SFH5G88JgA6PPRVD
         xpKS4o0LVdYFgyCpuXLezU6PF0IYNPyLvE3Yh+wcUfLP6u9qM4IzovYy8mgq1lJohv
         TCQqJsyDaQ2c5P+yqkuJ1EU70gOgKKCyr9am8xb7cPC2vKSZXFtpe/EaaEvaT9fr/U
         Z/9wEEblC1nOh8QAgN8Hlx//5ASWi6tKgJEmbNOu/YoYg805vuHU2UVWVU2zn32Qji
         GMhCeEN0ITeYA==
Received: by mail-lf1-f72.google.com with SMTP id bp10-20020a056512158a00b0040376f60e35so1473741lfb.8
        for <linux-usb@vger.kernel.org>; Mon, 08 Nov 2021 13:10:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mwPFRn0AEGOneXePTnmoZQRi4asMCrfCLz0IrMjqCXA=;
        b=6p8a0v96oAB7TecVxbieaZgiSSE9jxrQtEirkFXugoPqe6S1Fo/0BW0aKYYAoAC7QM
         dqa8R/dkwPpBPD0xgDSGZqNSSmy7rDJVUEJ0bRXoQnzpVxk7B/gCkd77NIlPS77W9arH
         pn6YhXZa97qGUhREHCuYarRhlaOUjfqNtHNuMH8B7H4OPJuDXe789oOAU8cwCJeDT6lv
         H/XPdi+aNeW3s8bXtsEz5DWLTl8TDIc9VjT66hVRkm5Zq8zsCu/IMZGnt0myArvGj1bx
         G9Zq9WTLlySXTrcAnkgj2bPe6Zx2sA/qyvClkWltqlRItHX7kWlrrRIMLg394ze0pES2
         4snQ==
X-Gm-Message-State: AOAM533owmun7WEjMYp1VHL7R8pP+o5+41ki+/ylInNNOyICjvq5Ymql
        KUUTc5df2qwRw8n7CkCfxn1NCoFPmiBPbSaVrLs7R2pWAg0iuNpGzXZf7iDskPtETGB7AmYOXo2
        4XBLmsMb/RyrKJejBEyEFQV61sFc4/XqdqQ1qoQ==
X-Received: by 2002:a05:651c:246:: with SMTP id x6mr2094939ljn.49.1636405836525;
        Mon, 08 Nov 2021 13:10:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZb4LKcW1A1+MA8CuLWPJQDB5phDB0potg5NQYQwGvOUd0o3C/EZkqT0mWfTObhT2/wWNBag==
X-Received: by 2002:a05:651c:246:: with SMTP id x6mr2094920ljn.49.1636405836357;
        Mon, 08 Nov 2021 13:10:36 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id a16sm1929374lfu.274.2021.11.08.13.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 13:10:36 -0800 (PST)
Message-ID: <8343f11a-89e8-c043-6296-000f7ba3e3d2@canonical.com>
Date:   Mon, 8 Nov 2021 22:10:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 04/13] dt-bindings: riscv: update microchip polarfire
 binds
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
 <20211108150554.4457-5-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211108150554.4457-5-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add mpfs-soc to clear undocumented binding warning

What warnings? There is no such compatible used.

> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/microchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
> index 3f981e897126..1ff7a5224bbc 100644
> --- a/Documentation/devicetree/bindings/riscv/microchip.yaml
> +++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
> @@ -21,6 +21,7 @@ properties:
>        - enum:
>            - microchip,mpfs-icicle-kit
>        - const: microchip,mpfs
> +      - const: microchip,mpfs-soc
>  
>  additionalProperties: true
>  
> 


Best regards,
Krzysztof
