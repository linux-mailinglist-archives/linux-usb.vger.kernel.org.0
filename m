Return-Path: <linux-usb+bounces-16110-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D27499AEF0
	for <lists+linux-usb@lfdr.de>; Sat, 12 Oct 2024 00:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E09DE286B2D
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 22:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD451E1308;
	Fri, 11 Oct 2024 22:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eXBndlKu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F17F1CF5E9
	for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 22:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728687409; cv=none; b=CaHr0JB1R3OJM287dIJ4weDOw5xD6vYDbKVlqYH/RTbHUlh7qFthKrViWeBLp30iRmlDcbjUZ7JUUQbmwU2pcKL8bUET9erHIu2Fh089n6IOD/+m4KVOlU1gn+bIUYg1W4qVoBLjS8M2ECK4kXkg25hjVHw7iDkcuLEj3dTAKHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728687409; c=relaxed/simple;
	bh=03SBgk4Acgy5RrkFgQiec+w2DkXjv2/TpQ+UGBqYSAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TdlTHnh5NIUJ9Ug7Wvgf0DLR0S8G/t0BSKWELoHFq0lz6JWVSru7/3i84mIBTGtnIGhT1xusmm0YR6orMZt8iVNLlIeyRUQcOwWO7ahoNDKughhGiNZZ8DXY3mjrrXigujBdeOoX+/vXwPTbRcta8O8LcYKQ5LoQMisu8WeOIIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eXBndlKu; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3a3a3075af2so11964995ab.3
        for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 15:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728687407; x=1729292207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fecPSP4imHn/3Lq7aqXyFaI6Z5YiKskvsTOzt0YlWWI=;
        b=eXBndlKuc0ozL5o4Il987JVXyTh/z+dHBRw3145YikYamm3w/eLGsbqI1miO/fpODL
         KdWE26n0peALVbSVVgLKB+OlRyhBvSW6gp3aUkXijbyX84lofuH6vhZZWwpQ1bMWW0jx
         B0qne0nHiS9maqKkps//azLj+7dHuD4MhMVyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728687407; x=1729292207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fecPSP4imHn/3Lq7aqXyFaI6Z5YiKskvsTOzt0YlWWI=;
        b=ZjmSa3Lf2OTKcmlU5K5XYWs8XAT13PkS0ZGl3a6pWJEwxBeZYYS+VbqNBQcbiHMPHS
         4WiEndcmUsX0kKIHaTF7d5MSt0x7wHj+iMoz02oFAMYIZZAxrv0oeuN+rTE36Qm+TRxc
         z3IVW2UnxKAfGQtY70M6aNps4UDU9P5zZGO/V38jwlHPXi7FP0hiN5j7i4Ymcc540ond
         1ywKtXAgQ1Ef/eQNuxRkDhH8OQGSF3OUDcIroaE1S3Tgi5HwrVWIK/lDHZtMakPAy+KS
         2TxDCfucR9EI/+MJR/Lktacujjhlstw/NHJ1W9os1YxIE5zKbfFVhHx5oJOO0HnJ1x4v
         ZxfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCZiyKCJauQk4brzYa0RMr3WUO7u7AZDEtFOF3kuIt2Y6fke5jHQG0kiSuJrbLFIYHyjxFOOdqvpg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg5C/EYxI6ibVEs/+fK6K89wZBwCYKwNUqpIOoKZxQLFtUY1ul
	S2R+OuM3YeH3dHDyYe3eMDxeBmP6fhaoGDKsZCBp2uoBCuc2eeb40RI9aD5XuJo=
X-Google-Smtp-Source: AGHT+IGWKB1g6eSFMvM4k/RDicTKzJkE5AX41eZe6aVsTG9bxxLqIf7DF6rnC5Y88QJPK3aKbElNEw==
X-Received: by 2002:a05:6e02:1ca3:b0:3a3:a7bf:7f83 with SMTP id e9e14a558f8ab-3a3bcdaa883mr7111675ab.2.1728687406709;
        Fri, 11 Oct 2024 15:56:46 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dbadaeb6d4sm826486173.172.2024.10.11.15.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 15:56:46 -0700 (PDT)
Message-ID: <f7d4a151-81ff-4367-aa2e-b39c30db3d31@linuxfoundation.org>
Date: Fri, 11 Oct 2024 16:56:45 -0600
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
 <73247327-5bc2-4390-a60d-a73e5683f0a6@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <73247327-5bc2-4390-a60d-a73e5683f0a6@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/11/24 11:05, Shuah Khan wrote:
> On 10/11/24 10:21, Chenyuan Yang wrote:
>> Hi Greg,
>>
>> I'm curious about the best approach to fix this issue. I'm unsure if
>> adding a spinlock or mutex around the code would be good to ensure
>> that only one thread can modify the list at a time (then fix this
>> issue).
>>
>> Alternatively, we could check if the entry is already in the list
>> within the vep_queue function:
>> ```
>> if (!list_empty(&new_entry->list)) {
>>      // Entry is already in the list, handle it (e.g., log an error or ignore)
>>      return -EEXIST; // Or another appropriate error code
>> }
>>
> 
> vep_queue() function is holding udc lock when it updates
> the status and calls list_add_tail(). vep_dequeue() does
> the same.
> 
> vep_free_request() doesn't see to hold the udc lock. I will
> tale a look at this a bit more and get back to you on the
> best approach. My guess is that the fix will be in another
> function such as vep_free_request() - at the moment - that
> routine is the one I suspect.
> 
> 

Can you try adding udc lock hold in vep_free_request() and see
if the problem persists?

thanks,
-- Shuah


