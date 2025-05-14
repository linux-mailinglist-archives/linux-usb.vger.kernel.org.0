Return-Path: <linux-usb+bounces-23945-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A9FAB69BA
	for <lists+linux-usb@lfdr.de>; Wed, 14 May 2025 13:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5EC81B45F23
	for <lists+linux-usb@lfdr.de>; Wed, 14 May 2025 11:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F371827467B;
	Wed, 14 May 2025 11:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aNof1HXb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5412E42A82
	for <linux-usb@vger.kernel.org>; Wed, 14 May 2025 11:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747221788; cv=none; b=J+vTJHTox8u7qpYsGwKT5zNCZXHkkRxraHZdTvIx04ATeO6mDll8waZPtDHBXp/K8MhvDO2nUu8JEzK0kOAa6paF6FfPwYTq6+mtTcLBy1BWMqaqWxgVLh7cxB1H4JqTG4+jMJALqS6IHdWirEeGAcjdBeKwgjNu0g59Rc1iSxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747221788; c=relaxed/simple;
	bh=EfetSGfqB81IHkN/PGxR2QwCQXA/JyJpHsnfb7Zgb8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I+qG1/6Rq3WHJ4lX8quTIp8VsVAexe3GjXSSB2iseql+jHHFG1+UvdoAw4uF4wCBTyIOEKQ4wFcR9YOUCty9XdegU4ZJqYEe7GEWXTfCZjH1oZ/1OO+7XKzKYRK5laNNYgNqcLfVOf3CuHVIDzwKC3QhVLyUKMiNNz0+kBXQx+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aNof1HXb; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f624291db6so11389719a12.3
        for <linux-usb@vger.kernel.org>; Wed, 14 May 2025 04:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747221783; x=1747826583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=btVpNFKgUcPUatiYhN505Sc3nSf9yR9Iw/noU9VBOO0=;
        b=aNof1HXbRXUR1cH1MIz/DrVjWmj9beSY3mN2uy0ppmjZ7oZEiwamT++74sUtBaBBRo
         OPIjo7nc0f7nkcwA2jf7KFTiwNiAK02GB8SD5y01g2vOK375MOVkTHVQs73yWV10MLeJ
         xlXJFccreWu3mi7pjk1O8kWAhmq9RV8vq8ekbNZiLkKthTaEoXfcubm/XdUrH67QyFZd
         WSCIj8CTjaJraMP0P+q4NDnzi+xbXQWZVcrVH4y/90+qTCxCrGjOgtZYJiu5otZM5iD2
         NT7lw+WoBCkx+qdD4eCfueUujEfnHJjTbb/SOzH58TzlZ+8Vo/OGn0ajd/MTNe7T3BEN
         SwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747221783; x=1747826583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=btVpNFKgUcPUatiYhN505Sc3nSf9yR9Iw/noU9VBOO0=;
        b=BBDZWKO5pb4sXmHzawAo9n/9WUxGUD0t5yy1hCQXXomiKr5Xx4kXdrXgLu80c8NCKs
         NXbMf5WuVVh3Gxfn9itdBdBg1D+fR5DNlWuUuZA+DGbGefHLJF/Qi2PxlR0BB9u4Ldfm
         u481/+11RYbmYF7yhcXLFuJpgPJfP7p24OnGxXRr+GnQFlIMirpyJMM6JloemBzqUVld
         yYWeJRiuFictJm+DD4h2QzSc+NpW2w+dEa8Kk3SZ7SEB0xdZwqhYXCHiWr9MT49LY/02
         vRDeI01sdfUCzzPGrX6v2i04OBYd2OBCUNVJN2gJ+EPf7h5mYCmOaPmDayUCvWluNHE5
         Gf2w==
X-Forwarded-Encrypted: i=1; AJvYcCUKR5Q53oTAhKsdofOw04RMz6GybcQzHiDrTp4N2X8XN3fOraWYcfLRsT+q+GC+jQdbHr7KDjo78cM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7xevzbC23cmni7aX3E4eOBHJPS0qgPnEw/49ZX0G4APJybIJ6
	jthhWYfH/tCOW+grNhtGFmcPhjCYSsKDmE3YUq8L3iss85WqrSk5wRHbRkd0qW0=
X-Gm-Gg: ASbGncvEiuBdFVAKUxDpT9sV5UrLR68/KCVp7i384HP2hRC7yMCP7EpyGMCRUPLLmHM
	hH5m9/2lG0e+KF/iXyvgwCscejwZA/bKUgmK8crSiSw9z/rLKVFmRxJwGGUGTHEoQheCKnBVo3J
	UHecT4gMyMj06dshqbNaBn8Rtn0gkVes7QpOcRoNSw4jRQF3qQ5DVKTCDGt3EnC5YnJbYHP1Qjy
	8iPa10LUZ8XgoLId3b9xzR/tx0tYxCITIDweK1gQN3/VKc260Q9iKiMX8Jt7gvrYP5arrz/fBha
	v85WDFtEY+a17Bj/F0NoR3rOtCFw06tojPG6XB+VeOXFgYORLOGlehFdZpjnpxJBB1XcEez84ae
	9Da35zFQ1HN6d6CZA/X/zjsbwJ96n
X-Google-Smtp-Source: AGHT+IFd1ZVLlqOazM0JM6spYOaDAtNpkRG4R/J+DRb7NLGEkcdjusWFkZMkSqwh1fAuoOXWtmztPQ==
X-Received: by 2002:a05:6402:4304:b0:5f6:218d:34e6 with SMTP id 4fb4d7f45d1cf-5ff988dc0famr2575205a12.26.1747221783487;
        Wed, 14 May 2025 04:23:03 -0700 (PDT)
Received: from ?IPV6:2001:a61:133d:b101:9ea2:16fa:3380:8e40? ([2001:a61:133d:b101:9ea2:16fa:3380:8e40])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d700e6fsm8527536a12.62.2025.05.14.04.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 04:23:03 -0700 (PDT)
Message-ID: <51fe78fb-5d73-458f-b3d1-fc84cd6c5869@suse.com>
Date: Wed, 14 May 2025 13:23:02 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] USB: core: add a memory pool to urb for
 host-controller private data
To: David Wang <00107082@163.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, oneukum@suse.com
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250512150724.4560-1-00107082@163.com>
 <20250513113817.11962-1-00107082@163.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250513113817.11962-1-00107082@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13.05.25 13:38, David Wang wrote:
> ---

Hi,

still an issue after a second review.
I should have noticed earlier.

> --- a/drivers/usb/core/urb.c
> +++ b/drivers/usb/core/urb.c
> @@ -23,6 +23,7 @@ static void urb_destroy(struct kref *kref)
>   
>   	if (urb->transfer_flags & URB_FREE_BUFFER)
>   		kfree(urb->transfer_buffer);
> +	kfree(urb->hcpriv_mempool);

What if somebody uses usb_init_urb()?
  
>   	kfree(urb);
>   }
> @@ -1037,3 +1038,25 @@ int usb_anchor_empty(struct usb_anchor *anchor)
>   
>   EXPORT_SYMBOL_GPL(usb_anchor_empty);
>   
> +/**
> + * urb_hcpriv_mempool_zalloc - alloc memory from mempool for hcpriv
> + * @urb: pointer to URB being used
> + * @size: memory size requested by current host controller
> + * @mem_flags: the type of memory to allocate
> + *
> + * Return: NULL if out of memory, otherwise memory are zeroed
> + */
> +void *urb_hcpriv_mempool_zalloc(struct urb *urb, size_t size, gfp_t mem_flags)
> +{
> +	if (urb->hcpriv_mempool_size < size) {
> +		kfree(urb->hcpriv_mempool);
> +		urb->hcpriv_mempool_size = size;
> +		urb->hcpriv_mempool = kmalloc(size, mem_flags);

That could use kzalloc().

	Regards
		Oliver


