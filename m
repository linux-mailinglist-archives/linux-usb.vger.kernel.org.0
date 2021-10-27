Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C93543C9A5
	for <lists+linux-usb@lfdr.de>; Wed, 27 Oct 2021 14:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241879AbhJ0Mam (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Oct 2021 08:30:42 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:33489 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232724AbhJ0Mak (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Oct 2021 08:30:40 -0400
Received: by mail-io1-f71.google.com with SMTP id f19-20020a6b6213000000b005ddc4ce4deeso1906976iog.0
        for <linux-usb@vger.kernel.org>; Wed, 27 Oct 2021 05:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=ULZ45fK+I3FMx7ADq/K6jskICCa9sQ+kXjg6cyWu29U=;
        b=PwtF7oxWyIsUlkLG3PvmrI3GWlGEFJ0HBzwMbn9WqpspLDpqugn/WT4aMfTp52csel
         Aan1Ty9j7BYSCgsFcQXzL1zL2OxU3H4o+Vjwe8HGjZBE2KbOZEtFZVFsmC7pHxfTjKiI
         FedRdzcbTuwkMoVV6K5GrV5kWFsmUppOH5MuUMDMRiy11HOHJT1Yr+RliEETRla8AkF7
         EGvUgbmTqKw2/Pp1ES7XjOAWOj0sVnrpmy0pRaz/44hdLC0E7aORkTpBgrGoFPcJY66s
         BHuZ/q30lHw1b2sNtb9S+J+Nk+L/dz0Q7/BJvJQ+fftJG4tH+LnYvQ0TU27UlreUDSlc
         I7XQ==
X-Gm-Message-State: AOAM533G9fyuF1DrOCJlyBkCLtcb+ReqXE5RcjJoy+y2w6Qyuy1WClX3
        WOOUd9ch9OFOeBbWweh7cTDMG49btCzr5B1X02IogKhtxaL5
X-Google-Smtp-Source: ABdhPJyjWjniJqxBn5Pqttu82pbxFbnIr72Kp7p3bVj0Z47S4HyU8SsDa6n7yMsYcOWR4rahrjSCD2rUCg91kDUGcxUfDUKNijzT
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2cd0:: with SMTP id j16mr20212226iow.171.1635337694871;
 Wed, 27 Oct 2021 05:28:14 -0700 (PDT)
Date:   Wed, 27 Oct 2021 05:28:14 -0700
In-Reply-To: <bf8eefe4-7fe1-002f-8258-10a3e825856a@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006405cf05cf54bacb@google.com>
Subject: Re: [syzbot] INFO: task hung in sisusb_open
From:   syzbot <syzbot+fd9d03311cdce9a9ec36@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-usb@vger.kernel.org, oneukum@suse.com,
        syzkaller-bugs@googlegroups.com, thomas@winischhofer.net
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: task hung in usb_register_dev

INFO: task kworker/1:0:20 blocked for more than 143 seconds.
      Not tainted 5.15.0-rc6-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/1:0     state:D stack:24904 pid:   20 ppid:     2 flags:0x00004000
Workqueue: usb_hub_wq hub_event
Call Trace:
 context_switch kernel/sched/core.c:4940 [inline]
 __schedule+0xb44/0x5960 kernel/sched/core.c:6287
 schedule+0xd3/0x270 kernel/sched/core.c:6366
 rwsem_down_write_slowpath+0x7b9/0x11d0 kernel/locking/rwsem.c:1107
 __down_write_common kernel/locking/rwsem.c:1262 [inline]
 __down_write_common kernel/locking/rwsem.c:1259 [inline]
 __down_write kernel/locking/rwsem.c:1271 [inline]
 down_write+0x137/0x150 kernel/locking/rwsem.c:1518
 usb_register_dev drivers/usb/core/file.c:187 [inline]
 usb_register_dev+0x19d/0x7e0 drivers/usb/core/file.c:156
 sisusb_probe+0x21c/0xbe3 drivers/usb/misc/sisusbvga/sisusb.c:3039
 usb_probe_interface+0x315/0x7f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:517 [inline]
 really_probe+0x245/0xcc0 drivers/base/dd.c:596
 __driver_probe_device+0x338/0x4d0 drivers/base/dd.c:751
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:781
 __device_attach_driver+0x20b/0x2f0 drivers/base/dd.c:898
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:427
 __device_attach+0x228/0x4a0 drivers/base/dd.c:969
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:487
 device_add+0xc17/0x1ee0 drivers/base/core.c:3396
 usb_set_configuration+0x113f/0x1910 drivers/usb/core/message.c:2170
 usb_generic_driver_probe+0xba/0x100 drivers/usb/core/generic.c:238
 usb_probe_device+0xd9/0x2c0 drivers/usb/core/driver.c:293
 call_driver_probe drivers/base/dd.c:517 [inline]
 really_probe+0x245/0xcc0 drivers/base/dd.c:596
 __driver_probe_device+0x338/0x4d0 drivers/base/dd.c:751
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:781
 __device_attach_driver+0x20b/0x2f0 drivers/base/dd.c:898
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:427
 __device_attach+0x228/0x4a0 drivers/base/dd.c:969
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:487
 device_add+0xc17/0x1ee0 drivers/base/core.c:3396
 usb_new_device.cold+0x63f/0x108e drivers/usb/core/hub.c:2563
 hub_port_connect drivers/usb/core/hub.c:5348 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5488 [inline]
 port_event drivers/usb/core/hub.c:5634 [inline]
 hub_event+0x2357/0x4330 drivers/usb/core/hub.c:5716
 process_one_work+0x9bf/0x16b0 kernel/workqueue.c:2297
 worker_thread+0x658/0x11f0 kernel/workqueue.c:2444
 kthread+0x3e5/0x4d0 kernel/kthread.c:319
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
INFO: task kworker/0:3:2954 blocked for more than 143 seconds.
      Not tainted 5.15.0-rc6-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/0:3     state:D stack:25256 pid: 2954 ppid:     2 flags:0x00004000
Workqueue: usb_hub_wq hub_event
Call Trace:
 context_switch kernel/sched/core.c:4940 [inline]
 __schedule+0xb44/0x5960 kernel/sched/core.c:6287
 schedule+0xd3/0x270 kernel/sched/core.c:6366
 rwsem_down_write_slowpath+0x7b9/0x11d0 kernel/locking/rwsem.c:1107
 __down_write_common kernel/locking/rwsem.c:1262 [inline]
 __down_write_common kernel/locking/rwsem.c:1259 [inline]
 __down_write kernel/locking/rwsem.c:1271 [inline]
 down_write+0x137/0x150 kernel/locking/rwsem.c:1518
 usb_register_dev drivers/usb/core/file.c:187 [inline]
 usb_register_dev+0x19d/0x7e0 drivers/usb/core/file.c:156
 sisusb_probe+0x21c/0xbe3 drivers/usb/misc/sisusbvga/sisusb.c:3039
 usb_probe_interface+0x315/0x7f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:517 [inline]
 really_probe+0x245/0xcc0 drivers/base/dd.c:596
 __driver_probe_device+0x338/0x4d0 drivers/base/dd.c:751
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:781
 __device_attach_driver+0x20b/0x2f0 drivers/base/dd.c:898
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:427
 __device_attach+0x228/0x4a0 drivers/base/dd.c:969
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:487
 device_add+0xc17/0x1ee0 drivers/base/core.c:3396
 usb_set_configuration+0x113f/0x1910 drivers/usb/core/message.c:2170
 usb_generic_driver_probe+0xba/0x100 drivers/usb/core/generic.c:238
 usb_probe_device+0xd9/0x2c0 drivers/usb/core/driver.c:293
 call_driver_probe drivers/base/dd.c:517 [inline]
 really_probe+0x245/0xcc0 drivers/base/dd.c:596
 __driver_probe_device+0x338/0x4d0 drivers/base/dd.c:751
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:781
 __device_attach_driver+0x20b/0x2f0 drivers/base/dd.c:898
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:427
 __device_attach+0x228/0x4a0 drivers/base/dd.c:969
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:487
 device_add+0xc17/0x1ee0 drivers/base/core.c:3396
 usb_new_device.cold+0x63f/0x108e drivers/usb/core/hub.c:2563
 hub_port_connect drivers/usb/core/hub.c:5348 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5488 [inline]
 port_event drivers/usb/core/hub.c:5634 [inline]
 hub_event+0x2357/0x4330 drivers/usb/core/hub.c:5716
 process_one_work+0x9bf/0x16b0 kernel/workqueue.c:2297
 worker_thread+0x658/0x11f0 kernel/workqueue.c:2444
 kthread+0x3e5/0x4d0 kernel/kthread.c:319
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
INFO: task kworker/1:5:6907 blocked for more than 144 seconds.
      Not tainted 5.15.0-rc6-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/1:5     state:D stack:25424 pid: 6907 ppid:     2 flags:0x00004000
Workqueue: usb_hub_wq hub_event
Call Trace:
 context_switch kernel/sched/core.c:4940 [inline]
 __schedule+0xb44/0x5960 kernel/sched/core.c:6287
 schedule+0xd3/0x270 kernel/sched/core.c:6366
 rwsem_down_write_slowpath+0x7b9/0x11d0 kernel/locking/rwsem.c:1107
 __down_write_common kernel/locking/rwsem.c:1262 [inline]
 __down_write_common kernel/locking/rwsem.c:1259 [inline]
 __down_write kernel/locking/rwsem.c:1271 [inline]
 down_write+0x137/0x150 kernel/locking/rwsem.c:1518
 usb_register_dev drivers/usb/core/file.c:187 [inline]
 usb_register_dev+0x19d/0x7e0 drivers/usb/core/file.c:156
 sisusb_probe+0x21c/0xbe3 drivers/usb/misc/sisusbvga/sisusb.c:3039
 usb_probe_interface+0x315/0x7f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:517 [inline]
 really_probe+0x245/0xcc0 drivers/base/dd.c:596
 __driver_probe_device+0x338/0x4d0 drivers/base/dd.c:751
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:781
 __device_attach_driver+0x20b/0x2f0 drivers/base/dd.c:898
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:427
 __device_attach+0x228/0x4a0 drivers/base/dd.c:969
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:487
 device_add+0xc17/0x1ee0 drivers/base/core.c:3396
 usb_set_configuration+0x113f/0x1910 drivers/usb/core/message.c:2170
 usb_generic_driver_probe+0xba/0x100 drivers/usb/core/generic.c:238
 usb_probe_device+0xd9/0x2c0 drivers/usb/core/driver.c:293
 call_driver_probe drivers/base/dd.c:517 [inline]
 really_probe+0x245/0xcc0 drivers/base/dd.c:596
 __driver_probe_device+0x338/0x4d0 drivers/base/dd.c:751
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:781
 __device_attach_driver+0x20b/0x2f0 drivers/base/dd.c:898
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:427
 __device_attach+0x228/0x4a0 drivers/base/dd.c:969
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:487
 device_add+0xc17/0x1ee0 drivers/base/core.c:3396
 usb_new_device.cold+0x63f/0x108e drivers/usb/core/hub.c:2563
 hub_port_connect drivers/usb/core/hub.c:5348 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5488 [inline]
 port_event drivers/usb/core/hub.c:5634 [inline]
 hub_event+0x2357/0x4330 drivers/usb/core/hub.c:5716
 process_one_work+0x9bf/0x16b0 kernel/workqueue.c:2297
 worker_thread+0x658/0x11f0 kernel/workqueue.c:2444
 kthread+0x3e5/0x4d0 kernel/kthread.c:319
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
INFO: task kworker/1:6:9012 blocked for more than 144 seconds.
      Not tainted 5.15.0-rc6-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/1:6     state:D stack:24672 pid: 9012 ppid:     2 flags:0x00004000
Workqueue: usb_hub_wq hub_event
Call Trace:
 context_switch kernel/sched/core.c:4940 [inline]
 __schedule+0xb44/0x5960 kernel/sched/core.c:6287
 schedule+0xd3/0x270 kernel/sched/core.c:6366
 rwsem_down_write_slowpath+0x7b9/0x11d0 kernel/locking/rwsem.c:1107
 __down_write_common kernel/locking/rwsem.c:1262 [inline]
 __down_write_common kernel/locking/rwsem.c:1259 [inline]
 __down_write kernel/locking/rwsem.c:1271 [inline]
 down_write+0x137/0x150 kernel/locking/rwsem.c:1518
 usb_register_dev drivers/usb/core/file.c:187 [inline]
 usb_register_dev+0x19d/0x7e0 drivers/usb/core/file.c:156
 sisusb_probe+0x21c/0xbe3 drivers/usb/misc/sisusbvga/sisusb.c:3039
 usb_probe_interface+0x315/0x7f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:517 [inline]
 really_probe+0x245/0xcc0 drivers/base/dd.c:596
 __driver_probe_device+0x338/0x4d0 drivers/base/dd.c:751
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:781
 __device_attach_driver+0x20b/0x2f0 drivers/base/dd.c:898
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:427
 __device_attach+0x228/0x4a0 drivers/base/dd.c:969
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:487
 device_add+0xc17/0x1ee0 drivers/base/core.c:3396
 usb_set_configuration+0x113f/0x1910 drivers/usb/core/message.c:2170
 usb_generic_driver_probe+0xba/0x100 drivers/usb/core/generic.c:238
 usb_probe_device+0xd9/0x2c0 drivers/usb/core/driver.c:293
 call_driver_probe drivers/base/dd.c:517 [inline]
 really_probe+0x245/0xcc0 drivers/base/dd.c:596
 __driver_probe_device+0x338/0x4d0 drivers/base/dd.c:751
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:781
 __device_attach_driver+0x20b/0x2f0 drivers/base/dd.c:898
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:427
 __device_attach+0x228/0x4a0 drivers/base/dd.c:969
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:487
 device_add+0xc17/0x1ee0 drivers/base/core.c:3396
 usb_new_device.cold+0x63f/0x108e drivers/usb/core/hub.c:2563
 hub_port_connect drivers/usb/core/hub.c:5348 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5488 [inline]
 port_event drivers/usb/core/hub.c:5634 [inline]
 hub_event+0x2357/0x4330 drivers/usb/core/hub.c:5716
 process_one_work+0x9bf/0x16b0 kernel/workqueue.c:2297
 worker_thread+0x658/0x11f0 kernel/workqueue.c:2444
 kthread+0x3e5/0x4d0 kernel/kthread.c:319
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
INFO: task syz-executor.4:10534 blocked for more than 145 seconds.
      Not tainted 5.15.0-rc6-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor.4  state:D stack:28496 pid:10534 ppid:  7078 flags:0x00000004
Call Trace:
 context_switch kernel/sched/core.c:4940 [inline]
 __schedule+0xb44/0x5960 kernel/sched/core.c:6287
 schedule+0xd3/0x270 kernel/sched/core.c:6366
 schedule_preempt_disabled+0xf/0x20 kernel/sched/core.c:6425
 __mutex_lock_common kernel/locking/mutex.c:669 [inline]
 __mutex_lock+0xa34/0x12f0 kernel/locking/mutex.c:729
 sisusb_open+0xb2/0x4d0 drivers/usb/misc/sisusbvga/sisusb.c:2397
 usb_open+0x204/0x2e0 drivers/usb/core/file.c:48
 chrdev_open+0x266/0x770 fs/char_dev.c:414
 do_dentry_open+0x4c8/0x11d0 fs/open.c:822
 do_open fs/namei.c:3428 [inline]
 path_openat+0x1c9a/0x2740 fs/namei.c:3561
 do_filp_open+0x1aa/0x400 fs/namei.c:3588
 do_sys_openat2+0x16d/0x4d0 fs/open.c:1200
 do_sys_open fs/open.c:1216 [inline]
 __do_sys_openat fs/open.c:1232 [inline]
 __se_sys_openat fs/open.c:1227 [inline]
 __x64_sys_openat+0x13f/0x1f0 fs/open.c:1227
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f8e09790954
RSP: 002b:00007f8e08f52cc0 EFLAGS: 00000293 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f8e098e0f60 RCX: 00007f8e09790954
RDX: 0000000000000002 RSI: 00007f8e08f52d60 RDI: 00000000ffffff9c
RBP: 00007f8e08f52d60 R08: 0000000000000000 R09: 000000000000000f
R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000000002
R13: 00007ffd411b841f R14: 00007f8e08f53300 R15: 0000000000022000
INFO: task syz-executor.3:10535 blocked for more than 145 seconds.
      Not tainted 5.15.0-rc6-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor.3  state:D stack:27888 pid:10535 ppid:  7075 flags:0x00004004
Call Trace:
 context_switch kernel/sched/core.c:4940 [inline]
 __schedule+0xb44/0x5960 kernel/sched/core.c:6287
 schedule+0xd3/0x270 kernel/sched/core.c:6366
 schedule_preempt_disabled+0xf/0x20 kernel/sched/core.c:6425
 __mutex_lock_common kernel/locking/mutex.c:669 [inline]
 __mutex_lock+0xa34/0x12f0 kernel/locking/mutex.c:729
 sisusb_open+0xb2/0x4d0 drivers/usb/misc/sisusbvga/sisusb.c:2397
 usb_open+0x204/0x2e0 drivers/usb/core/file.c:48
 chrdev_open+0x266/0x770 fs/char_dev.c:414
 do_dentry_open+0x4c8/0x11d0 fs/open.c:822
 do_open fs/namei.c:3428 [inline]
 path_openat+0x1c9a/0x2740 fs/namei.c:3561
 do_filp_open+0x1aa/0x400 fs/namei.c:3588
 do_sys_openat2+0x16d/0x4d0 fs/open.c:1200
 do_sys_open fs/open.c:1216 [inline]
 __do_sys_openat fs/open.c:1232 [inline]
 __se_sys_openat fs/open.c:1227 [inline]
 __x64_sys_openat+0x13f/0x1f0 fs/open.c:1227
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7fbada0b6954
RSP: 002b:00007fbad9878cc0 EFLAGS: 00000293 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007fbada206f60 RCX: 00007fbada0b6954
RDX: 0000000000000002 RSI: 00007fbad9878d60 RDI: 00000000ffffff9c
RBP: 00007fbad9878d60 R08: 0000000000000000 R09: 000000000000000f
R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000000002
R13: 00007ffdb0deb55f R14: 00007fbad9879300 R15: 0000000000022000
INFO: task syz-executor.1:10559 blocked for more than 146 seconds.
      Not tainted 5.15.0-rc6-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor.1  state:D stack:28496 pid:10559 ppid:  7076 flags:0x00000004
Call Trace:
 context_switch kernel/sched/core.c:4940 [inline]
 __schedule+0xb44/0x5960 kernel/sched/core.c:6287
 schedule+0xd3/0x270 kernel/sched/core.c:6366
 rwsem_down_read_slowpath+0x4c5/0x990 kernel/locking/rwsem.c:993
 __down_read_common kernel/locking/rwsem.c:1214 [inline]
 __down_read kernel/locking/rwsem.c:1223 [inline]
 down_read+0xe4/0x440 kernel/locking/rwsem.c:1466
 usb_open+0x24/0x2e0 drivers/usb/core/file.c:39
 chrdev_open+0x266/0x770 fs/char_dev.c:414
 do_dentry_open+0x4c8/0x11d0 fs/open.c:822
 do_open fs/namei.c:3428 [inline]
 path_openat+0x1c9a/0x2740 fs/namei.c:3561
 do_filp_open+0x1aa/0x400 fs/namei.c:3588
 do_sys_openat2+0x16d/0x4d0 fs/open.c:1200
 do_sys_open fs/open.c:1216 [inline]
 __do_sys_openat fs/open.c:1232 [inline]
 __se_sys_openat fs/open.c:1227 [inline]
 __x64_sys_openat+0x13f/0x1f0 fs/open.c:1227
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f1dc0353954
RSP: 002b:00007f1dbfb15cc0 EFLAGS: 00000293 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f1dc04a3f60 RCX: 00007f1dc0353954
RDX: 0000000000000002 RSI: 00007f1dbfb15d60 RDI: 00000000ffffff9c
RBP: 00007f1dbfb15d60 R08: 0000000000000000 R09: 000000000000000f
R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000000002
R13: 00007ffcd4e8c98f R14: 00007f1dbfb16300 R15: 0000000000022000
INFO: task syz-executor.0:10560 blocked for more than 146 seconds.
      Not tainted 5.15.0-rc6-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor.0  state:D stack:28496 pid:10560 ppid:  7074 flags:0x00000004
Call Trace:
 context_switch kernel/sched/core.c:4940 [inline]
 __schedule+0xb44/0x5960 kernel/sched/core.c:6287
 schedule+0xd3/0x270 kernel/sched/core.c:6366
 rwsem_down_read_slowpath+0x4c5/0x990 kernel/locking/rwsem.c:993
 __down_read_common kernel/locking/rwsem.c:1214 [inline]
 __down_read kernel/locking/rwsem.c:1223 [inline]
 down_read+0xe4/0x440 kernel/locking/rwsem.c:1466
 usb_open+0x24/0x2e0 drivers/usb/core/file.c:39
 chrdev_open+0x266/0x770 fs/char_dev.c:414
 do_dentry_open+0x4c8/0x11d0 fs/open.c:822
 do_open fs/namei.c:3428 [inline]
 path_openat+0x1c9a/0x2740 fs/namei.c:3561
 do_filp_open+0x1aa/0x400 fs/namei.c:3588
 do_sys_openat2+0x16d/0x4d0 fs/open.c:1200
 do_sys_open fs/open.c:1216 [inline]
 __do_sys_openat fs/open.c:1232 [inline]
 __se_sys_openat fs/open.c:1227 [inline]
 __x64_sys_openat+0x13f/0x1f0 fs/open.c:1227
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f0dc353d954
RSP: 002b:00007f0dc2cffcc0 EFLAGS: 00000293 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f0dc368df60 RCX: 00007f0dc353d954
RDX: 0000000000000002 RSI: 00007f0dc2cffd60 RDI: 00000000ffffff9c
RBP: 00007f0dc2cffd60 R08: 0000000000000000 R09: 000000000000000f
R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000000002
R13: 00007ffc98eb74cf R14: 00007f0dc2d00300 R15: 0000000000022000

Showing all locks held in the system:
1 lock held by ksoftirqd/1/19:
 #0: ffff8880b9d31a58 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x2b/0x120 kernel/sched/core.c:474
6 locks held by kworker/1:0/20:
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: arch_atomic_long_set include/linux/atomic/atomic-long.h:41 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic_long_set include/linux/atomic/atomic-instrumented.h:1198 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:634 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:661 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x8a3/0x16b0 kernel/workqueue.c:2268
 #1: ffffc90000da7db0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x8d7/0x16b0 kernel/workqueue.c:2272
 #2: ffff888146d07220 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:760 [inline]
 #2: ffff888146d07220 (&dev->mutex){....}-{3:3}, at: hub_event+0x1c1/0x4330 drivers/usb/core/hub.c:5662
 #3: ffff88814845f220 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:760 [inline]
 #3: ffff88814845f220 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7a/0x4a0 drivers/base/dd.c:944
 #4: ffff8880771131a8 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:760 [inline]
 #4: ffff8880771131a8 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7a/0x4a0 drivers/base/dd.c:944
 #5: ffffffff8c81f970 (minor_rwsem#2){++++}-{3:3}, at: usb_register_dev drivers/usb/core/file.c:187 [inline]
 #5: ffffffff8c81f970 (minor_rwsem#2){++++}-{3:3}, at: usb_register_dev+0x19d/0x7e0 drivers/usb/core/file.c:156
1 lock held by khungtaskd/27:
 #0: ffffffff8b981b60 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x53/0x260 kernel/locking/lockdep.c:6446
6 locks held by kworker/1:2/1056:
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: arch_atomic_long_set include/linux/atomic/atomic-long.h:41 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic_long_set include/linux/atomic/atomic-instrumented.h:1198 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:634 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:661 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x8a3/0x16b0 kernel/workqueue.c:2268
 #1: ffffc90004ca7db0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x8d7/0x16b0 kernel/workqueue.c:2272
 #2: ffff888146c0f220 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:760 [inline]
 #2: ffff888146c0f220 (&dev->mutex){....}-{3:3}, at: hub_event+0x1c1/0x4330 drivers/usb/core/hub.c:5662
 #3: ffff88807525c220 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:760 [inline]
 #3: ffff88807525c220 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7a/0x4a0 drivers/base/dd.c:944
 #4: ffff888024f921a8 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:760 [inline]
 #4: ffff888024f921a8 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7a/0x4a0 drivers/base/dd.c:944
 #5: ffffffff8c81f970 (minor_rwsem#2){++++}-{3:3}, at: usb_register_dev drivers/usb/core/file.c:187 [inline]
 #5: ffffffff8c81f970 (minor_rwsem#2){++++}-{3:3}, at: usb_register_dev+0x19d/0x7e0 drivers/usb/core/file.c:156
6 locks held by kworker/0:3/2954:
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: arch_atomic_long_set include/linux/atomic/atomic-long.h:41 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic_long_set include/linux/atomic/atomic-instrumented.h:1198 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:634 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:661 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x8a3/0x16b0 kernel/workqueue.c:2268
 #1: ffffc90002c9fdb0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x8d7/0x16b0 kernel/workqueue.c:2272
 #2: ffff888146c97220 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:760 [inline]
 #2: ffff888146c97220 (&dev->mutex){....}-{3:3}, at: hub_event+0x1c1/0x4330 drivers/usb/core/hub.c:5662
 #3: ffff888077575220 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:760 [inline]
 #3: ffff888077575220 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7a/0x4a0 drivers/base/dd.c:944
 #4: ffff88806a74c1a8 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:760 [inline]
 #4: ffff88806a74c1a8 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7a/0x4a0 drivers/base/dd.c:944
 #5: ffffffff8c81f970 (minor_rwsem#2){++++}-{3:3}, at: usb_register_dev drivers/usb/core/file.c:187 [inline]
 #5: ffffffff8c81f970 (minor_rwsem#2){++++}-{3:3}, at: usb_register_dev+0x19d/0x7e0 drivers/usb/core/file.c:156
1 lock held by in:imklog/6479:
6 locks held by kworker/1:4/6906:
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: arch_atomic_long_set include/linux/atomic/atomic-long.h:41 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic_long_set include/linux/atomic/atomic-instrumented.h:1198 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:634 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:661 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x8a3/0x16b0 kernel/workqueue.c:2268
 #1: ffffc90005887db0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x8d7/0x16b0 kernel/workqueue.c:2272
 #2: ffff888146c3f220 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:760 [inline]
 #2: ffff888146c3f220 (&dev->mutex){....}-{3:3}, at: hub_event+0x1c1/0x4330 drivers/usb/core/hub.c:5662
 #3: ffff88807aa83220 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:760 [inline]
 #3: ffff88807aa83220 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7a/0x4a0 drivers/base/dd.c:944
 #4: ffff88807a1751a8 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:760 [inline]
 #4: ffff88807a1751a8 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7a/0x4a0 drivers/base/dd.c:944
 #5: ffffffff8c81f970 (minor_rwsem#2){++++}-{3:3}, at: usb_register_dev drivers/usb/core/file.c:187 [inline]
 #5: ffffffff8c81f970 (minor_rwsem#2){++++}-{3:3}, at: usb_register_dev+0x19d/0x7e0 drivers/usb/core/file.c:156
6 locks held by kworker/1:5/6907:
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: arch_atomic_long_set include/linux/atomic/atomic-long.h:41 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic_long_set include/linux/atomic/atomic-instrumented.h:1198 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:634 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:661 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x8a3/0x16b0 kernel/workqueue.c:2268
 #1: ffffc90005867db0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x8d7/0x16b0 kernel/workqueue.c:2272
 #2: ffff888146caf220 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:760 [inline]
 #2: ffff888146caf220 (&dev->mutex){....}-{3:3}, at: hub_event+0x1c1/0x4330 drivers/usb/core/hub.c:5662
 #3: ffff88814845d220 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:760 [inline]
 #3: ffff88814845d220 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7a/0x4a0 drivers/base/dd.c:944
 #4: ffff8880787151a8 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:760 [inline]
 #4: ffff8880787151a8 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7a/0x4a0 drivers/base/dd.c:944
 #5: ffffffff8c81f970 (minor_rwsem#2){++++}-{3:3}, at: usb_register_dev drivers/usb/core/file.c:187 [inline]
 #5: ffffffff8c81f970 (minor_rwsem#2){++++}-{3:3}, at: usb_register_dev+0x19d/0x7e0 drivers/usb/core/file.c:156
6 locks held by kworker/1:6/9012:
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: arch_atomic_long_set include/linux/atomic/atomic-long.h:41 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic_long_set include/linux/atomic/atomic-instrumented.h:1198 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:634 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:661 [inline]
 #0: ffff888016142938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x8a3/0x16b0 kernel/workqueue.c:2268
 #1: ffffc9000d08fdb0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x8d7/0x16b0 kernel/workqueue.c:2272
 #2: ffff888146d17220 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:760 [inline]
 #2: ffff888146d17220 (&dev->mutex){....}-{3:3}, at: hub_event+0x1c1/0x4330 drivers/usb/core/hub.c:5662
 #3: ffff88814845e220 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:760 [inline]
 #3: ffff88814845e220 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7a/0x4a0 drivers/base/dd.c:944
 #4: ffff88801b1c51a8 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:760 [inline]
 #4: ffff88801b1c51a8 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7a/0x4a0 drivers/base/dd.c:944
 #5: ffffffff8c81f970 (minor_rwsem#2){++++}-{3:3}, at: usb_register_dev drivers/usb/core/file.c:187 [inline]
 #5: ffffffff8c81f970 (minor_rwsem#2){++++}-{3:3}, at: usb_register_dev+0x19d/0x7e0 drivers/usb/core/file.c:156
2 locks held by kworker/u4:6/9127:
2 locks held by syz-executor.5/10523:
 #0: ffffffff8c81f970 (minor_rwsem#2){++++}-{3:3}, at: usb_open+0x24/0x2e0 drivers/usb/core/file.c:39
 #1: ffff8880183080d0 (&(sisusb->lock)){+.+.}-{3:3}, at: sisusb_open+0xb2/0x4d0 drivers/usb/misc/sisusbvga/sisusb.c:2397
2 locks held by syz-executor.4/10534:
 #0: ffffffff8c81f970 (minor_rwsem#2){++++}-{3:3}, at: usb_open+0x24/0x2e0 drivers/usb/core/file.c:39
 #1: ffff8880183080d0 (&(sisusb->lock)){+.+.}-{3:3}, at: sisusb_open+0xb2/0x4d0 drivers/usb/misc/sisusbvga/sisusb.c:2397
2 locks held by syz-executor.3/10535:
 #0: ffffffff8c81f970 (minor_rwsem#2){++++}-{3:3}, at: usb_open+0x24/0x2e0 drivers/usb/core/file.c:39
 #1: ffff8880183080d0 (&(sisusb->lock)){+.+.}-{3:3}, at: sisusb_open+0xb2/0x4d0 drivers/usb/misc/sisusbvga/sisusb.c:2397
1 lock held by syz-executor.1/10559:
 #0: ffffffff8c81f970 (minor_rwsem#2){++++}-{3:3}, at: usb_open+0x24/0x2e0 drivers/usb/core/file.c:39
1 lock held by syz-executor.0/10560:
 #0: ffffffff8c81f970 (minor_rwsem#2){++++}-{3:3}, at: usb_open+0x24/0x2e0 drivers/usb/core/file.c:39
1 lock held by syz-executor.2/10975:
 #0: ffffffff8c81f970 (minor_rwsem#2){++++}-{3:3}, at: usb_open+0x24/0x2e0 drivers/usb/core/file.c:39

=============================================

NMI backtrace for cpu 0
CPU: 0 PID: 27 Comm: khungtaskd Not tainted 5.15.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 nmi_cpu_backtrace.cold+0x47/0x144 lib/nmi_backtrace.c:105
 nmi_trigger_cpumask_backtrace+0x1ae/0x220 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:146 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:210 [inline]
 watchdog+0xc1d/0xf50 kernel/hung_task.c:295
 kthread+0x3e5/0x4d0 kernel/kthread.c:319
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 PID: 2958 Comm: systemd-journal Not tainted 5.15.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:security_file_free+0x36/0xd0 security/security.c:1529
Code: 00 fc ff df 53 e8 da a8 d7 fd 48 8b 1d 5b 7a 94 07 48 85 db 74 31 e8 c9 a8 d7 fd 48 8d 7b 18 48 89 f8 48 c1 e8 03 80 3c 28 00 <75> 75 4c 89 e7 ff 53 18 48 89 d8 48 c1 e8 03 80 3c 28 00 75 69 48
RSP: 0018:ffffc900014dfe40 EFLAGS: 00000246
RAX: 1ffffffff1667990 RBX: ffffffff8b33cc68 RCX: 0000000000000000
RDX: ffff88807b668000 RSI: ffffffff839f2f57 RDI: ffffffff8b33cc80
RBP: dffffc0000000000 R08: 0000000000000000 R09: ffff888010db4ab3
R10: ffffffff83a75159 R11: 0000000000000000 R12: ffff888026673680
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
FS:  00007fca341728c0(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fca3163f018 CR3: 000000001b9ac000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 file_free fs/file_table.c:55 [inline]
 __fput+0x3d8/0x9f0 fs/file_table.c:298
 task_work_run+0xdd/0x1a0 kernel/task_work.c:164
 tracehook_notify_resume include/linux/tracehook.h:189 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:175 [inline]
 exit_to_user_mode_prepare+0x27e/0x290 kernel/entry/common.c:207
 __syscall_exit_to_user_mode_work kernel/entry/common.c:289 [inline]
 syscall_exit_to_user_mode+0x19/0x60 kernel/entry/common.c:300
 do_syscall_64+0x42/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7fca33701840
Code: 73 01 c3 48 8b 0d 68 77 20 00 f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 83 3d 89 bb 20 00 00 75 10 b8 02 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 1e f6 ff ff 48 89 04 24
RSP: 002b:00007ffdd68dba78 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
RAX: fffffffffffffffe RBX: 00007ffdd68dbd80 RCX: 00007fca33701840
RDX: 00000000000001a0 RSI: 0000000000080042 RDI: 00005653db47ec10
RBP: 000000000000000d R08: 000000000000ffc0 R09: 00000000ffffffff
R10: 0000000000000069 R11: 0000000000000246 R12: 00000000ffffffff
R13: 00005653db472040 R14: 00007ffdd68dbd40 R15: 00005653db47e270
----------------
Code disassembly (best guess), 3 bytes skipped:
   0:	df 53 e8             	fists  -0x18(%rbx)
   3:	da a8 d7 fd 48 8b    	fisubrl -0x74b70229(%rax)
   9:	1d 5b 7a 94 07       	sbb    $0x7947a5b,%eax
   e:	48 85 db             	test   %rbx,%rbx
  11:	74 31                	je     0x44
  13:	e8 c9 a8 d7 fd       	callq  0xfdd7a8e1
  18:	48 8d 7b 18          	lea    0x18(%rbx),%rdi
  1c:	48 89 f8             	mov    %rdi,%rax
  1f:	48 c1 e8 03          	shr    $0x3,%rax
  23:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
* 27:	75 75                	jne    0x9e <-- trapping instruction
  29:	4c 89 e7             	mov    %r12,%rdi
  2c:	ff 53 18             	callq  *0x18(%rbx)
  2f:	48 89 d8             	mov    %rbx,%rax
  32:	48 c1 e8 03          	shr    $0x3,%rax
  36:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
  3a:	75 69                	jne    0xa5
  3c:	48                   	rex.W


Tested on:

commit:         2f111a6f Merge tag 'ceph-for-5.15-rc7' of git://github..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
console output: https://syzkaller.appspot.com/x/log.txt?x=179ee8d2b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=61f4d9af07d3bbdf
dashboard link: https://syzkaller.appspot.com/bug?extid=fd9d03311cdce9a9ec36
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1245f39cb00000

