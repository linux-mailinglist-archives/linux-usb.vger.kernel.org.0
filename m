Return-Path: <linux-usb+bounces-24371-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFAAAC7118
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 20:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F5343BD2C4
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 18:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1687128E568;
	Wed, 28 May 2025 18:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lY9RG/+t"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E012828DF58
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 18:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748457757; cv=none; b=RBogY48F2a0m2wkemJvF5VOPg11+FASiIuOj6IjnJ7shLqGTjvLgo7bX8q4Rj3tMxUyExP+w0PB0TVzr3q8rjVpLnZi4TUiBUpRYtpFvN6pl2HBAgUhTBVljiJHBcTaqjr0+VME+aCXJ+s9R82pftleWdLb8010pjmEL3WwCDJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748457757; c=relaxed/simple;
	bh=0wEAblScT3Tn0syVJfG0tTwG1D/tnAHVu9ez28S8eI0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ormqy5vjEamIrLGGAA91goIyhyyuDf/g7SPafPBzJ6pxOojC77fuOiCWaMy1jENMUIdnu0mwy4OuZJzUW62TcFX6Ay8HLT6KxeOfsO2LKGkx+qaalFautvnobjRV6GKDIEApp4kWnKfJepXFCTsqiwk7hhHR8/oN0LRCrpPv6Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lY9RG/+t; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4064950cae4so17774b6e.2
        for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 11:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748457755; x=1749062555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/id1cw/2XOGpn9mnUKbEKyu15ax9JW7xw71uWNwiEC8=;
        b=lY9RG/+t8KnHHveGmFZUq28zEpsC6O9GHvHdi8+s7gYnVJ8FAretIYUjyYV1I7j0Gs
         HKt56Dmb7/1kmbHP1C/etWlDQvEQHZB91eAPXWgJqAlyUeIAWBVeASlDDf4RKbceK34g
         QT1a2wnVrjbIRh/Q6F3I9TIqIEMftpoBRaGl9IvXv95dL7gAEJMGHdmlsdPtABQCmZ3C
         vEmoi2yXGpriMOv5nYgsTjLya/qm2oVV5yykfUEDsyzZ55/C1Mh7u2JxqwGmdYIGc+L7
         P0kdueMH2IAQmFmW7xN81oB2rC7cdPLzsq8e9rlzXkl9ALj9S/OQE5ibsAmcS6cknC6F
         zH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748457755; x=1749062555;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/id1cw/2XOGpn9mnUKbEKyu15ax9JW7xw71uWNwiEC8=;
        b=VXTq3oJsnpSfSP1BYZnQBDsJzK++3x4lsj1xFYAj2fj5Gc41y3k1vdGB9LkBHee0TK
         ii6IwlzaYlqLyuSfYOEM1+kHD5xYw2ErBG0Q3NZPFHIVHvBrDL2LS03nfzlQNMjjTk/z
         DCLrLnH+ORSKrwrozw60Ahi6uPTFrKG6zBmuBulKBB1R78p/BpesgL/ZEWcSk8DJRBUQ
         2PJSefIiNRFUJ5TOyABMdI3lzJSXtRAqkujwYvtRt7pcLBLS1q1ZPn8rUealXSYSoTy6
         z19VmlGy18fDVs3qn9EzsK0slFTFuO6AxJTmBB7x1cH3exHL66fZhvM7N66gHANmjI3J
         SbHA==
X-Forwarded-Encrypted: i=1; AJvYcCXUhJP5KZSDjsjuYc7fqhpwPyCGyMoHwncP4itFaZac6L8MUIzFC2I+EwpA4Nq6ZE1sOPdbcu1Q1fg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaSmd6JBx2+ZEAqY/M8YEoU6OC77dCBuFforpuyHCTGBHPPeUv
	C6yz+Xib1U07QjODvv8AdGdCYjDCQ7e/KKmOvHx8SHKFPkCAOeKqaZd2RlT1gCTw2w==
X-Gm-Gg: ASbGncsyYXjQbhepe04KQ3gMoHE28UbKajuKIDGhSuGtnw3niSQZiOC3mvRmWTBYLv5
	VYbE4YUhKQ+NLNKmOwJfDvX6e6LuZMzYmuWMHPMEq1MPhBWNrZRkgDo16ASSA+NqmiyN+Jhh8Yo
	0Qj6ULfItDkHasreVGAWBvqNJ6EEbSo4yF3CdfGgb09+HMiq4fgaMbv/SlFO2s1RHwAqx8OJYC9
	1WUohTvRTocDykbNYSgJH2hKCfOajoMJGpaERtnAeE9mzExKGL/ztclfKKRb4+bvCCDxb6tYdMN
	eG1qQo2pSWaAkvhNAsy7oHywJhHIpBpXhLSLDPzVG3VhwE9jlgql1l3PXhaozBRi4Qh69PR+zxm
	tolrPqn+q5Gs0M2SjjYyqjbgmOauwzxmauQ==
X-Google-Smtp-Source: AGHT+IHs3twkSqT8CkQpqljahoHzRiFkiwtOJeHfFHvri9IID3VQA+sC09W4Uev9RI0/erZOqB2v6g==
X-Received: by 2002:a05:6808:4496:b0:406:6e89:49ba with SMTP id 5614622812f47-4066e894caemr38806b6e.33.1748457754629;
        Wed, 28 May 2025 11:42:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:4570:89a0:c0c2:d38c:e9e8:866d? ([2600:1700:4570:89a0:c0c2:d38c:e9e8:866d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-406654736d7sm276312b6e.36.2025.05.28.11.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 11:42:34 -0700 (PDT)
Message-ID: <9376817c-30f1-4ca1-afde-60ebdfd93f53@google.com>
Date: Wed, 28 May 2025 11:42:24 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: connector: extend ports property to
 model power connections
From: Amit Sunil Dhamne <amitsd@google.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Sebastian Reichel <sre@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@kernel.org>, Kyle Tso <kyletso@google.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-pm@vger.kernel.org,
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, peter.griffin@linaro.org
References: <20250507-batt_ops-v2-0-8d06130bffe6@google.com>
 <20250507-batt_ops-v2-1-8d06130bffe6@google.com>
 <20250514194249.GA2881453-robh@kernel.org>
 <b4a22161-8cab-4d76-a4b0-4bfd0d79cdc1@google.com>
Content-Language: en-US
In-Reply-To: <b4a22161-8cab-4d76-a4b0-4bfd0d79cdc1@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/20/25 1:10 PM, Amit Sunil Dhamne wrote:
> Hi Rob,
>
> Thanks for your response!
>
> On 5/14/25 12:42 PM, Rob Herring wrote:
>> On Wed, May 07, 2025 at 06:00:22PM -0700, Amit Sunil Dhamne wrote:
>>> Extend ports property to model power lines going between connector to
>>> charger or battery/batteries. As an example, connector VBUS can supply
>>> power in & out of the battery for a DRP.
>>>
>>> Additionally, add ports property to maxim,max33359 controller example.
>>>
>>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>>> ---
>>>  .../bindings/connector/usb-connector.yaml          | 20 +++++++++++------
>>>  .../devicetree/bindings/usb/maxim,max33359.yaml    | 25 ++++++++++++++++++++++
>>>  2 files changed, 38 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>>> index 11e40d225b9f3a0d0aeea7bf764f1c00a719d615..706094f890026d324e6ece8b0c1e831d04d51eb7 100644
>>> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
>>> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>>> @@ -181,16 +181,16 @@ properties:
>>>  
>>>    port:
>>>      $ref: /schemas/graph.yaml#/properties/port
>>> -    description: OF graph bindings modeling a data bus to the connector, e.g.
>>> -      there is a single High Speed (HS) port present in this connector. If there
>>> -      is more than one bus (several port, with 'reg' property), they can be grouped
>>> -      under 'ports'.
>>> +    description: OF graph binding to model a logical connection between a device
>>> +      and connector. This connection may represent a data bus or power line. For
>>> +      e.g. a High Speed (HS) data port present in this connector or VBUS line.
>>> +      If there is more than one connection (several port, with 'reg' property),
>>> +      they can be grouped under 'ports'.
>> 'port' and 'port@0' are equivalent. So you can't be changing its 
>> definition.
> Noted!
>
>
>> I'm not sure showing a power connection with the graph is the right 
>> approach.
> I want to provide some more context and rationale behind using this design.
>
> From a hardware perspective:
>
> The max77759/max33359 IC has Type-C port controller, charger, fuel gauge
> (FG) ICs. The Vbus from the connector goes to/from the TCPC and connects
> with the charger IP via circuitry & from there on to the battery. The FG
> is connected to the battery in parallel. As it can be seen that while
> these IPs are interconnected, there's no direct connection of the fuel
> gauge & the connector.
>
> For this feature, I am interested in getting the reference to the FG. As
> per graph description: "...These common bindings do not contain any
> information about the direction or type of the connections, they just
> map their existence." This works for my case because I just want the
> connector to be aware of the Fuel gauge device without imposing a
> specific directionality in terms of power supplier/supplied. This is
> also the reason why I didn't use
> "/schemas/power/supply/power-supply.yaml#power-supplies" binding.
>
>> We have a binding for that already with the regulator binding.
> I haven't explored the option of using regulator bindings. But in my
> case I am interested in fuel gauge and unfortunately, they're modeled as
> power_supply devices.
>
>
>>  
>> Perhaps the connector needs to be a supply. It's already using that 
>> binding in the supplying power to the connector case.
> Want to clarify, in this case you mean
> /schemas/regulator/regulator.yaml#*-supply$ right?
>
> Adding to my response above, the reason I don't want to impose a
> directionality in terms of supplier/supplied is that in case of USB Dual
> Role Port they're dynamic i.e., when USB is source, the power is
> supplied out of the battery (battery/FG will be supplier) and in case
> USB is sink, battery is supplied power. Whether the connector port is in
> source or sink role is determined on a connection to connection basis.
> Also, the knowledge of the supply direction is of no consequence for
> this feature.
>
>
> Please let me know what you think.
>
> Thanks,
>
> Amit


I wanted to follow up on my previous responses. Please let me know if
you have any further questions or concerns.

Thanks,

Amit


>
>> Rob

