Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B86055BC432
	for <lists+linux-usb@lfdr.de>; Mon, 19 Sep 2022 10:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbiISIVl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Sep 2022 04:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiISIVi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Sep 2022 04:21:38 -0400
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122675FE2
        for <linux-usb@vger.kernel.org>; Mon, 19 Sep 2022 01:21:36 -0700 (PDT)
Received: by mail-il1-f198.google.com with SMTP id x14-20020a056e021cae00b002f1d5aca8c6so18828702ill.5
        for <linux-usb@vger.kernel.org>; Mon, 19 Sep 2022 01:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=f3qnAi5u5mq5PX0OAa9edxg9lUIvKIVnYVghNsCk+GA=;
        b=VH7KzlIyhEVTQ7q9xI8YIIGzchAT1Cs+RHesyy7u/VB93wWKKu8y1mfonVBYMUXXd7
         ObDoCfwXv84n/q3l+XdA8mo9Sku0vqyrYJYVe+/idxH1Hw3NOTYuQaaGH3HoHfLvffAt
         daOmPGJuCPJ4KlGTMlizplp7WnK3K7BZsEzUcWugogFhNicjsD1EsL62oUBhfB3TBX53
         tDayZwctUfImTazujcWYk0QcctTIA0DmeP6NmVXmzvdox+n0gWWUrHUtlReVc7+/fqVW
         LLoWbXo8g3E00BuqfiNcEmS90ei+SnCXkW0vRCP/LiLFRwFjpsXIQdsYwVaNXyVushLz
         dVlg==
X-Gm-Message-State: ACrzQf0jSCZzyKmUIQQPiHv4Ka/DQhpMLsmAWpLkveCRNzFhmqYjBwwV
        JEXreEqvfU06xOATK+9N7sQ2W6gDv9J/zQxitGaWGNIRMMzA
X-Google-Smtp-Source: AMsMyM5HSZ+hdQWZmKYDkRMpwI8x1HopIBJC1ly7nCE6ythHFYUdBif+9qjl97v3mJ3JSQAZX275WE0jWn9vHUJ57oxEeza6Dme9
MIME-Version: 1.0
X-Received: by 2002:a02:c55a:0:b0:358:317b:7472 with SMTP id
 g26-20020a02c55a000000b00358317b7472mr7575129jaj.248.1663575696303; Mon, 19
 Sep 2022 01:21:36 -0700 (PDT)
Date:   Mon, 19 Sep 2022 01:21:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006f6f8f05e90366aa@google.com>
Subject: [syzbot] KMSAN: uninit-value in idmouse_open
From:   syzbot <syzbot+79832d33eb89fb3cd092@syzkaller.appspotmail.com>
To:     glider@google.com, gregkh@linuxfoundation.org, johan@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    ce8056d1f79e wip: changed copy_from_user where instrumented
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=16a02941900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3afe005fb99591f
dashboard link: https://syzkaller.appspot.com/bug?extid=79832d33eb89fb3cd092
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=165e850e900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=123a8c96900000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+79832d33eb89fb3cd092@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in idmouse_create_image drivers/usb/misc/idmouse.c:187 [inline]
BUG: KMSAN: uninit-value in idmouse_open+0x12da/0x1780 drivers/usb/misc/idmouse.c:249
CPU: 0 PID: 8474 Comm: syz-executor157 Not tainted 5.8.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:118
 kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:121
 __msan_warning+0x58/0xa0 mm/kmsan/kmsan_instr.c:215
 idmouse_create_image drivers/usb/misc/idmouse.c:187 [inline]
 idmouse_open+0x12da/0x1780 drivers/usb/misc/idmouse.c:249
 usb_open+0x27f/0x400 drivers/usb/core/file.c:48
 chrdev_open+0xc7c/0xe10 fs/char_dev.c:414
 do_dentry_open+0x12bc/0x1d30 fs/open.c:828
 vfs_open+0xaf/0xe0 fs/open.c:942
 do_open fs/namei.c:3243 [inline]
 path_openat+0x542b/0x6ba0 fs/namei.c:3360
 do_filp_open+0x2b8/0x710 fs/namei.c:3387
 do_sys_openat2+0xa6a/0x1020 fs/open.c:1179
 do_sys_open fs/open.c:1195 [inline]
 ksys_open include/linux/syscalls.h:1388 [inline]
 __do_sys_open fs/open.c:1201 [inline]
 __se_sys_open+0x270/0x2d0 fs/open.c:1199
 __x64_sys_open+0x4a/0x70 fs/open.c:1199
 do_syscall_64+0xad/0x160 arch/x86/entry/common.c:386
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x401470
Code: Bad RIP value.
RSP: 002b:00007ffe8619e918 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 00000000004002e0 RCX: 0000000000401470
RDX: 0000000000000000 RSI: 0000000000000002 RDI: 00007ffe8619e930
RBP: 00000000006cf018 R08: 0000000000000000 R09: 000000000000000f
R10: 0000000000000064 R11: 0000000000000246 R12: 00000000004023d0
R13: 0000000000402460 R14: 0000000000000000 R15: 0000000000000000

Uninit was created at:
 kmsan_save_stack_with_flags+0x3c/0x90 mm/kmsan/kmsan.c:144
 kmsan_internal_alloc_meta_for_pages mm/kmsan/kmsan_shadow.c:269 [inline]
 kmsan_alloc_page+0xc5/0x1a0 mm/kmsan/kmsan_shadow.c:293
 __alloc_pages_nodemask+0xdf0/0x1030 mm/page_alloc.c:4889
 alloc_pages_current+0x685/0xb50 mm/mempolicy.c:2292
 alloc_pages include/linux/gfp.h:545 [inline]
 kmalloc_order mm/slab_common.c:1325 [inline]
 kmalloc_order_trace+0x92/0x3d0 mm/slab_common.c:1341
 kmalloc_large include/linux/slab.h:484 [inline]
 kmalloc include/linux/slab.h:548 [inline]
 idmouse_probe+0x48c/0xa60 drivers/usb/misc/idmouse.c:352
 usb_probe_interface+0xece/0x1550 drivers/usb/core/driver.c:374
 really_probe+0xf20/0x20b0 drivers/base/dd.c:529
 driver_probe_device+0x293/0x390 drivers/base/dd.c:701
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:807
 bus_for_each_drv+0x2ca/0x3f0 drivers/base/bus.c:431
 __device_attach+0x4e2/0x7f0 drivers/base/dd.c:873
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:920
 bus_probe_device+0x177/0x3d0 drivers/base/bus.c:491
 device_add+0x3b0e/0x40d0 drivers/base/core.c:2680
 usb_set_configuration+0x380f/0x3f10 drivers/usb/core/message.c:2032
 usb_generic_driver_probe+0x138/0x300 drivers/usb/core/generic.c:241
 usb_probe_device+0x311/0x490 drivers/usb/core/driver.c:272
 really_probe+0xf20/0x20b0 drivers/base/dd.c:529
 driver_probe_device+0x293/0x390 drivers/base/dd.c:701
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:807
 bus_for_each_drv+0x2ca/0x3f0 drivers/base/bus.c:431
 __device_attach+0x4e2/0x7f0 drivers/base/dd.c:873
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:920
 bus_probe_device+0x177/0x3d0 drivers/base/bus.c:491
 device_add+0x3b0e/0x40d0 drivers/base/core.c:2680
 usb_new_device+0x1bd4/0x2a30 drivers/usb/core/hub.c:2554
 hub_port_connect drivers/usb/core/hub.c:5208 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5348 [inline]
 port_event drivers/usb/core/hub.c:5494 [inline]
 hub_event+0x5e7b/0x8a70 drivers/usb/core/hub.c:5576
 process_one_work+0x1688/0x2140 kernel/workqueue.c:2269
 worker_thread+0x10bc/0x2730 kernel/workqueue.c:2415
 kthread+0x551/0x590 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:293
=====================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
