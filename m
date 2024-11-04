Return-Path: <linux-usb+bounces-17072-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0729BBB1A
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 18:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFB661F2272B
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 17:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993551C4A38;
	Mon,  4 Nov 2024 17:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="2angS7fu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1C51C4A0D
	for <linux-usb@vger.kernel.org>; Mon,  4 Nov 2024 17:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730739904; cv=none; b=jw39PoioICB0TebaBE7a2hZ3HkOrbilD7hSSjJ1O8YW+kA0JwQJVTgQydXzPjXHwT1nxBI841U8JrfeKWQER0aomsbQulVjFDQYDJ60CVGODRNufiZwWwICrO/r5abjYYi+hLf8plRmCEEaUIDZvjJXr782NHb143KQuk9aLHc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730739904; c=relaxed/simple;
	bh=SBprbF+thfNudBulYx85f3tHQG80wL5QbnVmT1icmrM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Hp3CImiXQg7wJqLjI4UFmhYP9k/INxPPLgvhTViSd/DunHmoAzw5EnwCiNnC/u9R3nofcVwzT/gDu9PRd3rmDVVeoH+5RbtCGd4Wh4f2WVm/hGyc9ryHhuYYiEPFm6Dor/dv6UtwNZYu7h05Z6tubwxF0xr0zzyxJqkKMuuetD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=2angS7fu; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-83ab5b4b048so210282239f.2
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2024 09:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1730739902; x=1731344702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28+oDC929/gx3MlAbHQkCFCwUgoQ1mRmzoS7ykK2U7o=;
        b=2angS7fukj+cM8KmRyhs9koiw+2S8vj4h4sFaMsYYmYUqUninJDHdN9pK3PZrHV/iu
         I5NatSX5s8Bt8XmTGbh5BwhXe0sArPO2oWbuHENDE1dayixCT9L/1vn7Lt1VBdi4qEL3
         3ckgUvv3FNGtqRy+AJqhB5rryO2CRTOc/a9jdsHDg1i7FoqISzLN73qfHoJ7jb/hZHfX
         73Ea3jB46Kdg/nxMAv2uL1lLB3lu2MjzGQ/aInSVrZDVjkCD4j2J9rzs/PpAXHkux5Cv
         w51mYS+Ga44Y/U9WEPtt3O8TVY6RZKUI6wDCaZNxSU+J3pPQnFp6PZbthfJAp/rtu9/R
         BqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730739902; x=1731344702;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=28+oDC929/gx3MlAbHQkCFCwUgoQ1mRmzoS7ykK2U7o=;
        b=Z5wWJrZ9M0FeeuMVSpfMSNTLBNzkwv8+OXmwehNuGF55VF2gLSc5sIjFqE6Af9lrcn
         bELLdQlYtzo9yUV4A+pEP9bOhFM+CWkf4CvKqQKyaYu01l3DbAyeiNW7jGGJixSH8WUh
         4wA44vWtXEup48J/pliEUv8NzDwe0/SitnOEOiw2ifrCWPwXdgMNQVCYtRk9IpuQ7sTm
         ZFYZhAEaORjxtnu9s1+oXQbDE/lJs+O0QjGH7Zj3RtVAxD6psPTVDw59Vsg42ICMPGTu
         tHmzlz80t6v5NhmjnaNuuVCXvgX40ZTSy7vc4heCKOKPJnQdI1idtvrjCj1KQQLH/TJ+
         kCPw==
X-Forwarded-Encrypted: i=1; AJvYcCXnc4qflbJ/lRY4bKfQFsVrIVZ7hs9Tb3BiXKwEaYTwTskAS+8gUILAX66F5GRoE1uLJBJ4481B2P0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye8JDsYfslY5zgnD3rN4hInGjNWOA3iyns9L3kD+DqoLfg2Viu
	pCrS+CD3ouGEuuzn0wS7v9kiJ12ipTY4tst7zo2z1y7giJmBp4qlFEjsH6oYXl0=
X-Google-Smtp-Source: AGHT+IF1Ml8l7LoOFMzfYhbpbmyH2xStToziU318v1oV1GGo627mI9IEhqRYGD9lLx3WRRfjK00Utw==
X-Received: by 2002:a05:6602:3414:b0:83a:acba:887a with SMTP id ca18e2360f4ac-83b1bcf420dmr3516982539f.0.1730739901791;
        Mon, 04 Nov 2024 09:05:01 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4de049c8187sm1996311173.160.2024.11.04.09.05.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 09:05:01 -0800 (PST)
Message-ID: <74004a91-2753-45fc-88b4-8b2103f9a155@kernel.dk>
Date: Mon, 4 Nov 2024 10:05:00 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [io-uring?] [usb?] WARNING in io_get_cqe_overflow (2)
From: Jens Axboe <axboe@kernel.dk>
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
 <0daae856-a3c6-4eff-95cc-e39674f24d41@kernel.dk>
Content-Language: en-US
In-Reply-To: <0daae856-a3c6-4eff-95cc-e39674f24d41@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/24 10:03 AM, Jens Axboe wrote:
> On 11/4/24 9:54 AM, Pavel Begunkov wrote:
>> On 11/4/24 15:43, Jens Axboe wrote:
>>> On 11/4/24 8:34 AM, Pavel Begunkov wrote:
>>>> On 11/4/24 15:27, Pavel Begunkov wrote:
>> ...
>>>> Regardless, the rule with sth like that should be simpler,
>>>> i.e. a ctx is getting killed => everything is run from fallback/kthread.
>>>
>>> I like it, and now there's another reason to do it. Can you out the
>>> patch?
>>
>> Let's see if it works, hopefully will try today.
> 
> I already tried it here fwiw, does fix the issue (as expected) and it
> passes the full testing too.

Forgot to include the basic reproducer I wrote for this report, it's
below.

#include <stdio.h>
#include <inttypes.h>
#include <stdlib.h>
#include <unistd.h>
#include <liburing.h>

int main(int argc, char *argv[])
{
	struct io_uring ring;
	int fds[2], ret;
	__u64 tags[2];

	if (pipe(fds) < 0) {
		perror("pipe");
		return 1;
	}

	tags[0] = 1;
	tags[1] = 2;

	io_uring_queue_init(4, &ring, IORING_SETUP_SINGLE_ISSUER|IORING_SETUP_DEFER_TASKRUN);
	io_uring_register_files_tags(&ring, fds, tags, 2);
	io_uring_queue_exit(&ring);

	sleep(1);

	return 0;
}


-- 
Jens Axboe

