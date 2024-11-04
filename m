Return-Path: <linux-usb+bounces-17064-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4129BB899
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 16:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59144286950
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 15:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B0D1BD50C;
	Mon,  4 Nov 2024 15:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="aTFlEPDO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D70B1BD014
	for <linux-usb@vger.kernel.org>; Mon,  4 Nov 2024 15:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730732911; cv=none; b=JLVAHYg2QgSHVLQBmi2l6mvu2Jj26OV8U7aomZ8wg/3NZhOYsdqAjjoQCCOXjoRHV58VOkHUanRjfCXp6RXd2UqXZn066AJ98s/bo7uqOBHCleSiJZD9GgwvVOMYGU1FoaM8KELM4KoWKyGeeb8VHM32BHfLt4iSTDHB/zuPuvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730732911; c=relaxed/simple;
	bh=0okJolI+3u+H6AyLn0dUVhA+PvbYVJC2JYACRMFf7K4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VPhvZOkH+3kvr6Hb1wvytpjoZayj4vZQPmyFRqjxdonZmLD9WYFFwNlcqykTsD3xCyhdlPr52pRd7Ki2fTllioErCdh8cwS/rmTWlTwZMmN3e1+q1CtrCGH7thJkjOCAlqN/tiRKaC02xJYY6TMgQz31g4n3oKC/9hgdONi0JAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=aTFlEPDO; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-83ab5b4b048so203759539f.2
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2024 07:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1730732907; x=1731337707; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R5hbyR4HgcG/h6N+KF/CfSJlYRWEx4uL0iA5dLnxVNk=;
        b=aTFlEPDO+PPabydDMSTmrJLsto9ZIcUXYUYQZiL4N4N+Xz4/0qvY2YXx/FQVNIKwMY
         E++uD4EEBfho0HkDquSs/5jNBIPGwLQHwyF2a60Wskl6aZ1nErW9KAY5e7m+NUcK70qM
         NwWp3rSFmcePBrGqMRUQjtrEGst4gCRiheXYE7xNr97uuIQGxWs0FPL7LiiIEGGXtRxI
         jyf0VcMuKj5FmnYbf8OCevsngMzCwLyQ6OabQSzG8rG+lze/GevFcKuERIF/n+0KWEZa
         xcu8AgrvL/wTC5v90oBpjChs/h/wIjTHThWL0z1Va/N5UtkIz/eBr6srqrogjDJG6cVO
         DcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730732907; x=1731337707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R5hbyR4HgcG/h6N+KF/CfSJlYRWEx4uL0iA5dLnxVNk=;
        b=g0CLYhByYALluG4BBlhcxts6V/R+qWeeh6/6Oi/8kSHod/Zvd/0tXffcNHql9CaPYa
         RqwRQHO3OurCsxeY7xzaWXZo5FI0lXQ3one73dlKY5PN95or4AIURYayEmkEmdlJKWyd
         4TOlMToh0MB+SI1UfYq1cfBW2iacyAzmuLu8qfmPKvBG30WsaELyWhQr1nNLhyfyj5r3
         H0NSw+Qi6/UetUI4aqYe7CvdDNSy0oOHac7h3QlJZvuEa4Qco9CzyI3A0KCjS8V7IX8e
         MSqTAFuGGpG1u3+mkhx1hyX4KVit53CctlqK4JsR/iY6VFX+Z/P6fXih494PAI3m/Mn+
         2Vyg==
X-Forwarded-Encrypted: i=1; AJvYcCW55LUJ9Dzti9EUTrJubiXB9U7V8TI7nAQ+WwzortaNTcljkQYczJvsQXJGILT5M3UOE1LhL0hXwN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS0Tq946P2MW9BMFFr0baD0RiWRjnsGdeoCSJe25obZq6I/JCa
	aw4Gx1duJkhr4xJ/anyqlBsxdDZrGv0R6JBt6S8Y+QvcQ2U7ALpCcXrkcEmCFZM=
X-Google-Smtp-Source: AGHT+IE1M40BFmOXwjOwOEtq4B8wpMssMFuDDE7DRCvyikF5mFcU9Yjz9UpHrLMo9U43l+nSetxOLQ==
X-Received: by 2002:a05:6602:2cd0:b0:83a:7a19:1de0 with SMTP id ca18e2360f4ac-83b1c5cd847mr3851257039f.14.1730732907001;
        Mon, 04 Nov 2024 07:08:27 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83b67b2b669sm217599539f.19.2024.11.04.07.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 07:08:26 -0800 (PST)
Message-ID: <b29d2635-d640-4b8e-ad43-1aa25c20d7c8@kernel.dk>
Date: Mon, 4 Nov 2024 08:08:24 -0700
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
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <13da163a-d088-4b4d-8ad1-dbf609b03228@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/24 6:13 AM, Pavel Begunkov wrote:
> On 11/4/24 11:31, syzbot wrote:
>> syzbot has bisected this issue to:
>>
>> commit 3f1a546444738b21a8c312a4b49dc168b65c8706
>> Author: Jens Axboe <axboe@kernel.dk>
>> Date:   Sat Oct 26 01:27:39 2024 +0000
>>
>>      io_uring/rsrc: get rid of per-ring io_rsrc_node list
>>
>> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15aaa1f7980000
>> start commit:   c88416ba074a Add linux-next specific files for 20241101
>> git tree:       linux-next
>> final oops:     https://syzkaller.appspot.com/x/report.txt?x=17aaa1f7980000
>> console output: https://syzkaller.appspot.com/x/log.txt?x=13aaa1f7980000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=704b6be2ac2f205f
>> dashboard link: https://syzkaller.appspot.com/bug?extid=e333341d3d985e5173b2
>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16ec06a7980000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12c04740580000
>>
>> Reported-by: syzbot+e333341d3d985e5173b2@syzkaller.appspotmail.com
>> Fixes: 3f1a54644473 ("io_uring/rsrc: get rid of per-ring io_rsrc_node list")
>>
>> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 
> Previously all puts were done by requests, which in case of an exiting
> ring were fallback'ed to normal tw. Now, the unregister path posts CQEs,
> while the original task is still alive. Should be fine in general because
> at this point there could be no requests posting in parallel and all
> is synchronised, so it's a false positive, but we need to change the assert
> or something else.

Maybe something ala the below? Also changes these triggers to be
_once(), no point spamming them.

diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
index 00409505bf07..7792ed91469b 100644
--- a/io_uring/io_uring.h
+++ b/io_uring/io_uring.h
@@ -137,10 +137,11 @@ static inline void io_lockdep_assert_cq_locked(struct io_ring_ctx *ctx)
 		 * Not from an SQE, as those cannot be submitted, but via
 		 * updating tagged resources.
 		 */
-		if (ctx->submitter_task->flags & PF_EXITING)
-			lockdep_assert(current_work());
+		if (ctx->submitter_task->flags & PF_EXITING ||
+		    percpu_ref_is_dying(&ctx->refs))
+			lockdep_assert_once(current_work());
 		else
-			lockdep_assert(current == ctx->submitter_task);
+			lockdep_assert_once(current == ctx->submitter_task);
 	}
 #endif
 }

-- 
Jens Axboe

