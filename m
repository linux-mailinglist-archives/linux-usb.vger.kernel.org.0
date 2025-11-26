Return-Path: <linux-usb+bounces-30980-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FFFC8BD9B
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 21:27:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DA5AF4E1363
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 20:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C0334250E;
	Wed, 26 Nov 2025 20:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s6AgJ+k+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4ADC32936B
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 20:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764188840; cv=none; b=DRXfoCdHCZ4Bv4j5/EppRqnjaqG/stGBulav68EbELkA2hTJJqi3DVUMVZU3cE/uVSSOrk+bGzsqd3Ewv9DqUF85f+uMoUJafzROerghWNgtG4swTJG6pH7Pq8cibKqBntrk0zeH43zZqOrnWKrXIW7zDXO+GgcQW4EoBlXlzyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764188840; c=relaxed/simple;
	bh=BUKUk8XbTFbg4rBCIooaYc9015FQ2fbX5halOJx9HyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OJoWxeVQp/hRXZ//3dLldWhVN9b4CeG8Sz0DInoZ/AKPs3Z9F3WVyoT65G5ovxcngokEKy70Dhre/9WWRhiPz8bEYfWXss3I2GN3Lz+9Op8AQSvgrRcCOCIuUBJxKXQerkOPN3Ks9HXX5aB9YYLSph8YH1kZXimgERWHuefgrCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s6AgJ+k+; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-297e264528aso1785115ad.2
        for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 12:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764188838; x=1764793638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A5r3za4Hd/VcLzmDqeRuo9GjhPbaMT68/WQ/4wPSlvg=;
        b=s6AgJ+k+S05B8VA8DFZWOL2d5TbrYxk6tma4DHRIF0l5l3jtDLGUrbZxPZmH09adwO
         cg8HXhneoJdVQ2K1tIYT2RJsM0oEkBUC+MNOWOY4XG2pr+GPN1zaR1DiFJ3oSYuoJR6z
         AqdGwjk0rQJs2ePWrolt5B+OIb9egoFhaZ9AZvt647nS5HsTxdmZnYWOoGythSyIDLVS
         1z0F+LDYeOR3wrfXDD5ZHnaA/Ozhn0ojJ/OU3dlzmeQJ+kC5puBYCT8H/H5Qyf5d1fAb
         6MTuupBGvBHCKxHx5eijCK+6sS6rLGq40qfzsdQrrK+lV75TU60t6RJxuJcsBeQUmUOh
         XBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764188838; x=1764793638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5r3za4Hd/VcLzmDqeRuo9GjhPbaMT68/WQ/4wPSlvg=;
        b=FF1mAdFVl5o4PHYELpNAVy7P6lJLSpZRxfFFD1BVr0EWTgaKlQM87RPJPKoRggVx3h
         Q8QmU6sUw6jUhjPgymOGEeyUq6Et8cr5l16OX73MGd8PlGN0nFYqD5RpeMi4PtKF051t
         yg6HYmKYb1CJ+KnR3Tb64eNLdl62SqUGKkeDbI9+Kigy8Z7ZmoXSNa60Efx6Pl5CR53N
         iSVu5HCCfkW4MZV9ZcxRsN9xtV5L+e5age5q/wP9mWyKVe/nR18ZoZDiMIUOWZ5OJr+W
         ULKPHXMa21qLlRL5rONxorvWKll+sJhZdWkz3o1VnCHwUjwrmCLQ09cn0nA5/ThAbudF
         39Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUPy9Dwcra2v/HpcBZDFoIt5R6bwuTGcWRFgo1LXUJeU8OqcXPi7eeP8zlQEyCCpm5t9xekiTa1wYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyckWeFptIysR0vhegQDRzU6EAq9T1OEcdxfgNz24Uw0iwSMN08
	+ZqUrALgOsG4GMgVgLMGbI5jbcYYUYHaeTV/QB8Dj+x1SHDtMZO1b3a7A9xGVdmVLw==
X-Gm-Gg: ASbGncutee5ZRex1s37w3j+ockZfc5C1tIB8Y1vc7maXkFYQSZOKvcTPzhSW9DDJHTu
	ByTBdgYF8kjYS6LJmg9EF05GvbZo0QKV4CJHl+gOVlJRUMYT4+SUqCYTVwXFwcX8OAu5fcYpfpM
	Y7ii4llc/fltGTEQ8FlaUugaapXxiKw7QRJFtpySsuAEwHNTEKDDb+ZMnZnPM1Hfv8qUCCCrY2M
	YQVB0rx2YoIZCEirHLoJPbuxmcQqKwUAZoDZUeN5FGAfTTMzjwDsIdMBnPHfJzf0n4cm/IRmCvh
	OPfuSz00gCfmykT45p/+rSE0AtoLFO12KXygvmm4yWOBDls9UCGerExXM8OZhL8STbxVpJ0LM+2
	tlzaoVnyjFizjvTnqTLXeVfalqchrWzkvrGx4L4XnJl+g+m3hAG11/8lw6dbj0bJnEQcjzLb7SH
	6vleMVqGyYqChKusTmR3XbLLA2Lr50yD/T2jSiTATwrwTs55uYQVD7Zl2Fgqm0TeIjggU0rpb9T
	o/oCoto1y8wSg==
X-Google-Smtp-Source: AGHT+IGs7j+rISQURjI4KHJiRtxo72A6EAIFd8qUy73nZRmTVJ6HUMi3Fk8FYXZXKGlB3rSWFkwohg==
X-Received: by 2002:a17:902:d58c:b0:294:fcae:826 with SMTP id d9443c01a7336-29bab2fa50bmr92368305ad.59.1764188837611;
        Wed, 26 Nov 2025 12:27:17 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:c116:b1c9:632d:a902? ([2a00:79e0:2e7c:8:c116:b1c9:632d:a902])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b274752sm205771575ad.75.2025.11.26.12.27.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 12:27:17 -0800 (PST)
Message-ID: <1be015d7-201b-4e3a-a71a-130162205e5e@google.com>
Date: Wed, 26 Nov 2025 12:27:15 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: usb: maxim,max33359: Add supply property
 for VBUS in OTG mode
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
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
 <adc2d6ec-e666-4dd0-aaad-7ef014efafb6@google.com>
 <8d8201de13b4694b26812722356a3a55637406c4.camel@linaro.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <8d8201de13b4694b26812722356a3a55637406c4.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/26/25 8:18 AM, André Draszik wrote:
> On Tue, 2025-11-25 at 12:13 -0800, Amit Sunil Dhamne wrote:
>> Hi Krzysztof,
>>
>> On 11/23/25 11:53 PM, Krzysztof Kozlowski wrote:
>>> On Sun, Nov 23, 2025 at 08:35:50AM +0000, Amit Sunil Dhamne wrote:
>>>> Add a regulator supply property for VBUS when usb is in OTG mode.
>>>>
>>>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>>>> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/usb/maxim,max33359.yaml | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>>>> b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>>>> index 3de4dc40b791..a529f18c4918 100644
>>>> --- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>>>> +++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>>>> @@ -32,6 +32,9 @@ properties:
>>>>        description:
>>>>          Properties for usb c connector.
>>>>    
>>>> +  otg-vbus-supply:
>>> How is the pin or supply called in the datasheet?
>> The pin that supplies the VBUS power in OTG is referred to as Vchgin in
> I think that should be chgin (without V prefix)

Right, it's just CHGIN. These CHGIN pins source the USB VBUS power in 
OTG mode.

>
>> the datasheet.
> Cheers,
> Andre'

