Return-Path: <linux-usb+bounces-24400-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EB8AC8BEB
	for <lists+linux-usb@lfdr.de>; Fri, 30 May 2025 12:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EAFB3A88A9
	for <lists+linux-usb@lfdr.de>; Fri, 30 May 2025 10:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4303221FCE;
	Fri, 30 May 2025 10:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MEXI23nf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD97E221566
	for <linux-usb@vger.kernel.org>; Fri, 30 May 2025 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748599882; cv=none; b=TVwwBBiwgRaNEvg0VOdOZE/Xd6a7lcfZ3yG+/nPiq89GgmPzrd1zwoGrIwzQJ8qlGXHwK9Lgp/RzhNmKhbiC0BGPTbjURUr98oWikhI1WbK48PMYeP9+ijCEoJJRmMdzaragBzuWSX8a9VqHooyF9G4cAqNiJdIsZYKTMuRFyZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748599882; c=relaxed/simple;
	bh=BtgiWbtyObg4xFKH7C8Tduzp8RP6HRLtefwrW+i2WLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZyKHxth40r2B8NIeexFywTlwNa/lcapnBb6d9ozgmsxSGej94VIrZLnAoSsDBnJYYghSMlljdMsTKK2Xz+Lp20yFBAzUrujyrckzuGTtagevMOm8oPdgeAq9AqJPh36sRFKnxaIJUvwo9enfuDZLzxdZSloDp4vKi9+h16oIK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MEXI23nf; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a37d24e607so1789451f8f.1
        for <linux-usb@vger.kernel.org>; Fri, 30 May 2025 03:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748599878; x=1749204678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w2uvJQQDga9gpIshIa1ROf0lj+l2p+xM+9sY9IixreE=;
        b=MEXI23nfGNOhAh4nJzWlci373SRWGwDGVyPXdMJxwL/Ug+KO78CEkPVilIyDSlnlF5
         sVQb8jplnd9SxGYWx+FhMCO/2e9jUZYhhnWk6V/7bq5FignpBE9uX+Wtzvz6PhSmJujr
         heFblOgB4L6DosbBoUap/t7RECiKKHSjw1idHg+MNY/oODXqAdngmgkZVsIHVHSchvXG
         DJvoC8A8zaL0stufC75yQ5nE2/MjswI2QfcgVI35/7pOJDprR6Ir9Y9i3tttN9q5GdgV
         QnDfm5iiaepyaaLshzp71BAsnmPuO67/mOVEhXAIltyjlgaY5fBetGeK5VkF1Mt4HqSi
         gLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748599878; x=1749204678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w2uvJQQDga9gpIshIa1ROf0lj+l2p+xM+9sY9IixreE=;
        b=O4Ff+OK2346mDIOvl8mOyoxul5Fo6yh17hnlwyjnLIPht78rI9fMqwaMztkJvku6rp
         9rUs4GCOaBwRRFmEVq0WAcGozS0rolCmztWeXSyjavaBdlcLJbQuy+7M9hGXsv/cxYVP
         jnJgoeduqluqSfcaNmkUhu/dWxVAhszlB9OGCFroq240+qLC0Vwg2W+88UA6fL0aDxuz
         n4WT5boWUiKz0VP8sOuftsJLfXlMph3w4VMMGc6MP9u41Q3MT9+5nyZcLcIDw6S3OPJC
         Z8UaOGUbkzllUGpyfbveJRuLl+4iY1BKr7ECjYFW+s338oGNgtYWy437zK3SqqAdSkYn
         oTsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDXW7lnxYrmZWnCDGP9xIAy1ohcA0lk6ZQQb/pI+KzEAtJXKfQrY6iwpGfcm/quXgfWbD7gNOQVOk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkfPYRXXZQhfk4zN9b+Z3PwOVona3imyuJ0tRnOwlkKFFpwzre
	Y7AKY/Nj/UDgGOi4FoRS9XnEa715mksSrfyLgdLYMOrB3lwZKK3B/bV1xXWleIR7jSM=
X-Gm-Gg: ASbGnctAScvcZ44mjsFXn5jhnpE+Qjl0UWPMnsgiRcN5S7XKrzO5NN0JfFMYMQjC2T8
	gJvHBZkDMsE7k4s/+Omdi0iodOLPkvGuIOWxFRjo5h93aG91RgiakXK432U/X3J9+ElJZ9I40AC
	SMg7oN1B+LnvE9cwnTaCyxYMwCprvfzQxPvQTD2bML9bqC3Dr+sW2tohbKQt2LESvr22wEv+f3g
	w4/9r9DrsINEp464SlneatbOOhLKft0HNozJFRGKb4+1X/BYYw2xtKL+dFo2oQI6MBTGlFVVHxB
	OwWM7qbjFWY2TcWzGKodFYxHyfpLUGJ+cLe7Uu6eVP4eC7up/tX4HH7hQUbPBSVlzUNDkUYd8D/
	xULWLeJSYzPMpqB8R
X-Google-Smtp-Source: AGHT+IEGpK9wxifZBoINj4a9WAqhHPQBuG6oOIYEnwaBOMGLx5F2IGQmU5aCTNH4ODtjQn5uXNaecw==
X-Received: by 2002:a05:6000:22c6:b0:3a0:b8b0:43ff with SMTP id ffacd0b85a97d-3a4f89a7a30mr1169064f8f.14.1748599878104;
        Fri, 30 May 2025 03:11:18 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8ed27sm13971185e9.2.2025.05.30.03.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 03:11:17 -0700 (PDT)
Message-ID: <7f001134-e099-492d-8ce5-4122d83a3de3@linaro.org>
Date: Fri, 30 May 2025 11:11:15 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] power: supply: qcom_battmgr: Add charge control
 support
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
 David Collins <david.collins@oss.qualcomm.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 kernel@oss.qualcomm.com, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <497BF3hThnrmYe-YHKmdOyZwdjP3ivm1hFYDDy3-HkSOvkCOMVSkokyhb859mcTarGb55Go5nJLfgsc553u7ZA==@protonmail.internalid>
 <20250530-qcom_battmgr_update-v2-5-9e377193a656@oss.qualcomm.com>
 <8b396edf-e344-47e9-b497-3f7fb35783ed@linaro.org>
 <spfJeVsefz_dTMqOG1lKaUye4O8Jz-RSdLCGtvPIrDMwKC9rxNNY_zKkBFVhdrPMheNf2WMkPsv7ElI4uhBfxg==@protonmail.internalid>
 <3df56548-49ea-498c-9ee3-b7e1d2d85d2e@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3df56548-49ea-498c-9ee3-b7e1d2d85d2e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/05/2025 10:37, Fenglin Wu wrote:
> Thanks for reviewing the change!
> 
> On 5/30/2025 4:48 PM, Bryan O'Donoghue wrote:
>> On 30/05/2025 08:35, Fenglin Wu via B4 Relay wrote:
>>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>>
>>> Add charge control support for SM8550 and X1E80100. It's supported
>>> with below two power supply properties:
>>>
>>> charge_control_end_threshold: SOC threshold at which the charging
>>> should be terminated.
>>>
>>> charge_control_start_threshold: SOC threshold at which the charging
>>> should be resumed.
>>
>> Maybe this is very obvious to battery charger experts but what does
>> SOC mean here ?
>>
>> Reading your patch you pass a "int soc" and compare it to a threshold
>> value, without 'soc' having an obvious meaning.
>>
>> Its a threshold right ? Why not just call it threshold ?
>>
> "SOC" stands for battery State of Charge, I will rephrase the commit
> text for better explanation.
>>>
>>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>> ---
>>>    drivers/power/supply/qcom_battmgr.c | 256
>>> ++++++++++++++++++++++++++++++++++--
>>>    1 file changed, 248 insertions(+), 8 deletions(-)
>>>
>>> -    if (battmgr->variant == QCOM_BATTMGR_SC8280XP)
>>> +    if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
>>> +            battmgr->variant == QCOM_BATTMGR_X1E80100)
>>
>> Please run your series through checkpatch
>>
> I actually did that before sending the patches out. I run checkpatch
> with below two commands and I saw no issues:
> 
> git format -1 xxxx --stdtout | ./script/checkpatch.pl -
> 
> b4 prep --check
> 
> Can you let me know what specific command that you ran with it?

do $KERNELPATH/scripts/checkpatch.pl --strict $file;
codespell $file;

> 
>> 0004-power-supply-qcom_battmgr-Add-state_of_health-proper.patch has no
>> obvious style problems and is ready for submission.
>> CHECK: Alignment should match open parenthesis
>> #95: FILE: drivers/power/supply/qcom_battmgr.c:521:
>> +    if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
>> +            battmgr->variant == QCOM_BATTMGR_X1E80100)
>>
>>>
>>> +static int qcom_battmgr_set_charge_start_threshold(struct
>>> qcom_battmgr *battmgr, int soc)
>>> +{
>>> +    u32 target_soc, delta_soc;
>>> +    int ret;
>>> +
>>> +    if (soc < CHARGE_CTRL_START_THR_MIN ||
>>> +            soc > CHARGE_CTRL_START_THR_MAX) {
>>> +        dev_err(battmgr->dev, "charge control start threshold exceed
>>> range: [%u - %u]\n",
>>> +                CHARGE_CTRL_START_THR_MIN, CHARGE_CTRL_START_THR_MAX);
>>> +        return -EINVAL;
>>> +    }
>>
>> 'soc' is what - a threshold as far as I can tell.
> 
> I will update it with a more meaningful name
> 
>>>
>>>        if (opcode == BATTMGR_NOTIFICATION)
>>>            qcom_battmgr_notification(battmgr, data, len);
>>> -    else if (battmgr->variant == QCOM_BATTMGR_SC8280XP)
>>> +    else if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
>>> +            battmgr->variant == QCOM_BATTMGR_X1E80100)
>>>            qcom_battmgr_sc8280xp_callback(battmgr, data, len);
>>>        else
>>>            qcom_battmgr_sm8350_callback(battmgr, data, len);
>>> @@ -1333,7 +1560,8 @@ static void qcom_battmgr_pdr_notify(void *priv,
>>> int state)
>>>    static const struct of_device_id qcom_battmgr_of_variants[] = {
>>>        { .compatible = "qcom,sc8180x-pmic-glink", .data = (void
>>> *)QCOM_BATTMGR_SC8280XP },
>>>        { .compatible = "qcom,sc8280xp-pmic-glink", .data = (void
>>> *)QCOM_BATTMGR_SC8280XP },
>>> -    { .compatible = "qcom,x1e80100-pmic-glink", .data = (void
>>> *)QCOM_BATTMGR_SC8280XP },
>>> +    { .compatible = "qcom,x1e80100-pmic-glink", .data = (void
>>> *)QCOM_BATTMGR_X1E80100 },
>>> +    { .compatible = "qcom,sm8550-pmic-glink", .data = (void
>>> *)QCOM_BATTMGR_SM8550 },
>>
>> Please separate compat string addition from functional changes.
>>
> The compatible string "qcom,sm8550-pmic-glink" has been present in the
> binding for a while and it was added as a fallback of "qcom,pmic-glink".
> The battmgr function has been also supported well on SM8550 for a while.
> The change here is only specifying a different match data for SM8550 so
> the driver can handle some new features differently. Does it also need
> to add it in a separate change? If so,  this change would be split into
> following 3 patches I think:
> 
> 1) add QCOM_BATTMGR_SM8550/X1E80100 variants definition in
> qcom_battmgr_variant.
> 
> 2) add compatible string with corresponding match data for SM8550.
> 
> 3) add the charge control function support.

For preference compats and functional change should be disjoined IMO.

---
bod

