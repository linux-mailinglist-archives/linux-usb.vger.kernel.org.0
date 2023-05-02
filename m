Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1A8E6F4215
	for <lists+linux-usb@lfdr.de>; Tue,  2 May 2023 12:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233782AbjEBK5J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 May 2023 06:57:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233781AbjEBK5H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 May 2023 06:57:07 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F17613586
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 03:57:05 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4efea4569f5so4249432e87.3
        for <linux-usb@vger.kernel.org>; Tue, 02 May 2023 03:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683025024; x=1685617024;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fvKKvkTKg6oLHxWWVpgf67tQd5w10evXj/uD0aHPu2E=;
        b=EnmSSG1gIihEHIM6w4cQaJiWNxIuqd85Q29d8kY0uFabwFf4xeii3hJTSCmt5dDBnO
         GwhKAU4GV8L+W8tiYrNVjA9Fz1N5DdoycTRxmu+0kIS/HlBvPflN2lTLdFgg9U5pnMTT
         EjVA/NyolJiO9qeuGvgXCZRgQXAttqvj0DoubyLqgDhhmqdngrDXXXXyAfCeQJm2Arcq
         7j+haD0yiUudv4lFCIz9Ge8AinHucmxVbyJKT7wBCuV6wizwyxPUBMbRpCUXZIvOtEeo
         yfTQ5IotmLCKHC8PqLum4alHpGdXQVoVOxczUroJSQHMrMV8msoO3WSxvCW773Wcd+ud
         KF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683025024; x=1685617024;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fvKKvkTKg6oLHxWWVpgf67tQd5w10evXj/uD0aHPu2E=;
        b=g0DaUPmk261lOEH1awHMYH7CdWEOSLPArg9LKLoBSgBfHHAenT8v0UxzuYV4cxZsu4
         0tqJjxSLCgCM1oEZ7902AX40SNW+nPc61rIEkW1BEy7Imj1bXFCvYT5q1NFRUOTTIX3T
         DSsBc+KxTSgoGLFkJitHfACHlwo6uwyKNr5r7YQ4gLYn0uJXcocwwRHd6WKeWFFqmPO+
         xCHpV0xLse7MCAe+VnJOoT61lzpJIyFX84XK9rsVHbjQEoEXFDcOYFvsPHxStl+m0Lrb
         rIGXHNf6G/a9w0TGHk/mt8kgWvwgWU5KqXBbaNa0l9HoMZh2AVOzxJpWCtdIuedvvDIE
         pYxw==
X-Gm-Message-State: AC+VfDwXSYkr08eOM3XnTup0hVXuo/ZrWHa+ygnwZNlBsNjkPzM3st2o
        mDr/mdqpb78QYxS08oNAvr3pNA==
X-Google-Smtp-Source: ACHHUZ4SRyqTO729hyK62hC9hFKRzE18fGGOcV6TcgxJ3a2XmJT7r504daG1bjU2DgKZOKUDRjIaeA==
X-Received: by 2002:ac2:522e:0:b0:4f0:9126:b7e3 with SMTP id i14-20020ac2522e000000b004f09126b7e3mr1910140lfl.26.1683025024258;
        Tue, 02 May 2023 03:57:04 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id z6-20020ac24186000000b004edc0fc3c35sm5324459lfh.5.2023.05.02.03.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 03:57:03 -0700 (PDT)
Message-ID: <3b017384-9039-b558-dc94-7fe1f419f5c3@linaro.org>
Date:   Tue, 2 May 2023 12:57:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v6 11/13] arm64: dts: qcom: qrb5165-rb5: Switch on basic
 TCPM
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, luca.weiss@fairphone.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
 <20230501121111.1058190-12-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230501121111.1058190-12-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 1.05.2023 14:11, Bryan O'Donoghue wrote:
> Switch on TCPM for the RB5. Here we declare as a source only not a sink
> since qrb5165 doesn't support powering exclusively from the type-c port.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index b326bdeeb7742..1e0b6fd59abc9 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  #include <dt-bindings/sound/qcom,q6asm.h>
> +#include <dt-bindings/usb/pd.h>
>  #include "sm8250.dtsi"
>  #include "pm8150.dtsi"
>  #include "pm8150b.dtsi"
> @@ -1344,3 +1345,19 @@ &pm8150b_vbus {
>  	regulator-max-microamp = <3000000>;
>  	status = "okay";
>  };
> +
> +&pm8150b_typec {
> +	status = "okay";
Missing newline

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +	connector {
> +		compatible = "usb-c-connector";
> +
> +		power-role = "source";
> +		data-role = "dual";
> +		self-powered;
> +
> +		source-pdos = <PDO_FIXED(5000, 3000,
> +					 PDO_FIXED_DUAL_ROLE |
> +					 PDO_FIXED_USB_COMM |
> +					 PDO_FIXED_DATA_SWAP)>;
> +	};
> +};
