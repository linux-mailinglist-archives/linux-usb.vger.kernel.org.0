Return-Path: <linux-usb+bounces-30923-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 558B9C86F99
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 21:15:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A76514EB70C
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 20:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A189C33B969;
	Tue, 25 Nov 2025 20:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VxKW3oOW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B1B2D3EDF
	for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 20:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764101617; cv=none; b=K7+bKk2t6KYJfstzs215IsVBilZBLxRU8wXywco6E4d/WFthEGTIiOCWqZNo0VN7Ve343AB1bgFNfBLI2I3SH3CgyRGPMMGZVmejbR6elMMzcZdi0CKSJmFh+bnU1+iSVktt4wIM4l846HsNJWkfrJ21keJbPnitYW3ZZwpyUyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764101617; c=relaxed/simple;
	bh=89CYleDV3lSw4EhOz1KbzHaBTT/MlUH9EZ2vYE5n4hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pvQZuT0tuJFwnhSttiVVpfOXFO1bTSMdffZM3sMJjdQmOetEZ6iVLAWA1jkcwvbZPRIUu/wm7DOr7QaIZqVVW7cWHn7pwbVp2ZaczRpvO9toOoaqcxx0UD6ac61X1iPKGg26DHZDvLXE6DOWLqVyPrW/JN8Yk5pnP0gIapdJCzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VxKW3oOW; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29853ec5b8cso72463985ad.3
        for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 12:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764101615; x=1764706415; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RfK2UtCRp3qKogO3H5nzh+puMsdKQP2QnVSL7A2UN44=;
        b=VxKW3oOWAtVSdaZiFCUPsvxPV7erJbX7v+fhDsUrRrkFeUlUUUqALw8IjCrvuoiFw2
         NZ+bBuUFYdMmzOkd8r/pWCX1vYRtn9fMxUXdP66SO1VgUPfHLRaT71ns2IdVyieXKOj5
         hziaOPm8Unjb1ROGgGAfOaBz56eEgJH9qzlSckTi40gPgwP7VN6b/I1p//rc5OTzQWda
         Aos6CIaFox/B2wtHLzctvY6LMXwFt9OSTybQvkHbyte1c1s7ExKqYWNRlwc0hPSRWCsZ
         duPsh4RWMZePK1ENh5P7vGItv5xO6IcVkAPfTI/8QztARVKiUyvyED/s66Wjy40xbcz7
         lXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764101615; x=1764706415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RfK2UtCRp3qKogO3H5nzh+puMsdKQP2QnVSL7A2UN44=;
        b=BTziZilW9Q92JkW5P34FMStfFDjfje6X8Coj5cgutQOnHmfe6Wenle8b/KWi6dqYvx
         M5OsqC5pijCLWs8pobh09HdiTY+aSFG1/QZMAB8tV7PmSnPLqriexSmU9lSUbM0Vp7Vd
         MT26Tc5VdqUOrJanYfz4sYsuExKA2k1OSTLp38EdDEIprCJZI0okTbd9q+a/9C81QcCK
         aqRmP81N5Kc8MBe2QyeviLe0fVmPT263RaIsSTL8ILLuOtLmxy0hcOiQlv4ZTGv7w0W0
         UJI5Yw8qnqpjsAiGMBGT5poPP5D/TDjCaA09B4SE0YM9FUSeHyPwopcKmAvASEsTgVzv
         Fflg==
X-Forwarded-Encrypted: i=1; AJvYcCWQumwV6/AHXeZV+DEYmKN9I2Y+WCiGbir1LZAcBvS6xaR8I2jf2YZYI7v4TJ/cNO3+KE9J4mPUH0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoqOZQDlWehLnnkiWUxaHloww8pwcAGA9O0dPXJL1ue13r1j3G
	43mKx/BWcIyvc9hzKK2fY+zhh0TEW8H5r/RveILeJB44IvgCUlKcoJgNHnwapvEQZQ==
X-Gm-Gg: ASbGnctxyVJcxbVWM447Epzj34GTrHxQN4KuYsUSNH656cx/w70sr6skY6TCXIPMNl0
	r40wEWAyTCxv1b1392/zJbGqAbXMS3vIo397f6FCb3mSI6Ll6oJJAEaJ6ikstTvsPL7qM/pS0fQ
	yjbj3egCml0feE58ZiGDVkEvzbMtmyQDkZelGPQYnFHqlcubwStgDkaIK4Cq091fpbEZEuXvFBO
	uIlTeabw1dI8qPPpzRYSEER2LE7AQ/ksHXGaOkxQ4u6G8N/Jl3JVHjCLIRNvXnSGkDRf/eYheWI
	BNT+Vu/Z/HoHRcKfKvVfhPUIsoSpPv3XL2HcjmyC+zU0COC92nfKN2WvMoxEf3of9fL6pWQgyEm
	Q3OyGA3LK/6ENFnjIlJtv5Jkj/1IXer8sRnBVBJwWZMEdE1zK5tBeNVCTBPjdbm15IQhDwAzWrR
	4MrJUv0pG4zYCAT2FZiX9hMgL9KGd/17/61RwD/qcbVmW8k7zK24d2VxDMDd0aDIEdY8hiiwWKq
	3wfqKRPy9vTbw==
X-Google-Smtp-Source: AGHT+IG9kG01ZIUmMJzmeQwMlH61r7mcmKmX15F17Yg0ycZqophUcVw0eG5SWVAXcyDMCqwBRpETuA==
X-Received: by 2002:a17:902:e545:b0:295:8c80:fb94 with SMTP id d9443c01a7336-29b6c6f1516mr170593005ad.59.1764101615123;
        Tue, 25 Nov 2025 12:13:35 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:744c:4262:57e5:31a7? ([2a00:79e0:2e7c:8:744c:4262:57e5:31a7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b1075c6sm175965955ad.17.2025.11.25.12.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 12:13:34 -0800 (PST)
Message-ID: <adc2d6ec-e666-4dd0-aaad-7ef014efafb6@google.com>
Date: Tue, 25 Nov 2025 12:13:32 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: usb: maxim,max33359: Add supply property
 for VBUS in OTG mode
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
 <20251123-max77759-charger-v1-3-6b2e4b8f7f54@google.com>
 <20251124-rook-of-exotic-innovation-fedcc5@kuoka>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <20251124-rook-of-exotic-innovation-fedcc5@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 11/23/25 11:53 PM, Krzysztof Kozlowski wrote:
> On Sun, Nov 23, 2025 at 08:35:50AM +0000, Amit Sunil Dhamne wrote:
>> Add a regulator supply property for VBUS when usb is in OTG mode.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
>> ---
>>   Documentation/devicetree/bindings/usb/maxim,max33359.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>> index 3de4dc40b791..a529f18c4918 100644
>> --- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>> +++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>> @@ -32,6 +32,9 @@ properties:
>>       description:
>>         Properties for usb c connector.
>>   
>> +  otg-vbus-supply:
> How is the pin or supply called in the datasheet?

The pin that supplies the VBUS power in OTG is referred to as Vchgin in 
the datasheet.

>
> Best regards,
> Krzysztof
>

