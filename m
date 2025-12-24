Return-Path: <linux-usb+bounces-31760-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A716DCDD055
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 20:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 976AB3022F3E
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 19:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29BC533B6E6;
	Wed, 24 Dec 2025 19:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jt48wwVz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906292D6E72
	for <linux-usb@vger.kernel.org>; Wed, 24 Dec 2025 19:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766603264; cv=none; b=LSWy8Cocyzt2kO/gTjGW9I/6GURw4Le67a0aPaDvAcfFNfAcv7ruQNPJAm9ihDgJqRB9jwE9wNxltEJ/FzGnwv05QiRdsd050GROtTHQ7j6JRFsQnjVp+f7M9fesWr5rBsKEhdLWYW4bOG32y7cPi+w2sfV5z2KxjKUyqOfN+1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766603264; c=relaxed/simple;
	bh=xGMey4A7iFVHAmrVZuSavckmgLulJhGs63Zh3metjjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sAAGnT2VHMypMYEmw/AiL8B2QvNiQZpbuCfvwlVYG5Nk8wDQAFHQIoiKJzVhRSbXGvA9tOEtopx4BshjsBbHBAtq2AO5GMb0twcAkNacpjU63gAwA9qJXkZ2qIeWPziT3jbe66G485Qxy0fsvyr1abd4Lv3TOol20yUb8O5kHsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jt48wwVz; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78a6a7654a4so53449107b3.0
        for <linux-usb@vger.kernel.org>; Wed, 24 Dec 2025 11:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766603261; x=1767208061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NzIVnDZpOLjchy2wgbEcpJaoavN6zFZmqhSGhoRwcq0=;
        b=jt48wwVzAY30EJsCgsBi7TrUZHYIH4B7dENfIKwBOgf+orFGCMZ9TbGni6VSrbHmdI
         LPK3rS9lwcDDXS6PnM9tsNqrFgZ7p2KuWtrjQMcqMm//eCk9BKnUomcvLXovIP2xunU2
         B6SbxvRopOesHK+AkV3hoIJG//jR3l+5+m301qKjGd44VvSJfsthjTX2uhcGj/bSFdIv
         /RNSYyo8UUlEjlTDCeM13EDgRLXa1Am1Xyvy1AR6PHvQqG9BJn9aCjzvQPJrv6iWzFDk
         EGY1aznIp1KannV8iZph+snCe15e2bn28pj/gkm5t81hhSPQDlAsc8A5HMnv1mP/5xq9
         uSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766603261; x=1767208061;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NzIVnDZpOLjchy2wgbEcpJaoavN6zFZmqhSGhoRwcq0=;
        b=dr/XesDJ3wsjQa/NtmJ+JM9Z4YhUisuSwx3G0b27E09Rznqc5/mOI4L+Yh2+uE947Q
         EdKRIoXD19Y2EAKxvePA6iW9Ro7sTzBdmq+PdpLADyYrZPRbuYdOUOo+IkCgAWvA6xeO
         DHB4sRpGA2lw2YuTU/5w0bYUk+NYb2ngSCkcSHC8+rc/UMpYD4D81e7RKV/I3tbik2/C
         8Zzy8NYstaT8uMnXiQKSjS3+X9DwnarnesdUdlM1fwvVV2o7ntp9BvBJ/fePwwL7YFTH
         hPEzw2Lu36S612aA3HmF6eb8QHHRXevZexmT4lQGC//0XGRAA2UQfIe/q15qHtalvkhU
         9P8g==
X-Forwarded-Encrypted: i=1; AJvYcCW7/hIxKPG1T0RyeZguntRRvdX9V4bJ+zZBqGgU5B6tNqmWakukjFcldl/NxyQYupo2XGOI6ac4IdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSko665fCPwKv9h+viB/Dnh6iljO1zmIXNtAAcXuZXAOXoQlml
	qdrefwbuNwwyjBFj9HOUU0Kc4dNimt9PzyGXx0PShHPpl+CKmglgHagCfPTVymqI5w==
X-Gm-Gg: AY/fxX63j9VNjB0lVCI1E1JbC9rGc89jmgm5fxvBLTQ8yZwr/qgYVaPNzNc/bQejQVH
	+nIudY1w7RYjJcHPZuqCOwmeqCd5EAxkrikaeRVOcLKOs7uGDm6ewzjqfVop2ndOsvhjqEfLzp5
	BtM5oE/kh9NUQk0+Ka5B1UZmidVzISrEi2zY2WuWk6RAQnaSlRlLVAOXrzcyfCrupnT4NLj1zjN
	YefER0wwXsnOBC/vpormrl5uRC7z6UTXvl59XzDAsLaZmX5ha1+6tbHHY9WnNixNBaay9oHXJ9R
	WBX/0qAoBFYP8xuYoYcU8ngy7Rq7Fab8zYt1Mm5xlVTUCZFA/dwuOjaL6AcHeDhNQv3N68/yOGk
	o4DYiaFWgvuLUrF44eA4CT9C5HAYuAq3BtOxrjc2zEGzlWS1HXDbxmKL2Z2LcDfWw8q80RIDqd/
	sKI+cnaUh2uBmpmndIHACV1m8dXm1/jcKm6fzyJSc3TebgWpg4DnwKfGTzki4=
X-Google-Smtp-Source: AGHT+IEY4Bkjt/yYbrhofiHe25t6FYtL51Cgg0/pcmheFBExP5e5Z7qmADlL5vL1uqS/fVBKeLgjpg==
X-Received: by 2002:a53:bdc5:0:b0:63f:2bc7:7074 with SMTP id 956f58d0204a3-6466a8aba62mr11525267d50.60.1766603261316;
        Wed, 24 Dec 2025 11:07:41 -0800 (PST)
Received: from ?IPV6:2600:1700:4570:89a0:6872:f79a:c2ff:4f4f? ([2600:1700:4570:89a0:6872:f79a:c2ff:4f4f])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6466a8b16e2sm8621687d50.2.2025.12.24.11.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 11:07:40 -0800 (PST)
Message-ID: <c3599851-6e19-4ed9-9ce7-703746b978e7@google.com>
Date: Wed, 24 Dec 2025 11:07:38 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: mfd: maxim,max77759: add charger
 child node
To: Krzysztof Kozlowski <krzk@kernel.org>, Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20251218-max77759-charger-v2-0-2b259980a686@google.com>
 <20251218-max77759-charger-v2-1-2b259980a686@google.com>
 <411802b6-517d-497e-bf7b-183e6e6d7a64@kernel.org>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <411802b6-517d-497e-bf7b-183e6e6d7a64@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 12/19/25 12:17 AM, Krzysztof Kozlowski wrote:
> On 18/12/2025 23:49, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> The Maxim MAX77759 MFD includes a charger function. Extend the max77759
>> binding to include the charger. Also, update the example to include
>> charger.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>>  .../devicetree/bindings/mfd/maxim,max77759.yaml    | 33 ++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
>> index 525de9ab3c2b..1cffdf2e5776 100644
>> --- a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
>> @@ -37,6 +37,30 @@ properties:
>>    nvmem-0:
>>      $ref: /schemas/nvmem/maxim,max77759-nvmem.yaml
>>  
>> +  charger:
>> +    type: object
>> +    description: This is a dual input switch mode battery charger for portable
>> +      applications. It supports wired and wireless charging and can operate in
>> +      buck and boost mode.
>> +
>
> I do not see any improvements, so same comment: this should be folded
> into the parent.

I misunderstood the folding comment for merging the charger binding into
mfd.


> Please read DTS 101 slides or writing bindings or any other talks...

This gives a lot more context. Thanks for the pointer. I also reviewed a
few recently merged mfd (with charger being a cell) patches as well.

I realize that you're asking me to remove the charger node and re-anchor
its properties to the pmic mfd device. I will update it in the next
revision.


BR,

Amit

>
> Best regards,
> Krzysztof

