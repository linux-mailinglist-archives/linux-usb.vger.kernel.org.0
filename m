Return-Path: <linux-usb+bounces-8185-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4101C8872F1
	for <lists+linux-usb@lfdr.de>; Fri, 22 Mar 2024 19:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A02AB2351F
	for <lists+linux-usb@lfdr.de>; Fri, 22 Mar 2024 18:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5283A64CD2;
	Fri, 22 Mar 2024 18:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tvtfg27V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268A66351C
	for <linux-usb@vger.kernel.org>; Fri, 22 Mar 2024 18:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711131634; cv=none; b=HduDIn2UTjXIdhtR6NV2b8kdffqP2HNgZzOpFyscB6V8pnfcU1dfzZ+5802KtgH4oTH6S9RL9TkMJiPTsth0UpucyUK3RHz3okAOrFaNvtoweIUX5EzKyXMerWiV8TNSt0vEi5LqtOx/udoIhQVTos7UQWj18F79pfNPR4bqObA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711131634; c=relaxed/simple;
	bh=rB+ZR1pQrRoiSlVFEn8eDKGzWc6r+bkLqQy/ExzQfZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dv7CvXYCE8I7wH3Khzv65e73zisuhLiHk9ig9sanP7oOzyQ+k9yzi/eRyMy5DyfR0Lvd/YIZs9UjqNWiejRE5cWdzMCJIoYrCShXznd8Tfl6a9/tXBdAkbCNExmuI2aFl5HD5flp4q0/Uz8LDlYS3/y/QS/Uz7lvArpc0l+AZHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tvtfg27V; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56845954ffeso3106474a12.2
        for <linux-usb@vger.kernel.org>; Fri, 22 Mar 2024 11:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711131631; x=1711736431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Un7oE5SOcfiOdZ/t+Y9JYnUgsb/a3y3TBifkzTStaMI=;
        b=Tvtfg27VvulZdLfON61/uzaOV5v4WDtlNzGLbi1pQF9V0O/ggQdX0ii3zdN0OKcBVj
         GPS1ZqjgUR+MYymP7F0G1E0nUbBHrcOvZLZasAV+29D8kHhtow21tnCXDt4oADpdEDI/
         uJ31iNi9cEZkE6HteXpAQFf/s4h2jq8XWO+errV8voS+uThm92dKcVyjC3dblsr9V7vM
         tDP64qnNWH7wbAmIx2p+cvwD2glI1VPnpVfQ4fKExZpYa/RrFCvxaZPxlW9b488LRKZz
         /cSUdbRF8rz/8ByIgfpAeUu+QQzZaqo0Nlc/rIRAs08R3r/ksWS2PBEnDuqA+fY2mnFX
         AS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711131631; x=1711736431;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Un7oE5SOcfiOdZ/t+Y9JYnUgsb/a3y3TBifkzTStaMI=;
        b=EwpHWp/Uq9mZUkU61mXl2Keqk7jPz+weIpIfAeYULeRQlLYH/SZwfGgsLn2R+oYzH+
         sTQV0M9bt22eRBeSie/1TmCqZBKZPspT5u1Ift7nhVTbn9WSUW6X56TXSzepUNQOqglJ
         hHBXFhYCyFhR8mWVIkuahr5GxAB+Gg2yNeCJHdISpx5d97C2Tx9mYd+1gqj97jvlTMrx
         Ozh5y8A0MtFDbGtzFZ7zcDy0Pj/+J7n7L09b4KtAF1NnYqQ2aPiU6LAPFWty2MxxF+w2
         5oj7U1KbLBTxX9s3nA+F1ha9ltR7VykdVhp7CZcvYTyxkU/kr9WONA0b4QjibZuX4UQi
         YBaA==
X-Forwarded-Encrypted: i=1; AJvYcCVqGldcKQhbQK8pQ2mSx+aC+bGTtM4f4IwqRCHan2CgH6mb20daGNjXaoOQM0xjwkvZqueIrG4swXzJ0JSEZyz1RtlvS+FnwBgb
X-Gm-Message-State: AOJu0YxAZ0IMt7Dm6bYwnqNJ5CFOKtES0xaFfix+CTAhM6vj8fMVIRpS
	apW+SyV0n9+qKZAPH350Qc/Z4/GRfrLOlkknbiTQ6Ks11iYNWFAjgkDFiP+VOms=
X-Google-Smtp-Source: AGHT+IHJZHkIFw8Xxv4Z+VCYrQlX8b4lzO1gktTzl1yaDPSw65KFV2RR4m1ioqmMf9vNBQVckwV88Q==
X-Received: by 2002:a50:f603:0:b0:56b:eb86:2107 with SMTP id c3-20020a50f603000000b0056beb862107mr190997edn.41.1711131631547;
        Fri, 22 Mar 2024 11:20:31 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id o16-20020aa7c510000000b0056bafdda14bsm81000edq.28.2024.03.22.11.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 11:20:30 -0700 (PDT)
Message-ID: <ab5550e0-4d08-4c31-800c-c936809a1d38@linaro.org>
Date: Fri, 22 Mar 2024 19:20:28 +0100
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
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20240322-fp4-tcpm-v1-0-c5644099d57b@fairphone.com>
 <20240322-fp4-tcpm-v1-4-c5644099d57b@fairphone.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240322-fp4-tcpm-v1-4-c5644099d57b@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.03.2024 09:01, Luca Weiss wrote:
> Type-C port management functionality lives inside of the PMIC block on
> pm7250b.
> 
> The Type-C port management logic controls orientation detection,
> vbus/vconn sense and to send/receive Type-C Power Domain messages.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

