Return-Path: <linux-usb+bounces-16471-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1367F9A5DFE
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2024 10:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B89181F239D0
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2024 08:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C771E1A36;
	Mon, 21 Oct 2024 08:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PTp2c7It"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188621E1044
	for <linux-usb@vger.kernel.org>; Mon, 21 Oct 2024 08:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729497898; cv=none; b=fYyHQnx9sFZx982VSJJU5u9wtP4LUK4w9Re7Cl7ejx3pgUQEGEf33JLTqMfZxsc6jvw6pqXfoi9JoOY3zHWcJ2ALj0F0azKFZjUlmaiwlMuXjTUqty6ajdS20wDwRjcfkLZMKBzC0QiS8ke6vf8B+tZukWcD1lRrZmuejP4HSNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729497898; c=relaxed/simple;
	bh=s5V2nRqdClra2IYN9VkVoloRb2rboxPyLIYaBTGoRyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oKJWE2mWKq28xBBPf+6GLrujVUjYYZkA9eQSAVCaXDVF2hpynfUlPQSY6l0HcEfFkwzC5OlmtwkzkLUjuHecS7ENuj8zS/wuqNZn6NuIcNuLpX9rYz0/bQmrYD5ZvDyU3soBy2wZQJ3iazCM5pSBQfK0vkZtK1cYpGXx5fSeywc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PTp2c7It; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb388e64b0so38675941fa.0
        for <linux-usb@vger.kernel.org>; Mon, 21 Oct 2024 01:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729497894; x=1730102694; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mCxbIdeUZnMRvGceySlkhLwCVSlS+VQaiyZ6j0nLBAY=;
        b=PTp2c7ItQqpt4J7mgBJ0Y9Y/gi9izYB2xDzERAFqJXk8SKo59ryvfCOTtmvLip552K
         GMdZe1wdPJ8dDK7i0CIveGGNvyAqBHfmsXKNk+kHBa0/kJsQ2EODd8mTwxSMfmzjPxR4
         QQ+6lN7ui5C1QzdDPfEByYsOtRV2DXNbKBKwYKBM1Idrp2gaEbbZB7V7CQmSW/gMEI5I
         Uo/xTyPy9SB3CIY8Nxc1iFAVrgWYFnMehKmw9FYlE9YI38RI8be8xrvebV/ywVU1kDxa
         Yj2eXz9QlvZVtDMYYqR2ysTI/fxtKhP5bPzrHDePysvX1OFDzy1z80ox7LydOvOw4s+u
         5W4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729497894; x=1730102694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mCxbIdeUZnMRvGceySlkhLwCVSlS+VQaiyZ6j0nLBAY=;
        b=l7I9k4yEwZf4Y20Thqfa1r3nb3bHuKQs06N/8DwRGWXLMlRc8vWYltMzXGM3HsL+u4
         shi0NUCOHHsiwcKA1KD4OprwVXlu5fY7pgA1X/q8iF56qEJEiEthKK0mthI5eFR5uQxU
         44sSGfk3QOfoEXEoiyZ6OCOgQINlVje2lTnR9VM3qOeoZowBRvc9OxKEYV75yR4M6NGI
         5QJkV06tZnHuIe44TIApp8IICa3r/ho6xDHsVaCoPoyfBMadIYLSTGh7Dc9kWAiMc9VU
         OUDg9ncXMYh8VlWpcUIz2IvUIrqUfVZ5zVw7fz253ROdax8QKincxQmoq4Fh5uONWvD4
         dQSA==
X-Forwarded-Encrypted: i=1; AJvYcCWwmiwrw+d3MhDke521gCeFCpofdRLy3k0VfHU1NKKmVjSArgtMsKFCCjoJ+rn0FVk7Hntt9Rgla1k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoU/ylR69j4JwR5rSzfXy1ec6yb/7XQi2d3EXh6cbLaY9ZkhLj
	HeJqs/him02PSlyL8GwqzG3Ga85kDDIPKOLQn4UyMq53QgYb5sI7aj88bx2yZ+ntJaIfGDJZOkf
	J
X-Google-Smtp-Source: AGHT+IHxf07RyEI8Eec6QyY6xEq/FIAh/V44Zfed1CnL3RdUnLnl9WJMhY64JKq5/000/zVBSftcEQ==
X-Received: by 2002:a2e:4a0a:0:b0:2fa:d978:a6a2 with SMTP id 38308e7fff4ca-2fb82fd0093mr39333001fa.27.1729497894081;
        Mon, 21 Oct 2024 01:04:54 -0700 (PDT)
Received: from ?IPV6:2001:a61:13cd:ce01:d26b:21f0:5b2f:6eca? ([2001:a61:13cd:ce01:d26b:21f0:5b2f:6eca])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696ba62sm1651567a12.14.2024.10.21.01.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 01:04:53 -0700 (PDT)
Message-ID: <0abd3cbd-0e8a-43b2-8cb0-6556297aa7c9@suse.com>
Date: Mon, 21 Oct 2024 10:04:52 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_port_suspend
To: syzbot <syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, stern@rowland.harvard.edu, sylv@sylv.io,
 syzkaller-bugs@googlegroups.com
References: <67153205.050a0220.1e4b4d.0048.GAE@google.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <67153205.050a0220.1e4b4d.0048.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.10.24 18:38, syzbot wrote:
  
> INFO: task kworker/0:0:8 blocked for more than 143 seconds.
>        Not tainted 6.12.0-rc3-syzkaller-00051-g07b887f8236e #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:kworker/0:0     state:D stack:24544 pid:8     tgid:8     ppid:2      flags:0x00004000
> Workqueue: pm pm_runtime_work
> Call Trace:
>   <TASK>
>   context_switch kernel/sched/core.c:5322 [inline]
>   __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>   __schedule_loop kernel/sched/core.c:6759 [inline]
>   schedule+0xe7/0x350 kernel/sched/core.c:6774

And this sleeps forever. This must not happen.
>   usb_kill_urb.part.0+0x1ca/0x250 drivers/usb/core/urb.c:713
>   usb_kill_urb+0x83/0xa0 drivers/usb/core/urb.c:702

We are changing our mind, presumably due to a timeout
>   usb_start_wait_urb+0x255/0x4c0 drivers/usb/core/message.c:65

We are sending a control message, presumably to enable
remote wakeup
>   usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
>   usb_control_msg+0x327/0x4b0 drivers/usb/core/message.c:154
>   usb_enable_remote_wakeup drivers/usb/core/hub.c:3365 [inline]
>   usb_port_suspend+0x339/0xf10 drivers/usb/core/hub.c:3472

Suspending ...
>   usb_generic_driver_suspend+0xeb/0x1d0 drivers/usb/core/generic.c:302
>   usb_suspend_device drivers/usb/core/driver.c:1272 [inline]
>   usb_suspend_both+0x66d/0x9c0 drivers/usb/core/driver.c:1443
>   usb_runtime_suspend+0x49/0x180 drivers/usb/core/driver.c:1968

This very much looks like the HC driver used to run these tests
can hand in unlink. If that happens there is nothing usbcore
or a driver can do.
As this is now reproducible I would suggest a bisection. Brute force,
but I see no good alternative.

Syzbot is an important tool and if the HC driver it uses is unreliable,
the whole thing becomes unreliable and that is most undesirable.

	Regards
		Oliver



