Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF1445618F
	for <lists+linux-usb@lfdr.de>; Thu, 18 Nov 2021 18:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234143AbhKRRhH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Nov 2021 12:37:07 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:45692 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232058AbhKRRhH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Nov 2021 12:37:07 -0500
Received: by mail-io1-f72.google.com with SMTP id ay10-20020a5d9d8a000000b005e238eaeaa9so4025597iob.12
        for <linux-usb@vger.kernel.org>; Thu, 18 Nov 2021 09:34:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=OF23fODAMeOrtXiUL+ALEwubT88aRWMtuuk3jlOduyY=;
        b=NDAoqFI85C++NgiZbB4+kmnwohNaCrXWm5kX13XFKaz/aynjPyQR91J9NJ8ZBRIfdu
         zKcYUpv1J7ZNKWoNWXZqXUJfRJVWEN8O1KcNPTBTAgi80cMUbfj+CXSm29Rtre4N3ck1
         EzFXY4Ss5Nft+IREsB77mYNAPrJ0NCK9ublPb4WVJ7CmJHczEzF4U1vlXtH2EIQiNTxi
         fSgWpnZpdwIY3y4F1qFNI7Y/KHSt/MPLZRnQ3ysRrKNKdoMwpfeKL2SQJAapmqSXyC32
         381YMjrgpd2GdZrh+uWKY+i5upWvA7nfnQ2kyqwWk1VLDzHyQAyFQIOfR0YKN9XDdrlO
         +Vgw==
X-Gm-Message-State: AOAM530QVHJcoZTwrMRn7knoPB86zien5R5x6VOo5rWvrjnbdkuSajtW
        yY5icgGEb1mdyLv88pFT3uTupOBA+5kXmF80s8urp4pyVa/v
X-Google-Smtp-Source: ABdhPJy6MVbMBx5f9JPwLmYvTj/Utwl/N03mYE0HJAZ/aARu9B+khcSVcUDVzffRX4ccRuV11V91OWSAVmAHO+BzZh9wEqlL7w1U
MIME-Version: 1.0
X-Received: by 2002:a05:6602:150e:: with SMTP id g14mr593032iow.166.1637256847028;
 Thu, 18 Nov 2021 09:34:07 -0800 (PST)
Date:   Thu, 18 Nov 2021 09:34:07 -0800
In-Reply-To: <208f1478-42b2-9db2-4a81-dc8f64bbabbc@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c5f54305d113905e@google.com>
Subject: Re: [syzbot] WARNING in usbnet_start_xmit/usb_submit_urb
From:   syzbot <syzbot+63ee658b9a100ffadbe2@syzkaller.appspotmail.com>
To:     kuba@kernel.org, linux-usb@vger.kernel.org, oneukum@suse.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-out-of-bounds Read in usbnet_probe

usb 4-1: config 0 interface 0 altsetting 0 endpoint 0x2 has an invalid bInterval 87, changing to 10
usb 4-1: New USB device found, idVendor=0547, idProduct=2727, bcdDevice=e6.98
usb 4-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 4-1: config 0 descriptor??
==================================================================
BUG: KASAN: slab-out-of-bounds in usb_endpoint_xfer_bulk include/uapi/linux/usb/ch9.h:518 [inline]
BUG: KASAN: slab-out-of-bounds in usb_endpoint_is_bulk_in include/uapi/linux/usb/ch9.h:573 [inline]
BUG: KASAN: slab-out-of-bounds in usbnet_probe+0x1b6e/0x2760 drivers/net/usb/usbnet.c:1776
Read of size 1 at addr ffff88811ac09623 by task kworker/1:2/668

CPU: 1 PID: 668 Comm: kworker/1:2 Not tainted 5.15.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_address_description.constprop.0.cold+0x6c/0x309 mm/kasan/report.c:256
 __kasan_report mm/kasan/report.c:442 [inline]
 kasan_report.cold+0x83/0xdf mm/kasan/report.c:459
 usb_endpoint_xfer_bulk include/uapi/linux/usb/ch9.h:518 [inline]
 usb_endpoint_is_bulk_in include/uapi/linux/usb/ch9.h:573 [inline]
 usbnet_probe+0x1b6e/0x2760 drivers/net/usb/usbnet.c:1776
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
 process_one_work+0x9b2/0x1690 kernel/workqueue.c:2298
 worker_thread+0x658/0x11f0 kernel/workqueue.c:2445
 kthread+0x40b/0x500 kernel/kthread.c:327
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
 </TASK>

Allocated by task 0:
(stack is not available)

The buggy address belongs to the object at ffff88811ac09600
 which belongs to the cache kmalloc-96 of size 96
The buggy address is located 35 bytes inside of
 96-byte region [ffff88811ac09600, ffff88811ac09660)
The buggy address belongs to the page:
page:ffffea00046b0240 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x11ac09
flags: 0x200000000000200(slab|node=0|zone=2)
raw: 0200000000000200 0000000000000000 dead000000000122 ffff888100041780
raw: 0000000000000000 0000000080200020 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x112c40(GFP_NOFS|__GFP_NOWARN|__GFP_NORETRY|__GFP_HARDWALL), pid 1873, ts 80842457098, free_ts 80530458047
 prep_new_page mm/page_alloc.c:2426 [inline]
 get_page_from_freelist+0x1254/0x2980 mm/page_alloc.c:4155
 __alloc_pages+0x1b2/0x500 mm/page_alloc.c:5381
 alloc_pages+0x1a7/0x300 mm/mempolicy.c:2191
 alloc_slab_page mm/slub.c:1770 [inline]
 allocate_slab mm/slub.c:1907 [inline]
 new_slab+0x319/0x490 mm/slub.c:1970
 ___slab_alloc+0x8b9/0xfa0 mm/slub.c:3001
 __slab_alloc.constprop.0+0x4d/0xa0 mm/slub.c:3088
 slab_alloc_node mm/slub.c:3179 [inline]
 slab_alloc mm/slub.c:3221 [inline]
 __kmalloc+0x2ee/0x310 mm/slub.c:4396
 kmalloc_array include/linux/slab.h:631 [inline]
 kcalloc include/linux/slab.h:660 [inline]
 ext4_find_extent+0xa47/0xd00 fs/ext4/extents.c:865
 ext4_ext_map_blocks+0x1e2/0x6140 fs/ext4/extents.c:4066
 ext4_map_blocks+0x653/0x17d0 fs/ext4/inode.c:637
 ext4_convert_unwritten_extents+0x2db/0x5b0 fs/ext4/extents.c:4773
 ext4_convert_unwritten_io_end_vec+0x122/0x270 fs/ext4/extents.c:4812
 ext4_end_io_end fs/ext4/page-io.c:184 [inline]
 ext4_do_flush_completed_IO fs/ext4/page-io.c:257 [inline]
 ext4_end_io_rsv_work+0x2b3/0x660 fs/ext4/page-io.c:271
 process_one_work+0x9b2/0x1690 kernel/workqueue.c:2298
 worker_thread+0x658/0x11f0 kernel/workqueue.c:2445
 kthread+0x40b/0x500 kernel/kthread.c:327
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1340 [inline]
 free_pcp_prepare+0x315/0x710 mm/page_alloc.c:1391
 free_unref_page_prepare mm/page_alloc.c:3317 [inline]
 free_unref_page+0x19/0x580 mm/page_alloc.c:3396
 tlb_batch_list_free mm/mmu_gather.c:61 [inline]
 tlb_finish_mmu+0x24f/0x8c0 mm/mmu_gather.c:343
 unmap_region+0x27f/0x350 mm/mmap.c:2653
 __do_munmap+0x600/0x1260 mm/mmap.c:2884
 __do_sys_brk+0x4b2/0x7d0 mm/mmap.c:255
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Memory state around the buggy address:
 ffff88811ac09500: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
 ffff88811ac09580: 00 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc
>ffff88811ac09600: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                               ^
 ffff88811ac09680: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88811ac09700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


Tested on:

commit:         048ff862 Merge tag 'usb-5.16-rc1' of git://git.kernel...
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
console output: https://syzkaller.appspot.com/x/log.txt?x=11fb14f6b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d6b387bc5d3e50f3
dashboard link: https://syzkaller.appspot.com/bug?extid=63ee658b9a100ffadbe2
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=103818a1b00000

