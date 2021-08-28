Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77C023FA696
	for <lists+linux-usb@lfdr.de>; Sat, 28 Aug 2021 17:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234274AbhH1PxJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 Aug 2021 11:53:09 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:54196 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbhH1PxI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 Aug 2021 11:53:08 -0400
Received: by mail-io1-f69.google.com with SMTP id n189-20020a6b8bc6000000b005b92c64b625so5954343iod.20
        for <linux-usb@vger.kernel.org>; Sat, 28 Aug 2021 08:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=wGQ0c3k6Xzfe8NlJQcUk/e/a/l0gLOhadY7N8twFvWo=;
        b=QEDqksJ5jxEtQe9mpZIPhNQYxDcy/qs7/HszAw+7/PwNTKg09E44mDA9FnQnXpAouf
         OElPQXfGlJLOfQ7Wt2mN+i9ZvYyfcbE0tXrx5dsv13uZroERDe+zZSSYMLYzOaahn3+j
         pAuSI7zCFhtucl21CAPuuhka9AJuCGBVsWAtFuRhqqqpsfcQTz40HNcVM6qbP9I/+sJB
         IK/XlkxjUd/5bNx5KcXn+AJDl/x0dxoBZG9QZGKruPRtr4v7Z3WvNeLBWJnMzIEXnWPD
         ggrECHfUG5DIKX1UL+v+OJjpENxLSGF8PglXVMPETd1BgKAHblHZTIaryHM9Nz0MUcRC
         Q8mg==
X-Gm-Message-State: AOAM531LCpvO3rrz0L1t/GjBzXw8mDJyCVfouSDLv1dGl8Ou50KP3+Lc
        hmVmAk7Ie5cxM0iOn1fk716xbZCRvogdSjyVKfXyGiE2kG3k
X-Google-Smtp-Source: ABdhPJy3fKXhlwA8aQgy/2SjVTLcNgaJP/CbrAU/Fo4rUTBrBY1PhFljks+NJGVVuYLjs/Ivkqb8T/8s2+eqkVAMV2lk76z1Ko+e
MIME-Version: 1.0
X-Received: by 2002:a05:6638:191c:: with SMTP id p28mr12831892jal.41.1630165937960;
 Sat, 28 Aug 2021 08:52:17 -0700 (PDT)
Date:   Sat, 28 Aug 2021 08:52:17 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a83c6a05caa09572@google.com>
Subject: [syzbot] INFO: task hung in do_proc_bulk
From:   syzbot <syzbot+ada0f7d3d9fd2016d927@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mathias.nyman@linux.intel.com, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    d5ae8d7f85b7 Revert "media: dvb header files: move some he..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=155fa21e300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2fd902af77ff1e56
dashboard link: https://syzkaller.appspot.com/bug?extid=ada0f7d3d9fd2016d927
compiler:       Debian clang version 11.0.1-2, GNU ld (GNU Binutils for Debian) 2.35.1
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11a1ab0e300000

Bisection is inconclusive: the issue happens on the oldest tested release.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15662ee1300000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=17662ee1300000
console output: https://syzkaller.appspot.com/x/log.txt?x=13662ee1300000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ada0f7d3d9fd2016d927@syzkaller.appspotmail.com

INFO: task syz-executor.0:8700 blocked for more than 143 seconds.
      Not tainted 5.14.0-rc7-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor.0  state:D stack:23192 pid: 8700 ppid:  8455 flags:0x00004004
Call Trace:
 context_switch kernel/sched/core.c:4681 [inline]
 __schedule+0xc07/0x11f0 kernel/sched/core.c:5938
 schedule+0x14b/0x210 kernel/sched/core.c:6017
 schedule_timeout+0x98/0x2f0 kernel/time/timer.c:1857
 do_wait_for_common+0x2da/0x480 kernel/sched/completion.c:85
 __wait_for_common kernel/sched/completion.c:106 [inline]
 wait_for_common kernel/sched/completion.c:117 [inline]
 wait_for_completion_timeout+0x46/0x60 kernel/sched/completion.c:157
 usb_start_wait_urb+0x167/0x550 drivers/usb/core/message.c:63
 do_proc_bulk+0x978/0x1080 drivers/usb/core/devio.c:1236
 proc_bulk drivers/usb/core/devio.c:1273 [inline]
 usbdev_do_ioctl drivers/usb/core/devio.c:2547 [inline]
 usbdev_ioctl+0x3441/0x6b10 drivers/usb/core/devio.c:2713
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:1069 [inline]
 __se_sys_ioctl+0xfb/0x170 fs/ioctl.c:1055
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x4665e9
RSP: 002b:00007f15a90dc188 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 000000000056bf80 RCX: 00000000004665e9
RDX: 0000000020000340 RSI: 00000000c0185502 RDI: 0000000000000004
RBP: 00000000004bfcc4 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 000000000056bf80
R13: 00007ffcc552e1bf R14: 00007f15a90dc300 R15: 0000000000022000

Showing all locks held in the system:
1 lock held by khungtaskd/1610:
 #0: ffffffff8c717ec0 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire+0x0/0x30 arch/x86/pci/mmconfig_64.c:151
1 lock held by in:imklog/8130:
 #0: ffff888035998870 (&f->f_pos_lock){+.+.}-{3:3}, at: __fdget_pos+0x24e/0x2f0 fs/file.c:974

=============================================

NMI backtrace for cpu 1
CPU: 1 PID: 1610 Comm: khungtaskd Not tainted 5.14.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1d3/0x29f lib/dump_stack.c:105
 nmi_cpu_backtrace+0x16c/0x190 lib/nmi_backtrace.c:105
 nmi_trigger_cpumask_backtrace+0x191/0x2f0 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:146 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:210 [inline]
 watchdog+0xd06/0xd50 kernel/hung_task.c:295
 kthread+0x453/0x480 kernel/kthread.c:319
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 PID: 10 Comm: kworker/u4:1 Not tainted 5.14.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: bat_events batadv_nc_worker
RIP: 0010:lock_is_held_type+0x1/0x180 kernel/locking/lockdep.c:5653
Code: 74 df 83 3d d8 22 e1 03 00 75 d6 48 c7 c7 80 c3 2e 8a 48 c7 c6 c0 c3 2e 8a 31 c0 e8 c9 8d 72 f7 0f 0b eb bd e8 90 fd ff ff 55 <41> 57 41 56 41 55 41 54 53 48 83 ec 10 65 48 8b 04 25 28 00 00 00
RSP: 0018:ffffc90000cf7990 EFLAGS: 00000202
RAX: 1ffffffff18e3801 RBX: 1ffff9200019ef34 RCX: 0000000080000001
RDX: 0000000000000000 RSI: 00000000ffffffff RDI: ffffffff8c717e20
RBP: ffffc90000cf7a28 R08: dffffc0000000000 R09: fffffbfff1b74ee6
R10: fffffbfff1b74ee6 R11: 0000000000000000 R12: dffffc0000000000
R13: 1ffff9200019ef58 R14: dffffc0000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f0a1e997000 CR3: 000000000c48e000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 lock_is_held include/linux/lockdep.h:283 [inline]
 rcu_read_lock_sched_held+0x87/0x110 kernel/rcu/update.c:125
 trace_lock_acquire+0x59/0x190 include/trace/events/lock.h:13
 lock_acquire+0xa4/0x4a0 kernel/locking/lockdep.c:5596
 rcu_lock_acquire+0x2a/0x30 include/linux/rcupdate.h:267
 rcu_read_lock include/linux/rcupdate.h:687 [inline]
 batadv_nc_purge_orig_hash net/batman-adv/network-coding.c:404 [inline]
 batadv_nc_worker+0xc8/0x5b0 net/batman-adv/network-coding.c:715
 process_one_work+0x833/0x10c0 kernel/workqueue.c:2276
 worker_thread+0xac1/0x1320 kernel/workqueue.c:2422
 kthread+0x453/0x480 kernel/kthread.c:319
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
----------------
Code disassembly (best guess):
   0:	74 df                	je     0xffffffe1
   2:	83 3d d8 22 e1 03 00 	cmpl   $0x0,0x3e122d8(%rip)        # 0x3e122e1
   9:	75 d6                	jne    0xffffffe1
   b:	48 c7 c7 80 c3 2e 8a 	mov    $0xffffffff8a2ec380,%rdi
  12:	48 c7 c6 c0 c3 2e 8a 	mov    $0xffffffff8a2ec3c0,%rsi
  19:	31 c0                	xor    %eax,%eax
  1b:	e8 c9 8d 72 f7       	callq  0xf7728de9
  20:	0f 0b                	ud2
  22:	eb bd                	jmp    0xffffffe1
  24:	e8 90 fd ff ff       	callq  0xfffffdb9
  29:	55                   	push   %rbp
* 2a:	41 57                	push   %r15 <-- trapping instruction
  2c:	41 56                	push   %r14
  2e:	41 55                	push   %r13
  30:	41 54                	push   %r12
  32:	53                   	push   %rbx
  33:	48 83 ec 10          	sub    $0x10,%rsp
  37:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
  3e:	00 00


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
