Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68F056F884A
	for <lists+linux-usb@lfdr.de>; Fri,  5 May 2023 19:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbjEER6x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 May 2023 13:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231326AbjEER6w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 May 2023 13:58:52 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF074ED
        for <linux-usb@vger.kernel.org>; Fri,  5 May 2023 10:58:50 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f13bfe257aso2374279e87.3
        for <linux-usb@vger.kernel.org>; Fri, 05 May 2023 10:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683309529; x=1685901529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C8N9Yr+zLlSevy06onPb6pPa3VVo3y3jk+4XaNqiZBs=;
        b=Ep4smO9t15h10cTBiNTowus3FNEFVdq8TQ5k5C4I9TBLRDvmCLgQcMSJKSK2VSVx2L
         z6ycSu3yzMLvuBl1lJAGuNUlVsAzvS3LigR7xnGAl72euR414h9HNMqUKUR43prLO7d7
         Of9UklOY/c9zTD/IH4loimwktA+5X34ygCTB1/X2ATsJx7yAIhFydj0uy+yWIq0y5GN4
         N/BdwcuiFenaZKzlRfCJ5LQp4lFeDIvp5n3jj+G83wv+CtKfrkZQIqGyjMXOx29aZS1S
         anzfg+ldY+q+LqWQTCAfAqS/nZIWvpBwoQbSBE+vjtA7vkapYkNHVAQQr7IbG5AVPKxz
         cVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683309529; x=1685901529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C8N9Yr+zLlSevy06onPb6pPa3VVo3y3jk+4XaNqiZBs=;
        b=SS4THsVI9qQciwEoCABB+KG2WObsW0hRLFGPBMN2l6tN/NPVIrs67hzI6qzmntySol
         mdPQt4bzT1wq7SlvOexiWNx36zSz3hgs0PPtYFH+qBCxIXS9QLEFpn/VoSqNr66sWclc
         gLMzQpu1u/pCRRbB/ezfhjdbikfSA+dJWxFuuqUTQTc2vHh3dR1creCuJ9u90ecoB/UL
         iyr7yO9PEawAKrqaj07ZQYUdkGQ8Eupw8iz3ILHZuhf9+I+7yaV88n/OT2ASR94ABw3J
         TuJuI/mcWuzTJsrnRLB/q3wzCrk59KTlLPlG/Q8hRj/E2Wp5Pw3y6w7Olgf0kMSVbYiB
         I1Tw==
X-Gm-Message-State: AC+VfDzCfycEBZMe6k2DuNzeao9XpXlZCGdHKqw7q+iRWJhfoWLOPIe2
        1perQmz8u8Cm0AojUrXteXpEp1dbl2RARGVumc2BXQ==
X-Google-Smtp-Source: ACHHUZ5YVY8N0DzX6h9cm4JNuQQzxfsGQgQZKNrnF1+roP7Bz5pge3isOtPrJreeZ48Xm5hU0N/W/g==
X-Received: by 2002:a05:6402:1343:b0:50b:caf9:4b85 with SMTP id y3-20020a056402134300b0050bcaf94b85mr2026314edw.18.1683308794939;
        Fri, 05 May 2023 10:46:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:52e:24ce:bbc1:127d? ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
        by smtp.gmail.com with ESMTPSA id s3-20020a056402014300b0050d83a39e6fsm286383edu.4.2023.05.05.10.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 10:46:33 -0700 (PDT)
Message-ID: <ccee82e5-96d1-1275-8fe3-73ccc81db11a@linaro.org>
Date:   Fri, 5 May 2023 19:46:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v10 2/9] dt-bindings: phy: qcom,qmp-usb: Add IPQ9574 USB3
 PHY
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1683183860.git.quic_varada@quicinc.com>
 <10b8b06f133c72415a609e6bc6595424712e029e.1683183860.git.quic_varada@quicinc.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <10b8b06f133c72415a609e6bc6595424712e029e.1683183860.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 05/05/2023 09:35, Varadarajan Narayanan wrote:
> * Add dt-bindings for USB3 PHY found on Qualcomm IPQ9574
> 
> * Making power-domains as optional since IPQ9574 doesn't have GDSCs
> 


>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq9574-qmp-usb3-phy
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: ref
> +            - const: cfg_ahb
> +            - const: pipe
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc8280xp-qmp-usb3-uni-phy
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 4
> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: ref
> +            - const: com_aux
> +            - const: pipe

required:
  - power-domains


Best regards,
Krzysztof

