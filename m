Return-Path: <linux-usb+bounces-27921-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 702F0B52C30
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 10:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5D2D24E12E6
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 08:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813AF2E54B6;
	Thu, 11 Sep 2025 08:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jvjdL4hS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39639156230
	for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 08:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757580591; cv=none; b=lhd8UCoCPd1j5ZVjWBNYI2AoTr4KRyUrBRPC1vNmtzJh9fwj4mHPSrPaWI8/0kT1AQUoUUqvMInNJhNWSISv+NJt5z75saCWBEftwkok6GYZ7sEInScoj/Ovvg6+lt0gF+RQv7PKoYaGEDbL9ow56Dc3KUOYIJgX8/+GA7ZnToE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757580591; c=relaxed/simple;
	bh=u5SAVB1AiRlMqQGXRJB4jSw85QavmU3D++h4837g58U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Goe7Klnp+ujEbqmDXcMfgYsGbTW+IHeZ8/9XgiCHPTsPvvdaxagJwPRoPnKU5oUQ7B+unHuqLFVg57NzCZK6tmZcdLbIBnjHhk8BIMvlRl2CpknU3aAl6su32cxGUtheS0qoMkCtHubPhJVtNHvIB5SKXw8ZvR3Hil7GG70zB2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jvjdL4hS; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3d9e0a6aa4aso57141f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 01:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757580587; x=1758185387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A+n2qzFjIH29gpELvJS/EUvO8c0GXFCkFLIwrmdWIU8=;
        b=jvjdL4hSsFPIIx8ZP89jEkxaZY4V2vEOviBACodADj0CVxJlVrGjWzSrvRrLQGTVEc
         sDLk43oR02VjDq5XPEbX24jd3hMM8nX3xUm/5MofE3xl2CrIRP5+bzWLFjyqiUzkAvX1
         AHGUCW0ZEjmhhzaPsEGsFjTVO9TFJYYsfRO3xaANmTQF08ARk7Vf8rOA73zMQHNfX6OP
         HvO8S9chjX3QX3Wd4G2ZVXUSWDtC2f2B3bA35WZKVZ/ltQqcaHak1ZeMljXUgAEu5uKq
         nYWQ6vavJQMoohji7F8ISGimlwgjjCR9J+FTzFjo2WjMsdOSzaWW/U3CXvZkERUsXVRa
         9Ryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757580587; x=1758185387;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+n2qzFjIH29gpELvJS/EUvO8c0GXFCkFLIwrmdWIU8=;
        b=aSqxAF6ZCrSVbn0N4B4QeBzg3wmlQN/F7ocSAXRQo+lpGli7YEpqO52mRqP+B2K7oY
         ub3iB1qTDYX+B/G8QxNETlbBbzVAW4+Nx8OYCMr6UPKL7LJKXL/xMAjb0pfdsCFN7+QU
         5Y7aYvY3uam6Yi0QLDVDZOYLasGkXUQuNBhL1EaCRcSeOHUTwIEZFJZYWqukEY3bhWYM
         2zxv1+t6vd0goURcIXDTAGp8aOwsZIIwnukgjHwxG1zU4STHDq8N0uHbbdTYLHECKvRo
         KSTp/nOgzegh7LgPz5GrQLnuE2Nw0Y8tYv8YM36CLevb0KhPE8Q3Ej8gvCMDD5FiQvdN
         v3Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVzaV9SpzhSx9KFJnGtsa0HVA7wMog41yW9M2o95XSq69OBqZd4OndDlICNwMraDo2Hc/WYmM0LWDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YymBuK6DQG9X9I5bYFKfSENMHRU8lFj+RF6k4NFJpHRcIKCzMLX
	Bi3SJJLnjGOPF23q444C85sGAHu66+Cc1CBoL6fPlNhQ3iU4jRwKxMjOmfmnvP+TZJQ=
X-Gm-Gg: ASbGncsv+QKfAaXRR/ePrqTperWN5Fq7QKtbWChRyRrUfhJBoEFR5kAo7twOq/UEUwI
	UEw+deYtL8v1bWTlns0SfT2ciSGxjHMPALizKB0zIStsb30V6wII6cHDcVxD6VjVRqDQ2XvZ8jI
	2zf+lVKsJjmqh79cCPQ1BAOoH0DyhCShgfEvdIDFthG6xczJ9VSnXNOpyXnv1DHdGUq61p+JbQP
	gjFPTXzWVBXbm1opijUwRVQCjz8fp9BBTaHsZASZQr0vKJDb/M44bF5yML6dPKaJlhm0dUctyt+
	kKs6ZAXITmYltHNNlv71UQiLkcUnpJe6kyXrM4xHPJv4U2mE0E598fspP5FrnKQ2G35L4SeICrL
	Gj3es4hka9aQfT1ZhZNMDdjz0ScudJkcdjKcHYPtgrZ6zWSqeY2O5Ig==
X-Google-Smtp-Source: AGHT+IGWuaOz+7JPnu+Er+Ao0nHP0VBBXvMkltS9oC7AYz8EMGB+ArI70ROGQ1zPJjzPmErI1mEB9g==
X-Received: by 2002:a5d:5d01:0:b0:3d1:22f:b7f0 with SMTP id ffacd0b85a97d-3e646256f0fmr8265598f8f.6.1757580587459;
        Thu, 11 Sep 2025 01:49:47 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607770aesm1616674f8f.6.2025.09.11.01.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 01:49:46 -0700 (PDT)
Message-ID: <d37497c1-904e-4a04-a300-a60a21bcc212@linaro.org>
Date: Thu, 11 Sep 2025 10:49:45 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: f_ncm: Fix NPE in ncm_bind error path
To: Greg KH <gregkh@linuxfoundation.org>, Kuen-Han Tsai <khtsai@google.com>
Cc: zack.rusin@broadcom.com, namcao@linutronix.de, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@kernel.org
References: <20250904114854.1913155-1-khtsai@google.com>
 <2025090651-unifier-award-3e0a@gregkh>
 <CAKzKK0oi85bnyT3Lq_TXz8YwFrmBxQd8K1q7hRDv-Oww75F_tQ@mail.gmail.com>
 <2025091132-scenic-avalanche-7bec@gregkh>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <2025091132-scenic-avalanche-7bec@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/09/2025 10:35, Greg KH wrote:
> On Thu, Sep 11, 2025 at 02:50:15PM +0800, Kuen-Han Tsai wrote:
>> Hi Greg,
>>
>> On Sat, Sep 6, 2025 at 8:15 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>>>
>>> On Thu, Sep 04, 2025 at 07:46:13PM +0800, Kuen-Han Tsai wrote:
>>>> When an ncm_bind/unbind cycle occurs, the ncm->notify_req pointer is
>>>> left pointing to a stale address. If a subsequent call to ncm_bind()
>>>> fails to allocate the endpoints, the function jumps to the unified error
>>>> label. The cleanup code sees the stale ncm->notify_req pointer and calls
>>>> usb_ep_free_request().
>>>>
>>>> This results in a NPE because it attempts to access the free_request
>>>> function through the endpoint's operations table (ep->ops), which is
>>>> NULL.
>>>>
>>>> Refactor the error path to use cascading goto labels, ensuring that
>>>> resources are freed in reverse order of allocation. Besides, explicitly
>>>> set pointers to NULL after freeing them.
>>>
>>> Why must the pointers be set to NULL?  What is checking and requiring
>>> that?
>>
>> I set them to null as a standard safety measure to prevent potential
>> use-after-free issues. I can remove it if you prefer.
> 
> So either you have a use-after-free, or a NULL crash, either way it's
> bad and the real bug should be fixed if this can happen.  If it can not
> happen, then there is no need to set this to NULL.


... or there is a second (wrong) free somewhere else, which would crash
and this NULL prevents it. In that case there is a real bug which,
instead of being solved, is being hidden by this NULL assignment making
it even more difficult to find and fix later. :(

Usually that's the case I saw when people null-ify pointer after free.

Best regards,
Krzysztof

