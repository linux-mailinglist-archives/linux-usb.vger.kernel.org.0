Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02B19363C73
	for <lists+linux-usb@lfdr.de>; Mon, 19 Apr 2021 09:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233438AbhDSH1t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Apr 2021 03:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbhDSH1q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Apr 2021 03:27:46 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B951C06174A
        for <linux-usb@vger.kernel.org>; Mon, 19 Apr 2021 00:27:16 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id 30so16420509qva.9
        for <linux-usb@vger.kernel.org>; Mon, 19 Apr 2021 00:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=in1fl7JgVJs8RxW7lhPIOC62QhzWHD/OA2X7ksEE5pI=;
        b=euF8xFOAWoOUq8w3Qqyvnq0eguiRdluflGzcVRZQJN2Kxpir3vA7zVyGYR6IU3elcN
         mxs8z1E4pJwMQVNFwO3E1T1iHJOe2JrmHF0I84vPK/1rkf1bk0gJLpFTXr7KntFoi+eT
         uwO0u1vMJ03sdyNIoby+QyDkIM0QrdsBheioM3aUSxgqTzniR5LqBIcaojnaaCdGvlP9
         6txJDO5Q1feNsId4/koRZRtQ4ZRQI2kuoE4zDn4xU+hN1XxCpZD6r3doIx0/KizeHu/a
         qU428eSqVYFExgFfmCAUtQUfN2fcrotZWrDVSO8P+PKC+cZyN2dUHPz7FcBaKgPxBepS
         JDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=in1fl7JgVJs8RxW7lhPIOC62QhzWHD/OA2X7ksEE5pI=;
        b=NKf/qmO8A6WUh7k7X+o8ZU7PGPbAGZUgyqmIWvWGOTaU+3W/2d3byl1QZXdXM9uSLv
         Nxsc3fF5btlVjr2CWvXXUnruS7Y2/wsMjo4DZC8t3N+2b4KvoC0E1oZ2+/gJrpPLZe8A
         BWseXKRxXzRdGG7LOEAbLY/4L+Ve8effpQitfGcgW4nenVK25C7os2gJTTBthpvB7c3C
         hSCuubhLjUF5OFH5Yas9VJuo9Nd4VpxJ7DFIekIIZt0erBvuuoPDIgNQ8jL8jZ3ZsXeb
         dvYmoRPbXCBaFKGFLBwqhhNGNnbeHFia4Dhr7PhtqC8bTzDVpDznLyLlw/cKhFxE76p+
         EpoQ==
X-Gm-Message-State: AOAM532ofqXYl8vlTWXel2+qTkxvYd6hK8n7HZJ6Kvk9LNN0PZYnV0vt
        Awp8BwkcWfS/gil7wM4kfw4nsCmbx0EQjeZn4Iwr+A==
X-Google-Smtp-Source: ABdhPJy39cbUpyW+WeDpxKHTg1ukUnaGfmuJvhBWubRr1ulucgMzy4RSDj6rZJaHQzUwOmtdgCZzetc9M3YSOxEWeR4=
X-Received: by 2002:ad4:4312:: with SMTP id c18mr19736122qvs.44.1618817235013;
 Mon, 19 Apr 2021 00:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000a9b79905c04e25a0@google.com>
In-Reply-To: <000000000000a9b79905c04e25a0@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 19 Apr 2021 09:27:03 +0200
Message-ID: <CACT4Y+aF64oNZD7Vd04bj+KfBU5GqVobCbRPp2-x_Z6dEr8d3A@mail.gmail.com>
Subject: Re: [syzbot] INFO: rcu detected stall in tx
To:     syzbot <syzbot+e2eae5639e7203360018@syzkaller.appspotmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        guido.kiener@rohde-schwarz.com, dpenkler@gmail.com,
        lee.jones@linaro.org, USB list <linux-usb@vger.kernel.org>
Cc:     bp@alien8.de, dwmw@amazon.co.uk, hpa@zytor.com,
        linux-kernel@vger.kernel.org, luto@kernel.org, mingo@redhat.com,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 19, 2021 at 9:19 AM syzbot
<syzbot+e2eae5639e7203360018@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    50987bec Merge tag 'trace-v5.12-rc7' of git://git.kernel.o..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1065c5fcd00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=398c4d0fe6f66e68
> dashboard link: https://syzkaller.appspot.com/bug?extid=e2eae5639e7203360018
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+e2eae5639e7203360018@syzkaller.appspotmail.com
>
> usbtmc 5-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 5-1:0.0: unknown status received: -71

The log shows an infinite stream of these before the stall, so I
assume it's an infinite loop in usbtmc.
+usbtmc maintainers

[  370.171634][    C0] usbtmc 6-1:0.0: unknown status received: -71
[  370.177799][    C1] usbtmc 3-1:0.0: unknown status received: -71
[  370.183912][    C0] usbtmc 4-1:0.0: unknown status received: -71
[  370.190076][    C1] usbtmc 5-1:0.0: unknown status received: -71
[  370.196194][    C0] usbtmc 2-1:0.0: unknown status received: -71
[  370.202387][    C1] usbtmc 3-1:0.0: unknown status received: -71
[  370.208460][    C0] usbtmc 6-1:0.0: unknown status received: -71
[  370.214615][    C1] usbtmc 5-1:0.0: unknown status received: -71
[  370.220736][    C0] usbtmc 4-1:0.0: unknown status received: -71
[  370.226902][    C1] usbtmc 3-1:0.0: unknown status received: -71
[  370.233005][    C0] usbtmc 2-1:0.0: unknown status received: -71
[  370.239168][    C1] usbtmc 5-1:0.0: unknown status received: -71
[  370.245271][    C0] usbtmc 6-1:0.0: unknown status received: -71
[  370.251426][    C1] usbtmc 3-1:0.0: unknown status received: -71
[  370.257552][    C0] usbtmc 4-1:0.0: unknown status received: -71
[  370.263715][    C1] usbtmc 5-1:0.0: unknown status received: -71
[  370.269819][    C0] usbtmc 2-1:0.0: unknown status received: -71
[  370.275974][    C1] usbtmc 3-1:0.0: unknown status received: -71
[  370.282100][    C0] usbtmc 6-1:0.0: unknown status received: -71
[  370.288262][    C1] usbtmc 5-1:0.0: unknown status received: -71
[  370.294399][    C0] usbtmc 4-1:0.0: unknown status received: -71



> rcu: INFO: rcu_preempt self-detected stall on CPU
> rcu:    1-...!: (8580 ticks this GP) idle=72e/1/0x4000000000000000 softirq=20679/20679 fqs=0
>         (t=10500 jiffies g=27129 q=416)
> rcu: rcu_preempt kthread starved for 10500 jiffies! g27129 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=0
> rcu:    Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
> rcu: RCU grace-period kthread stack dump:
> task:rcu_preempt     state:R  running task     stack:29168 pid:   14 ppid:     2 flags:0x00004000
> Call Trace:
>  context_switch kernel/sched/core.c:4322 [inline]
>  __schedule+0x911/0x21b0 kernel/sched/core.c:5073
>  schedule+0xcf/0x270 kernel/sched/core.c:5152
>  schedule_timeout+0x14a/0x250 kernel/time/timer.c:1892
>  rcu_gp_fqs_loop kernel/rcu/tree.c:2005 [inline]
>  rcu_gp_kthread+0xd07/0x2250 kernel/rcu/tree.c:2178
>  kthread+0x3b1/0x4a0 kernel/kthread.c:292
>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
> rcu: Stack dump where RCU GP kthread last ran:
> Sending NMI from CPU 1 to CPUs 0:
> NMI backtrace for cpu 0
> CPU: 0 PID: 3232 Comm: aoe_tx0 Not tainted 5.12.0-rc7-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> RIP: 0010:native_apic_mem_write+0x8/0x10 arch/x86/include/asm/apic.h:110
> Code: c7 40 d9 36 8f e8 c8 11 86 00 eb b0 66 0f 1f 44 00 00 be 01 00 00 00 e9 36 c7 2c 00 cc cc cc cc cc cc 89 ff 89 b7 00 c0 5f ff <c3> 0f 1f 80 00 00 00 00 48 b8 00 00 00 00 00 fc ff df 53 89 fb 48
> RSP: 0018:ffffc90000007ea8 EFLAGS: 00000046
> RAX: dffffc0000000000 RBX: ffffffff8b0a78c0 RCX: 0000000000000020
> RDX: 1ffffffff1614f1a RSI: 000000000001c285 RDI: 0000000000000380
> RBP: ffff8880b9c1f2c0 R08: 000000000000003f R09: 0000000000000000
> R10: ffffffff8166ecf7 R11: 0000000000000000 R12: 000000000001c285
> R13: 0000000000000020 R14: ffff8880b9c26340 R15: 0000006120792e26
> FS:  0000000000000000(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fb9e6cdb380 CR3: 0000000018792000 CR4: 00000000001506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <IRQ>
>  apic_write arch/x86/include/asm/apic.h:393 [inline]
>  lapic_next_event+0x4d/0x80 arch/x86/kernel/apic/apic.c:472
>  clockevents_program_event+0x254/0x370 kernel/time/clockevents.c:334
>  tick_program_event+0xac/0x140 kernel/time/tick-oneshot.c:44
>  hrtimer_interrupt+0x414/0xa00 kernel/time/hrtimer.c:1676
>  local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1089 [inline]
>  __sysvec_apic_timer_interrupt+0x146/0x540 arch/x86/kernel/apic/apic.c:1106
>  sysvec_apic_timer_interrupt+0x8e/0xc0 arch/x86/kernel/apic/apic.c:1100
>  </IRQ>
>  asm_sysvec_apic_timer_interrupt+0x12/0x20 arch/x86/include/asm/idtentry.h:632
> RIP: 0010:preempt_count arch/x86/include/asm/preempt.h:27 [inline]
> RIP: 0010:check_kcov_mode kernel/kcov.c:163 [inline]
> RIP: 0010:__sanitizer_cov_trace_pc+0x0/0x60 kernel/kcov.c:197
> Code: f0 4d 89 03 e9 f2 fc ff ff b9 ff ff ff ff ba 08 00 00 00 4d 8b 03 48 0f bd ca 49 8b 45 00 48 63 c9 e9 64 ff ff ff 0f 1f 40 00 <65> 8b 05 39 fe 8d 7e 89 c1 48 8b 34 24 81 e1 00 01 00 00 65 48 8b
> RSP: 0018:ffffc900030cf6f8 EFLAGS: 00000293
> RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
> RDX: ffff88801aff1c40 RSI: ffffffff815c2e4f RDI: 0000000000000003
> RBP: ffffc900030cf738 R08: 0000000000000000 R09: ffffffff8fa9a96f
> R10: ffffffff815c2e45 R11: 0000000000000000 R12: 000000000000002d
> R13: ffff8880113db880 R14: 0000000000000000 R15: 0000000000000200
>  console_trylock_spinning kernel/printk/printk.c:1818 [inline]
>  vprintk_emit+0x3a5/0x560 kernel/printk/printk.c:2097
>  dev_vprintk_emit+0x36e/0x3b2 drivers/base/core.c:4434
>  dev_printk_emit+0xba/0xf1 drivers/base/core.c:4445
>  __netdev_printk+0x1c6/0x27a net/core/dev.c:11292
>  netdev_warn+0xd7/0x109 net/core/dev.c:11345
>  ieee802154_subif_start_xmit.cold+0x17/0x27 net/mac802154/tx.c:125
>  __netdev_start_xmit include/linux/netdevice.h:4825 [inline]
>  netdev_start_xmit include/linux/netdevice.h:4839 [inline]
>  xmit_one net/core/dev.c:3605 [inline]
>  dev_hard_start_xmit+0x1eb/0x920 net/core/dev.c:3621
>  sch_direct_xmit+0x2e1/0xbd0 net/sched/sch_generic.c:313
>  qdisc_restart net/sched/sch_generic.c:376 [inline]
>  __qdisc_run+0x4ba/0x15f0 net/sched/sch_generic.c:384
>  qdisc_run include/net/pkt_sched.h:136 [inline]
>  qdisc_run include/net/pkt_sched.h:128 [inline]
>  __dev_xmit_skb net/core/dev.c:3807 [inline]
>  __dev_queue_xmit+0x14b9/0x2e00 net/core/dev.c:4162
>  tx+0x68/0xb0 drivers/block/aoe/aoenet.c:63
>  kthread+0x1e7/0x3a0 drivers/block/aoe/aoecmd.c:1230
>  kthread+0x3b1/0x4a0 kernel/kthread.c:292
>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
> NMI backtrace for cpu 1
> CPU: 1 PID: 37 Comm: kworker/1:1 Not tainted 5.12.0-rc7-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Workqueue: events nsim_dev_trap_report_work
> Call Trace:
>  <IRQ>
>  __dump_stack lib/dump_stack.c:79 [inline]
>  dump_stack+0x141/0x1d7 lib/dump_stack.c:120
>  nmi_cpu_backtrace.cold+0x44/0xd7 lib/nmi_backtrace.c:105
>  nmi_trigger_cpumask_backtrace+0x1b3/0x230 lib/nmi_backtrace.c:62
>  trigger_single_cpu_backtrace include/linux/nmi.h:164 [inline]
>  rcu_dump_cpu_stacks+0x222/0x2a7 kernel/rcu/tree_stall.h:341
>  print_cpu_stall kernel/rcu/tree_stall.h:622 [inline]
>  check_cpu_stall kernel/rcu/tree_stall.h:697 [inline]
>  rcu_pending kernel/rcu/tree.c:3830 [inline]
>  rcu_sched_clock_irq.cold+0x4f7/0x11dd kernel/rcu/tree.c:2650
>  update_process_times+0x16d/0x200 kernel/time/timer.c:1796
>  tick_sched_handle+0x9b/0x180 kernel/time/tick-sched.c:226
>  tick_sched_timer+0x1b0/0x2d0 kernel/time/tick-sched.c:1369
>  __run_hrtimer kernel/time/hrtimer.c:1537 [inline]
>  __hrtimer_run_queues+0x1c0/0xe40 kernel/time/hrtimer.c:1601
>  hrtimer_interrupt+0x330/0xa00 kernel/time/hrtimer.c:1663
>  local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1089 [inline]
>  __sysvec_apic_timer_interrupt+0x146/0x540 arch/x86/kernel/apic/apic.c:1106
>  sysvec_apic_timer_interrupt+0x40/0xc0 arch/x86/kernel/apic/apic.c:1100
>  asm_sysvec_apic_timer_interrupt+0x12/0x20 arch/x86/include/asm/idtentry.h:632
> RIP: 0010:__raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:161 [inline]
> RIP: 0010:_raw_spin_unlock_irqrestore+0x38/0x70 kernel/locking/spinlock.c:191
> Code: 74 24 10 e8 ba 19 54 f8 48 89 ef e8 f2 cf 54 f8 81 e3 00 02 00 00 75 25 9c 58 f6 c4 02 75 2d 48 85 db 74 01 fb bf 01 00 00 00 <e8> d3 9d 48 f8 65 8b 05 7c 68 fc 76 85 c0 74 0a 5b 5d c3 e8 40 59
> RSP: 0018:ffffc90000dc0b28 EFLAGS: 00000206
> RAX: 0000000000000002 RBX: 0000000000000200 RCX: 1ffffffff1f5f34a
> RDX: 0000000000000000 RSI: 0000000000000103 RDI: 0000000000000001
> RBP: ffff888144fa8000 R08: 0000000000000001 R09: ffffffff8fa9a99f
> R10: 0000000000000001 R11: ffffc90013880000 R12: ffff888145047440
> R13: ffff88801ee8e500 R14: dffffc0000000000 R15: ffff888011f69c00
>  spin_unlock_irqrestore include/linux/spinlock.h:409 [inline]
>  dummy_timer+0x12f1/0x32a0 drivers/usb/gadget/udc/dummy_hcd.c:1985
>  call_timer_fn+0x1a5/0x6b0 kernel/time/timer.c:1431
>  expire_timers kernel/time/timer.c:1476 [inline]
>  __run_timers.part.0+0x67c/0xa50 kernel/time/timer.c:1745
>  __run_timers kernel/time/timer.c:1726 [inline]
>  run_timer_softirq+0xb3/0x1d0 kernel/time/timer.c:1758
>  __do_softirq+0x29b/0x9f6 kernel/softirq.c:345
>  do_softirq.part.0+0xd9/0x130 kernel/softirq.c:248
>  </IRQ>
>  do_softirq kernel/softirq.c:240 [inline]
>  __local_bh_enable_ip+0x102/0x120 kernel/softirq.c:198
>  spin_unlock_bh include/linux/spinlock.h:399 [inline]
>  nsim_dev_trap_report drivers/net/netdevsim/dev.c:585 [inline]
>  nsim_dev_trap_report_work+0x867/0xbd0 drivers/net/netdevsim/dev.c:611
>  process_one_work+0x98d/0x1600 kernel/workqueue.c:2275
>  worker_thread+0x64c/0x1120 kernel/workqueue.c:2421
>  kthread+0x3b1/0x4a0 kernel/kthread.c:292
>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 5-1:0.0: unknown status received: -71
> usbtmc 5-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 5-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 5-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 2-1:0.0: unknown status received: -71
> usbtmc 4-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: unknown status received: -71
> usbtmc 3-1:0.0: usb_submit_urb failed: -19
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: unknown status received: -71
> usbtmc 6-1:0.0: usb_submit_urb failed: -19
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/000000000000a9b79905c04e25a0%40google.com.
