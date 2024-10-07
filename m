Return-Path: <linux-usb+bounces-15826-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F5C993790
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 21:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A98FB22A52
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 19:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E520D1DE3BE;
	Mon,  7 Oct 2024 19:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fYtdG1vy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AA91DDC07
	for <linux-usb@vger.kernel.org>; Mon,  7 Oct 2024 19:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728330332; cv=none; b=s49ayHoHxPD/Vju72SA5zl+99duEX0xYZPx92TNpbCtM81iZ8UksChiiK+OsfPLYjJ8b2lLjA7DDuRuGG8gt4ooE/g9bGzEjd8yczxe2BpsQHR+hREzKoWEEhwmnWUwYU73KZv2faDf8kZbgu6kCpx99bw/UqyahU4sS+T0Qfwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728330332; c=relaxed/simple;
	bh=sd0aljgsaALafyniTMZ4sWCjd/ZVf8X3lzbQiOrrN5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qj8X7kUoB5D+CZ8+2+tk6VkdZovbrc/1y8ahCQrKvxxbRiUMBZksNQwcGhG+WptUcdqtu3R67FBglWF02Ov5YR6e65JgE5LbTjnDWQWSgjr1UBV4jfZadR5iVzFz3cKHNhf1ZoxcEEZvrxyr4MI7SyK2z4ZFR553muZDPaIQTA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fYtdG1vy; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71df04d3cd1so2486820b3a.2
        for <linux-usb@vger.kernel.org>; Mon, 07 Oct 2024 12:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728330329; x=1728935129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9RAFxs3FuDQybYi4PjaJjTbRO950dbl8DCm6Tr00teg=;
        b=fYtdG1vyp/99hwyAdq7J1cQoM5dUNFL2P/W0ygdfqJ7dCGJO8GmVUm3NZ6lzJ/8gOj
         6oSm1h3cKF6UelLU/oeNAd4nKgX1NfEyKcYLeqxQ2U1yMbir/XtJbHn1e8oHZo8Q7Gy9
         nzk2vyp0OHKHmYDikKSo1c3imKLgMKp8U5AHXu3uLPfpy3H3Ayj9vBDsJtEdiWgQMk3E
         BCAh+vcDftRilQ+F7nL71eor9wzqEcnwYn5fhcgeZ7FC/aqv757F03LAeNy8O1Ir7TbF
         JIBA6Hzg1JtcBbDILxQfPPa2efZ1oQYwga7pqVhsW1gVnHNjQgDV9RJW9Lc3YIaDlT+z
         aWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728330329; x=1728935129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9RAFxs3FuDQybYi4PjaJjTbRO950dbl8DCm6Tr00teg=;
        b=N1PfixOZgGIU+7hTjnirg1AXPktrgOky0RuEKbbVS6CfQLcA5c9zHe4gt2E8niFdkO
         z8RKsNJqO3JMMYMsq3pLNvh5+CQ5Kgo03N3IGOAa3LBPcE6EXuF/srEtsrfaEeOuDyE/
         90aHJBdd1tDo1MX10+aWDCAxgDRfC4yyCxHzeYQ+ekNr19+odbJo0jkFV5xy6apeST4W
         L+aRlkHwAJ+t7blq6/RyDroForI5rchdKMjhRNdNm8L77MCDlsQ/iZxVNhPvXCrEEaPb
         zP4z5rL4JP5GZh1e9adtFL8DnTs/OBlJKnE4LYscPWs/xI0uiT8+kl0h2wyXBc0L+m+1
         A5pA==
X-Forwarded-Encrypted: i=1; AJvYcCUKU11RcVt18vO+16ZqBo4jbpgCJvICunFOlfn/9Y0GzO6SwzpMpQSZkCSTc1ehlcd9vOWfnULZDlY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk+6OPrO55s3yjMzLX63DgGBqKRvFum/4ZD1FW6jtHXTKI56Ux
	+wEIG8BiCgHq846flEbyTGR3B0MZzcHZlaGSzMiaUd9XYhVMPo/gsqTvD+H8eA==
X-Google-Smtp-Source: AGHT+IE+8305zjEby0xUHVDvQfeWsVamXB80fifa4YnEGSry9kBCCv/Q5DTuthbwK2fIiDc8iCIxBg==
X-Received: by 2002:a05:6a00:1819:b0:70d:14d1:1bb7 with SMTP id d2e1a72fcca58-71df183dd06mr15074639b3a.28.1728330328510;
        Mon, 07 Oct 2024 12:45:28 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e14:7:8fc0:b8ec:3cbf:9187? ([2a00:79e0:2e14:7:8fc0:b8ec:3cbf:9187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccd084sm4771943b3a.51.2024.10.07.12.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 12:45:28 -0700 (PDT)
Message-ID: <5e1a6c31-2e7e-414f-b585-87df483d6a7a@google.com>
Date: Mon, 7 Oct 2024 12:45:26 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] dt-bindings: connector: Add property to set pd timer
 values
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, kyletso@google.com, rdbabiera@google.com,
 Badhri Jagan Sridharan <badhri@google.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240911000715.554184-1-amitsd@google.com>
 <20240911000715.554184-2-amitsd@google.com>
 <ae520641-38a4-405e-89d0-e0921dfc7cff@linaro.org>
 <2dab1111-49fd-43b7-8624-2d61b3d546b1@google.com>
 <ce64e869-4a52-4da3-b95e-d60a0247006a@linaro.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <ce64e869-4a52-4da3-b95e-d60a0247006a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

On 9/27/24 12:48 AM, Krzysztof Kozlowski wrote:
> On 17/09/2024 03:59, Amit Sunil Dhamne wrote:
>> Hi Krzysztof,
>>
>> Thanks for the review!
>>
>> On 9/16/24 9:05 AM, Krzysztof Kozlowski wrote:
>>> On 11/09/2024 02:07, Amit Sunil Dhamne wrote:
>>>> This commit adds a new property "pd-timers" to enable setting of
>>>> platform/board specific pd timer values for timers that have a range of
>>>> acceptable values.
>>>>
>>>> Cc: Badhri Jagan Sridharan <badhri@google.com>
>>>> Cc: linux-usb@vger.kernel.org
>>>> Cc: devicetree@vger.kernel.org
>>>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>>> Please work on mainline, not ancient tree. You cannot get my CC address
>>> like that from mainline.
>> I was working off gregkh's tree on usb-next branch as that's suggested
>> for USB development.
>>
>>
>>> It's not possible. So either you don't develop
>>> on mainline or you don't use get_maintainers.pl/b4/patman.
>>>
>> The above branch and even the tree on Linus' master branch has you
>> listed as a maintainer
>> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/MAINTAINERS#n17181).
>> I guess that's why the get_maintainers script probably returned your
>> email id when I ran it. Please let me know if I missed something :).
> You really just skimmed over my email... I know how maintainers work.
>
> So I REPEAT: You cannot get this email address you Cced. Point me to the
> line in your tree having such email. The one here:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/MAINTAINERS#n17181
>
> does not have it.
Sorry I misunderstood. Will fix it henceforth in subsequent work.
>>
>>>> ---
>>>>    .../bindings/connector/usb-connector.yaml     | 23 +++++++++++++++++++
>>>>    include/dt-bindings/usb/pd.h                  |  8 +++++++
>>>>    2 files changed, 31 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>>>> index fb216ce68bb3..9be4ed12f13c 100644
>>>> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
>>>> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>>>> @@ -253,6 +253,16 @@ properties:
>>>>    
>>>>        additionalProperties: false
>>>>    
>>>> +  pd-timers:
>>>> +    description: An array of u32 integers, where an even index (i) is the timer (referenced in
>>>> +      dt-bindings/usb/pd.h) and the odd index (i+1) is the timer value in ms (refer
>>> timer of what? OS behavior?
>> In the context of USB Type C Power Delivery (PD), timers are run on the
>> typec protocol driver
>> (usb/typec/tcpm/tcpm.c).
>> These are used to keep track of min/max or range of time required to
>> enter a PD state with the
>> goal of a successful USB typec capabilities negotiation.  Eg., the timer
>> PD_TIMER_SINK_WAIT_CAP (referred to as SinkWaitCapTimer in spec)would be
>> responsible to keep track of whether a power source sent us (as sink) PD
>> source capabilities pkts within 600ms (say), if yes, then we would
>> transition to the next state or do a state machine reset. USB PD 3.1
>> spec refers to these elements as timers and therefore referred to as
>> such here.
>>
>>
>>>> +      "Table 6-68 Time Values" of "USB Power Delivery Specification Revision 3.0, Version 1.2 " for
>>>> +      the appropriate value). For certain timers the PD spec defines a range rather than a fixed
>>>> +      value. The timers may need to be tuned based on the platform. This dt property allows the user
>>> Do not describe what DT is. We all know what DT properties allow.
>>> Instead describe how this relates to hardware or boards.
>>>
>>> All this is wrongly wrapped. See Coding style (and I am not telling you
>>> the value on purpose, so you will read the coding style) .
>>
>> Ack. Thanks for pointing it out, I will fix both the above in the next
>> revision.
>>
>>
>>>> +      to assign specific values based on the platform. If these values are not explicitly defined,
>>>> +      TCPM will use a valid default value for such timers.
>>> And what is the default?
>> Defaults are given in (include/linux/usb/pd.h). But I guess I should
>> have probably mentioned
>> that here.
>>
>>
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> I guess you want matrix here.
>> Yes, I should have. Though, I will be re-implementing this such that
>> each timer is represented
>> as a separate property based on Rob and Dmitry's suggestion in
>> https://lore.kernel.org/lkml/20240916163328.GA394032-robh@kernel.org/ .
>>
>>>> +
>>>>    dependencies:
>>>>      sink-vdos-v1: [ sink-vdos ]
>>>>      sink-vdos: [ sink-vdos-v1 ]
>>>> @@ -478,3 +488,16 @@ examples:
>>>>                };
>>>>            };
>>>>        };
>>>> +
>>>> +  # USB-C connector with PD timers
>>>> +  - |
>>>> +    #include <dt-bindings/usb/pd.h>
>>>> +    usb {
>>>> +        connector {
>>>> +            compatible = "usb-c-connector";
>>>> +            label = "USB-C";
>>>> +            pd-timers =
>>>> +                <PD_TIMER_SINK_WAIT_CAP 600>,
>>>> +                <PD_TIMER_CC_DEBOUNCE 170>;
>>> Incorporate it into existing example.
>>>
>> Ack.
>>
>>
>>>> +        };
>>>> +    };
>>>> diff --git a/include/dt-bindings/usb/pd.h b/include/dt-bindings/usb/pd.h
>>>> index e6526b138174..6c58c30f3f39 100644
>>>> --- a/include/dt-bindings/usb/pd.h
>>>> +++ b/include/dt-bindings/usb/pd.h
>>>> @@ -465,4 +465,12 @@
>>>>    	 | ((vbm) & 0x3) << 15 | (curr) << 14 | ((vbi) & 0x3f) << 7	\
>>>>    	 | ((gi) & 0x3f) << 1 | (ct))
>>>>    
>>>> +/* PD Timer definitions */
>>>> +/* tTypeCSinkWaitCap (Table 6-68 Time Values, USB PD3.1 Spec) */
>>> Please expand this a bit, so we won't have to reach to external sources.
>> Ack.
>>
>> I will incorporate all of your review comments.
>>
>> Since you are no longer maintaining the
>> "OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" component, please let
> Who said that? You CC wrong emails because either you work on ancient
> tree or you do not use tools like get_maintainers.pl or b4. You cannot
> get this email from proper process. It is not physically possible
> because that email is nowhere mentioned.
>
>> me know
>> if you'd still like to be CC'ed in the subsequent revisions.
>
> Damn, just use standard tools. You are not supposed to invent maintainers.
>
> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
>
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> </form letter>
>
> Best regards,
> Krzysztof

Thanks for the tips! I will make sure to follow these henceforth.

Regards,

Amit


