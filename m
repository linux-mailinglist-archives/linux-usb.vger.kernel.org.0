Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 680416C58FB
	for <lists+linux-usb@lfdr.de>; Wed, 22 Mar 2023 22:52:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbjCVVwu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Mar 2023 17:52:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbjCVVwt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Mar 2023 17:52:49 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A31BCAD12
        for <linux-usb@vger.kernel.org>; Wed, 22 Mar 2023 14:52:47 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id ek18so78818636edb.6
        for <linux-usb@vger.kernel.org>; Wed, 22 Mar 2023 14:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679521966;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ae1Fg1XrNO0U2G9oXfkthXql4Cz6bcgr28jd3JL36xQ=;
        b=MhhTNWacisy6aVXWag8D/bV7u6OA1Z5BweJMma4y2nxaFetFPEd1946+0b+Ylqw2OC
         Kq0bqlJVqcv+wj/EB+AR89gfXto7MWzPeQ06XW99ZVveKLV0jTKp/y923NdLqvt+vxFR
         EvC+RZiHhkOoKODsvKtiG7i7dL/7U7Cy4wqFQCYgenxFfihZk8MbQGHtehsL37txDRmP
         HaI/VNZRWWOE9cYic9BwSguWuef225+VL+y4CLBeK0EhhVQfEJQXazo9fB2vyvC7q+d/
         M1zftfaWEuHy1y0n+E3dWI9/RF5noB59veAPSGQ8VjOn2dlZtoByfzbsf1UNLONrTLKg
         Ofqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679521966;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ae1Fg1XrNO0U2G9oXfkthXql4Cz6bcgr28jd3JL36xQ=;
        b=lPviQ/XQwPzft3ttW2eMus3vqAk8YDFaTaD++YQjBi4S8kMVcLZckR2xD9R1HjIhgb
         wFgcLjqhVnejwxKje1gyA1cXH7LYcTjo+BIYcdLE/WSBTBK91VVd0eOr+cbSOrSDXQcg
         rtg/5bVw1yt/cZMx9DRK3nAKpfNh9W5oznlAdgVzaLNUvFX5h0nBxVGVNSR5pNFIYQdf
         6k5j0vSUL1yWX7TzTDWbkDVYxt/DbF05+loI7N8RwlWX/c1gKE36JTX9gbirPLfa1e/d
         BN+HXC+155+Hb7pdEU6KJroLg7b0xOG4YeGm/5dNeSNaYkvx8w2Zj6G8wXVw6SpEUPlr
         cfvA==
X-Gm-Message-State: AO0yUKX4+KPBq0et+XZP5cGbkew4engaJgowd8OcN3eKzDjZWd8lRG0s
        VLmDk2t8myb8me3ENS/BTkvH8w==
X-Google-Smtp-Source: AK7set+36xqihcRaSbhw9EZd7MivK51J2wyj0FDKumen87LrblW3ZwyU1x5vO2IU1KXVqvSiIqgKkA==
X-Received: by 2002:a17:907:1628:b0:878:6477:d7 with SMTP id hb40-20020a170907162800b00878647700d7mr9845624ejc.72.1679521966159;
        Wed, 22 Mar 2023 14:52:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:626d:5729:6e71:4c22? ([2a02:810d:15c0:828:626d:5729:6e71:4c22])
        by smtp.gmail.com with ESMTPSA id t25-20020a170906065900b00939a61113d3sm2987235ejb.110.2023.03.22.14.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 14:52:45 -0700 (PDT)
Message-ID: <c52a329d-8683-de82-9b55-209b99ac36c0@linaro.org>
Date:   Wed, 22 Mar 2023 22:52:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 2/8] dt-bindings: phy: qcom,qmp-usb: Add IPQ9574 USB3
 PHY
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1679479634.git.quic_varada@quicinc.com>
 <e34d8eddc1dda8bb0ff840a7dd18ca4dd6c62d22.1679479634.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e34d8eddc1dda8bb0ff840a7dd18ca4dd6c62d22.1679479634.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22/03/2023 11:44, Varadarajan Narayanan wrote:
> Add dt-bindings for USB3 PHY found on Qualcomm IPQ9574
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> 
> ---
>  Changes in v2:
> 	- Updated sections missed in previous patch
> ---
>  .../bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml    | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
> index e81a382..beae44c 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
> @@ -21,6 +21,7 @@ properties:
>      enum:
>        - qcom,ipq6018-qmp-usb3-phy
>        - qcom,ipq8074-qmp-usb3-phy
> +      - qcom,ipq9574-qmp-usb3-phy
>        - qcom,msm8996-qmp-usb3-phy
>        - qcom,msm8998-qmp-usb3-phy
>        - qcom,qcm2290-qmp-usb3-phy
> @@ -204,6 +205,27 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,ipq9574-qmp-usb3-phy
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 2

toplevel defines minItems as 3, so are you sure this works? Did you test it?

Best regards,
Krzysztof

