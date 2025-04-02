Return-Path: <linux-usb+bounces-22464-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B33A7892B
	for <lists+linux-usb@lfdr.de>; Wed,  2 Apr 2025 09:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 079F816989E
	for <lists+linux-usb@lfdr.de>; Wed,  2 Apr 2025 07:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5828233720;
	Wed,  2 Apr 2025 07:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WIAu21f8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA0020E6E3
	for <linux-usb@vger.kernel.org>; Wed,  2 Apr 2025 07:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743580262; cv=none; b=oB+YGXymH1FIzUGfsgQcSUQqoP60hPZ9IpEImG2TwpGQ2TkCSrTwKeVzEbndwHYasv9qJKkcOxzwgRbpMel4aOIJsyK1Mi6AfWOjM1SNinHG9LkEbUpHEk4ktqp3tKer0cwu9xatA2LzfboK76uTr1F+Dv6LNqqIHouSmlrLdF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743580262; c=relaxed/simple;
	bh=yB6BsXbwOkwlXENq9xVGVh8F37v1t8t3X6lfwzOPeUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MQUilWNi4VZKh/CuMzH7nlVTJXfP0CErH5L63Y1W4v8+4SOkqUKU9zinbTRzvaSYQQNjBqUUXw28THfzr6iaX8VViDfRN/SlD8msyvU+a+mQ9P+nzJtQPhl1OMSK+qrlkVJJ3qNV7fyyQ2PW0wDIhgSSesQ1o18SIEfuJoMRFJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WIAu21f8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso45140265e9.0
        for <linux-usb@vger.kernel.org>; Wed, 02 Apr 2025 00:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743580257; x=1744185057; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CJBvTddey6j/sDoUpUVuBsXJHZ/ixlWGV9JBzenT3eQ=;
        b=WIAu21f8Lnk2cNLTwrmY3WGew/HMBdhZMB98eP67TtSZujGEMNeuozGMoZdigCOTws
         IIHjm+eCeFbuHzV2q8fttFaG4Fv0xoFm4468LV1MeBt+l/YGXIlw3yi5DUR4T0e8l8G/
         UawGguqwniNZiitRFfmty9dW0MijsZt4gYnYbnohrCtRB2bsnicjviRrQIpeEk95nTUJ
         8+ouFzzHu+6utXczWSCmNt+/f6OVZdJ1y5q6NVcbovunqBMAO1idJzeNVB2uNOe1g+sw
         DZpLb+H/vyvKcYA9WiDdqgT+FVsFOgtnJ6j+G+IFIHgNQ29SGIy2tFcf4sSBfEROBY4n
         Pi6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743580257; x=1744185057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CJBvTddey6j/sDoUpUVuBsXJHZ/ixlWGV9JBzenT3eQ=;
        b=hUJ4eBcNblpO29ginNt4M/Bjqw9pcvHaKeGeCFJgwpVwNjLJ9hSHtfeeSzegWsF1wC
         /0MTaMiKFEiLi0jYGJ2jIog8kGWAg0P8Xp63mkzhUfexMvNVIRx8cmncZubrZ9OJd0+l
         eUL+/OxxeOm4WDWA7c4oOtdMXfqEQw8NGcl6jGhikdxLYJfJISX6PZruWpTrphCDgA68
         ApPYt9M6eGHdHc583AeRyfOD574Yp8v4Ja27LVl8iaPalvymXoclfKf3VSNP9BC+aOba
         3eRo4wTpq3+8yC30XbSQqz9ac0+gPMyO/BOugMaPxIAxdj9+2cCkdpa7TlA1D4nU990v
         8kwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXupK0WdezabtJf0XSDvpXlIg2BlxPUeFhLP2xnT/zQ0OSI07oEkTr8+iJ/piSDMaTgUx6ad6suRM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Fb4g+/rFLVA2YsdkcrSD/JVgVy3zNlexkx+zBiBHQP7YkykO
	mPxP6MnEqqpU1PDC4bz1jYs48PmexRmIOz0LQ0u8pZxXWTbW2kJGnuY4NAwlDh4=
X-Gm-Gg: ASbGncvsPBTPlYUuikXK8CfdzvyDk4QIsbo/DD/XLKoUh7szimeZ6Uh4bXwFmSVPij6
	aYZ5je5ZETkVFEJXq2t3oUWjx9rVn2T22i8BXkR8xaJTzH9MN/PMgkiq33iuqOtZWrfA5LU8IR0
	EcfWc085t75g0a1BEIVo78ObPRMFFcY+Sm9YLveG9a9kfEF9c4DWw0wCqyWOzLA2wBt20krWtN0
	W6fn2bMB7Abq392B2RWxDBFcEHWSMSEZxoS9tBM8ICJbj2C3CZwVNrjMWF9DPtzRVnEbbCkEM9O
	yalxzXkT7APiNEMlva16BLa1I/XE0M/8aufF7ZV2QfIe63GwaD3k0egJv2GUR3NKU5FaRjSNayp
	Qf++jBQCQNkGe+Vl1VfRzkGo8iYc=
X-Google-Smtp-Source: AGHT+IHvwbXz2NZBTtaeEdRq5TFmrrvJhZ/7yOTRJBr0h+BwxYzG4pnOU0GyOCmxjf54t0898Fl0TA==
X-Received: by 2002:a05:600c:1914:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-43db6222510mr135127655e9.7.1743580257357;
        Wed, 02 Apr 2025 00:50:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:355:6b90:e24f:43ff:fee6:750f? ([2a01:e0a:355:6b90:e24f:43ff:fee6:750f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb60cd77bsm12167035e9.19.2025.04.02.00.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 00:50:56 -0700 (PDT)
Message-ID: <5c428f8d-8c8e-42a4-9650-f731ff5ea16a@baylibre.com>
Date: Wed, 2 Apr 2025 09:50:55 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: dwc3: gadget: check that event count does not
 exceed event buffer length
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Frode Isaksen <frode@meta.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20250328104930.2179123-1-fisaksen@baylibre.com>
 <0767d38d-179a-4c5e-9dfe-fef847d1354d@oss.qualcomm.com>
 <d21c87f4-0e26-41e1-a114-7fb982d0fd34@baylibre.com>
 <a1ccb48d-8c32-42bf-885f-22f3b1ca147b@oss.qualcomm.com>
 <20250401233625.6jtsauyqkzqej3uj@synopsys.com>
 <4d9226a9-d89d-4441-9dbf-f76ebce49a9e@oss.qualcomm.com>
Content-Language: en-US
From: Frode Isaksen <fisaksen@baylibre.com>
In-Reply-To: <4d9226a9-d89d-4441-9dbf-f76ebce49a9e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/2/25 6:42 AM, Krishna Kurapati wrote:
>> I still wonder what's current behavior of the HW to properly respond
>> here. If the device is dead, register read often returns all Fs, which
>> may be the case you're seeing here. If so, we should properly prevent
>> the driver from accessing the device and properly teardown the driver.
>>
>> If this is a momentary bleep/lost of power in the device, perhaps your
>> change here is sufficient and the driver can continue to access the
>> device.
>>
>> With the difficulty of reproducing this issue, can you confirm that the
>> device still operates properly after this change?
>
> Unfortunately, I did not test this particular change of returning when 
> ev count is invalid. I stress tested the change of copying only 4K 
> [1], but didn't see any issue. I suspect we didn't hit the issue later 
> again in the course of 14 day testing.
>
> [1]: 
> https://lore.kernel.org/all/20230521100330.22478-1-quic_kriskura@quicinc.com/ 
>
>
> Regards,
> Krishna,
>
I have been running my fix for over a year with millions of Quest 3 
devices, and no strange bugs caused by this has been seen. Without the 
fix, there were 1 to 2 crashes per week.

So I think it's safe to just return with IRQ_NONE when the count exceeds 
the event length.

Thanks,

Frode


