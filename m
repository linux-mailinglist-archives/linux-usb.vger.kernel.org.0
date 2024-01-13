Return-Path: <linux-usb+bounces-4998-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DACE682CCA2
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jan 2024 13:19:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D9821F22D5E
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jan 2024 12:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55521210F0;
	Sat, 13 Jan 2024 12:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m1kCMjBY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9AC20DF5
	for <linux-usb@vger.kernel.org>; Sat, 13 Jan 2024 12:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5585fe04266so4082789a12.1
        for <linux-usb@vger.kernel.org>; Sat, 13 Jan 2024 04:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705148334; x=1705753134; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EQGtii+H6n9Awn9eZcWb8sXXEyi+JRG4K8zgNROCcTs=;
        b=m1kCMjBYV2UXf2b/F0i+If8re20M8WM+ABSulqdlTs8vDOd1yxkAujOM8MH87gfyOE
         KzbABRrJSkxKoBJbXUi0JTw2LapqGEYWQiVpdpF0VD5yk08gQ9tbVbxqdPFhrC+JWNPX
         i4r82yel247RzXFFVcaelPMXrVProCkhTk8PevAf4w54zlR6ccEoAE8dKHMgZy0K+FK4
         aNLWC14ZNFj0L6H00rG/ZDPMeSMavqscpiWfcq9eJPWUTztNirh1IkmNgQbLXW4KW+X1
         fs4Wcgn7ECeq74A61d9j5MFc2FycHQ6aJWyZfkY9KhvC1X7blh1KfzEoaGjTl7dCJN7T
         fhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705148334; x=1705753134;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EQGtii+H6n9Awn9eZcWb8sXXEyi+JRG4K8zgNROCcTs=;
        b=VUQaCxcYPR5yYlrkjKloIaJ3xnBAhRE9GPpUqAJ5Iu74BDydORKiQYeIi+Nb2vNndl
         8dblNPSc+O/NTUNUwXi+BcxmweScoM8gI+omQOvvmb7wJP4CZqNbXLCXKCKwoqPSIADj
         DYTY6DLk0FyRd+PnI6znsdiSmcmLiFMXRzTtrq3AA/juBeN4/dqDcRAHoTjHraHWQ5wB
         m1yxTcqLQBmMUZTbgc0RdMqu1rxPwMW+G/ncnaGmhrdV9P2V2Oxdcuwz3mko7IO1cJaI
         aXaXMHMaJAxzZbDEvQOidMzSRz9sc+snkrzb5ZOOy1JmvtXBNGKYUSc/IRKAAAfL8pwY
         SRvQ==
X-Gm-Message-State: AOJu0YzKtb4b9+oX2mpn8+lu5aFrj7+kjwIm0l8zS5iCESm0KryvnW4p
	msUoBMFZyGEAWUV0pMwDCx5Fr1cyZKwm/w==
X-Google-Smtp-Source: AGHT+IGUejsD+UGJUMMzFhLNYyf0jPaCWNl/WJSUiIfU0GpwB57UOZlGZEIDkr6Tmuepxep08t/YTQ==
X-Received: by 2002:a05:6402:40d:b0:557:427c:1c2c with SMTP id q13-20020a056402040d00b00557427c1c2cmr1210164edv.85.1705148334648;
        Sat, 13 Jan 2024 04:18:54 -0800 (PST)
Received: from [192.168.100.86] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id w12-20020aa7d28c000000b00557c48abe41sm2909969edq.55.2024.01.13.04.18.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jan 2024 04:18:54 -0800 (PST)
Message-ID: <29006ef0-1aa0-4ec7-8795-8e3729562fac@linaro.org>
Date: Sat, 13 Jan 2024 12:18:53 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] arm64: dts: qcom: pmi632: define USB-C related
 blocks
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
References: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
 <20240113-pmi632-typec-v1-11-de7dfd459353@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v1-11-de7dfd459353@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/01/2024 05:42, Dmitry Baryshkov wrote:
> Define VBUS regulator and the Type-C handling block as present on the
> Quacomm PMI632 PMIC.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/pmi632.dtsi | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmi632.dtsi b/arch/arm64/boot/dts/qcom/pmi632.dtsi
> index 4eb79e0ce40a..ccf288ddc987 100644
> --- a/arch/arm64/boot/dts/qcom/pmi632.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmi632.dtsi
> @@ -45,6 +45,35 @@ pmic@2 {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   
> +		pmi632_vbus: usb-vbus-regulator@1100 {
> +			compatible = "qcom,pmi632-vbus-reg", "qcom,pm8150b-vbus-reg";
> +			status = "disabled";
> +			reg = <0x1100>;
> +		};
> +
> +		pmi632_typec: typec@1500 {
> +			compatible = "qcom,pmi632-typec";
> +			status = "disabled";
> +			reg = <0x1500>;
> +			interrupts = <0x2 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x2 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x15 0x03 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x2 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x15 0x06 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x2 0x15 0x07 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "or-rid-detect-change",
> +					  "vpd-detect",
> +					  "cc-state-change",
> +					  "vconn-oc",
> +					  "vbus-change",
> +					  "attach-detach",
> +					  "legacy-cable-detect",
> +					  "try-snk-src-detect";
> +			vdd-vbus-supply = <&pmi632_vbus>;
> +		};
> +
>   		pmi632_temp: temp-alarm@2400 {
>   			compatible = "qcom,spmi-temp-alarm";
>   			reg = <0x2400>;
> 

LTGM

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

