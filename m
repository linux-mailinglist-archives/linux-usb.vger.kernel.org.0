Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D154B1FF16F
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jun 2020 14:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728600AbgFRMOI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Jun 2020 08:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728293AbgFRMN6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Jun 2020 08:13:58 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30665C0613EE
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2020 05:13:57 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k1so2370990pls.2
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2020 05:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x0lgrdcopjaVOctmG20zbnI2jrhQsvZ4Lfg8Y2MC+Fk=;
        b=lcbKheFdrG7gdM/PYs4TnHXFl+nO8cgkm5dutjgszqKyEVUMgIOddhJtaNmFe26XuT
         LA8XdcuZ3cC3FxTbyMrfAJ8W/se76kiPZOys0NbmiJmHV2kKDDb4d9AL0M0mxgb6orqZ
         +vDWIS2A60W6leyq2XBZSkQLHO026kbvVL745yPJ2SJiaD8txdWIpsYoNuy1TJ+EiOos
         htXuZgZPI9Yen99q2XdBEvNE/lcJU9OP+12Z2TY1soFpCmOcKB/K0JlbKt84QTg9Q++l
         IOMcRB7R7/xjWvllIhVw4tIef4TD0XdBkLsdLFFxTOlT06Z6Owe+t41zi5g2yozQxLfB
         3dnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x0lgrdcopjaVOctmG20zbnI2jrhQsvZ4Lfg8Y2MC+Fk=;
        b=dcUT0fbME9MPAxD3S3YuRJNQjHX8+NBiE573GjQkTBAejDYHke2hHas+T72vhBR0IJ
         64V1uMJYKPRYK9eT74wlsQwoqWz1E/QI5TzOO+6wV9bqPgVhQCEqMR8ia9Y+3OXlK5zQ
         /gdhJv8id/yTVpvSdTo+W0MzL75e1Ul8qQ/bHg16wRTGljjLv+YJbDUYbTvtbumCqIwP
         jAhL9/UyKksN8KWWay2hGZFL7Ddyh7/ieHGbvXWrLPXPGKekKJxLKZwp3YhNqj/UTTFe
         5jQufsuSz1oO0P8eegI2T340ixoSkyXTR2pWCOQx6T8aHoQyNpV/HS0Il8NJDKqAlOA7
         Nb4g==
X-Gm-Message-State: AOAM532a6LbkOXkoGopY44Rp78bBdLnHWzPbAgXDW38QueTiq7EDgPDV
        I4N5xGaQEmTXEx39C/2C8I/bfHjsp5TTKjtA3IIWSw==
X-Google-Smtp-Source: ABdhPJzD/7OWnsEikEVKDWmHggA5gH/99eYyE6dvm0IdeUcQsiq9TWKRuNim6GrDsqPF8kVYTdg/paTB16BZ8XCVGs8=
X-Received: by 2002:a17:90b:1244:: with SMTP id gx4mr3921767pjb.136.1592482436360;
 Thu, 18 Jun 2020 05:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000cdaa560596acbc4e@google.com>
In-Reply-To: <000000000000cdaa560596acbc4e@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 18 Jun 2020 14:13:45 +0200
Message-ID: <CAAeHK+wFE_=KLkekd02Esby5Tdb00xNR=3DBVP1wETiNJz_Mng@mail.gmail.com>
Subject: Re: INFO: task hung in chaoskey_disconnect
To:     syzbot <syzbot+f41c4f7c6d8b0b778780@syzkaller.appspotmail.com>
Cc:     alexandre.belloni@bootlin.com, Arnd Bergmann <arnd@arndb.de>,
        b.zolnierkie@samsung.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-crypto@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>, lvivier@redhat.com,
        mchehab+samsung@kernel.org, mpm@selenic.com, swboyd@chromium.org,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 6, 2019 at 1:32 PM syzbot
<syzbot+f41c4f7c6d8b0b778780@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    b1aa9d83 usb: raw: add raw-gadget interface
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=16ae2adce00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=79de80330003b5f7
> dashboard link: https://syzkaller.appspot.com/bug?extid=f41c4f7c6d8b0b778780
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10248158e00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16afbf7ce00000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+f41c4f7c6d8b0b778780@syzkaller.appspotmail.com
>
> INFO: task kworker/0:2:101 blocked for more than 143 seconds.
>        Not tainted 5.4.0-rc6+ #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> kworker/0:2     D25552   101      2 0x80004000
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>   schedule+0xca/0x250 kernel/sched/core.c:4136
>   schedule_timeout+0x682/0xb20 kernel/time/timer.c:1871
>   do_wait_for_common kernel/sched/completion.c:83 [inline]
>   __wait_for_common kernel/sched/completion.c:104 [inline]
>   wait_for_common kernel/sched/completion.c:115 [inline]
>   wait_for_completion+0x26f/0x3c0 kernel/sched/completion.c:136
>   kthread_stop+0x10c/0x610 kernel/kthread.c:559
>   hwrng_unregister+0x190/0x210 drivers/char/hw_random/core.c:538
>   chaoskey_disconnect+0x1b2/0x200 drivers/usb/misc/chaoskey.c:232
>   usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
>   __device_release_driver drivers/base/dd.c:1134 [inline]
>   device_release_driver_internal+0x42f/0x500 drivers/base/dd.c:1165
>   bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:532
>   device_del+0x420/0xb20 drivers/base/core.c:2376
>   usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
>   usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2200
>   hub_port_connect drivers/usb/core/hub.c:5035 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
>   port_event drivers/usb/core/hub.c:5470 [inline]
>   hub_event+0x16f2/0x3800 drivers/usb/core/hub.c:5552
>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>   process_scheduled_works kernel/workqueue.c:2331 [inline]
>   worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> INFO: task kworker/1:2:102 blocked for more than 143 seconds.
>        Not tainted 5.4.0-rc6+ #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> kworker/1:2     D25608   102      2 0x80004000
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>   schedule+0xca/0x250 kernel/sched/core.c:4136
>   schedule_timeout+0x682/0xb20 kernel/time/timer.c:1871
>   do_wait_for_common kernel/sched/completion.c:83 [inline]
>   __wait_for_common kernel/sched/completion.c:104 [inline]
>   wait_for_common kernel/sched/completion.c:115 [inline]
>   wait_for_completion+0x26f/0x3c0 kernel/sched/completion.c:136
>   kthread_stop+0x10c/0x610 kernel/kthread.c:559
>   hwrng_unregister+0x190/0x210 drivers/char/hw_random/core.c:538
>   chaoskey_disconnect+0x1b2/0x200 drivers/usb/misc/chaoskey.c:232
>   usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
>   __device_release_driver drivers/base/dd.c:1134 [inline]
>   device_release_driver_internal+0x42f/0x500 drivers/base/dd.c:1165
>   bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:532
>   device_del+0x420/0xb20 drivers/base/core.c:2376
>   usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
>   usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2200
>   hub_port_connect drivers/usb/core/hub.c:5035 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
>   port_event drivers/usb/core/hub.c:5470 [inline]
>   hub_event+0x16f2/0x3800 drivers/usb/core/hub.c:5552
>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>   process_scheduled_works kernel/workqueue.c:2331 [inline]
>   worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> INFO: task kworker/1:0:1732 blocked for more than 143 seconds.
>        Not tainted 5.4.0-rc6+ #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> kworker/1:0     D26016  1732      2 0x80004000
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>   schedule+0xca/0x250 kernel/sched/core.c:4136
>   schedule_timeout+0x682/0xb20 kernel/time/timer.c:1871
>   do_wait_for_common kernel/sched/completion.c:83 [inline]
>   __wait_for_common kernel/sched/completion.c:104 [inline]
>   wait_for_common kernel/sched/completion.c:115 [inline]
>   wait_for_completion+0x26f/0x3c0 kernel/sched/completion.c:136
>   kthread_stop+0x10c/0x610 kernel/kthread.c:559
>   hwrng_unregister+0x190/0x210 drivers/char/hw_random/core.c:538
>   chaoskey_disconnect+0x1b2/0x200 drivers/usb/misc/chaoskey.c:232
>   usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
>   __device_release_driver drivers/base/dd.c:1134 [inline]
>   device_release_driver_internal+0x42f/0x500 drivers/base/dd.c:1165
>   bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:532
>   device_del+0x420/0xb20 drivers/base/core.c:2376
>   usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
>   usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2200
>   hub_port_connect drivers/usb/core/hub.c:5035 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
>   port_event drivers/usb/core/hub.c:5470 [inline]
>   hub_event+0x16f2/0x3800 drivers/usb/core/hub.c:5552
>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>   process_scheduled_works kernel/workqueue.c:2331 [inline]
>   worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> INFO: task kworker/1:3:1733 blocked for more than 144 seconds.
>        Not tainted 5.4.0-rc6+ #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> kworker/1:3     D26016  1733      2 0x80004000
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>   schedule+0xca/0x250 kernel/sched/core.c:4136
>   schedule_timeout+0x682/0xb20 kernel/time/timer.c:1871
>   do_wait_for_common kernel/sched/completion.c:83 [inline]
>   __wait_for_common kernel/sched/completion.c:104 [inline]
>   wait_for_common kernel/sched/completion.c:115 [inline]
>   wait_for_completion+0x26f/0x3c0 kernel/sched/completion.c:136
>   kthread_stop+0x10c/0x610 kernel/kthread.c:559
>   hwrng_unregister+0x190/0x210 drivers/char/hw_random/core.c:538
>   chaoskey_disconnect+0x1b2/0x200 drivers/usb/misc/chaoskey.c:232
>   usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
>   __device_release_driver drivers/base/dd.c:1134 [inline]
>   device_release_driver_internal+0x42f/0x500 drivers/base/dd.c:1165
>   bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:532
>   device_del+0x420/0xb20 drivers/base/core.c:2376
>   usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
>   usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2200
>   hub_port_connect drivers/usb/core/hub.c:5035 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
>   port_event drivers/usb/core/hub.c:5470 [inline]
>   hub_event+0x16f2/0x3800 drivers/usb/core/hub.c:5552
>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>   process_scheduled_works kernel/workqueue.c:2331 [inline]
>   worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> INFO: task kworker/1:4:1735 blocked for more than 144 seconds.
>        Not tainted 5.4.0-rc6+ #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> kworker/1:4     D25760  1735      2 0x80004000
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>   schedule+0xca/0x250 kernel/sched/core.c:4136
>   schedule_timeout+0x682/0xb20 kernel/time/timer.c:1871
>   do_wait_for_common kernel/sched/completion.c:83 [inline]
>   __wait_for_common kernel/sched/completion.c:104 [inline]
>   wait_for_common kernel/sched/completion.c:115 [inline]
>   wait_for_completion+0x26f/0x3c0 kernel/sched/completion.c:136
>   kthread_stop+0x10c/0x610 kernel/kthread.c:559
>   hwrng_unregister+0x190/0x210 drivers/char/hw_random/core.c:538
>   chaoskey_disconnect+0x1b2/0x200 drivers/usb/misc/chaoskey.c:232
>   usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
>   __device_release_driver drivers/base/dd.c:1134 [inline]
>   device_release_driver_internal+0x42f/0x500 drivers/base/dd.c:1165
>   bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:532
>   device_del+0x420/0xb20 drivers/base/core.c:2376
>   usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
>   usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2200
>   hub_port_connect drivers/usb/core/hub.c:5035 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
>   port_event drivers/usb/core/hub.c:5470 [inline]
>   hub_event+0x16f2/0x3800 drivers/usb/core/hub.c:5552
>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>   process_scheduled_works kernel/workqueue.c:2331 [inline]
>   worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> Showing all locks held in the system:
> 5 locks held by kworker/1:1/22:
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> __write_once_size include/linux/compiler.h:226 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at: atomic64_set
> include/asm-generic/atomic-instrumented.h:855 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> atomic_long_set include/asm-generic/atomic-long.h:40 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at: set_work_data
> kernel/workqueue.c:620 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> set_work_pool_and_clear_pending kernel/workqueue.c:647 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> process_one_work+0x827/0x1530 kernel/workqueue.c:2240
>   #1: ffff8881d932fdd0 ((work_completion)(&hub->events)){+.+.}, at:
> process_one_work+0x85b/0x1530 kernel/workqueue.c:2244
>   #2: ffff8881d515c200 (&dev->mutex){....}, at: device_lock
> include/linux/device.h:1462 [inline]
>   #2: ffff8881d515c200 (&dev->mutex){....}, at: hub_event+0x1b2/0x3800
> drivers/usb/core/hub.c:5498
>   #3: ffff8881cb4fd200 (&dev->mutex){....}, at: device_lock
> include/linux/device.h:1462 [inline]
>   #3: ffff8881cb4fd200 (&dev->mutex){....}, at: usb_disconnect+0x91/0x8d0
> drivers/usb/core/hub.c:2191
>   #4: ffff8881cb4fe190 (&dev->mutex){....}, at:
> device_release_driver_internal+0x23/0x500 drivers/base/dd.c:1162
> 1 lock held by khungtaskd/23:
>   #0: ffffffff86cfe8a0 (rcu_read_lock){....}, at:
> debug_show_all_locks+0x53/0x269 kernel/locking/lockdep.c:5335
> 5 locks held by kworker/0:2/101:
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> __write_once_size include/linux/compiler.h:226 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at: atomic64_set
> include/asm-generic/atomic-instrumented.h:855 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> atomic_long_set include/asm-generic/atomic-long.h:40 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at: set_work_data
> kernel/workqueue.c:620 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> set_work_pool_and_clear_pending kernel/workqueue.c:647 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> process_one_work+0x827/0x1530 kernel/workqueue.c:2240
>   #1: ffff8881d536fdd0 ((work_completion)(&hub->events)){+.+.}, at:
> process_one_work+0x85b/0x1530 kernel/workqueue.c:2244
>   #2: ffff8881d50a1200 (&dev->mutex){....}, at: device_lock
> include/linux/device.h:1462 [inline]
>   #2: ffff8881d50a1200 (&dev->mutex){....}, at: hub_event+0x1b2/0x3800
> drivers/usb/core/hub.c:5498
>   #3: ffff8881cffb7200 (&dev->mutex){....}, at: device_lock
> include/linux/device.h:1462 [inline]
>   #3: ffff8881cffb7200 (&dev->mutex){....}, at: usb_disconnect+0x91/0x8d0
> drivers/usb/core/hub.c:2191
>   #4: ffff8881cf220190 (&dev->mutex){....}, at:
> device_release_driver_internal+0x23/0x500 drivers/base/dd.c:1162
> 5 locks held by kworker/1:2/102:
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> __write_once_size include/linux/compiler.h:226 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at: atomic64_set
> include/asm-generic/atomic-instrumented.h:855 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> atomic_long_set include/asm-generic/atomic-long.h:40 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at: set_work_data
> kernel/workqueue.c:620 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> set_work_pool_and_clear_pending kernel/workqueue.c:647 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> process_one_work+0x827/0x1530 kernel/workqueue.c:2240
>   #1: ffff8881d53d7dd0 ((work_completion)(&hub->events)){+.+.}, at:
> process_one_work+0x85b/0x1530 kernel/workqueue.c:2244
>   #2: ffff8881d50d0200 (&dev->mutex){....}, at: device_lock
> include/linux/device.h:1462 [inline]
>   #2: ffff8881d50d0200 (&dev->mutex){....}, at: hub_event+0x1b2/0x3800
> drivers/usb/core/hub.c:5498
>   #3: ffff8881cea1b200 (&dev->mutex){....}, at: device_lock
> include/linux/device.h:1462 [inline]
>   #3: ffff8881cea1b200 (&dev->mutex){....}, at: usb_disconnect+0x91/0x8d0
> drivers/usb/core/hub.c:2191
>   #4: ffff8881cea1c190 (&dev->mutex){....}, at:
> device_release_driver_internal+0x23/0x500 drivers/base/dd.c:1162
> 1 lock held by rsyslogd/1599:
>   #0: ffff8881d3aaad60 (&f->f_pos_lock){+.+.}, at: __fdget_pos+0xe3/0x100
> fs/file.c:801
> 2 locks held by getty/1690:
>   #0: ffff8881d1458090 (&tty->ldisc_sem){++++}, at:
> tty_ldisc_ref_wait+0x22/0x80 drivers/tty/tty_ldisc.c:272
>   #1: ffffc900004492e0 (&ldata->atomic_read_lock){+.+.}, at:
> n_tty_read+0x223/0x1ae0 drivers/tty/n_tty.c:2156
> 2 locks held by getty/1691:
>   #0: ffff8881d1569090 (&tty->ldisc_sem){++++}, at:
> tty_ldisc_ref_wait+0x22/0x80 drivers/tty/tty_ldisc.c:272
>   #1: ffffc900004692e0 (&ldata->atomic_read_lock){+.+.}, at:
> n_tty_read+0x223/0x1ae0 drivers/tty/n_tty.c:2156
> 2 locks held by getty/1692:
>   #0: ffff8881d1430090 (&tty->ldisc_sem){++++}, at:
> tty_ldisc_ref_wait+0x22/0x80 drivers/tty/tty_ldisc.c:272
>   #1: ffffc9000044d2e0 (&ldata->atomic_read_lock){+.+.}, at:
> n_tty_read+0x223/0x1ae0 drivers/tty/n_tty.c:2156
> 2 locks held by getty/1693:
>   #0: ffff8881d1436090 (&tty->ldisc_sem){++++}, at:
> tty_ldisc_ref_wait+0x22/0x80 drivers/tty/tty_ldisc.c:272
>   #1: ffffc900004552e0 (&ldata->atomic_read_lock){+.+.}, at:
> n_tty_read+0x223/0x1ae0 drivers/tty/n_tty.c:2156
> 2 locks held by getty/1694:
>   #0: ffff8881d145e090 (&tty->ldisc_sem){++++}, at:
> tty_ldisc_ref_wait+0x22/0x80 drivers/tty/tty_ldisc.c:272
>   #1: ffffc9000045d2e0 (&ldata->atomic_read_lock){+.+.}, at:
> n_tty_read+0x223/0x1ae0 drivers/tty/n_tty.c:2156
> 2 locks held by getty/1695:
>   #0: ffff8881d156a090 (&tty->ldisc_sem){++++}, at:
> tty_ldisc_ref_wait+0x22/0x80 drivers/tty/tty_ldisc.c:272
>   #1: ffffc9000046d2e0 (&ldata->atomic_read_lock){+.+.}, at:
> n_tty_read+0x223/0x1ae0 drivers/tty/n_tty.c:2156
> 2 locks held by getty/1696:
>   #0: ffff8881d2225090 (&tty->ldisc_sem){++++}, at:
> tty_ldisc_ref_wait+0x22/0x80 drivers/tty/tty_ldisc.c:272
>   #1: ffffc900004352e0 (&ldata->atomic_read_lock){+.+.}, at:
> n_tty_read+0x223/0x1ae0 drivers/tty/n_tty.c:2156
> 5 locks held by kworker/1:0/1732:
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> __write_once_size include/linux/compiler.h:226 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at: atomic64_set
> include/asm-generic/atomic-instrumented.h:855 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> atomic_long_set include/asm-generic/atomic-long.h:40 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at: set_work_data
> kernel/workqueue.c:620 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> set_work_pool_and_clear_pending kernel/workqueue.c:647 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> process_one_work+0x827/0x1530 kernel/workqueue.c:2240
>   #1: ffff8881cfa67dd0 ((work_completion)(&hub->events)){+.+.}, at:
> process_one_work+0x85b/0x1530 kernel/workqueue.c:2244
>   #2: ffff8881d512d200 (&dev->mutex){....}, at: device_lock
> include/linux/device.h:1462 [inline]
>   #2: ffff8881d512d200 (&dev->mutex){....}, at: hub_event+0x1b2/0x3800
> drivers/usb/core/hub.c:5498
>   #3: ffff8881cf153200 (&dev->mutex){....}, at: device_lock
> include/linux/device.h:1462 [inline]
>   #3: ffff8881cf153200 (&dev->mutex){....}, at: usb_disconnect+0x91/0x8d0
> drivers/usb/core/hub.c:2191
>   #4: ffff8881cf156190 (&dev->mutex){....}, at:
> device_release_driver_internal+0x23/0x500 drivers/base/dd.c:1162
> 5 locks held by kworker/1:3/1733:
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> __write_once_size include/linux/compiler.h:226 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at: atomic64_set
> include/asm-generic/atomic-instrumented.h:855 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> atomic_long_set include/asm-generic/atomic-long.h:40 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at: set_work_data
> kernel/workqueue.c:620 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> set_work_pool_and_clear_pending kernel/workqueue.c:647 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> process_one_work+0x827/0x1530 kernel/workqueue.c:2240
>   #1: ffff8881d024fdd0 ((work_completion)(&hub->events)){+.+.}, at:
> process_one_work+0x85b/0x1530 kernel/workqueue.c:2244
>   #2: ffff8881d50d7200 (&dev->mutex){....}, at: device_lock
> include/linux/device.h:1462 [inline]
>   #2: ffff8881d50d7200 (&dev->mutex){....}, at: hub_event+0x1b2/0x3800
> drivers/usb/core/hub.c:5498
>   #3: ffff8881c5fe9200 (&dev->mutex){....}, at: device_lock
> include/linux/device.h:1462 [inline]
>   #3: ffff8881c5fe9200 (&dev->mutex){....}, at: usb_disconnect+0x91/0x8d0
> drivers/usb/core/hub.c:2191
>   #4: ffff8881c5feb190 (&dev->mutex){....}, at:
> device_release_driver_internal+0x23/0x500 drivers/base/dd.c:1162
> 5 locks held by kworker/1:4/1735:
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> __write_once_size include/linux/compiler.h:226 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at: atomic64_set
> include/asm-generic/atomic-instrumented.h:855 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> atomic_long_set include/asm-generic/atomic-long.h:40 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at: set_work_data
> kernel/workqueue.c:620 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> set_work_pool_and_clear_pending kernel/workqueue.c:647 [inline]
>   #0: ffff8881d8c82d28 ((wq_completion)usb_hub_wq){+.+.}, at:
> process_one_work+0x827/0x1530 kernel/workqueue.c:2240
>   #1: ffff8881cfaa7dd0 ((work_completion)(&hub->events)){+.+.}, at:
> process_one_work+0x85b/0x1530 kernel/workqueue.c:2244
>   #2: ffff8881d510e200 (&dev->mutex){....}, at: device_lock
> include/linux/device.h:1462 [inline]
>   #2: ffff8881d510e200 (&dev->mutex){....}, at: hub_event+0x1b2/0x3800
> drivers/usb/core/hub.c:5498
>   #3: ffff8881cf982200 (&dev->mutex){....}, at: device_lock
> include/linux/device.h:1462 [inline]
>   #3: ffff8881cf982200 (&dev->mutex){....}, at: usb_disconnect+0x91/0x8d0
> drivers/usb/core/hub.c:2191
>   #4: ffff8881cf400190 (&dev->mutex){....}, at:
> device_release_driver_internal+0x23/0x500 drivers/base/dd.c:1162
>
> =============================================
>
> NMI backtrace for cpu 0
> CPU: 0 PID: 23 Comm: khungtaskd Not tainted 5.4.0-rc6+ #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0xca/0x13e lib/dump_stack.c:113
>   nmi_cpu_backtrace.cold+0x55/0x96 lib/nmi_backtrace.c:101
>   nmi_trigger_cpumask_backtrace+0x1b0/0x1c7 lib/nmi_backtrace.c:62
>   trigger_all_cpu_backtrace include/linux/nmi.h:146 [inline]
>   check_hung_uninterruptible_tasks kernel/hung_task.c:205 [inline]
>   watchdog+0x9a4/0xe50 kernel/hung_task.c:289
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> Sending NMI from CPU 0 to CPUs 1:
> NMI backtrace for cpu 1 skipped: idling at native_safe_halt
> arch/x86/include/asm/irqflags.h:60 [inline]
> NMI backtrace for cpu 1 skipped: idling at arch_safe_halt
> arch/x86/include/asm/irqflags.h:103 [inline]
> NMI backtrace for cpu 1 skipped: idling at default_idle+0x28/0x2e0
> arch/x86/kernel/process.c:580
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

Closing old USB bugs that haven't happened for a long time.

#syz invalid
