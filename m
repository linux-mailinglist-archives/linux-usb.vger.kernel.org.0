Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7128D45DBA6
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 14:50:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355438AbhKYNxY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 08:53:24 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:44808 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349691AbhKYNvY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Nov 2021 08:51:24 -0500
Received: by mail-io1-f72.google.com with SMTP id 7-20020a6b0107000000b005ed196a2546so6209714iob.11
        for <linux-usb@vger.kernel.org>; Thu, 25 Nov 2021 05:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=U8vFIWHLsJ0UbLdWhsvz0+go7l/V5Qz+kuHc7wY7974=;
        b=gyQ0MZwkjHvlJfgBVHsdyds7w661DOAiswMqQ2vMwl8EkbzdYJTqHc2wTFnf+zH8bH
         LQ7Q8a4TKm6luZj4RYQn8ZV55DXqXfiKQ0JgwcCustsViRKxoNMf1gIYo9FoInVcqxQA
         ZQFVjoChZYI/a85imPHkA7k2/RgotVg4Xh1qbYzX7c7RZME7ARBI95TqPovxWoDzKG7o
         frLEryVCiE6B2bUIyY+YDKKLhPJP+vuSaleVW7728sEdX/ZMJDENCPc55QLJedYTM6Zo
         BKhyRwiAPn0hlzraQJkVGaDBidvGdVinprYM/jGZJv+EbmRGCqEGykrB/3WbZSVKvjvA
         SWrA==
X-Gm-Message-State: AOAM533W75MkfTRTx15mrClK1qJCgTgnuLByOyVC5eCiUsotIGoNrC4x
        68IvJSiWH9l0xcOUzmsgoOmsjuzDqbk2y7KR+Jh90rgAsfii
X-Google-Smtp-Source: ABdhPJxRN3SL61u+kn0LBsOpEgb2xe8nE2f+N+nEeOCNlTB3t3nElcXZ8CcDuXPBqbLP+eM5gfnaUIx2cTo7kHbbrdC4VrrfM+nd
MIME-Version: 1.0
X-Received: by 2002:a02:ceb9:: with SMTP id z25mr29076419jaq.121.1637848093044;
 Thu, 25 Nov 2021 05:48:13 -0800 (PST)
Date:   Thu, 25 Nov 2021 05:48:13 -0800
In-Reply-To: <8b395185-b18c-caf9-0418-78e96797b474@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c8364505d19d390a@google.com>
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
KASAN: slab-out-of-bounds Read in usbnet_validate_endpoints

usb 6-1: config 0 interface 0 altsetting 0 endpoint 0x2 has an invalid bInterval 87, changing to 10
usb 6-1: New USB device found, idVendor=0547, idProduct=2727, bcdDevice=e6.98
usb 6-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 6-1: config 0 descriptor??
==================================================================
BUG: KASAN: slab-out-of-bounds in usb_endpoint_xfer_bulk include/uapi/linux/usb/ch9.h:518 [inline]
BUG: KASAN: slab-out-of-bounds in usb_endpoint_is_bulk_in include/uapi/linux/usb/ch9.h:573 [inline]
BUG: KASAN: slab-out-of-bounds in usbnet_validate_endpoints+0x22a/0x260 drivers/net/usb/usbnet.c:102
Read of size 1 at addr ffff88810ded4223 by task kworker/0:0/5

CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.15.0-syzkaller #0
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
 usbnet_validate_endpoints+0x22a/0x260 drivers/net/usb/usbnet.c:102
 usbnet_probe+0x1ab9/0x2620 drivers/net/usb/usbnet.c:1795
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

The buggy address belongs to the object at ffff88810ded4200
 which belongs to the cache kmalloc-96 of size 96
The buggy address is located 35 bytes inside of
 96-byte region [ffff88810ded4200, ffff88810ded4260)
The buggy address belongs to the page:
page:ffffea000437b500 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10ded4
flags: 0x200000000000200(slab|node=0|zone=2)
raw: 0200000000000200 0000000000000000 dead000000000122 ffff888100041780
raw: 0000000000000000 0000000080200020 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x112c40(GFP_NOFS|__GFP_NOWARN|__GFP_NORETRY|__GFP_HARDWALL), pid 4546, ts 85619489521, free_ts 59365205543
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
 kmalloc include/linux/slab.h:596 [inline]
 kzalloc include/linux/slab.h:721 [inline]
 tomoyo_encode2.part.0+0xe9/0x3a0 security/tomoyo/realpath.c:45
 tomoyo_encode2 security/tomoyo/realpath.c:31 [inline]
 tomoyo_encode+0x28/0x50 security/tomoyo/realpath.c:80
 tomoyo_realpath_from_path+0x186/0x620 security/tomoyo/realpath.c:288
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_path_perm+0x21b/0x400 security/tomoyo/file.c:822
 security_inode_getattr+0xcf/0x140 security/security.c:1334
 vfs_getattr fs/stat.c:157 [inline]
 vfs_statx+0x164/0x390 fs/stat.c:225
 vfs_fstatat fs/stat.c:243 [inline]
 __do_sys_newfstatat+0x96/0x120 fs/stat.c:412
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1340 [inline]
 free_pcp_prepare+0x315/0x710 mm/page_alloc.c:1391
 free_unref_page_prepare mm/page_alloc.c:3317 [inline]
 free_unref_page+0x19/0x580 mm/page_alloc.c:3396
 qlink_free mm/kasan/quarantine.c:146 [inline]
 qlist_free_all+0x5a/0xc0 mm/kasan/quarantine.c:165
 kasan_quarantine_reduce+0x180/0x200 mm/kasan/quarantine.c:272
 __kasan_slab_alloc+0x73/0x80 mm/kasan/common.c:444
 kasan_slab_alloc include/linux/kasan.h:259 [inline]
 slab_post_alloc_hook mm/slab.h:519 [inline]
 slab_alloc_node mm/slub.c:3213 [inline]
 slab_alloc mm/slub.c:3221 [inline]
 __kmalloc+0x1d9/0x310 mm/slub.c:4396
 kmalloc include/linux/slab.h:596 [inline]
 tomoyo_realpath_from_path+0xc3/0x620 security/tomoyo/realpath.c:254
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_path_perm+0x21b/0x400 security/tomoyo/file.c:822
 security_inode_getattr+0xcf/0x140 security/security.c:1334
 vfs_getattr fs/stat.c:157 [inline]
 vfs_statx+0x164/0x390 fs/stat.c:225
 vfs_fstatat fs/stat.c:243 [inline]
 __do_sys_newfstatat+0x96/0x120 fs/stat.c:412
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Memory state around the buggy address:
 ffff88810ded4100: 00 00 00 00 00 00 00 00 00 00 00 00 fc fc fc fc
 ffff88810ded4180: 00 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc
>ffff88810ded4200: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                               ^
 ffff88810ded4280: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88810ded4300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


Tested on:

commit:         048ff862 Merge tag 'usb-5.16-rc1' of git://git.kernel...
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
console output: https://syzkaller.appspot.com/x/log.txt?x=16cf5845b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d6b387bc5d3e50f3
dashboard link: https://syzkaller.appspot.com/bug?extid=63ee658b9a100ffadbe2
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14984c09b00000

