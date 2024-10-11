Return-Path: <linux-usb+bounces-16107-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1F899A964
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 19:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF29A1F22A12
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 17:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8151A00DF;
	Fri, 11 Oct 2024 17:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PqmQwqbA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB87194C75
	for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 17:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728666315; cv=none; b=Glxgdpi4iaztt9tts6zGuxY+gMUfvz42LAn7EOGbcB4GBUP0dy93dmKj1Hbaw8Yh+29iYPgtGTPXGeDZfAqzsu7AsR1Q0Ks6sZcC4eXrwwDlgAG/Wh7mj/b8hC2S+LGXDcJNShtJyOk4kaq04YdC3Ko/+jFmTHOjEfn+Iin7rCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728666315; c=relaxed/simple;
	bh=eVPMsWiKMODmN9XggDPz42umUS9+Xxo2hCinxmJRrmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WTen1bq843/Zja5ZvLjeitiRKbjvhbQlYJJKUYnNilMj9drpQ/UInAlG8G2/ixnBLDo1PBVTXRgkMtyNB4DPNZ+7ufNFelrMTyZW2v+VitZggh/KAMxbfqQhfzMDQcTbC7SGifwdTYAlDn2wet8yfJrC0iwa/QHOrkHxzt6vroI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PqmQwqbA; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-835496c8d6fso115051339f.0
        for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 10:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728666313; x=1729271113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eTBa6QSH8XvCRa8DYbxh/5ErLQc1/VrOtTaM+j0ojdA=;
        b=PqmQwqbAFJXJRCupssE+ydRXs1dlGE1Q4kXiRpK1InIYbq15JV5uq3NqqsmuJFZyOB
         QJdAIbcoxu/YlA/nEYD1RLC1wOHMPLny0tKiZyOtoAZmptzV/zXffu8bCYd5iqW1Wg0y
         pUYMsCmA94/OJ+/xqTRdw4BF7KFgMv/ftzVhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728666313; x=1729271113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eTBa6QSH8XvCRa8DYbxh/5ErLQc1/VrOtTaM+j0ojdA=;
        b=bi59Rhlxv7AYbco4zbbXhatwF8baCYP6VwxZI4HAWHQPXbMvyMlG3l/d/uwE5R/B1S
         OD8NWaM3Mq7UYQeWEaeguWEskdB+PZAmEpNwyXkjhJEbqWq10vv6r8MpeRTjHgGZuc9Y
         qz49xSCuXiEHxb8kf+DG97i8MOvOlrwpckx7D9C/eFaEr/2AonVSNnu8d3IOQlzQ2xOW
         HrPnU5iBqfazczWA3iOiS7u/CN9mWLB6Cpgqv7H4+d9M81oJxjRrGfB0JCS86HPIbc3d
         J5uBaMiy2JeLY7eo+muuJyZBFSFUJilF4dtHek5BJHtvkL6Pek/QIINKJfqHEkAN7qp8
         UKLA==
X-Forwarded-Encrypted: i=1; AJvYcCVQLfJmorMMuJJo7UM7lmxH5dF3aC3yS6/X6asLy1OMqDMA7+ezR6L0L6a+bCYphblvUz+pSq26J4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjhDjWVQbVCM0FevzqRq+Cq6n47zzbYG4iFCSInvFAbb0sGqd7
	hjbwanu9fSeWif0P2HRSqNVaxZ0qa+oj3iyNE55eLBMXG+12pjSIYAusqc/80RU=
X-Google-Smtp-Source: AGHT+IELO+GEmcmQH2H5JETOyDG9+Og2rgWLYYU5tdx/y9ldRWYSFSNGeIrXQgED5JYYY+yR6Rk6jA==
X-Received: by 2002:a05:6602:2c0c:b0:82b:49d4:2ad0 with SMTP id ca18e2360f4ac-83a64d10c20mr23034939f.9.1728666312532;
        Fri, 11 Oct 2024 10:05:12 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8354b906f15sm79077839f.16.2024.10.11.10.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 10:05:12 -0700 (PDT)
Message-ID: <73247327-5bc2-4390-a60d-a73e5683f0a6@linuxfoundation.org>
Date: Fri, 11 Oct 2024 11:05:10 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [drivers/usb/usbip] BUG: corrupted list in vep_queue
To: Chenyuan Yang <chenyuan0y@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
 linux-usb@vger.kernel.org, Zijie Zhao <zzjas98@gmail.com>,
 syzkaller@googlegroups.com, linux-media@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <CALGdzuq9qr5wBpJFg1eNbv0NoMSDM=umusZF6r5T5_i=Foxdiw@mail.gmail.com>
 <2024101107-pry-reflex-8bc2@gregkh>
 <CALGdzuooWHVS54xOFj7n=MPohy6xMEALet3Q_9EGZ6fRk6Z+_A@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CALGdzuooWHVS54xOFj7n=MPohy6xMEALet3Q_9EGZ6fRk6Z+_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/24 10:21, Chenyuan Yang wrote:
> Hi Greg,
> 
> I'm curious about the best approach to fix this issue. I'm unsure if
> adding a spinlock or mutex around the code would be good to ensure
> that only one thread can modify the list at a time (then fix this
> issue).
> 
> Alternatively, we could check if the entry is already in the list
> within the vep_queue function:
> ```
> if (!list_empty(&new_entry->list)) {
>      // Entry is already in the list, handle it (e.g., log an error or ignore)
>      return -EEXIST; // Or another appropriate error code
> }
> 

vep_queue() function is holding udc lock when it updates
the status and calls list_add_tail(). vep_dequeue() does
the same.

vep_free_request() doesn't see to hold the udc lock. I will
tale a look at this a bit more and get back to you on the
best approach. My guess is that the fix will be in another
function such as vep_free_request() - at the moment - that
routine is the one I suspect.


> // Safe to add the entry to the list
> list_add_tail(&new_entry->list, &queue->list);
> ```
> 
> This approach would avoid unnecessary locking overhead if the entry is
> not already in the list.
> 
> Please let me know your thoughts on these options or if you have any
> other suggestions.
> 
> Best,
> Chenyuan
> 

thanks,
-- Shuah


