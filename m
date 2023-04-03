Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE0FA6D5136
	for <lists+linux-usb@lfdr.de>; Mon,  3 Apr 2023 21:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233445AbjDCTUN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Apr 2023 15:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233239AbjDCTUJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Apr 2023 15:20:09 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E9E72737
        for <linux-usb@vger.kernel.org>; Mon,  3 Apr 2023 12:19:44 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id b20so121558701edd.1
        for <linux-usb@vger.kernel.org>; Mon, 03 Apr 2023 12:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680549583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rO01+3k4fzVS/CqC5YjvddkQFJufKZJtp6FmS8S3Vzg=;
        b=Yi7A7zkfu+IHMbck2/TitvdJ6L4cw+Vm0TPV9ZEdJNaXE2NYh5wdbS816CRXVg1CxL
         o5p0DvQniMBWegtUeBvP+ZarG3PhT4+CAPAcgwSsl69C+lJqOuCiahmTb9xJ4WAjR7T3
         BWJz6rzqv40oWo/QS0xLlgDHKMUE0ozRFQQorBjzztoMXAVWRojOe1homea76gTy/GA6
         Vxd/XrKS4xy2JybNYgoqpiM2XMbBxbYzFClQ1AdvWbdRZgEYbSGI7SlMede0+eaOSIud
         lxNFqCwLwfj8hj81cTDnFqUvaUjD4sCMZOgFUTRWabMMu25FVvYPyOjf+AToCzO0oPQc
         aFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680549583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rO01+3k4fzVS/CqC5YjvddkQFJufKZJtp6FmS8S3Vzg=;
        b=5sgLFijrNwQ4En08exO3/wao2C90sbLNdAEU2opqDSi4OCEXViJkRZp0Hq+e2u12lc
         ldA964bLTdLMB4vEJABqkbpZsxeOYy2p4sFTOsm7BofL+nW0QJvGfjfwc29+ymzWuJHr
         /cHXGlT0jIVlhQaEsms/7qS76Me42CQeWiYC/QpQZJJcjS+pgO4u6Qch+mp2cYb+14Qi
         zc5SMCc5pKPm1ZmX4l03BPSwH4ltMnfxkufN8WajsaSGBWOb9O2tvLakw0ioK1PyOijX
         vRTO/3QiY33Ppl1Bd0s00fpSxMYwyVU2mgfcbmrpDL2qyxAQN4vHg1dSXlrNrdlNxNKB
         q68g==
X-Gm-Message-State: AAQBX9cyX2qOQQfETbmgIJxN8LzL6eyvnnwYQi3+7kXxgtWadV3jTyUr
        En04K6sdtZTKhoXpdPr5RBlTBg==
X-Google-Smtp-Source: AKy350bqVpOgQVbWoSPL7MpqchC8QTkyqwgB6DRPSqU1gag0Z4fSDQBJAF/ATSBK3zN8Uba0NWmgGQ==
X-Received: by 2002:a17:907:25cb:b0:946:f79b:e785 with SMTP id ae11-20020a17090725cb00b00946f79be785mr22215288ejc.2.1680549582892;
        Mon, 03 Apr 2023 12:19:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805? ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id h23-20020a170906261700b008e0bb004976sm4882835ejc.134.2023.04.03.12.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 12:19:41 -0700 (PDT)
Message-ID: <d8f3432a-b364-e939-c1f2-b4d55b1586e9@linaro.org>
Date:   Mon, 3 Apr 2023 21:19:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: usb: mtk-xhci: add an optional frame
 count clock
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Tianping Fang <tianping.fang@mediatek.com>
References: <20230403060232.25699-1-chunfeng.yun@mediatek.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230403060232.25699-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 03/04/2023 08:02, Chunfeng Yun wrote:
> Add optional clock 'frmcnt_ck' used on 4nm or advanced process SoC
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml          | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> index c119caa9ad16..ee8167fbc541 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -77,6 +77,7 @@ properties:
>        - description: Mcu bus clock for register access
>        - description: DMA bus clock for data transfer
>        - description: controller clock
> +      - description: frame count clock
>  
>    clock-names:
>      minItems: 1
> @@ -86,14 +87,15 @@ properties:
>        - const: mcu_ck
>        - const: dma_ck
>        - const: xhci_ck
> +      - const: frmcnt_ck


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

>  
>    assigned-clocks:
>      minItems: 1
> -    maxItems: 5
> +    maxItems: 6

But these should be dropped:
https://lore.kernel.org/linux-devicetree/20230403191850.374839-1-krzysztof.kozlowski@linaro.org/T/#t

>  
>    assigned-clock-parents:
>      minItems: 1
> -    maxItems: 5
> +    maxItems: 6
>  
>    phys:
>      description:

Best regards,
Krzysztof

