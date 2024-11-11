Return-Path: <linux-usb+bounces-17420-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD009C3B28
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2024 10:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB425280CAB
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2024 09:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC8F14B956;
	Mon, 11 Nov 2024 09:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BA5lv5ac"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D892143C72
	for <linux-usb@vger.kernel.org>; Mon, 11 Nov 2024 09:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731318288; cv=none; b=o5egz0ZtKmkFSX3QkO4jpYZQ3n/Rufx8SUZuYfP+g2WLjgz4izlBaBm+FK5b7xRoz+/AK1Kdu6RoXLCJ1D+50t3w1ruGQ0fBjPO5X4jzqn4ghodxgHUt33ce2Y/rlo1r/Dvk3lgLkPjec4LZBShPomYwg4zn78rtXUhxF2XGTTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731318288; c=relaxed/simple;
	bh=Y8VkXg5N4fjvLMeubnNBYWRYj1+b5e3Ehqe5iTDD1Jg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RTB/xstSuHEqw8RWr8qNzpH4EfICXTMcPzPSa/AsYZAb7CUYx8AjnCThHgoDcGx2jTNNPgeDJbLm7YC72JiHtzbdN0RETx1/kwlqPbdXRMbFb+IL1ASaSZheKMdrZ4R/eb64PhZ0bbZANICzNNJyWsHKwP934H6F8lP8Qa6l1aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BA5lv5ac; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f2b95775so5349447e87.1
        for <linux-usb@vger.kernel.org>; Mon, 11 Nov 2024 01:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731318284; x=1731923084; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wYdHFQll/Jvx2aqgW7/Di3dB8XVUvFfsGgA/LhZ5sYk=;
        b=BA5lv5ack7m3e6k+7MGybq0hU6NMLa+nmpHfKNXzDzMTh/eCj7lYCW7yCMq+8WelsY
         a0z8Wugt3UyDy8V3jVmbJDW37BaOGN4DJCl0aLf8IAGr1jdT8cMubQHu93awsG77Fg4r
         ND/hOGTUL3cU2B4eafp7y74vQXO785rMJShAB4hj7i4lSqMn4tRNdYjb3J/a4G8OUVdc
         H1pAHKyysqpTQDXS4GZ+vwc6VACUmg63aBZjAqhDIyNDmXiNsP2wz3vYiZevNQJtUw9D
         rGSPq/ax2CJg2nefQ1jNS1zdYn9rpxiJbIduD743ewTk/n6jtzqZvrkObsr+H2KKByRq
         DQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318284; x=1731923084;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wYdHFQll/Jvx2aqgW7/Di3dB8XVUvFfsGgA/LhZ5sYk=;
        b=ZTiom0tCwS0xOH4fGKiamMmlzR6uBu3aKo7g7RhnT5otZJyb7/aCFVJXEuadtGMuji
         gEcpANQxEg9qAbsywVmR1yy8XiwJtCJnxMSoZ1ckAW3hensZ6rl6QfaPLzzSdOO9xIwS
         U6JaTe1cbKDszzdjF2dEmwuNs1ULAcKDA+Aa5FUefzLe1XxrdSGH4LhpXYW2ycRHYB3c
         dPyE9wVyRe18+eR1P4fmU5GcB2Uk3w8JDCb77Tgqo20RbI6z+i6QMZdl4IqUXRcmAtyd
         Lk8EKf/etzNDLvSJzD+y5sewxN49kIZWfMPsV0VXt0b2pnpz57TkxId133Y94I4tPxYd
         hmpg==
X-Forwarded-Encrypted: i=1; AJvYcCVyGQuG9/gLHUptG4u6VtpuYbwc7adXHYGpyUjZRshuduT7fdKqGVMhH22ScsOzYmvMbYM54/BIteg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yymkj3vwK1ES5/RbwJeNKqgpu17tXmWF7nqKKZPTadmkIC7MkXY
	CnJRBassZ1VUTH9JB9Sd5BfauolFSxIY9JpEtzBGXV7WKdt/IubtD1xPsL7+tHM=
X-Google-Smtp-Source: AGHT+IHK4vdhia2NXp3GYgdHBXfS5JmphfkYhtaQbxfub0asvj1UBs6mvIxTwhKb1VDqrzP+d2MjPA==
X-Received: by 2002:a05:6512:6d6:b0:536:54ff:51c8 with SMTP id 2adb3069b0e04-53d862c6fa8mr6556182e87.17.1731318284409;
        Mon, 11 Nov 2024 01:44:44 -0800 (PST)
Received: from ?IPV6:2001:a61:1361:b001:5d85:e56f:d14e:8442? ([2001:a61:1361:b001:5d85:e56f:d14e:8442])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc4c97sm570367566b.131.2024.11.11.01.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 01:44:44 -0800 (PST)
Message-ID: <825be5e2-31b2-4cd6-a283-05935ea6161f@suse.com>
Date: Mon, 11 Nov 2024 10:44:43 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb/cdc-wdm: fix memory leak of wdm_device
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>,
 syzbot+9760fbbd535cee131f81@syzkaller.appspotmail.com
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com, oneukum@suse.com
References: <000000000000e875fa0620253803@google.com>
 <20241109152821.3476218-1-snovitoll@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20241109152821.3476218-1-snovitoll@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.11.24 16:28, Sabyrzhan Tasbolatov wrote:

Hi,

> syzbot reported "KMSAN: kernel-infoleak in wdm_read", though there is no
> reproducer and the only report for this issue. This might be
> a false-positive, but while the reading the code, it seems,
> there is the way to leak kernel memory.

As far as I can tell, the leak is real.

> Here what I understand so far from the report happening
> with ubuf in drivers/usb/class/cdc-wdm.c:
> 
> 1. kernel buffer "ubuf" is allocated during cdc-wdm device creation in
>     the "struct wdm_device":

Yes
[..]

> 2. during wdm_create() it calls wdm_in_callback() which MAY fill "ubuf"
>     for the first time via memmove if conditions are met.

Yes.
[..]

> 3. if conditions are not fulfilled in step 2., then calling read() syscall
>     which calls wdm_read(), should leak the random kernel memory via
>     copy_to_user() from "ubuf" buffer which is allocated in kmalloc-256.

Yes, sort of.

>   
> -	desc->ubuf = kmalloc(desc->wMaxCommand, GFP_KERNEL);
> +	desc->ubuf = kzalloc(desc->wMaxCommand, GFP_KERNEL);
>   	if (!desc->ubuf)
>   		goto err;

No. I am sorry, but the fix is wrong. Absolutely wrong.

Let's look at the code of wdm_read():

                 cntr = desc->length;
Here the method determines how much data is in the buffer.
"length" initially is zero, because the descriptor itself
is allocated with kzalloc. It is increased in the callback.

                 spin_unlock_irq(&desc->iuspin);
         }

         if (cntr > count)
                 cntr = count;

This is _supposed_ to make sure that user space does not get more
than we have in the buffer.

         rv = copy_to_user(buffer, desc->ubuf, cntr);
         if (rv > 0) {
                 rv = -EFAULT;
                 goto err;
         }

         spin_lock_irq(&desc->iuspin);

         for (i = 0; i < desc->length - cntr; i++)
                 desc->ubuf[i] = desc->ubuf[i + cntr];

         desc->length -= cntr;

Here we decrease the count of what we have in the buffer.

Now please look at the check again

"cntr" is what we have in the buffer.
"count" is how much user space wants.

We should limit what we copy to the amount we have in the buffer.
But that is not what the check does. Instead it makes sure we never
copy more than user space requested. But we do not check whether
the buffer has enough data to satisfy the read.

You have discovered the bug. If you want to propose a fix, the honor is yours.
Or do you want me to fix it?

tl;dr: Excellent catch, wrong fix

	Regards
		Oliver


