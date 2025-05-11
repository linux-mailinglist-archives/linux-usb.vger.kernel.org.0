Return-Path: <linux-usb+bounces-23841-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C92AB2791
	for <lists+linux-usb@lfdr.de>; Sun, 11 May 2025 11:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C01CE7A1E84
	for <lists+linux-usb@lfdr.de>; Sun, 11 May 2025 09:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21AD51C861F;
	Sun, 11 May 2025 09:58:25 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6E419F420
	for <linux-usb@vger.kernel.org>; Sun, 11 May 2025 09:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746957504; cv=none; b=ME6H6JySH2Uhlp8KdqDHrUhsRYLwylRTkzd9UHJFpMkPOctVYkqj41LT6Z9y5fL1BwcSLssGoZiDjW7M3UFtWaEv2ODe410KZFd15R6VU0Vx7AeiLPtmYy2h8VIUqX0XLdpkqhRyWYF2oUR5a7Tp7f9GdN4DU6T74H76P1cHcc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746957504; c=relaxed/simple;
	bh=JYic5jH+0L05XJoIFJ1iYa6FaAV0OKg7sLzLsK9sRjo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pVO5ZXDUbE/bzD41+rmqz8af+t7esOzzi/vqJxWPWjtUQu9KRziRsE1PvW8yJBX1ChChkZ+huUN1SOviBq3nn1+8FnAIUJYrZHJa1V0MGg7MFktbtk0IUE7cTJJ0neH32XCrjJ22YfWNM/AS5DJlUsE6nV4Ucp0xUo7jH6jHD0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d81bc8ec0cso61921845ab.2
        for <linux-usb@vger.kernel.org>; Sun, 11 May 2025 02:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746957502; x=1747562302;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JV1UGxlHMeKfbN3pU5mb3+CywSKZHPf7uWSFs6WwF4s=;
        b=PJX6kgRhHAXhdSxHOM+96TsQcpsOtg3kPq9D/1NUrt94vvfU6r5YsJHfjWLhx9VNh1
         rI9pQXsb5a1CiGWVkRsR0vcBnuzw2fOhD91GejFfDhP/r6uef+SNZlF1N+mH++k3dcWX
         lQh4fgr9sVNjK2mDdjgq3yCO7sHAJ+r6WkVdDDYBWICTvtlleC5q1OY01SzmMVneqZDQ
         EpiDOaa/2Vwl87Zxk+l37MOfJ7kuOBc0OiJ+apf/LUo81INzTmsl22L4vro1dyH4Fg1B
         5SS/4pyEtm2JkzRHLSoEwu5Uqg5m4gcJUpqoE1wOmtgKUUtySb/4ntkhG0jheKUbkf0E
         4f9A==
X-Forwarded-Encrypted: i=1; AJvYcCVURtYeVEoCcA1SrFzLDGp4RwYRWcqVoRBaGrsyPjh8I0TP5Em6UupyacR8nP7BonWtmRzV8PWAX1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqTZSlU+DXMo9P/OO1zGeYlb/VA0zzFqFQB+X+Ni/93AT/DGxL
	ZCj8WmvjJNcbX1tyo4AHL04rT3fe2n0Ps/dvgnAMw2AHzXQfsGt/LqLQ26uPBIEG+aF8g8fX7gp
	uQrfsEtBN88/tAmAuWZRszUJjqIRwLbw0qy97JgmqeHr8bjgmpLJ2MAw=
X-Google-Smtp-Source: AGHT+IHApeyE6N3JGUwK3p957j2I9KW/eyiUXTuU8WcfuZUjX1KQzWc6gro8XdnrPAHkngz9aBYeZX4jwSPb72FtCFoRIGc5pk51
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1945:b0:3d4:70ab:f96f with SMTP id
 e9e14a558f8ab-3da7e1e73f3mr108803955ab.8.1746957502153; Sun, 11 May 2025
 02:58:22 -0700 (PDT)
Date: Sun, 11 May 2025 02:58:22 -0700
In-Reply-To: <681d2f16.050a0220.a19a9.011f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682074be.050a0220.f2294.002c.GAE@google.com>
Subject: Re: [syzbot] [io-uring?] [usb?] BUG: unable to handle kernel NULL
 pointer dereference in module_kobj_release
From: syzbot <syzbot+3ea73421f5aa3f339e9e@syzkaller.appspotmail.com>
To: asml.silence@gmail.com, axboe@kernel.dk, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    c32f8dc5aaf9 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=13e8f4d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea4635ffd6ad5b4a
dashboard link: https://syzkaller.appspot.com/bug?extid=3ea73421f5aa3f339e9e
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12ae5670580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b921498959d4/disk-c32f8dc5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/04e6ad946c4b/vmlinux-c32f8dc5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d4f0d8db50ee/Image-c32f8dc5.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3ea73421f5aa3f339e9e@syzkaller.appspotmail.com

 el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
kobject: kobject_add_internal failed for raw_gadget with -EEXIST, don't try to register things with the same name in the same directory.
Unable to handle kernel paging request at virtual address dfff800000000004
KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
Mem abort info:
  ESR = 0x0000000096000005
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x05: level 1 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[dfff800000000004] address between user and kernel address ranges
Internal error: Oops: 0000000096000005 [#1]  SMP
Modules linked in:
CPU: 1 UID: 0 PID: 6649 Comm: syz.0.16 Not tainted 6.15.0-rc5-syzkaller-gc32f8dc5aaf9 #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
pstate: 204000c5 (nzCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : kasan_byte_accessible+0x10/0x20 mm/kasan/generic.c:199
lr : __kasan_check_byte+0x20/0x54 mm/kasan/common.c:556
sp : ffff8000a37576d0
x29: ffff8000a37576d0 x28: ffff80008f311000 x27: ffff0000c7080000
x26: ffff80008add4a50 x25: 0000000000000000 x24: 0000000000000001
x23: 0000000000000000 x22: 0000000000000020 x21: 0000000000000020
x20: 0000000000000000 x19: ffff80008add4a50 x18: 1fffe0003386ce76
x17: 0000000000000000 x16: ffff80008adb410c x15: 0000000000000001
x14: 1fffe00018fbd927 x13: 0000000000000000 x12: 0000000000000000
x11: ffff600018fbd928 x10: 0000000000000003 x9 : dfff800000000000
x8 : 0000000000000004 x7 : 0000000000000001 x6 : ffff8000804f0148
x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
x2 : 0000000000000000 x1 : ffff80008add4a50 x0 : 0000000000000020
Call trace:
 kasan_mem_to_shadow include/linux/kasan.h:64 [inline] (P)
 kasan_byte_accessible+0x10/0x20 mm/kasan/generic.c:199 (P)
 kasan_check_byte include/linux/kasan.h:399 [inline]
 lock_acquire+0xb0/0x2e0 kernel/locking/lockdep.c:5840
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
 _raw_spin_lock_irqsave+0x5c/0x7c kernel/locking/spinlock.c:162
 complete_with_flags kernel/sched/completion.c:20 [inline]
 complete+0x30/0x1a0 kernel/sched/completion.c:47
 module_kobj_release+0x40/0x50 kernel/params.c:946
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x2b0/0x438 lib/kobject.c:737
 lookup_or_create_module_kobject+0x150/0x16c kernel/params.c:783
 module_add_driver+0xb8/0x2dc drivers/base/module.c:46
 bus_add_driver+0x328/0x5b0 drivers/base/bus.c:682
 driver_register+0x220/0x30c drivers/base/driver.c:249
 usb_gadget_register_driver_owner+0xe4/0x250 drivers/usb/gadget/udc/core.c:1700
 raw_ioctl_run drivers/usb/gadget/legacy/raw_gadget.c:595 [inline]
 raw_ioctl+0xfc4/0x33e8 drivers/usb/gadget/legacy/raw_gadget.c:1306
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __arm64_sys_ioctl+0x14c/0x1c4 fs/ioctl.c:892
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
 el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
Code: d503245f d343fc08 d2d00009 f2fbffe9 (38696908) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	d503245f 	bti	c
   4:	d343fc08 	lsr	x8, x0, #3
   8:	d2d00009 	mov	x9, #0x800000000000        	// #140737488355328
   c:	f2fbffe9 	movk	x9, #0xdfff, lsl #48
* 10:	38696908 	ldrb	w8, [x8, x9] <-- trapping instruction


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

