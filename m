Return-Path: <linux-usb+bounces-12435-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E8F93CCF2
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 05:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E09CD2825A2
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 03:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E19F22F1E;
	Fri, 26 Jul 2024 03:20:28 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD89FC19
	for <linux-usb@vger.kernel.org>; Fri, 26 Jul 2024 03:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721964027; cv=none; b=ZWA93WilDJAg5sii0SDuCxgZtcO5tTnqrYZfyxN0HrHDYIT9sq1urJOfX8alSZFAMcaPYIuu3J4+q8sdOu1I76YBpeXYhOjNAIA6bPLhBIzfM4w6rHlpaaueYvuB/QRDG/kUvCyu0JkW2obfOCaQf8/hb7WkOfMhwp6Y0d+EFFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721964027; c=relaxed/simple;
	bh=aT+VBFI62h9pcUO/6ZtUss5vaDWxUSoOePUx8pa7OGI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=oN0yYEBd8Rb8jZQlp7SIi47vz1vxvLe+waSHotyhtZOAQKPbZkHRcfx5CLIb98uEfsbJP78+WjLeWgZ0cz6AYG2sNRs8/48ueU1X00a2CNlgU/CUpCubd1wjM5/n3A6HBNoAfXSB/ETGWs/mQy2HHAskPtrFgoLzWH4ESi+zdu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-7fdfb3333e5so124812239f.1
        for <linux-usb@vger.kernel.org>; Thu, 25 Jul 2024 20:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721964025; x=1722568825;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=98oAaBYCYSuAyWDDlJVJe+KJ+KtZRFUOZVQnFgyMLbA=;
        b=KBKDX+XtFY730EbKsJvOAgIuh74B2qyXAFpoPg++wcrR8lVtEF0g3i8IIDJNel2RlS
         T8HrkZECe+OIus6HvsngBvTOPTMtd5JUghyxSLuidDeGHK8hv/2r7R9g/jFzEG7m1G3Z
         YmvQ/2mrrQ90XAUf1wjcQVoEPpvIFEp7GDQAQ8pFIwIoFgIU1vGJod81Xx4udnplN9Lu
         7Ht8YjMkWlQ+ZsBO+FsZOwt4vUVQKnvVs+Z/LHgT0CoHJxkB2bLmhuRsPRewE4/Q7u1B
         ggTHlHLNxzpGUZlmAH6FTKCyIlOLCSZ9qCqjRBPFfISuRB7XMlRBbB0b+YJFGIsLz1ZA
         Jl4A==
X-Forwarded-Encrypted: i=1; AJvYcCVEhFjyqR6mA3B+hH5yMi3YK3EHKVrJmKQ3hZRhHgNGsruLdmOaY4T19Gv5txetg2qPG+WCMBpbwDLv8P8mcSKgYO3d5lFOxTZV
X-Gm-Message-State: AOJu0YxH7hu9KPedGFW+u8LkPK0lYexPgiZXKxr+l9LsiFab+7+C2Tn5
	bZxvH7IkbYYtfrVNJ25mlLj1M+eS4rIhIEOCceEJHhxEzJSifoWMwXbEdiPl+qD0WXDGfs8aAlU
	hJpstXyUjLV24P/JXsYVPOwfau4X3xjoSlFP6fZJIZWnlR8gaByAoySY=
X-Google-Smtp-Source: AGHT+IHjCC6ERP1tyQb5siUa2dWY91AyYhbJRbeFhwD5QlAwHVz94xh0qA3R6xfZqd98T4gGFA9vJNKDE4452CWXas/rfAsmMQy5
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:3797:b0:4c1:b049:25f with SMTP id
 8926c6da1cb9f-4c29bca5556mr247237173.1.1721964025257; Thu, 25 Jul 2024
 20:20:25 -0700 (PDT)
Date: Thu, 25 Jul 2024 20:20:25 -0700
In-Reply-To: <0000000000004a975c0613c7f382@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000ab25a061e1dfe9f@google.com>
Subject: Re: [syzbot] [bluetooth?] possible deadlock in touch_wq_lockdep_map
From: syzbot <syzbot+91dbdfecdd3287734d8e@syzkaller.appspotmail.com>
To: arnd@arndb.de, eli.billauer@gmail.com, gregkh@linuxfoundation.org, 
	hdanton@sina.com, johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, luiz.dentz@gmail.com, 
	marcel@holtmann.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    933069701c1b Merge tag '6.11-rc-smb3-server-fixes' of git:..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=10fba1f1980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f828342678294017
dashboard link: https://syzkaller.appspot.com/bug?extid=91dbdfecdd3287734d8e
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14f45af1980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14e8b645980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/22dd51445d03/disk-93306970.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f85f111961d5/vmlinux-93306970.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7971b4814e87/bzImage-93306970.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+91dbdfecdd3287734d8e@syzkaller.appspotmail.com

============================================
WARNING: possible recursive locking detected
6.10.0-syzkaller-g933069701c1b #0 Not tainted
--------------------------------------------
kworker/1:1H/1247 is trying to acquire lock:
ffff888121075948 ((wq_completion)xillyusb){+.+.}-{0:0}, at: touch_wq_lockdep_map+0x6e/0x120 kernel/workqueue.c:3876

but task is already holding lock:
ffff888121075948 ((wq_completion)xillyusb){+.+.}-{0:0}, at: process_one_work+0x1277/0x1b40 kernel/workqueue.c:3206

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock((wq_completion)xillyusb);
  lock((wq_completion)xillyusb);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

2 locks held by kworker/1:1H/1247:
 #0: ffff888121075948 ((wq_completion)xillyusb){+.+.}-{0:0}, at: process_one_work+0x1277/0x1b40 kernel/workqueue.c:3206
 #1: ffffc900023afd80 ((work_completion)(&xdev->wakeup_workitem)){+.+.}-{0:0}, at: process_one_work+0x921/0x1b40 kernel/workqueue.c:3207

stack backtrace:
CPU: 1 UID: 0 PID: 1247 Comm: kworker/1:1H Not tainted 6.10.0-syzkaller-g933069701c1b #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/2024
Workqueue: xillyusb wakeup_all
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:93 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:119
 check_deadlock kernel/locking/lockdep.c:3061 [inline]
 validate_chain kernel/locking/lockdep.c:3855 [inline]
 __lock_acquire+0x2167/0x3cb0 kernel/locking/lockdep.c:5142
 lock_acquire kernel/locking/lockdep.c:5759 [inline]
 lock_acquire+0x1b1/0x560 kernel/locking/lockdep.c:5724
 touch_wq_lockdep_map+0x78/0x120 kernel/workqueue.c:3876
 __flush_workqueue+0x129/0x1200 kernel/workqueue.c:3918
 drain_workqueue+0x18f/0x3d0 kernel/workqueue.c:4082
 destroy_workqueue+0xc2/0xaa0 kernel/workqueue.c:5781
 cleanup_dev+0xc5/0x150 drivers/char/xillybus/xillyusb.c:558
 kref_put include/linux/kref.h:65 [inline]
 wakeup_all+0x28c/0x300 drivers/char/xillybus/xillyusb.c:612
 process_one_work+0x9c5/0x1b40 kernel/workqueue.c:3231
 process_scheduled_works kernel/workqueue.c:3312 [inline]
 worker_thread+0x6c8/0xf20 kernel/workqueue.c:3390
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

