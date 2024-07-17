Return-Path: <linux-usb+bounces-12250-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0B7933A71
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2024 11:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBF0B283B7E
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2024 09:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C3517E902;
	Wed, 17 Jul 2024 09:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W19yectT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C4B36134
	for <linux-usb@vger.kernel.org>; Wed, 17 Jul 2024 09:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721210150; cv=none; b=THU96a3IT+C70qzcdfVeRhKu5a86774KgQyRrTmxhSesF5Q4OBB2o2q5d3GwKni2Soibwp9X7/bLrFmaIHjdQTu+q/wTX9OPqcW1NSc130Tp1JigG6STLdow3KypKwVUnu9E1J7aByBA0GBntvi54BdfW03BRwH6uyT6O7HUioM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721210150; c=relaxed/simple;
	bh=MsE5USsEUzrVEC0H28mgkaWE9mtLXPXc3XM4BWbEujc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VCdHJ+024vJ3M5Cw8p7bZPEmKDMRZO8Lj2WZzNh4maOeVz8+Elh9kYwNPZ++v79EAyCuxljYYfZJVJL+jxbWhA3s/8EnL1mSE4cQHBbf5iKglIYENDNKtDtA/7NxiIWXBvbPf/wEQvtWLRCxoIkqsTA2sTWVGTg9Obo+Fr8me/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W19yectT; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a77d85f7fa3so112972766b.0
        for <linux-usb@vger.kernel.org>; Wed, 17 Jul 2024 02:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721210147; x=1721814947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ugeVC4a5UpUteA18Qd2GhF4A2udsE2n5lW2mAeTI93U=;
        b=W19yectTav0qhVuHMmaweyEhxO++6QreiwNLmZUj9d+63A4e4VjQ0/+QEThWRilMlH
         EJGPiDDKPHxrodRNeIWui+aV8Zr+H5+vtQW94z+ev5EnNZm9uaIZJ7hah0lTVoLN//2t
         xWL1iPRaQKBcYYGRevhAgUQ+Vu04H3/yBXn/Q869Z8kycN1Rw9omKj8dPa5xv3YGoFeb
         q8ZYIesc0wZr99WduFCWpGANNGIjKjmPC+cpLxcrVrHD55y0wr7rP2r1bfnCTae5kzri
         zsQ5nXJ96BFS1i3ghYGCv4Y2c9auVEoxQE5qQbFWLXSfKCBmwx8FUuM0Unt654iPfcLM
         UuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721210147; x=1721814947;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugeVC4a5UpUteA18Qd2GhF4A2udsE2n5lW2mAeTI93U=;
        b=cSyG4AD/PWw+Xu+lMXSgfJ15o+9rjmB/2dVT/giOf2t5qfE2iVjaLPod6GDf6iUxCZ
         sHoFyWI+PVzqYSH09ZhpVf/mMAtXrUC/nVXXsZyo1O3pwJi8bd/bNX0/g66eJAUgun1L
         uPHGDN8z2amDSkbLlyNZD7ERLKNmLzHTlz9iN4wRELL1iDaIL2rM5UabPpg5mCUSn09p
         CknWfcjO5jFi/C7Rr41Ssd3QYu4N3AkbZyNhvp+eBuxBSEC4hk5QM0m7x3/F6aSryJtu
         Od5oagcUAk6JV3b9rfFz7i/bSBzjWMIIiNMs143DmGkbDbgk1NajFcIYg8a8eN0DEHeM
         eejQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNWdTcZbSKC345MMdGwJEoHNFuyVV7oIqdWD18u68EaYcneKXtF4HAxb/lVIwKKJpurGYcOyGMZQnqVaa128F2KIZI8Wc6B723
X-Gm-Message-State: AOJu0YxMai9FpR3NjZ7Q5MZOEIrQ6qmPDHJ7KMZehcUZjW6O+rzU1+rA
	fD6wGaJy+GPl7BZtFuTer/HJQ2s9TFvo9wI9jSpoa2/BiwVsqnrF6KK87jF29Nw=
X-Google-Smtp-Source: AGHT+IEmEelbTOo4Jz+vKhus8YOAOT7QdgPB21SgONssyHq/Fcqc3mI3R8AuiHgwgUboB5JdMssx7Q==
X-Received: by 2002:a17:906:bc93:b0:a6f:996f:23ea with SMTP id a640c23a62f3a-a7a0062bd7amr123237766b.15.1721210147030;
        Wed, 17 Jul 2024 02:55:47 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5d2040sm427014066b.84.2024.07.17.02.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 02:55:46 -0700 (PDT)
Message-ID: <442956f4-ca5b-4ff8-bc02-bcad4dce50e9@linaro.org>
Date: Wed, 17 Jul 2024 11:55:44 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: ipq5332: Fix interrupt trigger
 type for usb
To: Varadarajan Narayanan <quic_varada@quicinc.com>,
 gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, quic_wcheng@quicinc.com,
 quic_kriskura@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240717094848.3536239-1-quic_varada@quicinc.com>
 <20240717094848.3536239-2-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240717094848.3536239-2-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.07.2024 11:48 AM, Varadarajan Narayanan wrote:
> Trigger type is incorrectly specified as IRQ_TYPE_EDGE_BOTH
> instead of IRQ_TYPE_LEVEL_HIGH. This trigger type is not
> supported for SPIs and results in probe failure with -EINVAL.
> 
> Fixes: 927173bf8a0e ("arm64: dts: qcom: Add missing interrupts for qcs404/ipq5332")
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> index f58fd70be826..56304f996dbf 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -322,8 +322,8 @@ usb: usb@8af8800 {
>  			reg = <0x08af8800 0x400>;
>  
>  			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 53 IRQ_TYPE_EDGE_BOTH>,
> -				     <GIC_SPI 52 IRQ_TYPE_EDGE_BOTH>;
> +				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Probably worth asking, is there a MPM/PDC on this platform?

Konrad	

