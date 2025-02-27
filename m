Return-Path: <linux-usb+bounces-21176-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE38A48B73
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 23:25:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94ECF16D0A9
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 22:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6BA23E35C;
	Thu, 27 Feb 2025 22:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GSr5EiiN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0F723E34E
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 22:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740695009; cv=none; b=NDPfJCBLHpVf9I6XTBBlsRajnNX1HR6pFdNeBsR9iLfZrGevJdEDFjs7rAJIh428S7E887gkzeybR5RU7j14Kcxf8HRrX53yQMe41Z6OQW62rT5YCCR/XjclSf/Y7u8BwBFfjzI5CHGm1qoAlZ6ZRMhDTqnbUkR4sXqW+tGXy6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740695009; c=relaxed/simple;
	bh=0YNPSWTQpWa/D7GXeK/2uRq3i3eL4O93TsB5Vt1ZrbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H1iDWbNawIYLDeXBO5ngpOeCjuHa+4uQZ/WYas4wI6u4bYIhTbN47yx/YE75JOIqy966xBCoSPPJHs1RqOXC+6afl1cSAWuYDeBrJQbVPXfgLdt9PBCJgD68Su7UAvNgNmVJjoZNkBZhM0AlFgN69v82KT0eLBvQS8yfHqd0rpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GSr5EiiN; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3cfc8772469so6139205ab.3
        for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 14:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740695007; x=1741299807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WZGLdBAP4UrHwr4pwKCt5KapJuR+y6gbHDi1DCQWdcY=;
        b=GSr5EiiNc3IGIsq3xZaFvkHePID4hJpiDago/iR6MeyJvY+CnPwDhksatyKDzQiaVj
         +KtedjqXogUOS0ascY4nL/RBd/1yscrGPVrlbxZ36OEt/kHMannHfGFFexjVfHGBUw4e
         uPLYDqgNKNyppEzSuc1bKjCH7e0VKeyA2gupc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740695007; x=1741299807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WZGLdBAP4UrHwr4pwKCt5KapJuR+y6gbHDi1DCQWdcY=;
        b=G/z+fNyYMkQGxQsFML0mkEABsbknE9nc3gTiAaoj0T9fXOEvQ9MuJnd1bhRSOZ0GSU
         1UhonqoBqyOJyMawoexrQvvOUS8JmLhjSNrSkn7ktwR9YPtR9+oSmvmr/o7sl1aR5dxW
         36ewQrjS2IlgRnrtM/G0MW8pz2h3bc3e4I8770IfC9YrcNfYV2T7W1ePiRxbveWTAN7S
         w2623h4g2EocshhYCoQ46hhJ44tyM/ZmxtiNqPat/AUHFJjObhsN4+dz/zU014gh39dx
         mpM0AocXjkkIpRIH0Umu7qos79qaltFiPeSJK3JsuBYvOWVvuqyKkdomHcoieFnBQYQr
         6Qlw==
X-Forwarded-Encrypted: i=1; AJvYcCW6mkJY/lN0UZ8K5T/UkU/m97YFikPJGz7lwOnuzRx7TLXgYmaNOr0EhyDgmBbiRr3J8tqiKvYX/ck=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeehmKgDjyh7io5/IRqYpTeL13O5QRdBgO7RjQ9TzEHrTCQkSf
	TCX+gwNDMmwefp5oufD0yM5+440iTYTUUgZAlCC5T6NogSRtaICe1ix6tdiafF/nNxd4Dr5U88U
	2
X-Gm-Gg: ASbGncvhj2Piu2kx45hR1nDbeBCgCjSsDNWIitIlCaXB1wopFLexEJ+FbGzwnY3oeIW
	g0SKrXXmwB2bqiLl6IMNu7XTuldn8pbrPHJLCGni1Q2SjEvLhmOAVzcwqh/L1KaIO9wQ8vlxY3w
	BhIIGXJGDkCu8dCQF2lKtYhoyfoy79G9Jmz28zp55f2Bg/0+dLBRLRrUxpLtETa0mpLjTytdT3E
	EG9tLIlEcnIUwULiheuFbJgef3DR4cZfycZGXjzVVOX2hRC5rT53vQho8Jyn9npfdBxRaHE3YoI
	d6rnY4pECwMlR/aPjIQEvWYqEM/bxv2mkscW
X-Google-Smtp-Source: AGHT+IEKZr3NGXPy1Tv5y66C8yGg4ClACZyJG7v4CYzLbHYBMX19ZoriO50XGMis7tUv/ZwDiVzyTQ==
X-Received: by 2002:a05:6e02:184a:b0:3d3:dd32:73d5 with SMTP id e9e14a558f8ab-3d3e6e23403mr11186115ab.4.1740695006941;
        Thu, 27 Feb 2025 14:23:26 -0800 (PST)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d3deee5d4fsm5165025ab.62.2025.02.27.14.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 14:23:26 -0800 (PST)
Message-ID: <247c7e15-bbff-427f-8315-ca463f8b933b@linuxfoundation.org>
Date: Thu, 27 Feb 2025 15:23:25 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: Fix the error limitation on max_hw_sectors for
 usbip device
To: Zongmin Zhou <min_halo@163.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Zongmin Zhou <zhouzongmin@kylinos.cn>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250219092555.112631-1-min_halo@163.com>
 <88b2fb4b-96a4-4d29-bf92-4064d3572fa4@linuxfoundation.org>
 <5a41d6c3.8c78.195371996e0.Coremail.min_halo@163.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <5a41d6c3.8c78.195371996e0.Coremail.min_halo@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/24/25 01:36, Zongmin Zhou wrote:
> Dear Shuah,
> 
> 
> Yes，the usbip server get the real USB controller message send to usbip client vhci-hcd，
> 
> must have to changethe API between the kernel and user-space.
> 
> The easiest way is to simply set vhci-hcd dma mask to 64 by default,
> 
> but not all USB controllers support 64bit，That doesn't look good？

This is an expetnsive change to fix the problem. In addition this change
is unnecessary for non-storage devices where USB over IP is used.
You mentioned this happens only in swiotlb cases? Can you explain the
configuration on host and client side.

I would like to explore fixes that are simpler than what is proposed
in this patch.

thanks,
-- Shuah

