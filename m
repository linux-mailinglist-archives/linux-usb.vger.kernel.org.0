Return-Path: <linux-usb+bounces-16147-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A563999B906
	for <lists+linux-usb@lfdr.de>; Sun, 13 Oct 2024 12:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57851B21414
	for <lists+linux-usb@lfdr.de>; Sun, 13 Oct 2024 10:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21BB13C690;
	Sun, 13 Oct 2024 10:14:28 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA6582499
	for <linux-usb@vger.kernel.org>; Sun, 13 Oct 2024 10:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728814468; cv=none; b=DtPRDJYmDQV89PJ0BRleTz9bkpkKPgv8kEC7lvykPKwjIls/9zOiIeAhFUBL+h/WvuUXs4XHaBrSN9xUA5a/eXYctws5mRXIza/Btp4/D+oTNPszVHl3ZoCphuh9xFiF7g8TNr0hdtVI9WAIA9hubHXR1K9UKdez6fNeIjEtQMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728814468; c=relaxed/simple;
	bh=y5mpwZfkOxo2JFbA1LuPV3cn8EYOrYBePaBQMZQViyo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=pUWsH8fb56EhKy8vBWXVC5lkZpVflLrsrK5gNDzU/yys04enDbD/4R4KUcVwDOEroN6bLoJ2ntQJgXIvetkuZSqbhOW8TZo5kZnJvqAoGxh5USa+MGjQzAfsk0znXsG+3Q6+1Yh0qwg5GxyqOk6+LrXA/wKPiKRDtLA80G7A0H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a3466d220dso33191835ab.3
        for <linux-usb@vger.kernel.org>; Sun, 13 Oct 2024 03:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728814466; x=1729419266;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wfaQulymYnC8oCbwRSN1pMqbyZ0WJbqyTy3xy/A0104=;
        b=apYoms5wl8qJc36yY5C0Nzh97HUXyUueCIGSWX8zNGDpgjVsrOm45G9KiOP7l06oSi
         KGXECfaQ9ha9DryVT+KI4sPzHhjmyqQ9gxYrVAve8Dlh4XWklOY2YnnZ97SrhFpxKK00
         QhmtEIQW7aIcgzpc4jloKIWRjCSpc3eIQIZih+8o74qIm32rNg5lEQ74DdYILjHon10J
         +CiKQ5HkJvebR6iOmUMGx0cCrYjf4OUwFn0sTDELt779PKv8huFdXk5GaDZOlLaGXNvc
         1iM8yzTeuNIHSbvEXKe0U1EcSmfqIgnbvJcW6S9e+T4R6TGXZOYJt34VWimYW2Beat+y
         Rivg==
X-Forwarded-Encrypted: i=1; AJvYcCU4gnpOqO6GasxXJ8HSqV81gQCUPdaYqvhF38D7zjKuoMKzmSqdBmeblVu6O0udRQMAm5tb/7X5a94=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl5fg3g2GVA9VVn7qoGrnNDejpvHllS1TkMiR5Yn73Zn10GbgM
	OQrIKEav0t604s1t00CGLLuruwvEO5GX2j5t5bEV4+o3doisWPWllvF0SNKv6i2M4FajiaN/Fyb
	MPUQQ9qwL1d7KWicRnZJ4G6W5fAHd+nOJ/+9M7nyPZF3owXicKuARZJk=
X-Google-Smtp-Source: AGHT+IFpEdHnC3XYmJC6x2f5wwLVTMLyuem6p6Jlb27Sd9GrtHQvU9SA/C1T3iJij+YgNBVk8sAC7+1z/M0Ok4YuwsOwLGpI7ygG
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2163:b0:3a3:b143:98 with SMTP id
 e9e14a558f8ab-3a3b5faabf5mr52246425ab.15.1728814466077; Sun, 13 Oct 2024
 03:14:26 -0700 (PDT)
Date: Sun, 13 Oct 2024 03:14:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <670b9d82.050a0220.3e960.0037.GAE@google.com>
Subject: [syzbot] [usb?] INFO: task hung in chaoskey_release
From: syzbot <syzbot+7c04149f25df31636533@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, keithp@keithp.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    33ce24234fca Add linux-next specific files for 20241008
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1209afd0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4750ca93740b938d
dashboard link: https://syzkaller.appspot.com/bug?extid=7c04149f25df31636533
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ee8dc2df0c57/disk-33ce2423.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/dc473c0fa06e/vmlinux-33ce2423.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4671f1ca2e61/bzImage-33ce2423.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7c04149f25df31636533@syzkaller.appspotmail.com

INFO: task syz.0.1141:10263 blocked for more than 143 seconds.
      Not tainted 6.12.0-rc2-next-20241008-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.1141      state:D stack:26544 pid:10263 tgid:10262 ppid:8755   flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x1895/0x4b30 kernel/sched/core.c:6682
 __schedule_loop kernel/sched/core.c:6759 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6774
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6831
 __mutex_lock_common kernel/locking/mutex.c:684 [inline]
 __mutex_lock+0x6a7/0xd70 kernel/locking/mutex.c:752
 chaoskey_release+0x79/0x2f0 drivers/usb/misc/chaoskey.c:299
 __fput+0x23f/0x880 fs/file_table.c:431
 task_work_run+0x24f/0x310 kernel/task_work.c:228
 get_signal+0x15e8/0x1740 kernel/signal.c:2690
 arch_do_signal_or_restart+0x96/0x860 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0xc9/0x370 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f769ff7dff9
RSP: 002b:00007f76a0d92038 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: fffffffffffffe00 RBX: 00007f76a0135f80 RCX: 00007f769ff7dff9
RDX: 0000000000000080 RSI: 0000000020000200 RDI: 000000000000000a
RBP: 00007f769fff0296 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f76a0135f80 R15: 00007ffefc59c0a8
 </TASK>
INFO: task syz.0.1141:10290 blocked for more than 143 seconds.
      Not tainted 6.12.0-rc2-next-20241008-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.1141      state:D stack:26640 pid:10290 tgid:10262 ppid:8755   flags:0x00004004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5322 [inline]
 __schedule+0x1895/0x4b30 kernel/sched/core.c:6682
 __schedule_loop kernel/sched/core.c:6759 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6774
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6831
 __mutex_lock_common kernel/locking/mutex.c:684 [inline]
 __mutex_lock+0x6a7/0xd70 kernel/locking/mutex.c:752
 chaoskey_release+0x169/0x2f0 drivers/usb/misc/chaoskey.c:322
 __fput+0x23f/0x880 fs/file_table.c:431
 task_work_run+0x24f/0x310 kernel/task_work.c:228
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x168/0x370 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f769ff7dff9
RSP: 002b:00007f76a0d71038 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 00007f76a0136058 RCX: 00007f769ff7dff9
RDX: 0000000000000000 RSI: ffffffffffffffff RDI: 0000000000000003
RBP: 00007f769fff0296 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f76a0136058 R15: 00007ffefc59c0a8
 </TASK>
INFO: lockdep is turned off.
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 30 Comm: khungtaskd Not tainted 6.12.0-rc2-next-20241008-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x49c/0x4d0 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x198/0x320 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:162 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:223 [inline]
 watchdog+0xff4/0x1040 kernel/hung_task.c:379
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0 skipped: idling at native_safe_halt arch/x86/include/asm/irqflags.h:48 [inline]
NMI backtrace for cpu 0 skipped: idling at arch_safe_halt arch/x86/include/asm/irqflags.h:106 [inline]
NMI backtrace for cpu 0 skipped: idling at acpi_safe_halt+0x21/0x30 drivers/acpi/processor_idle.c:111


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

