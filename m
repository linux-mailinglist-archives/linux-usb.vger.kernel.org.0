Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 369E810277B
	for <lists+linux-usb@lfdr.de>; Tue, 19 Nov 2019 15:58:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727456AbfKSO6G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Nov 2019 09:58:06 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38832 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727316AbfKSO6G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Nov 2019 09:58:06 -0500
Received: by mail-pf1-f193.google.com with SMTP id c13so12300738pfp.5
        for <linux-usb@vger.kernel.org>; Tue, 19 Nov 2019 06:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8Iv0SYeCQzXPVK6d6zw+PhVxLjr+hZq6IoPt4clytvA=;
        b=QJI7Ro6ixcBU7Jip0bWx374Gd/SB4poGcYiSqt2Gx2/rkilbfFufDakZ/feLGSwgYi
         vy4yE/vie2CtWMoAkGeO+ReKrCXHXC/eLLFfGUwOx/VgUrxTrFezlUEGe6yp8JniHAIU
         EuqQZ2Af2WOTkhCurjTM3uhV+dLSDOwRclzdwsdHOMCA2CJnWlbUZOQPsJgYOWQtM3mN
         mNEZ53ujqcHhDFp2eU6zWzkIXDeHYtNhi+BkngUAo2v8SMiS6/5JH0BiMCf/QEZ6GhbB
         3PyEqs3B6oP+VaZDBWnu6IEXoPvnU/6350LgC7B3o8bP+e9gYC286fN5QBbhT8TA/jq8
         hraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Iv0SYeCQzXPVK6d6zw+PhVxLjr+hZq6IoPt4clytvA=;
        b=bPRxI7iBqYMI9zVnqdfKmD3MoLWl1D669g9/uY7mrh7VLmlajQZJm/ApCyF9rk7/fl
         SMPi5+4IF+9sNHxqCR5IyoGa5WTO6n2q4xYfHdPg5V1vYqpyotKKmuRTwDJioKxydarc
         Bh4xetNkXY2KV1FOMWiw3vL0aNJw1k7edW+nfNT3KPqJS9S3Zl3gDa8/S04sj2ENIvVn
         aDbDxl1C41sW8aBBNEg/fa/orn+I1KCIVVBKtvzSWm4C0nxg9zMQvoPkJSSgWJLXjyjQ
         Qcouz+z8uqm9IMEOOB9WA6+0NVAivpWghr3NXiZsNJ8jkqkso07ccrJf57ehbJPXVGSs
         Ep4g==
X-Gm-Message-State: APjAAAWQAgTLWkX6E82n2Io2zDC3AP/L3kntNQYNKXvRGXSDb+eYSUiW
        LFh8GP5DKY8gR7YvrASs6Iza6LfqfGTX48KWObyYCQ==
X-Google-Smtp-Source: APXvYqw4I7Q9HHJB9PXYlOP8WNTMSs7SVqsTbqHP7cbcCSjaPg653l1nVQWe72vDXXM1eKQRxz//Dq13dUy6nyJhLkA=
X-Received: by 2002:a65:5648:: with SMTP id m8mr954974pgs.286.1574175484917;
 Tue, 19 Nov 2019 06:58:04 -0800 (PST)
MIME-Version: 1.0
References: <00000000000090564a0590796d2f@google.com>
In-Reply-To: <00000000000090564a0590796d2f@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 19 Nov 2019 15:57:52 +0100
Message-ID: <CAAeHK+wfca0d0qgCw96LbRutymzeV4tk34TkLUvO51hCRAp8cg@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in iowarrior_disconnect
To:     syzbot <syzbot+cfe6d93e0abab9a0de05@syzkaller.appspotmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kees Cook <keescook@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 19, 2019 at 4:48 PM syzbot
<syzbot+cfe6d93e0abab9a0de05@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    d0847550 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=139be302600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=dbc9c80cc095da19
> dashboard link: https://syzkaller.appspot.com/bug?extid=cfe6d93e0abab9a0de05
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12fe6b02600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1548189c600000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+cfe6d93e0abab9a0de05@syzkaller.appspotmail.com
>
> ==================================================================
> BUG: KASAN: use-after-free in __mutex_lock_common
> kernel/locking/mutex.c:912 [inline]
> BUG: KASAN: use-after-free in __mutex_lock+0xf23/0x1360
> kernel/locking/mutex.c:1077
> Read of size 8 at addr ffff8881cc866f58 by task kworker/1:5/1755
>
> CPU: 1 PID: 1755 Comm: kworker/1:5 Not tainted 5.3.0-rc4+ #26
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0xca/0x13e lib/dump_stack.c:113
>   print_address_description+0x6a/0x32c mm/kasan/report.c:351
>   __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
>   kasan_report+0xe/0x12 mm/kasan/common.c:612
>   __mutex_lock_common kernel/locking/mutex.c:912 [inline]
>   __mutex_lock+0xf23/0x1360 kernel/locking/mutex.c:1077
>   iowarrior_disconnect+0xf0/0x2c0 drivers/usb/misc/iowarrior.c:878
>   usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
>   __device_release_driver drivers/base/dd.c:1134 [inline]
>   device_release_driver_internal+0x42f/0x500 drivers/base/dd.c:1165
>   bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:556
>   device_del+0x420/0xb10 drivers/base/core.c:2339
>   usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
>   usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2199
>   hub_port_connect drivers/usb/core/hub.c:4949 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
>   port_event drivers/usb/core/hub.c:5359 [inline]
>   hub_event+0x1454/0x3640 drivers/usb/core/hub.c:5441
>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> Allocated by task 1755:
>   save_stack+0x1b/0x80 mm/kasan/common.c:69
>   set_track mm/kasan/common.c:77 [inline]
>   __kasan_kmalloc mm/kasan/common.c:487 [inline]
>   __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:460
>   kmalloc include/linux/slab.h:552 [inline]
>   kzalloc include/linux/slab.h:748 [inline]
>   iowarrior_probe+0x7a/0x10b2 drivers/usb/misc/iowarrior.c:753
>   usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
>   really_probe+0x281/0x6d0 drivers/base/dd.c:548
>   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
>   bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x217/0x360 drivers/base/dd.c:894
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>   device_add+0xae6/0x16f0 drivers/base/core.c:2165
>   usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
>   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
>   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
>   really_probe+0x281/0x6d0 drivers/base/dd.c:548
>   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
>   bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x217/0x360 drivers/base/dd.c:894
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>   device_add+0xae6/0x16f0 drivers/base/core.c:2165
>   usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
>   hub_port_connect drivers/usb/core/hub.c:5098 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
>   port_event drivers/usb/core/hub.c:5359 [inline]
>   hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> Freed by task 1857:
>   save_stack+0x1b/0x80 mm/kasan/common.c:69
>   set_track mm/kasan/common.c:77 [inline]
>   __kasan_slab_free+0x130/0x180 mm/kasan/common.c:449
>   slab_free_hook mm/slub.c:1423 [inline]
>   slab_free_freelist_hook mm/slub.c:1474 [inline]
>   slab_free mm/slub.c:3016 [inline]
>   kfree+0xe4/0x2f0 mm/slub.c:3957
>   iowarrior_delete drivers/usb/misc/iowarrior.c:246 [inline]
>   iowarrior_release+0x187/0x280 drivers/usb/misc/iowarrior.c:670
>   __fput+0x2d7/0x840 fs/file_table.c:280
>   task_work_run+0x13f/0x1c0 kernel/task_work.c:113
>   exit_task_work include/linux/task_work.h:22 [inline]
>   do_exit+0x8ef/0x2c00 kernel/exit.c:879
>   do_group_exit+0x125/0x340 kernel/exit.c:983
>   __do_sys_exit_group kernel/exit.c:994 [inline]
>   __se_sys_exit_group kernel/exit.c:992 [inline]
>   __x64_sys_exit_group+0x3a/0x50 kernel/exit.c:992
>   do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
>
> The buggy address belongs to the object at ffff8881cc866f00
>   which belongs to the cache kmalloc-512 of size 512
> The buggy address is located 88 bytes inside of
>   512-byte region [ffff8881cc866f00, ffff8881cc867100)
> The buggy address belongs to the page:
> page:ffffea0007321980 refcount:1 mapcount:0 mapping:ffff8881da002500
> index:0x0 compound_mapcount: 0
> flags: 0x200000000010200(slab|head)
> raw: 0200000000010200 ffffea000733fc80 0000000200000002 ffff8881da002500
> raw: 0000000000000000 00000000000c000c 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
>
> Memory state around the buggy address:
>   ffff8881cc866e00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>   ffff8881cc866e80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> > ffff8881cc866f00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                                                      ^
>   ffff8881cc866f80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>   ffff8881cc867000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ==================================================================
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

#syz fix: USB: iowarrior: fix use-after-free on disconnect
