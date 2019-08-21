Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFD7979FA
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 14:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728551AbfHUMyn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 08:54:43 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:34825 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728480AbfHUMyn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Aug 2019 08:54:43 -0400
Received: by mail-io1-f72.google.com with SMTP id p2so2538597iod.2
        for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2019 05:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to:cc;
        bh=0zc+MDZYLY5B8yoBpPS6OfUBoiNqbf0RiIuqKAd9YMo=;
        b=gw47yHuhsaikSI4S8sc4fGUvSBEXhXhzSWlYPjb3YmdIcAjFLliI5c8H0p+ltpD+W1
         CWwNYbJEXVX+KgsnfTn7UVHfeRG8oXr7+FjPMMjcr2YTe0WyB4fNeLlFFf4NgY1/Qy4Z
         0TH++rnh0yncwG+nlSKFC44O4MmGuHMzVBDb+mjrR+jpMi2AOt5JVumuYwTSaaGRLmHY
         O/ldiP9hdiR7lGkshQ03rSoEgMpasAU7SuezE8IAvno7QrSJEQotwirbC+DUv1IweAxZ
         vZmceEwtSxojWKGyQNCHIipAjekZKwZhVnTbTYh7bPKxmOfjvT4hQleT7P2oI0zLPBl4
         Uv5Q==
X-Gm-Message-State: APjAAAVkW9n00KXl/hRGH9cF29GGXi1S4aZijBpA4QPdT+v7NxZEnCGu
        QZrL/56pmkM9S/mIc0qbNWOmrhJglFXObr4LfaIBxinRvoGi
X-Google-Smtp-Source: APXvYqyeEYsokQTHl08XM9rN0gl/rKcEeqN8/ilwKu/y2biaWdYPG3nptUvUSzW4MhB7DeM6ulx4Wuj9/k5q7Zjb6sJk7xhl+wwR
MIME-Version: 1.0
X-Received: by 2002:a6b:6012:: with SMTP id r18mr6414733iog.241.1566392082478;
 Wed, 21 Aug 2019 05:54:42 -0700 (PDT)
Date:   Wed, 21 Aug 2019 05:54:42 -0700
In-Reply-To: <CAAeHK+xfMTrzGMDPwpB5LyXLb0fijwZhSHs-s6Z9+HhEBXp9MA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a7c4ed0590a013e4@google.com>
Subject: Re: Re: KASAN: use-after-free Read in hidraw_ioctl
From:   syzbot <syzbot+ded1794a717e3b235226@syzkaller.appspotmail.com>
To:     "'Andrey Konovalov' via syzkaller-bugs" 
        <syzkaller-bugs@googlegroups.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> On Tue, Jul 23, 2019 at 2:48 PM syzbot
> <syzbot+ded1794a717e3b235226@syzkaller.appspotmail.com> wrote:

>> Hello,

>> syzbot found the following crash on:

>> HEAD commit:    6a3599ce usb-fuzzer: main usb gadget fuzzer driver
>> git tree:       https://github.com/google/kasan.git usb-fuzzer
>> console output: https://syzkaller.appspot.com/x/log.txt?x=107e7264600000
>> kernel config:   
>> https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
>> dashboard link:  
>> https://syzkaller.appspot.com/bug?extid=ded1794a717e3b235226
>> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>> syz repro:       
>> https://syzkaller.appspot.com/x/repro.syz?x=13b98b4c600000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1619b07c600000

>> IMPORTANT: if you fix the bug, please add the following tag to the  
>> commit:
>> Reported-by: syzbot+ded1794a717e3b235226@syzkaller.appspotmail.com

>> ==================================================================
>> BUG: KASAN: use-after-free in hidraw_ioctl+0x609/0xaf0
>> /drivers/hid/hidraw.c:380
>> Read of size 4 at addr ffff8881d549a118 by task syz-executor073/2445

>> CPU: 0 PID: 2445 Comm: syz-executor073 Not tainted 5.2.0-rc6+ #15
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
>> Google 01/01/2011
>> Call Trace:
>>    __dump_stack /lib/dump_stack.c:77 [inline]
>>    dump_stack+0xca/0x13e /lib/dump_stack.c:113
>>    print_address_description+0x67/0x231 /mm/kasan/report.c:188
>>    __kasan_report.cold+0x1a/0x32 /mm/kasan/report.c:317
>>    kasan_report+0xe/0x20 /mm/kasan/common.c:614
>>    hidraw_ioctl+0x609/0xaf0 /drivers/hid/hidraw.c:380
>>    vfs_ioctl /fs/ioctl.c:46 [inline]
>>    file_ioctl /fs/ioctl.c:509 [inline]
>>    do_vfs_ioctl+0xcda/0x12e0 /fs/ioctl.c:696
>>    ksys_ioctl+0x9b/0xc0 /fs/ioctl.c:713
>>    __do_sys_ioctl /fs/ioctl.c:720 [inline]
>>    __se_sys_ioctl /fs/ioctl.c:718 [inline]
>>    __x64_sys_ioctl+0x6f/0xb0 /fs/ioctl.c:718
>>    do_syscall_64+0xb7/0x560 /arch/x86/entry/common.c:301
>>    entry_SYSCALL_64_after_hwframe+0x49/0xbe
>> RIP: 0033:0x451fd9
>> Code: e8 ec e7 ff ff 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89  
>> f7
>> 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff
>> ff 0f 83 5b cb fb ff c3 66 2e 0f 1f 84 00 00 00 00
>> RSP: 002b:00007f3144bd5ce8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>> RAX: ffffffffffffffda RBX: 00000000006e3c88 RCX: 0000000000451fd9
>> RDX: 00000000200015c0 RSI: 0000000080044801 RDI: 0000000000000005
>> RBP: 00000000006e3c80 R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000000 R11: 0000000000000246 R12: 00000000006e3c8c
>> R13: 00007ffc64ba492f R14: 00007f3144bd69c0 R15: 0000000000000002

>> Allocated by task 5:
>>    save_stack+0x1b/0x80 /mm/kasan/common.c:71
>>    set_track /mm/kasan/common.c:79 [inline]
>>    __kasan_kmalloc /mm/kasan/common.c:489 [inline]
>>    __kasan_kmalloc.constprop.0+0xbf/0xd0 /mm/kasan/common.c:462
>>    kmalloc /./include/linux/slab.h:547 [inline]
>>    kzalloc /./include/linux/slab.h:742 [inline]
>>    hid_allocate_device+0x3e/0x480 /drivers/hid/hid-core.c:2389
>>    usbhid_probe+0x23e/0xfa0 /drivers/hid/usbhid/hid-core.c:1321
>>    usb_probe_interface+0x305/0x7a0 /drivers/usb/core/driver.c:361
>>    really_probe+0x281/0x660 /drivers/base/dd.c:509
>>    driver_probe_device+0x104/0x210 /drivers/base/dd.c:670
>>    __device_attach_driver+0x1c2/0x220 /drivers/base/dd.c:777
>>    bus_for_each_drv+0x15c/0x1e0 /drivers/base/bus.c:454
>>    __device_attach+0x217/0x360 /drivers/base/dd.c:843
>>    bus_probe_device+0x1e4/0x290 /drivers/base/bus.c:514
>>    device_add+0xae6/0x16f0 /drivers/base/core.c:2111
>>    usb_set_configuration+0xdf6/0x1670 /drivers/usb/core/message.c:2023
>>    generic_probe+0x9d/0xd5 /drivers/usb/core/generic.c:210
>>    usb_probe_device+0x99/0x100 /drivers/usb/core/driver.c:266
>>    really_probe+0x281/0x660 /drivers/base/dd.c:509
>>    driver_probe_device+0x104/0x210 /drivers/base/dd.c:670
>>    __device_attach_driver+0x1c2/0x220 /drivers/base/dd.c:777
>>    bus_for_each_drv+0x15c/0x1e0 /drivers/base/bus.c:454
>>    __device_attach+0x217/0x360 /drivers/base/dd.c:843
>>    bus_probe_device+0x1e4/0x290 /drivers/base/bus.c:514
>>    device_add+0xae6/0x16f0 /drivers/base/core.c:2111
>>    usb_new_device.cold+0x6a4/0xe61 /drivers/usb/core/hub.c:2536
>>    hub_port_connect /drivers/usb/core/hub.c:5098 [inline]
>>    hub_port_connect_change /drivers/usb/core/hub.c:5213 [inline]
>>    port_event /drivers/usb/core/hub.c:5359 [inline]
>>    hub_event+0x1abd/0x3550 /drivers/usb/core/hub.c:5441
>>    process_one_work+0x905/0x1570 /kernel/workqueue.c:2269
>>    worker_thread+0x96/0xe20 /kernel/workqueue.c:2415
>>    kthread+0x30b/0x410 /kernel/kthread.c:255
>>    ret_from_fork+0x24/0x30 /arch/x86/entry/entry_64.S:352

>> Freed by task 1781:
>>    save_stack+0x1b/0x80 /mm/kasan/common.c:71
>>    set_track /mm/kasan/common.c:79 [inline]
>>    __kasan_slab_free+0x130/0x180 /mm/kasan/common.c:451
>>    slab_free_hook /mm/slub.c:1421 [inline]
>>    slab_free_freelist_hook /mm/slub.c:1448 [inline]
>>    slab_free /mm/slub.c:2994 [inline]
>>    kfree+0xd7/0x280 /mm/slub.c:3949
>>    device_release+0x71/0x200 /drivers/base/core.c:1064
>>    kobject_cleanup /lib/kobject.c:691 [inline]
>>    kobject_release /lib/kobject.c:720 [inline]
>>    kref_put /./include/linux/kref.h:65 [inline]
>>    kobject_put+0x171/0x280 /lib/kobject.c:737
>>    put_device+0x1b/0x30 /drivers/base/core.c:2210
>>    usbhid_disconnect+0x90/0xd0 /drivers/hid/usbhid/hid-core.c:1413
>>    usb_unbind_interface+0x1bd/0x8a0 /drivers/usb/core/driver.c:423
>>    __device_release_driver /drivers/base/dd.c:1081 [inline]
>>    device_release_driver_internal+0x404/0x4c0 /drivers/base/dd.c:1112
>>    bus_remove_device+0x2dc/0x4a0 /drivers/base/bus.c:556
>>    device_del+0x460/0xb80 /drivers/base/core.c:2274
>>    usb_disable_device+0x211/0x690 /drivers/usb/core/message.c:1237
>>    usb_disconnect+0x284/0x830 /drivers/usb/core/hub.c:2199
>>    hub_port_connect /drivers/usb/core/hub.c:4949 [inline]
>>    hub_port_connect_change /drivers/usb/core/hub.c:5213 [inline]
>>    port_event /drivers/usb/core/hub.c:5359 [inline]
>>    hub_event+0x13bd/0x3550 /drivers/usb/core/hub.c:5441
>>    process_one_work+0x905/0x1570 /kernel/workqueue.c:2269
>>    worker_thread+0x96/0xe20 /kernel/workqueue.c:2415
>>    kthread+0x30b/0x410 /kernel/kthread.c:255
>>    ret_from_fork+0x24/0x30 /arch/x86/entry/entry_64.S:352

>> The buggy address belongs to the object at ffff8881d549a100
>>    which belongs to the cache kmalloc-8k of size 8192
>> The buggy address is located 24 bytes inside of
>>    8192-byte region [ffff8881d549a100, ffff8881d549c100)
>> The buggy address belongs to the page:
>> page:ffffea0007552600 refcount:1 mapcount:0 mapping:ffff8881dac02400
>> index:0x0 compound_mapcount: 0
>> flags: 0x200000000010200(slab|head)
>> raw: 0200000000010200 dead000000000100 dead000000000200 ffff8881dac02400
>> raw: 0000000000000000 0000000000030003 00000001ffffffff 0000000000000000
>> page dumped because: kasan: bad access detected

>> Memory state around the buggy address:
>>    ffff8881d549a000: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>>    ffff8881d549a080: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>> > ffff8881d549a100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>                               ^
>>    ffff8881d549a180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>    ffff8881d549a200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>> ==================================================================


>> ---
>> This bug is generated by a bot. It may contain errors.
>> See https://goo.gl/tpsmEJ for more information about syzbot.
>> syzbot engineers can be reached at syzkaller@googlegroups.com.

>> syzbot will keep track of this bug report. See:
>> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>> syzbot can test patches for this bug, for details see:
>> https://goo.gl/tpsmEJ#testing-patches

> Trying Alan's fix from another thread here:

> #syz test: https://github.com/google/kasan.git usb-fuzzer 6a3599ce

want 2 args (repo, branch), got 3


> --
> You received this message because you are subscribed to the Google  
> Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an  
> email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit  
> https://groups.google.com/d/msgid/syzkaller-bugs/CAAeHK%2BxfMTrzGMDPwpB5LyXLb0fijwZhSHs-s6Z9%2BHhEBXp9MA%40mail.gmail.com.
