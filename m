Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97D876EB9CB
	for <lists+linux-usb@lfdr.de>; Sat, 22 Apr 2023 16:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbjDVOxR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 Apr 2023 10:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbjDVOxP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Apr 2023 10:53:15 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA101986
        for <linux-usb@vger.kernel.org>; Sat, 22 Apr 2023 07:53:14 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2a8bbea12d7so26218361fa.3
        for <linux-usb@vger.kernel.org>; Sat, 22 Apr 2023 07:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682175192; x=1684767192;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5QiuEHyuEVtBRzcyBFE0SWW5sqcYBYGFxWhmKx74IZ8=;
        b=Th/CwVCXT4rTyRaAz1noHSnkdLNoKTfuOM+TrtVbtMSZIcWpDQDwjN7n1tfoEVnvjI
         6hCutSz4I0vQ3gJLJAB8UhaZ7GwgKb7W3Oy+h5RvPlw1W3Mbm3jD2g1oooMVZjQ9lD5r
         qarAWgnR5yNuFpkAXayyL5kre/7fOFEeFr6EaeksMqLOOz0JJ3aT20LFSeDuBGKlnuG5
         EAZ3o8GMc+zLJ/KqvKbBtB2TDsa6D4sPMaHqogHO28p0/K4rwBkPwWlBADYx19/PS73z
         onMF/h4YAcqKi2P92Xf4T8ZSQQUCTY7ZvxAPWQ6sC3wLeNf/qk/wQDaBHs/FD6kiIv1x
         A20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682175192; x=1684767192;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5QiuEHyuEVtBRzcyBFE0SWW5sqcYBYGFxWhmKx74IZ8=;
        b=RkQCSHDn1+ELAXijpZGWSjLsmxyriF860S2qjcM3aZ0GsH8jAuf83R3eKHLqz4YW9D
         L9lc+xftM0In1drCTbhc9WoImPNd7H8gFOdhfX9z26u6RrcnZpf/FisFp2fcTwqwHULS
         a3F5+SL62IrD+QtDArv+j3NciYn08R7zaB9Y8nV1cSh//yXwGHmCmsgMxAWWGU6pwWca
         p7Fp7jXlCDgFO/uIMZzmgU34oL+AIc8IrX1UY5P/3tru60Tny5R+LE+/5qM7BAVnCf/b
         48yBamLB1LjwGvJiX8TEyzzgKQkuB2048Xz2yJ6SwyST9mkhULzGPDUeA9N15U3UOPZk
         4iQA==
X-Gm-Message-State: AAQBX9eO6UXUMmchWQT3JUh/rTx/gDucuZiQx2WpbToJx5ls4jhrYy8S
        yBAe//Su2mJh9W1N0RpO8eC02A==
X-Google-Smtp-Source: AKy350aS5rCVAH7NM9Ys5LmRcmqCGbhFgBWCpE7TWaSLkEFqfkYjTCWiRhBmIuzdFWVtJQGL99DamA==
X-Received: by 2002:a2e:93d6:0:b0:298:a840:ec65 with SMTP id p22-20020a2e93d6000000b00298a840ec65mr1218001ljh.36.1682175192235;
        Sat, 22 Apr 2023 07:53:12 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id g11-20020a2eb0cb000000b002a9f966f4b3sm793957ljl.26.2023.04.22.07.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Apr 2023 07:53:11 -0700 (PDT)
Message-ID: <0cd2b623-a625-11d7-f562-3af97367bfec@linaro.org>
Date:   Sat, 22 Apr 2023 16:53:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5 11/14] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM
 usb-role-switching for usb_1
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
 <20230413113438.1577658-12-bryan.odonoghue@linaro.org>
 <31bf025d-decf-c30c-8ffe-7e935bb31790@linaro.org>
In-Reply-To: <31bf025d-decf-c30c-8ffe-7e935bb31790@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 22.04.2023 16:52, Konrad Dybcio wrote:
> 
> 
> On 13.04.2023 13:34, Bryan O'Donoghue wrote:
>> Switch on usb-role-switching for usb_1 via TCPM. We need to declare
>> usb-role-switch in &usb_1 and associate with the remote-endpoint in TCPM
>> which provides the necessary signal.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
> This belongs to the SoC DTSI as it describes the capabilities
> of the USB controllers on the chip.
> 
> Also please add a newline before each subnode.
To be clear, I meant the port definitions and properties,
not the DWC<->PMIC_TCPM port assignments

Konrad
> 
> Konrad
>>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 19 ++++++++++++++++++-
>>  1 file changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
>> index 1e0b6fd59abc9..b5cc45358a474 100644
>> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
>> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
>> @@ -1273,7 +1273,13 @@ &usb_1 {
>>  };
>>  
>>  &usb_1_dwc3 {
>> -	dr_mode = "peripheral";
>> +	dr_mode = "otg";
>> +	usb-role-switch;
>> +	port {
>> +		dwc3_role_switch_in: endpoint {
>> +			remote-endpoint = <&pm8150b_role_switch_out>;
>> +		};
>> +	};
>>  };
>>  
>>  &usb_1_hsphy {
>> @@ -1359,5 +1365,16 @@ connector {
>>  					 PDO_FIXED_DUAL_ROLE |
>>  					 PDO_FIXED_USB_COMM |
>>  					 PDO_FIXED_DATA_SWAP)>;
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +				pm8150b_role_switch_out: endpoint {
>> +					remote-endpoint = <&dwc3_role_switch_in>;
>> +				};
>> +			};
>> +		};
>>  	};
>>  };
