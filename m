Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBA621164EC
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2019 03:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfLICBh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 8 Dec 2019 21:01:37 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38552 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbfLICBg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 8 Dec 2019 21:01:36 -0500
Received: by mail-pg1-f196.google.com with SMTP id a33so6090611pgm.5
        for <linux-usb@vger.kernel.org>; Sun, 08 Dec 2019 18:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=XQBFtQjvQoQ48rj47EknN7Z4KnfsGyLqZnSXeV2vuPU=;
        b=DtZ2XIP2cLws0a/Bvq7beG3i4Glqufa2ElA0qkTZauF/pJxJsf/C6UJqKzG/0toWqe
         NNfJWE41OtWpUtfjGbYTs4Bk6JGhnBv0DvGhYOvjGOhMPAdQayr5axmvLnOBFYvP7oMT
         Ekk8nwj+8YsZn5s/LmFvCfJM3Ak1VTWZ7AEVLXCIrtScaHqG9heIT3yBEFhqUsC6B6uo
         olw2JwR2W9rExx6jlSokHHCD3bb2133v5AlFp+YwS5vjqqTUVBhfZc2Y91BbMwmbOkqY
         Mzp7nqWApjgx9yCfoRwB+xHh6ed7aggCPBifwCY0VuUiOy0Yy5J+RHs9vaE7ycyssg70
         nlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=XQBFtQjvQoQ48rj47EknN7Z4KnfsGyLqZnSXeV2vuPU=;
        b=Fw3NZKojDQqR8hyJnFUeHCgzckhjXNV5onFAW4jTOOeC61BorAYYDYJHECCvbzE0Fx
         f3eMwQUDjZBbbn6lJsWBFPfzsAZhLxDkPzPY0kU3UjeAdtKEEwSQsI06ZWUOflPdwwDR
         eZBcjrv+yTwYutGdaeqijNMphpKNlj5Xz6yk30PY+ERnW8UwfWg9uFd28V3Ii7uaGoAc
         n0me8ZWE9OhEEDxSixxF958NpyFyfwFxQIvX2eSvktN5v/xNiRD0rGYBOnfU4cYu8ZHR
         VSchckHRs+730h0Th8EXvsdJudrcbIGuSv1mIK7VUoi+kVJf51+DUs9op9vOKq7yYgvX
         r+Bg==
X-Gm-Message-State: APjAAAXrzSSzaFpAtx/4QeyxaBaEihzo5fM/+el+AAGo+7+mm/iouDOR
        hiRNUV/IHswpLrVNvM3q3Mo=
X-Google-Smtp-Source: APXvYqwsR8884gYSFFF0n0HKt7OxyUp230xIfgKNuUuXDHV/8lyliarV4NGMIwHQqyPHjJmg29OHUw==
X-Received: by 2002:a63:334f:: with SMTP id z76mr16379756pgz.14.1575856895762;
        Sun, 08 Dec 2019 18:01:35 -0800 (PST)
Received: from localhost.localdomain ([163.152.162.99])
        by smtp.gmail.com with ESMTPSA id c10sm22170217pfo.135.2019.12.08.18.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2019 18:01:35 -0800 (PST)
Date:   Mon, 9 Dec 2019 11:01:30 +0900
From:   Suwan Kim <suwan.kim027@gmail.com>
To:     Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= 
        <marmarek@invisiblethingslab.com>
Cc:     linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>
Subject: Re: "usbip: Implement SG support to vhci-hcd and stub driver" causes
 a deadlock
Message-ID: <20191209020130.GA2909@localhost.localdomain>
References: <20191206032406.GE1208@mail-itl>
 <20191206065058.GA9792@localhost.localdomain>
 <20191206205742.GP1122@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191206205742.GP1122@mail-itl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 06, 2019 at 09:57:42PM +0100, Marek Marczykowski-Górecki wrote:
> On Fri, Dec 06, 2019 at 03:50:58PM +0900, Suwan Kim wrote:
> > On Fri, Dec 06, 2019 at 04:24:06AM +0100, Marek Marczykowski-Górecki wrote:
> > > Hello,
> > > 
> > > I've hit an issue with recent 4.19 and 5.4 kernels. In short: if I
> > > connect Yubikey 4 and use its CCID interface (for example `ykman oath
> > > list` command), the client side hangs (100% reliably). After 60s I get a
> > > message that a CPU hangs waiting for a spinlock (see below).
> > > 
> > > I've bisected it to a ea44d190764b4422af ("usbip: Implement SG support
> > > to vhci-hcd and stub driver") commit. Which indeed is also backported to
> > > 4.19.
> > > 
> > > Any idea what is going on here? I can easily provide more information,
> > > if you tell me how to get it.
> > > 
> > 
> > Hi,
> > 
> > Thanks for reporting. Could you turn on lockdep and USBIP_DEBUG
> > in kernel config and send dmesg log? It will be helpful to figure
> > out lock dependency in vhci_hcd.
> 
> Hmm, I've tried, but I don't see much more information there (see
> below). I've just enabled PROVE_LOCKING and USBIP_DEBUG. Do I need to do
> anything more, like some boot option?
> 
> Also, this one (as the previous one) is from 4.19.84. Interestingly, on
> 4.19.87 I don't get the message at all.
> 
> Hmm, I've done also another test: got 4.19.84 with "usbip: Implement SG
> support to vhci-hcd and stub driver" reverted and it still hangs...

If so, deadlock is caused by other causes, and why is it different
from the results of bisect?

> 
> I'm going for another bisect round (4.19.81 works, 4.19.84 doesn't).
> 
> [  212.890519] usb 1-1: recv xbuf, 42

This message is printed by receive error and before that, driver
canceled URB transmission. we need to know the exact situation
before this message.

Could you send me a longer log messages showing the situation
before "[  212.890519] usb 1-1: recv xbuf, 42"?

And please also send the result of "lsusb -v".

Regards,
Suwan Kim

> [  212.891177] vhci_hcd: vhci_shutdown_connection:1024: stop threads
> [  212.891228] vhci_hcd: vhci_shutdown_connection:1032: release socket
> [  212.891388] vhci_hcd: vhci_shutdown_connection:1058: disconnect device
> [  212.891637] usb 1-1: USB disconnect, device number 2
> [  277.967398] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [  277.967456] rcu: 	1-...0: (1 GPs behind) idle=d66/1/0x4000000000000000 softirq=32543/32544 fqs=15856 
> [  277.967544] rcu: 	(detected by 2, t=65009 jiffies, g=65285, q=5921)
> [  277.967560] Sending NMI from CPU 2 to CPUs 1:
> [  277.968606] NMI backtrace for cpu 1
> [  277.968607] CPU: 1 PID: 450 Comm: kworker/1:3 Tainted: G           O      4.19.84-1.pvops.qubes.x86_64 #2
> [  277.968608] Workqueue: usb_hub_wq hub_event
> [  277.968608] RIP: 0010:_raw_spin_lock+0x2c/0x40
> [  277.968609] Code: 44 00 00 55 48 89 fd 65 ff 05 40 b8 60 7c ff 74 24 08 48 8d 7f 18 45 31 c9 31 c9 41 b8 01 00 00 00 31 d2 31 f6 e8 64 f0 71 ff <48> 89 ef 58 5d e9 1a 3a 72 ff 66 2e 0f 1f 84 00 00 00 00 00 0f 1f
> [  277.968610] RSP: 0018:ffffb29f00bbbb90 EFLAGS: 00000082
> [  277.968610] RAX: ffff8fa938768000 RBX: ffff8fa981fe3950 RCX: a50d71adbc2b783b
> [  277.968611] RDX: 00000000c093239f RSI: 00000000158aa627 RDI: 0000000000000046
> [  277.968611] RBP: ffffffff8450c860 R08: 0000000000000001 R09: 00000000000c0490
> [  277.968612] R10: 0000000000000000 R11: a50d71adbc2b783b R12: ffff8fa981fe3968
> [  277.968612] R13: ffff8fa91728e000 R14: ffffffff8434e626 R15: 0000000000040200
> [  277.968613] FS:  0000000000000000(0000) GS:ffff8fa9f5a80000(0000) knlGS:0000000000000000
> [  277.968613] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  277.968614] CR2: 00006335daf937b8 CR3: 00000000b0410002 CR4: 00000000001606e0
> [  277.968614] Call Trace:
> [  277.968614]  ? usb_hcd_flush_endpoint+0x122/0x170
> [  277.968615]  usb_hcd_flush_endpoint+0x122/0x170
> [  277.968615]  usb_disable_interface+0x3c/0x50
> [  277.968616]  usb_unbind_interface+0x181/0x260
> [  277.968616]  device_release_driver_internal+0x18b/0x250
> [  277.968617]  bus_remove_device+0xfc/0x170
> [  277.968617]  device_del+0x165/0x380
> [  277.968617]  usb_disable_device+0x93/0x240
> [  277.968618]  usb_disconnect+0xc1/0x2c0
> [  277.968618]  hub_event+0xcc4/0x1620
> [  277.968618]  process_one_work+0x221/0x580
> [  277.968619]  worker_thread+0x50/0x3b0
> [  277.968619]  ? process_one_work+0x580/0x580
> [  277.968620]  kthread+0x122/0x140
> [  277.968620]  ? kthread_create_worker_on_cpu+0x70/0x70
> [  277.968620]  ret_from_fork+0x3a/0x50
> 
> 
> 
> -- 
> Best Regards,
> Marek Marczykowski-Górecki
> Invisible Things Lab
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?


