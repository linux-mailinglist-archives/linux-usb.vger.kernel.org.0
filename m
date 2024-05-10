Return-Path: <linux-usb+bounces-10201-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D57008C224E
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 12:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A5D21F21437
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 10:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3B015098E;
	Fri, 10 May 2024 10:38:34 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C6D1292F2
	for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 10:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715337514; cv=none; b=exT368yontWET50idor5tSsvVRTI6mZBN91PrUP1lp0nEwJzOpisPpZNPyOIXTnkLo7fiUkbKsB6M2TwFNwQchHnGd0I2Y8e/VEyHqzq7LJrEbCDu/ERTPM5dF7hRUqhEEj85OtIJB7cD+jSKYSNMhPP4c9zSh8QYEnYIPvym8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715337514; c=relaxed/simple;
	bh=Z/muOcD26Wu4q7EI0MQCr7iLVrlAfHvpYoV8JX3AdEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=KBVAZCImkIEihGQVG1NLd45WJPASvQETUbrpCKIsY8HVeGmyeX916FRt3JlD2Llcz26VJ5MwkYvYFfSOH7pa72QWYvMGD6TAGsDhxBD32LYQGICCimT5dTp2cF3v93fcj+MqfQ4ZdVAgk8+BRJPGqLQHfnehkZXYJYN0BSmHu5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from fsav120.sakura.ne.jp (fsav120.sakura.ne.jp [27.133.134.247])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 44AAcSAV067664;
	Fri, 10 May 2024 19:38:28 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav120.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav120.sakura.ne.jp);
 Fri, 10 May 2024 19:38:28 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav120.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 44AAcSPU067661
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 10 May 2024 19:38:28 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <0f4d1964-7397-485b-bc48-11c01e2fcbca@I-love.SAKURA.ne.jp>
Date: Fri, 10 May 2024 19:38:28 +0900
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [wireless?] WARNING in kcov_remote_start (3)
To: Tejun Heo <tj@kernel.org>,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrey Konovalov <andreyknvl@google.com>,
        Dmitry Vyukov
 <dvyukov@google.com>, Marco Elver <elver@google.com>
References: <0000000000007b02500614b66e31@google.com>
Content-Language: en-US
Cc: USB list <linux-usb@vger.kernel.org>,
        syzbot <syzbot+0438378d6f157baae1a2@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <0000000000007b02500614b66e31@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello.

syzbot is still reporting warning in kcov_remote_start() from
__usb_hcd_giveback_urb() path. I guess that commit 8fea0c8fda30
("usb: core: hcd: Convert from tasklet to BH workqueue") broke
the in_serving_softirq() workaround explained in commit e89eed02a5f1
("kcov, usb: hide in_serving_softirq checks in __usb_hcd_giveback_urb").

How can we fix this workaround?


-----------[ cut here ]------------
WARNING: CPU: 0 PID: 16 at kernel/kcov.c:870 kcov_remote_start+0x5a2/0x7e0 kernel/kcov.c:870
Modules linked in:
CPU: 0 PID: 16 Comm: ksoftirqd/0 Not tainted 6.9.0-rc7-next-20240510-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/02/2024
RIP: 0010:kcov_remote_start+0x5a2/0x7e0 kernel/kcov.c:870
Code: 24 00 00 00 00 9c 8f 04 24 f7 04 24 00 02 00 00 0f 85 a6 01 00 00 41 f7 c6 00 02 00 00 0f 84 93 fa ff ff fb e9 8d fa ff ff 90 <0f> 0b 90 e8 26 71 f4 09 89 c0 48 c7 c7 c8 d4 02 00 48 03 3c c5 e0
RSP: 0018:ffffc900000079c0 EFLAGS: 00010002
RAX: 0000000080010101 RBX: ffff8880172cda00 RCX: 0000000000000002
RDX: dffffc0000000000 RSI: ffffffff8bcac680 RDI: ffffffff8c1fdcc0
RBP: 0100000000000004 R08: ffffffff92fb25f7 R09: 1ffffffff25f64be
R10: dffffc0000000000 R11: fffffbfff25f64bf R12: ffffffff8196262e
R13: 00000000ffffffb9 R14: 0000000000000006 R15: ffff8880b942d4c8
FS:  0000000000000000(0000) GS:ffff8880b9400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f3793bff800 CR3: 000000001eccc000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 kcov_remote_start_usb include/linux/kcov.h:53 [inline]
 kcov_remote_start_usb_softirq include/linux/kcov.h:66 [inline]
 __usb_hcd_giveback_urb+0x34a/0x530 drivers/usb/core/hcd.c:1647
 dummy_timer+0x830/0x45d0 drivers/usb/gadget/udc/dummy_hcd.c:1987
 __run_hrtimer kernel/time/hrtimer.c:1687 [inline]
 __hrtimer_run_queues+0x5a5/0xd50 kernel/time/hrtimer.c:1751
 hrtimer_interrupt+0x396/0x990 kernel/time/hrtimer.c:1813
 local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1032 [inline]
 __sysvec_apic_timer_interrupt+0x110/0x3f0 arch/x86/kernel/apic/apic.c:1049
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1043 [inline]
 sysvec_apic_timer_interrupt+0xa1/0xc0 arch/x86/kernel/apic/apic.c:1043
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:__raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:152 [inline]
RIP: 0010:_raw_spin_unlock_irqrestore+0xd8/0x140 kernel/locking/spinlock.c:194
Code: 9c 8f 44 24 20 42 80 3c 23 00 74 08 4c 89 f7 e8 6e 7a 66 f6 f6 44 24 21 02 75 52 41 f7 c7 00 02 00 00 74 01 fb bf 01 00 00 00 <e8> c3 3a d0 f5 65 8b 05 34 7a 6e 74 85 c0 74 43 48 c7 04 24 0e 36
RSP: 0018:ffffc900001577c0 EFLAGS: 00000206
RAX: 51fa7c47925ba500 RBX: 1ffff9200002aefc RCX: ffffffff8172dd7a
RDX: dffffc0000000000 RSI: ffffffff8bcab500 RDI: 0000000000000001
RBP: ffffc90000157860 R08: ffffffff92fb25f7 R09: 1ffffffff25f64be
R10: dffffc0000000000 R11: fffffbfff25f64bf R12: dffffc0000000000
R13: 1ffff9200002aef8 R14: ffffc900001577e0 R15: 0000000000000246
 __usb_hcd_giveback_urb+0x373/0x530 drivers/usb/core/hcd.c:1648
 usb_giveback_urb_bh+0x306/0x4e0 drivers/usb/core/hcd.c:1682
 process_one_work kernel/workqueue.c:3231 [inline]
 process_scheduled_works+0xa2c/0x1830 kernel/workqueue.c:3312
 bh_worker+0x2a5/0x620 kernel/workqueue.c:3572
 tasklet_hi_action+0xf/0x90 kernel/softirq.c:816
 handle_softirqs+0x2d6/0x990 kernel/softirq.c:554
 run_ksoftirqd+0xca/0x130 kernel/softirq.c:928
 smpboot_thread_fn+0x544/0xa30 kernel/smpboot.c:164
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

On 2024/03/28 20:00, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    a6bd6c933339 Add linux-next specific files for 20240328
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=15c85eb1180000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=b0058bda1436e073
> dashboard link: https://syzkaller.appspot.com/bug?extid=0438378d6f157baae1a2
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40


