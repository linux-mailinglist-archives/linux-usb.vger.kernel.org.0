Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD10C69460A
	for <lists+linux-usb@lfdr.de>; Mon, 13 Feb 2023 13:41:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbjBMMlP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Feb 2023 07:41:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbjBMMlO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Feb 2023 07:41:14 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFC1710C4
        for <linux-usb@vger.kernel.org>; Mon, 13 Feb 2023 04:41:11 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so11189958wma.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Feb 2023 04:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zHcsWslWS4geOoaOyFy4i3EX0qRfA5AC75jkKmzBE40=;
        b=kmKrClqgS1Rm1p+bosfEaZ/GyQkYANdE7t7bxIu+s6LXEvQe6JR8TmhBiILJL8t4Hn
         1KTXB5AyNdQAdo7agl/6Gt8O2SdbgFUdhQCBS7kjLg4Ix1MDo5qtLY6PzrKraxOHTjFz
         cxhEZxVzekoNjlmBWaDbY+eDf+ARsWIpwkcjP7s2IsvjTsw6bDh/Tt5C8QRfxKqXjtn8
         lRaCAWgMU4pNievRI4XE2Q/1CCn/fTEySZYr8kAZ0O+cpp8+AjHzpXrSvaYZxHtDTUXl
         7RAYnYVV8nxkMxTqrAKJjwsQ+hYo2u9zfpJly2kBNEMImxJ3atcO7ci2qNR65wHBNpG5
         n6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHcsWslWS4geOoaOyFy4i3EX0qRfA5AC75jkKmzBE40=;
        b=ZO+x57qBx1H6gN7DWYdpETl2NK5uJJ/r4UreSCGUblql6RkijZv/PdizMIEPRUE6Q1
         vjmFluwDr9E04Ug4HHfbuwt4HZvWJj6Km0aiLzWFVY2LWm4ilMfcRg+qpCRl/dFkpthf
         9d8R5zhT5jN4x3a9T5TcobHq4READfiiKMrbBpJV7DkdJQImpqvQ4mS+3gg7Sd8gV8mN
         QDFpy/2hSAb467TYQFDLer+K3d9JhFLePUlOTAv4S82dvABTUnuXyiAHDcqFMthwFBRz
         xxdnoIgq1lmn+hULJo1kYHpMUGLBM7rXqiAcIi8e+MQ+ekfmGeyGUT+qVvuKvxXdj5xc
         EZHQ==
X-Gm-Message-State: AO0yUKXejRQpnrgfO2cht2JozLGJb3UFoxW32AI/ilG7NJjWtABVGpjP
        AkDYghf0qgZMxVA2pMXf/UU7gPkBZOiIQsdAENs=
X-Google-Smtp-Source: AK7set+ChHzjPaAAj0LSzU315+gX4eL5CsU7kiARVrBoxEnHgoOj6avm1iTauI8aS67kFM8jopkibQ==
X-Received: by 2002:a05:600c:1708:b0:3de:e8c5:d826 with SMTP id c8-20020a05600c170800b003dee8c5d826mr18838812wmn.28.1676292070502;
        Mon, 13 Feb 2023 04:41:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6e1e:131f:8bc1:aad8? ([2a01:e0a:982:cbb0:6e1e:131f:8bc1:aad8])
        by smtp.gmail.com with ESMTPSA id t15-20020a05600c198f00b003ddc781b1d4sm14797896wmq.33.2023.02.13.04.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 04:41:10 -0800 (PST)
Message-ID: <b9aa6993-51df-5bfe-820c-8ebbc33cc4ce@linaro.org>
Date:   Mon, 13 Feb 2023 13:41:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 08/11] arm64: dts: qcom: sm8350-hdk: add pmic glink
 node
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230130-topic-sm8450-upstream-pmic-glink-v2-0-71fea256474f@linaro.org>
 <20230130-topic-sm8450-upstream-pmic-glink-v2-8-71fea256474f@linaro.org>
 <20230210201327.fboziimwky2wffiw@ripper>
Organization: Linaro Developer Services
In-Reply-To: <20230210201327.fboziimwky2wffiw@ripper>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/02/2023 21:13, Bjorn Andersson wrote:
> On Fri, Feb 10, 2023 at 04:02:11PM +0100, Neil Armstrong wrote:
>> Add the pmic glink node linked with the DWC3 USB controller
>> switched to OTG mode and tagged with usb-role-switch.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 77 ++++++++++++++++++++++++++++-----
>>   1 file changed, 65 insertions(+), 12 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
>> index 54654eb75c28..28fc9a835c5d 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
>> @@ -31,6 +31,40 @@ hdmi_con: endpoint {
>>   		};
>>   	};
>>   
>> +	pmic-glink {
>> +		compatible = "qcom,sm8350-pmic-glink", "qcom,pmic-glink";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		connector@0 {
>> +			compatible = "usb-c-connector";
>> +			reg = <0>;
>> +			power-role = "dual";
>> +			data-role = "dual";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +
>> +					pmic_glink_hs_in: endpoint {
>> +						remote-endpoint = <&usb_1_dwc3_hs>;
>> +					};
>> +				};
>> +
>> +				port@1 {
>> +					reg = <1>;
>> +
>> +					pmic_glink_ss_in: endpoint {
>> +						remote-endpoint = <&usb_1_dwc3_ss>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>>   	vph_pwr: vph-pwr-regulator {
>>   		compatible = "regulator-fixed";
>>   		regulator-name = "vph_pwr";
>> @@ -666,23 +700,42 @@ &usb_1 {
>>   };
>>   
>>   &usb_1_dwc3 {
>> -	/* TODO: Define USB-C connector properly */
>> -	dr_mode = "peripheral";
>> -};
>> +	dr_mode = "otg";
>> +	usb-role-switch;
>>   
>> -&usb_1_hsphy {
>> -	status = "okay";
>> +	ports {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>>   
>> -	vdda-pll-supply = <&vreg_l5b_0p88>;
>> -	vdda18-supply = <&vreg_l1c_1p8>;
>> -	vdda33-supply = <&vreg_l2b_3p07>;
>> +		port@0 {
>> +			reg = <0>;
>> +
>> +			usb_1_dwc3_hs: endpoint {
>> +				remote-endpoint = <&pmic_glink_hs_in>;
>> +			};
>> +		};
>> +
>> +		port@1 {
>> +			reg = <1>;
>> +
>> +			usb_1_dwc3_ss: endpoint {
>> +				remote-endpoint = <&pmic_glink_ss_in>;
> 
> The connector is indeed the next active component on the SuperSpeed
> lanes for USB. But as you're targeting to introduce QMP on that path,
> connector@0/port@1 would be pointing to QMP/ports/port@N.
> 
> Do you plan to express the datapath between USB and QMP using this port
> at that time? (It's the correct thing to do...)

Yeah we need to figure out, because ultimately the datapath should be:

connector:
   port0 --> usb_1_dwc3_hs
   port1 --> qmpphy --> usb_1_dwc3_ss
   port2 --> fsa4480 --> qmpphy -> dp_controller

And with a retimer, it gets even more complex:

connector:
   port0 --> usb_1_dwc3_hs
   port1 --> retimer --> qmpphy --> usb_1_dwc3_ss
   port2 --> retimer --> qmpphy -> dp_controller

The solution I was using is instead of having chained port/endpoints,
I use multiple endpoints like :

   port0 --> usb_1_dwc3_hs
   port1 --> ep0: usb_1_dwc3_ss
             ep1: qmpphy
   port2 --> ep0: fsa4480
             ep1: dp_controller

But I'm sure this is valid... but it is much simpler.

Neil

> 
> Or will we not describe the SS lanes in this scenario?
> 
> Regards,
> Bjorn
> 
>> +			};
>> +		};
>> +	};
>>   };
>>   
>> -&usb_1_qmpphy {
>> -	status = "okay";
>> +&usb_1_dwc3 {
>> +	dr_mode = "otg";
>> +	usb-role-switch;
>> +};
>>   
>> -	vdda-phy-supply = <&vreg_l6b_1p2>;
>> -	vdda-pll-supply = <&vreg_l1b_0p88>;
>> +&usb_1_dwc3_hs {
>> +	remote-endpoint = <&pmic_glink_hs_in>;
>> +};
>> +
>> +&usb_1_dwc3_ss {
>> +	remote-endpoint = <&pmic_glink_ss_in>;
>>   };
>>   
>>   &usb_2 {
>>
>> -- 
>> 2.34.1
>>

