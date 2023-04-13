Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8CC6E0813
	for <lists+linux-usb@lfdr.de>; Thu, 13 Apr 2023 09:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbjDMHqn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Apr 2023 03:46:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbjDMHqm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Apr 2023 03:46:42 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D7F45FD4
        for <linux-usb@vger.kernel.org>; Thu, 13 Apr 2023 00:46:41 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id j17so25517383ejs.5
        for <linux-usb@vger.kernel.org>; Thu, 13 Apr 2023 00:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681372000; x=1683964000;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uijb1uXkwk/VeMyOn96gYfBtO6LlBQttzcvm4ZtKChY=;
        b=S2/3sC9+Ui2RNwCSNyZw8v7BFEan+m1/PyXi1WMCvxaxhnzOtR8QJtJBvqreeatKaO
         tIocIb4k+Kzkp26C6sM/sI2E67qYGiCdpAnj1ywxBptBA/fFOUTQ4tSomjgMoDcxFQFb
         1lB7EAp/YMnR4PaXw+GQMDhC04q5uUXEWDxb70UXcAbznPSG6qgHCPXEF99GPObOH79n
         K2xybv+Bqaw9SnoxEXjcAin3A3c6IR5GbnvZv7Dla3CZXgKTJSrjLxfblOlLSsc+lKeP
         oITxvhzyuNC4+pm96LgsKmroNCXXbsA6stK0EB9FT+273gWDugY6TT7mi5Wa+g0PZy/r
         h1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681372000; x=1683964000;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uijb1uXkwk/VeMyOn96gYfBtO6LlBQttzcvm4ZtKChY=;
        b=kW4iXQ6EG9zHIbNydZaAzmLpdyaEfPRjhfE9odHL8VP1Q7aKCSS3TN9i230IP57zam
         KPfqGKHDpZ6TKeTRLVFD/J+W1cq4a8QiLPA8AMdfOqb0k9FOshbpKbOwqtBDdzY02xzK
         hGisM0hHEfBsB8ONX8ibM3Z4qjw9XV9QVDAaCOP21Mp72cISsZOHL2PIA4VXQOCYTdsP
         XlASI7sy+qCxAg1Bo5ChuUMgXG9QWHrdYZojftEHhPqpvqOJcJljeou8wHoPw+Fg3oK1
         hSmMLaE410dv2NNXuyTjaeoKn3gjWlAkqS44f3QG5MMTu3IpkuGOtqnFefzz0LyD/aip
         vECQ==
X-Gm-Message-State: AAQBX9cmBNwwWff48//SOsaRLuo9OkbK6MYQJN50q7QBfbAvHjugY8Ci
        IhJ+gO9LXzBMB8wZlzTHweQ2dA==
X-Google-Smtp-Source: AKy350YsRSZg5DBCeRNa2+QATFH6DFDUvoHjRWEdO6DKRqsBrBBzA3yXWW9bLLaKuzCdQcbcXG3/sA==
X-Received: by 2002:a17:907:7054:b0:94e:23b:75e9 with SMTP id ws20-20020a170907705400b0094e023b75e9mr1868945ejb.43.1681371999907;
        Thu, 13 Apr 2023 00:46:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ec6f:1b33:ab3f:bfd7? ([2a02:810d:15c0:828:ec6f:1b33:ab3f:bfd7])
        by smtp.gmail.com with ESMTPSA id s13-20020a1709060c0d00b0094e729d333fsm547697ejf.222.2023.04.13.00.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 00:46:39 -0700 (PDT)
Message-ID: <f698eaf5-963e-a40e-34b6-92693138b374@linaro.org>
Date:   Thu, 13 Apr 2023 09:46:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/4] dt-bindings: usb: dwc2: add utmi optional clock
Content-Language: en-US
To:     Fabrice Gasnier <fabrice.gasnier@foss.st.com>, hminas@synopsys.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, alexandre.torgue@foss.st.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        amelie.delaunay@foss.st.com
References: <20230412151831.3069211-1-fabrice.gasnier@foss.st.com>
 <20230412151831.3069211-3-fabrice.gasnier@foss.st.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412151831.3069211-3-fabrice.gasnier@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/04/2023 17:18, Fabrice Gasnier wrote:
> utmi clock is typically provided by PHY output. Add this optional clock,
> as the core could use other clocks depending on the SoC where it's used.
> This is needed on stm32mp15, when using the integrated full-speed PHY.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
> index 371ba93f3ce5..6f3c2d319b9b 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
> @@ -75,11 +75,14 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>  
>    clock-names:
>      items:
>        - const: otg
> +      - const: utmi_clk

Just: utmi

Best regards,
Krzysztof

