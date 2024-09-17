Return-Path: <linux-usb+bounces-15187-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0B097B28B
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2024 18:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19E311C224EF
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2024 16:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5ED3186298;
	Tue, 17 Sep 2024 16:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CTe+OBXR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417A117C9B5
	for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2024 16:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726588969; cv=none; b=IeYqGrCdYduCTPlCE9yoTNj3rYpyBa89g4ydjLe8Q1CEMzYa5gaoVHJuDcdqupkrUpKMQV7e3ku6YBo5Kvl1OauWgo8/sW11gBeccLP9saE17npR/DvucjbJnw+FPQFcic5IazAisK673ICgSLmojBEGZjq1B9pNjWl76bXkRsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726588969; c=relaxed/simple;
	bh=Lv9+R9dPzs9Ep6Gza/zkEy8eC4sP1UWhIx5xq/4buCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pigR4hIeKWT91sXIe/HaXt0OQd3DF1a871nvNekEOM6nS0b7q2j3XKihBtoHevOULRPJlanY7/mliKy6QbLFN7phhpkbSYl5SgRcrxRdMo51SN8V/GE5MOb7LFW/Y/sSp1ICBMZz5v1AbB6Csf7b37Fnz9IUl3AU7IVJ2tN8B4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CTe+OBXR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cb1e623d1so56803135e9.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2024 09:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726588964; x=1727193764; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o5TuisIvvO4eVZGC0q0fIWjLgFMzQ+uQ1tb0FCM/4bM=;
        b=CTe+OBXRkYb3QrTA0DnwgVR+QI2phwt/kNumECyubztHyExUoOdTZiwM3AmV1bvCXh
         8NaDVvQpc5l6N9s3kMy6R+XmycNFBa30vIbll5h8py4wBmpZTyUTkbF/eZrc2u0PVgGd
         fuzW8wFH9M1WSW5MIjKYM0ouiUBe76fsW78K1s1IHduU7j+srPylGE59+DP5dWTkw7vn
         Vnk2Pi3/u5SDE9UJaFczbfyDMTtZSjA7tGaIB5H5foE2JDUrVSWuCVE0udj0iwnUebSF
         R2xd9Lv2ZgV8s6oFXwfHtXn/08lEWMhpUEPpMr8603p2X9ntsqTKv+Wz+Kv+Mbl9pLBb
         rY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726588964; x=1727193764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o5TuisIvvO4eVZGC0q0fIWjLgFMzQ+uQ1tb0FCM/4bM=;
        b=kPmL+OuJJSqkqtDMnlByxGcaziOEuoNzXmVMJzMla5f3lbxFtlLKIa5GuV9Lweulnj
         96eK3jLuRvkFH1dXO6sTA1FyFTxbDISbWznbIY1GxurEr89TJ5EyVErlOJbvPh9jv+3W
         IrWWSRnpXyKoqjuS7CJxTha4VgvpCJ52e4BMZuIaBDoMMjRcWPym14xdGc1Xp4NXXTgG
         cJr6DBE8uFv1KuyE2ze/28UghXng/nmpC9GeAbKx8ytffxe/hg761qEMRj3pCYAzeo8W
         9gKi8wQhdri8U32xb/BHJGzCr9eeb0h97xtv9VgHW97Y/ArM1PUB8s/ieoNOF+AJW2aD
         ntww==
X-Forwarded-Encrypted: i=1; AJvYcCXWUSd36VQhRs6iAEZv6AOJy/i6JMK0udWI2+HwHdkH1fPXl6MBOJ/VMFMqA/tAGEUfbpQ+PdEGP+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YweYWOYQW2q4tNJ0JlplCClC31YDDzE0p0rYB/C1KqwlTwxKpKM
	CWcc+OGSc4MM4dQNEZSqDzoo2RW9t0RKhAk3YsWmJs9Bs/lLyLZ8vmg3yu8C7J4=
X-Google-Smtp-Source: AGHT+IH/OSek0hb5owPjPED5yfEZr8vM6Cf19Sn7fU+h9P/0PLG66pMxWENwlAHWAm3qVptMw0Sj0w==
X-Received: by 2002:a05:600c:3589:b0:42c:b63e:fea6 with SMTP id 5b1f17b1804b1-42cdb56cb12mr152252455e9.22.1726588963803;
        Tue, 17 Sep 2024 09:02:43 -0700 (PDT)
Received: from ?IPV6:2001:a61:13ed:c201:b884:edfc:abaf:1cf4? ([2001:a61:13ed:c201:b884:edfc:abaf:1cf4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da22e8d3esm107512145e9.25.2024.09.17.09.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2024 09:02:43 -0700 (PDT)
Message-ID: <64dfb120-3a95-44dd-a50c-c4818baeb833@suse.com>
Date: Tue, 17 Sep 2024 18:02:42 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: use mutex_lock in iowarrior_read()
To: Jeongjun Park <aha310510@gmail.com>, oneukum@suse.com
Cc: colin.i.king@gmail.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <d88289f9-e22a-4960-9b3b-ad0b3ab17a89@suse.com>
 <20240917154107.137653-1-aha310510@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20240917154107.137653-1-aha310510@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.09.24 17:41, Jeongjun Park wrote:

Hi,

comments in line.
  
> ---
>   drivers/usb/misc/iowarrior.c | 46 ++++++++++++++++++++++++++++--------
>   1 file changed, 36 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/misc/iowarrior.c b/drivers/usb/misc/iowarrior.c
> index 6d28467ce352..dbf0ed04f7c3 100644
> --- a/drivers/usb/misc/iowarrior.c
> +++ b/drivers/usb/misc/iowarrior.c
> @@ -277,28 +277,45 @@ static ssize_t iowarrior_read(struct file *file, char __user *buffer,
>   	struct iowarrior *dev;
>   	int read_idx;
>   	int offset;
> +	int retval = 0;

Initialization is useless.

The rest is fine.

	Regards
		Oliver


