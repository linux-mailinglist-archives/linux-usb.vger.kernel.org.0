Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE2CF66DBFC
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jan 2023 12:14:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235843AbjAQLOC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Jan 2023 06:14:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236755AbjAQLND (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Jan 2023 06:13:03 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 395093456F
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 03:12:51 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so4429545wmb.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 03:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bBL+3z7FwRu66kVqmwrvKHKciT56qaxXPVTQkVCDYt8=;
        b=KjtJ8nG+uqmSz8f9E6FB/XyUef5RrwLssFDnC/XT5FlJ0NHoYHT4j006ESqIa+FNop
         nT+gAmGKKG6pBSOgURdT7gdzlFhCSogb9WJ5lUqqNkRdTIdx5fpVmKcvD5gK8IJnwZq8
         ccfpRXxas7C10rHmX2cBmJJRCOQ6ckNFHbw+vUeicI6/sdsqxhkrEwEN9r3OIYTXCu8V
         h9HYhV7o3uWDfts6jx+YX0qBMuPYTHVC7UulzZEz8aew0skOItz2QzuvGNT+ChgYVeyk
         QcCdtN+1iqFw1jZCGixqu+sUog7bFoKpdJiZTpq7ZyLffE8zUEjyGJihvt3bMQ7W9syA
         cBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bBL+3z7FwRu66kVqmwrvKHKciT56qaxXPVTQkVCDYt8=;
        b=ZUiYpIOb4IPdwYuiEdJM5msQd28W7q1NbpOvZ67/2sUrFU/PUGx8XxNoG5/sv1HK69
         nbmxBBonEpBWh+QPZElirJTu5EjmVhKu2pDgvmbKq8oVmojJ5glRfW2c4Ql+VVk9secA
         BvncJPU7r1dr09Ox69pdj2HiK6aZWF+YsgkfCSnprjsEMUzgGnxq5B3EonN107JJIJaV
         /ZF/6HrSSvdKnSLvmWI4SWCkOqhpwcYWSxIHZfUExqHoAevEbVxaM4EBfIIS0VIABbEZ
         ASrZVXoZ1M0nKCJ7EoU8i5o/l3BH/VIr+dgBHWSv/fvlCrc2/KqRjA4vI0FiSpBBRRuB
         2BOg==
X-Gm-Message-State: AFqh2koyfPRRVGR+PmSIAghL/OjnJCP1+73UmGcV/BbQls9ZEMrnFhuh
        FkZwqUuhuq8Td8/FdXM7GU2u0A==
X-Google-Smtp-Source: AMrXdXs71rRTTNnxoWaaJ+6Z5xjRQ6G3SYq885C7J5gYeSzqJwN1qsu/urj6k4aS1qlXPB0jUR4Mkg==
X-Received: by 2002:a1c:7514:0:b0:3d9:f559:1f7e with SMTP id o20-20020a1c7514000000b003d9f5591f7emr11398160wmc.20.1673953969834;
        Tue, 17 Jan 2023 03:12:49 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c444800b003c21ba7d7d6sm40016037wmn.44.2023.01.17.03.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 03:12:48 -0800 (PST)
Message-ID: <232ed345-aea1-5e68-5fca-9a93c3896acb@linaro.org>
Date:   Tue, 17 Jan 2023 12:12:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V4 1/5] dt-bindings: usb: tegra-xudc: Add dma-coherent for
 Tegra194
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20230116145452.91442-1-jonathanh@nvidia.com>
 <20230116145452.91442-2-jonathanh@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230116145452.91442-2-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 16/01/2023 15:54, Jon Hunter wrote:
> DMA operations for XUSB device controller are coherent for Tegra194 and
> so update the device-tree binding to add this property.
> 
> Fixes: 394b012a422d ("dt-bindings: usb: tegra-xudc: Add Tegra194 XUSB controller support")
> 

No blank lines between the tags.

If this is a fix, you need to describe the observed issue or bug. Commit
suggests this is just adding some missing piece, so not a fix for a bug.

> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml   | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
> index f6cb19efd98b..4ef88d38fa3a 100644
> --- a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
> @@ -112,6 +112,8 @@ properties:
>    hvdd-usb-supply:
>      description: USB controller power supply. Must supply 3.3 V.
>  
> +  dma-coherent: true
> +
>  required:
>    - compatible
>    - reg
> @@ -164,6 +166,16 @@ allOf:
>          clock-names:
>            maxItems: 4
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra194-xudc
> +    then:
> +      required:
> +        - dma-coherent
> +
>  additionalProperties: false
>  
>  examples:

Best regards,
Krzysztof

