Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93A045501A7
	for <lists+linux-usb@lfdr.de>; Sat, 18 Jun 2022 03:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiFRBZ2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jun 2022 21:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232350AbiFRBZW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jun 2022 21:25:22 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65B2C6B012
        for <linux-usb@vger.kernel.org>; Fri, 17 Jun 2022 18:25:21 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id y196so5509323pfb.6
        for <linux-usb@vger.kernel.org>; Fri, 17 Jun 2022 18:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=pVKqQ1lqgF3EkrSHUJzWYv63xAjHMBJYsr4UymAWSVw=;
        b=gwoIvyMg1yJEub4U9RbN4pk370+U/FTdG0FmASXW0hglpc3ABXMvrtE7qSWFqvgK0H
         /nwLfhgifz4kqpEHpMon61La4pZts1Px+JOf7gLtJNpN7QTMP/ik7lUFik9j44ivgZt7
         Vpf9tB/RzqSdeU3Y7pQvHf2k4Zsx8OqN/Ef0dkNeIohn/hTohnRi1TDoLKG8nScGPl4G
         xFBm7s5evU1LjionDVWkX7SL+EX7p1KY2J+rRjpB9rJQdj6V+shgzeq6GPuM0051F+Ja
         Ip/5VZsp5BI4nMGlpqMdFHirZcNr+1KOvO+OtMVAcYySLE9oBnkq6V4sKi8xLX53jXU6
         BYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pVKqQ1lqgF3EkrSHUJzWYv63xAjHMBJYsr4UymAWSVw=;
        b=5RhaagvlUH08EtJq5xLwMH5IuAJRQYAYwjv3FM0UhhHqm8PYvyKJzHLrxByZvwrvwR
         Ye6YlI1MivhTju2yg37SiM7TsOxbZ6OYS+NenrBQxHiQdeBOYTCZog6xRtTv3YkjG1kf
         qjdCFsGghvWB8feapD//Pwtd1KKHuJSzgPGdZnmcNJLsyKLHxw5Y3SjZsFU5THLqe3YH
         6ef+1ClldbkZILXqFjA94I4VYmHP5Y90jmRY3wTlZVBS/J65uKgw9phiEGRWMHN62X2i
         PzKNKsiMNTLvhOzRWGKE/MZs3YZiLSzET69M6wNIvzOPrKZEx6isuFVcQIpOj6G9Ze8C
         mw9w==
X-Gm-Message-State: AJIora/1dkhUusuwnHLSevaNtEJEIGQZ8e6Gzl7I803OYOtvf/bSyxNE
        ZAuSvgj8jQi41IFpcb0Oa7Y9dA==
X-Google-Smtp-Source: AGRyM1sDlRA2MpZMdKacPonDxwVawuYrATRsYLfBJHJBUQ/uDFZHg+lldB+kDSyziTa+j5YSpZR3Xw==
X-Received: by 2002:a63:e74a:0:b0:3fe:7c2a:4b17 with SMTP id j10-20020a63e74a000000b003fe7c2a4b17mr11437694pgk.293.1655515520921;
        Fri, 17 Jun 2022 18:25:20 -0700 (PDT)
Received: from [172.31.235.92] ([216.9.110.6])
        by smtp.gmail.com with ESMTPSA id z9-20020a1709027e8900b00163daef3dc2sm4199943pla.84.2022.06.17.18.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 18:25:20 -0700 (PDT)
Message-ID: <8639e64d-c659-7090-2d0a-078fd96cfbd4@linaro.org>
Date:   Fri, 17 Jun 2022 18:25:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] dt-bindings: usb: mtk-xhci: Allow middle optional
 clocks to be missing
Content-Language: en-US
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, kernel@collabora.com,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org
References: <20220617222916.2435618-1-nfraprado@collabora.com>
 <20220617222916.2435618-3-nfraprado@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220617222916.2435618-3-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 17/06/2022 15:29, Nícolas F. R. A. Prado wrote:
> The current clock list in the binding doesn't allow for one of the
> optional clocks to be missing and a subsequent clock to be present. An
> example where this is an issue is in mt8192.dtsi, which has "sys_ck",
> "ref_ck", "xhci_ck" and would cause dtbs_check warnings.
> 
> Change the clock list in a way that allows the middle optional clocks to
> be missing, while still guaranteeing a fixed order. The "ref_ck" is kept
> as a const even though it is optional for simplicity, since it is
> present in all current dts files.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> 
>  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml       | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> index 63cbc2b62d18..99a1b233ec90 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -80,8 +80,13 @@ properties:
>      items:
>        - const: sys_ck  # required, the following ones are optional
>        - const: ref_ck
> -      - const: mcu_ck
> -      - const: dma_ck
> +      - enum:
> +          - mcu_ck
> +          - dma_ck
> +          - xhci_ck
> +      - enum:
> +          - dma_ck
> +          - xhci_ck
>        - const: xhci_ck

You allow now almost any order here, including incorrect like
sys,ref,xhci,xhci,xhci.

The order of clocks has to be fixed and we cannot allow flexibility. Are
you sure that these clocks are actually optional (not wired to the device)?


Best regards,
Krzysztof
