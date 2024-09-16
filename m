Return-Path: <linux-usb+bounces-15157-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D2097A9CC
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2024 01:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8FA328A786
	for <lists+linux-usb@lfdr.de>; Mon, 16 Sep 2024 23:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F03915DBB6;
	Mon, 16 Sep 2024 23:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MW1pMfep"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDBE1534E9
	for <linux-usb@vger.kernel.org>; Mon, 16 Sep 2024 23:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726530749; cv=none; b=lNbhsUrR3Dbt8xeHoiX/nnJ7mezRhXT1n5qeuz5y91qWlrnYk0Ew/clIjIPWcNDvI+y3/Hl4QdJENIlTSPTcqRn+6b8J7Vn3XvCkedlM3VHh8hgeqzLX3yP0HO76RZf6ojzSXimN0tyxQrCvVunWB8LFdy13jHB+iDmAIvYt690=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726530749; c=relaxed/simple;
	bh=iSw57K47VCkqhnLMo83NOu7bewfvRAA5tpz0HXWaZDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rygW6VT/PreQNZSoPNYfzyZ3h2C4UsCi/Au89NYcrvQcdtkd0eW3xjEBBsI9Nz7o14D7HpEm3wJSsSen/U2ThEuc5gtQNN0P0ObYTgj+UAcAkTqnb2ysF5m/E8rm+awo79TL6LfWnXeYhT6kWo4qhRB6fPvF2uE/7KfkSDhAvcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MW1pMfep; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71923d87be4so2621861b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Sep 2024 16:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726530746; x=1727135546; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jhmI1munFkauKvxlDNOHjZGlilZQzed2TX2YAHV/fM0=;
        b=MW1pMfepjjs7G0XgD0CF3Pn8HunyXwShtRC4aQn7wuc0coE0Heo5Gt3X/CwZB0jPUO
         23Bq3kVmaBBV9lmBQASWektr3aTwiDfEEHs7PtB1eg5ObGLuH5aX5jDf5IHy83qx+o+z
         qHUbUoRMhe6mHrK8ETWtDxPCEBf5pc1MFoEJp4BCEYAsbIshuskGLMCx0fUnhzfnIxFe
         pmoKl4e3qSdggdJVdEBcizhMadGAi9rba8QikMtUGSMGa1qXTAk0ZcgwHdqjHstvjaBr
         nODq/LNjmhBF8kW34SYMYtdIEJKBSddbxz4ROvfqknbA7PQQ8V6Nny4dIA0GDxRcjDGo
         yotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726530746; x=1727135546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jhmI1munFkauKvxlDNOHjZGlilZQzed2TX2YAHV/fM0=;
        b=kCqyCijfW4saMF0xOliBQmtWJqwzJEKLXB2IoUiOsbeKOZVt4TtWJ4nu7bBcL/qmmZ
         ygMxlsFaX0FYsEMzXOJpDsfRJPhBOJ7A+SOJNpSCCJhM5TAuooLidc/YwUEt2kyz/0b+
         kBmcOCWLJLHCUJmkK9HbYaVHZNDbPLdHAnNGMA5LdF+uJcAP2s5WgwIua+3l3lDi8s4X
         1+UlFU9j4nnB24wU3HHbuhZnOlEpYeMS74YZclqQaVNrt5iiLzKGaS+CgOfYyJxrbfC9
         5E3UZZo18/KEIn/grGZZtGeIzcMTwuNq2P0mgVoZi39yGACtAcFKPNnPwjJ7V9mXfg6Y
         2f3A==
X-Forwarded-Encrypted: i=1; AJvYcCXq+H0QuWSLGAXzFC7Payb13gZl6p+mpcy5daHtQPKhairNYNmqgYMbkIJAH4JwRxEOATuT1CED5kc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHjKAaFhk+kU90VHNDhYVaRU7RFUE60YFfcCJWdjeThhltiIko
	9+BNcsiftyb1adZjv8uxef8Vc5WKXXaDuuzhYzvu06yzKpurxw6SsZSz+MWkSQ==
X-Google-Smtp-Source: AGHT+IEFm5GbBV7eGS959qNUFceX3m6BxPtuPlzC44s9RWgt7WTQmWJWLiMigsTz8a+GlSr3zKoSaA==
X-Received: by 2002:a05:6a00:2d10:b0:717:9462:8bda with SMTP id d2e1a72fcca58-71936a5fb10mr19503102b3a.12.1726530745295;
        Mon, 16 Sep 2024 16:52:25 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e14:7:e1f6:9f31:2c3f:1500? ([2a00:79e0:2e14:7:e1f6:9f31:2c3f:1500])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944ae41dbsm4395563b3a.96.2024.09.16.16.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 16:52:24 -0700 (PDT)
Message-ID: <7ad81408-ee33-4b4a-b70e-0cebd8b46880@google.com>
Date: Mon, 16 Sep 2024 16:52:23 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] dt-bindings: connector: Add property to set pd timer
 values
To: Rob Herring <robh@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, kyletso@google.com, rdbabiera@google.com,
 Badhri Jagan Sridharan <badhri@google.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240911000715.554184-1-amitsd@google.com>
 <20240911000715.554184-2-amitsd@google.com>
 <5iakowhmqc3hbstmwbs6ixabr27hf2dfz2m4do4qvsrtgrdn72@r7xqawwgebla>
 <dc323138-3bbb-4e23-91f1-d6b80cb7bb72@google.com>
 <ascu5yztalk62fernydttkywnqemnmjlcflzdyfmt7dzuzngho@vvxrnvwhfdmk>
 <20240916163328.GA394032-robh@kernel.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <20240916163328.GA394032-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rob,

On 9/16/24 9:33 AM, Rob Herring wrote:
> On Fri, Sep 13, 2024 at 07:34:27AM +0300, Dmitry Baryshkov wrote:
>> On Thu, Sep 12, 2024 at 04:26:25PM GMT, Amit Sunil Dhamne wrote:
>>> Hi Dmitry,
>>>
>>> On 9/12/24 3:05 AM, Dmitry Baryshkov wrote:
>>>> On Tue, Sep 10, 2024 at 05:07:05PM GMT, Amit Sunil Dhamne wrote:
>>>>> This commit adds a new property "pd-timers" to enable setting of
>>>>> platform/board specific pd timer values for timers that have a range of
>>>>> acceptable values.
>>>>>
>>>>> Cc: Badhri Jagan Sridharan <badhri@google.com>
>>>>> Cc: linux-usb@vger.kernel.org
>>>>> Cc: devicetree@vger.kernel.org
>>>>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>>>>> ---
>>>>>    .../bindings/connector/usb-connector.yaml     | 23 +++++++++++++++++++
>>>>>    include/dt-bindings/usb/pd.h                  |  8 +++++++
>>>>>    2 files changed, 31 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>>>>> index fb216ce68bb3..9be4ed12f13c 100644
>>>>> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
>>>>> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>>>>> @@ -253,6 +253,16 @@ properties:
>>>>>        additionalProperties: false
>>>>> +  pd-timers:
>>>>> +    description: An array of u32 integers, where an even index (i) is the timer (referenced in
>>>>> +      dt-bindings/usb/pd.h) and the odd index (i+1) is the timer value in ms (refer
>>>>> +      "Table 6-68 Time Values" of "USB Power Delivery Specification Revision 3.0, Version 1.2 " for
>>>>> +      the appropriate value). For certain timers the PD spec defines a range rather than a fixed
>>>>> +      value. The timers may need to be tuned based on the platform. This dt property allows the user
>>>>> +      to assign specific values based on the platform. If these values are not explicitly defined,
>>>>> +      TCPM will use a valid default value for such timers.
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> Is it really necessary to use the array property? I think it's easier
>>>> and more logical to define corresponding individual properties, one per
>>>> the timer.
>>> Thanks for the review. The reason I did it this way was for
>>> convenience. If in the future someone else wants add a new timer,
>>> it'd be convenient to just add it as a new macro definition in pd.h
>>> rather than having to define a new property each time, especially
>>> if folks want to add more timers (scales better).
>>> There are 3 timers already and I am working to add a fourth in a
>>> follow up patch if the current RFC gets accepted.
>>>
>>> Please let me know what do you think?
>> I'd leave the decision to DT maintainers, but in my opinion multiple
>> properties scale better. Having a single value per property is easier to
>> handle rather than changing the tagged array.
> I agree. And it avoids what looks like a made up number space with the
> defines.
>
> And note that an array of tuples is a matrix in DT defined types, not
> an array.
Thanks for the review! I will incorporate the suggested comments in the
next revision by creating a "single value per timer" property.

Regards,

Amit

>
> Rob

