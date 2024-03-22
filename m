Return-Path: <linux-usb+bounces-8162-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C53E886AD3
	for <lists+linux-usb@lfdr.de>; Fri, 22 Mar 2024 11:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F80E1C2214F
	for <lists+linux-usb@lfdr.de>; Fri, 22 Mar 2024 10:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736383EA88;
	Fri, 22 Mar 2024 10:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YCppqF3l"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FEA3E479
	for <linux-usb@vger.kernel.org>; Fri, 22 Mar 2024 10:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711105132; cv=none; b=uK0g1BkpmFjCe4bw56qHRV20vpQlEAk1bsaQZDEXfKyrnLQ4UHhd2Ey9Qs0894uV4rF0hsqlz6ecwlHe2UzAJoVBl16bVcL0dk+UUt3dnQctswRZEodABkIVY9O+sMJg6iQZQc8dNgh8Ab/9hHQuSpjYYW0RO6Zuth0aKody/bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711105132; c=relaxed/simple;
	bh=E+QRJbbDXgOnG+F7y9VJSSIz2tXSZacnuTn39fmlItM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a+62my8cQKc8sSWYV5KMnbos1w6aMY+6XEBL9kNsQInPqj3zk0LYtkxYf6shAuItmeSkkVapHvZ4W6w3e43xu+rGl9mu47jpJiUFOBiqTG7k9MMWI3McYQ15qAylqH/kyvgFYfA42izNbX010K+5SOuniFTgrL30jDb1E+wWns0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YCppqF3l; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d46d729d89so23170571fa.3
        for <linux-usb@vger.kernel.org>; Fri, 22 Mar 2024 03:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711105127; x=1711709927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5J6hKaN1QOoxxXz1T+5CFRE6tdsrp4JJET9C/glDPY0=;
        b=YCppqF3ltq357pitHV0u324fMPt7ZhDR35D83/zE5U3Wl9X2jnbj0mhlvtGjjZ8+s1
         PzLPo44lDvNvoZqKcwBcZq7KyIaNiGe5x1NwIJ5B2WxXDZmXGWYAj75orbj+5nmNOYqE
         YMgRNSYokBJzrWSN3LC2CTHL94q2gG0sKeLKCX4U6FHBB+tY3XwIR5DSXRuIdm1h+HuC
         ccWVxyMpnejRioSQeevDD8fzYWFt4eolAgT5Ge61jJyoutsRZuZ44s85Qgu/qKTavyD7
         UkelL3CfTweWXlGwOooztCvGFz/dZw/225V4zMjSAjPjqCt1qaAEOIq4pS0Vc+k5aA+J
         Ib1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711105127; x=1711709927;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5J6hKaN1QOoxxXz1T+5CFRE6tdsrp4JJET9C/glDPY0=;
        b=gbh++mWdDeBXbpY/tYxfy/mtAVhDlT54Ijb5EyzmflWMEmwJafjv9MdAhLrR7ShTxO
         sV9Hlcx2IotxbxsTIh2x6qYE3paCGpeszKmDxZMXEjBAL7sZvHA8xCKTj56uhGEYK1fD
         3seMPxOhU77S3i86AZwWydYtbfgwwSJ3VEa6ihfUnZ3JZbXND2e65M2Qsf+p23CSfTwF
         CJqTieLZJXrjMAHzeAJsGZgXyn5U8KyZnrcCtrLHjAja9Pm9ydpvwKfPS5APxX3GHBNG
         mOGM/O76SCHL00tmeojGUHROqRVOcWAdo2AksA4jJby49G243ctxrIp5QmOTvtqCz5lO
         VSRw==
X-Forwarded-Encrypted: i=1; AJvYcCWIUc07flNi7a3SWlqsLtNED3iJ5Ulihhuq8h7oBa9NVkppAzd65xni8B0lMVabKq41+NLkYvO3vugRqqgZIJMfDQeW31+w2lOF
X-Gm-Message-State: AOJu0YyGKqvVX6JjUkuP4xOD9TFXbystz526piPhsYOfPvwRECFw+mNC
	c2bjBytWxY15o1VBCv2b0RaS5jZN1LW9a4h84k3eoRiNcLIZystAN6qQecrqvjU=
X-Google-Smtp-Source: AGHT+IGM3Kt2gQLYglQ72vKDBZNdU1ywAm2J5Zc15UKLNfhAkHKQE43HaGykC/84SoWzGvuuRFn+7A==
X-Received: by 2002:a19:4353:0:b0:512:be8e:79da with SMTP id m19-20020a194353000000b00512be8e79damr1302079lfj.8.1711105126886;
        Fri, 22 Mar 2024 03:58:46 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id w15-20020a05600c474f00b00414037f27a9sm2740627wmo.31.2024.03.22.03.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 03:58:46 -0700 (PDT)
Message-ID: <f8e4a364-a1b4-4b0e-905d-d3dde3557fe2@linaro.org>
Date: Fri, 22 Mar 2024 10:58:45 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 role switching
Content-Language: en-US
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20240322-fp4-tcpm-v1-0-c5644099d57b@fairphone.com>
 <20240322-fp4-tcpm-v1-5-c5644099d57b@fairphone.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240322-fp4-tcpm-v1-5-c5644099d57b@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/2024 08:01, Luca Weiss wrote:
> Configure the Type-C and VBUS regulator on PM7250B and wire it up to the
> USB PHY, so that USB role and orientation switching works.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> With this patch I'm not quite sure if the 'ports' are connected
> correctly, though functionally everything appears to work fine.
> 
> On some other SoCs port@1 in qmpphy and a second port in dwc3 are
> connected together also - one port of USB 2.0 HS, one for USB 3.0 SS.
> 
> Here I'm following sm8250's solution. Also checking the binding doc
> doesn't reveal anything useful.

I don't see a redriver on your schematics which appears to be the only 
big difference to the qrb5165 reference.

https://www.fairphone.com/wp-content/uploads/2022/09/FP4_Information-for-repairers-and-recyclers.pdf


> ---
>   arch/arm64/boot/dts/qcom/sm6350.dtsi              | 25 ++++++++++
>   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 57 ++++++++++++++++++++++-
>   2 files changed, 81 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> index 24bcec3366ef..b267500467f0 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -1686,6 +1686,27 @@ usb_1_qmpphy: phy@88e8000 {
>   			#phy-cells = <1>;
>   
>   			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_1_qmpphy_out: endpoint {};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					usb_1_qmpphy_dp_in: endpoint {};
> +				};
> +			};
>   		};
>   
>   		dc_noc: interconnect@9160000 {
> @@ -1861,6 +1882,10 @@ usb_1_dwc3: usb@a600000 {
>   				snps,hird-threshold = /bits/ 8 <0x10>;
>   				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
>   				phy-names = "usb2-phy", "usb3-phy";
> +
> +				port {
> +					usb_1_role_switch_out: endpoint {};
> +				};
>   			};
>   		};
>   
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index bc67e8c1fe4d..104f23ec322d 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -19,6 +19,7 @@
>   #include <dt-bindings/leds/common.h>
>   #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/usb/pd.h>
>   #include "sm7225.dtsi"
>   #include "pm6150l.dtsi"
>   #include "pm6350.dtsi"
> @@ -543,6 +544,50 @@ conn-therm@1 {
>   	};
>   };
>   
> +&pm7250b_typec {
> +	vdd-pdphy-supply = <&vreg_l3a>;
> +
> +	status = "okay";
> +
> +	connector {
> +		compatible = "usb-c-connector";
> +
> +		power-role = "source";
> +		data-role = "dual";
> +		self-powered;
> +
> +		source-pdos = <PDO_FIXED(5000, 1500,
> +					 PDO_FIXED_DUAL_ROLE |
> +					 PDO_FIXED_USB_COMM |
> +					 PDO_FIXED_DATA_SWAP)>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				pm7250b_role_switch_in: endpoint {
> +					remote-endpoint = <&usb_1_role_switch_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				pm7250b_typec_mux_in: endpoint {
> +					remote-endpoint = <&usb_1_qmpphy_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&pm7250b_vbus {
> +	regulator-min-microamp = <500000>;
> +	regulator-max-microamp = <1500000>;
> +	status = "okay";
> +};
> +
>   &pmk8350_rtc {
>   	status = "okay";
>   };
> @@ -726,7 +771,12 @@ &usb_1 {
>   
>   &usb_1_dwc3 {
>   	maximum-speed = "super-speed";
> -	dr_mode = "peripheral";
> +	dr_mode = "otg";
> +	usb-role-switch;
> +};
> +
> +&usb_1_role_switch_out {
> +	remote-endpoint = <&pm7250b_role_switch_in>;
>   };
>   
>   &usb_1_hsphy {
> @@ -740,10 +790,15 @@ &usb_1_hsphy {
>   &usb_1_qmpphy {
>   	vdda-phy-supply = <&vreg_l22a>;
>   	vdda-pll-supply = <&vreg_l16a>;
> +	orientation-switch;
>   
>   	status = "okay";
>   };
>   
> +&usb_1_qmpphy_out {
> +	remote-endpoint = <&pm7250b_typec_mux_in>;
> +};
> +
>   &wifi {
>   	vdd-0.8-cx-mx-supply = <&vreg_l4a>;
>   	vdd-1.8-xo-supply = <&vreg_l7a>;
> 

This looks consistent with 8250

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

