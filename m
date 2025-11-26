Return-Path: <linux-usb+bounces-30929-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E4811C878B3
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 01:03:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B6010354FE3
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 00:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F142C190;
	Wed, 26 Nov 2025 00:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FKaxL67t"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794AD625
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 00:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764115375; cv=none; b=bk8e5R9Y2mDStFg+hLfLcHIOuNgmAcRVCxeZIgOsfV5Ocodyz5vnplF4f5++B56SQ9WoVMI8g7n1VZvtPyvhKkZAmYt12t5+vKUCdD9nIuiueP2TplqFcLTOcsBNoDJRVn6pJmsz/skM327i8Vvfp3u9f0jM8SLbB1cmspYdQAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764115375; c=relaxed/simple;
	bh=NqlXoSZZihO70FxCdncHZZzKas0CMSSbGdpFS9BtrlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rTcArtAwuafeq/M75FA3JScT90RUZil+dZub3RS5WpbqKkbuuNHhG30gcnqomb/LDyd3SwRmMu+m9X+tCOh8ya6yCw46O0Ua7plbtqOEPlFfA3izDPKVygTZR6ojjVewGRB/HJgpI9tSnznSBOUwbNT+7XdCv2tUx1ktjEwRQCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FKaxL67t; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-343806688c5so5148636a91.0
        for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 16:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764115374; x=1764720174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ozYgqGZxyZiXYU0b8aZzmoqKbBY3lnwpPB9f4ygIxc=;
        b=FKaxL67t1NTEdfJ2QXhzagkftN3w55W73P0RWMXR18iGN0OvqYbdyQen/60bSfbSmn
         53bi/Gw4U3Xn/gpM1dDQGi/hBnpqNADtCsJsG0eUB51JJlaN8uhlHQYxGBwn9CT/tKYb
         svrhj3atsWksruKrH7hTZPMmzrP1t8dCBQR/BSEg0cATDtr+uG+peiAS4mVrXlDKbZGw
         IliQB7ZeFC9XkGS2kYmG4cFzPIMCVGateypt11lz7K6QGSDJ4lI2eKJmaGsVzwf/VeOL
         zet/tII+th+uGuXvGr8SM5l8mAMkV9c6O+mLv2h/zUAFC10+oCpKhXEi7480YBe4XAgO
         HimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764115374; x=1764720174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ozYgqGZxyZiXYU0b8aZzmoqKbBY3lnwpPB9f4ygIxc=;
        b=BHEPXamhwn7JqR9BfiQAu67LOHPcv021txrnnON6uzNj2rnFefbpP7pLXavquTL9sz
         ycMsOBiuYuMfSGN6NynP7i1Hi97EdwbAXHPYWeINJoq3qgFfG1ppDQAk3v1gov3UVw0n
         B6KQdiw272lbiiKI90mE6SeOX01zT6TvkUs1dxgvTcKAz58UhDaktCP5c0Km8znraQr/
         LJay1JV3y5RiYSKKVTpnwLgEwAJBIr9LRCcNVjY3zQ/jT01FrKwxDo0kb9+g4SduEOq8
         u2nFyoOYl1RnNzem+b+TsPyw6YoUZ6yNuU/wB6EBz3sVb/j9QBTwBlKkzS/RF5/Nn2WP
         g2ng==
X-Forwarded-Encrypted: i=1; AJvYcCVslsxCKieCMR5Md0yltxOVjxIIiTcE/RuWw3g2mflgjJPX4bg1jK5QljfmFq8Nn8Lf472n18Lun9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWTSXgWpBS2m4+y/tfCnMfpqhj9FYQOeV8MutBEIs1QrmixZ2y
	h7WheOqvaOugRfRv2dwJmGp1xFBZOFgd2mbkieir3sw60FLcjVt4+8lN1RL4VRlZYA==
X-Gm-Gg: ASbGncsgIrj4W/9Xpt1whwnyHMBr/qSfWORoVcuA3poZOBISmoW2NkJHmIMAu4y7/Rs
	AVxbW0N5vtgw8QaMAHLqh0j7wAvS8w4eCWkJekDwS0gqxVsPKICwSvd+RoDckwSUn3+Ny/i/NNP
	2sAQZrA7CuLP94BkwXA2LWXfdOjyJnEZYZuv5AsTUc/i2ylKjVz7oY2/5u7VQTTRnCBVy/d5/2B
	gUf1Ss94jiR5MwRJajFVdX0iwfvpC2sn827m45925SY3ZWEi8aTSv2NULiVmFfwnc4UMmQS4k0m
	qpQQZbv5NyNHmpqOspxjItImGhnCix5gd+UD/9VIH8PUm7oNf/PPQEFakBZ8h8ir1Ri27kx5Dm0
	GDxGfqKdu0jmvS4FDA346YDyUkiVn07tje0Je1lkA/Vsul8IUon8cO5qnI7eHJzlV25hG6eyqzh
	0Tj+ggakR5zuWUd9IQbS2Tw/LXqVxcYyGjWqef1lMLkt0pFrVqf90AZvd1j6wprLQm3edLjX2o+
	v9fWObqIm7bbA==
X-Google-Smtp-Source: AGHT+IGHFeP0ZRaD8eMJaVnA9S33kn4uRxwfNfGJ0BWnjB5I6ToaBVqHt4IPtOo9tOmXe7tjjGRiww==
X-Received: by 2002:a17:90b:180f:b0:340:66f9:381 with SMTP id 98e67ed59e1d1-3475ebf9b16mr4130129a91.10.1764115373195;
        Tue, 25 Nov 2025 16:02:53 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:c98d:9e96:d0be:bc30? ([2a00:79e0:2e7c:8:c98d:9e96:d0be:bc30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a7a6105sm514375a91.10.2025.11.25.16.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 16:02:52 -0800 (PST)
Message-ID: <4cb88319-6514-4145-8309-01051547b851@google.com>
Date: Tue, 25 Nov 2025 16:02:50 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: mfd: maxim,max77759: add charger child
 node
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
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
 <20251123-max77759-charger-v1-2-6b2e4b8f7f54@google.com>
 <699d4476-aaaa-4cec-9e2c-240348950e4c@kernel.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <699d4476-aaaa-4cec-9e2c-240348950e4c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/23/25 1:30 AM, Krzysztof Kozlowski wrote:
> On 23/11/2025 09:35, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> The Maxim MAX77759 MFD includes a charger function, hence add its
>> binding as a property. Also, update the example to include charger.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>>   Documentation/devicetree/bindings/mfd/maxim,max77759.yaml | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
>> index 525de9ab3c2b..29132f73f2c8 100644
>> --- a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
>> @@ -37,6 +37,9 @@ properties:
>>     nvmem-0:
>>       $ref: /schemas/nvmem/maxim,max77759-nvmem.yaml
>>   
>> +  charger:
>> +    $ref: /schemas/power/supply/maxim,max77759-charger.yaml
> You need to explain dependencies/merging in the cover letter. This patch
> now cannot be merged alone through MFD.
>
> Or just decouple the dependency and list here only compatible, assuming
> this child node even stays.

Would it be okay if I drop this patch from this series and re-send it 
while mentioning the dependency?


>> +
>>   required:
>>     - compatible
>>     - interrupts
>> @@ -95,5 +98,14 @@ examples:
>>                       };
>>                   };
>>               };
>> +
>> +            charger {
>> +                compatible = "maxim,max77759-charger";
>> +                power-supplies = <&maxtcpc>;
> Feels like you miss here battery.

I have added the example in [1]. We can discuss there in case there are 
further concerns.

[1] 
https://lore.kernel.org/all/7ad91325-e881-461d-b39e-6ff15d98b3c5@google.com/T/#u


BR,

Amit

>
>
> Best regards,
> Krzysztof

