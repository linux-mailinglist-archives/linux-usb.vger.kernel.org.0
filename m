Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4DE1F1667
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2019 13:57:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730614AbfKFM45 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Nov 2019 07:56:57 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40284 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728716AbfKFM44 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Nov 2019 07:56:56 -0500
Received: by mail-pf1-f196.google.com with SMTP id r4so18801795pfl.7
        for <linux-usb@vger.kernel.org>; Wed, 06 Nov 2019 04:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zrU2hcQbateSQGndLgzM1ZPWiMMcxbOrXKhbaNn2pRU=;
        b=ekO/uCO1Xbl0HO5IdZQsNJoLpEAwWq1sWCtmuq82yPFTrYfvfM+KW9Ir0x5iGmZKe0
         TUoMg37q1BfRc4ve2MUZePkNBvcLty2iqjwbO69VkomEpEegLmDlx3249fVa5AjZsVJ3
         sK53E9QKXZZkDiruBwwqBPByF2P+rqODeoCAkxbGv+XqCpuRcb8QHDtcWX5yYa7ibH82
         5c2VMa9oWfdcC6Sq40/IXiU0Ee3hmW0NMoC998gp121sawk62TTxQnSwlcn2rG+6gNN4
         acd/fXSDaqRlSinjppN5BuLgfxI+3SErjvjgF64tKtq/7anxCkYzq/I7g2gudCWO8Jwx
         98iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zrU2hcQbateSQGndLgzM1ZPWiMMcxbOrXKhbaNn2pRU=;
        b=qUS2Zu50sT/wfl1RFcuxEYPj8mjGzifYjWShq0oWEGE32rQjr0HaPY4Q0BoWg3aLYp
         6owj+sOMLc9f0MqN/FA0Dkod/B/6Sepp4XRCcgeRXn17Z++ZWvTtul4jBXL3pEL8N+OD
         ZDeIuxw4gZvyfgLn192JLN4kCwKTWOyHdrisEk/6ecjFGnn9woxClZeE4Oh1XJj2ucTv
         4aQp1UOzDBVB9VP7v4daNhVH37fIkHy5R4qUTZ6g2wtMGNkf8dATtg7Vac9ppLI1RkQn
         QVQ+tatK3j11/7gPiI/XApcQqtPVf144LZ0rjl2WyV+vwPsKYR4wY/k4vkoLkA5d3wAD
         97ww==
X-Gm-Message-State: APjAAAXibd3FrKIWYXQgHyoCVJiF0c7siIW6SJ+eaxvO98309Zs7yKEV
        HPQD4j/TybcxxAykmcKq5JNHFJpL8m1CvHxkWg4yfY/J+5A=
X-Google-Smtp-Source: APXvYqx5sDuTh6nY1Gch712L5nHB8AbldC0KX7x93cqiNEo2Wce+u8SHLdJ18nuQQLPEkNZqI+pYF0mLDd3ZIFO56p8=
X-Received: by 2002:aa7:9806:: with SMTP id e6mr3209024pfl.25.1573045014995;
 Wed, 06 Nov 2019 04:56:54 -0800 (PST)
MIME-Version: 1.0
References: <000000000000c7a7e4058e589ad1@google.com>
In-Reply-To: <000000000000c7a7e4058e589ad1@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 6 Nov 2019 13:56:43 +0100
Message-ID: <CAAeHK+wGczvN4sQ1iLuGNVHxR1mn=jk3T2bs5feq7_t+Wj5sKA@mail.gmail.com>
Subject: Re: INFO: task hung in hwrng_unregister
To:     syzbot <syzbot+823cb2bdae0c63b2cb9f@syzkaller.appspotmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 23, 2019 at 2:48 PM syzbot
<syzbot+823cb2bdae0c63b2cb9f@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    6a3599ce usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=1266ca64600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
> dashboard link: https://syzkaller.appspot.com/bug?extid=823cb2bdae0c63b2cb9f
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=143d46f4600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1789853fa00000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+823cb2bdae0c63b2cb9f@syzkaller.appspotmail.com
>
> INFO: task kworker/0:0:5 blocked for more than 143 seconds.
>        Not tainted 5.2.0-rc6+ #15
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> kworker/0:0     D26088     5      2 0x80004000
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>   schedule+0x96/0x240 /kernel/sched/core.c:3509
>   schedule_timeout+0x682/0xb20 /kernel/time/timer.c:1783
>   do_wait_for_common /kernel/sched/completion.c:83 [inline]
>   __wait_for_common /kernel/sched/completion.c:104 [inline]
>   wait_for_common /kernel/sched/completion.c:115 [inline]
>   wait_for_completion+0x26f/0x3c0 /kernel/sched/completion.c:136
>   kthread_stop+0xe6/0x5a0 /kernel/kthread.c:559
>   hwrng_unregister+0x190/0x210 /drivers/char/hw_random/core.c:535
>   chaoskey_disconnect+0x1b2/0x200 /drivers/usb/misc/chaoskey.c:231
>   usb_unbind_interface+0x1bd/0x8a0 /drivers/usb/core/driver.c:423
>   __device_release_driver /drivers/base/dd.c:1081 [inline]
>   device_release_driver_internal+0x404/0x4c0 /drivers/base/dd.c:1112
>   bus_remove_device+0x2dc/0x4a0 /drivers/base/bus.c:556
>   device_del+0x460/0xb80 /drivers/base/core.c:2274
>   usb_disable_device+0x211/0x690 /drivers/usb/core/message.c:1237
>   usb_disconnect+0x284/0x830 /drivers/usb/core/hub.c:2199
>   hub_port_connect /drivers/usb/core/hub.c:4949 [inline]
>   hub_port_connect_change /drivers/usb/core/hub.c:5213 [inline]
>   port_event /drivers/usb/core/hub.c:5359 [inline]
>   hub_event+0x13bd/0x3550 /drivers/usb/core/hub.c:5441
>   process_one_work+0x905/0x1570 /kernel/workqueue.c:2269
>   process_scheduled_works /kernel/workqueue.c:2331 [inline]
>   worker_thread+0x7ab/0xe20 /kernel/workqueue.c:2417
>   kthread+0x30b/0x410 /kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 /arch/x86/entry/entry_64.S:352
> INFO: task kworker/1:1:21 blocked for more than 143 seconds.
>        Not tainted 5.2.0-rc6+ #15
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> kworker/1:1     D25576    21      2 0x80004000
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>   schedule+0x96/0x240 /kernel/sched/core.c:3509
>   schedule_timeout+0x682/0xb20 /kernel/time/timer.c:1783
>   do_wait_for_common /kernel/sched/completion.c:83 [inline]
>   __wait_for_common /kernel/sched/completion.c:104 [inline]
>   wait_for_common /kernel/sched/completion.c:115 [inline]
>   wait_for_completion+0x26f/0x3c0 /kernel/sched/completion.c:136
>   kthread_stop+0xe6/0x5a0 /kernel/kthread.c:559
>   hwrng_unregister+0x190/0x210 /drivers/char/hw_random/core.c:535
>   chaoskey_disconnect+0x1b2/0x200 /drivers/usb/misc/chaoskey.c:231
>   usb_unbind_interface+0x1bd/0x8a0 /drivers/usb/core/driver.c:423
>   __device_release_driver /drivers/base/dd.c:1081 [inline]
>   device_release_driver_internal+0x404/0x4c0 /drivers/base/dd.c:1112
>   bus_remove_device+0x2dc/0x4a0 /drivers/base/bus.c:556
>   device_del+0x460/0xb80 /drivers/base/core.c:2274
>   usb_disable_device+0x211/0x690 /drivers/usb/core/message.c:1237
>   usb_disconnect+0x284/0x830 /drivers/usb/core/hub.c:2199
>   hub_port_connect /drivers/usb/core/hub.c:4949 [inline]
>   hub_port_connect_change /drivers/usb/core/hub.c:5213 [inline]
>   port_event /drivers/usb/core/hub.c:5359 [inline]
>   hub_event+0x13bd/0x3550 /drivers/usb/core/hub.c:5441
>   process_one_work+0x905/0x1570 /kernel/workqueue.c:2269
>   process_scheduled_works /kernel/workqueue.c:2331 [inline]
>   worker_thread+0x7ab/0xe20 /kernel/workqueue.c:2417
>   kthread+0x30b/0x410 /kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 /arch/x86/entry/entry_64.S:352
> INFO: task kworker/0:2:107 blocked for more than 143 seconds.
>        Not tainted 5.2.0-rc6+ #15
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> kworker/0:2     D25688   107      2 0x80004000
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>   schedule+0x96/0x240 /kernel/sched/core.c:3509
>   schedule_timeout+0x682/0xb20 /kernel/time/timer.c:1783
>   do_wait_for_common /kernel/sched/completion.c:83 [inline]
>   __wait_for_common /kernel/sched/completion.c:104 [inline]
>   wait_for_common /kernel/sched/completion.c:115 [inline]
>   wait_for_completion+0x26f/0x3c0 /kernel/sched/completion.c:136
>   kthread_stop+0xe6/0x5a0 /kernel/kthread.c:559
>   hwrng_unregister+0x190/0x210 /drivers/char/hw_random/core.c:535
>   chaoskey_disconnect+0x1b2/0x200 /drivers/usb/misc/chaoskey.c:231
>   usb_unbind_interface+0x1bd/0x8a0 /drivers/usb/core/driver.c:423
>   __device_release_driver /drivers/base/dd.c:1081 [inline]
>   device_release_driver_internal+0x404/0x4c0 /drivers/base/dd.c:1112
>   bus_remove_device+0x2dc/0x4a0 /drivers/base/bus.c:556
>   device_del+0x460/0xb80 /drivers/base/core.c:2274
>   usb_disable_device+0x211/0x690 /drivers/usb/core/message.c:1237
>   usb_disconnect+0x284/0x830 /drivers/usb/core/hub.c:2199
>   hub_port_connect /drivers/usb/core/hub.c:4949 [inline]
>   hub_port_connect_change /drivers/usb/core/hub.c:5213 [inline]
>   port_event /drivers/usb/core/hub.c:5359 [inline]
>   hub_event+0x13bd/0x3550 /drivers/usb/core/hub.c:5441
>   process_one_work+0x905/0x1570 /kernel/workqueue.c:2269
>   process_scheduled_works /kernel/workqueue.c:2331 [inline]
>   worker_thread+0x7ab/0xe20 /kernel/workqueue.c:2417
>   kthread+0x30b/0x410 /kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 /arch/x86/entry/entry_64.S:352
> INFO: task kworker/1:2:108 blocked for more than 144 seconds.
>        Not tainted 5.2.0-rc6+ #15
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> kworker/1:2     D26088   108      2 0x80004000
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>   schedule+0x96/0x240 /kernel/sched/core.c:3509
>   schedule_timeout+0x682/0xb20 /kernel/time/timer.c:1783
>   do_wait_for_common /kernel/sched/completion.c:83 [inline]
>   __wait_for_common /kernel/sched/completion.c:104 [inline]
>   wait_for_common /kernel/sched/completion.c:115 [inline]
>   wait_for_completion+0x26f/0x3c0 /kernel/sched/completion.c:136
>   kthread_stop+0xe6/0x5a0 /kernel/kthread.c:559
>   hwrng_unregister+0x190/0x210 /drivers/char/hw_random/core.c:535
>   chaoskey_disconnect+0x1b2/0x200 /drivers/usb/misc/chaoskey.c:231
>   usb_unbind_interface+0x1bd/0x8a0 /drivers/usb/core/driver.c:423
>   __device_release_driver /drivers/base/dd.c:1081 [inline]
>   device_release_driver_internal+0x404/0x4c0 /drivers/base/dd.c:1112
>   bus_remove_device+0x2dc/0x4a0 /drivers/base/bus.c:556
>   device_del+0x460/0xb80 /drivers/base/core.c:2274
>   usb_disable_device+0x211/0x690 /drivers/usb/core/message.c:1237
>   usb_disconnect+0x284/0x830 /drivers/usb/core/hub.c:2199
>   hub_port_connect /drivers/usb/core/hub.c:4949 [inline]
>   hub_port_connect_change /drivers/usb/core/hub.c:5213 [inline]
>   port_event /drivers/usb/core/hub.c:5359 [inline]
>   hub_event+0x13bd/0x3550 /drivers/usb/core/hub.c:5441
>   process_one_work+0x905/0x1570 /kernel/workqueue.c:2269
>   process_scheduled_works /kernel/workqueue.c:2331 [inline]
>   worker_thread+0x7ab/0xe20 /kernel/workqueue.c:2417
>   kthread+0x30b/0x410 /kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 /arch/x86/entry/entry_64.S:352
> INFO: task kworker/1:0:1743 blocked for more than 144 seconds.
>        Not tainted 5.2.0-rc6+ #15
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> kworker/1:0     D26088  1743      2 0x80004000
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>   schedule+0x96/0x240 /kernel/sched/core.c:3509
>   schedule_timeout+0x682/0xb20 /kernel/time/timer.c:1783
>   do_wait_for_common /kernel/sched/completion.c:83 [inline]
>   __wait_for_common /kernel/sched/completion.c:104 [inline]
>   wait_for_common /kernel/sched/completion.c:115 [inline]
>   wait_for_completion+0x26f/0x3c0 /kernel/sched/completion.c:136
>   kthread_stop+0xe6/0x5a0 /kernel/kthread.c:559
>   hwrng_unregister+0x190/0x210 /drivers/char/hw_random/core.c:535
>   chaoskey_disconnect+0x1b2/0x200 /drivers/usb/misc/chaoskey.c:231
>   usb_unbind_interface+0x1bd/0x8a0 /drivers/usb/core/driver.c:423
>   __device_release_driver /drivers/base/dd.c:1081 [inline]
>   device_release_driver_internal+0x404/0x4c0 /drivers/base/dd.c:1112
>   bus_remove_device+0x2dc/0x4a0 /drivers/base/bus.c:556
>   device_del+0x460/0xb80 /drivers/base/core.c:2274
>   usb_disable_device+0x211/0x690 /drivers/usb/core/message.c:1237
>   usb_disconnect+0x284/0x830 /drivers/usb/core/hub.c:2199
>   hub_port_connect /drivers/usb/core/hub.c:4949 [inline]
>   hub_port_connect_change /drivers/usb/core/hub.c:5213 [inline]
>   port_event /drivers/usb/core/hub.c:5359 [inline]
>   hub_event+0x13bd/0x3550 /drivers/usb/core/hub.c:5441
>   process_one_work+0x905/0x1570 /kernel/workqueue.c:2269
>   process_scheduled_works /kernel/workqueue.c:2331 [inline]
>   worker_thread+0x7ab/0xe20 /kernel/workqueue.c:2417
>   kthread+0x30b/0x410 /kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 /arch/x86/entry/entry_64.S:352
>
> Showing all locks held in the system:
> 5 locks held by kworker/0:0/5:
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> __write_once_size /./include/linux/compiler.h:221 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> arch_atomic64_set /./arch/x86/include/asm/atomic64_64.h:34 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at: atomic64_set
> /./include/asm-generic/atomic-instrumented.h:855 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> atomic_long_set /./include/asm-generic/atomic-long.h:40 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at: set_work_data
> /kernel/workqueue.c:620 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> set_work_pool_and_clear_pending /kernel/workqueue.c:647 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> process_one_work+0x81a/0x1570 /kernel/workqueue.c:2240
>   #1: 00000000c0e8b754 ((work_completion)(&hub->events)){+.+.}, at:
> process_one_work+0x84e/0x1570 /kernel/workqueue.c:2244
>   #2: 00000000b363c0f6 (&dev->mutex){....}, at: device_lock
> /./include/linux/device.h:1208 [inline]
>   #2: 00000000b363c0f6 (&dev->mutex){....}, at: hub_event+0x179/0x3550
> /drivers/usb/core/hub.c:5387
>   #3: 0000000085e6ee8d (&dev->mutex){....}, at: device_lock
> /./include/linux/device.h:1208 [inline]
>   #3: 0000000085e6ee8d (&dev->mutex){....}, at: usb_disconnect+0x91/0x830
> /drivers/usb/core/hub.c:2190
>   #4: 00000000f0ac3a42 (&dev->mutex){....}, at:
> device_release_driver_internal+0x23/0x4c0 /drivers/base/dd.c:1109
> 5 locks held by kworker/1:1/21:
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> __write_once_size /./include/linux/compiler.h:221 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> arch_atomic64_set /./arch/x86/include/asm/atomic64_64.h:34 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at: atomic64_set
> /./include/asm-generic/atomic-instrumented.h:855 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> atomic_long_set /./include/asm-generic/atomic-long.h:40 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at: set_work_data
> /kernel/workqueue.c:620 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> set_work_pool_and_clear_pending /kernel/workqueue.c:647 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> process_one_work+0x81a/0x1570 /kernel/workqueue.c:2240
>   #1: 00000000e4cc4967 ((work_completion)(&hub->events)){+.+.}, at:
> process_one_work+0x84e/0x1570 /kernel/workqueue.c:2244
>   #2: 000000009fad33ce (&dev->mutex){....}, at: device_lock
> /./include/linux/device.h:1208 [inline]
>   #2: 000000009fad33ce (&dev->mutex){....}, at: hub_event+0x179/0x3550
> /drivers/usb/core/hub.c:5387
>   #3: 0000000054332177 (&dev->mutex){....}, at: device_lock
> /./include/linux/device.h:1208 [inline]
>   #3: 0000000054332177 (&dev->mutex){....}, at: usb_disconnect+0x91/0x830
> /drivers/usb/core/hub.c:2190
>   #4: 0000000024af6192 (&dev->mutex){....}, at:
> device_release_driver_internal+0x23/0x4c0 /drivers/base/dd.c:1109
> 1 lock held by khungtaskd/23:
>   #0: 00000000c34a6907 (rcu_read_lock){....}, at:
> debug_show_all_locks+0x53/0x269 /kernel/locking/lockdep.c:5147
> 5 locks held by kworker/0:2/107:
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> __write_once_size /./include/linux/compiler.h:221 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> arch_atomic64_set /./arch/x86/include/asm/atomic64_64.h:34 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at: atomic64_set
> /./include/asm-generic/atomic-instrumented.h:855 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> atomic_long_set /./include/asm-generic/atomic-long.h:40 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at: set_work_data
> /kernel/workqueue.c:620 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> set_work_pool_and_clear_pending /kernel/workqueue.c:647 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> process_one_work+0x81a/0x1570 /kernel/workqueue.c:2240
>   #1: 00000000123183b4 ((work_completion)(&hub->events)){+.+.}, at:
> process_one_work+0x84e/0x1570 /kernel/workqueue.c:2244
>   #2: 0000000052b6f3e1 (&dev->mutex){....}, at: device_lock
> /./include/linux/device.h:1208 [inline]
>   #2: 0000000052b6f3e1 (&dev->mutex){....}, at: hub_event+0x179/0x3550
> /drivers/usb/core/hub.c:5387
>   #3: 0000000074cd949e (&dev->mutex){....}, at: device_lock
> /./include/linux/device.h:1208 [inline]
>   #3: 0000000074cd949e (&dev->mutex){....}, at: usb_disconnect+0x91/0x830
> /drivers/usb/core/hub.c:2190
>   #4: 000000004b055abd (&dev->mutex){....}, at:
> device_release_driver_internal+0x23/0x4c0 /drivers/base/dd.c:1109
> 5 locks held by kworker/1:2/108:
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> __write_once_size /./include/linux/compiler.h:221 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> arch_atomic64_set /./arch/x86/include/asm/atomic64_64.h:34 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at: atomic64_set
> /./include/asm-generic/atomic-instrumented.h:855 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> atomic_long_set /./include/asm-generic/atomic-long.h:40 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at: set_work_data
> /kernel/workqueue.c:620 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> set_work_pool_and_clear_pending /kernel/workqueue.c:647 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> process_one_work+0x81a/0x1570 /kernel/workqueue.c:2240
>   #1: 00000000e35f89a1 ((work_completion)(&hub->events)){+.+.}, at:
> process_one_work+0x84e/0x1570 /kernel/workqueue.c:2244
>   #2: 00000000b09f111f (&dev->mutex){....}, at: device_lock
> /./include/linux/device.h:1208 [inline]
>   #2: 00000000b09f111f (&dev->mutex){....}, at: hub_event+0x179/0x3550
> /drivers/usb/core/hub.c:5387
>   #3: 000000006b5fbeae (&dev->mutex){....}, at: device_lock
> /./include/linux/device.h:1208 [inline]
>   #3: 000000006b5fbeae (&dev->mutex){....}, at: usb_disconnect+0x91/0x830
> /drivers/usb/core/hub.c:2190
>   #4: 0000000081dcaa24 (&dev->mutex){....}, at:
> device_release_driver_internal+0x23/0x4c0 /drivers/base/dd.c:1109
> 1 lock held by rsyslogd/1609:
>   #0: 00000000d7f3ff94 (&f->f_pos_lock){+.+.}, at: __fdget_pos+0xe3/0x100
> /fs/file.c:801
> 2 locks held by getty/1699:
>   #0: 00000000bc736fb1 (&tty->ldisc_sem){++++}, at:
> tty_ldisc_ref_wait+0x22/0x80 /drivers/tty/tty_ldisc.c:272
>   #1: 0000000014dfa3bf (&ldata->atomic_read_lock){+.+.}, at:
> n_tty_read+0x217/0x1a50 /drivers/tty/n_tty.c:2156
> 2 locks held by getty/1700:
>   #0: 00000000be14d894 (&tty->ldisc_sem){++++}, at:
> tty_ldisc_ref_wait+0x22/0x80 /drivers/tty/tty_ldisc.c:272
>   #1: 00000000ff0e9bac (&ldata->atomic_read_lock){+.+.}, at:
> n_tty_read+0x217/0x1a50 /drivers/tty/n_tty.c:2156
> 2 locks held by getty/1701:
>   #0: 00000000d0e4fddf (&tty->ldisc_sem){++++}, at:
> tty_ldisc_ref_wait+0x22/0x80 /drivers/tty/tty_ldisc.c:272
>   #1: 000000004b19a9d4 (&ldata->atomic_read_lock){+.+.}, at:
> n_tty_read+0x217/0x1a50 /drivers/tty/n_tty.c:2156
> 2 locks held by getty/1702:
>   #0: 00000000c1b6c003 (&tty->ldisc_sem){++++}, at:
> tty_ldisc_ref_wait+0x22/0x80 /drivers/tty/tty_ldisc.c:272
>   #1: 0000000099fff3a4 (&ldata->atomic_read_lock){+.+.}, at:
> n_tty_read+0x217/0x1a50 /drivers/tty/n_tty.c:2156
> 2 locks held by getty/1703:
>   #0: 000000008cc2d327 (&tty->ldisc_sem){++++}, at:
> tty_ldisc_ref_wait+0x22/0x80 /drivers/tty/tty_ldisc.c:272
>   #1: 0000000056f83ac4 (&ldata->atomic_read_lock){+.+.}, at:
> n_tty_read+0x217/0x1a50 /drivers/tty/n_tty.c:2156
> 2 locks held by getty/1704:
>   #0: 000000000eebfa14 (&tty->ldisc_sem){++++}, at:
> tty_ldisc_ref_wait+0x22/0x80 /drivers/tty/tty_ldisc.c:272
>   #1: 00000000a2f569ec (&ldata->atomic_read_lock){+.+.}, at:
> n_tty_read+0x217/0x1a50 /drivers/tty/n_tty.c:2156
> 2 locks held by getty/1705:
>   #0: 0000000055305a29 (&tty->ldisc_sem){++++}, at:
> tty_ldisc_ref_wait+0x22/0x80 /drivers/tty/tty_ldisc.c:272
>   #1: 000000001cc6455d (&ldata->atomic_read_lock){+.+.}, at:
> n_tty_read+0x217/0x1a50 /drivers/tty/n_tty.c:2156
> 5 locks held by kworker/1:0/1743:
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> __write_once_size /./include/linux/compiler.h:221 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> arch_atomic64_set /./arch/x86/include/asm/atomic64_64.h:34 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at: atomic64_set
> /./include/asm-generic/atomic-instrumented.h:855 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> atomic_long_set /./include/asm-generic/atomic-long.h:40 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at: set_work_data
> /kernel/workqueue.c:620 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> set_work_pool_and_clear_pending /kernel/workqueue.c:647 [inline]
>   #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:
> process_one_work+0x81a/0x1570 /kernel/workqueue.c:2240
>   #1: 00000000f376c2ba ((work_completion)(&hub->events)){+.+.}, at:
> process_one_work+0x84e/0x1570 /kernel/workqueue.c:2244
>   #2: 000000007ee3f09e (&dev->mutex){....}, at: device_lock
> /./include/linux/device.h:1208 [inline]
>   #2: 000000007ee3f09e (&dev->mutex){....}, at: hub_event+0x179/0x3550
> /drivers/usb/core/hub.c:5387
>   #3: 00000000250c1adb (&dev->mutex){....}, at: device_lock
> /./include/linux/device.h:1208 [inline]
>   #3: 00000000250c1adb (&dev->mutex){....}, at: usb_disconnect+0x91/0x830
> /drivers/usb/core/hub.c:2190
>   #4: 00000000538ed281 (&dev->mutex){....}, at:
> device_release_driver_internal+0x23/0x4c0 /drivers/base/dd.c:1109
> 5 locks held by kworker/0:1/1745:
>
> =============================================
>
> NMI backtrace for cpu 0
> CPU: 0 PID: 23 Comm: khungtaskd Not tainted 5.2.0-rc6+ #15
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Call Trace:
>   __dump_stack /lib/dump_stack.c:77 [inline]
>   dump_stack+0xca/0x13e /lib/dump_stack.c:113
>   nmi_cpu_backtrace.cold+0x48/0x87 /lib/nmi_backtrace.c:101
>   nmi_trigger_cpumask_backtrace+0x1a6/0x1bd /lib/nmi_backtrace.c:62
>   trigger_all_cpu_backtrace /./include/linux/nmi.h:146 [inline]
>   check_hung_uninterruptible_tasks /kernel/hung_task.c:205 [inline]
>   watchdog+0x989/0xe20 /kernel/hung_task.c:289
>   kthread+0x30b/0x410 /kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 /arch/x86/entry/entry_64.S:352
> Sending NMI from CPU 0 to CPUs 1:
> NMI backtrace for cpu 1 skipped: idling at native_safe_halt
> /./arch/x86/include/asm/irqflags.h:60 [inline]
> NMI backtrace for cpu 1 skipped: idling at arch_safe_halt
> /./arch/x86/include/asm/irqflags.h:103 [inline]
> NMI backtrace for cpu 1 skipped: idling at default_idle+0x28/0x2b0
> /arch/x86/kernel/process.c:580
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> syzbot can test patches for this bug, for details see:
> https://goo.gl/tpsmEJ#testing-patches

#syz dup: INFO: task hung in chaoskey_disconnect
