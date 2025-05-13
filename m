Return-Path: <linux-usb+bounces-23890-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDBAAB4DBB
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 10:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ADEE172547
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 08:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB731F7098;
	Tue, 13 May 2025 08:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aweRqgm2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FC51F4E59
	for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747123885; cv=none; b=P6xC9lMNOXe+EEzFvxJZFsHGL7i6tFf+OTYJ6+yYfREbPYsnf2RHm2nHKZ/sRKahafE/26wsFW/6+S/WW+R1+SdYJyAEKKVVR+ub2O4ZfBkBNkNbpdzgYOyL5ZTSPBk4zQUZap3niNhWmeYkwCTEUpvrApM6ifcI0qIEJrlsbNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747123885; c=relaxed/simple;
	bh=eLK2Yhsn+VZRa/Ep05rtZaSS2grqQRKnXKLj2vKbQqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n3nB4CEBjdKO4/4xL65516NMYQnMGQNlzohGv1szyvU/UTn7JWzV8YbxL2M/MBJlmJMFyQUojGcAzosRQ3wVWYkF4I6oIQBWLj8oVsV0Lp8kD72mM+dDLC5sGZQrDkfq5j5L1KmaEYvqzkFUgvMFXNEgcdvKYNfQcxdi/dBhqZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aweRqgm2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-442ea95f738so5481345e9.3
        for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 01:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747123881; x=1747728681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hvGnGy8q2OiAbegAf3KJYMp0rpcNQnC+vXgXl0BA3Ss=;
        b=aweRqgm2fhRBCdSolDdmOEWXOdhooI4yfXJFMgUyCu8ZjfUJsy6+8SQK8a7oW7OJp2
         TTvtfzSWvKNDNkkGosPllvJ2fY6AQ0LOui7ujrxjmzuYsSjpplQG6WqgfxvgRe/H3LEP
         y4oM1OmXDeoEYd00JfpAQccSJl6r7rEYhfH1o7fg4LIUSuOT5Zxn7DAbplsyD9/4QyXx
         4o98u1Z1EhhWQ2hLXqhnb7ghfpJi7HrPRoK69lVbw43NZ9AnGnrJGN+dJPddHSLRPUGz
         RMbA94TcN06VtbLI4JPnZYNX5wfoCF1dfLKhO3HNyBSLgogBjt37MXEWdHEHJIHpUNTx
         mkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747123881; x=1747728681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hvGnGy8q2OiAbegAf3KJYMp0rpcNQnC+vXgXl0BA3Ss=;
        b=vMIz6AxmPhLaGpda+nbqf2vmfBsYokgHm4n59ztzQY9caACvTJ8bDGRTQPZif0dgsX
         R4MIbxtQI02lpWakle2/rSkuoOj/EIcokXaXURTa5HMdVRIrJWDAfa6MwdEkVGg1i36d
         PDR6nRv4sRbSb5hYP726PHK6kRJ/oze7WqXDaRJf/3i6HtNM37X4bPY3LXnq+ldnjmee
         3Wxbv4raC17kKiuMfUzSK5nl6GnmsrY422TDzt3W8Txo7WowsYg+rlHZdQ2x2R659POh
         hFjQ8rWYSDmFxSdkXZdWgxQI1YIyBSwZGZcFqE9Q7OoFoIBqORDeq74h0MTl5IT9E4d5
         Zq9g==
X-Forwarded-Encrypted: i=1; AJvYcCUxvYyK/E3lTLurLklgLQU2c36tt9Ym9p3UyN6DUKN1LptTx6QpIznloROAmOVwotiPDMsVeZpiy3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnSCEbXGPJrAaQHMmQOhlPsd59qoUShWtctq60jIz7C8lu/+so
	911i/hSAtdIzk5DnTHDjSCN61GNCVppjZ67HMrKRPb9ndEnzvDK4fHh0zwS54s0=
X-Gm-Gg: ASbGncsX5BhnIsuzPa2RjVtbveRqjCQXrIvqwSG0szSwHxtj8B6D7+cEY+w39SIkyAs
	He5E1vbzJ+gn/+s//o3mn/bZxzikK3yy2wppoxqnnCPymMWIMzyZ0gEefA7WNmu75oL3lsldiWx
	KZ4RoMX50vg/PHe7vakTV7S5WAmyzFk2u36CRoW3z7xC9rMgH9bLSCy2khWFRUsG7LD8kdnUeHE
	2S3ZJyBuRIYoLIPqYOf+a7JaOVbtD4jsFv+IcHzK9t8qmLdi0E99tE8NbnFvtxlHbbU4JtuX2il
	/BZ+LdvcmQb2JhrLCnPRqnU0Fx5k6MaLJUDlzIabjXBFsq3zBtcaphOT2okCbHilJnNAAuF7ARn
	Gd6H64wnJwQOjnzBDEHwL7WW23mFjWQ==
X-Google-Smtp-Source: AGHT+IFzj8clXhFhkyT0sQTuL5gbJ8zzjhwvoolehVcngTmUcthDp886cy7p+L6lZGuPae/gEMtNwQ==
X-Received: by 2002:a05:600c:3f0f:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-442d6ddd73cmr140591975e9.30.1747123881469;
        Tue, 13 May 2025 01:11:21 -0700 (PDT)
Received: from ?IPV6:2001:a61:1335:3601:f121:69fe:935a:67bd? ([2001:a61:1335:3601:f121:69fe:935a:67bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f3c2sm199830195e9.15.2025.05.13.01.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 01:11:21 -0700 (PDT)
Message-ID: <48d5cae9-ff7c-4076-8b71-8c16bcf00443@suse.com>
Date: Tue, 13 May 2025 10:11:20 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] USB: core: add a memory pool to urb for
 host-controller private data
To: David Wang <00107082@163.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org
Cc: stern@rowland.harvard.edu, surenb@google.com, kent.overstreet@linux.dev,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250512150724.4560-1-00107082@163.com>
 <20250513055447.5696-1-00107082@163.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250513055447.5696-1-00107082@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13.05.25 07:54, David Wang wrote:
> URB objects have long lifecycle, an urb can be reused between
> enqueue-dequeue loops; The private data needed by some host controller
> has very short lifecycle, the memory is alloced when enqueue, and
> released when dequeue. For example, on a system with xhci, several
> minutes of usage of webcam/keyboard/mouse have memory alloc counts:
>    drivers/usb/core/urb.c:75 [usbcore] func:usb_alloc_urb 661
>    drivers/usb/host/xhci.c:1555 [xhci_hcd] func:xhci_urb_enqueue 424863
> Memory allocation frequency for host-controller private data can reach
> ~1k/s.

First of all, thank you for trying to tackle this long running issue.

> @@ -77,6 +78,7 @@ struct urb *usb_alloc_urb(int iso_packets, gfp_t mem_flags)
>   	if (!urb)
>   		return NULL;
>   	usb_init_urb(urb);
> +	urb->hcpriv_mempool_flags = mem_flags;

No. You cannot do this. The flags you pass to usb_alloc_urb()
depend on the context you call it in. For example, if you are
allocating it while holding a spinlock, ou need to use GFP_ATOMIC

But that may or may not be the same context you submit the URB in.
Recording mem_flags here makes no sense.

	Regards
		Oliver


