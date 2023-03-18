Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 602966BFA99
	for <lists+linux-usb@lfdr.de>; Sat, 18 Mar 2023 15:00:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbjCROA5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Mar 2023 10:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbjCROAz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Mar 2023 10:00:55 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 939F93253B
        for <linux-usb@vger.kernel.org>; Sat, 18 Mar 2023 07:00:52 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id y14so7823129ljq.4
        for <linux-usb@vger.kernel.org>; Sat, 18 Mar 2023 07:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679148050;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pq1grktIZUaFTq6y9zAYI6jqVJHwlACogyMHxjKxw0E=;
        b=g1KLQFh26D5iGPpjd1G/eLz/Y0XGhNxEFdpNUp76JndWYhTBQ3KOkUgpIwwOxfal2b
         /HXMQhpWt5snVr8RNE2Lr3csDUIg93q6JkoppyFIWg7wfx2RRdvqUVSI95PFzIS4NN2b
         X8fgot6FdidtEH1NKhlSdQ6x7R+R/NdzJyJsVsabEM4JcP5gYDMyT1AsltcudcfGHOqf
         ezLt2Xb956gymARhIZcknXaFc/0hkX6W3uaTvvAI9KKb9RS5bO/3CodqTTEIW85zApzK
         4XtaZiocPbzoJQPKx8npL3/9p+ukUmyk8d3BG4zL0JtbR+/QXXPT3LCG4lk+1QExD7b9
         +i2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679148050;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pq1grktIZUaFTq6y9zAYI6jqVJHwlACogyMHxjKxw0E=;
        b=Fuz9tJfUJbH13pJbOdFtZ20cvIdVof8Kor5zhFOZm/if5KALhDFzdBP3IkzjQDz6Iw
         DSt3Norxtv35I2fC8RexWO4vdy7KAliJEA3eilXqOgWItsX5VoTOxqc7RajA1SxKwzAl
         PFsrK+KCH5o3PhmPwm5heh3YvU1G1T4KpmvPsjRXuiOVz9b+tj6S10l1f5YxiHB8yDI0
         8VatqqQj5tJofrxKv+2DPfubKCTzJTiOfITSKJS5pTzGqUPCq+HS2RUoA48HGk94ATEk
         qrcbFZDSJr3ibEcQANvWPXzd1zQMiLnNjO1k8RKwqRd6mC5gwA227CDFshYTofwL6726
         5VGw==
X-Gm-Message-State: AO0yUKWSzWtLn6lN6f30oNkCFB9zCFpyC3845rKraWLq6loQuPhQ2KD8
        ABah4m/wqvoWp4eBZoujzioVpw==
X-Google-Smtp-Source: AK7set9n3jWRCyaEW5qHt+5N4JBeEQQ0u3VT7jFsk+GHueILW9QUIk7NEXxfqsKIUjYohI9zdk9MTQ==
X-Received: by 2002:a2e:be92:0:b0:295:b0cd:517 with SMTP id a18-20020a2ebe92000000b00295b0cd0517mr5832408ljr.35.1679148050075;
        Sat, 18 Mar 2023 07:00:50 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
        by smtp.gmail.com with ESMTPSA id l22-20020a2e8696000000b002947028ae7csm893920lji.72.2023.03.18.07.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Mar 2023 07:00:49 -0700 (PDT)
Message-ID: <af8cd242-2a78-cac3-d307-ce6ab0810308@linaro.org>
Date:   Sat, 18 Mar 2023 15:00:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 09/12] arm64: dts: qcom: sm8350-hdk: add pmic glink
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
References: <20230130-topic-sm8450-upstream-pmic-glink-v4-0-38bf0f5d07bd@linaro.org>
 <20230130-topic-sm8450-upstream-pmic-glink-v4-9-38bf0f5d07bd@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v4-9-38bf0f5d07bd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 17.03.2023 16:04, Neil Armstrong wrote:
> Add the pmic glink node linked with the DWC3 USB controller
> switched to OTG mode and tagged with usb-role-switch.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

[...]

>  &usb_1_dwc3 {
> -	/* TODO: Define USB-C connector properly */
> -	dr_mode = "peripheral";
> +	dr_mode = "otg";
> +	usb-role-switch;
> +
> +	ports {
You created these in patch [6/12]!

Konrad
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +
> +			usb_1_dwc3_hs: endpoint {
> +				remote-endpoint = <&pmic_glink_hs_in>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			usb_1_dwc3_ss: endpoint {
> +				remote-endpoint = <&pmic_glink_ss_in>;
> +			};
> +		};
> +	};
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
