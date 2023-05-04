Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD8606F688B
	for <lists+linux-usb@lfdr.de>; Thu,  4 May 2023 11:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230423AbjEDJo2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 May 2023 05:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbjEDJo0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 May 2023 05:44:26 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD30449D0
        for <linux-usb@vger.kernel.org>; Thu,  4 May 2023 02:44:23 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2a8ad872ea5so3135501fa.2
        for <linux-usb@vger.kernel.org>; Thu, 04 May 2023 02:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683193462; x=1685785462;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9njODLCNLbHQNVRY81oeORhaVkjNI1laFxTWtA6AgaA=;
        b=zhgvuFIRzrM51QDY6wTBprMPX9veIqzRc5EM6dHt2vZPiej8HoBRQGUEo43K9K/KW0
         uKth7EscB7FtDuUYCKHy43qzEA3qdOSIy4ppprJASE8+EKdKKdASvn3T8KipkzcdlQ8S
         0PI+pvKOyg6TDCQV3TB9kpKGx2NK1NuXVNomjLW/oyaQvO121Bts2tOlCJ6W6f3TiBZY
         tKTBofbsrPSwkAJFoS3P8N5Vw/E+SaQ+utb247TKieBnYnRk3P24aU8x2FQ7a/WUm9G7
         JzUXlaC31OYjRN3d8i+zq7Lk38b+JBJKpcIqjZPlVw+BSH3e5PUdld1a5SuR7dr8tpzt
         Zmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683193462; x=1685785462;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9njODLCNLbHQNVRY81oeORhaVkjNI1laFxTWtA6AgaA=;
        b=TKjfNr9rJ7obuuE2a8ozAxu5MXoTbS4OJkSojjFqZoNElS5ErYFZ5J+8P+l34+WAYI
         cItyLQmxpTJne8k0lVBJuGjkGwBdgnhzGnyHh8DTCSWiDIKaB7k/GxXrWD0wYUuAkhTI
         IiTKRUp8duoRwkwZSUdXIbsoCK1rMTYK78ZR4mcKviM07DLlYwKitXGLIlhvYbVcSas4
         X+p36IWLzE3K1KycARpTQmq3Jrsrq4H+/pvEsva9txuGb6D6punHRkTOw0S7nXdxLnUJ
         dMqRq2tezilPrAi2kR5K7QWuS9Pm9hPAiTj4cLVlQb8/Y+m4L34F2zcSfR1YoLXB6B6T
         TpMg==
X-Gm-Message-State: AC+VfDySsjUhhVfaNsYrWvrgN/KU1g6tJ5xjYW243Ssjfp/lpYA/yx3r
        ezxHoIpLhTJ3QZx7RDj/xCJ+LA==
X-Google-Smtp-Source: ACHHUZ4uuwHo2dPaFCoN/WbGJfTFdw3/ka6SrsbQ9GM48Hrb5u5H0sgdIErZjxmM70Y+Z1svXLP1DA==
X-Received: by 2002:a2e:87d1:0:b0:2ac:8090:630e with SMTP id v17-20020a2e87d1000000b002ac8090630emr272688ljj.28.1683193461726;
        Thu, 04 May 2023 02:44:21 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id a6-20020ac25206000000b004eff6dd9072sm4821551lfl.111.2023.05.04.02.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 02:44:21 -0700 (PDT)
Message-ID: <9f536adc-1787-ea4f-f624-4f0cc0f1ab60@linaro.org>
Date:   Thu, 4 May 2023 11:44:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 1/5] usb: misc: eud: Fix eud sysfs path (use
 'qcom_eud')
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org
References: <20230504082644.1461582-1-bhupesh.sharma@linaro.org>
 <20230504082644.1461582-2-bhupesh.sharma@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230504082644.1461582-2-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 4.05.2023 10:26, Bhupesh Sharma wrote:
> The eud sysfs enablement path is currently mentioned in the
> Documentation as:
>   /sys/bus/platform/drivers/eud/.../enable
> 
> Instead it should be:
>   /sys/bus/platform/drivers/qcom_eud/.../enable
> 
> Fix the same.
> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  Documentation/ABI/testing/sysfs-driver-eud | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
> index 83f3872182a4..2bab0db2d2f0 100644
> --- a/Documentation/ABI/testing/sysfs-driver-eud
> +++ b/Documentation/ABI/testing/sysfs-driver-eud
> @@ -1,4 +1,4 @@
> -What:		/sys/bus/platform/drivers/eud/.../enable
> +What:		/sys/bus/platform/drivers/qcom_eud/.../enable
>  Date:           February 2022
>  Contact:        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
>  Description:
