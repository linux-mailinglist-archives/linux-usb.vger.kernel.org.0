Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9111E79E08C
	for <lists+linux-usb@lfdr.de>; Wed, 13 Sep 2023 09:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238506AbjIMHNu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Sep 2023 03:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238367AbjIMHNt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Sep 2023 03:13:49 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC5481728
        for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 00:13:44 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2bf6b37859eso81386071fa.0
        for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 00:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694589223; x=1695194023; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PMH3vpvCAYv9pjz0vyXayvBqBPROq5/ItNXcUQV0q9E=;
        b=mtjeEZowdbXhHjnFyZDRa349Gd6rAnOStuNBT20PxRHTuh/QVzMEnVvuFva9SkRkZ/
         voNirn4chncepx1TazqcqeIBPDxPUr2nJW4FGQUj9mFdb+rc0E8KKeoH6UDcxL0Gj/zM
         jOVquaE6UseM6m7UkaRYSQo9j3BPFWPGeUs26IyE7ihd31nLIjeuW04u41AJIRrUCyuz
         Sx8wxwE9Uj3exUfW/pEuEEocenN3l01DlhRcyLAZ1JuHIR1z43NHRp09bBYPLN3CX6Fg
         CtnEjky/m3EGiIMzoH6OH2Araua70u7ZN0PBYZTk02T+pb20beFIc3ca/pjEi/8uusgy
         DdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694589223; x=1695194023;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PMH3vpvCAYv9pjz0vyXayvBqBPROq5/ItNXcUQV0q9E=;
        b=v5ylOtHG0Dpo0NxmDg2xb6Eu7HNR5wu6ivOHVqfNBDL+zazO1TpfaN7f+cjJsyVOmb
         0ZfWsYiuun34kttLEWQe/t4qoYAjtFUyxgsb5z5daxHqNr/1UbE1YsSw6LMjD1Vg1keN
         0Q5uiSaxPipPkDL/vEOFuBwcf/vf44j5c77Pwm1lqeWsA2RoJXH/Bq1cdufmSgfqcRpN
         Av3OdqJNyZStWdSSy+vBqYz0rV9uJcjgRzm53Opm+uGRtioDAqzpEyqYi8bBd1tyXcKm
         sRXpBwNlQig7eD7d34bNdWN/IvjTcf4ANTlTXFt6bf/RMcXPqwGaXvQrFvcUdcreMXzO
         Asbg==
X-Gm-Message-State: AOJu0YzLmh5gVe2mbERmo6zoF6H1IOMSbwQ1hFfP+fnC8AgkrEBxSgFq
        SfCx7fhNw9VyzP2xh9TVmJJbvA==
X-Google-Smtp-Source: AGHT+IEaX2HHUaLs3S63J80qFOSmj6sWOrftUpS+R5qC7Xs/FsBZ7EPgP0pGvUeL/9pDbnFuXmPFwA==
X-Received: by 2002:a2e:9e14:0:b0:2bd:1f83:8d4 with SMTP id e20-20020a2e9e14000000b002bd1f8308d4mr1400872ljk.22.1694589223002;
        Wed, 13 Sep 2023 00:13:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id ce7-20020a170906b24700b0098f99048053sm8015685ejb.148.2023.09.13.00.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 00:13:42 -0700 (PDT)
Message-ID: <70b2a9d7-1a3e-25da-3d78-7bfa5d3a1e05@linaro.org>
Date:   Wed, 13 Sep 2023 09:13:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 06/14] arm64: dts: qcom: sdm630: Drop RPM bus clocks
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org
References: <20230721-topic-rpm_clk_cleanup-v2-0-1e506593b1bd@linaro.org>
 <20230721-topic-rpm_clk_cleanup-v2-6-1e506593b1bd@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230721-topic-rpm_clk_cleanup-v2-6-1e506593b1bd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/09/2023 15:31, Konrad Dybcio wrote:
> These clocks are now handled from within the icc framework and are
> no longer registered from within the CCF. Remove them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 49 +++++++-----------------------------
>  1 file changed, 9 insertions(+), 40 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index ec6003212c4d..f11d2a07508c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -605,9 +605,6 @@ bimc: interconnect@1008000 {
>  			compatible = "qcom,sdm660-bimc";
>  			reg = <0x01008000 0x78000>;
>  			#interconnect-cells = <1>;
> -			clock-names = "bus", "bus_a";
> -			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
> -				 <&rpmcc RPM_SMD_BIMC_A_CLK>;

Bindings expect here two clocks, so you miss some bindings patches.

>  		};
>  
>  		restart@10ac000 {
> @@ -619,28 +616,17 @@ cnoc: interconnect@1500000 {
>  			compatible = "qcom,sdm660-cnoc";
>  			reg = <0x01500000 0x10000>;
>  			#interconnect-cells = <1>;
> -			clock-names = "bus", "bus_a";
> -			clocks = <&rpmcc RPM_SMD_CNOC_CLK>,
> -				 <&rpmcc RPM_SMD_CNOC_A_CLK>;
>  		};
>  
>  		snoc: interconnect@1626000 {
>  			compatible = "qcom,sdm660-snoc";
>  			reg = <0x01626000 0x7090>;
>  			#interconnect-cells = <1>;
> -			clock-names = "bus", "bus_a";
> -			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
> -				 <&rpmcc RPM_SMD_SNOC_A_CLK>;
>  		};
>  
>  		anoc2_smmu: iommu@16c0000 {
>  			compatible = "qcom,sdm630-smmu-v2", "qcom,smmu-v2";
>  			reg = <0x016c0000 0x40000>;
> -
> -			assigned-clocks = <&rpmcc RPM_SMD_AGGR2_NOC_CLK>;
> -			assigned-clock-rates = <1000>;
> -			clocks = <&rpmcc RPM_SMD_AGGR2_NOC_CLK>;
> -			clock-names = "bus";

This is also against bindings. After your patch #4, such bus clock (or
other combinations) is still required.


>  			#global-interrupts = <2>;
>  			#iommu-cells = <1>;
>  
> @@ -685,16 +671,12 @@ a2noc: interconnect@1704000 {
>  			compatible = "qcom,sdm660-a2noc";
>  			reg = <0x01704000 0xc100>;
>  			#interconnect-cells = <1>;
> -			clock-names = "bus",
> -				      "bus_a",
> -				      "ipa",
> +			clock-names = "ipa",

And which bindings does this match?

Best regards,
Krzysztof

