Return-Path: <linux-usb+bounces-4419-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 502ED819F11
	for <lists+linux-usb@lfdr.de>; Wed, 20 Dec 2023 13:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A9D8B247CD
	for <lists+linux-usb@lfdr.de>; Wed, 20 Dec 2023 12:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC37D24A0C;
	Wed, 20 Dec 2023 12:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IduhJkVI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C836D25544
	for <linux-usb@vger.kernel.org>; Wed, 20 Dec 2023 12:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-552ff8d681aso1288702a12.1
        for <linux-usb@vger.kernel.org>; Wed, 20 Dec 2023 04:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703075559; x=1703680359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tu7ffZ92sPLeyk+eGDbM7u37bu69MZYvieXsbHFoatg=;
        b=IduhJkVI3t4Unf9ucRIQO1NTr7r8qOFJZ9yLrOSoEGbWhSl7jV0EQ1UHifFXRjj9i8
         N3gtDKyZ7r2Yg2jeV06t/B9BmCQLazHF0SMwp6/dL/xy6cSGyM9rULs9O+cBimdOS2Pk
         Yn96lNY4W1Zzr3DDJq0fw56s10+WraaAECSE/TeBIaWGilnellfHF1O4z8OFezOy/zst
         L8640jJPa5vNHl67ca3wTOGKBWt2sybs6XyOLiXO4QOK53L9xHXbK2x6/aQSqT0p/TL3
         /hzS1yMoY7vMpYs8Dh8uc3PHinzmGVGTez06++n6OvrvfF2wv3rvZQl00tjYJedkOwH9
         CofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703075559; x=1703680359;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tu7ffZ92sPLeyk+eGDbM7u37bu69MZYvieXsbHFoatg=;
        b=JfTeDDA9gFOcf7AmU4GNr51EzPv7cA87P7+7ojo3rkj73Z7Kp7F2PV2op4Y+3Tel0K
         CahBE0N6c05mkrWj10xHo1FS1prUkU2c7nxRpFITwef3Y+elM5wIeMv3keUot78gP1Vy
         czO4EOX2tju65B5rNFz6HEvtmxjrFvoh05isawIAdsZwOKFonxHbnACJG73dtcrkMazC
         gI7SMoESvjoHee/sknpWqR/gseEFtKgKVgHK5N22UEzDNc1dvb52qqmsZgB46jFL9P2h
         SP7VsEBIoKOk5FqodQrhhM7PmUE1fme5wLpNWdnowLPRtb9TSnD7slri8mB43qOh3TUo
         eAuA==
X-Gm-Message-State: AOJu0YyEIm9/mCWvsOPvlz3TdbeNAAg3MrIB+9aAIIHSYLG6cyOJ56NX
	QtH2hiPw38alCZbaMSTSPAgbDH03X1BM4gtvKlQ=
X-Google-Smtp-Source: AGHT+IGNf6V78YDTanEUyebLe5accfD5uG11DUdZ7pFqQ0L6Uli+ibi8a1IcNx9BKhwpYZEUwHvpUQ==
X-Received: by 2002:a50:d698:0:b0:54c:bb9c:4b88 with SMTP id r24-20020a50d698000000b0054cbb9c4b88mr2847545edi.5.1703075559111;
        Wed, 20 Dec 2023 04:32:39 -0800 (PST)
Received: from [192.168.199.59] (178235179206.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.206])
        by smtp.gmail.com with ESMTPSA id d12-20020a056402000c00b0055344b92fb6sm3393899edu.75.2023.12.20.04.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 04:32:38 -0800 (PST)
Message-ID: <8d042095-1e09-45cc-9762-909fe8d663a9@linaro.org>
Date: Wed, 20 Dec 2023 13:32:36 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Fairphone 5 PMIC-GLINK support (USB-C, charger, fuel
 gauge)
Content-Language: en-US
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20231220-fp5-pmic-glink-v1-0-2a1f8e3c661c@fairphone.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231220-fp5-pmic-glink-v1-0-2a1f8e3c661c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.12.2023 11:02, Luca Weiss wrote:
> This series adds all the necessary bits to enable USB-C role switching,
> charger and fuel gauge (all via pmic-glink) on Fairphone 5.
> 
> One thing that could be made different is the pmic-glink compatible.
> I've chosen to use qcm6490 compatible for it and not sc7280 since
> there's plenty of firmware variety on sc7280-based platforms and they
> might require different quirks in the future, so limit this PDOS quirk
> to just qcm6490 for now.
> 
> If someone thinks it should be qcom,sc7280-pmic-glink, please let me
> know :)
IMO it's best to continue using the "base soc" (which just so happened
to fall onto sc7280 this time around) for all compatibles, unless the
derivatives actually had changes

as far as firmware goes, I *think* CrOS doesn't even have PMIC_GLINK?
There are however WoA 7280 laptops which totally should have it.. Would
be nice to hunt some down and see if they report different stuff to
what's there on android firmware

Konrad

