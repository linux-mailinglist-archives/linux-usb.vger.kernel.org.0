Return-Path: <linux-usb+bounces-2540-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EC57E1029
	for <lists+linux-usb@lfdr.de>; Sat,  4 Nov 2023 17:01:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8F961C20A8B
	for <lists+linux-usb@lfdr.de>; Sat,  4 Nov 2023 16:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0453208A7;
	Sat,  4 Nov 2023 16:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L9p1U/n0"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6BA1173E
	for <linux-usb@vger.kernel.org>; Sat,  4 Nov 2023 16:00:58 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C7A4D47
	for <linux-usb@vger.kernel.org>; Sat,  4 Nov 2023 09:00:56 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50943ccbbaeso4368635e87.2
        for <linux-usb@vger.kernel.org>; Sat, 04 Nov 2023 09:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699113654; x=1699718454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eSOeu9EpYpJ/96EOikBzVA0+kSTrdPO9sr2PRTgzQXk=;
        b=L9p1U/n06CMh0kWNYLt8Frl0ERyF7jb3AtOG+1xuRLrcIaTXQBi3LkoWmd9RzI/2HU
         yo1RhAU+8ImATj8CbYSjkNz6F02PpQsfx7V3kRl1Vsj4cfi8zDRuhRxAlp7f6P5zmaqO
         ge0/3pxqxu0m7XXDgIQljyLW/SKAJrAkKlYvZgMxH5/TN7RMyC9jUDTHqit1nA5xKtcS
         +poN0wtJsN7LNy+SAaJ3UdxBRmjUZuXLg/ffq0rOLp6QpsIeMp84qZ4VgD5oD/5bUoi8
         aWQT72q4m6xXjPyfTGMAVQZojmoGJiFA4NUImHbU7FfGdNH5epx6OD6SeUHX9EH54Tvf
         WNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699113654; x=1699718454;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eSOeu9EpYpJ/96EOikBzVA0+kSTrdPO9sr2PRTgzQXk=;
        b=MrXKrvFqrNCKsICVAgC4auPVynaPqz7CQs1DsFkpVHMuBBXVQ70elLFFUFdn6rKeYQ
         tPQHMQRgbC6lPDxzM1ECib2Sq7/YLKNJFNpvNNm4r2O4wbYipdDh32zMdZURCEi1I4nw
         GQOCsrROSzySVBxkBishgw4s03q6JRSGIoApnHwjcguZ2/lUceUVaNd0CPNo1VQVFhDM
         Wgf5iYQ8l5rxrSB5qKLP/aN4cLPTR4Eiai3tLir6teCpsYHP/0a7Hd5pr4/7hN+JzS8i
         WBIcK745e2RvKRqfXyEKub6ZU8MXngzOwU7d0EXbf3NLBQpsdqrcI2avnjwg0uemnvVx
         iaKA==
X-Gm-Message-State: AOJu0YwASHqYKBevkiWWpT3elS8RNsFPyhR1NUnDTU89wGMkpU4KYPgd
	PMQ/rsGSTeX5H0j1QPkfsCLRLw==
X-Google-Smtp-Source: AGHT+IEPFqS5qonFd1aRtub85qdr3gusVqvFUojB09NVZXRDEniZKfoVgllNgXVG5nE7usZpKuyvZg==
X-Received: by 2002:ac2:5306:0:b0:507:9d5d:5901 with SMTP id c6-20020ac25306000000b005079d5d5901mr17819048lfh.7.1699113654226;
        Sat, 04 Nov 2023 09:00:54 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id d13-20020adfe2cd000000b0032ddf2804ccsm4683537wrj.83.2023.11.04.09.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Nov 2023 09:00:53 -0700 (PDT)
Message-ID: <cf553cd8-45f8-4a61-b016-69e7a80eee9f@linaro.org>
Date: Sat, 4 Nov 2023 16:00:52 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/8] usb: dwc3: core: Register vendor hooks for dwc3-qcom
Content-Language: en-US
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, quic_ppratap@quicinc.com,
 quic_jackp@quicinc.com, quic_wcheng@quicinc.com,
 Andy Gross <agross@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20231017131851.8299-1-quic_kriskura@quicinc.com>
 <20231017131851.8299-3-quic_kriskura@quicinc.com>
 <e700133b-58f7-4a4d-8e5c-0d04441b789b@linaro.org>
 <5ef66bdc-9645-4bbe-8182-baa7fe4c583a@quicinc.com>
 <3be5e95f-85d2-4abf-a8b4-18b019341602@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3be5e95f-85d2-4abf-a8b4-18b019341602@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/11/2023 18:49, Krishna Kurapati PSSNV wrote:
> 
> 
> On 11/4/2023 12:15 AM, Krishna Kurapati PSSNV wrote:
>>
>>
>> On 11/3/2023 8:44 PM, Bryan O'Donoghue wrote:
>>> On 17/10/2023 14:18, Krishna Kurapati wrote:
>>>>
>>>> The following are the requirements aimed in this implementation:
>>>>
>>>> 1. When enum in device mode, Glue/core must stay active.
>>>>
>>>> 2. When cable is connected but UDC is not written yet, then glue/core
>>>> must be suspended.
>>>>
>>>> 3. Upon removing cable in device mode, the disconnect event must be
>>>> generated and unblock runtime suspend for dwc3 core.
>>>>
>>>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>>>
>>
>> Hi Bryan,
>>
>>> What happens to this code if you
>>>
>>> static int count;
>>>
>>> 1. sleep in dwc3_probe for 10 milliseconds
>>> 2. return -EPROBE_DEFER
>>> 3. if count++ < 5 goto 1
>>>
>>> i.e. if we simulate say waiting on a PHY driver to probe in dwc3_probe()
>>>
>> The vendor hooks are used in __dwc3_set_mode and role_switch_set calls 
>> in core and drd files respectively. These are invoked only if we are 
>> OTG capable. The drd_work is initialized in core_init_mode which is 
>> called at the end of dwc3_probe. If dwc3_probe fails and gets deferred 
>> before that, none of the vendor hooks will be fired and 
>> dwc3_qcom_probe is also deferred.
>>
>> However I see that if core_init_mode fails (the cleanup is already 
>> done in drd to prevent set_role from getting invoked already),  I need 
>> to cleanup vendor hooks in error path of dwc3_probe().
>>
>>> and what happens if we introduce a 100 millsecond sleep into 
>>> dwc3_qcom_probe() - and run a fake disconnect event from 
>>> dwc3_qcom_probe_core() directly ?
>>>
>>> In other words if make it that dwc3_probe() completes and struct 
>>> dwc3_glue_ops->notify_cable_disconnect() fires prior to 
>>> dwc3_qcom_probe_core() completing ?
>>>
>>> i.e. I don't immediately see how you've solved the probe() completion 
>>> race condition here.
>>>
>> Just wanted to understand the situation clearly. Is this the sequence 
>> you are referring to ?
>>
>> 1. dwc3_probe is successful and role switch is registered properly.
>> 2. added delay after dwc3_qcom_probe_core and before interconnect_init
>> 3. Between this delay, we got a disconnect notificiation from glink
>> 4. We are clearing the qscratch reg in case of device mode and 
>> un-registering notifier in case of host mode.
>>
>> If so, firstly I don't see any issue if we process disconnect event 
>> before qcom probe is complete. If we reached this stage, the 
>> clocks/gdsc is definitely ON and register accesses are good to go.
>>
>> If we are in host mode at this point, we would just unregister to 
>> usb-core notifier and mark last busy. If we are in device mode, we 
>> would just clear the hs_phy_ctrl reg of qscratch. After the 100ms 
>> delay you mentioned we would call dwc3_remove anyways and cleanup the 
>> vendor hooks. But is the concern here that, what if we enter 
>> runtime_suspend at this point ?
>>
> 
> Just to clarify one more thing. The probe completion requirement came in 
> because, before the device tree was flattened, dwc3-qcom and core are 
> two different platform devices. And if the dwc3 core device probe got 
> deferred, dwc3-qcom probe still gets successfully completed. The glue 
> would never know when to register vendor hook callbacks to dwc3-core as 
> it would never know when the core probe was completed.
> 
> That is the reason we wanted to find out accurate point where core probe 
> is done to ensure we can properly register these callbacks.

Are you saying to you require/rely on both of these series being applied 
first ?

[1]: 
https://lore.kernel.org/all/af60c05b-4a0f-51b8-486a-1fc601602515@quicinc.com/
[2]: 
https://lore.kernel.org/all/20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com/

Must be, nothing applies for me in this series.

