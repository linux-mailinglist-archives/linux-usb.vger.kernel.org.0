Return-Path: <linux-usb+bounces-8159-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C0F886A71
	for <lists+linux-usb@lfdr.de>; Fri, 22 Mar 2024 11:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 323DF1F23DEA
	for <lists+linux-usb@lfdr.de>; Fri, 22 Mar 2024 10:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08BB740876;
	Fri, 22 Mar 2024 10:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zNxkBRAk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03423FBB2
	for <linux-usb@vger.kernel.org>; Fri, 22 Mar 2024 10:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711103569; cv=none; b=Yetfr8+mBJzMIn5pFVpXXkU+/aXrCgOkXayKXrtD3EPoJJzAsuM6K+7/biyzuFMNp735ADCugBi383nn31PmMlechUG0QFVYQ3pQcQV2JVZq5x29Jj7FAhbUbj6Do4ZC16cxgB1cg+L4shrGhxLKrtEEt4A/XCu2FI1Guet1/3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711103569; c=relaxed/simple;
	bh=IeeeFvZPihvjkO9rkI+cnfWH8mStNkDQXAroPXkgklQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NgeUMG1hGht0BhxfjwlcW/zmQJ4m/yHi6KAmMqVBiOpcllVcH+GuY1T2RB26tfJEuW3cHSIUEyTtqTjk8e52BAwmZvT1bQ1zOq6/4nSCEQOTauXIpdh2BXYgoAe93LQ2c9W3QQiRQIZwhO8tb6aqAT+egZ5zh87VqEIovVCwEfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zNxkBRAk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4147e135f4dso1309775e9.2
        for <linux-usb@vger.kernel.org>; Fri, 22 Mar 2024 03:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711103566; x=1711708366; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4cLlbtwhTjL1jxvTL4CgsNlJM2USa8MoHtGm1QbNL5M=;
        b=zNxkBRAkF6ZaYFjq9jedqze7FNApSHYuISz3kR1vMgmawlNaBZMvEEE2YfaTY5rYM6
         j+U5mZPWFouQqgS7cHAPyDH7zi34LeOoepuIKXBe5GkW+cgOofyPoRCjFTDBdC1iISuy
         bwjx/Pid3sNlFd/D1Vg7K4y/Yz2QMPAVQIOPQMVxEDH9+xgrkFZ3ex+HWZtEIAfbZ5NQ
         +a7xcb6fyITm1xfvoBhtRZqLMnDdOwkCI+0exqz0xd3uQ1TMF6sEGfpUvdBqOpRIvwT+
         gnuqRy4HFQLsfzFthNncY5fWI94satFJ34wyohvAL/SuI+7DdVT3e7Qr/rUkH3ZysXvQ
         DXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711103566; x=1711708366;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4cLlbtwhTjL1jxvTL4CgsNlJM2USa8MoHtGm1QbNL5M=;
        b=EQxU6k8RhBsGWEcV76N8k0gbUjlLg4AG8Pg5k98ukR3xyqoeavRTVdOInb7nlH6sgt
         jEt/hfTE4947R3Ruw/dGHCUlIV7KIxdOzmHbDWmn9t9DG2N8o7xO+RX79/ghyoo5BBf4
         jt0twR5UTZbWfRyPQy1ecCkDAXNvttI35vT12f5x0Ye6msx0bkwJtaVE6fBu/egV9mIC
         +f8TNZJuqYLK6JQrC2TVxpxeG2epvo43wgv/fQZnjVr/0isWpDWCYIrZjzaBrvmuAi9M
         bg5kW6883xQmxEDw/ZDfB6cDDGYUMnhlOc6dJOJX8BhB4gpwJxHeThq8hv0dtgqs9D49
         GUBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbR+dOcleCBFrDYGPYlHSeowZccq8qO2gtgbT/QXTTGlxDwyAb1rD95VoiqSPpB7vFri99wA5xknAs5OxuO/HoC0bhQ82RLIlH
X-Gm-Message-State: AOJu0YzJLffdtSGlTgwAWXZPaI9MR2mcm9yTHhMSKXN2ZXUWUvcD1Bc0
	5UzR1echdKt89v8SHOoQSE8/t4tMY1PnO3gAJGJt5qFjmuO7T82yW+XPt2JOGXI=
X-Google-Smtp-Source: AGHT+IG2NsJwJn4mQZLhTfufZL9LbdScYyZRHQheGp2Pdz05wMVc2kyw7Og64VHUf6sgmyIEwndVRQ==
X-Received: by 2002:a05:6000:1243:b0:33e:4d34:f40f with SMTP id j3-20020a056000124300b0033e4d34f40fmr1103056wrx.46.1711103566118;
        Fri, 22 Mar 2024 03:32:46 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d60cf000000b0033cf4e47496sm1759496wrt.51.2024.03.22.03.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 03:32:45 -0700 (PDT)
Message-ID: <a4ff04e9-794b-4afd-920e-a2b2d5bf687e@linaro.org>
Date: Fri, 22 Mar 2024 10:32:45 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: pm7250b: Add a TCPM description
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
 <20240322-fp4-tcpm-v1-4-c5644099d57b@fairphone.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240322-fp4-tcpm-v1-4-c5644099d57b@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/2024 08:01, Luca Weiss wrote:
> Type-C port management functionality lives inside of the PMIC block on
> pm7250b.
> 
> The Type-C port management logic controls orientation detection,
> vbus/vconn sense and to send/receive Type-C Power Domain messages.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/pm7250b.dtsi | 39 +++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> index 91a046b3529c..d9abac052afe 100644
> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> @@ -51,6 +51,45 @@ pm7250b_vbus: usb-vbus-regulator@1100 {
>   			reg = <0x1100>;
>   		};
>   
> +		pm7250b_typec: typec@1500 {
> +			compatible = "qcom,pm7250b-typec", "qcom,pm8150b-typec";
> +			reg = <0x1500>,
> +			      <0x1700>;
> +			interrupts = <PM7250B_SID 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
> +				     <PM7250B_SID 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x15 0x03 IRQ_TYPE_EDGE_BOTH>,
> +				     <PM7250B_SID 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x15 0x06 IRQ_TYPE_EDGE_BOTH>,
> +				     <PM7250B_SID 0x15 0x07 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x17 0x00 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x17 0x01 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x17 0x02 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x17 0x03 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x17 0x04 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x17 0x05 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x17 0x06 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x17 0x07 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "or-rid-detect-change",
> +					  "vpd-detect",
> +					  "cc-state-change",
> +					  "vconn-oc",
> +					  "vbus-change",
> +					  "attach-detach",
> +					  "legacy-cable-detect",
> +					  "try-snk-src-detect",
> +					  "sig-tx",
> +					  "sig-rx",
> +					  "msg-tx",
> +					  "msg-rx",
> +					  "msg-tx-failed",
> +					  "msg-tx-discarded",
> +					  "msg-rx-discarded",
> +					  "fr-swap";
> +			vdd-vbus-supply = <&pm7250b_vbus>;
> +		};
> +
>   		pm7250b_temp: temp-alarm@2400 {
>   			compatible = "qcom,spmi-temp-alarm";
>   			reg = <0x2400>;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

