Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61842B943A
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2019 17:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393234AbfITPld (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Sep 2019 11:41:33 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:48176 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393069AbfITPlc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Sep 2019 11:41:32 -0400
Received: by mail-io1-f71.google.com with SMTP id w16so11155985ioc.15
        for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2019 08:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to:cc;
        bh=eQctSkHe+j1MPGH3L/46q4Fwfa7SyPui4T2DB+cOb+0=;
        b=fw8yMoOX2uumYbVl3ghkhkqHIvQG/vuN/hEMotJk95wASLB4pVCoNIh/3a8UIs8ZCD
         BcVSuqUkl/jvyjPTw0p96VXIPoB/myfynS1sVDl2Ovh6dQyohwXlpIs13P0NqDuo9c69
         /tLdf5Ej2nKeiOp9SLxyhUN1cQKEEoPl+b3S4VUphxgBw/TeIyLp78DhabZMb6SR5orW
         yVhD+Q4Pw+s+BnRnnQBBDxWBHAEoyG9AGnmuOScD0V+DL7xOVegjmktfy8cKhaucl39x
         C5PCh+tTpkvWx+ehJO4eLhr3nlL05YWKIJKou+QMLw73y9HCmHuWIpm2cwwOXWWvcfT/
         C5Bg==
X-Gm-Message-State: APjAAAVmjmnBzGXIicumG3rFD01NU+2dDagv8l7j50Yn/HPxGFBI0JTE
        jqdyDC1bG1YWVnywc79EtQc6v3m6uMaqACAXKzswvkwECilV
X-Google-Smtp-Source: APXvYqwzZmO0rtiCceVWXdCc/eZvTbzGsKHvtULi0RKCvlLXxKkvo3aLqgMJGkqhoYeQVJ6qAzirco0yKwlrubDbMXqy4JUpuOHl
MIME-Version: 1.0
X-Received: by 2002:a5e:9319:: with SMTP id k25mr20492666iom.290.1568994091374;
 Fri, 20 Sep 2019 08:41:31 -0700 (PDT)
Date:   Fri, 20 Sep 2019 08:41:31 -0700
In-Reply-To: <CAAeHK+ym+yAO2s_QL3j9ELwF=4b1TF_r5gwCFEEyLvKOcrhfGg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000078a22f0592fde7cd@google.com>
Subject: Re: Re: KASAN: use-after-free Read in wdm_out_callback
From:   syzbot <syzbot+9a22af9cbb07280ce9cf@syzkaller.appspotmail.com>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     andreyknvl@google.com, baijiaju1990@gmail.com,
        bigeasy@linutronix.de, colin.king@canonical.com,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        yuehaibing@huawei.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> On Mon, Aug 19, 2019 at 4:48 PM syzbot
> <syzbot+9a22af9cbb07280ce9cf@syzkaller.appspotmail.com> wrote:

>> Hello,

>> syzbot found the following crash on:

>> HEAD commit:    d0847550 usb-fuzzer: main usb gadget fuzzer driver
>> git tree:       https://github.com/google/kasan.git usb-fuzzer
>> console output: https://syzkaller.appspot.com/x/log.txt?x=136553ba600000
>> kernel config:   
>> https://syzkaller.appspot.com/x/.config?x=dbc9c80cc095da19
>> dashboard link:  
>> https://syzkaller.appspot.com/bug?extid=9a22af9cbb07280ce9cf
>> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

>> Unfortunately, I don't have any reproducer for this crash yet.

>> IMPORTANT: if you fix the bug, please add the following tag to the  
>> commit:
>> Reported-by: syzbot+9a22af9cbb07280ce9cf@syzkaller.appspotmail.com

>> cdc_wdm 1-1:118.0: nonzero urb status received: -71
>> cdc_wdm 1-1:118.0: wdm_int_callback - 0 bytes
>> ==================================================================
>> BUG: KASAN: use-after-free in __lock_acquire+0x302a/0x3b50
>> kernel/locking/lockdep.c:3753
>> Read of size 8 at addr ffff8881cbdca8e8 by task swapper/0/0

>> CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.3.0-rc4+ #26
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
>> Google 01/01/2011
>> Call Trace:
>>    <IRQ>
>>    __dump_stack lib/dump_stack.c:77 [inline]
>>    dump_stack+0xca/0x13e lib/dump_stack.c:113
>>    print_address_description+0x6a/0x32c mm/kasan/report.c:351
>>    __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
>>    kasan_report+0xe/0x12 mm/kasan/common.c:612
>>    __lock_acquire+0x302a/0x3b50 kernel/locking/lockdep.c:3753
>>    lock_acquire+0x127/0x320 kernel/locking/lockdep.c:4412
>>    __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
>>    _raw_spin_lock_irqsave+0x32/0x50 kernel/locking/spinlock.c:159
>>    wdm_out_callback+0x45/0x170 drivers/usb/class/cdc-wdm.c:148
>>    __usb_hcd_giveback_urb+0x1f2/0x470 drivers/usb/core/hcd.c:1657
>>    usb_hcd_giveback_urb+0x368/0x420 drivers/usb/core/hcd.c:1722
>>    dummy_timer+0x120f/0x2fa2 drivers/usb/gadget/udc/dummy_hcd.c:1965
>>    call_timer_fn+0x179/0x650 kernel/time/timer.c:1322
>>    expire_timers kernel/time/timer.c:1366 [inline]
>>    __run_timers kernel/time/timer.c:1685 [inline]
>>    __run_timers kernel/time/timer.c:1653 [inline]
>>    run_timer_softirq+0x5cc/0x14b0 kernel/time/timer.c:1698
>>    __do_softirq+0x221/0x912 kernel/softirq.c:292
>>    invoke_softirq kernel/softirq.c:373 [inline]
>>    irq_exit+0x178/0x1a0 kernel/softirq.c:413
>>    exiting_irq arch/x86/include/asm/apic.h:537 [inline]
>>    smp_apic_timer_interrupt+0x12f/0x500 arch/x86/kernel/apic/apic.c:1095
>>    apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:830
>>    </IRQ>
>> RIP: 0010:default_idle+0x28/0x2e0 arch/x86/kernel/process.c:581
>> Code: 90 90 41 56 41 55 65 44 8b 2d 64 ea 93 7a 41 54 55 53 0f 1f 44 00  
>> 00
>> e8 96 5b d5 fb e9 07 00 00 00 0f 00 2d 7a 8f 54 00 fb f4 <65> 44 8b 2d 40
>> ea 93 7a 0f 1f 44 00 00 5b 5d 41 5c 41 5d 41 5e c3
>> RSP: 0018:ffffffff86c07da8 EFLAGS: 00000246 ORIG_RAX: ffffffffffffff13
>> RAX: 0000000000000007 RBX: ffffffff86c2b200 RCX: 0000000000000000
>> RDX: 0000000000000000 RSI: 0000000000000006 RDI: ffffffff86c2ba44
>> RBP: fffffbfff0d85640 R08: ffffffff86c2b200 R09: 0000000000000000
>> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
>> R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>>    cpuidle_idle_call kernel/sched/idle.c:154 [inline]
>>    do_idle+0x3c2/0x4f0 kernel/sched/idle.c:263
>>    cpu_startup_entry+0x14/0x20 kernel/sched/idle.c:354
>>    start_kernel+0x838/0x872 init/main.c:785
>>    secondary_startup_64+0xa4/0xb0 arch/x86/kernel/head_64.S:241

>> Allocated by task 83:
>>    save_stack+0x1b/0x80 mm/kasan/common.c:69
>>    set_track mm/kasan/common.c:77 [inline]
>>    __kasan_kmalloc mm/kasan/common.c:487 [inline]
>>    __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:460
>>    kmalloc include/linux/slab.h:552 [inline]
>>    kzalloc include/linux/slab.h:748 [inline]
>>    wdm_create+0x56/0x1720 drivers/usb/class/cdc-wdm.c:786
>>    wdm_probe+0x220/0x2d0 drivers/usb/class/cdc-wdm.c:922
>>    usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
>>    really_probe+0x281/0x6d0 drivers/base/dd.c:548
>>    driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
>>    __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
>>    bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
>>    __device_attach+0x217/0x360 drivers/base/dd.c:894
>>    bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>>    device_add+0xae6/0x16f0 drivers/base/core.c:2165
>>    usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
>>    generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
>>    usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
>>    really_probe+0x281/0x6d0 drivers/base/dd.c:548
>>    driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
>>    __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
>>    bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
>>    __device_attach+0x217/0x360 drivers/base/dd.c:894
>>    bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>>    device_add+0xae6/0x16f0 drivers/base/core.c:2165
>>    usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
>>    hub_port_connect drivers/usb/core/hub.c:5098 [inline]
>>    hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
>>    port_event drivers/usb/core/hub.c:5359 [inline]
>>    hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
>>    process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>>    worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>>    kthread+0x318/0x420 kernel/kthread.c:255
>>    ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

>> Freed by task 83:
>>    save_stack+0x1b/0x80 mm/kasan/common.c:69
>>    set_track mm/kasan/common.c:77 [inline]
>>    __kasan_slab_free+0x130/0x180 mm/kasan/common.c:449
>>    slab_free_hook mm/slub.c:1423 [inline]
>>    slab_free_freelist_hook mm/slub.c:1474 [inline]
>>    slab_free mm/slub.c:3016 [inline]
>>    kfree+0xe4/0x2f0 mm/slub.c:3957
>>    wdm_create+0x542/0x1720 drivers/usb/class/cdc-wdm.c:884
>>    wdm_probe+0x220/0x2d0 drivers/usb/class/cdc-wdm.c:922
>>    usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
>>    really_probe+0x281/0x6d0 drivers/base/dd.c:548
>>    driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
>>    __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
>>    bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
>>    __device_attach+0x217/0x360 drivers/base/dd.c:894
>>    bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>>    device_add+0xae6/0x16f0 drivers/base/core.c:2165
>>    usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
>>    generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
>>    usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
>>    really_probe+0x281/0x6d0 drivers/base/dd.c:548
>>    driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
>>    __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
>>    bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
>>    __device_attach+0x217/0x360 drivers/base/dd.c:894
>>    bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>>    device_add+0xae6/0x16f0 drivers/base/core.c:2165
>>    usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
>>    hub_port_connect drivers/usb/core/hub.c:5098 [inline]
>>    hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
>>    port_event drivers/usb/core/hub.c:5359 [inline]
>>    hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
>>    process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>>    worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>>    kthread+0x318/0x420 kernel/kthread.c:255
>>    ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

>> The buggy address belongs to the object at ffff8881cbdca880
>>    which belongs to the cache kmalloc-1k of size 1024
>> The buggy address is located 104 bytes inside of
>>    1024-byte region [ffff8881cbdca880, ffff8881cbdcac80)
>> The buggy address belongs to the page:
>> page:ffffea00072f7200 refcount:1 mapcount:0 mapping:ffff8881da002280
>> index:0x0 compound_mapcount: 0
>> flags: 0x200000000010200(slab|head)
>> raw: 0200000000010200 ffffea000719ca00 0000000400000004 ffff8881da002280
>> raw: 0000000000000000 00000000000e000e 00000001ffffffff 0000000000000000
>> page dumped because: kasan: bad access detected

>> Memory state around the buggy address:
>>    ffff8881cbdca780: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>    ffff8881cbdca800: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>> > ffff8881cbdca880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>                                                             ^
>>    ffff8881cbdca900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>    ffff8881cbdca980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>> ==================================================================


>> ---
>> This bug is generated by a bot. It may contain errors.
>> See https://goo.gl/tpsmEJ for more information about syzbot.
>> syzbot engineers can be reached at syzkaller@googlegroups.com.

>> syzbot will keep track of this bug report. See:
>> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

> Most probably the same issue as:

> https://syzkaller.appspot.com/bug?id=07a5f1529b95adcb80cbf8729f9cb499b980991d

> #syz dup: KASAN: use-after-free Read in wdm_out_callback

Can't dup bug to itself.

