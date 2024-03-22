Return-Path: <linux-usb+bounces-8158-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9C7886A5B
	for <lists+linux-usb@lfdr.de>; Fri, 22 Mar 2024 11:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F67AB26158
	for <lists+linux-usb@lfdr.de>; Fri, 22 Mar 2024 10:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716B53D0A9;
	Fri, 22 Mar 2024 10:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EDd8JIZ/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F231E3D977
	for <linux-usb@vger.kernel.org>; Fri, 22 Mar 2024 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711103485; cv=none; b=YVWlvoG8eyEEvoJlpo9b7zGxcxxkx7fmmK+TwArif6YNG5D0WxLsC+3lrHyV5r4kYeitD4wThkxEcbMcaRxNS1mOeYkroMKLyO5/c+2TkVtLhxxNPyhMyqVyJ06QEpe/bloUMpListd9tFaPJkrKVJLaJLv84DMn1c11Pe9jzIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711103485; c=relaxed/simple;
	bh=1yqsyEAyrbQEKMO+oY3gj7fVZXoAvDp07LGSjGWG+cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GocgrUTOrSI4tGOUVMMnQST6xbH6mszGvhK/pikEn2I5qDd/h5sVz5RkRxHP1Lc4mQe/hvlWFn2/vg/wHr1vdy57YiNBMzn1FKNxRCCcNLKJ2EwGFMltGCUCrydPBsXUiu9Q1KB/SYLOgI6kNwDuCdzRVwZGedub8vc2FasnLts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EDd8JIZ/; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33ececeb19eso1013462f8f.3
        for <linux-usb@vger.kernel.org>; Fri, 22 Mar 2024 03:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711103480; x=1711708280; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sEcFM3t3rGGDrrs+wuw2zDXHWzgkXtTmhLNSeATLAvk=;
        b=EDd8JIZ/ZjhQC1y97lTkWBOymL7GIFTHdQdCowTzSjDziNHFjpuecRQt3TOIwjNbKa
         fKEYrgHIHo+oqu46ecu+2CyvyI6PI8YFk5HogBYbwJyNjSBzjtb3z5xgf8kydq4Wfy5r
         99CsjaoR8OHuFbUjf4AKmkPpqTH+7DEQOIug23jIhClHAP0wgSUZhOCat2psXOpPTXCH
         9RyrPO8m62h+toTEU0JCUGJPkl7va47cbBNiauiQ36sigFCAgIWRNwB52xjAeKNjOlby
         wuFHZ0TGbuXnJPdWAplkg8Bk7Utc+Kn3LxIy3Y7qi3oHGBxhe6VUOiQkk5NHe7qq7QYX
         aKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711103480; x=1711708280;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sEcFM3t3rGGDrrs+wuw2zDXHWzgkXtTmhLNSeATLAvk=;
        b=vOXXiWqYODqAk712z8U9Af2ECwP/L/a5SF8UDkCSHZ/WToAKKaiJAEIK9ndbUH9R9+
         /NstbII2cTTDvXBU7igP3CTNBkAU5Uf3ZRwhHLY0CezS/wPwwME+vwUEYkzR6xSmL/ma
         gTUbGB6xLU5bd+1oULFM690mgZsiQbEks+/bAjYAMZCCdXg22jWFp9x9Y3+V/ush8b4B
         48n0nZ8TftvyDiFmiNUiup7JFGbNInuhdasVecfu5WjXuBY2pyFOu1VqHvqlk/PC3dOd
         CeKHycKIzBL3nOudzcmB4eRHlqgox1IfZPFqNAEJlRpdtvVCDL8KFFM3I6/Z5cg3v1F+
         nJeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxh1gTVhQsRkohpUJ41s8pk8khatB3ufsELqKxdID5wjdvRiVh93xrKoBvt3KT5aw0Vm3xj5V0x+YAsGFZD6emD3G/7U4BtNJW
X-Gm-Message-State: AOJu0YzEPBX1UN1i8KyVi9RZW+sSvym36uzc4JwHcReQYom5cy91fXqo
	NWOGg7ua1WzJiFx1NV1IDp414DZXNMNN0llf2nDTsT7dCXIC4jy64geNbMusNu0=
X-Google-Smtp-Source: AGHT+IFLWeyHAKmJFDuY1LyMfeP1uoswUUuBKiCoUA5Ty/5Z3a1YZV4wAVHf2fG9BBV8WWxxQGLgrw==
X-Received: by 2002:adf:e2cc:0:b0:33e:cf33:bb1a with SMTP id d12-20020adfe2cc000000b0033ecf33bb1amr1518380wrj.12.1711103480298;
        Fri, 22 Mar 2024 03:31:20 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d60cf000000b0033cf4e47496sm1759496wrt.51.2024.03.22.03.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 03:31:20 -0700 (PDT)
Message-ID: <72b68358-6621-46d0-a0f5-b48fdbc54678@linaro.org>
Date: Fri, 22 Mar 2024 10:31:19 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: pm7250b: Add node for PMIC VBUS
 booster
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
 <20240322-fp4-tcpm-v1-3-c5644099d57b@fairphone.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240322-fp4-tcpm-v1-3-c5644099d57b@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/2024 08:01, Luca Weiss wrote:
> Add the required DTS node for the USB VBUS output regulator, which is
> available on PM7250B. This will provide the VBUS source to connected
> peripherals.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/pm7250b.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> index 3bf7cf5d1700..91a046b3529c 100644
> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> @@ -45,6 +45,12 @@ pmic@PM7250B_SID {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   
> +		pm7250b_vbus: usb-vbus-regulator@1100 {
> +			compatible = "qcom,pm7250b-vbus-reg", "qcom,pm8150b-vbus-reg";
> +			status = "disabled";
> +			reg = <0x1100>;
> +		};
> +
>   		pm7250b_temp: temp-alarm@2400 {
>   			compatible = "qcom,spmi-temp-alarm";
>   			reg = <0x2400>;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

