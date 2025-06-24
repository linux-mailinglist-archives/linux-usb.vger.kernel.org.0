Return-Path: <linux-usb+bounces-25039-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7A4AE5E9B
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jun 2025 10:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22D7F17AE4D
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jun 2025 08:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E522550A4;
	Tue, 24 Jun 2025 08:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FjtZ9j/g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EADF246793
	for <linux-usb@vger.kernel.org>; Tue, 24 Jun 2025 08:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750752131; cv=none; b=WZjPVYtF4mOD23N6HAEnU1IYfNqUuRb4g9v3MKI7xOFm6CS3TET0yHLKr+/zNTkThFuhz4QmmhvEdGwnvxF0xQjr4UT4BVo5N/QMxt3I2Se8cAhcwcIydBNnyuFi3AH8z4KmFb/XEtECH14YE/s6xvF1Tgln/9sMc6CxzWfvwJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750752131; c=relaxed/simple;
	bh=6RJ35Le43lWBAzVG4/jUlEyKbx+1PoEcme8RrymJVbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jhuqTaRq1GBgpuo/n9X+ItndYdjL0WMsLxCmSZZWQp5vH37xwcCdqwQ5LRRHVNtzOzrVQ12+Hg6D1pas5JzCjNuV3kO7sZlY6Wpb86EYQPSYLcrPxfKj9eidUmTjfWLxGwroBrOLnfj8Vk0h540uHQtnfv+zuii/wGG1WM7bljc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FjtZ9j/g; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so1657717a12.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Jun 2025 01:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750752128; x=1751356928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lFrQ1pMI4pxJoYVMvbXoXA6AuXo1ZRbUlGABw1ebDAQ=;
        b=FjtZ9j/gJmuoimsIpJ05k5xEkNDfCoDGapX3l4j+Jdq9LpQ4pvjf0Z4Mo6WfeF3Fhu
         XLTsenPkQ42iUb33GxaswOuFn5ybQXr8qIZdcOuzrB8Jz7mM8Rg4vgoNG81syg09LGD7
         HFANUtMQO9MGy6b7XubBajJNnRG9U6CJel2tVB3kuao/4K/wzwHPnj1l30QlzXMrO+ei
         TXhuFJuMtE0ern+xFp1vVZWj/eu5XUSay/NgPB9gfd18OJX/KYM277jvuaPf6nkdxf7h
         E+elcmLs4/BlZfp+371mxjthjxXlTtTlo408Lq3WeQ81Gqq5zF7OYnuxMMXDGnzBiMtW
         ewBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750752128; x=1751356928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFrQ1pMI4pxJoYVMvbXoXA6AuXo1ZRbUlGABw1ebDAQ=;
        b=nsVzNuvbocWC8ZTq6VIYJgoMn4oy5FUeY7LgvxZ+7SozuFksVlPcHNeg84Mz6qKzGh
         X1PPWQZFXyT2wLRvtATk0ge4P8UBMNrQMyX1gAUYX/rBWUHDJEfUbVQthR2Z1K4M/7nL
         UhIdBclRvnzRzgORkAx06BmmKkU+OwSZHvIbFqXAZzcAKzPNsuLlgGUYFnikt3dUIIrI
         z20HIyCDrIvVrE+ro0PDq2LlWAu0CL8tKS3WNnNFzHHSHcdwlwxVzlCnwUxG1wsdr0R1
         bUAse+oJepRmiWSUgmVkPNX5aonQFau5Qek45zkT8D478IYyYnRvJx17quO3fqcT676C
         Nn2A==
X-Forwarded-Encrypted: i=1; AJvYcCWty0SN9y67msSQxHJ8FwFdWgj1kLGbFxi7Qdhy1mFc5R6n1TTHR+kuCutjDGqDFZ18oH3GciDFtdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPPdCrNni03/ELzRXHVO7q985qLwtqu8RavqL0rPk5jOlmXdeR
	l6eO/7rmxMGmKXXHHO0LN/jJgRnpU3C1plI3bIPxhOJwy3w6W28Uj6zt93DkfX8gkMo=
X-Gm-Gg: ASbGncsWHXomoLS4aMTtQV1rOppwoLO9ymWCHvXsOU3iPLJAjy0tVBTyHCmgbNDfjve
	bEUQK9l+4XUhE3nGT4CbGwicvQ8emfhK4LViY80x4xlM/1H4+MEX9YsOFxKDoJMFxBmjSsmm7lB
	RhliHTMMCiDUUrLm+xv+DYLkbBMvRJTp4+nOfMlOSxF2beT3PXKpSoZnhyKp6wRXpQFm0UvWFyB
	p2C23Iu9vQ2N38WAhVRy1wz9qO90u/9XGmeo5MmV9cryV/s/mu7wSkc4fpm/ccX+bEGNNYr7E0r
	gNWsyplM1YlcrZIjMvQcoyP26cQU0Az2kcA0vM0w1UTCYduwOMkcLDJK4HGKhHEz8/tpVPQhxCY
	5uB52NSaP59eR/KW2U7qIHGvP55i2
X-Google-Smtp-Source: AGHT+IEdr+PvVsdvmAzpLHvmFL07SmrEujVejrlyKeJmYOHXna0duMtEQ8+NC1MXRgl8ZmvM7PXCkg==
X-Received: by 2002:a17:906:794d:b0:adb:e08:5e77 with SMTP id a640c23a62f3a-ae0579c3084mr1501065066b.20.1750752127797;
        Tue, 24 Jun 2025 01:02:07 -0700 (PDT)
Received: from ?IPV6:2001:a61:137e:6d01:d4a1:a0e5:eaa3:6f3b? ([2001:a61:137e:6d01:d4a1:a0e5:eaa3:6f3b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae086a98f6dsm398436666b.32.2025.06.24.01.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 01:02:07 -0700 (PDT)
Message-ID: <f2419bb9-2d81-4a6d-838d-b404e3ce7786@suse.com>
Date: Tue, 24 Jun 2025 10:02:06 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] usb_wwan : add locking around shared port data in two
 FIXME-marked places
To: Abinash Singh <abinashlalotra@gmail.com>, johan@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abinash Singh <abinashsinghlalotra@gmail.com>
References: <20250620101747.39037-1-abinashsinghlalotra@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250620101747.39037-1-abinashsinghlalotra@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20.06.25 12:17, Abinash Singh wrote:
> Fix two locking-related FIXME comments by adding a mutex
>   to protect shared fields in `usb_wwan_port_private`.
> 
> - In `usb_wwan_dtr_rts()`, access to `rts_state`
> and `dtr_state` is now protected by `portdata->lock`.
> - In `usb_wwan_tiocmset()`, access to `rts_state`
>   and `dtr_state` is now also synchronized with the same mutex.
> 
> These changes prevent possible data races
> and inconsistent state updates when the port is written concurrently.

unfortunately this patch is rather problematic because

1. you never initialize the mutex
2. these values are read in usb_wwan_send_setup(), where you don't take the lock

Now, as usb_wwan_send_setup() is called right after you drop
the mutex, this patch is kind of inelegant.

	Sorry
		Oliver


