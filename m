Return-Path: <linux-usb+bounces-29077-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA90BC81D5
	for <lists+linux-usb@lfdr.de>; Thu, 09 Oct 2025 10:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 144824F65D3
	for <lists+linux-usb@lfdr.de>; Thu,  9 Oct 2025 08:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39712D322F;
	Thu,  9 Oct 2025 08:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NEOiBOSl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423BB2D2388
	for <linux-usb@vger.kernel.org>; Thu,  9 Oct 2025 08:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759999577; cv=none; b=LnAyVPO988sX2yg+Z0FicQngpWPxdKLvwW9dW6BPuY3yaU5OyuqMrzxFhVf6DHjSi1IKYfhyv71FVjHKoBtcjRjZwLlKLpQG8VIxRCPwQoZq8B+hJMvBaKTKoaZ142Z6RK3UKIjtWfcBvgEcL0vFoVwpHXnxeKwmigwpL/N6t8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759999577; c=relaxed/simple;
	bh=j9tui5eJzJLsax1769EHY8UHjMyQ6/zsXBdKNns+VaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sLRfAGahJ8aoMrH7JPv+6yzum8c7aejkoZzm/S02B/VcJunru7NWPyoAgkt1Mix5X+JYsKhJTWwrDbVOv7mXGVjVTpFbyBSrVofvGt7UHfQDqgMpVuYn8dnUyCEQxDDIx6my4hc5ma6tSTHIQuWz5CFzuuD6OrvG9/Fr/UC9HUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NEOiBOSl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e34052bb7so8639075e9.2
        for <linux-usb@vger.kernel.org>; Thu, 09 Oct 2025 01:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759999573; x=1760604373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rvj68KFSR7ZfwqQ2z1ObDxdGhaWv0RqpFINxidcP65M=;
        b=NEOiBOSl+zrrhbCj/qu3nQnmySE8VU+tWtu7OaVcfbp3syKIAziwgdTIQ/T8bHTyHs
         Hypk8dWyYyG6hIlwTXAuIYRFmEW1tKvlCYrPdGzSn+a2MH+c3AL/mb64tLNqiMhRMVy2
         FzHUDXzLX9GITUSbH7nJ34WmSfVLkLjg3OTPBCQwXYGRXPVG8fVNAPDKkH/xWSwOyoZz
         842vc1+7afg1P8dSSlKzrRn27qREXchhWjuw3ufo6QtHtYcns5f9UJyyulTrseytATj6
         ejHkE9sbvk+sbNEJ83U918PR6aD4XLAtN6pPlXbf6NUqp1qd43M+swhVe11LtYJSourF
         2Yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759999573; x=1760604373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rvj68KFSR7ZfwqQ2z1ObDxdGhaWv0RqpFINxidcP65M=;
        b=VZaqBqtI1xsbRMGyXHM7Dwx6+W+MlZ4UrS/QdSavguRufwwQ9AGe3FztwS/Y4sziWC
         BpySXy7BfY9epAvUks3Uhd7NTc63o8Zrkx/TrGU+0MjB1sChFi18cflYQEyA/OKLRW+a
         qkWV5OhcRb4lSEF+UVpFCyfOwE6MbzGCqvMlHyojXj+XdPt5s4q6sYP3tI7pMMdmC+5f
         pr5NZRfI0AXF6Ir1h4QroXZi3ag3hqeaG3KdjdLrc+EkkoxJRULKrED6SwcoPdrisiqK
         z148BliRdqFsZKpvfU0btt0SqdRj2ZawhgQvllGU5TYYLQNZ9XL+47RTtRZzqgKv1bLI
         JSRg==
X-Forwarded-Encrypted: i=1; AJvYcCVA4X5K5D8DLGVlmUMnevX0lNB8L7Au8i23SF0tC9Zr/lpo6R04q/Q3ijYfgyqLkVGlOzF6Vx61S08=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/sfJt2WpKnosZv8frEmhRmVprIcv/jLRoPfIvtTyz7Y+GXxI/
	cu+sCkERXHZ9hHFXRz/G2iUod9m3uwlgSFAc1q/ZG/xqU8gwxgS9tnPtYcTOY6E9eto=
X-Gm-Gg: ASbGnctLJee8XZatEePV/tUSomuUnC8aiTz8a2yL5QETsOIdc/PzPC+CwWC/SY42Ts8
	wObFP8zTcFLxRW7M4o0XI2awa6FyPDocBbJLgmd/swIIYhCv98yD8qsiYAblP9CebYkUrySLR0N
	GJa7j8bwaHCwbiLH5+Wafk76SvCsuH01sW0yYQJEl2LBr/YPqeVPACLDeZ/FUXEwBRxaChm5rKu
	XAHHf++jEbCA+ChFrK/q8GvSbM8EGhVrYuFd9i1rn0XlnakaJ3LMWtwGJCpzwd2PoUbwo3xEmb0
	14ILP6gtadbn3cuHmAprYgC3/6iOsj40RXg0c34g6zblobvHFbDjoA2Ez0P6bHB13OKq8oK6X7r
	Fy8g+03/W65q8C2NvNx2Nwilx7/nBzv0JC1DyGE0Sb9l4WERjHDD2QVpMghUc4z9qOQU0lAoCfv
	6cB3FzBGcmmMk0TeH3Gqywaw==
X-Google-Smtp-Source: AGHT+IEi3HXnnC/f370e710EbqpsCcLPh7EpjlOM2w7z59g46v3Q/HAwcoGhELlCDCUBjaGSNJxQJQ==
X-Received: by 2002:a05:600c:46cf:b0:46e:35a0:3587 with SMTP id 5b1f17b1804b1-46fa9b02cebmr47668335e9.27.1759999573232;
        Thu, 09 Oct 2025 01:46:13 -0700 (PDT)
Received: from ?IPV6:2001:a61:13f9:6a01:5105:f83:acc3:eef5? ([2001:a61:13f9:6a01:5105:f83:acc3:eef5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9d71489sm74645875e9.19.2025.10.09.01.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 01:46:12 -0700 (PDT)
Message-ID: <3a1b4778-4cf0-4483-9611-93b37d9a2361@suse.com>
Date: Thu, 9 Oct 2025 10:46:10 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] net: usb: ax88179_178a: add USB device driver for
 config selection
To: yicongsrfy@163.com, oneukum@suse.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-usb@vger.kernel.org, marcan@marcan.st,
 netdev@vger.kernel.org, pabeni@redhat.com, yicong@kylinos.cn
References: <666ef6bf-46f0-4b3e-9c28-9c9b7e602900@suse.com>
 <20251009073450.87902-1-yicongsrfy@163.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20251009073450.87902-1-yicongsrfy@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09.10.25 09:34, yicongsrfy@163.com wrote:

>>> +static void __exit ax88179_driver_exit(void)
>>> +{
>>> +	usb_deregister(&ax88179_178a_driver);
>>
>> The window for the race
>>
>>> +	usb_deregister_device_driver(&ax88179_cfgselector_driver);
>>
>> Wrong order. I you remove ax88179_178a_driver before you remove
>> ax88179_cfgselector_driver, you'll leave a window during which
>> devices would be switched to a mode no driver exists for.
> 
> In my init function, I first call usb_register_device_driver and then call
> usb_register; in exit, I reverse the order by calling usb_deregister first,
> then usb_deregister_device_driver. Why is this sequence considered incorrect?

To explain this I need to make a chart:

CPU A								CPU B

usb_deregister(&ax88179_178a_driver);

								New device registered
								ax88179_cfgselector_driver:
									Device switches to proprietary mode

usb_deregister_device_driver(&ax88179_cfgselector_driver);
[This comes too late. No consequences for current events]
								No driver. No probe().
								Very sad device. Disappointed user.

I hope you excuse my attempt at humor. Anyway this order is incorrect, as I hope
you see from the chart. Now you may say that the class mode would not work
anyway, but that is an iffy argument. It is better to have the order that is
right.

	Regards
		Oliver


