Return-Path: <linux-usb+bounces-5737-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B043845D66
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 17:37:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B368B2E4A8
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 16:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4585A4D4;
	Thu,  1 Feb 2024 16:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EyPU7UJY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3879E5A4CC
	for <linux-usb@vger.kernel.org>; Thu,  1 Feb 2024 16:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706804283; cv=none; b=b1w10MmfiSw56hQ3FICfvb8OZJPNVIuD9WF9I9m83GI6j+pqjtaCH6UQiMhWSQI6KeW9/MH5apavmXzNGU6wcJSdPjCEITMOVp0SS2rhKhSldT3/zv7nbG6QqBHBzttHJLEYty5EF5jh+cZlyXvzmApDZ0/zFBdF3h1TSahaFGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706804283; c=relaxed/simple;
	bh=LLOy43o1IKCG6lvcpGk5S6aOFaUkVbKs6qG52qJmO78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iu2FttoaX/dE3XScNigunoeSlIGgPrYiW5+3kcyYCDS/F6B2kTiolC8/OPbwNvFOnuzujmsFLKcPJY9GJQ83/NgGs7fMnpOD9GDYzYyO5LA71rLaBfyH6srnqSV2sca42ifRL3QzVx5+GCgIBZi4RPjj1xHruDBVr8zdh42N3uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EyPU7UJY; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a2f79e79f0cso149166966b.2
        for <linux-usb@vger.kernel.org>; Thu, 01 Feb 2024 08:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706804280; x=1707409080; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d3dj/H1IuBU23vrL194BpUJdj9lzyvxpzTsVz86zBCU=;
        b=EyPU7UJYOawXMF2AFtKCBmyiHYn4OH9VjTCT1eu8t7oIB9YraoawOvr4tK3CSN0wxL
         Mw5uVN8KRmA4PXGpQjFRtLhhaqR7kKLg7+pF+fBQHTsb69gSmADl8Y4FtuVU16tEnGhf
         rpLCYXNojhzhU4yOPLAxGE9bpVKoWxrc+Of/qF3yBub0raCXjL2JUBVC/qwUNmRSQSYQ
         yoWKX2JziUi/nolAUpFXZPvGkkIWciDpJLgYvFZqYm9kin/wQ/ndXZ5RjQnTzYlAUikl
         kgjKTfq524QC+gYfRZ3g13I8RjuEpLhq4zSTMrmqRXkqAL2feiNAbQtaxD3nVVQapOKi
         27zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706804280; x=1707409080;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d3dj/H1IuBU23vrL194BpUJdj9lzyvxpzTsVz86zBCU=;
        b=xJgEYt2lkGVTW5u+1Dn/V2T63M8eCEP/djNHIkRc2mxx+/78bFkEiFqUDxRZnDtzvE
         s8oh9Fb5xs608CJdySq1lDfwjh1B0Bh5Cr1GNRw85vczbDL1lLTN/erbr1PSzD5Y+F9q
         q9BUYl5BZBhH5MXsG9oLxJ+EZkHFL8GDnF/JFGpWPvOcoPY1xd6p0LVizheEY58iNGsQ
         7nz/fQ44lZrEM0Pl7djBayMruQjogyYUIQ3W1A+l9YCoa4QwRcV8wa1tUWlLP+pk3UTe
         qDPFrQjcBK3+NHPcCM8wlZK5Xs4kTpG8yyNTNL5nTwnjw2rnkE+Dm/slCnTkaVnx4nyD
         3olg==
X-Gm-Message-State: AOJu0YyulPFaCIdtv4ApkPTil8IP48DMGGNl/tgkbS3DGTVy8UvvTGnk
	9ZEB/Lig/o4BnPAnKHGGpPX6Lfh0ZPo0bUq8ZTCdAqVUGEbou43gtmqFu9PTNzU=
X-Google-Smtp-Source: AGHT+IEYvJqZb1In/kLaJuq+/tYpmMzUsu/MNaRYV6cfRbNXTMjyyuH7W1tEcWRgd75fB+AJHmzpBg==
X-Received: by 2002:a17:906:5290:b0:a23:6dd6:7eed with SMTP id c16-20020a170906529000b00a236dd67eedmr3564079ejm.77.1706804280457;
        Thu, 01 Feb 2024 08:18:00 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXMybzPVIsgrOy64dExcvFPNIe0BTTFZJIrvrf+yk2Y2uybcN3RBrEVl82+dKOZ9apcXNM52Vw+wSu2fTH2kTWYKdsfN8S+9eKK9Qxc4y9f/Ha0Si1gq1rUH969ggXAcKwbFgL9IWGFdzxrWkYYxfTn2IJJgjizaJzIuPF6D8ZUcWCzb0JFQMgTooqzbGq/p2Mn4CgaNySgAvtbVmZfb7QJrFl/5+8joBVmcLFH/MxP46fXBrVfD0D0bP46iANOS+XB0VyjFseoN+ObtmxuSqcx+hx4gTY6a9s4jvnL/eE6kZQepkXoF9bDq/gs/H/dAGErR3mNt5nIUy5zO6EuGkGOwWuwxhUMnWMIRbnPO3dMB2GxvdT/tzbHFl7bD+5puJEE0wI20Fm5hb5Ebcxmg0asykrxFuwtlkoHBM/7X8SE4sg=
Received: from [192.168.159.104] (178235179129.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.129])
        by smtp.gmail.com with ESMTPSA id e12-20020a170906044c00b00a35aaa70875sm4788419eja.42.2024.02.01.08.17.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 08:18:00 -0800 (PST)
Message-ID: <bfe5effd-0ad4-4c72-b986-e1a02599fe00@linaro.org>
Date: Thu, 1 Feb 2024 17:17:58 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: qrb2210-rb1: enable USB-C port
 handling
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20240130-pm4125-typec-v1-0-e8d0097e2991@linaro.org>
 <20240130-pm4125-typec-v1-4-e8d0097e2991@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240130-pm4125-typec-v1-4-e8d0097e2991@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.01.2024 20:42, Dmitry Baryshkov wrote:
> Plug in USB-C related bits and pieces to enable USB role switching and
> USB-C orientation handling for the Qualcomm RB1 board.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

lgtm

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

