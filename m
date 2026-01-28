Return-Path: <linux-usb+bounces-32844-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BmoFKBZeWlnwgEAu9opvQ
	(envelope-from <linux-usb+bounces-32844-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 01:34:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DA57E9BAD2
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 01:34:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 92F3F300D376
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 00:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF6621019E;
	Wed, 28 Jan 2026 00:34:33 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f78.google.com (mail-ot1-f78.google.com [209.85.210.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36B71F3BA2
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 00:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769560472; cv=none; b=Qxz6BWcwLOL10sy5gZtW2PHB7iv3BPY7eONEweEe+8Fz7xQCznvCGKjwTYy/NF9I9aEra9L4+KR7UATlVh05iBbhLkXk1E3GgpsVC20snJBA5qhTH7j+UMSh8UvKMH5zDJTcNDHt2kgmZRIQZrHhwfd//eQR9NE448ZFj1kjY2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769560472; c=relaxed/simple;
	bh=1FaoHDaBZwGU+h/zoXrY7rk7sKExFQwTz8rXNpfuUTk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=BpGjNDrsIO98mzC1okU8TxvfAv0Ntt/h7Kzr+R4kE6UJ8cbMkR+jxgZpdC8kN2QrILWCGkPqDTslVlO1mlXf+h35J07dXNneft5Sv8f1sJRsgHXHV3QGZ05AwC/0pmkOJ8VxlvZobe3BM66UraeYlc7ZuFCyAUAEMWmOawbpXkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f78.google.com with SMTP id 46e09a7af769-7d18e9ab16fso637792a34.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 16:34:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769560470; x=1770165270;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fCJrlDo5LNzITZbaV2WJvzVU6whXbvSxw/Z5PagoGlc=;
        b=cN2TY/Bn8oRkSAEJPJzM2x+peD/3hzZJRQMgqVKWajsCP9hSY6pHiIcwnTYv4p7rv4
         r54kFhdQS+uKDbCHL1zBpJwCoT7NfYcV+h/DXZA3HxqaSMAna95eooST5ydOmiEPf0Z2
         umaA3eCV7k2T/XTOkuWki0ctVBjkQnD8Tqy+0ohbOWmXLyUYMVhwoGf7xnjI+DhSCpfi
         J8TQEYaiNp0KQ72cN9758yAl89yFwk2Pvt4eJF1TeDI6GYkQiTolQ9sSWN8Ip6wy/g+g
         fBuY14loKyAdc3Z7SmzWj1naQH6FfJv+kmHQrYUTyASY1eNeHdyL6WLxIhYwP21IQTOL
         cGkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5rKHSZI8eCWBOuMV36thgRCTDWMJ+HQBM2AOYh7LFJ3Xt8DRc+RnMfh6a54IdlgIYB3ZwMBFXxT4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy47OMzjC9lrIZYtLYT2dfcNUOw9FUuPEEcjXxq0MOg/BBpYvRZ
	NToNH2m8ZDJC4fx0NN9ll6Tt6Fve/D0kIN0NXMXqd9GvKTC7R2l7Ye3jl3qvaIgMxjG7A1dbmXI
	d/GljMp+ppDOx0GJRf6ayBdEC05TZQ0WlSepaeK0gvUToM+zZOg32Ld5aRDw=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:498e:b0:662:fc95:1f8c with SMTP id
 006d021491bc7-662fc9520b7mr162664eaf.30.1769560469829; Tue, 27 Jan 2026
 16:34:29 -0800 (PST)
Date: Tue, 27 Jan 2026 16:34:29 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69795995.050a0220.c9109.0028.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in qt2_read_bulk_callback (2)
From: syzbot <syzbot+c63f59479d561970dc2b@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, johan@kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=d51c584a7396ddf1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32844-lists,linux-usb=lfdr.de,c63f59479d561970dc2b];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	SUBJECT_HAS_QUESTION(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,storage.googleapis.com:url,goo.gl:url]
X-Rspamd-Queue-Id: DA57E9BAD2
X-Rspamd-Action: no action

Hello,

syzbot found the following issue on:

HEAD commit:    615aad0f61e0 Add linux-next specific files for 20260126
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1761a05a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d51c584a7396ddf1
dashboard link: https://syzkaller.appspot.com/bug?extid=c63f59479d561970dc2b
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=145d6bfa580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14dac98a580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5318e5f027be/disk-615aad0f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d165e561fa49/vmlinux-615aad0f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/fb0e01c90aa5/bzImage-615aad0f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c63f59479d561970dc2b@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000038: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x00000000000001c0-0x00000000000001c7]
CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/13/2026
Workqueue: usb_hub_wq hub_event
RIP: 0010:__queue_work+0xa2/0xf90 kernel/workqueue.c:2269
Code: 11 31 ff 89 ee e8 4e f4 37 00 85 ed 0f 85 ef 0c 00 00 e8 01 f0 37 00 4d 8d b7 c0 01 00 00 4c 89 f0 48 c1 e8 03 48 89 44 24 28 <42> 0f b6 04 20 84 c0 0f 85 22 0d 00 00 4c 89 34 24 41 8b 2e 89 ee
RSP: 0018:ffffc900000077f8 EFLAGS: 00010002
RAX: 0000000000000038 RBX: 0000000000000008 RCX: ffff88801dafdac0
RDX: 0000000000000100 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffff88803642c01f R09: 1ffff11006c85803
R10: dffffc0000000000 R11: ffffed1006c85804 R12: dffffc0000000000
R13: ffff88803642c018 R14: 00000000000001c0 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8881252b4000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fef907e8600 CR3: 000000000e54a000 CR4: 00000000003526f0
Call Trace:
 <IRQ>
 queue_work_on+0x106/0x1d0 kernel/workqueue.c:2405
 qt2_process_read_urb drivers/usb/serial/quatech2.c:541 [inline]
 qt2_read_bulk_callback+0xe96/0x1030 drivers/usb/serial/quatech2.c:574
 __usb_hcd_giveback_urb+0x376/0x540 drivers/usb/core/hcd.c:1657
 dummy_timer+0xbbd/0x45d0 drivers/usb/gadget/udc/dummy_hcd.c:1995
 __run_hrtimer kernel/time/hrtimer.c:1785 [inline]
 __hrtimer_run_queues+0x529/0xc30 kernel/time/hrtimer.c:1849
 hrtimer_run_softirq+0x182/0x5a0 kernel/time/hrtimer.c:1866
 handle_softirqs+0x22a/0x7c0 kernel/softirq.c:626
 __do_softirq kernel/softirq.c:660 [inline]
 invoke_softirq kernel/softirq.c:496 [inline]
 __irq_exit_rcu+0x5f/0x150 kernel/softirq.c:727
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:743
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1056 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1056
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:697
RIP: 0010:lock_acquire+0x221/0x330 kernel/locking/lockdep.c:5872
Code: ff ff ff e8 e1 1d fe 09 f7 44 24 08 00 02 00 00 0f 84 3a ff ff ff 65 48 8b 05 fb bd 75 11 48 3b 44 24 58 75 33 fb 48 83 c4 60 <5b> 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc cc 48 8d 3d 88 6b 72
RSP: 0018:ffffc900000e69a0 EFLAGS: 00000286
RAX: 36c2f4075e728c00 RBX: 0000000000000000 RCX: 0000000000000046
RDX: 0000000000000007 RSI: ffffffff8e14e200 RDI: ffffffff8c273e00
RBP: ffffffff821fd99c R08: ffffc900000e67c0 R09: 0000000000000020
R10: ffffc900000e6bd0 R11: ffffffff81a16e20 R12: 0000000000000000
R13: ffffffff8e895dc0 R14: 0000000000000001 R15: 0000000000000246
 fs_reclaim_acquire+0x98/0x100 mm/page_alloc.c:4359
 might_alloc include/linux/sched/mm.h:317 [inline]
 slab_pre_alloc_hook mm/slub.c:4403 [inline]
 slab_alloc_node mm/slub.c:4758 [inline]
 kmem_cache_alloc_noprof+0x40/0x650 mm/slub.c:4788
 radix_tree_node_alloc+0x7e/0x3a0 lib/radix-tree.c:276
 idr_get_free+0x2b3/0xa70 lib/radix-tree.c:1506
 idr_alloc_u32+0x18d/0x320 lib/idr.c:48
 idr_alloc+0x6e/0xd0 lib/idr.c:89
 allocate_minors+0x98/0x2b0 drivers/usb/serial/usb-serial.c:95
 usb_serial_probe+0x25e7/0x2e50 drivers/usb/serial/usb-serial.c:1137
 usb_probe_interface+0x668/0xc90 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x267/0xaf0 drivers/base/dd.c:661
 __driver_probe_device+0x18c/0x320 drivers/base/dd.c:803
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:833
 __device_attach_driver+0x2d4/0x4c0 drivers/base/dd.c:961
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c5/0x450 drivers/base/dd.c:1033
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1088
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:574
 device_add+0x7b6/0xb70 drivers/base/core.c:3689
 usb_set_configuration+0x1a87/0x2110 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c4/0x3b0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x267/0xaf0 drivers/base/dd.c:661
 __driver_probe_device+0x18c/0x320 drivers/base/dd.c:803
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:833
 __device_attach_driver+0x2d4/0x4c0 drivers/base/dd.c:961
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c5/0x450 drivers/base/dd.c:1033
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1088
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:574
 device_add+0x7b6/0xb70 drivers/base/core.c:3689
 usb_new_device+0xa08/0x16f0 drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x2a1c/0x4f30 drivers/usb/core/hub.c:5953
 process_one_work+0x949/0x15a0 kernel/workqueue.c:3279
 process_scheduled_works kernel/workqueue.c:3362 [inline]
 worker_thread+0xb46/0x1140 kernel/workqueue.c:3443
 kthread+0x388/0x470 kernel/kthread.c:467
 ret_from_fork+0x51b/0xa40 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__queue_work+0xa2/0xf90 kernel/workqueue.c:2269
Code: 11 31 ff 89 ee e8 4e f4 37 00 85 ed 0f 85 ef 0c 00 00 e8 01 f0 37 00 4d 8d b7 c0 01 00 00 4c 89 f0 48 c1 e8 03 48 89 44 24 28 <42> 0f b6 04 20 84 c0 0f 85 22 0d 00 00 4c 89 34 24 41 8b 2e 89 ee
RSP: 0018:ffffc900000077f8 EFLAGS: 00010002
RAX: 0000000000000038 RBX: 0000000000000008 RCX: ffff88801dafdac0
RDX: 0000000000000100 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffff88803642c01f R09: 1ffff11006c85803
R10: dffffc0000000000 R11: ffffed1006c85804 R12: dffffc0000000000
R13: ffff88803642c018 R14: 00000000000001c0 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8881252b4000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fef907e8600 CR3: 000000000e54a000 CR4: 00000000003526f0
----------------
Code disassembly (best guess), 1 bytes skipped:
   0:	31 ff                	xor    %edi,%edi
   2:	89 ee                	mov    %ebp,%esi
   4:	e8 4e f4 37 00       	call   0x37f457
   9:	85 ed                	test   %ebp,%ebp
   b:	0f 85 ef 0c 00 00    	jne    0xd00
  11:	e8 01 f0 37 00       	call   0x37f017
  16:	4d 8d b7 c0 01 00 00 	lea    0x1c0(%r15),%r14
  1d:	4c 89 f0             	mov    %r14,%rax
  20:	48 c1 e8 03          	shr    $0x3,%rax
  24:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
* 29:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax <-- trapping instruction
  2e:	84 c0                	test   %al,%al
  30:	0f 85 22 0d 00 00    	jne    0xd58
  36:	4c 89 34 24          	mov    %r14,(%rsp)
  3a:	41 8b 2e             	mov    (%r14),%ebp
  3d:	89 ee                	mov    %ebp,%esi


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

