Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C082692200
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 16:23:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232677AbjBJPXA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 10:23:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232528AbjBJPW5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 10:22:57 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81BEE75F68
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 07:22:35 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id hx15so16716330ejc.11
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 07:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vsSadB32XB5g1hodc7vzIwLUBvE331TyvT41joUVmpk=;
        b=w2C17nnFNg3hS/9rBUMZ6gE+YyoxqtNkjQaq6mwLHu9L19w4w/35nvSY3EUS/lRbpp
         ftQgXEcQdx67kgrii+PPZtTdN8d/8SfIdG7KQQEtAtQYuUr9qrQ56iUIUIUa9AmrN4se
         R/EjwSaU8J80mUMt/6GieCPQe4mi73pGHek4yvlgMYyzLzXCN4VCMfZwRavYdszxlxBS
         tdwsigLK5cu57T2X/2sJDhOls5/e31+A24hrFof437zfN7OzwXUGP7PNp2x2N+IoVb+5
         cJP6k5vahwHdBupNFsksSci28ZEglOn/RKQmwPwW8bT+ak7pEc3PxTyUmEEYl7OlBF+G
         M9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vsSadB32XB5g1hodc7vzIwLUBvE331TyvT41joUVmpk=;
        b=WaN7UZayfdZA5kubQGEnw5jF7wVghBeIUfZ0ZQYxD402YuEKbH4nIiyt4AriOeJj/n
         2uj8fYZk0eXKO+PLyY5a13oq28ZcCzleG+16s8k6J6SzSE+KlngWguhL2qeu2L2iTqSe
         CevIqpl51jwFMy3sYehOV4axd64YuR1RJhHjNjncGJuAKIVPxjdeL6np2AAKBHiR/X4w
         iRTmHPJaS7yI0ThIBFAfE+GdgtuxB+rRkmM0kxDwshKjYQM4khXeuyXi0lTvyvFyZcpL
         R8KSAlYTSXnE0oNRiR32FlX0NlqzEGlAVvB6OG+M9shLNcGg4yb4kh3569dAU7dvY9PU
         mgxw==
X-Gm-Message-State: AO0yUKUW63LlSVjYRhAInFzEzYvrVDI4MS3bM0zCZVJcV9RGLodtUAH/
        Dknd+wwwhf1Vkh4GSiP762sYIA==
X-Google-Smtp-Source: AK7set/cB105EZz+58wyDY43XYQBxUpYXj4M8OiburaHgzIYw/PffV/W9wJNIPdOUin/2T3XPJ8eTw==
X-Received: by 2002:a17:906:8d0e:b0:8ae:30bb:a12c with SMTP id rv14-20020a1709068d0e00b008ae30bba12cmr9858947ejc.28.1676042554129;
        Fri, 10 Feb 2023 07:22:34 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id lr21-20020a170906fb9500b008af0a1f9596sm2478714ejb.218.2023.02.10.07.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 07:22:33 -0800 (PST)
Message-ID: <e237b7d6-0a32-5d48-1e64-8216ad5a2a4c@linaro.org>
Date:   Fri, 10 Feb 2023 16:22:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 10/11] arm64: dts: qcom: sm8550-mtp: add pmic glink
 node
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230130-topic-sm8450-upstream-pmic-glink-v2-0-71fea256474f@linaro.org>
 <20230130-topic-sm8450-upstream-pmic-glink-v2-10-71fea256474f@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v2-10-71fea256474f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 10.02.2023 16:02, Neil Armstrong wrote:
> Add the pmic glink node linked with the DWC3 USB controller
> switched to OTG mode and tagged with usb-role-switch.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 45 ++++++++++++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> index 5db6e789e6b8..7b880cb7e022 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> @@ -27,6 +27,40 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	pmic-glink {
> +		compatible = "qcom,sm8550-pmic-glink", "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_ss>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
>  	vph_pwr: vph-pwr-regulator {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vph_pwr";
> @@ -546,7 +580,16 @@ &usb_1 {
>  };
>  
>  &usb_1_dwc3 {
> -	dr_mode = "peripheral";
> +	dr_mode = "otg";
> +	usb-role-switch;
> +};
> +
> +&usb_1_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_hs_in>;
> +};
> +
> +&usb_1_dwc3_ss {
> +	remote-endpoint = <&pmic_glink_ss_in>;
>  };
>  
>  &usb_1_hsphy {
> 
