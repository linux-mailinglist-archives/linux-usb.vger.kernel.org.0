Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54445792541
	for <lists+linux-usb@lfdr.de>; Tue,  5 Sep 2023 18:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbjIEQCC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Sep 2023 12:02:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353596AbjIEGuB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Sep 2023 02:50:01 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C5D1B4
        for <linux-usb@vger.kernel.org>; Mon,  4 Sep 2023 23:49:58 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99bdcade7fbso301334666b.1
        for <linux-usb@vger.kernel.org>; Mon, 04 Sep 2023 23:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693896596; x=1694501396; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rTMu+0u1+GO0RL61mvq2i6DERDDrEIJ4goYljDbYbAQ=;
        b=zAG5Rkgar3WTia2u+0QYNX+A9XVEpGQf6It0zcKEc8nyfeOgvZI/vOIW21pLvMNHrT
         Aw0OIBAEOZpOXgRP13kpct/KnnfGOiX0bWf8Jpkn+WCs3nLC82MIZS7kuuJJzDhqYMTd
         Dlfl1t4iOZgrvGsn1TGoTMwnM/fIj1CJrGLDEoTSrHvZ1/Z2CYIoww4eiG+0XCq1q+YS
         PZBQl06Qmha25vFe+dHjzfCsAz9g2n8cXObyHD3ZwXP5o+JQaMKdFTB6jiiu1+Vpf2mx
         pmnPw2fS1TxAZGwB5FBOHGAFK7Wk22wrIWR5CUowIBDaRAQ498tQc8wdCDlzle71dKNN
         kI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693896596; x=1694501396;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rTMu+0u1+GO0RL61mvq2i6DERDDrEIJ4goYljDbYbAQ=;
        b=gvSwgbwjiIkfD4DYft9B8qC2oHSBiyLDrZkDYgai01xsfwgwoDn9I/sGBU8zWVa/gl
         bvwljhaYwVWXSqUOkCuSOwdcREWxHsSF27ZAxuXIa5VDD5STLkIyxKOSbpxIOPzPZPRx
         u9taCkDzFWOUg3gwsOrQipUjh2bXk8/umG+5lulV5DUSdlAiG+Gpxx6cxjJNPHqI3tRV
         Ox6F93gPYhPB10FK68v06UI1rtNeGOlkHhlks9nUziFm7UmBdhT7rJ/vWpa6gPJFFOKm
         frqS8S8osufCvAcySZr89MiL5OKChIfL/fjnlazU7lYyOklQiqyrrEcvxFvY/Uz/6MNj
         M7Xw==
X-Gm-Message-State: AOJu0YxMICYVOmu46rc88wKvJy5IitpdJqdmoFKiTKaCOmXpvtRH23yO
        KwNKKAlvsQZtyuejEDKs3U4w5g==
X-Google-Smtp-Source: AGHT+IGijYOlHUHa+7vPd8yx3B9LIbKbDQ/ea2dKVeTDc3FfNuD1fkI+KN/sbWU2UGjgA6cTDy6BZA==
X-Received: by 2002:a17:906:209c:b0:9a6:1811:e4eb with SMTP id 28-20020a170906209c00b009a61811e4ebmr8481802ejq.38.1693896596631;
        Mon, 04 Sep 2023 23:49:56 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id c25-20020a170906529900b0099b42c90830sm7156243ejm.36.2023.09.04.23.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 23:49:56 -0700 (PDT)
Message-ID: <96c76c55-d5d4-e4ef-e7c3-ee35b2d7ad78@linaro.org>
Date:   Tue, 5 Sep 2023 08:49:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 3/5] dt-bindings: usb: dwc3: Add missing SDX65 compatible
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, abel.vesa@linaro.org,
        quic_wcheng@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, kernel@quicinc.com
References: <1693889028-6485-1-git-send-email-quic_rohiagar@quicinc.com>
 <1693889028-6485-4-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1693889028-6485-4-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 05/09/2023 06:43, Rohit Agarwal wrote:
> Add missing SDX65 compatible for specifying the clocks used.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index 5c13229..fa51f50 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -186,6 +186,7 @@ allOf:
>                - qcom,sdm670-dwc3
>                - qcom,sdm845-dwc3
>                - qcom,sdx55-dwc3
> +              - qcom,sdx65-dwc3

That's not a complete change. Update the rest of the file.

Best regards,
Krzysztof

