Return-Path: <linux-usb+bounces-29134-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA32BCE8FE
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 22:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4E88188318C
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 20:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98AD302152;
	Fri, 10 Oct 2025 20:49:34 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5764E2475C8
	for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 20:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760129374; cv=none; b=cgbS7x02l3gSwIedMO1Zo/mbFMak+EIkChQouvD4hrY9jr/c+qy4w8zanRYW0rYGHPxwpu1KtkG5+MnpkJGUieNWguRATetnqs3iOCBXVk3wLsAIIcGwfli4k26Wlcnmq0Zvn/8+AjSu6MHHzgc/qLX7xxGaVE7D7947Ro/JvrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760129374; c=relaxed/simple;
	bh=/gnQJ7RI9QlMy8UXruoCJAVDQk2IDPsTNt179btmZto=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=KSj8LumMEhJ3/8+UXCjT19hevUZ4eocNvDJD8QB4YazyuEDwWgCGPJcSSsJUdniLjJgXOCeq5DFbz8f8yc9bVes1siEuhmIO+MPjRtb5ilaEzaM3eFboODnvN5XI4Q0d3x3859Ns2jSOiTPnlOGQwq1eftCfvknqcBMl8c26VGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-90e469a7f6bso948289439f.2
        for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 13:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760129371; x=1760734171;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1kjRU9UxXPe8peSG/wkxt8fPs1Ll+kcYWaVQ2oJKR+k=;
        b=dUr8VV5qlArvAiuLd2E4XGawTTKNRoSBL5TRcWb7hhGE15MXWQ0koQwJ1j1XZcBDEY
         5C6vvksn9dsJ+NF0dd+5ZBk0xjd3M2+A+dzw0zTGA6GBGMSql6B5jSsJ86dqnLSPzYoM
         Htzjum7M6F9yIpuYgFxUYJC0AQe+KsunA+csI9CXHv/d7MNyyOlvVTXiDiToq9t7773v
         mw9VApskfnEz4Tf4fgHhdvAs5DbLfgtF6G0DTcrhZZ4cf2jMlthjvQ5MgfACOAHk/pLC
         O3jLg5B3z+NOy0VjSWhjWDeRFWvSeYIvg7fQVh5T7MwMxY9G9Pxdz5mglWNVGeOv7nUU
         oYjA==
X-Forwarded-Encrypted: i=1; AJvYcCVBYGijEghPzP2i7hSDE5dQow83ULV1VAhJWohlC3n4pYvnKrCn4tJmb2OAFKOzx1QUHucdEiSEzjE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcHgj/kQ8rwjcFZO9/ChDyQJhOVtbK0HRuM32Gg1mNUwPKFTCO
	4VRWFn9RMj+4l30EqSLpgb3dgFoWcP2fEiC5NRadL6MxVJODOTi94bgnw5M8HRi1+kkzE/fdtJZ
	qg7H8qiIbAvNP2RGZ9PawrA3ABAkjASgUU9J2i74AXeWRTV4jk47SLV7a8g0=
X-Google-Smtp-Source: AGHT+IGtYJmiQyL3eOtQPXrrGmPWKcr/lQtG4mhEQ73M+HqlZUNkrGvqRD2Jf8R0JTwCZiVqNN+M1u83UugPHPZ7QGvR+BVQL7Vr
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:27d3:b0:93b:c5ae:48b5 with SMTP id
 ca18e2360f4ac-93bd1987f7bmr1811680339f.10.1760129371330; Fri, 10 Oct 2025
 13:49:31 -0700 (PDT)
Date: Fri, 10 Oct 2025 13:49:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68e9715b.050a0220.1186a4.000f.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in count_matching_names (2)
From: syzbot <syzbot+27c198c3fe6ec83bf701@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0b2f041c47ac Add linux-next specific files for 20251009
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1136c542580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d4057daadbd2196b
dashboard link: https://syzkaller.appspot.com/bug?extid=27c198c3fe6ec83bf701
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10a54b34580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7457234c80b4/disk-0b2f041c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0b9bc009e937/vmlinux-0b2f041c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/81911ba26337/bzImage-0b2f041c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+27c198c3fe6ec83bf701@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000060: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000300-0x0000000000000307]
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/02/2025
RIP: 0010:strcmp+0x3c/0xc0 lib/string.c:284
Code: 00 fc ff df 45 31 f6 4a 8d 04 37 48 89 c1 48 c1 e9 03 0f b6 0c 19 84 c9 75 2c 42 0f b6 2c 37 4a 8d 04 36 48 89 c1 48 c1 e9 03 <0f> b6 0c 19 84 c9 75 33 42 0f b6 0c 36 40 38 cd 75 48 49 ff c6 40
RSP: 0018:ffffc90000007700 EFLAGS: 00010006
RAX: 0000000000000300 RBX: dffffc0000000000 RCX: 0000000000000060
RDX: 0000000000000001 RSI: 0000000000000300 RDI: ffffffff8bc0d800
RBP: 0000000000000026 R08: 0000000000000001 R09: 0000000000000001
R10: dffffc0000000000 R11: ffffed10048b6802 R12: ffffffff933b4400
R13: ffffffff96182098 R14: 0000000000000000 R15: ffffffff93380340
FS:  0000000000000000(0000) GS:ffff888125d2b000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f1dd8518750 CR3: 0000000078662000 CR4: 00000000003526f0
Call Trace:
 <IRQ>
 count_matching_names+0x57/0x90 kernel/locking/lockdep.c:878
 register_lock_class+0x23f/0x320 kernel/locking/lockdep.c:1344
 __lock_acquire+0x99/0xd20 kernel/locking/lockdep.c:5112
 lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
 _raw_spin_lock_irqsave+0xa7/0xf0 kernel/locking/spinlock.c:162
 complete_with_flags kernel/sched/completion.c:25 [inline]
 complete+0x28/0x1b0 kernel/sched/completion.c:52
 transfer drivers/usb/gadget/udc/dummy_hcd.c:1523 [inline]
 dummy_timer+0x214f/0x44c0 drivers/usb/gadget/udc/dummy_hcd.c:1979
 __run_hrtimer kernel/time/hrtimer.c:1777 [inline]
 __hrtimer_run_queues+0x52c/0xc60 kernel/time/hrtimer.c:1841
 hrtimer_run_softirq+0x187/0x2b0 kernel/time/hrtimer.c:1858
 handle_softirqs+0x286/0x870 kernel/softirq.c:622
 __do_softirq kernel/softirq.c:656 [inline]
 invoke_softirq kernel/softirq.c:496 [inline]
 __irq_exit_rcu+0xca/0x1f0 kernel/softirq.c:723
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:739
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1052 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1052
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:697
RIP: 0010:finish_task_switch+0x26b/0x950 kernel/sched/core.c:5193
Code: 0f 84 3c 01 00 00 48 85 db 0f 85 63 01 00 00 0f 1f 44 00 00 4c 8b 75 d0 4c 89 e7 e8 ef fb b5 09 e8 aa a9 36 00 fb 4c 8b 65 c0 <49> 8d bc 24 58 16 00 00 48 89 f8 48 c1 e8 03 42 0f b6 04 28 84 c0
RSP: 0018:ffffffff8de07af8 EFLAGS: 00000282
RAX: 3132a480b5f71400 RBX: 0000000000000000 RCX: 3132a480b5f71400
RDX: 0000000000000000 RSI: ffffffff8d7f1156 RDI: ffffffff8bc0d160
RBP: ffffffff8de07b50 R08: ffffffff8f9dba77 R09: 1ffffffff1f3b74e
R10: dffffc0000000000 R11: fffffbfff1f3b74f R12: ffffffff8de95200
R13: dffffc0000000000 R14: ffff888030a18000 R15: ffff8880b863abd8
 context_switch kernel/sched/core.c:5328 [inline]
 __schedule+0x17a0/0x4cc0 kernel/sched/core.c:6929
 schedule_idle+0x52/0x90 kernel/sched/core.c:7052
 do_idle+0x4a7/0x510 kernel/sched/idle.c:358
 cpu_startup_entry+0x44/0x60 kernel/sched/idle.c:428
 rest_init+0x2de/0x300 init/main.c:757
 start_kernel+0x3ae/0x410 init/main.c:1111
 x86_64_start_reservations+0x24/0x30 arch/x86/kernel/head64.c:310
 x86_64_start_kernel+0x143/0x1c0 arch/x86/kernel/head64.c:291
 common_startup_64+0x13e/0x147
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:strcmp+0x3c/0xc0 lib/string.c:284
Code: 00 fc ff df 45 31 f6 4a 8d 04 37 48 89 c1 48 c1 e9 03 0f b6 0c 19 84 c9 75 2c 42 0f b6 2c 37 4a 8d 04 36 48 89 c1 48 c1 e9 03 <0f> b6 0c 19 84 c9 75 33 42 0f b6 0c 36 40 38 cd 75 48 49 ff c6 40
RSP: 0018:ffffc90000007700 EFLAGS: 00010006
RAX: 0000000000000300 RBX: dffffc0000000000 RCX: 0000000000000060
RDX: 0000000000000001 RSI: 0000000000000300 RDI: ffffffff8bc0d800
RBP: 0000000000000026 R08: 0000000000000001 R09: 0000000000000001
R10: dffffc0000000000 R11: ffffed10048b6802 R12: ffffffff933b4400
R13: ffffffff96182098 R14: 0000000000000000 R15: ffffffff93380340
FS:  0000000000000000(0000) GS:ffff888125d2b000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f1dd8518750 CR3: 0000000078662000 CR4: 00000000003526f0
----------------
Code disassembly (best guess), 4 bytes skipped:
   0:	45 31 f6             	xor    %r14d,%r14d
   3:	4a 8d 04 37          	lea    (%rdi,%r14,1),%rax
   7:	48 89 c1             	mov    %rax,%rcx
   a:	48 c1 e9 03          	shr    $0x3,%rcx
   e:	0f b6 0c 19          	movzbl (%rcx,%rbx,1),%ecx
  12:	84 c9                	test   %cl,%cl
  14:	75 2c                	jne    0x42
  16:	42 0f b6 2c 37       	movzbl (%rdi,%r14,1),%ebp
  1b:	4a 8d 04 36          	lea    (%rsi,%r14,1),%rax
  1f:	48 89 c1             	mov    %rax,%rcx
  22:	48 c1 e9 03          	shr    $0x3,%rcx
* 26:	0f b6 0c 19          	movzbl (%rcx,%rbx,1),%ecx <-- trapping instruction
  2a:	84 c9                	test   %cl,%cl
  2c:	75 33                	jne    0x61
  2e:	42 0f b6 0c 36       	movzbl (%rsi,%r14,1),%ecx
  33:	40 38 cd             	cmp    %cl,%bpl
  36:	75 48                	jne    0x80
  38:	49 ff c6             	inc    %r14
  3b:	40                   	rex


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

