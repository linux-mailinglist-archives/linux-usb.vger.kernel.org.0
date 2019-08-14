Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E04A28D56B
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2019 15:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbfHNNwh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Aug 2019 09:52:37 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36388 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbfHNNwh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Aug 2019 09:52:37 -0400
Received: by mail-pf1-f196.google.com with SMTP id w2so2801741pfi.3
        for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2019 06:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zt+xiplY2hlHGuRNKfov1NMvitBc9ccHDkOaOHjTvFA=;
        b=kaL4CdX1K7X9LjIDcUaHms36paBXu7zoOfw1XXCwcg9pR7zRbDtHZ6P50XQM3/5ira
         lyZov1ynX6gPyabr0Ha9HfwjQUgtKVHA8+WHxT4G4EMcptiwu9rDURYAzVnvjDE495lf
         fxqiV9CRum2Bm2mfHFSD9A7y1mMCboDOYfrCe5Ic3Yadg7ztDi0xjg3LT9aiOuM3Ev9F
         PCkOdX5JncbKbbOMKJR78lCTJCRLsDpC38pIv8pTNM0y3mn/DTyhQK1UWNMD/vlEkbQs
         rSIHXCsFhoIvMnXy9Q/UgENQrEUIa5UiRPJwXnZbjh7dflAPeABA+cQZ6YV2mdVoNX+Z
         I9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zt+xiplY2hlHGuRNKfov1NMvitBc9ccHDkOaOHjTvFA=;
        b=iqwI+WXaI/RPvJ0aQMQcDqYK/SnjpwR2LI9a1AXRK3UMwqH7eq8pb+fbVjJxFu6oVd
         GcP6T4OvzzXqeDkYRYNRRSjZ7s/RKNKpuCdGncgkbOZcNKtd5wdokrhHIAzpcvqywcDi
         SiAt699DCtiZSF2h0MzfsnhQ85IE/Zhmuv2kowi4awZemdq7pw9pwG7DY481LtWH2L+t
         F88hE/z3eDzYqIUBEQbgVfP/ZGl2gQITTsPVdOzfYlTPvliJkEE2KE2G2gnTpSqyTk3/
         ch7Vkb55tjBhmt6AIDM8pHTPjbuExXyGlqrFzirMOg5uxNdPCW+U7zDuHCkKJgX1RcN1
         6jVQ==
X-Gm-Message-State: APjAAAX2c3Xz1MrH22Jy2YC6JRkFjZPh8jHsll4NHo1s59NruVI93qDX
        vwW61DcQ4R4OKcP3R3gw2mYWJ5ANgUrWmxC96tTKk2Ww2AE=
X-Google-Smtp-Source: APXvYqzOY1sqsiUyUa7bD5KDieOBmfMjYEiJt3ffgZJ/WF0ApFZCROjGcaXX0DRPTBQQ+0HG+uWWrjNr2YRjoWul64w=
X-Received: by 2002:a63:3006:: with SMTP id w6mr39448172pgw.440.1565790756122;
 Wed, 14 Aug 2019 06:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <1565789116.5780.1.camel@suse.com> <000000000000a59094059013dd63@google.com>
In-Reply-To: <000000000000a59094059013dd63@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 14 Aug 2019 15:52:22 +0200
Message-ID: <CAAeHK+wTrChMEiVX2FH5vAas3wS=ZRQrKbh5qc=uDUL=dTh1kg@mail.gmail.com>
Subject: Re: divide error in usbtmc_generic_read
To:     syzbot <syzbot+55b0304b360654a7537b@syzkaller.appspotmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        guido.kiener@rohde-schwarz.com,
        USB list <linux-usb@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>, steve_bayless@keysight.com,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 14, 2019 at 3:38 PM syzbot
<syzbot+55b0304b360654a7537b@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot has tested the proposed patch but the reproducer still triggered
> crash:
> KASAN: use-after-free Read in usbtmc_disconnect

Looks like a different bug in the same driver that gets triggered by
the same reproducer =)

You fix looks good to me.

>
> usb 5-1: USB disconnect, device number 2
> ==================================================================
> BUG: KASAN: use-after-free in __mutex_lock_common
> kernel/locking/mutex.c:912 [inline]
> BUG: KASAN: use-after-free in __mutex_lock+0xf23/0x1360
> kernel/locking/mutex.c:1077
> Read of size 8 at addr ffff8881d63299c8 by task kworker/1:0/17
>
> CPU: 1 PID: 17 Comm: kworker/1:0 Not tainted 5.3.0-rc4+ #1
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
>   usbtmc_disconnect+0x58/0x180 drivers/usb/class/usbtmc.c:2443
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
> Allocated by task 1737:
>   save_stack+0x1b/0x80 mm/kasan/common.c:69
>   set_track mm/kasan/common.c:77 [inline]
>   __kasan_kmalloc mm/kasan/common.c:487 [inline]
>   __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:460
>   kmalloc include/linux/slab.h:552 [inline]
>   kzalloc include/linux/slab.h:748 [inline]
>   usbtmc_probe+0xad/0x1360 drivers/usb/class/usbtmc.c:2328
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
> Freed by task 1737:
>   save_stack+0x1b/0x80 mm/kasan/common.c:69
>   set_track mm/kasan/common.c:77 [inline]
>   __kasan_slab_free+0x130/0x180 mm/kasan/common.c:449
>   slab_free_hook mm/slub.c:1423 [inline]
>   slab_free_freelist_hook mm/slub.c:1474 [inline]
>   slab_free mm/slub.c:3016 [inline]
>   kfree+0xe4/0x2f0 mm/slub.c:3957
>   kref_put include/linux/kref.h:65 [inline]
>   usbtmc_probe+0x55c/0x1360 drivers/usb/class/usbtmc.c:2433
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
> The buggy address belongs to the object at ffff8881d6329900
>   which belongs to the cache kmalloc-512 of size 512
> The buggy address is located 200 bytes inside of
>   512-byte region [ffff8881d6329900, ffff8881d6329b00)
> The buggy address belongs to the page:
> page:ffffea000758ca00 refcount:1 mapcount:0 mapping:ffff8881da002500
> index:0x0 compound_mapcount: 0
> flags: 0x200000000010200(slab|head)
> raw: 0200000000010200 ffffea0007585680 0000000700000007 ffff8881da002500
> raw: 0000000000000000 00000000000c000c 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
>
> Memory state around the buggy address:
>   ffff8881d6329880: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>   ffff8881d6329900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > ffff8881d6329980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                                                ^
>   ffff8881d6329a00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>   ffff8881d6329a80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ==================================================================
>
>
> Tested on:
>
> commit:         d0847550 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=10ac29ee600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=dbc9c80cc095da19
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=11f3b2e2600000
>
