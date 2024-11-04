Return-Path: <linux-usb+bounces-17071-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AD79BBB14
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 18:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1778A281375
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 17:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2814D1C4A01;
	Mon,  4 Nov 2024 17:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="sJl92RWl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53AC1C4A08
	for <linux-usb@vger.kernel.org>; Mon,  4 Nov 2024 17:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730739812; cv=none; b=av187EXO+DT3GR0BdXQZjFQHjE7tBxhChlLBGx1XvoRfOZGgacOsrMQqtormUMjyCXqW73A8mHtYC9oug4E+kapFhKybipXbZDuKx6CjaFNqPAmTwym8Hxa0Gk01oFky/9UTaMg6qMhOb18I9Cc3lE/9taF3h9qUUd3BKUjjM2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730739812; c=relaxed/simple;
	bh=S3067AYJCL7+zWWBtRRJXJM7xFuhAe7lTXvAMCqmVcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=elH0aK6Iunc9a+TIPDABzB6yt7nrN35yZy/modFm/3r7BPZ5CCtJN38DT/quPzx8G8Pi21y+UwLIa0m8UIwMs6gx2US1vhsbSEXYhjd0vGW9K/DAEYhculyIhkC2mo7R1UnKzspbCfqsmfsuHLqVLohoj/OgOza+A6yI2sompak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=sJl92RWl; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20caea61132so39378785ad.2
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2024 09:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1730739810; x=1731344610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GbXAjjC0DVPcEq6ZRD3tE7cOIMA2QAqAk8s8hpGLEus=;
        b=sJl92RWl0a0WZM7srfebtCNFcWopi2oeW6mSCX7IaY8LGAi5BxiazGNUVSnbPqg2zh
         c8rMiuAxG3qIeePGpDS/Gi95J68212zGx3ZldvQlJ1z60qgtvFWbgWOLXdkOxmltRFTH
         4aIpcf/t4aTZdpAJ+4th2KNtT3zjxZLps/J1lCbj9JEkIeR03Q9fu0yom+yqa39s4EdK
         zfOFnhXTm5LzQxrFiVFFwg/g02XZOZhvU7en/C+psxvmxGONfxeTUmkDe/M9cyEP9Sls
         Is6MkidjZp3at2lYqlRWr559fRK2LD5Y+6eSs/XCqOSbWaTU8P6y/OWtDg4UjUD38+Uv
         VtZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730739810; x=1731344610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GbXAjjC0DVPcEq6ZRD3tE7cOIMA2QAqAk8s8hpGLEus=;
        b=GM5xUTDF3w3tpk2XdKg+8KNqTtIzp2aofhDgcQJrc+vEqlV9oYiMQ4z9578TEE8J9e
         bnOMl/ideASQZ56ghyLwAyG7Gd0Gk/apL+hqawv2o2oboT6551MKylomk5HIwUEkwz8M
         OHL4gVHLWZYO5Odnklk61WF0FGGDjrdWTnr1JgPF4q1wB5oiVrhJbPKfz8t58NPDEWbu
         7hUQAfoxLftGkfKjjALZdpMO3tThFffTXU+S00dW2TkgTHlBTZsepQlJdCwWqbKDI/9T
         cebfARXK9ZcZlu95NJD91oCblLCH1wESyim49IGrS8afNrOk9f5vQxtAw0nMcXj8zGb0
         UEEA==
X-Forwarded-Encrypted: i=1; AJvYcCW3zKscnZAlcIycwHCULVJP13kKvrbo/MMTJluH9Lh5RRXF02IxmN/MSS1YbAX/q+0lzMiAAztKX+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiYRPN1qbKFrPJaleea52J1p2jIMhrmqfSI7PfV6CqM5z6qeTe
	emi0Hs2m1q1d/0Y0ZReb5NWUB5TzG0VvUic5MA+T7RhynGCxtX/j3LBbolC0Toc=
X-Google-Smtp-Source: AGHT+IGzTAJhBsc8WGoF9SF4SkHI7Sviz3GueVYb6UBifwKMkxwAE3woCCg7phGOKPAi7mQO7/dJJA==
X-Received: by 2002:a17:902:e84a:b0:20b:ab6a:3a18 with SMTP id d9443c01a7336-2111aee4349mr190732225ad.17.1730739809422;
        Mon, 04 Nov 2024 09:03:29 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4de04977d7esm2008543173.99.2024.11.04.09.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 09:03:28 -0800 (PST)
Message-ID: <0daae856-a3c6-4eff-95cc-e39674f24d41@kernel.dk>
Date: Mon, 4 Nov 2024 10:03:27 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [io-uring?] [usb?] WARNING in io_get_cqe_overflow (2)
To: Pavel Begunkov <asml.silence@gmail.com>,
 syzbot <syzbot+e333341d3d985e5173b2@syzkaller.appspotmail.com>,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <6728b077.050a0220.35b515.01ba.GAE@google.com>
 <13da163a-d088-4b4d-8ad1-dbf609b03228@gmail.com>
 <b29d2635-d640-4b8e-ad43-1aa25c20d7c8@kernel.dk>
 <965a473d-596a-4cf4-8ec2-a8626c4c73f6@gmail.com>
 <16f43422-91aa-4c6d-b36c-3e9cb52b1ff2@gmail.com>
 <e003c787-71b5-4373-ac53-c98b6b260e04@kernel.dk>
 <09b7008b-b8c1-4368-9d04-a3bdb96ab26d@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <09b7008b-b8c1-4368-9d04-a3bdb96ab26d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/24 9:54 AM, Pavel Begunkov wrote:
> On 11/4/24 15:43, Jens Axboe wrote:
>> On 11/4/24 8:34 AM, Pavel Begunkov wrote:
>>> On 11/4/24 15:27, Pavel Begunkov wrote:
> ...
>>> Regardless, the rule with sth like that should be simpler,
>>> i.e. a ctx is getting killed => everything is run from fallback/kthread.
>>
>> I like it, and now there's another reason to do it. Can you out the
>> patch?
> 
> Let's see if it works, hopefully will try today.

I already tried it here fwiw, does fix the issue (as expected) and it
passes the full testing too.

-- 
Jens Axboe


