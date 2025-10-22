Return-Path: <linux-usb+bounces-29540-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6705BBFDDD3
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 20:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C18FD356D2C
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 18:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D04D34B18F;
	Wed, 22 Oct 2025 18:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="D1X0VidK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779E62EB5CF
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 18:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761158000; cv=none; b=lc5/zIXSvaxXkAQ80uep1whHJnWLbi/A7nh529EWYNCjIxDdXE/Z9IzbAgeq5wvtNQj9QK4GprPtNaS83YJs6qkYNfJGoEJvg+brTKlonwzEo7b/PkjvCfRRC/FbuNMquJqS/K1+L/4RkZQSPJa/+ABo5Va1He2GWgRP8oVwtvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761158000; c=relaxed/simple;
	bh=Y6xM503yPWNKtS2IjicNTibZfckvf7ae0PmU0sP9HVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yy8Czruh4OMJ7Kr7yNMfAxTPIkgQDN0DzrFJWUXuCOyOGpMdS+9QF/uJmnKSJaF1pmtqDbvSkSP7BYfwgxYzvCm2D80vPmVsmJ+myEYOKcC/0AC8xJLYWjupLu7XLE09u/yIRU3Zh8WhyM2TOyiGS2jktYkRpoYLP+ZvUeITLyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=D1X0VidK; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b3c2db014easo1560335066b.0
        for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 11:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761157997; x=1761762797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FC7+RgbKBfdE688HhTog0OZubor+X8TFuoVzPlpGuu0=;
        b=D1X0VidK5G/oOwgtyUbi8HVv0BBZYnsSajlyNeKZOaWmIK0pUW5jB1IwCxW8ajjVYJ
         dRbNb8TSYhgkJoj6ASiEThnnr7d8irjHr4RnICaCsktlIK3396NTH0b5U1phugoHQW8p
         CCZNz2pEWktgua3z9gdv/6IKpVQTQ4v2wtWzM+LhjcwjsHUz50+HVkc0o7Wuv1XYOG5T
         xKSlg8FmJBO0AvFf0HaeatjMD4vU/5FStexgqWeFnu+sjqUT3KvCwruYZIsDRwvCFABE
         hjLPH/2j5R5qLmoVymG4yIdhh/s1kV2g6IvdlVK131myoLit07OlgobFbpLxwabA993j
         cekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761157997; x=1761762797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FC7+RgbKBfdE688HhTog0OZubor+X8TFuoVzPlpGuu0=;
        b=thoyoyLkUCDOdHR/b0HH8gsL1M3vURv2UdTlW0+pRLChFMYOjthhc29+qV4Y3dB4lH
         H+mJ0znJ5c8J2l9cijlkb22ehNZOsYWvFRKL4Z1y3Ay/P02f4Du0wbf6wPcaAMTqL3Sa
         LyX/mAEdsW7sP6cpJPtJpJu0sDh0hN6WY92uyuh5ZgMyqfppsucbWCqHKiygPk4DJ6ik
         7bISY48FDpADNDVy6ytl0dyyXmMRJk9Dun2Bf6KpW+I/yDkIjZsrUWkwhwdo+e77jaLk
         w3C/f6jrN296JDxYdLdgn+hGmsRjggA8QVOx95GBG41XScdPJ2TWcgPzgBM9vXmRo21s
         v9Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWVX3uqxARntCY5VAljVRd4KYh+gRLZ12Z+El0fGXEkUq79xZRXfg4idqzavrc+/oneSfA2HnfCoO0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZtqFAsELrG1/NHKlulWO5Lm8LLhDyEQvxYhM4MEFgQJTWfgQw
	LTEz0iAtRKvimuJrtZcjvs9odGqy2f1gM9bQi5RY3wdFnnOKxgIFt7SRcc7Tppyi6iM=
X-Gm-Gg: ASbGncsD5cqEcwjvge61NOcY9M4JLUs5IzHKA+qhUXYkLHRRbJf4cmoNf6jSV3JkPFM
	xkO2hVMJbUW4ceQft0bpEm2aCee6aYo47ew2YgupanhX7JzIsymeTb46II0U5eASLH9Ay4NvA2L
	YEwkYljVTh16gNc1u6J91BhZUr3P8ef4px7/Wpt4U1g2M2e/qM15I97z7KCWKqP8rnmzk/JNXS5
	04wAx6Xst2u6Bx2LwQGwd+GK/R0xKusqBGm5KGQTrJW6yvOEjZM95c3ZG5aU/Ad1oGtkt8bsbYI
	QzVij8vs+pUSBserjEclDUE2+ExI5lHHHbiSH4KF80JWxuXnRyJOFin+ZkNBfQ1yuKCWfOdI9uN
	uDk0qWv11QGF3HT0yEj3l3NLUgzz0QW6NkT+p/8WOeYqCPlIDTTE+mW7TUHsJkPvcd23EC4Qw/5
	8AQgEuuN2KEt23ncaNQ9OH3/ArVprwsLG8B022DmNEy4nN07N9sOY9mA==
X-Google-Smtp-Source: AGHT+IHxzEPyrLcXfacrbScfXM2HqLkcG1uFN73tatd+oYI9TqOWUilaqoT+hFMfLMGn7WplZV4gDA==
X-Received: by 2002:a17:907:6d25:b0:b41:abc9:6135 with SMTP id a640c23a62f3a-b647493fa65mr2623446566b.41.1761157996669;
        Wed, 22 Oct 2025 11:33:16 -0700 (PDT)
Received: from ?IPV6:2001:a61:1373:ee01:2756:594b:8e92:5d4b? ([2001:a61:1373:ee01:2756:594b:8e92:5d4b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da25d4sm1394620366b.9.2025.10.22.11.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 11:33:16 -0700 (PDT)
Message-ID: <2d6f38de-1860-42f7-bf70-bdff7915fe08@suse.com>
Date: Wed, 22 Oct 2025 20:33:15 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: cdc_ncm driver and NCM 1.1 revision
To: Terry Moore <tmm@mcci.com>, 'Greg KH' <gregkh@linuxfoundation.org>
Cc: "'Ruinskiy, Dima'" <dima.ruinskiy@intel.com>,
 'Oliver Neukum' <oliver@neukum.org>, =?UTF-8?Q?=27Maciej_=C5=BBenczykowski?=
 =?UTF-8?Q?=27?= <maze@google.com>, linux-usb@vger.kernel.org
References: <6c22b4d5-7d6d-41ab-9b00-9dccf3ec8963@intel.com>
 <2025102259-purebred-amulet-b6d2@gregkh>
 <00f101dc4361$7a5b8860$6f129920$@mcci.com>
 <2025102208-copper-aspirin-b1bb@gregkh>
 <022b01dc4381$2b8aef80$82a0ce80$@mcci.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <022b01dc4381$2b8aef80$82a0ce80$@mcci.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 22.10.25 20:24, Terry Moore wrote:
> Hi Greg,
> 
>>> We're working on an interop test in December. We really hope to find any
>>> active open-source developers so we get them involved in the interop
>>> testing.
> 
>> Do you have devices that we can test changes with?  Without that, it's
>> going to be hard to implement anything.
> 
> Member companies are working on devices. MCCI plans to have a test device;
> we've sampled to a couple of the member companies. It's a USB 3.2 gen2
> device for engineering purposes, MCCI's Model 3411 board with updated
> firmware.
I have looked at the spec and this is best coupled with a revamp
of the API between usbnet and minidrivers. Other than that without
a test device this would be hard to support.

	Regards
		Oliver


