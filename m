Return-Path: <linux-usb+bounces-5190-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDF5830CAF
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 19:23:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42EF71C21D29
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 18:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDDB2374E;
	Wed, 17 Jan 2024 18:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EEiNw06V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DE522EFF
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 18:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705515811; cv=none; b=gWlHowO3Kg9P8UugDth8x7ib8J/yft7gk+XWUDCPmsHoQ+JFFTMudoom8o1owc4W5iNHEHUS28mpnXLynfuntMxqQjlu3IX2+JaczRq/8apsJkvRL26xr5s0Oa8GWE+RLhYtT79qczEBHB7Y32OI47U+EnQUh869n8XE6stCqv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705515811; c=relaxed/simple;
	bh=g/OQTJucCk9XRtmrjpM1TZW3zy5eX6m6El/5+HeFSfM=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=M9bhzVEOnxN+DJEGyqEWzkeonOt6cffmxYszPHcVDiMYXd5NnMw34wnXeIBjPMxxcoAx/qnWjpTiXVa89x5gaWMeHkX24H6c5qxS4EfwYTWcihEauR/gPddGha1i/7zuWP6/pLRomzVeySBenASjujDIglfPuRBUsHsYinviCTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EEiNw06V; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-336c8ab0b20so9973932f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 10:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705515808; x=1706120608; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8TFf1Vx3P27CdjSDq7jNiUNW+cNOvMLpoL0yHWCOqRQ=;
        b=EEiNw06VIxxOaHmADl09cfKPxTIjifDEbC6Ug24ylpe7N0zcAR5S/gW5CBxxvcMOIZ
         pZjYO2+rYT3jkT91DViUfloUgYDCDZ2caUB9KxCXvQ9fs2bcRqHOMGVz2E9bklF3C0qI
         q/+oJS/eYlLJwm5rka/ErEc6UaLRnLjJ45w2CHt+QU6Q6vUeABgvzQbAOxymMnJn0l/O
         kVYzPmoEz27QRV4yZgjBjBrRcMRfp97u/RnR3Dq0Flf1Ne0QAJ36oROMLQ3HQ1TQa8+V
         VVmhrB1xIaMMVNiAxcafO/dhsfmgp1fNq6L00W3ndnVchaocHhdUN0ZfAfyZIRvWaD9m
         0M0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705515808; x=1706120608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8TFf1Vx3P27CdjSDq7jNiUNW+cNOvMLpoL0yHWCOqRQ=;
        b=ahcNj/246cfj21TvYh2GtBDuaRH+jAvxI2dzzhMwh4jUQY0CouyHxnFJo23C1cSk43
         pID7ML5iOja8xoZUR+H8diSvzbMFk52bWl+6Aidrr7VqRJZGN/VVoZJzbSJRKlWj05Mz
         /+zixJsyUS0RPy8Zx2S0EOCmMWpvdI+TOYPVSE9Q7v9QJ8nSxhxUoRidwzz8o+iFCGpi
         EIlvFB6wONLVQwaNeoNqJqdbmjbzhQaKHcqu1RdmFYEmuFA3URz7CMR3hznqfwCdCJHR
         iOqH+1cq3nEdPBu4UkrH8wqcwW8qN1oRtRDct+7C4iMrFCMvcnhANXnTJySVO1mBgY6f
         AnLA==
X-Gm-Message-State: AOJu0YxkMNlmukuY4vl6yvWEB1VafQuaP7PugYUvzx8dIOXfI4CakYVh
	uCPrX4cgoW2v8HLb65cFM1gBa0AQABks4Q==
X-Google-Smtp-Source: AGHT+IHYWffLkxrJLysqpwRplgajEK57fm4ZpJxRNz3jEiJuZEiJGCm3fO2YWVnBx5eJmxoVP/FjCA==
X-Received: by 2002:adf:f68c:0:b0:337:bfbc:881f with SMTP id v12-20020adff68c000000b00337bfbc881fmr1617032wrp.61.1705515807683;
        Wed, 17 Jan 2024 10:23:27 -0800 (PST)
Received: from [192.168.100.86] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id n7-20020adff087000000b00337bb0f370dsm2224452wro.40.2024.01.17.10.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 10:23:27 -0800 (PST)
Message-ID: <4c9571d4-08b8-45e6-8c74-5b864ddba490@linaro.org>
Date: Wed, 17 Jan 2024 18:23:26 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] arm64: dts: qcom: pmi632: define USB-C related
 blocks
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
 <20240113-pmi632-typec-v2-13-182d9aa0a5b3@linaro.org>
 <1d0d325d-d15e-4e86-b8e3-9f91b99e78bf@linaro.org>
 <CAA8EJpo7qH43FyvO-N9vFH=6K3rMdPpnGp9w6pGW2cz4bMK+0g@mail.gmail.com>
 <28e019ce-7612-4b10-8068-17c3fef4dba8@linaro.org>
 <CAA8EJpoXUMehrcf8sXKPhk7qb4SGXT960SUFHX5AUt1wxxHepw@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAA8EJpoXUMehrcf8sXKPhk7qb4SGXT960SUFHX5AUt1wxxHepw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/01/2024 18:05, Dmitry Baryshkov wrote:
> On Wed, 17 Jan 2024 at 19:23, Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
>>
>> On 15/01/2024 10:43, Dmitry Baryshkov wrote:
>>> On Mon, 15 Jan 2024 at 12:00, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>>
>>>> On 13.01.2024 21:55, Dmitry Baryshkov wrote:
>>>>> Define VBUS regulator and the Type-C handling block as present on the
>>>>> Quacomm PMI632 PMIC.
>>>>>
>>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/pmi632.dtsi | 30 ++++++++++++++++++++++++++++++
>>>>>    1 file changed, 30 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/pmi632.dtsi b/arch/arm64/boot/dts/qcom/pmi632.dtsi
>>>>> index 4eb79e0ce40a..d6832f0b7b80 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/pmi632.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/pmi632.dtsi
>>>>> @@ -45,6 +45,36 @@ pmic@2 {
>>>>>                 #address-cells = <1>;
>>>>>                 #size-cells = <0>;
>>>>>
>>>>> +             pmi632_vbus: usb-vbus-regulator@1100 {
>>>>> +                     compatible = "qcom,pmi632-vbus-reg", "qcom,pm8150b-vbus-reg";
>>>>> +                     reg = <0x1100>;
>>>>> +                     status = "disabled";
>>>>> +             };
>>>>> +
>>>>> +             pmi632_typec: typec@1500 {
>>>>> +                     compatible = "qcom,pmi632-typec";
>>>>> +                     reg = <0x1500>;
>>>>> +                     interrupts = <0x2 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
>>>>> +                                  <0x2 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
>>>>> +                                  <0x2 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
>>>>> +                                  <0x2 0x15 0x03 IRQ_TYPE_EDGE_BOTH>,
>>>>> +                                  <0x2 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
>>>>> +                                  <0x2 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
>>>>> +                                  <0x2 0x15 0x06 IRQ_TYPE_EDGE_BOTH>,
>>>>> +                                  <0x2 0x15 0x07 IRQ_TYPE_EDGE_RISING>;
>>>> This differs from the downstream irq types:
>>>>
>>>> <0x2 0x15 0x0 IRQ_TYPE_EDGE_BOTH>,
>>>> <0x2 0x15 0x1 IRQ_TYPE_EDGE_BOTH>,
>>>> <0x2 0x15 0x2 IRQ_TYPE_EDGE_RISING>,
>>>> <0x2 0x15 0x3 IRQ_TYPE_EDGE_RISING>,
>>>> <0x2 0x15 0x4 IRQ_TYPE_EDGE_BOTH>,
>>>> <0x2 0x15 0x5 IRQ_TYPE_EDGE_RISING>,
>>>> <0x2 0x15 0x6 IRQ_TYPE_EDGE_RISING>,
>>>> <0x2 0x15 0x7 IRQ_TYPE_EDGE_RISING>;
>>>
>>> I must admit, I copied the IRQs from the pm8150b rather than from the
>>> vendor kernel.
>>>
>>> Bryan, any idea which set of flags is more correct?
>>
>> My € says 1:1 with the downstream pmi632.dtsi
>>
>> qcom,typec@1500 {
>>       reg = <0x1500 0x100>;
>>       interrupts = <0x2 0x15 0x0 IRQ_TYPE_EDGE_BOTH>,
>>                    <0x2 0x15 0x1 IRQ_TYPE_EDGE_BOTH>,
>>                    <0x2 0x15 0x2 IRQ_TYPE_EDGE_RISING>,
>>                    <0x2 0x15 0x3 IRQ_TYPE_EDGE_RISING>,
>>                    <0x2 0x15 0x4 IRQ_TYPE_EDGE_BOTH>,
>>                    <0x2 0x15 0x5 IRQ_TYPE_EDGE_RISING>,
>>                    <0x2 0x15 0x6 IRQ_TYPE_EDGE_RISING>,
>>                    <0x2 0x15 0x7 IRQ_TYPE_EDGE_RISING>;
>>
>>       interrupt-names = "typec-or-rid-detect-change",
> 
> My 2c say that EDGE_BOTH doesn't make sense for or-rid-detect-change
> at least. It is an "or" of several _pulse_ interrupts, so there is no
> need to detect the falling edge.
> 
>>                         "typec-vpd-detect",
> 
> both, correct in both cases
> 
>>                         "typec-cc-state-change",
> 
> pulse interrupt, raising.
> 
>>                         "typec-vconn-oc",
> 
> It is a 'level' interrupt, so we probably want to detect both rising
> and falling edges.
> 
>>                         "typec-vbus-change",
> 
> "pulse" interrupt => rising, not both, correct in PM8150B.
> 
>>                         "typec-attach-detach",
> 
> pulse interrupt, rising only.
> 
>>                         "typec-legacy-cable-detect",
> 
> level, should be both as in PM8150B.
> 
>>                         "typec-try-snk-src-detect";
>> };
> 
> Pulse interrupt being raised when there is either successful or
> unsuccessful try.SNK or try.SRC.
> 
> So, after consulting the documentation, I believe the flags being a
> part of this patch (and in pm8150b.dtsi) are correct.
> 

Ah.

The pm8150b state is more logical and if you are using it on pmi632 with 
the driver we have, I'm inclined to think also more correct.

Testing > theory.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

