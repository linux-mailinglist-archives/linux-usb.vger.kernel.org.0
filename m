Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD974B4C49
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2019 12:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbfIQKxK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Sep 2019 06:53:10 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:40221 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbfIQKxK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Sep 2019 06:53:10 -0400
Received: by mail-qk1-f194.google.com with SMTP id y144so3436609qkb.7
        for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2019 03:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gkg+nZ6zi1tYUijZNNFRu025nOAFP0y+TDupVYd8QVY=;
        b=mxAusTgDCUmwD4zPAYB1KumzASALJel8+2zls8sQF8ebB3mfaxEOnNEg55bV8B/Bbp
         ONg/0shNbpzS+PVrXJ4pwlGUVwWb9z0/tp5pl0D37Bec94jRSk+6+1yXzn6wvX4YHMFA
         l9pliykq3AijpnSmoF31epugq/6oEFrtO7VzaCYd4Bvq+/7qe7Tw9uWumYvvdP7Zc2bI
         p+Wj5mxm/rW7JwFNuX8RwHl0BYIl1/VgnjyfUpiSAuuJuQeMp0p25zodB0F9UhAxn2TP
         cIsvqz6B7JSYqN4YWBpeFxPDj6QMqgrLgs26X/P2I/FwY7KB75s9Wf2wPJ114+lpS0Fy
         5XzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gkg+nZ6zi1tYUijZNNFRu025nOAFP0y+TDupVYd8QVY=;
        b=miz2HMlSnBq2DRZCY1NmMZ3J39expmgS/dBwe6jctOQHEdh4inNhP/k03+EbJl3fEO
         9EWfZYLLtmGUl+e7yrU+H5T9brXQMILo+C+S+OyP4JoOycllXyDM5Vyj5PTJqj5RTin9
         pBe4m2FuTwbHex9eC5syJ9gzhQpaLQbJaZvJjpDe0NMiYkRnpcNRyJJXcJc732SErGi6
         O0jGXMhsTq59FUXYe+0hR/Xk2rYyQyiqJ0BynmMLDPUz5MBRcy8iiSxiya8pssiWcwGv
         MCSTNnOYtseZ3OR8SpbbXyOST0KnW5JUEPdN7yCS/PIOTk6XN6/xQolneNw88v7+MUiD
         rV+w==
X-Gm-Message-State: APjAAAUONhW+496rtaOwG+COqaQO3GuFp7mSpubhjRPpctFcql0eyCXV
        hzHbti+dSQrvghnQTTnb4zZSBSWcQlYPXLwsxX2t6Q==
X-Google-Smtp-Source: APXvYqzmN+LzxoeargmRXxcl4h9+DGrJwoKFWZvXFgs0B57Brs750XHhphU+5MZ3+fJ1DrVtGW+upJDRWoPt1AXLYFA=
X-Received: by 2002:a37:e10f:: with SMTP id c15mr2903114qkm.256.1568717588698;
 Tue, 17 Sep 2019 03:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000b1f1050592ab96ee@google.com> <Pine.LNX.4.44L0.1909161236580.1489-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1909161236580.1489-100000@iolanthe.rowland.org>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 17 Sep 2019 12:52:55 +0200
Message-ID: <CACT4Y+bRKjVG7iUZnEXsec_29wMzncvtwAo7cnDNj+17mqL0SA@mail.gmail.com>
Subject: Re: possible deadlock in open_rio (2)
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+19cf612d23f66bc19f22@syzkaller.appspotmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>, miquel@df.uba.ar,
        rio500-users@lists.sourceforge.net,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 16, 2019 at 6:40 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Mon, 16 Sep 2019, syzbot wrote:
>
> > Hello,
> >
> > syzbot found the following crash on:
> >
> > HEAD commit:    f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=11512cd1600000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
> > dashboard link: https://syzkaller.appspot.com/bug?extid=19cf612d23f66bc19f22
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16f92c6e600000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10b9b85e600000
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+19cf612d23f66bc19f22@syzkaller.appspotmail.com
> >
> > ======================================================
> > WARNING: possible circular locking dependency detected
> > 5.3.0-rc7+ #0 Not tainted
> > ------------------------------------------------------
> > syz-executor071/1724 is trying to acquire lock:
> > 00000000f749c934 (rio500_mutex){+.+.}, at: open_rio+0x16/0xe0
> > drivers/usb/misc/rio500.c:65
> >
> > but task is already holding lock:
> > 000000009c24ba51 (minor_rwsem){++++}, at: usb_open+0x23/0x270
> > drivers/usb/core/file.c:39
> >
> > which lock already depends on the new lock.
> >
> >
> > the existing dependency chain (in reverse order) is:
> >
> > -> #1 (minor_rwsem){++++}:
> >         down_write+0x92/0x150 kernel/locking/rwsem.c:1500
> >         usb_register_dev drivers/usb/core/file.c:187 [inline]
> >         usb_register_dev+0x131/0x670 drivers/usb/core/file.c:156
> >         probe_rio.cold+0x53/0x237 drivers/usb/misc/rio500.c:474
> >         usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
> >         really_probe+0x281/0x6d0 drivers/base/dd.c:548
> >         driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
> >         __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
> >         bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
> >         __device_attach+0x217/0x360 drivers/base/dd.c:894
> >         bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
> >         device_add+0xae6/0x16f0 drivers/base/core.c:2165
> >         usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
> >         generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
> >         usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
> >         really_probe+0x281/0x6d0 drivers/base/dd.c:548
> >         driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
> >         __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
> >         bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
> >         __device_attach+0x217/0x360 drivers/base/dd.c:894
> >         bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
> >         device_add+0xae6/0x16f0 drivers/base/core.c:2165
> >         usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
> >         hub_port_connect drivers/usb/core/hub.c:5098 [inline]
> >         hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
> >         port_event drivers/usb/core/hub.c:5359 [inline]
> >         hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
> >         process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
> >         worker_thread+0x96/0xe20 kernel/workqueue.c:2415
> >         kthread+0x318/0x420 kernel/kthread.c:255
> >         ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> >
> > -> #0 (rio500_mutex){+.+.}:
> >         check_prev_add kernel/locking/lockdep.c:2405 [inline]
> >         check_prevs_add kernel/locking/lockdep.c:2507 [inline]
> >         validate_chain kernel/locking/lockdep.c:2897 [inline]
> >         __lock_acquire+0x1f7c/0x3b50 kernel/locking/lockdep.c:3880
> >         lock_acquire+0x127/0x320 kernel/locking/lockdep.c:4412
> >         __mutex_lock_common kernel/locking/mutex.c:930 [inline]
> >         __mutex_lock+0x158/0x1360 kernel/locking/mutex.c:1077
> >         open_rio+0x16/0xe0 drivers/usb/misc/rio500.c:65
> >         usb_open+0x1df/0x270 drivers/usb/core/file.c:48
> >         chrdev_open+0x219/0x5c0 fs/char_dev.c:414
> >         do_dentry_open+0x494/0x1120 fs/open.c:797
> >         do_last fs/namei.c:3416 [inline]
> >         path_openat+0x1430/0x3f50 fs/namei.c:3533
> >         do_filp_open+0x1a1/0x280 fs/namei.c:3563
> >         do_sys_open+0x3c0/0x580 fs/open.c:1089
> >         do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
> >         entry_SYSCALL_64_after_hwframe+0x49/0xbe
> >
> > other info that might help us debug this:
> >
> >   Possible unsafe locking scenario:
> >
> >         CPU0                    CPU1
> >         ----                    ----
> >    lock(minor_rwsem);
> >                                 lock(rio500_mutex);
> >                                 lock(minor_rwsem);
> >    lock(rio500_mutex);
> >
> >   *** DEADLOCK ***
> >
> > 1 lock held by syz-executor071/1724:
> >   #0: 000000009c24ba51 (minor_rwsem){++++}, at: usb_open+0x23/0x270
> > drivers/usb/core/file.c:39
> >
> > stack backtrace:
> > CPU: 0 PID: 1724 Comm: syz-executor071 Not tainted 5.3.0-rc7+ #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> > Google 01/01/2011
> > Call Trace:
> >   __dump_stack lib/dump_stack.c:77 [inline]
> >   dump_stack+0xca/0x13e lib/dump_stack.c:113
> >   check_noncircular+0x345/0x3e0 kernel/locking/lockdep.c:1741
> >   check_prev_add kernel/locking/lockdep.c:2405 [inline]
> >   check_prevs_add kernel/locking/lockdep.c:2507 [inline]
> >   validate_chain kernel/locking/lockdep.c:2897 [inline]
> >   __lock_acquire+0x1f7c/0x3b50 kernel/locking/lockdep.c:3880
> >   lock_acquire+0x127/0x320 kernel/locking/lockdep.c:4412
> >   __mutex_lock_common kernel/locking/mutex.c:930 [inline]
> >   __mutex_lock+0x158/0x1360 kernel/locking/mutex.c:1077
> >   open_rio+0x16/0xe0 drivers/usb/misc/rio500.c:65
> >   usb_open+0x1df/0x270 drivers/usb/core/file.c:48
> >   chrdev_open+0x219/0x5c0 fs/char_dev.c:414
> >   do_dentry_open+0x494/0x1120 fs/open.c:797
> >   do_last fs/namei.c:3416 [inline]
> >   path_openat+0x1430/0x3f50 fs/namei.c:3533
> >   do_filp_open+0x1a1/0x280 fs/namei.c:3563
> >   do_sys_open+0x3c0/0x580 fs/open.c:1089
> >   do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
> >   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> > RIP: 0033:0x401130
> > Code: 01 f0 ff ff 0f 83 00 0b 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f
> > 44 00 00 83 3d 5d 0c 2d 00 00 75 14 b8 02 00 00 00 0f 05 <48> 3d 01 f0 ff
> > ff 0f 83 d4 0a 00 00 c3 48 83 ec 08 e8 3a 00 00 00
> > RSP: 002b:00007ffca0216788 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
> > RAX: ffffffffffffffda RBX: 00000000004002c8 RCX: 0000000000401130
> > RDX: 0000000000000000 RSI: 0000000000000002 RDI: 00007ffca02167a0
> > RBP: 00000000006cb018 R08: 0000000000000000 R09: 000000000000000f
> > R10: 0000000000000064 R11: 0000000000000246 R12: 0000000000402090
> > R13: 0000000000402120 R14: 0000000000000000 R15: 00
> >
> >
> > ---
> > This bug is generated by a bot. It may contain errors.
> > See https://goo.gl/tpsmEJ for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
> >
> > syzbot will keep track of this bug report. See:
> > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> > syzbot can test patches for this bug, for details see:
> > https://goo.gl/tpsmEJ#testing-patches
>
> This is undoubted the same as the previous bug report.  It should be
> fixed by commit 9472aff16ca0 in Greg KH's usb-next branch, but the
> fix is not yet in Linus's tree.
>
> #syz dup: possible deadlock in open_rio

Are you ready to bet money that this is undoubtedly the same as the
previous one? ;)
syzbot never reports the same bug until the previous is completely
fixed. I see the commit in Linus tree.
We will get version (3) of this bug soon.
