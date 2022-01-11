Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76F8C48A851
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jan 2022 08:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348496AbiAKHWD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jan 2022 02:22:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233066AbiAKHWC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Jan 2022 02:22:02 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF4C7C06173F
        for <linux-usb@vger.kernel.org>; Mon, 10 Jan 2022 23:22:02 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id v186so35348251ybg.1
        for <linux-usb@vger.kernel.org>; Mon, 10 Jan 2022 23:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=GNNorb3UHAVfnZb01JryII3o8TPsRC7crMjnQxK5XLY=;
        b=hOKif3Ey9H6/GEX6i8IUVkFqtM8/y4LzlIquckx8pmM/Rc+QvgnZhSXYaiauZMv625
         7wAxZ43bDUf36/SNr5OwEqzhlVA/v0NAnj70ZprJqNTshF/AWYRfEMdtLnmkucjMNb8X
         K4YjkI2pgCEU0gn4aUEDVn+URsqf2FzGwgDnlFpa1hoICV3ZIrhOZfo8QJiLGEC/9ooi
         UHBXc5X4324HqZKuhfrHgp5li8G8wYIYQmRf25hJktMvz2+TjbipliZsa6O4cC5NDnsM
         H7FqbOn/z0GSrjh+lM4oVc90L6TE9+pZg7ywvoNqr1NXVMStXxVJWN22dhdg4GeJbnNM
         PalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=GNNorb3UHAVfnZb01JryII3o8TPsRC7crMjnQxK5XLY=;
        b=MG+nG+ejrbgoJ7izJkJR4dp17M4IS5HC3n0Qqn5PR42fD4JIZf+TZKwHBWc9eNT1Y0
         3SO4slTuHlCpyrOjSbZTxoiT8tXRIR2zubj8Za7yhC8eKCZ34cdR5qHAJHayuxsfBjoA
         IrzC8oE/xfmLdpdOitIAg0zlCTZH8JaFQnmhw0nob/7KdcsBefdzE3FTwuW2u51AVybd
         0eNJHNKXb/CrO1tL4Yu2PX1gr0pVz1KvenNoQtxq2WxThXF5BmlHVio63E7EIkyhQoeB
         nz7EzEjszjJbdbIoBe+m8+l97zIIVROZ20hIYexXmce9MnU1hvH+GeVgoi0lwTWawSfZ
         JirA==
X-Gm-Message-State: AOAM531+n+sixevw497TFDLSm27NebvpxzUHQHsYtyWpHNqh+lcI3TDx
        wsIck7ToGLSPHJoqDaxSDkePmemr1KGo4wFxv1eeyfLgjL4Raxfq
X-Google-Smtp-Source: ABdhPJzM37sk2ItFC4Yf+hIJjCRz5DNvsqd+5ffRXe0IIwpXIBG9ibmS/n1VBgi6/XlqKXq9JR/U+SsZfJxce/zjbfQ=
X-Received: by 2002:a25:f04:: with SMTP id 4mr4298815ybp.50.1641885721939;
 Mon, 10 Jan 2022 23:22:01 -0800 (PST)
MIME-Version: 1.0
From:   cruise k <cruise4k@gmail.com>
Date:   Tue, 11 Jan 2022 15:21:50 +0800
Message-ID: <CAKcFiNBvtwdXH-hNRy34xVU55E6vjd2n212sPvrJdB+VW2GKzA@mail.gmail.com>
Subject: INFO: task hung in usbdev_release
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Geoffrey D. Bennett" <g@b4.vu>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Syzkaller found the following issue:

HEAD commit: 75acfdb Linux 5.16-rc8
git tree: upstream
console output: https://pastebin.com/raw/YNZPt1rA
kernel config: https://pastebin.com/raw/XsnKfdRt

And hope the report log can help you.

INFO: task syz-executor.0:19780 blocked for more than 143 seconds.
      Not tainted 5.16.0-rc8+ #10
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor.0  state:D stack:27920 pid:19780 ppid:  6935 flags:0x00000004
Call Trace:
 <TASK>
 __schedule+0xcd9/0x2550
 schedule+0xd2/0x260
 schedule_preempt_disabled+0xf/0x20
 __mutex_lock+0xc48/0x1610
 usbdev_release+0x83/0x4b0
 __fput+0x286/0x9f0
 task_work_run+0xe0/0x1a0
 exit_to_user_mode_prepare+0x28d/0x2a0
 syscall_exit_to_user_mode+0x19/0x60
 do_syscall_64+0x42/0xb0
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f1f192b314b
RSP: 002b:00007ffca3bbe190 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000004 RCX: 00007f1f192b314b
RDX: 0000001b2cb20000 RSI: 0000001b2cb27818 RDI: 0000000000000003
RBP: 00007f1f1942496c R08: 0000000000000000 R09: 00000000f369be85
R10: 0000000000000000 R11: 0000000000000293 R12: 000000000005e35a
R13: 00007ffca3bbe2d0 R14: 00007f1f19422f6c R15: 000000000005e0f1
 </TASK>

Showing all locks held in the system:
1 lock held by khungtaskd/60:
 #0: ffffffff8bb80ee0 (rcu_read_lock){....}-{1:2}, at:
debug_show_all_locks+0x53/0x260
1 lock held by systemd-journal/3113:
1 lock held by in:imklog/6746:
 #0: ffff88810a69bcf0 (&f->f_pos_lock){+.+.}-{3:3}, at: __fdget_pos+0xe9/0x100
5 locks held by kworker/0:6/15125:
 #0: ffff88801485d138 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at:
process_one_work+0x8c3/0x16a0
 #1: ffffc9000d6afdc8 ((work_completion)(&hub->events)){+.+.}-{0:0},
at: process_one_work+0x8f7/0x16a0
 #2: ffff888107470220 (&dev->mutex){....}-{3:3}, at: hub_event+0x1c1/0x4090
 #3: ffff8881074745c0 (&port_dev->status_lock){+.+.}-{3:3}, at:
hub_event+0x1b23/0x4090
 #4: ffff88801de53368 (hcd->address0_mutex){+.+.}-{3:3}, at:
hub_event+0x1b4c/0x4090
1 lock held by syz-executor.0/19780:
 #0: ffff888107470220 (&dev->mutex){....}-{3:3}, at: usbdev_release+0x83/0x4b0

=============================================

NMI backtrace for cpu 6
CPU: 6 PID: 60 Comm: khungtaskd Not tainted 5.16.0-rc8+ #10
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.13.0-1ubuntu1.1 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xcd/0x134
 nmi_cpu_backtrace.cold+0x47/0x144
 nmi_trigger_cpumask_backtrace+0x1a1/0x1e0
 watchdog+0xcc8/0x1010
 kthread+0x405/0x4f0
 ret_from_fork+0x1f/0x30
 </TASK>
Sending NMI from CPU 6 to CPUs 0-5,7:
NMI backtrace for cpu 3
CPU: 3 PID: 3113 Comm: systemd-journal Not tainted 5.16.0-rc8+ #10
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.13.0-1ubuntu1.1 04/01/2014
RIP: 0010:check_preemption_disabled+0xd/0x170
Code: c7 c7 20 32 b5 89 e8 a2 01 00 00 65 c7 05 e7 2b c2 76 00 00 00
00 e9 6b ff ff ff cc cc 41 56 41 55 49 89 f5 41 54 55 48 89 fd <53> 0f
1f 44 00 00 65 44 8b 25 0d f6 c0 76 65 8b 1d 7e 50 c1 76 81
RSP: 0018:ffffc9000133f9b0 EFLAGS: 00000046
RAX: 0000000000000007 RBX: ffffffff8d908dcc RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff89ac1180 RDI: ffffffff8a052060
RBP: ffffffff8a052060 R08: 0000000000000001 R09: fffffbfff1b20b33
R10: ffffffff8d905997 R11: fffffbfff1b20b32 R12: ffffffff8bb80ee0
R13: ffffffff89ac1180 R14: ffff88801da09cc0 R15: ffff88801e87d680
FS:  00007fbe7a3bf8c0(0000) GS:ffff888135c80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fbe778a8000 CR3: 000000001cb07000 CR4: 0000000000350ee0
Call Trace:
 <TASK>
 lock_release+0x159/0x670
 is_bpf_text_address+0x99/0x170
 kernel_text_address+0x39/0x80
 __kernel_text_address+0x9/0x30
 unwind_get_return_address+0x5a/0xa0
 arch_stack_walk+0x93/0xe0
 stack_trace_save+0x8c/0xc0
 kasan_save_stack+0x1e/0x50
 __kasan_record_aux_stack+0xf5/0x120
 call_rcu+0xb1/0x740
 task_work_run+0xe0/0x1a0
 exit_to_user_mode_prepare+0x28d/0x2a0
 syscall_exit_to_user_mode+0x19/0x60
 do_syscall_64+0x42/0xb0
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7fbe7994f840
Code: 73 01 c3 48 8b 0d 68 77 20 00 f7 d8 64 89 01 48 83 c8 ff c3 66
0f 1f 44 00 00 83 3d 89 bb 20 00 00 75 10 b8 02 00 00 00 0f 05 <48> 3d
01 f0 ff ff 73 31 c3 48 83 ec 08 e8 1e f6 ff ff 48 89 04 24
RSP: 002b:00007ffe94670958 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
RAX: fffffffffffffffe RBX: 00007ffe94670c60 RCX: 00007fbe7994f840
RDX: 00000000000001a0 RSI: 0000000000080042 RDI: 000055abb04f5640
RBP: 000000000000000d R08: 000000000000c0c1 R09: 00000000ffffffff
R10: 0000000000000069 R11: 0000000000000246 R12: 00000000ffffffff
R13: 000055abb04ea040 R14: 00007ffe94670c20 R15: 000055abb04f5460
 </TASK>
NMI backtrace for cpu 7 skipped: idling at default_idle+0xb/0x10
NMI backtrace for cpu 5 skipped: idling at default_idle+0xb/0x10
NMI backtrace for cpu 4 skipped: idling at default_idle+0xb/0x10
NMI backtrace for cpu 1 skipped: idling at default_idle+0xb/0x10
NMI backtrace for cpu 2 skipped: idling at default_idle+0xb/0x10
NMI backtrace for cpu 0
CPU: 0 PID: 96 Comm: kworker/u17:2 Not tainted 5.16.0-rc8+ #10
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.13.0-1ubuntu1.1 04/01/2014
Workqueue: events_unbound toggle_allocation_gate
RIP: 0010:__sanitizer_cov_trace_pc+0x0/0x40
Code: 20 8b 7e 81 e2 00 01 ff 00 75 10 65 48 8b 04 25 40 70 02 00 48
8b 80 58 15 00 00 c3 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 <65> 48
8b 0c 25 40 70 02 00 bf 02 00 00 00 48 89 ce 4c 8b 04 24 e8
RSP: 0018:ffffc9000123fa08 EFLAGS: 00000202
RAX: 0000000000000000 RBX: ffff888063ebfca0 RCX: ffffffff816be2df
RDX: 0000000000000000 RSI: ffff888014a69cc0 RDI: 0000000000000003
RBP: 0000000000000003 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000005 R11: fffffbfff1fee328 R12: ffffed100c7d7f95
R13: 0000000000000002 R14: ffff888063ebfca8 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff888063e00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000c0004ea0b0 CR3: 000000000b88e000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 smp_call_function_many_cond+0x3d9/0xc20
 on_each_cpu_cond_mask+0x56/0xa0
 text_poke_bp_batch+0x355/0x560
 text_poke_finish+0x16/0x30
 arch_jump_label_transform_apply+0x13/0x20
 jump_label_update+0x332/0x410
 static_key_enable_cpuslocked+0x1b1/0x260
 static_key_enable+0x16/0x20
 toggle_allocation_gate+0x100/0x390
 process_one_work+0x9df/0x16a0
 worker_thread+0x90/0xe20
 kthread+0x405/0x4f0
 ret_from_fork+0x1f/0x30
 </TASK>
----------------
Code disassembly (best guess):
   0: c7 c7 20 32 b5 89    mov    $0x89b53220,%edi
   6: e8 a2 01 00 00        callq  0x1ad
   b: 65 c7 05 e7 2b c2 76 movl   $0x0,%gs:0x76c22be7(%rip)        # 0x76c22bfd
  12: 00 00 00 00
  16: e9 6b ff ff ff        jmpq   0xffffff86
  1b: cc                    int3
  1c: cc                    int3
  1d: 41 56                push   %r14
  1f: 41 55                push   %r13
  21: 49 89 f5              mov    %rsi,%r13
  24: 41 54                push   %r12
  26: 55                    push   %rbp
  27: 48 89 fd              mov    %rdi,%rbp
* 2a: 53                    push   %rbx <-- trapping instruction
  2b: 0f 1f 44 00 00        nopl   0x0(%rax,%rax,1)
  30: 65 44 8b 25 0d f6 c0 mov    %gs:0x76c0f60d(%rip),%r12d        # 0x76c0f645
  37: 76
  38: 65 8b 1d 7e 50 c1 76 mov    %gs:0x76c1507e(%rip),%ebx        # 0x76c150bd
  3f: 81                    .byte 0x81
