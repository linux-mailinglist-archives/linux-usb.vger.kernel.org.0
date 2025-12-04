Return-Path: <linux-usb+bounces-31174-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D0ACA5691
	for <lists+linux-usb@lfdr.de>; Thu, 04 Dec 2025 22:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2930F30561FC
	for <lists+linux-usb@lfdr.de>; Thu,  4 Dec 2025 21:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E74357A27;
	Thu,  4 Dec 2025 21:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="djqu+2Vm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ECD357729
	for <linux-usb@vger.kernel.org>; Thu,  4 Dec 2025 21:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764882405; cv=none; b=exrM3FZvtick6kvzUs0+lZtvutlZkJqCDdkQXBx39hQ3i4Bxpjwg/ITfq9yfTlJSugE66dPq2wQWiv87Wv/KR4NEoHzRwfIano4AjuC7KROvmEwP/F2wOOU0vuq7qeCphYiNks9JR2iXylq5riF1dsPBLZ8jOB9gwYHUxW7zxNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764882405; c=relaxed/simple;
	bh=4gvVbQE7D0PuHRtcnXsG0f97rNAS/tXWI1ikykCyHu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J0bDH8RAUQFUd7oHZs5GRKTtwXFXu4x/SF+3ur2DZMFqHkGXTH2fKhyDmNG6+mdrPZKygwdHZZiWkKNY3mPU7yhHaLonK1ag78roYIFNzp1K3BgUP4lRocH8Ps3gzIjHIEaYX582K9dnOcvBadOTg7c0MXJv5lryBZXpGEi8UkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=djqu+2Vm; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so1641164b3a.3
        for <linux-usb@vger.kernel.org>; Thu, 04 Dec 2025 13:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764882402; x=1765487202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cEywpXmQqNwB/TS6CB+654YlLSBuSDJ8XZY6ihxAXlI=;
        b=djqu+2VmnFSX1eNkLgMcZSC76MyQqZJwykltkAiEH9TEDyBHxUj+wsPz+0imNjTNFh
         tArfYbDVmjQ0qhybhEQ/SvjVa0g/j+CO2nIOiMU+FM2a/a/51FRvgonQvVNoKxI2XB5b
         mjnfZeXwZLpra7NH/B9wtV2kPmMPVPvnhL6+bXNHGYUxGtsphW+Y6soTDEd13ESvp3+D
         ewgdb0+iGv5wQZwyWbRHD5Ninq8frMBqqGE8xM6Jki7K2SouOq5nTrzMTMYZJZUI7lh9
         56yvp1OJbSw6olQLmwzqwax6W94vovgJUIXIO3amNxs/L0VjFypqsbQy/FgLh5WRTHCT
         rjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764882402; x=1765487202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEywpXmQqNwB/TS6CB+654YlLSBuSDJ8XZY6ihxAXlI=;
        b=ImpEtSn947H4XInmjZFObNTgOHK1f1WUCyc/tsJlVpqN6W/8SQz7egYxGO3/UmZnHw
         QV7R6kZTzmCArSQWKQWihb86EQak6kGOOy5JlConr6a4jajIL02sT0ot9yTNaCAhaTKm
         C4q44YimJ74JJtwpg52bFpIltFnwy6XTafMraF0oRdht4kgLIREm5Xt7CClYcSca4mdt
         QMha6s0+iBwf66uIZ/Mlk2FD2/w3kmYPgM7ciT43aZ+1baMxa788bvNlHLzLNc3nB1W2
         oOUfwoAKJawGe3LuX10wi0dOi7mXVj9c2qOG/GAQtdiUHHyYStfZ4Zy/ONT6/Lx6AD+I
         7ibg==
X-Forwarded-Encrypted: i=1; AJvYcCXWm/Qyr3zsMFmUB2Ps5qSKWw41RKxOhieB2Hny6fs407Bt1g/H7Gri0QzC9bRNh46KBb3W4ZG4WT4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzp8UVNZHoaojbTKmooVCfKLBZGBwzkqItn18KwTk7BIlp9rt/
	V/X4UxeLKf/OtYJwrTy3cuDxH3Ejg9KUBHp6O0bBk+qhH+pYD+2BhlSsYOLVUvge1g==
X-Gm-Gg: ASbGncsoyXC+3VlwAZcjY0x1/F8F5dK7S/sbW9N3CSppNEDmmw3um0+nAtkXalzMSTp
	tEKZ6AUZ7eAkkn9C925j2Hu/8PriUgISls0w/FSOhg/yeJvyR6Nmi5pZVfGESrFpbEom7Qg6CW0
	vJ7klHWyPl/w6jvKkLTe/hTrzK4e2UV3ZDZptCONv9vy8Z+aeUnGqSn7/POCHEkrNS5NV8ItAic
	J5UvAxeUrEHjCH9UA6o4WwKqvrbxGOz0ztj3xg/qO2JXGq4T4FIyzeNrKfAVyJkjimud/D6s2np
	0JL6QwBb7HZtcWq07KHn//WPOb7ENn1gFMoHJ0hqTY3NeuNcAoeAK+Zy4I57ZWKOvCql/EjSpTg
	QK5P+hjy0nz+oN3eCj0pndYW/SpkVOy+1zEf66TGCWKLFX/flqiVXoXdCKC2qPqrb854ZCp2Jzz
	WefTNWuqeDZbZ/MyQf3gyqYuUr4Jm1CO6LsBLkufugqMB7hFtbKyQ/E0gbQiX345jS1rr5Hv6nn
	OMJeUhfj/bksA==
X-Google-Smtp-Source: AGHT+IHnjdg9J5Dv3DjKTAgPlUY1x6NH1Rmw5oo9i+e3bENd1vNzyqMp5aLbF57/RFRsp96OPvtSGQ==
X-Received: by 2002:a05:6a20:12ca:b0:347:9ae1:cffb with SMTP id adf61e73a8af0-363f5db7158mr9697293637.24.1764882401346;
        Thu, 04 Dec 2025 13:06:41 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:d11d:bcc2:2743:bf88? ([2a00:79e0:2e7c:8:d11d:bcc2:2743:bf88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf817c3e6c3sm1857768a12.17.2025.12.04.13.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 13:06:40 -0800 (PST)
Message-ID: <19e501f4-da1b-4a91-8681-da78922bc302@google.com>
Date: Thu, 4 Dec 2025 13:06:39 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: power: supply: Add Maxim MAX77759
 charger
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
 <20251123-max77759-charger-v1-1-6b2e4b8f7f54@google.com>
 <d4455f4b-2a0f-4bc0-b897-14f2e27af3ea@kernel.org>
 <c9b059f8-9219-4219-95c8-23a3733fea58@google.com>
 <20251125-amorphous-bobcat-of-whirlwind-afdab1@kuoka>
 <7ad91325-e881-461d-b39e-6ff15d98b3c5@google.com>
 <076777c3-b238-4d1d-a11b-602027348ee4@kernel.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <076777c3-b238-4d1d-a11b-602027348ee4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/2/25 5:00 AM, Krzysztof Kozlowski wrote:
> On 26/11/2025 00:48, Amit Sunil Dhamne wrote:
>> On 11/25/25 1:56 AM, Krzysztof Kozlowski wrote:
>>> On Sun, Nov 23, 2025 at 06:34:05PM -0800, Amit Sunil Dhamne wrote:
>>>> Hi Krzysztof,
>>>>
>>>> On 11/23/25 1:28 AM, Krzysztof Kozlowski wrote:
>>>>> On 23/11/2025 09:35, Amit Sunil Dhamne via B4 Relay wrote:
>>>>>> From: Amit Sunil Dhamne <amitsd@google.com>
>>>>>>
>>>>>> Add bindings for Maxim max77759 charger device.
>>>>>>
>>>>>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>>>>>> ---
>>>>>>    .../power/supply/maxim,max77759-charger.yaml       | 36 ++++++++++++++++++++++
>>>>>>    1 file changed, 36 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..71f866419774
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml
>>>>>> @@ -0,0 +1,36 @@
>>>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/power/supply/maxim,max77759-charger.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: Maxim Integrated MAX77759 Battery charger
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Amit Sunil Dhamne <amitsd@google.com>
>>>>>> +
>>>>>> +description: |
>>>>>> +  This module is part of the MAX77759 PMIC. For additional information, see
>>>>>> +  Documentation/devicetree/bindings/mfd/maxim,max77759.yaml.
>>>>>> +
>>>>>> +  The Maxim MAX77759 is a dual input switch mode battery charger for portable
>>>>>> +  applications. It supports wired and wireless charging and can operate in buck
>>>>>> +  and boost mode.
>>>>>> +
>>>>>> +allOf:
>>>>>> +  - $ref: power-supply.yaml#
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: maxim,max77759-charger
>>>>>> +
>>>>> This should be just folded into parent node, no need for separate
>>>>> charger device or is just incomplete.
>>>> Thanks for the review! You are right, the binding is incomplete. This
>>>> charger block actually listens on its own I2C address, distinct from the
>>>> main PMIC.
>>>>
>>>> I will update v2 to include the reg property. I will also add the
>>> AFAIK, the main (parent) device schema does not reference children via
>>> any sort of addressing, so reg here would not be suitable.
>> I agree that currently nvmem and gpio devices (which are children of
>> PMIC device) are not referenced using any address. But I was guessing
>> that's because they share the i2c client id with the PMIC and sharing
>> its address space (implied).
>>
>> The charger device while being part of the MAX77759 PMIC package has
>> it's own i2c client id and address space that's why I proposed "reg".
>> The underlying assumption I made was separate client id implies that a
>> "reg" property required. But maybe that's incorrect.
>>
>> I can understand the argument against having a "reg" property. As the
>> i2c client id will remain same for a max77759 charger device (as it's a
>> chip property and not a board property) it will always remain a
>> constant. I will drop the "reg" proposal.
>>
>>
>>>> standard properties `constant-charge-current-max-microamp` and
>>>> `constant-charge-voltage-max-microvolt` to configure the hardware
>>>> limits, as this charger device does not manage the battery profile
>>>> directly (that is handled by a separate fuel gauge).
>>> Well, still, what's the benefit for the bindings to have it as a
>>> separate child? Kind of depends on your example, which is quite small -
>>> one regulator and supply. Grow the example with battery and other
>>> independent resources (if they are) to justify it. Or show arguments why
>>> this is re-usable.
>> The primary reasons for keeping the charger as a distinct child node are
>> to model the hardware topology for the power supply subsystem and to
> You do not need children for that at all.

Actually what you said makes sense. I will fold the charger's schema 
into mfd/maxim,max77759's schema.


Thanks,

Amit

>> house the OTG regulator provided by the charger block.
>> The charger needs to be referenced by the Fuel Gauge (which handles the
>> battery profile) via power-supplies. Additionally, the charger block
>> provides a regulator for USB OTG VBUS, which is cleaner to represent as
>> a child node of the charger rather than mixing it into the top-level
>> PMIC node.
> Sorry but argument that you need a child device to be able to construct
> a phandle is just wrong. You can create phandles on every other way as well.
>
>
> Best regards,
> Krzysztof

