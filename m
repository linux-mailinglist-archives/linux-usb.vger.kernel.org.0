Return-Path: <linux-usb+bounces-19205-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F14BA09F8C
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jan 2025 01:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE9967A2668
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jan 2025 00:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC198F5C;
	Sat, 11 Jan 2025 00:40:30 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6813C1FDD
	for <linux-usb@vger.kernel.org>; Sat, 11 Jan 2025 00:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736556030; cv=none; b=Bbi4sG+6iVbMVhw1RzjJuNz7aKRpd+U9sQIWDUn1+oakp8a6ACO+PLv11lQkFz36po9dNAIAx6blXZDNc2yvmyFOo8Uq/8vCFnSxXh0QlhKMBrME0NJ9sQriB7hqTTGHUigTbh8xa/gosP62wsJ5SJ1D3SaEAwUN3IFAU3JJryE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736556030; c=relaxed/simple;
	bh=tPNU/mC/kxxCYJK1mEEtwCHM0JugZTdFyKq3SwcQ+dM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=SBdENMwxLooXQysREVp3+lwhDbY6vZvMHDvxDEC5HBAr97IWGlpg2rKbUEPDNLM1GlBYvOrZQDuJ9hJepFV00pMmYxplgqQQi8Vaon2MZ0b0wRPsyiXAD6g3QvPXh1Z4tvfINMf5YVLS0ng06ojgGNSvtzF+egppMh0PFGBgjKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3a78421a2e1so38273855ab.2
        for <linux-usb@vger.kernel.org>; Fri, 10 Jan 2025 16:40:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556027; x=1737160827;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3xUtxMyCEbFsPMOoJr0tb7qnmzB7ylulLK4hv1N9cr0=;
        b=oX691PGdtnJ0gEJpaTIlFYuQ+xiZ7/w94cGVYnN+XouGlyHautf+gMSK+zBHKhhckI
         wvR8rxP4tBCDRfv8acH42iHS6DhXsbv/EDqvMhyl7d9/yNegYSOZKrC3pXfiXR1B4njS
         EttiPKIIt+yLBCE+q7fhxfjfQ2voFFzAFyR5ucG/pGWpVDp4lcbQm9dNfRSFJBqFApvA
         t1USNDcSmnL/c6fNGvD/ZiBUb2nl/jJnEhkuuWdrbYx/pWlRtl0WNV/s23zWs21DbFQp
         YSyChTUmDuAT4hnF60zrYpFe0ziH9NpouN+5whs7To28GzSjsAEIJ1jIhwmb96gknd9n
         Q4SA==
X-Forwarded-Encrypted: i=1; AJvYcCWCrBANrqvN4KhPc6c92csQBZtpRJU856WzLdgboVfcZeZ3ksJ3cPYlNXbERzkv97l4nRYwHHG3mOk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7R/CRWRo0rYo+lGlnHnxKLJ2tOSjh3x4EYfOC3ErKe7dATYP9
	FuPRS/f6JUPtFT295Ll3JkthjLV+X9QdiiHYWKcuLrSKQYEwod5Z4HYS0iXMXVmAZG00xoJBzyv
	ezY98E+RP4hryt+Ujx+mAq4RhFyz/lmZTWOZe+2WRtGfZ3aJrOvFx4fQ=
X-Google-Smtp-Source: AGHT+IE/Wk8FnJf1K3CpOpbL44yJ8FUTxQxu0nBwy8IKHJ1A3rNqWrEMUk3oDGkUhXvqcRwtyreF76Nn9bunWDh/HVsW/qDpLJKr
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c26d:0:b0:3a7:87f2:b00e with SMTP id
 e9e14a558f8ab-3ce3a8bb3cbmr96886065ab.19.1736556027559; Fri, 10 Jan 2025
 16:40:27 -0800 (PST)
Date: Fri, 10 Jan 2025 16:40:27 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6781bdfb.050a0220.216c54.0018.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in qt2_read_bulk_callback
From: syzbot <syzbot+506479ebf12fe435d01a@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, johan@kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5428dc1906dd Merge tag 'exfat-for-6.13-rc7' of git://git.k..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1469f9c4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4ef22c4fce5135b4
dashboard link: https://syzkaller.appspot.com/bug?extid=506479ebf12fe435d01a
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17597418580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1269f9c4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/02ab71af0937/disk-5428dc19.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/55b33cfb5bd7/vmlinux-5428dc19.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a3aa8c69a577/bzImage-5428dc19.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+506479ebf12fe435d01a@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000024: 0000 [#1] PREEMPT SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000120-0x0000000000000127]
CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 6.13.0-rc6-syzkaller-00006-g5428dc1906dd #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
RIP: 0010:tty_insert_flip_char include/linux/tty_flip.h:67 [inline]
RIP: 0010:qt2_process_read_urb drivers/usb/serial/quatech2.c:538 [inline]
RIP: 0010:qt2_read_bulk_callback+0x3b2/0x1160 drivers/usb/serial/quatech2.c:574
Code: 00 00 42 0f b6 04 28 84 c0 0f 85 e0 08 00 00 c6 84 24 d0 00 00 00 00 48 8b 44 24 08 48 8d 98 20 01 00 00 48 89 d8 48 c1 e8 03 <42> 80 3c 28 00 74 08 48 89 df e8 0f 1b 81 fa 4c 8b 3b 4d 8d 67 08
RSP: 0018:ffffc90000a18720 EFLAGS: 00010006
RAX: 0000000000000024 RBX: 0000000000000120 RCX: ffffc90000a18700
RDX: 0000000000000100 RSI: 0000000000000000 RDI: 000000000000001b
RBP: ffffc90000a18870 R08: ffffffff8784cba6 R09: 1ffffffff203303e
R10: dffffc0000000000 R11: fffffbfff203303f R12: ffff888032352c13
R13: dffffc0000000000 R14: 00000000000000a5 R15: ffff888033680800
FS:  0000000000000000(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000556bc64d0d60 CR3: 0000000035e4e000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 __usb_hcd_giveback_urb+0x42c/0x6e0 drivers/usb/core/hcd.c:1650
 dummy_timer+0x856/0x4620 drivers/usb/gadget/udc/dummy_hcd.c:1993
 __run_hrtimer kernel/time/hrtimer.c:1739 [inline]
 __hrtimer_run_queues+0x59b/0xd30 kernel/time/hrtimer.c:1803
 hrtimer_run_softirq+0x19a/0x2c0 kernel/time/hrtimer.c:1820
 handle_softirqs+0x2d4/0x9b0 kernel/softirq.c:561
 __do_softirq kernel/softirq.c:595 [inline]
 invoke_softirq kernel/softirq.c:435 [inline]
 __irq_exit_rcu+0xf7/0x220 kernel/softirq.c:662
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:678
 common_interrupt+0xb9/0xd0 arch/x86/kernel/irq.c:278
 </IRQ>
 <TASK>
 asm_common_interrupt+0x26/0x40 arch/x86/include/asm/idtentry.h:693
RIP: 0010:finish_task_switch+0x1ea/0x870 kernel/sched/core.c:5243
Code: c9 50 e8 49 0c 0c 00 48 83 c4 08 4c 89 f7 e8 ed 39 00 00 0f 1f 44 00 00 4c 89 f7 e8 e0 d9 5c 0a e8 0b 8c 38 00 fb 48 8b 5d c0 <48> 8d bb f8 15 00 00 48 89 f8 48 c1 e8 03 49 be 00 00 00 00 00 fc
RSP: 0018:ffffc900001a7b48 EFLAGS: 00000286
RAX: 1d3ab2024a67fb00 RBX: ffff88801d2e8000 RCX: ffffffff9a3ab903
RDX: dffffc0000000000 RSI: ffffffff8c0a98e0 RDI: ffffffff8c5fb020
RBP: ffffc900001a7b90 R08: ffffffff901981f7 R09: 1ffffffff203303e
R10: dffffc0000000000 R11: fffffbfff203303f R12: 1ffff110170e7edc
R13: dffffc0000000000 R14: ffff8880b873e8c0 R15: ffff8880b873f6e0
 context_switch kernel/sched/core.c:5372 [inline]
 __schedule+0x1858/0x4c30 kernel/sched/core.c:6756
 schedule_idle+0x56/0x90 kernel/sched/core.c:6874
 do_idle+0x567/0x5c0 kernel/sched/idle.c:353
 cpu_startup_entry+0x42/0x60 kernel/sched/idle.c:423
 start_secondary+0x102/0x110 arch/x86/kernel/smpboot.c:314
 common_startup_64+0x13e/0x147
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:tty_insert_flip_char include/linux/tty_flip.h:67 [inline]
RIP: 0010:qt2_process_read_urb drivers/usb/serial/quatech2.c:538 [inline]
RIP: 0010:qt2_read_bulk_callback+0x3b2/0x1160 drivers/usb/serial/quatech2.c:574
Code: 00 00 42 0f b6 04 28 84 c0 0f 85 e0 08 00 00 c6 84 24 d0 00 00 00 00 48 8b 44 24 08 48 8d 98 20 01 00 00 48 89 d8 48 c1 e8 03 <42> 80 3c 28 00 74 08 48 89 df e8 0f 1b 81 fa 4c 8b 3b 4d 8d 67 08
RSP: 0018:ffffc90000a18720 EFLAGS: 00010006
RAX: 0000000000000024 RBX: 0000000000000120 RCX: ffffc90000a18700
RDX: 0000000000000100 RSI: 0000000000000000 RDI: 000000000000001b
RBP: ffffc90000a18870 R08: ffffffff8784cba6 R09: 1ffffffff203303e
R10: dffffc0000000000 R11: fffffbfff203303f R12: ffff888032352c13
R13: dffffc0000000000 R14: 00000000000000a5 R15: ffff888033680800
FS:  0000000000000000(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000556bc64d0d60 CR3: 0000000035e4e000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	00 00                	add    %al,(%rax)
   2:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
   7:	84 c0                	test   %al,%al
   9:	0f 85 e0 08 00 00    	jne    0x8ef
   f:	c6 84 24 d0 00 00 00 	movb   $0x0,0xd0(%rsp)
  16:	00
  17:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  1c:	48 8d 98 20 01 00 00 	lea    0x120(%rax),%rbx
  23:	48 89 d8             	mov    %rbx,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1) <-- trapping instruction
  2f:	74 08                	je     0x39
  31:	48 89 df             	mov    %rbx,%rdi
  34:	e8 0f 1b 81 fa       	call   0xfa811b48
  39:	4c 8b 3b             	mov    (%rbx),%r15
  3c:	4d 8d 67 08          	lea    0x8(%r15),%r12


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

