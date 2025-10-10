Return-Path: <linux-usb+bounces-29128-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36139BCE6B6
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 21:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26B2819A063E
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 19:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC103016E6;
	Fri, 10 Oct 2025 19:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtsOKhaF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEDF13B58C
	for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 19:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760125593; cv=none; b=O3mjLUt02XvYWIfwsCPqFZyIcf+r4bK3c3vIQclxrU7hOO9c5PytitZqOH7h9Zm+UtdhKWAJEdeZ/xoWQ9xSAXXNOHUe328u3v24zQaF2xOR8NEjGh1d2NmF1ffJeWCp4WrFyuYgiAApN4h4bu4j9T8l1EgbqCYjRFgXJVBkhxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760125593; c=relaxed/simple;
	bh=8B0TxVKymUNconocVqaGeavIGwY7T0t3daf3VX2qAXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ufhVSz/rBcUQppIuiM6vqyeuT52/OTKfNr9l+DdTK7xIxzHunC9ZSatFOeaBZxX5FJIbRL//1RP53oaRlanS9PA2sAV/9o6PjOnd9fQqC5aPjNmRNbpSVNelUZLRkrecestlgjeRIrEuZcXigOlLGz9aemqE0V/6e13o9Yi9UuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtsOKhaF; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-32eb45ab7a0so2620504a91.0
        for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 12:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760125592; x=1760730392; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J2hlRuh4XWPBhw9XhKqVrIvF45UiA/YFigu+0H9k6fc=;
        b=EtsOKhaF/VZhqf/Xt+MOS0/65DKEVJ9zYyZQFL1pq0/lfqw1SQbZqVxxoDoCOY1Kd/
         wqtl48L4xkumSgAd6R6nn4E6xv/XjlPvzM0rNFlXGj9GXL+Ar+bmGQrtGUWw8Vhck5XT
         dQfYTwWYrgWRKMyG3GoBl6habgp/HqPqdHxcTh1zzoXzZn7xaMXAgytSTVF0+aEsqdm3
         JMUHDJJaJLIpScAUJNGOfXmrT7iWeJfvKCgG8CuT1DniJMrdPkX/Gqa1yyuxaIz4D4tq
         CAdap3LA8YObH9ugImFLxxbSczDTcwZ47EsBfqIUS0Jx+cgrexdnj5E/y4o6nox/nqeo
         pNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760125592; x=1760730392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J2hlRuh4XWPBhw9XhKqVrIvF45UiA/YFigu+0H9k6fc=;
        b=oRi93GCoKzqBNGFLaY2u041dZHqMZebgcEK4ZNoHcD4noGxvA+Uhz7QGgGh1u7eO4d
         Tv/guFngIBqMc3ddRylw/a1s+C/CrX7/hLdhihcJT3LvYVQ3fvxeSNrXb9MgEq0VOpYi
         Y8FlUbyyKoE28Ijayv9r6l0yB7nyekm4i8ECuEQc5M7lNYAZyVBDwCzqvIeQ+d9v7eOr
         katftLM9OgJRJ16yTPq92dF6MTFhhZy6Nz0WWjGhH/VmMKyHkhpBLtNcecpn5KFRa9FP
         eHOaKznYaZTerhBMTjEiSWD8WHMhMAthmlNyceO9StJbizOblV0lGEPZnLlY9DpRv8mj
         93aw==
X-Forwarded-Encrypted: i=1; AJvYcCX0Qgby71yeILpEx2g0ut6czLKkIGHcdnHTuByvEhrHHE4q5Bmuz2G+o0jRxwZcgIjEQMLjFPWRGAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJEhk3vFUVvIjXjWbxbwj0SuVBC0H60dZrS9frYRPPU6gahAzS
	yogoyZcyCgnwRfNBXZYW4sC7dzse89C6FEiLY2V8fFkUh/Ql1JmJzNAJ
X-Gm-Gg: ASbGncu9DVFbwGj741tePDwpI7zNUEE9Ufro/Zy9gDUfTga6EzSxnbgwKHT5zVJEQj4
	cdaYmBeT9IOGkx32g5+YHHBUYPYvOD2mNcn4VnQuhz/VQV9P6Jk1vBJcCyWjOw1HH2iuz+lqNW2
	sslJ4Ps52luSPZ+pkqpVc+qnTyDHGRYTOw++iZq3VNJCpP48LuatJQg/mWOmr87qxNAUCp/DLiA
	9Yovxtu476HbFokcED9qoLu232AIqx29ZikHZ6seo4pr88mSbX9VwjqwI/RqygTlUaWXc6FvrLX
	jkhciubs17HhAangRIUBHSzG4hyozAiwzZ4CT63VrEPAaRlKnx+mkwZYU+9JGA4628gbzNd7JH0
	T62vNHST5/RLfrJp7v9QIClNVYg64XMl9wfWNRaF6Bso/LaCwR57ZsxJfaVY2inXMg04NYSAtVW
	6KpvoqdXScY0qlrnHrsBKmPtczQOY/+f8=
X-Google-Smtp-Source: AGHT+IED75ZRA8aUNNWtEN0desHQoL9OpLop/JAYe/9l97lED+LZpw3Uwd0bVgno+BX9gPJUsMrjIA==
X-Received: by 2002:a17:90b:384c:b0:335:2823:3689 with SMTP id 98e67ed59e1d1-33b5114b63dmr17972054a91.4.1760125591793;
        Fri, 10 Oct 2025 12:46:31 -0700 (PDT)
Received: from ?IPV6:2804:14d:4c64:860f:5abf:20b2:7217:3f90? ([2804:14d:4c64:860f:5abf:20b2:7217:3f90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b62645851sm3734705a91.9.2025.10.10.12.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 12:46:31 -0700 (PDT)
Message-ID: <935dbd93-2b20-45fb-a5b1-04f6ac67615e@gmail.com>
Date: Fri, 10 Oct 2025 16:46:26 -0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: add yaml file for maxim,max3421
To: Krzysztof Kozlowski <krzk@kernel.org>, gregkh@linuxfoundation.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, davidm@egauge.net
Cc: ~lkcamp/patches@lists.sr.ht, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251009182046.185520-1-rodrigo.gobbi.7@gmail.com>
 <c65f8b8d-9ee9-4aea-8f27-66c9fe12401a@kernel.org>
Content-Language: en-US
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
In-Reply-To: <c65f8b8d-9ee9-4aea-8f27-66c9fe12401a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/9/25 22:34, Krzysztof Kozlowski wrote:
> On 09/10/2025 03:15, Rodrigo Gobbi wrote:
>> Convert maxim,max3421.txt to yaml format with a few extra properties like
> 
> 
> Here and in subject, please do not use yaml at all. Look at other
> commits, this is supposed to be:
> 
> dt-bindings: usb: maxim,max3421: convert to DT schema
> 
> (and all other things like "file for" are redundant")
> 
>> maxim,vbus-en-pin, maxim,gpx-pin, reset pin and supplies. Also add a
> 
> Why new properties? You must explain not only the difference but WHY you
> are doing this.
> 
> WHY is the most important question/answer.

The reason was that the device (the IC) supports that. Is it
enough to justify? I mean, is a plausible answer in this case? If yes,
I agree that my commit msg was not right since I didn`t mention that.

> 
>> maxim,max3421e compatible with a fallback, since the actually PN is with
>> the 'e' suffix.
> 
> We don't add PNs usually, unless there is a need. So again, why?
> 

The PN of this is Maxim3421e, Maxim3421 without `e` doesn`t exists as far as I`ve
searched it. If it exists, it`s a different thing. In this case, I would expect that
the compatible string should be something that "matches" the device, but in this
case, the compatible string is without the 'e'. In that way, I was suggesting in this patch to
allow a more precisely compatible string to no break anyone using the original one. But if 
it was a bad idea here, I can drop that for sure.

>> +  spi-max-frequency:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> No, drop $ref. Do you see any binding like that? No, there is none.

I`ve a previous patch recently at [1], that added a "similar" thing of frequency:

+  sampling-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 2500000
+    maximum: 20000000
+    description:
+      Default sampling frequency of the ADC in Hz.

In that case, $ref and description were added. Why that case is different from this one here?
[1] https://lore.kernel.org/all/20250522204130.21604-1-rodrigo.gobbi.7@gmail.com/

> 
>> +
>> +  maxim,vbus-en-pin:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    description:
>> +      One of eight GPOUT pins to control external VBUS power and the polarity
>> +      of the active level. It's an array of GPIO number and the active level of it.
>> +    minItems: 2
>> +    maxItems: 2
>> +
>> +  maxim,gpx-pin:
> 
> I don't understand. There is no need for this property. Drop.

During my other reviews of new bindings, my final premise was that we should add every "capability" of
a device (the IC) regardless of the driver support. In this case, the maxim,gpx-pin, is an example of that,
the device supports that despite the driver support. I`m wondering here why we cannot add that here.

Tks and best regards.
Rodrigo.



