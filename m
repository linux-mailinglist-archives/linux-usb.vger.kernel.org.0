Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E254680B12
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 11:40:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236513AbjA3Kki (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 05:40:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236290AbjA3Kkg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 05:40:36 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ED4B31E09
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 02:40:31 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id gr7so5797143ejb.5
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 02:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9kc6I1359RoE5LlagdMh40JI0vcHr0CmwGbe7Q8JXFM=;
        b=H0yZL3VYQZ83z33kQaKsKHYh7TtYbnJ7ePgHgj0UzD4P0evBaqxQ+qliIL2XRomygE
         2NSHf6JUFZtkcsQ4q9YxVcyMCwrfyS9LRcDpCMNW7SRBSVCCDDlhfY0h2NOYG9ebm6uz
         0j7P66yQcvOBXY1p0QjaXoiZcApljY5f1eU688G9mxNiT+j+YLUm0xCTtgFKNZcZuEdx
         J/7/4SFSWroKPtunTG4RiTK71VdBn50LvjSdxdBzw+tSJjCyVup/KGCHrys0LtxnC2s/
         6zNnhcmgwUIksQs/COIRIl8SuIjj7WXPr2eFYJlH2rwCRJQySC1aIzwIUpK00w1QsgUu
         qf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9kc6I1359RoE5LlagdMh40JI0vcHr0CmwGbe7Q8JXFM=;
        b=0/Ec/E040Etriz2etCqBeVp9oKChhDJBaQlIkw3qoEuGmHrdUT4Fnvl8zPGGxI94j+
         1x+6M/x4qyzEUGdXEJZtZ1ItUS5iO09/MZaPbJVeiWqeMiGt59oH64N86etccsvnn89T
         oybjsfAlI2vmgS0ZpA5s9Cmv8iX1ZwDmAttnVumiKGU3Qs45xEUciSQMLEdVNjc0VCQH
         ObsbWPw6Lm94j8k+oB1ZEhNqB7eXo1ZAKtQ9TZ7o1nipg9RCfsqlzX4O9oGugfEwanqg
         Hh6rvcKv/Hffj8e2LyaG6Y/32Sh41potZ63uR9JW8wVH2eOhttbM1ZOYcpm859eADlVo
         95CA==
X-Gm-Message-State: AO0yUKVgLnjwUIUmkfeZ8azK3hvu2cK4YNJe8/HJrlh/j+cg5nqoe8+M
        e22FytGg06wF6udKyDA9n31q3w==
X-Google-Smtp-Source: AK7set/AJuBGbDmv+sBY9HFIcNMeCDuQiJiiSkIPW1J59QfKA/JmFSiWxukLndseHdEZ2IauKfP4tw==
X-Received: by 2002:a17:906:4dda:b0:888:bbb2:c726 with SMTP id f26-20020a1709064dda00b00888bbb2c726mr2768714ejw.33.1675075230160;
        Mon, 30 Jan 2023 02:40:30 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id lb12-20020a170907784c00b008841aa86484sm3266144ejc.211.2023.01.30.02.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 02:40:29 -0800 (PST)
Message-ID: <1c3fa66b-651f-c3c1-1751-af3f43c86c49@linaro.org>
Date:   Mon, 30 Jan 2023 11:40:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm8450-hdk: add pmic glink node
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
References: <20230130-topic-sm8450-upstream-pmic-glink-v1-0-0b0acfad301e@linaro.org>
 <20230130-topic-sm8450-upstream-pmic-glink-v1-5-0b0acfad301e@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v1-5-0b0acfad301e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 30.01.2023 10:54, Neil Armstrong wrote:
> Add the pmic glink node linked with the DWC3 USB controller
> switched to OTG mode and tagged with usb-role-switch.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Missing commit message

> ---
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 34 ++++++++++++++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> index 5bdc2c1159ae..5ab12c911bfe 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -87,6 +87,31 @@ lt9611_3v3: lt9611-3v3-regulator {
>  		enable-active-high;
>  	};
>  
> +	pmic-glink {
> +		compatible = "qcom,sm8450-pmic-glink", "qcom,pmic-glink";
> +
You could remove this newline
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
And add one here

> +				port@0 {
> +					reg = <0>;
And here

> +					pmic_glink_dwc3_in: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_out>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
>  	vph_pwr: vph-pwr-regulator {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vph_pwr";
> @@ -724,7 +749,14 @@ &usb_1 {
>  };
>  
>  &usb_1_dwc3 {
> -	dr_mode = "peripheral";
> +	dr_mode = "otg";
> +	usb-role-switch;
> +
> +	port {
Hm, maybe this could be moved to 8450 dtsi?

Konrad
> +		usb_1_dwc3_out: endpoint {
> +		      remote-endpoint = <&pmic_glink_dwc3_in>;
> +	      };
> +	};
>  };
>  
>  &usb_1_hsphy {
> 
