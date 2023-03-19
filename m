Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 482B36C0127
	for <lists+linux-usb@lfdr.de>; Sun, 19 Mar 2023 12:54:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbjCSLy3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Mar 2023 07:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbjCSLyZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Mar 2023 07:54:25 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6872C21A33
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 04:53:36 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id r11so36719255edd.5
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 04:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679226813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n27ash1ZV3nvhcp1Y7K3jMG+XzPX+dZla6qCaA/tb6A=;
        b=nWr3ScZrTWn6Zt3UhfbfIO0Pa838QVuzr6IOXrpABY21TR3kXEN/QAepAwRx4ErSLS
         gLMVPd/I0CwmO44YANGPNFmHLbimlhZBEilQkYEbHVBP7Uw+Zaif6SBds7suxRWQyrC5
         Lnn6MqpJl2bPLPQzihM2CB5VFR1/JsZwgbb990MUc9LzgX6a6UYOlcie+LYZFvVq4WbK
         ZacTEafGDQ6Q+TvdPOYNw13SLIB7ulAMFnae6LaHldTCSSnf6Y0lmj6RIb2TtBvKzDf/
         Ggfsv1ZHjBkkSnvFANHyyUh6TsVTWRzNHq67hSO/sIwDqjkovzzlz3yfawTr20WxlBZQ
         TZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679226813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n27ash1ZV3nvhcp1Y7K3jMG+XzPX+dZla6qCaA/tb6A=;
        b=0o1N1JEuxVeZuSmSZGhtr5ILOhN9xKjN14B18OV1u9YHahEFUbEPD9Bf9P2+Ar085u
         1Fydl0agFnvQlofYL/F3H/X2qYxK+lrF5s23MbCaJhWqDV3MiYAtvHvq28EH4A9+pwLy
         542JQHXT2f2AnJy3iT0u6xvhFlgbnMAZ+CDWfqlwwYcC5wRJJuXY+KDGhnPo/+rAV7oH
         8j6afQiGrkbWh6Q69pNzyjTEToQn9uCAjOKHR9iVg4ZFlJteOmWj8PbeTM6GTu2s7AXs
         3f5pO0eG/mbfmuVW4F2wFmg/AGt2M/p7IyZRQajLCXAuTe8T0Rif9CB3ex8Kv3DX7f7v
         0SMw==
X-Gm-Message-State: AO0yUKXzMRAppo3RUiaxYXHugtySaCHgimsseUYwezmzTm/onrbzzhZM
        XwMJuM9nkyvxQgN2ctTCDlHFoA==
X-Google-Smtp-Source: AK7set8u1FPrRK5Kcxl2IomzkWfEOJbSXoOLMVLalI2wQ4leod0gDrwuBfsUQPXxujAKvQXFXrqxqQ==
X-Received: by 2002:a17:907:a042:b0:930:310:abed with SMTP id gz2-20020a170907a04200b009300310abedmr4726778ejc.54.1679226813388;
        Sun, 19 Mar 2023 04:53:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id n3-20020a170906088300b009327ed171f2sm2427410eje.129.2023.03.19.04.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 04:53:33 -0700 (PDT)
Message-ID: <7d48a2ca-3f73-073b-0ea8-d9ae4f12d8a9@linaro.org>
Date:   Sun, 19 Mar 2023 12:53:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 02/18] dt-bindings: regulator: qcom,usb-vbus-regulator:
 Mark regulator-*-microamp required
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-3-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230318121828.739424-3-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 18/03/2023 13:18, Bryan O'Donoghue wrote:
> The VBUS driver needs to know the regulator-min-microamp and
> regulator-max-microamp so they should both be marked as required.
> 
> regulator.yaml defines those two dependencies so include regulator.yaml.
> 
> We need to change from additionalProperties: false to
> unevaluatedProperties: false.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/regulator/qcom,usb-vbus-regulator.yaml      | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> index 7a3b59f836092..f6ecb0f72ad9a 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> @@ -14,6 +14,9 @@ description: |
>    regulator will be enabled in situations where the device is required to
>    provide power to the connected peripheral.
>  
> +allOf:
> +  - $ref: "regulator.yaml#"

Drop quotes.



Best regards,
Krzysztof

