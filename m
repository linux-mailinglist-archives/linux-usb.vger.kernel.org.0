Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F68565FD53
	for <lists+linux-usb@lfdr.de>; Fri,  6 Jan 2023 10:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbjAFJNr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Jan 2023 04:13:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232154AbjAFJNj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Jan 2023 04:13:39 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8E621DDF6
        for <linux-usb@vger.kernel.org>; Fri,  6 Jan 2023 01:13:36 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id ay40so639952wmb.2
        for <linux-usb@vger.kernel.org>; Fri, 06 Jan 2023 01:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5OdyRKFST2UkrnFQxoJYi7XQRvXEY/YmDNSwtGSyDTY=;
        b=jaIjZJ8WvQZJ6gpN09cWaQq02Y8TPrEBfFCbgTx+QgJd26vyPxTXMIQI9ATnUSVuk/
         H9vMIIsnijhTum/ltk1BGF0VZRxmn59ZH9GOHC2xllg4Y9zS9U8Lg//VyB/0/zX6Z6hX
         nGojXyiQ5buKmL9ZSANJJt1vi5ttb9hCAtklYLYZeiPjvLGi1ZC4nwtnKT1z3PoCGnnu
         JCUKcxBt9uH4P9kbRgQgVInn9XrhxMKMTpdCuvJF8HW5PHlOpo2Zo1999OZbsr//ZXMh
         TNY4K6MnQqCyRHTkZMfxf8FlIaiLKbKQYHF9N3kD3pzJ6H5Rp9yzzszbPJOQDb54tS1L
         AE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5OdyRKFST2UkrnFQxoJYi7XQRvXEY/YmDNSwtGSyDTY=;
        b=mOjO63gP69j3iD2jEzhoY8IpYy4Au4HXKgZpXVylR2wASLwZnYi+mZo9auYNu5CR99
         rE6JxjC2sVJkvEGUs+/FT5+zgtCl5SQEJOFY1eJGWiF0vSvKfXhRXF2D+CS1VJmUSfuo
         c+Pm+6l5S4f61mSjwGwZf42wGDw0fxFy0spswIWeZauzQJIC3ctzLdeKWRYR/IhAnhak
         m7+yiZNFUDh2YSJKuZ/vMbh5aHcFq7i6wDe3lPJ6KT1rpfoRFVy3Pse53WTg/BLb5T2l
         unWYFNBqoBuCbTNXNDyCrw64ycbBgKpmHyLUGSkQedu/WwuPJq4KGrUg7Pe698pP0Tji
         m3mg==
X-Gm-Message-State: AFqh2kp9WBfY+hnpoDTByjQ8v4GQU3uHSrACftCPTMjQ6Xtp7hU/PAQb
        CkVMrhgOErshGbgL/5c5Rh3WoA==
X-Google-Smtp-Source: AMrXdXtIAHzHGFPUTck4jeORiekJikKX1pv3b1Tw1WmT0umvTTwZXhYfJh6tmIJQmZmvLp3lbqrciw==
X-Received: by 2002:a1c:7c0f:0:b0:3d5:816e:2fb2 with SMTP id x15-20020a1c7c0f000000b003d5816e2fb2mr41639542wmc.14.1672996415396;
        Fri, 06 Jan 2023 01:13:35 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j1-20020a05600c1c0100b003cfaae07f68sm6093133wms.17.2023.01.06.01.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 01:13:34 -0800 (PST)
Message-ID: <fa0327b1-2180-1421-b448-a45ab0be9750@linaro.org>
Date:   Fri, 6 Jan 2023 10:13:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: eud: Add SM6115 / SM4250
 binding
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     quic_schowdhu@quicinc.com, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20230103150419.3923421-1-bhupesh.sharma@linaro.org>
 <20230103150419.3923421-2-bhupesh.sharma@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103150419.3923421-2-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 03/01/2023 16:04, Bhupesh Sharma wrote:
> Add dt-bindings for EUD found on Qualcomm SM6115 / SM4250 SoC.
> 
> On this SoC (and derivatives) the enable bit inside 'tcsr_check_reg'
> needs to be set first to 'enable' the eud module.
> 

Subject: drop second, redundant "binding".


> So, update the dt-bindings to accommodate the third register
> property required by the driver on these SoCs.
> 
> Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,eud.yaml         | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> index c98aab209bc5d..1dffe14868735 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> @@ -18,12 +18,22 @@ properties:
>      items:
>        - enum:
>            - qcom,sc7280-eud
> +          - qcom,sm6115-eud
>        - const: qcom,eud
>  
>    reg:
> +    minItems: 2
>      items:
>        - description: EUD Base Register Region
>        - description: EUD Mode Manager Register
> +      - description: TCSR Check Register

Is this valid also for sc7280? From commit description looks like not,
so you should have allOf:if:then constraining the items per variant.

> +
> +  reg-names:
> +    minItems: 2
> +    items:
> +      - const: eud-base
> +      - const: eud-mode-mgr
> +      - const: tcsr-check-base
>  
>    interrupts:
>      description: EUD interrupt

Best regards,
Krzysztof

