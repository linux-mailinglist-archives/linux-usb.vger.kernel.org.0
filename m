Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E06BA7189B
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2019 14:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389964AbfGWMsb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jul 2019 08:48:31 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:53075 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389895AbfGWMsJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Jul 2019 08:48:09 -0400
Received: by mail-io1-f69.google.com with SMTP id p12so47028837iog.19
        for <linux-usb@vger.kernel.org>; Tue, 23 Jul 2019 05:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=WX8mXrwL9YnlGxhS0vNPmZsDMJDdSwdsae3+5KoJhw4=;
        b=ZS5Li8TeN0f4jUoGFMx0ju7a857+BxYJHKY1amdPu2wXlUp1ZByhxsaZaKfvO/pSci
         DS9eUpORJduGqu2o8aysQxGkGvJ+fKCrvCZPnDiyNx84ogmaz1IPlHCBwU63I/zNRxdi
         Sak2VFU/FaOjyJ6fEyVyoe+h8MfAYqkRc8sdyoyLNouGlSnc6VmPzwngQdJvdcDLq2x9
         sd8NfU2zqAtnxgddU7pTiw/6IiHIZTxDeiTKb2FAXltXlxmSj9kylqI1tFRBDplujGJ3
         +Alm/wxPP4shl9NKblopwJxTazHe7rzlwQq26kaorJzPTHaWZWr5hDJvA39UGDuN+Dym
         o+rQ==
X-Gm-Message-State: APjAAAXpaAa+9PrIHFmcILy6j3i86I+3R9tkhfRNcIoDczgFK/STEu+t
        bKtA9cFcjx5znD/62JwNM94qQd2YPUKkg+m7aLVTda1pjhJv
X-Google-Smtp-Source: APXvYqxpmRTm1Q/eLgar1kQxpMbltpDcfrexteHauNl6iqi5+sJBwkZZ7lKROTzwaUT5ASIZSEZsuPjD74hWprlZLSMaB2qyAmVU
MIME-Version: 1.0
X-Received: by 2002:a5e:8a46:: with SMTP id o6mr38159236iom.36.1563886088591;
 Tue, 23 Jul 2019 05:48:08 -0700 (PDT)
Date:   Tue, 23 Jul 2019 05:48:08 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c7a7e4058e589ad1@google.com>
Subject: INFO: task hung in hwrng_unregister
From:   syzbot <syzbot+823cb2bdae0c63b2cb9f@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    6a3599ce usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=1266ca64600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
dashboard link: https://syzkaller.appspot.com/bug?extid=823cb2bdae0c63b2cb9f
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=143d46f4600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1789853fa00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+823cb2bdae0c63b2cb9f@syzkaller.appspotmail.com

INFO: task kworker/0:0:5 blocked for more than 143 seconds.
       Not tainted 5.2.0-rc6+ #15
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
kworker/0:0     D26088     5      2 0x80004000
Workqueue: usb_hub_wq hub_event
Call Trace:
  schedule+0x96/0x240 /kernel/sched/core.c:3509
  schedule_timeout+0x682/0xb20 /kernel/time/timer.c:1783
  do_wait_for_common /kernel/sched/completion.c:83 [inline]
  __wait_for_common /kernel/sched/completion.c:104 [inline]
  wait_for_common /kernel/sched/completion.c:115 [inline]
  wait_for_completion+0x26f/0x3c0 /kernel/sched/completion.c:136
  kthread_stop+0xe6/0x5a0 /kernel/kthread.c:559
  hwrng_unregister+0x190/0x210 /drivers/char/hw_random/core.c:535
  chaoskey_disconnect+0x1b2/0x200 /drivers/usb/misc/chaoskey.c:231
  usb_unbind_interface+0x1bd/0x8a0 /drivers/usb/core/driver.c:423
  __device_release_driver /drivers/base/dd.c:1081 [inline]
  device_release_driver_internal+0x404/0x4c0 /drivers/base/dd.c:1112
  bus_remove_device+0x2dc/0x4a0 /drivers/base/bus.c:556
  device_del+0x460/0xb80 /drivers/base/core.c:2274
  usb_disable_device+0x211/0x690 /drivers/usb/core/message.c:1237
  usb_disconnect+0x284/0x830 /drivers/usb/core/hub.c:2199
  hub_port_connect /drivers/usb/core/hub.c:4949 [inline]
  hub_port_connect_change /drivers/usb/core/hub.c:5213 [inline]
  port_event /drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x13bd/0x3550 /drivers/usb/core/hub.c:5441
  process_one_work+0x905/0x1570 /kernel/workqueue.c:2269
  process_scheduled_works /kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 /kernel/workqueue.c:2417
  kthread+0x30b/0x410 /kernel/kthread.c:255
  ret_from_fork+0x24/0x30 /arch/x86/entry/entry_64.S:352
INFO: task kworker/1:1:21 blocked for more than 143 seconds.
       Not tainted 5.2.0-rc6+ #15
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
kworker/1:1     D25576    21      2 0x80004000
Workqueue: usb_hub_wq hub_event
Call Trace:
  schedule+0x96/0x240 /kernel/sched/core.c:3509
  schedule_timeout+0x682/0xb20 /kernel/time/timer.c:1783
  do_wait_for_common /kernel/sched/completion.c:83 [inline]
  __wait_for_common /kernel/sched/completion.c:104 [inline]
  wait_for_common /kernel/sched/completion.c:115 [inline]
  wait_for_completion+0x26f/0x3c0 /kernel/sched/completion.c:136
  kthread_stop+0xe6/0x5a0 /kernel/kthread.c:559
  hwrng_unregister+0x190/0x210 /drivers/char/hw_random/core.c:535
  chaoskey_disconnect+0x1b2/0x200 /drivers/usb/misc/chaoskey.c:231
  usb_unbind_interface+0x1bd/0x8a0 /drivers/usb/core/driver.c:423
  __device_release_driver /drivers/base/dd.c:1081 [inline]
  device_release_driver_internal+0x404/0x4c0 /drivers/base/dd.c:1112
  bus_remove_device+0x2dc/0x4a0 /drivers/base/bus.c:556
  device_del+0x460/0xb80 /drivers/base/core.c:2274
  usb_disable_device+0x211/0x690 /drivers/usb/core/message.c:1237
  usb_disconnect+0x284/0x830 /drivers/usb/core/hub.c:2199
  hub_port_connect /drivers/usb/core/hub.c:4949 [inline]
  hub_port_connect_change /drivers/usb/core/hub.c:5213 [inline]
  port_event /drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x13bd/0x3550 /drivers/usb/core/hub.c:5441
  process_one_work+0x905/0x1570 /kernel/workqueue.c:2269
  process_scheduled_works /kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 /kernel/workqueue.c:2417
  kthread+0x30b/0x410 /kernel/kthread.c:255
  ret_from_fork+0x24/0x30 /arch/x86/entry/entry_64.S:352
INFO: task kworker/0:2:107 blocked for more than 143 seconds.
       Not tainted 5.2.0-rc6+ #15
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
kworker/0:2     D25688   107      2 0x80004000
Workqueue: usb_hub_wq hub_event
Call Trace:
  schedule+0x96/0x240 /kernel/sched/core.c:3509
  schedule_timeout+0x682/0xb20 /kernel/time/timer.c:1783
  do_wait_for_common /kernel/sched/completion.c:83 [inline]
  __wait_for_common /kernel/sched/completion.c:104 [inline]
  wait_for_common /kernel/sched/completion.c:115 [inline]
  wait_for_completion+0x26f/0x3c0 /kernel/sched/completion.c:136
  kthread_stop+0xe6/0x5a0 /kernel/kthread.c:559
  hwrng_unregister+0x190/0x210 /drivers/char/hw_random/core.c:535
  chaoskey_disconnect+0x1b2/0x200 /drivers/usb/misc/chaoskey.c:231
  usb_unbind_interface+0x1bd/0x8a0 /drivers/usb/core/driver.c:423
  __device_release_driver /drivers/base/dd.c:1081 [inline]
  device_release_driver_internal+0x404/0x4c0 /drivers/base/dd.c:1112
  bus_remove_device+0x2dc/0x4a0 /drivers/base/bus.c:556
  device_del+0x460/0xb80 /drivers/base/core.c:2274
  usb_disable_device+0x211/0x690 /drivers/usb/core/message.c:1237
  usb_disconnect+0x284/0x830 /drivers/usb/core/hub.c:2199
  hub_port_connect /drivers/usb/core/hub.c:4949 [inline]
  hub_port_connect_change /drivers/usb/core/hub.c:5213 [inline]
  port_event /drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x13bd/0x3550 /drivers/usb/core/hub.c:5441
  process_one_work+0x905/0x1570 /kernel/workqueue.c:2269
  process_scheduled_works /kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 /kernel/workqueue.c:2417
  kthread+0x30b/0x410 /kernel/kthread.c:255
  ret_from_fork+0x24/0x30 /arch/x86/entry/entry_64.S:352
INFO: task kworker/1:2:108 blocked for more than 144 seconds.
       Not tainted 5.2.0-rc6+ #15
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
kworker/1:2     D26088   108      2 0x80004000
Workqueue: usb_hub_wq hub_event
Call Trace:
  schedule+0x96/0x240 /kernel/sched/core.c:3509
  schedule_timeout+0x682/0xb20 /kernel/time/timer.c:1783
  do_wait_for_common /kernel/sched/completion.c:83 [inline]
  __wait_for_common /kernel/sched/completion.c:104 [inline]
  wait_for_common /kernel/sched/completion.c:115 [inline]
  wait_for_completion+0x26f/0x3c0 /kernel/sched/completion.c:136
  kthread_stop+0xe6/0x5a0 /kernel/kthread.c:559
  hwrng_unregister+0x190/0x210 /drivers/char/hw_random/core.c:535
  chaoskey_disconnect+0x1b2/0x200 /drivers/usb/misc/chaoskey.c:231
  usb_unbind_interface+0x1bd/0x8a0 /drivers/usb/core/driver.c:423
  __device_release_driver /drivers/base/dd.c:1081 [inline]
  device_release_driver_internal+0x404/0x4c0 /drivers/base/dd.c:1112
  bus_remove_device+0x2dc/0x4a0 /drivers/base/bus.c:556
  device_del+0x460/0xb80 /drivers/base/core.c:2274
  usb_disable_device+0x211/0x690 /drivers/usb/core/message.c:1237
  usb_disconnect+0x284/0x830 /drivers/usb/core/hub.c:2199
  hub_port_connect /drivers/usb/core/hub.c:4949 [inline]
  hub_port_connect_change /drivers/usb/core/hub.c:5213 [inline]
  port_event /drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x13bd/0x3550 /drivers/usb/core/hub.c:5441
  process_one_work+0x905/0x1570 /kernel/workqueue.c:2269
  process_scheduled_works /kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 /kernel/workqueue.c:2417
  kthread+0x30b/0x410 /kernel/kthread.c:255
  ret_from_fork+0x24/0x30 /arch/x86/entry/entry_64.S:352
INFO: task kworker/1:0:1743 blocked for more than 144 seconds.
       Not tainted 5.2.0-rc6+ #15
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
kworker/1:0     D26088  1743      2 0x80004000
Workqueue: usb_hub_wq hub_event
Call Trace:
  schedule+0x96/0x240 /kernel/sched/core.c:3509
  schedule_timeout+0x682/0xb20 /kernel/time/timer.c:1783
  do_wait_for_common /kernel/sched/completion.c:83 [inline]
  __wait_for_common /kernel/sched/completion.c:104 [inline]
  wait_for_common /kernel/sched/completion.c:115 [inline]
  wait_for_completion+0x26f/0x3c0 /kernel/sched/completion.c:136
  kthread_stop+0xe6/0x5a0 /kernel/kthread.c:559
  hwrng_unregister+0x190/0x210 /drivers/char/hw_random/core.c:535
  chaoskey_disconnect+0x1b2/0x200 /drivers/usb/misc/chaoskey.c:231
  usb_unbind_interface+0x1bd/0x8a0 /drivers/usb/core/driver.c:423
  __device_release_driver /drivers/base/dd.c:1081 [inline]
  device_release_driver_internal+0x404/0x4c0 /drivers/base/dd.c:1112
  bus_remove_device+0x2dc/0x4a0 /drivers/base/bus.c:556
  device_del+0x460/0xb80 /drivers/base/core.c:2274
  usb_disable_device+0x211/0x690 /drivers/usb/core/message.c:1237
  usb_disconnect+0x284/0x830 /drivers/usb/core/hub.c:2199
  hub_port_connect /drivers/usb/core/hub.c:4949 [inline]
  hub_port_connect_change /drivers/usb/core/hub.c:5213 [inline]
  port_event /drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x13bd/0x3550 /drivers/usb/core/hub.c:5441
  process_one_work+0x905/0x1570 /kernel/workqueue.c:2269
  process_scheduled_works /kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 /kernel/workqueue.c:2417
  kthread+0x30b/0x410 /kernel/kthread.c:255
  ret_from_fork+0x24/0x30 /arch/x86/entry/entry_64.S:352

Showing all locks held in the system:
5 locks held by kworker/0:0/5:
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
__write_once_size /./include/linux/compiler.h:221 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
arch_atomic64_set /./arch/x86/include/asm/atomic64_64.h:34 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at: atomic64_set  
/./include/asm-generic/atomic-instrumented.h:855 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
atomic_long_set /./include/asm-generic/atomic-long.h:40 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at: set_work_data  
/kernel/workqueue.c:620 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
set_work_pool_and_clear_pending /kernel/workqueue.c:647 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
process_one_work+0x81a/0x1570 /kernel/workqueue.c:2240
  #1: 00000000c0e8b754 ((work_completion)(&hub->events)){+.+.}, at:  
process_one_work+0x84e/0x1570 /kernel/workqueue.c:2244
  #2: 00000000b363c0f6 (&dev->mutex){....}, at: device_lock  
/./include/linux/device.h:1208 [inline]
  #2: 00000000b363c0f6 (&dev->mutex){....}, at: hub_event+0x179/0x3550  
/drivers/usb/core/hub.c:5387
  #3: 0000000085e6ee8d (&dev->mutex){....}, at: device_lock  
/./include/linux/device.h:1208 [inline]
  #3: 0000000085e6ee8d (&dev->mutex){....}, at: usb_disconnect+0x91/0x830  
/drivers/usb/core/hub.c:2190
  #4: 00000000f0ac3a42 (&dev->mutex){....}, at:  
device_release_driver_internal+0x23/0x4c0 /drivers/base/dd.c:1109
5 locks held by kworker/1:1/21:
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
__write_once_size /./include/linux/compiler.h:221 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
arch_atomic64_set /./arch/x86/include/asm/atomic64_64.h:34 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at: atomic64_set  
/./include/asm-generic/atomic-instrumented.h:855 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
atomic_long_set /./include/asm-generic/atomic-long.h:40 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at: set_work_data  
/kernel/workqueue.c:620 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
set_work_pool_and_clear_pending /kernel/workqueue.c:647 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
process_one_work+0x81a/0x1570 /kernel/workqueue.c:2240
  #1: 00000000e4cc4967 ((work_completion)(&hub->events)){+.+.}, at:  
process_one_work+0x84e/0x1570 /kernel/workqueue.c:2244
  #2: 000000009fad33ce (&dev->mutex){....}, at: device_lock  
/./include/linux/device.h:1208 [inline]
  #2: 000000009fad33ce (&dev->mutex){....}, at: hub_event+0x179/0x3550  
/drivers/usb/core/hub.c:5387
  #3: 0000000054332177 (&dev->mutex){....}, at: device_lock  
/./include/linux/device.h:1208 [inline]
  #3: 0000000054332177 (&dev->mutex){....}, at: usb_disconnect+0x91/0x830  
/drivers/usb/core/hub.c:2190
  #4: 0000000024af6192 (&dev->mutex){....}, at:  
device_release_driver_internal+0x23/0x4c0 /drivers/base/dd.c:1109
1 lock held by khungtaskd/23:
  #0: 00000000c34a6907 (rcu_read_lock){....}, at:  
debug_show_all_locks+0x53/0x269 /kernel/locking/lockdep.c:5147
5 locks held by kworker/0:2/107:
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
__write_once_size /./include/linux/compiler.h:221 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
arch_atomic64_set /./arch/x86/include/asm/atomic64_64.h:34 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at: atomic64_set  
/./include/asm-generic/atomic-instrumented.h:855 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
atomic_long_set /./include/asm-generic/atomic-long.h:40 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at: set_work_data  
/kernel/workqueue.c:620 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
set_work_pool_and_clear_pending /kernel/workqueue.c:647 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
process_one_work+0x81a/0x1570 /kernel/workqueue.c:2240
  #1: 00000000123183b4 ((work_completion)(&hub->events)){+.+.}, at:  
process_one_work+0x84e/0x1570 /kernel/workqueue.c:2244
  #2: 0000000052b6f3e1 (&dev->mutex){....}, at: device_lock  
/./include/linux/device.h:1208 [inline]
  #2: 0000000052b6f3e1 (&dev->mutex){....}, at: hub_event+0x179/0x3550  
/drivers/usb/core/hub.c:5387
  #3: 0000000074cd949e (&dev->mutex){....}, at: device_lock  
/./include/linux/device.h:1208 [inline]
  #3: 0000000074cd949e (&dev->mutex){....}, at: usb_disconnect+0x91/0x830  
/drivers/usb/core/hub.c:2190
  #4: 000000004b055abd (&dev->mutex){....}, at:  
device_release_driver_internal+0x23/0x4c0 /drivers/base/dd.c:1109
5 locks held by kworker/1:2/108:
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
__write_once_size /./include/linux/compiler.h:221 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
arch_atomic64_set /./arch/x86/include/asm/atomic64_64.h:34 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at: atomic64_set  
/./include/asm-generic/atomic-instrumented.h:855 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
atomic_long_set /./include/asm-generic/atomic-long.h:40 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at: set_work_data  
/kernel/workqueue.c:620 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
set_work_pool_and_clear_pending /kernel/workqueue.c:647 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
process_one_work+0x81a/0x1570 /kernel/workqueue.c:2240
  #1: 00000000e35f89a1 ((work_completion)(&hub->events)){+.+.}, at:  
process_one_work+0x84e/0x1570 /kernel/workqueue.c:2244
  #2: 00000000b09f111f (&dev->mutex){....}, at: device_lock  
/./include/linux/device.h:1208 [inline]
  #2: 00000000b09f111f (&dev->mutex){....}, at: hub_event+0x179/0x3550  
/drivers/usb/core/hub.c:5387
  #3: 000000006b5fbeae (&dev->mutex){....}, at: device_lock  
/./include/linux/device.h:1208 [inline]
  #3: 000000006b5fbeae (&dev->mutex){....}, at: usb_disconnect+0x91/0x830  
/drivers/usb/core/hub.c:2190
  #4: 0000000081dcaa24 (&dev->mutex){....}, at:  
device_release_driver_internal+0x23/0x4c0 /drivers/base/dd.c:1109
1 lock held by rsyslogd/1609:
  #0: 00000000d7f3ff94 (&f->f_pos_lock){+.+.}, at: __fdget_pos+0xe3/0x100  
/fs/file.c:801
2 locks held by getty/1699:
  #0: 00000000bc736fb1 (&tty->ldisc_sem){++++}, at:  
tty_ldisc_ref_wait+0x22/0x80 /drivers/tty/tty_ldisc.c:272
  #1: 0000000014dfa3bf (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x217/0x1a50 /drivers/tty/n_tty.c:2156
2 locks held by getty/1700:
  #0: 00000000be14d894 (&tty->ldisc_sem){++++}, at:  
tty_ldisc_ref_wait+0x22/0x80 /drivers/tty/tty_ldisc.c:272
  #1: 00000000ff0e9bac (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x217/0x1a50 /drivers/tty/n_tty.c:2156
2 locks held by getty/1701:
  #0: 00000000d0e4fddf (&tty->ldisc_sem){++++}, at:  
tty_ldisc_ref_wait+0x22/0x80 /drivers/tty/tty_ldisc.c:272
  #1: 000000004b19a9d4 (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x217/0x1a50 /drivers/tty/n_tty.c:2156
2 locks held by getty/1702:
  #0: 00000000c1b6c003 (&tty->ldisc_sem){++++}, at:  
tty_ldisc_ref_wait+0x22/0x80 /drivers/tty/tty_ldisc.c:272
  #1: 0000000099fff3a4 (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x217/0x1a50 /drivers/tty/n_tty.c:2156
2 locks held by getty/1703:
  #0: 000000008cc2d327 (&tty->ldisc_sem){++++}, at:  
tty_ldisc_ref_wait+0x22/0x80 /drivers/tty/tty_ldisc.c:272
  #1: 0000000056f83ac4 (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x217/0x1a50 /drivers/tty/n_tty.c:2156
2 locks held by getty/1704:
  #0: 000000000eebfa14 (&tty->ldisc_sem){++++}, at:  
tty_ldisc_ref_wait+0x22/0x80 /drivers/tty/tty_ldisc.c:272
  #1: 00000000a2f569ec (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x217/0x1a50 /drivers/tty/n_tty.c:2156
2 locks held by getty/1705:
  #0: 0000000055305a29 (&tty->ldisc_sem){++++}, at:  
tty_ldisc_ref_wait+0x22/0x80 /drivers/tty/tty_ldisc.c:272
  #1: 000000001cc6455d (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x217/0x1a50 /drivers/tty/n_tty.c:2156
5 locks held by kworker/1:0/1743:
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
__write_once_size /./include/linux/compiler.h:221 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
arch_atomic64_set /./arch/x86/include/asm/atomic64_64.h:34 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at: atomic64_set  
/./include/asm-generic/atomic-instrumented.h:855 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
atomic_long_set /./include/asm-generic/atomic-long.h:40 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at: set_work_data  
/kernel/workqueue.c:620 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
set_work_pool_and_clear_pending /kernel/workqueue.c:647 [inline]
  #0: 000000008d4a8324 ((wq_completion)usb_hub_wq){+.+.}, at:  
process_one_work+0x81a/0x1570 /kernel/workqueue.c:2240
  #1: 00000000f376c2ba ((work_completion)(&hub->events)){+.+.}, at:  
process_one_work+0x84e/0x1570 /kernel/workqueue.c:2244
  #2: 000000007ee3f09e (&dev->mutex){....}, at: device_lock  
/./include/linux/device.h:1208 [inline]
  #2: 000000007ee3f09e (&dev->mutex){....}, at: hub_event+0x179/0x3550  
/drivers/usb/core/hub.c:5387
  #3: 00000000250c1adb (&dev->mutex){....}, at: device_lock  
/./include/linux/device.h:1208 [inline]
  #3: 00000000250c1adb (&dev->mutex){....}, at: usb_disconnect+0x91/0x830  
/drivers/usb/core/hub.c:2190
  #4: 00000000538ed281 (&dev->mutex){....}, at:  
device_release_driver_internal+0x23/0x4c0 /drivers/base/dd.c:1109
5 locks held by kworker/0:1/1745:

=============================================

NMI backtrace for cpu 0
CPU: 0 PID: 23 Comm: khungtaskd Not tainted 5.2.0-rc6+ #15
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack /lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e /lib/dump_stack.c:113
  nmi_cpu_backtrace.cold+0x48/0x87 /lib/nmi_backtrace.c:101
  nmi_trigger_cpumask_backtrace+0x1a6/0x1bd /lib/nmi_backtrace.c:62
  trigger_all_cpu_backtrace /./include/linux/nmi.h:146 [inline]
  check_hung_uninterruptible_tasks /kernel/hung_task.c:205 [inline]
  watchdog+0x989/0xe20 /kernel/hung_task.c:289
  kthread+0x30b/0x410 /kernel/kthread.c:255
  ret_from_fork+0x24/0x30 /arch/x86/entry/entry_64.S:352
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1 skipped: idling at native_safe_halt  
/./arch/x86/include/asm/irqflags.h:60 [inline]
NMI backtrace for cpu 1 skipped: idling at arch_safe_halt  
/./arch/x86/include/asm/irqflags.h:103 [inline]
NMI backtrace for cpu 1 skipped: idling at default_idle+0x28/0x2b0  
/arch/x86/kernel/process.c:580


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
