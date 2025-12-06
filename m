Return-Path: <linux-usb+bounces-31218-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC86CCAA74F
	for <lists+linux-usb@lfdr.de>; Sat, 06 Dec 2025 14:42:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A2233067D3C
	for <lists+linux-usb@lfdr.de>; Sat,  6 Dec 2025 13:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3792D2FC009;
	Sat,  6 Dec 2025 13:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eW4ZX2xm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B21D2F1FEE
	for <linux-usb@vger.kernel.org>; Sat,  6 Dec 2025 13:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765028309; cv=none; b=SXqk+i2kEVX3ghdHzjg28JhihypHxxGjCJpZZd7j8d4vTgLT/kmHHh0F64WCC35EgGnhZ/iVPKlKiZg7NPyNffJXrBObZVNgpEEwvJdECpozwKmxcCnhDpprOQxcF0GLCdlyQKj+3d+VXbVziT8omrvNHZ9iUXWp4VueSw4/OeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765028309; c=relaxed/simple;
	bh=ym2C2sVMhc+W20ObHTcDmFSRkzCbP8pObQd9rfJb+4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j9noBKo7eX3zBRxKHeZG9dqRN/1ms7OKoEQxgejfXjSCymryrj2Rp/H9nqHMAvOlhBdc5EEAJDhOV6vtb/9Vzjqq/hcGPzr727lss6Zjz+vFmv5FEOWG7rH6JH0NK5nuTcRo0xMIFlCILO3jVNSzpZuYM2kX+8YX4IxgIW0V3Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eW4ZX2xm; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bdcae553883so2539316a12.0
        for <linux-usb@vger.kernel.org>; Sat, 06 Dec 2025 05:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765028308; x=1765633108; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r6ThddeExf5Und4u30qaitIGfC7qXYJM9H2MDxYn+/s=;
        b=eW4ZX2xmM0ZFaJSsGwvK0AV5B1YYScuasf+DHJC8CT/AyEOKblA2t5XWUMcD9fr+pC
         3boBpyRzE500xj/C/oDGAAFGzGAvhALxNcXqAKWISutxm41UKNPPCtG69znDjxSS8iGi
         tyYkH8Nke1KtcZnUpxjdBnWGbGFF0agxHIoQdaqx+daGdHvSuesa14xFAT097IIVEjl6
         g3L1M+Rh3YyccUaKok00EpN9abL1vic8N1inH99mo7G4Ikb03PKMwU2S3TkjNghjH7g5
         jJIlzS519W6G4hcKLm1d0oB2mCSLkm5mNFj+BLiqQda336Ph6BjD9NLHvJA9Dr0plK/r
         dAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765028308; x=1765633108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r6ThddeExf5Und4u30qaitIGfC7qXYJM9H2MDxYn+/s=;
        b=YHUSrUDWED61yPPVK2CO1MxTys7d/mlCtiVVqrOu45vtw35hW3Pqk8ioikjweZgP4t
         Xkj90X5LWrCYldwEkhHygYrIm30DpIH3VVCr4YTxEoAu85Nez1XowdmsT8HumsabFJu4
         pARh3FmAoslKUBmwjWXIVBaHNSVB4oCmqdHTMG3W3LcgzpF/nxxiJmhnY+RqTh/FIDmC
         o4C/acwD1iHLXXOnCfeOnA68gfUNIkNfSnmTULiyvJshebC1Ag47Aoe59wTAoubIEj/L
         gmDb7BKXtHlefIVZrhaMg188eK8uzgjqSlQG9HK37DYF6g38QkCFjE4vQFF1NsZAG6wQ
         WS/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBMJhbTXvzshnrOibk3wpFXgV2algG1sE2fgBg5vPlRak81mAWeb8BhqRJg3nh5Xb8xUT7PbCPW64=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8TIgjvz+ZkykCseQ2YUNBD3vG6i3x5NrxWUVOnlcwSdBaZxJQ
	IrdwRrY4swP34t/VHEx836TyUH91xg10RM2Mun44uDuITqEcltqUEnP406hkl21C
X-Gm-Gg: ASbGnctYBHAsBn9pEi1X4SODrLGT1/Q0HGhEUzEyTbI+5OFLtqIrdhdOVDdSaG9arXt
	8TOrmh4JhJC52tTe9yAPFzgGDYoJh3QylZYgST3WEE/Ij/lz5z7mRMNFlr8Pk84dIhL13T4lnhk
	rHBGzToVyIftNGDKQW+carK96Y01jsEpHkKQReUbE/w9MffNVZUKeWT0tPxsjjWeJVEUm8jX6ir
	Kqe6FNRRZmdeX3HXrxCWsNEzo/kmRJNs5Cm/9giAam7gcakdFSkX1/YFYXeOrYF/BDhP6a4qJBE
	YjceaWMVnkhy/awCHeTsJfaE5W8YkNiebPGlhfO4kYRSW133iZVhxinSiKMZLWJ3/RCQ4KAxlKr
	U0AheiNvtidoZ8Qltrs5yStUAQtUuK35pxWJatgF29/I72Zu1oizLnDMCxSBiuJzYi/devFTe72
	G3oAiK85wrf45cVtW/yotXPQr9KgauCirpvrzoRpY7wGhTfdJGruS6FRh/gMka59ZKpw==
X-Google-Smtp-Source: AGHT+IHudn4wc9Rw0jaM+dT7ajZ0xLPd+O8RxvshtGbYFKCr+YXAEgY1D8jUpwi2hZh1idoooj33ng==
X-Received: by 2002:a05:7300:f3c6:b0:2a4:3593:6467 with SMTP id 5a478bee46e88-2abc71dc43bmr1174301eec.23.1765028307527;
        Sat, 06 Dec 2025 05:38:27 -0800 (PST)
Received: from ?IPV6:2804:14d:4c64:82a2:4ba7:7b91:594d:8d90? ([2804:14d:4c64:82a2:4ba7:7b91:594d:8d90])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df7576932sm30215436c88.4.2025.12.06.05.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 05:38:26 -0800 (PST)
Message-ID: <de0b9059-30c0-4704-b0b8-9f4f5abfaa04@gmail.com>
Date: Sat, 6 Dec 2025 10:38:19 -0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: usb: maxim,max3421: convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, davidm@egauge.net, ~lkcamp/patches@lists.sr.ht,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251107001812.10180-1-rodrigo.gobbi.7@gmail.com>
 <20251107-agile-alligator-of-philosophy-03d923@kuoka>
Content-Language: en-US
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
In-Reply-To: <20251107-agile-alligator-of-philosophy-03d923@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/7/25 05:03, Krzysztof Kozlowski wrote:
> On Thu, Nov 06, 2025 at 09:06:22PM -0300, Rodrigo Gobbi wrote:
>> Convert legacy maxim,max3421.txt to proper format.
>> 
>> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
>> ---
>> Hi, all
>> 
>> At this v2, I`m reverting my previous idea about documenting new properties
>> because this is just a conversion from txt file. At v1, a question
>> was raised about that:
>> 
>> On 10/9/25 22:34, Krzysztof Kozlowski wrote:
>> > maxim,vbus-en-pin, maxim,gpx-pin, reset pin and supplies. Also add a
>> > Why new properties? You must explain not only the difference but WHY you
>> > are doing this.
>> In this case, I`ve kept the maxim,vbus-en-pin prop because it was already
>> described in the legacy file and the driver expects that property according
>> to [1] and [2].
> 
> This is not a commit msg. Apply this patch from the lists and look
> whether the information is there.
> 
> So again:
> 
> You commit msg explain any unusual changes - like modifying binding
> while ONLY converting it - and WHY you are doing the unusual changes.
> 
> Best regards,
> Krzysztof
> 

Hi, Krzysztof,
I was wondering about this again and I need to clarify the expectations here. 
So my v2 patch is only doing the conversion from txt to yaml without any additional
changes. That being said, at v2, there are no new properties and no unusual changes.

What happened was that under the ---, in order to save the lore and the previous discussion
from v1, I`ve quoted the sentence about the "maxim,vbus-en-pin" prop from v1. Here, at v2,
what I meant under the --- was that the "maxim,vbus-en-pin" was not new and it already existed
in .txt file and the driver is already expecting that.

So, even if I send a v3, it will be exactly the same direct conversion with the same commit msg
because nothing was changed from txt.
Maybe my intention was not right, my idea was to just save the lore/"answer" a previous point
raised inside ---. 

Tks and best regards.

