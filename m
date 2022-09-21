Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7274E5BFA00
	for <lists+linux-usb@lfdr.de>; Wed, 21 Sep 2022 11:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbiIUJB0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Sep 2022 05:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbiIUJBV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Sep 2022 05:01:21 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD877B7B6
        for <linux-usb@vger.kernel.org>; Wed, 21 Sep 2022 02:01:18 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id l8so3951791wmi.2
        for <linux-usb@vger.kernel.org>; Wed, 21 Sep 2022 02:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Ofpc/bAj5NYR7nbxp0NyiDou96P6k7GH4J1beyq4EpU=;
        b=RkYhKElk7GjihHKB+uEeuDYCesGuBh+Bf+pzskBPKrgsTxU8DuGp0YGs+3jjh3KLvU
         +lU1bEK9yRFSAbvnhY73IS4GXUtlBTmvXfIBx2ex5oG5OmT1EC+gwRYqowe0xaazB5aR
         Z6tS54k6m3nseL3QOp37sO8iJLuyWmBcHkC51Kqbs3LI9thRRjDxc7PxHcSTzjoZA3NX
         ay4vIloQoPrGb96lWEF8Ik4QK3n1b/zxjK3MPCU2Ew49Oigqts4dGSv+I1K0CYK8eU88
         F+LYEm/zkL97YN0FbseEumn4kmJSmG7/pNBd46ZENMJJIB/UJhA89QQSAx601eQuH2lq
         2uqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Ofpc/bAj5NYR7nbxp0NyiDou96P6k7GH4J1beyq4EpU=;
        b=psgwX03R9lz37PFFLx26zUnFGCqDTcDVtql+WLomWUXxZNXYeif9gDZIeKGN66MGc4
         A5R3+D/VrD0tBOS6SjQAn6VGDm7N3lTk9ZL5ZN2oHBX5sjCk9lp3Ff5LeKRQHnlelODS
         E9v46SSCL99IpLPiDIaeqx38EjOo6OuFH2l097h4pFnFJR8QeGGPbMzCgvep5x3Oqhew
         n9muo6mInfGRDFTuTk6aTsLd7z05AfDECDFi5eneBBxGFH89vVNzJQsep63MDafyf3Aa
         4D4IOQWSTrNqrUFaLguXbMiAPuej7c1iJMj2VTuDbCaTcUS/QfX656OPqIuX8nDsv2K6
         yD+g==
X-Gm-Message-State: ACrzQf3dgxY2b+W2WkrMVdcMXVmeOwurs1fVb7HyArnB2NWa9JZtcqbh
        eU3zlxe/QQlKCUQa/quwNqUl3Q==
X-Google-Smtp-Source: AMsMyM6CFjdEKrfXdSuVifj6YSuGcR0lpGO+AM0HsyXcWd4xI9DLCUQmJiX4Eke6fqCduXrCrkuiiQ==
X-Received: by 2002:a05:600c:310b:b0:3b4:c618:180d with SMTP id g11-20020a05600c310b00b003b4c618180dmr5099090wmo.25.1663750876857;
        Wed, 21 Sep 2022 02:01:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8ce3:ff4e:ae9b:55f3? ([2a01:e0a:982:cbb0:8ce3:ff4e:ae9b:55f3])
        by smtp.gmail.com with ESMTPSA id j27-20020a05600c1c1b00b003a5c999cd1asm2736243wms.14.2022.09.21.02.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 02:01:16 -0700 (PDT)
Message-ID: <9ab1a3c5-fa6c-be47-893a-259a67e7e234@linaro.org>
Date:   Wed, 21 Sep 2022 11:01:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] usb: dwc3: qcom: drop unneeded compatibles
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220921084654.118230-1-krzysztof.kozlowski@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro
In-Reply-To: <20220921084654.118230-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21/09/2022 10:46, Krzysztof Kozlowski wrote:
> All Qualcomm SoC DWC3 USB devices have a qcom,dwc3 fallback, thus there
> is no need to keep the list of compatibles growing.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/usb/dwc3/dwc3-qcom.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 9a94b1ab8f7a..7c40f3ffc054 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -1007,10 +1007,6 @@ static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
>   
>   static const struct of_device_id dwc3_qcom_of_match[] = {
>   	{ .compatible = "qcom,dwc3" },
> -	{ .compatible = "qcom,msm8996-dwc3" },
> -	{ .compatible = "qcom,msm8998-dwc3" },
> -	{ .compatible = "qcom,sdm660-dwc3" },
> -	{ .compatible = "qcom,sdm845-dwc3" },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, dwc3_qcom_of_match);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
