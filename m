Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 475B66D90B2
	for <lists+linux-usb@lfdr.de>; Thu,  6 Apr 2023 09:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236045AbjDFHnZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Apr 2023 03:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233391AbjDFHm7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Apr 2023 03:42:59 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F36086B4
        for <linux-usb@vger.kernel.org>; Thu,  6 Apr 2023 00:42:35 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-93db98f7b33so82772666b.2
        for <linux-usb@vger.kernel.org>; Thu, 06 Apr 2023 00:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680766953;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2CeMX83G7CI+LCtzmkNB4MbhW1kr0GUu8L33N5bnhLc=;
        b=F0nX+SvXYvsdr0a233FjCqVMoLV5+3k7r+csjEw4U9Ah6AIbz8Pd6Cs3cA/k3VbRps
         /lUyakfE9cdeYjue/v2Fs2HO2Vfyxg41+4rqsWY53zr47IjPMeXxkD63v86CQOME/v8U
         dzFP5+Ae18a0SaaHm4Hw0nAhTCZBiNO7vXHf23+0RdHyV1OmKqs5IbQlWKduJIHZicAo
         mjnhXmW4PJMzIlxYdU7BrSR/MeDPIst+5pY2zuXdrhOqMvQlXbhX6bZpia4Az6B5kXzG
         eCoUl6V80id62O0F5VlqP774Hv4zuuWO9Uh4kio+vP3PdNOZUkbKiuMso6r1TJ6TjHWo
         CQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680766953;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2CeMX83G7CI+LCtzmkNB4MbhW1kr0GUu8L33N5bnhLc=;
        b=k+l03ZNXgU87zzLYCNXOVbhc3ssvDrOmyOMZt4/lLfSbVoZu4T63Je3ixvEtanz71x
         Kc0xFSXFEFeXW7jseT33nCzC5NqStMOvrePndKRguK3yz2Xj3vHquuzB4QdIX+/Xqm22
         Rtpvykhr071qykZsbOgyE2Av2LfaDc/tGwt8TG2OM+ZeEvUr+ia078dbxRW+9oZRlnGD
         +weWG5O7RdwZBydG1Hczlg7z0RhihAt2RLJlU1e8i8dzeOB3YsNoXD0/mZ0dsxh0ZpwD
         XhUjijU66HVvKOYAAcT+R9TUZPMjJwPkt8sLhCJXW8GOdoTEEj6QJK6McZ53tJOWGla/
         eraw==
X-Gm-Message-State: AAQBX9dsaWdH14WEezK9gDH6ZAQSDAGL4SjfuUgTytVEDbFXp5H3FQnf
        dqibC2yzRsOsIhLs3OgDxzaeZg==
X-Google-Smtp-Source: AKy350atbynXL3zs3eE1PYHo+8dQrh+MY7FEjoP+cVC0eI0NqgnAQYJsPpawDRy1Ph70Zky/dGiDrQ==
X-Received: by 2002:aa7:df99:0:b0:502:2f3:abd3 with SMTP id b25-20020aa7df99000000b0050202f3abd3mr4200119edy.35.1680766953612;
        Thu, 06 Apr 2023 00:42:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id l22-20020a50d6d6000000b004bf7905559asm362400edj.44.2023.04.06.00.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 00:42:33 -0700 (PDT)
Message-ID: <b9763bee-c0c8-86be-14de-2ed077b1f1d5@linaro.org>
Date:   Thu, 6 Apr 2023 09:42:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 2/8] dt-bindings: phy: qcom,qmp-usb: Add IPQ9574 USB3
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
References: <cover.1680693149.git.quic_varada@quicinc.com>
 <1efa9a64499767d939efadd0aef897ac4a6e54eb.1680693149.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1efa9a64499767d939efadd0aef897ac4a6e54eb.1680693149.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 05/04/2023 13:41, Varadarajan Narayanan wrote:
> Add dt-bindings for USB3 PHY found on Qualcomm IPQ9574
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  Changes in v8:
> 	- Update clock names for ipq9574
> 
>  Changes in v6:
> 	- Made power-domains optional
> 
> Note: In the earlier patch sets, had used the (legacy)
> specification available in qcom,msm8996-qmp-usb3-phy.yaml. Moved
> to newer specification in qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> ---
>  .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        | 43 +++++++++++++++++++---
>  1 file changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> index 16fce10..e902a0d 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> @@ -16,6 +16,7 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - qcom,ipq9574-qmp-usb3-phy
>        - qcom,sc8280xp-qmp-usb3-uni-phy
>  
>    reg:
> @@ -25,11 +26,7 @@ properties:
>      maxItems: 4
>  
>    clock-names:
> -    items:
> -      - const: aux
> -      - const: ref
> -      - const: com_aux
> -      - const: pipe
> +    maxItems: 4
>  
>    power-domains:
>      maxItems: 1
> @@ -60,7 +57,6 @@ required:
>    - reg
>    - clocks
>    - clock-names
> -  - power-domains

Power domains are required. Commit msg does not explain why this should
be now optional.

Best regards,
Krzysztof

