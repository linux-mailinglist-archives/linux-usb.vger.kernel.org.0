Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06BF547F1D1
	for <lists+linux-usb@lfdr.de>; Sat, 25 Dec 2021 05:21:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbhLYEVJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Dec 2021 23:21:09 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:35824 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbhLYEVJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Dec 2021 23:21:09 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DD6A1B82393
        for <linux-usb@vger.kernel.org>; Sat, 25 Dec 2021 04:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90B93C36AE9
        for <linux-usb@vger.kernel.org>; Sat, 25 Dec 2021 04:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640406066;
        bh=SNOpK/K55O1n0oLeoIRC0n97cQWg77bPZvfJCNh25oI=;
        h=From:To:Subject:Date:From;
        b=hU6FIc+nTA9i3OjNJvgD+MtKm5BEYTe5VBKAy0fln3/Cz1Yc+Rh4uDgnKFaphfoze
         S+ddpA1lhBP9KdLnqfPNOq4nwU0POH0Pc807ZBwplcwhsMw1zKTC9CzHc9ho+n63v6
         pwyD032mlAUZa6Qg+3HGy9epeZySUCEUpZYSSSCSgKRhgSgQdmRVFtDdSqYd/g4ojl
         Gw87p3uFklx5qvFn+sfaUGpn7qbs23W+KqAEch9mYmHgq0Y37D3smSQxdBw0nyjRf8
         ke3F59JEp9zJ/dmYY1RlaMG91Fp+yu4vAYKnkKfnh4QvYB1Lk8ViUPRxRJL++WlGaJ
         0iLFtAYelHAxw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 60FAC60F9E; Sat, 25 Dec 2021 04:21:06 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215405] New: use-after-free Read in ath9k_hif_usb_rx_cb' bug
Date:   Sat, 25 Dec 2021 04:21:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: 6201613047@stu.jiangnan.edu.cn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215405-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215405

            Bug ID: 215405
           Summary: use-after-free Read in ath9k_hif_usb_rx_cb' bug
           Product: Drivers
           Version: 2.5
    Kernel Version: linux-5.16-rc6
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: 6201613047@stu.jiangnan.edu.cn
        Regression: No

Created attachment 300141
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300141&action=3Dedit
poc.c

I've using Syzkaller-USB get a use-after-free BUG on the USB drivers. And t=
he
the report is as follow.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: use-after-free in ath9k_hif_usb_rx_stream
drivers/net/wireless/ath/ath9k/hif_usb.c:636 [inline]
BUG: KASAN: use-after-free in ath9k_hif_usb_rx_cb+0xeca/0x1160
drivers/net/wireless/ath/ath9k/hif_usb.c:680
Read of size 4 at addr ffff88810d524278 by task swapper/0/0

CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.16.0-rc6 #3
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1=
.1
04/01/2014
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_address_description.constprop.0.cold+0x93/0x347 mm/kasan/report.c:247
 __kasan_report mm/kasan/report.c:433 [inline]
 kasan_report.cold+0x83/0xdf mm/kasan/report.c:450
 ath9k_hif_usb_rx_stream drivers/net/wireless/ath/ath9k/hif_usb.c:636 [inli=
ne]
 ath9k_hif_usb_rx_cb+0xeca/0x1160 drivers/net/wireless/ath/ath9k/hif_usb.c:=
680
 __usb_hcd_giveback_urb+0x2c2/0x5a0 drivers/usb/core/hcd.c:1656
 usb_hcd_giveback_urb+0x367/0x410 drivers/usb/core/hcd.c:1726
 dummy_timer+0x1267/0x33b0 drivers/usb/gadget/udc/dummy_hcd.c:1987
 call_timer_fn+0x1a5/0x6b0 kernel/time/timer.c:1421
 expire_timers kernel/time/timer.c:1466 [inline]
 __run_timers.part.0+0x6b0/0xa90 kernel/time/timer.c:1734
 __run_timers kernel/time/timer.c:1715 [inline]
 run_timer_softirq+0xb6/0x1d0 kernel/time/timer.c:1747
 __do_softirq+0x1c0/0x8ee kernel/softirq.c:558
 invoke_softirq kernel/softirq.c:432 [inline]
 __irq_exit_rcu kernel/softirq.c:637 [inline]
 irq_exit_rcu+0xe2/0x120 kernel/softirq.c:649
 sysvec_apic_timer_interrupt+0x8e/0xc0 arch/x86/kernel/apic/apic.c:1097
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x12/0x20 arch/x86/include/asm/idtentry.h:=
638
RIP: 0010:default_idle+0xb/0x10 arch/x86/kernel/process.c:734
Code: bf fe ff 4c 89 e2 48 89 ef 5d 41 5c 31 f6 e9 ac 12 7a fc cc cc cc cc =
cc
cc cc cc cc cc cc cc eb 07 0f 00 2d 77 44 5a 00 fb f4 <c3> 0f 1f 40 00 41 5=
4 be
08 00 00 00 53 65 48 8b 1c 25 80 6f 02 00
RSP: 0018:ffffffff87607e28 EFLAGS: 00000206
RAX: 0000000000022311 RBX: 0000000000000000 RCX: ffffffff85c676b2
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000001 R09: ffffed10235070eb
R10: ffff88811a838753 R11: ffffed10235070ea R12: 0000000000000000
R13: 0000000000000000 R14: ffffffff88b50150 R15: 0000000000000000
 default_idle_call+0xc4/0x420 kernel/sched/idle.c:112
 cpuidle_idle_call kernel/sched/idle.c:194 [inline]
 do_idle+0x3f9/0x570 kernel/sched/idle.c:306
 cpu_startup_entry+0x14/0x20 kernel/sched/idle.c:403
 start_kernel+0x47a/0x49b init/main.c:1135
 secondary_startup_64_no_verify+0xb0/0xbb
 </TASK>

The buggy address belongs to the page:
page:ffffea0004354900 refcount:0 mapcount:0 mapping:0000000000000000 index:=
0x0
pfn:0x10d524
flags: 0x200000000000000(node=3D0|zone=3D2)
raw: 0200000000000000 0000000000000000 ffffea0004354908 0000000000000000
raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as freed
page last allocated via order 3, migratetype Unmovable, gfp_mask
0x40dc0(GFP_KERNEL|__GFP_COMP|__GFP_ZERO), pid 268, ts 48372046740, free_ts
49398863548
 set_page_owner include/linux/page_owner.h:31 [inline]
 post_alloc_hook mm/page_alloc.c:2412 [inline]
 prep_new_page+0x1a6/0x240 mm/page_alloc.c:2418
 get_page_from_freelist+0x1612/0x28c0 mm/page_alloc.c:4149
 __alloc_pages+0x2d5/0x6c0 mm/page_alloc.c:5369
 alloc_pages+0x115/0x240 mm/mempolicy.c:2191
 kmalloc_order+0x34/0xf0 mm/slab_common.c:949
 kmalloc_order_trace+0x14/0x120 mm/slab_common.c:965
 kmalloc_large include/linux/slab.h:519 [inline]
 __kmalloc+0x316/0x3a0 mm/slub.c:4412
 kmalloc include/linux/slab.h:595 [inline]
 kzalloc include/linux/slab.h:724 [inline]
 wiphy_new_nm+0x6f0/0x1e40 net/wireless/core.c:449
 ieee80211_alloc_hw_nm+0x38b/0x2280 net/mac80211/main.c:585
 ieee80211_alloc_hw include/net/mac80211.h:4315 [inline]
 ath9k_htc_probe_device+0x97/0x1f40
drivers/net/wireless/ath/ath9k/htc_drv_init.c:939
 ath9k_htc_hw_init+0x31/0x60 drivers/net/wireless/ath/ath9k/htc_hst.c:503
 ath9k_hif_usb_firmware_cb+0x274/0x510
drivers/net/wireless/ath/ath9k/hif_usb.c:1239
 request_firmware_work_func+0x12c/0x230
drivers/base/firmware_loader/main.c:1022
 process_one_work+0x9df/0x16d0 kernel/workqueue.c:2298
 worker_thread+0x90/0xed0 kernel/workqueue.c:2445
 kthread+0x40b/0x500 kernel/kthread.c:327
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1338 [inline]
 free_pcp_prepare+0x447/0x8c0 mm/page_alloc.c:1389
 free_unref_page_prepare mm/page_alloc.c:3309 [inline]
 free_unref_page+0x19/0x4a0 mm/page_alloc.c:3388
 free_nonslab_page mm/slub.c:3551 [inline]
 kfree+0x387/0x470 mm/slub.c:4558
 device_release+0x9f/0x240 drivers/base/core.c:2230
 kobject_cleanup lib/kobject.c:705 [inline]
 kobject_release lib/kobject.c:736 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1c8/0x530 lib/kobject.c:753
 put_device+0x1b/0x30 drivers/base/core.c:3501
 ath9k_htc_probe_device+0x1c7/0x1f40
drivers/net/wireless/ath/ath9k/htc_drv_init.c:976
 ath9k_htc_hw_init+0x31/0x60 drivers/net/wireless/ath/ath9k/htc_hst.c:503
 ath9k_hif_usb_firmware_cb+0x274/0x510
drivers/net/wireless/ath/ath9k/hif_usb.c:1239
 request_firmware_work_func+0x12c/0x230
drivers/base/firmware_loader/main.c:1022
 process_one_work+0x9df/0x16d0 kernel/workqueue.c:2298
 worker_thread+0x90/0xed0 kernel/workqueue.c:2445
 kthread+0x40b/0x500 kernel/kthread.c:327
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

Memory state around the buggy address:
 ffff88810d524100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff88810d524180: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>ffff88810d524200: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                                                                ^
 ffff88810d524280: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff88810d524300: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
----------------
Code disassembly (best guess):
   0:   bf fe ff 4c 89          mov    $0x894cfffe,%edi
   5:   e2 48                   loop   0x4f
   7:   89 ef                   mov    %ebp,%edi
   9:   5d                      pop    %rbp
   a:   41 5c                   pop    %r12
   c:   31 f6                   xor    %esi,%esi
   e:   e9 ac 12 7a fc          jmpq   0xfc7a12bf
  13:   cc                      int3
  14:   cc                      int3
  15:   cc                      int3
  16:   cc                      int3
  17:   cc                      int3
  18:   cc                      int3
  19:   cc                      int3
  1a:   cc                      int3
  1b:   cc                      int3
  1c:   cc                      int3
  1d:   cc                      int3
  1e:   cc                      int3
  1f:   eb 07                   jmp    0x28
  21:   0f 00 2d 77 44 5a 00    verw   0x5a4477(%rip)        # 0x5a449f
  28:   fb                      sti
  29:   f4                      hlt
* 2a:   c3                      retq <-- trapping instruction
  2b:   0f 1f 40 00             nopl   0x0(%rax)
  2f:   41 54                   push   %r12
  31:   be 08 00 00 00          mov    $0x8,%esi
  36:   53                      push   %rbx
  37:   65 48 8b 1c 25 80 6f    mov    %gs:0x26f80,%rbx
  3e:   02 00

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
