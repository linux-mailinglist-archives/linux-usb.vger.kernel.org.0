Return-Path: <linux-usb+bounces-8157-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D75886A2F
	for <lists+linux-usb@lfdr.de>; Fri, 22 Mar 2024 11:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA900B25938
	for <lists+linux-usb@lfdr.de>; Fri, 22 Mar 2024 10:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1C038FA3;
	Fri, 22 Mar 2024 10:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lg/BHtze"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7041817575
	for <linux-usb@vger.kernel.org>; Fri, 22 Mar 2024 10:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711103076; cv=none; b=oSJwMWkBaTHXYyVRPymEU3iPoRA/DNEf6qwM0KGOXbtJRwxmQJqntwA8WPw0dDZf5Q+xPmiSOhjj/+NedLdYCDa9E7CZXsPLy95loXJ/4tWqKd1yp7G3Iabe751VwKJXWEEycEovGi97CwOVLZGbx9KYC4b1aplfs88nMpLMF7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711103076; c=relaxed/simple;
	bh=LdraHFKkYxsoFAQsnK5xaReIIh1bnT+H6G/1KbOLhyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uf2s/259spktJZpDWUsH8vYX36Rl/F/73XFinrtEac2MsW9lt8iQ/XJXKDIR4yYREl3TYdXI6wP4Wkcdz9nDso+9cP2xLc6Eq4zm612uImBY1Xuu1qqKrheGwFJghOBOKWesLe2zIRM4oAE77iVXhLesmKQrXvXtS7baS83arf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lg/BHtze; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d68651e253so32137381fa.0
        for <linux-usb@vger.kernel.org>; Fri, 22 Mar 2024 03:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711103071; x=1711707871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XbU84KSOwnLxXUjDH60L4m12voWSvWaFGV7NZhED0mY=;
        b=lg/BHtzeA/KHPPcljScts4CsixnZl76gpq9JZj5ZkU7bzJMm48s/26GhY+Pvxjsv9P
         1tnYDHbd61gxMDnNQI6t32TRhzk8CquEZLI2gN1UKMAfqISTcVavL/8Xx7ro88AuXa5e
         TmlThLO2fHWouenruEgoqBR1DIAAYlFwpM55wIWw8DD7YI2xXD1E0Uy9dSslNU82WeFR
         yjEU00t7wecaQ0057KzvvJcawdRbHH6oDtADJxnhBoNrGk6ib7jwuaoZPExJF3+Z+Un8
         DfvESBDX6UjwDtK/0wnb5SNjFl91CyxxH4WxcYBhhaP3d90hSYHsSPTLqVVMfv1KCxtk
         j8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711103071; x=1711707871;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XbU84KSOwnLxXUjDH60L4m12voWSvWaFGV7NZhED0mY=;
        b=BMqTsczL114IodNfzApo5rBjmYBZwWMR54HpyBw52r73kZyLDclRmzOPqZdQNAamBp
         ufVu5upgPhR0+TSSpotxCb+JcW02XA+qBn+hhfM+0evDp37W1brbr9oafZMi0nyQe050
         YesMbRl0eGvHYNW9Rca6HMuQ2mFMbcTmmZ1bHAYMMzv/Fn/Z3ldPpgt3HJLnwcfu10Lt
         XL62cY5dJNsui1qcUd0ZfqiKbVcVjAQ1YJXyzAwozbSFjCYdywDad2MxYK3vR+cZa5GB
         3ubSkor62Osjdml+H/XGTRAMm56UTFamyGU1vL8c2pMLCs+o8ZZ7Sj5uUzfRUFnS4vzg
         ybCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkblZI5C9It2ZFLcHES+v1Sa/J3dH1yaMcItZwTrSnEMgV6L1s95jLaT27tl6w5I79lQDg7d8+j5aA/5VGdpeY+LIU+HQj6TXt
X-Gm-Message-State: AOJu0YzAAyeLZL6DnbL5fZRIRjVllzwTEEzq9gCTmf87+tbN1iU9HhZT
	d7mWxdzsbKad1hCydy8YzbYoUfxCOaY/vhCYz6lX9oPzeOiJvLVKR2Dz5rjH/Ak=
X-Google-Smtp-Source: AGHT+IEIVG8bh+X4Ju2UJR3vnr0XfmzR3ZjVuy71x8WHH0+8JMVoyLDvz2/SChZ+zaLCYvb5BdxISA==
X-Received: by 2002:ac2:44cf:0:b0:513:eba9:46c8 with SMTP id d15-20020ac244cf000000b00513eba946c8mr1213314lfm.35.1711103071691;
        Fri, 22 Mar 2024 03:24:31 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id n21-20020a05600c4f9500b0041468961233sm8440421wmq.35.2024.03.22.03.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 03:24:31 -0700 (PDT)
Message-ID: <f5dafde0-03d6-4693-b263-adf19984fa64@linaro.org>
Date: Fri, 22 Mar 2024 10:24:30 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: regulator: qcom,usb-vbus-regulator: Add
 PM7250B compatible
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
 <20240322-fp4-tcpm-v1-1-c5644099d57b@fairphone.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240322-fp4-tcpm-v1-1-c5644099d57b@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/2024 08:01, Luca Weiss wrote:
> The VBUS register block on the PM6150 PMIC shares the design with the
> PM8150B one. Define corresponding compatible string, having the
> qcom,pm8150b-vbus-reg as a fallback.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> index 33ae1f786802..fcefc722ee2a 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> @@ -26,6 +26,7 @@ properties:
>             - enum:
>                 - qcom,pm4125-vbus-reg
>                 - qcom,pm6150-vbus-reg
> +              - qcom,pm7250b-vbus-reg
>                 - qcom,pmi632-vbus-reg
>             - const: qcom,pm8150b-vbus-reg
>   
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

