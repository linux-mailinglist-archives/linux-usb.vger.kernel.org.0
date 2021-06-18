Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C01143AC507
	for <lists+linux-usb@lfdr.de>; Fri, 18 Jun 2021 09:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbhFRHdd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Jun 2021 03:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbhFRHdc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Jun 2021 03:33:32 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6301EC061574
        for <linux-usb@vger.kernel.org>; Fri, 18 Jun 2021 00:31:22 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id a127so7013948pfa.10
        for <linux-usb@vger.kernel.org>; Fri, 18 Jun 2021 00:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1pP+H70Dq1X9ay/m1hbTX9i5Aw5Xs29X/WCgvIeYL5A=;
        b=pAeBdJ95wkmN/4tOwS7PwoHK9Sh3CBJtF4wAYVX+iBZy7X1rIfyESsvehAEU9vJO+x
         OOCXX12XqavrZ262OlNNq0gp6hJjyrACOpirsSS3ZXjoQ01n8/1xjdTyMIuMuct7EwVt
         WtrPb3bk6PH4GsCyU8Q3AL0d+vOjwoyBJA4shD/CQSd2ZZdroeqa4LU6DhJE//NIYyIF
         jFnqfIp/GEAbT3HTH/DHvw/3PuUGtPwjQwMUA+DYJIs1INq0ERfhRw8JfZr+Tvg6LNGm
         yYZ2FHNmazh9ibB5NOwEsxMv8sDWelkDzd7+lRMXMGmChuqAudgWpdLt5Xwuk4qlroAl
         4xPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1pP+H70Dq1X9ay/m1hbTX9i5Aw5Xs29X/WCgvIeYL5A=;
        b=BRiJN7qbCK68Kd+u+IhCkv4kU8OjZiFgFQaNzRP46XvTES2CI19b1mu0UedGkxvH/X
         bzlbCDgrEcyK532IvpUVmAayEp45BTsLZH6QIQxrh8YI73pFry9YWSnKvuZYwTIZp9aq
         jNpO0vydUBF4HFOfrhdvdXO5cjG7aBt3mekftgWrZjrIOzWvfgaLZjw4cvL+QTUGFg8N
         IolKzkuFVTqu5LkRnKCg7lZBeenq5aF3oXdXXUyWn5Duln/6SLPdrq4E8wpsOzuii12o
         JBnGUCrxUq23CI3uCtng5svPntKIIEcU4FgQhOaW3nPehzq4KniN47h7qzFeCptDdAbY
         rpog==
X-Gm-Message-State: AOAM533jXdwQ6Ps7PHnuhOyxHuKMaw7K0DgcwFlGnA7IUYGC1u3pZcmU
        uV2FfeoUm/aKKTDqT5XOs3JUxHb26GhWbQg58uc=
X-Google-Smtp-Source: ABdhPJxrlN49lKfeD6IJK9bsinXGy3ONB1KXC+wcP6zYQILNn61HpLKjWp0zChK+I1BA78FH/csb9CQeVKCZkoO5ViM=
X-Received: by 2002:a62:e404:0:b029:2ee:f086:726f with SMTP id
 r4-20020a62e4040000b02902eef086726fmr3886835pfh.7.1624001481783; Fri, 18 Jun
 2021 00:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Vc3RZSZaOD_DOd3nkm4MWHu_O8Kwibn18rXYQw2jWo4tg@mail.gmail.com>
 <a60abd4c-6b20-4b62-6d19-49cc19431321@gmail.com>
In-Reply-To: <a60abd4c-6b20-4b62-6d19-49cc19431321@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 18 Jun 2021 10:31:05 +0300
Message-ID: <CAHp75VfY5VRJuX0rhGBrLKu79dvL_qFqgO3EP6P=JATWYdjqcQ@mail.gmail.com>
Subject: Re: RCU stall and/or host->device broken transition
To:     Ferry Toth <fntoth@gmail.com>
Cc:     USB <linux-usb@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Jack Pham <jackp@codeaurora.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 18, 2021 at 10:15 AM Ferry Toth <fntoth@gmail.com> wrote:
> Op 16-06-2021 om 20:37 schreef Andy Shevchenko:

> > There is a bug somewhere and I have already spent too much time
> > whacking the mole. Need some hints, ideas on how to debug, etc.
> >
> > So, my setup is that:
> > platform: Intel Merrifield
> > USB host and device controller: DWC3
> > USB host connected device: Diolan DLN-2 IO expander
> > In device mode: USB EEM
>
> I'd like to try to reproduce, but don't have the Diolan DLN-2. Is that
> essential to generating the stall? What if you just plug a USB stick?

It would be actually nice to have a reproducer on the other hardware,
this will eliminate one thing from the equation.

> > The workflow
> > ~~~~~~~~~~
> > The following steps to reproduce the issue (with some patches applied
> > / reverted it may give different results from less than 10% up to
> > almost 100% of reproducibility):
> >
> > (Note the board has a manual switch of an ID pin and two connectors
> > depending on the role)
> > 1. Connect the DLN-2 to USB A
> > 2. Connect the PC machine to USB micro-B
> > 3. Boot the board in device mode
>
> I've tested by booting in host mostly, so may have missed this case. Did
> you find it is essential to boot in device mode to generate the stall?

No idea, I haven't tried the other way around.

> > 4. Setup USB EEM gadget via ConfigFS
> > 5. Turn the switch (see above note) to the host and back to the device
> > mode as many times (usually a very few are needed) and with
> > (semi-)arbitrary time in between (usually 2-5 seconds) till the issue
> > occurs.
>
> 2 sec is a bit faster then I tested. Reason is that in user space in my
> case connman needs a bit of time to actually establish an ethernet
> connection to the PC. Are you using connman or other network manager?

Nope, I have a pure shell by Busybox.

> On the PC side I have network manager providing a shared connection and
> when all is well I see on the PC side a notification of the connection
> being established. Do you have something similar?

On the PC side I have NetworkManager, but it shouldn't matter, because
I have set up the connection manually on the host side and by default
it doesn't establish it automatically.

> > The issue
> > ~~~~~~~~
> > When switching from the host to the gadget mode
> > - the status LED on the DLN-2 board continues blinking (Vbus is on)
>
> This looks like something I had before. Can you try switching very fast
> host-gadget-host-gadget ( like in a 1 sec.)?

IIRC I have tried this and have found no correlation between frequency
of switching and failure rate. But I can try again. (Currently I have
switched to another  task, so it might be delayed)

> > - the driver may be still xhci (rarely), but often already switched to
> > dwc3
> > - due to above `lsusb` (rarely) still shows hub devices
> > - the EEM does not appear (PC doesn't see network iface)
> > - in ~50% cases RCU stall (there are only two CPUs)
> >
> >
> > RCU stall
> > ~~~~~~~~
> > cat /proc/interrupts
> > 16: 176129 0 IO-APIC 34-fasteoi xhci-hcd:usb1
> >
> > [434689.740982] rcu: INFO: rcu_sched self-detected stall on CPU
> > [434689.746856] rcu: 0-....: (24661 ticks this GP)
> > idle=ee2/1/0x4000000000000000 softirq=4162/4163 fqs=5238
> > [434689.756867] (t=21000 jiffies g=8489 q=52)
> > [434689.761204] NMI backtrace for cpu 0
> > [434689.764919] CPU: 0 PID: 222 Comm: kworker/0:0 Not tainted
> > 5.13.0-rc5+ #4
> > [434689.771948] Hardware name: Intel Corporation Merrifield/BODEGA
> > BAY, BIOS 542 2015.01.21:18.19.48
> > [434689.781126] Workqueue: usb_hub_wq hub_event
> > [434689.785590] Call Trace:
> > [434689.788232] <IRQ>
> > [434689.790431] dump_stack+0x69/0x8e
> > [434689.793996] nmi_cpu_backtrace.cold+0x32/0x69
> > [434689.798612] ? lapic_can_unplug_cpu+0x80/0x80
> > [434689.803249] nmi_trigger_cpumask_backtrace+0x8a/0xa0
> > [434689.808508] rcu_dump_cpu_stacks+0xbf/0xed
> > [434689.812873] rcu_sched_clock_irq.cold+0xc7/0x1e9
> > [434689.817805] update_process_times+0x8c/0xc0
> > [434689.822255] tick_sched_handle+0x34/0x50
> > [434689.826432] tick_sched_timer+0x7a/0xd0
> > [434689.830513] ? get_cpu_iowait_time_us+0x110/0x110
> > [434689.835499] __hrtimer_run_queues+0x157/0x350
> > [434689.840171] hrtimer_interrupt+0x110/0x2c0
> > [434689.844569] __sysvec_apic_timer_interrupt+0x76/0x150
> > [434689.849911] sysvec_apic_timer_interrupt+0x2f/0x90
> > [434689.854990] asm_sysvec_apic_timer_interrupt+0x12/0x20
> > [434689.860415] RIP: 0010:_raw_spin_unlock_irqrestore+0x37/0x50
> > [434689.866294] Code: 53 48 89 f3 48 8b 74 24 10 e8 45 fa 3a ff 48 89
> > ef e8 6d 23 3b ff 9c 58 f6 c4 02 75 10 80 e7 02 74 01 fb 65 ff 0d e9
> > d3 4f 78 <5b> 5d c3 e8 b1 3b ff ff eb e9 66 66 2e 0f 1f 84 00 00 00 00
> > 00 0f
> > [434689.885773] RSP: 0000:ffff9ac140003da8 EFLAGS: 00000206
> > [434689.891294] RAX: 0000000000000046 RBX: 0000000000000202 RCX:
> > ffff8b7e4ad208d0
> > [434689.898775] RDX: 0000000062c241c0 RSI: 0000000042fee84d RDI:
> > ffffffff89460720
> > [434689.906255] RBP: ffffffff89460720 R08: 00000000897fe2f0 R09:
> > 0000000000000001
> > [434689.913733] R10: 0000000000000000 R11: ffff8b7e46226db0 R12:
> > ffff8b7e4b29c000
> > [434689.921214] R13: 0000000000000000 R14: ffff8b7e4b29c2f8 R15:
> > ffff8b7e42e65780
> > [434689.928798] debug_dma_unmap_page+0x7e/0x90
> > [434689.933324] ? __lock_acquire.constprop.0+0x27d/0x550
> > [434689.938681] ? find_held_lock+0x2b/0x80
> > [434689.942787] usb_hcd_unmap_urb_for_dma+0x65/0x100
> > [434689.947785] __usb_hcd_giveback_urb+0x4b/0x100
> > [434689.952513] usb_giveback_urb_bh+0xa7/0x100
> > [434689.956994] tasklet_action_common.constprop.0+0xd0/0x140
> > [434689.962712] __do_softirq+0xeb/0x2dd
> > [434689.966565] irq_exit_rcu+0x95/0xc0
> > [434689.970288] common_interrupt+0x7b/0xa0
> > [434689.974375] </IRQ>
> > [434689.976670] asm_common_interrupt+0x1e/0x40
> > [434689.981109] RIP: 0010:_raw_spin_unlock_irq+0x27/0x30
> > [434689.986359] Code: 35 ff 90 0f 1f 44 00 00 55 48 8b 74 24 08 48 89
> > fd 48 8d 7f 18 e8 79 fa 3a ff 48 89 ef e8 a1 23 3b ff fb 65 ff 0d 29
> > d4 4f 78 <5d> c3 0f 1f 80 00 00 00 00 0f 1f 44 00 00 55 48 89 fd 48 83
> > c7 18
> > [434690.005836] RSP: 0000:ffff9ac140293b98 EFLAGS: 00000246
> > [434690.011352] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
> > ffff8b7e4ad208d0
> > [434690.018832] RDX: 0000000062c241c0 RSI: 0000000042fee84d RDI:
> > ffffffff8881ab00
> > [434690.026309] RBP: ffffffff8881ab00 R08: 00000000897fe2f0 R09:
> > 0000000000000001
> > [434690.033790] R10: ffff8b7e7e23ac30 R11: 0000000000000000 R12:
> > 0000000000000000
> > [434690.041268] R13: ffff8b7e4b29c000 R14: ffff8b7e4b40c018 R15:
> > ffff8b7e4af62950
> > [434690.048840] ? _raw_spin_unlock_irq+0x1f/0x30
> > [434690.053465] usb_hcd_submit_urb+0x294/0xbf0
> > [434690.057948] ? lockdep_init_map_type+0x47/0x220
> > [434690.062805] usb_start_wait_urb+0x65/0x160
> > [434690.067230] usb_control_msg+0xdf/0x140
> > [434690.071355] hub_event+0x8f4/0x1890
> > [434690.075184] ? lock_acquire+0x93/0x150
> > [434690.079175] ? process_one_work+0x1bc/0x4b0
> > [434690.083652] process_one_work+0x24d/0x4b0
> > [434690.087970] worker_thread+0x55/0x3c0
> > [434690.091875] ? rescuer_thread+0x390/0x390
> > [434690.096154] kthread+0x137/0x150
> > [434690.099612] ? __kthread_bind_mask+0x60/0x60
> > [434690.104166] ret_from_fork+0x22/0x30
> >
> > followed by Watchdog one
> >
> > [434725.296748] Kernel panic - not syncing: Kernel Watchdog
> > [434725.302247] CPU: 0 PID: 222 Comm: kworker/0:0 Not tainted
> > 5.13.0-rc5+ #4
> > [434725.309242] Hardware name: Intel Corporation Merrifield/BODEGA
> > BAY, BIOS 542 2015.01.21:18.19.48
> > [434725.318367] Workqueue: usb_hub_wq hub_event
> > [434725.322801] Call Trace:
> > [434725.325424] <IRQ>
> > [434725.327607] dump_stack+0x69/0x8e
> > [434725.331145] panic+0x102/0x2d1
> > [434725.334460] mid_wdt_irq+0x11/0x11
> > [434725.338072] __handle_irq_event_percpu+0x65/0x1c0
> > [434725.343048] handle_irq_event+0x55/0xb0
> > [434725.347124] handle_fasteoi_irq+0x78/0x1d0
> > [434725.351461] __common_interrupt+0x3e/0xa0
> > [434725.355713] common_interrupt+0x3b/0xa0
> > [434725.359784] asm_common_interrupt+0x1e/0x40
> > [434725.364192] RIP: 0010:_raw_spin_lock_irqsave+0x0/0x50
> > [434725.369501] Code: 8d 7f 18 45 31 c9 31 c9 41 b8 01 00 00 00 31 d2
> > 31 f6 e8 03 ff 3a ff 48 89 ef 58 5d e9 99 24 3b ff 66 0f 1f 84 00 00
> > 00 00 00 <0f> 1f 44 00 00 41 54 55 48 89 fd 9c 41 5c fa 65 ff 05 ea d5
> > 4f 78
> > [434725.388866] RSP: 0000:ffff9ac140003d00 EFLAGS: 00000202
> > [434725.394347] RAX: 0000000000000028 RBX: 00000000002b5ea8 RCX:
> > ffff8b7e4ad208d0
> > [434725.401779] RDX: 0000000062c241c0 RSI: 0000000042fee84d RDI:
> > ffffffff887579e0
> > [434725.409211] RBP: 0000000000000282 R08: 00000000897fe2f0 R09:
> > 0000000000000001
> > [434725.416641] R10: 0000000000000000 R11: ffff8b7e46226db0 R12:
> > ffff8b7e41282500
> > [434725.424073] R13: ffff8b7e41281f00 R14: 0000000000000200 R15:
> > 000000000ad7aa00
> > [434725.431582] add_dma_entry+0xa9/0x1d0
> > [434725.435487] dma_map_page_attrs+0xd8/0x220
> > [434725.439847] usb_hcd_map_urb_for_dma+0x3b6/0x4f0
> > [434725.444734] usb_hcd_submit_urb+0x98/0xbf0
> > [434725.449059] ? __lock_acquire.constprop.0+0x27d/0x550
> > [434725.454378] ? find_held_lock+0x2b/0x80
> > [434725.458493] dln2_rx+0x1d6/0x2b0 [dln2]
> > [434725.462595] __usb_hcd_giveback_urb+0x91/0x100
> > [434725.467291] usb_giveback_urb_bh+0xa7/0x100
> > [434725.471740] tasklet_action_common.constprop.0+0xd0/0x140
> > [434725.477420] __do_softirq+0xeb/0x2dd
> > [434725.481240] irq_exit_rcu+0x95/0xc0
> > [434725.484939] common_interrupt+0x7b/0xa0
> > [434725.489000] </IRQ>
> > [434725.491275] asm_common_interrupt+0x1e/0x40
> > [434725.495682] RIP: 0010:_raw_spin_unlock_irq+0x27/0x30
> > [434725.500898] Code: 35 ff 90 0f 1f 44 00 00 55 48 8b 74 24 08 48 89
> > fd 48 8d 7f 18 e8 79 fa 3a ff 48 89 ef e8 a
> > 1 23 3b ff fb 65 ff 0d 29 d4 4f 78 <5d> c3 0f 1f 80 00 00 00 00 0f 1f
> > 44 00 00 55 48 89 fd 48 83 c7 18
> > [434725.520261] RSP: 0000:ffff9ac140293b98 EFLAGS: 00000246
> > [434725.525742] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
> > ffff8b7e4ad208d0
> > [434725.533174] RDX: 0000000062c241c0 RSI: 0000000042fee84d RDI:
> > ffffffff8881ab00
> > [434725.540606] RBP: ffffffff8881ab00 R08: 00000000897fe2f0 R09:
> > 0000000000000001
> > [434725.548037] R10: ffff8b7e7e23ac30 R11: 0000000000000000 R12:
> > 0000000000000000
> > [434725.555469] R13: ffff8b7e4b29c000 R14: ffff8b7e4b40c018 R15:
> > ffff8b7e4af62950
> > [434725.562975] ? _raw_spin_unlock_irq+0x1f/0x30
> > [434725.567571] usb_hcd_submit_urb+0x294/0xbf0
> > [434725.572017] ? lockdep_init_map_type+0x47/0x220
> > [434725.576831] usb_start_wait_urb+0x65/0x160
> > [434725.581213] usb_control_msg+0xdf/0x140
> > [434725.585302] hub_event+0x8f4/0x1890
> > [434725.589087] ? lock_acquire+0x93/0x150
> > [434725.593053] ? process_one_work+0x1bc/0x4b0
> > [434725.597494] process_one_work+0x24d/0x4b0
> > [434725.601776] worker_thread+0x55/0x3c0
> > [434725.605657] ? rescuer_thread+0x390/0x390
> > [434725.609904] kthread+0x137/0x150
> > [434725.613342] ? __kthread_bind_mask+0x60/0x60
> > [434725.617862] ret_from_fork+0x22/0x30
> > [434725.622038] Kernel Offset: 0x5e00000 from 0xffffffff81000000
> > (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
> > [434725.633177] ---[ end Kernel panic - not syncing: Kernel Watchdog ]---
> >
> > Any ideas, hints, etc are welcome!

-- 
With Best Regards,
Andy Shevchenko
