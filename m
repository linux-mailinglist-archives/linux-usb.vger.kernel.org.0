Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CCEF1A38F
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2019 21:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727970AbfEJT5G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 May 2019 15:57:06 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:57094 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727600AbfEJT5F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 May 2019 15:57:05 -0400
Received: by mail-io1-f70.google.com with SMTP id s184so4993077iod.23
        for <linux-usb@vger.kernel.org>; Fri, 10 May 2019 12:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=lvqJ0xDdkaqapnR5U2jjYW/68xt7nlCDVg/gBxq0TtQ=;
        b=Qq+JweaT7N/832/t1axrKdZ4BeQcz1qtPRtxpwJ1kXNk7pbA2rq63eFEE0Xfiy2aep
         3BmYHn5DLFKN0y7rEzdP+aKgtO2lMcw1rux9kiG0Bw30zqteF7URnYuB91Hm/pZqYoEt
         DwUKL2yIxEt2A/KB60fL3SV7dqnh1LNNR3Zyat+RDTbg5cjgzJoBB/QpUo8+pbXGzpI8
         rQ030H7qegVNnvvWn6L3LiVkRyrPSdq75P5mFEikViNW9+k/53uSI9/A5/LxXZXs4ijE
         vbkn7CDR6I+1Ysco5h7sU6DfOZt9IGnnPV2cbRc32L35GAxwsytmz6k3s4gAG7TjITnh
         eyeg==
X-Gm-Message-State: APjAAAWPFJPIxumceyZicsylLSp7TUNaCm2ZAjJw0oc/IIpNm/hf34y6
        BXtZFMnBQljiWxZfnh/EjGmxQrul9y0Xx0fEtdQyX71oFafm
X-Google-Smtp-Source: APXvYqwbxdlPXV/Hm3x/aBcM7LCMOdz7xi7/muSUSYjYKifMCRbCQj1tf8K3aDzx9vnh8F5Cbgz+iYbEl2KUOlc9bgUsBDujeE5l
MIME-Version: 1.0
X-Received: by 2002:a24:4d85:: with SMTP id l127mr9785928itb.53.1557518224869;
 Fri, 10 May 2019 12:57:04 -0700 (PDT)
Date:   Fri, 10 May 2019 12:57:04 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000086510e05888df8c8@google.com>
Subject: KASAN: slab-out-of-bounds Write in usb_get_bos_descriptor
From:   syzbot <syzbot+71f1e64501a309fcc012@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        suwan.kim027@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    43151d6c usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=124794d8a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4183eeef650d1234
dashboard link: https://syzkaller.appspot.com/bug?extid=71f1e64501a309fcc012
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=176a53d0a00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+71f1e64501a309fcc012@syzkaller.appspotmail.com

usb 1-1: Using ep0 maxpacket: 8
==================================================================
BUG: KASAN: slab-out-of-bounds in usb_get_bos_descriptor+0x8be/0x8fb  
drivers/usb/core/config.c:976
Write of size 1 at addr ffff8880a48e38ec by task kworker/0:2/533

CPU: 0 PID: 533 Comm: kworker/0:2 Not tainted 5.1.0-rc3-319004-g43151d6 #6
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xe8/0x16e lib/dump_stack.c:113
  print_address_description+0x6c/0x236 mm/kasan/report.c:187
  kasan_report.cold+0x1a/0x3c mm/kasan/report.c:317
  usb_get_bos_descriptor+0x8be/0x8fb drivers/usb/core/config.c:976
  hub_port_init+0x1671/0x2d30 drivers/usb/core/hub.c:4828
  hub_port_connect drivers/usb/core/hub.c:5021 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  port_event drivers/usb/core/hub.c:5350 [inline]
  hub_event+0x11b8/0x3b00 drivers/usb/core/hub.c:5432
  process_one_work+0x90f/0x1580 kernel/workqueue.c:2269
  worker_thread+0x9b/0xe20 kernel/workqueue.c:2415
  kthread+0x313/0x420 kernel/kthread.c:253
  ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352

Allocated by task 533:
  set_track mm/kasan/common.c:87 [inline]
  __kasan_kmalloc mm/kasan/common.c:497 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:470
  kmalloc include/linux/slab.h:552 [inline]
  kzalloc include/linux/slab.h:742 [inline]
  usb_get_bos_descriptor+0x1e2/0x8fb drivers/usb/core/config.c:955
  hub_port_init+0x1671/0x2d30 drivers/usb/core/hub.c:4828
  hub_port_connect drivers/usb/core/hub.c:5021 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  port_event drivers/usb/core/hub.c:5350 [inline]
  hub_event+0x11b8/0x3b00 drivers/usb/core/hub.c:5432
  process_one_work+0x90f/0x1580 kernel/workqueue.c:2269
  worker_thread+0x9b/0xe20 kernel/workqueue.c:2415
  kthread+0x313/0x420 kernel/kthread.c:253
  ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352

Freed by task 16:
  set_track mm/kasan/common.c:87 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:459
  slab_free_hook mm/slub.c:1429 [inline]
  slab_free_freelist_hook+0x5e/0x140 mm/slub.c:1456
  slab_free mm/slub.c:3003 [inline]
  kfree+0xce/0x290 mm/slub.c:3958
  security_cred_free+0xa7/0x100 security/security.c:1498
  put_cred_rcu+0x78/0x310 kernel/cred.c:118
  __rcu_reclaim kernel/rcu/rcu.h:227 [inline]
  rcu_do_batch kernel/rcu/tree.c:2475 [inline]
  invoke_rcu_callbacks kernel/rcu/tree.c:2788 [inline]
  rcu_core+0x83b/0x1a80 kernel/rcu/tree.c:2769
  __do_softirq+0x22a/0x8cd kernel/softirq.c:293

The buggy address belongs to the object at ffff8880a48e38e8
  which belongs to the cache kmalloc-8 of size 8
The buggy address is located 4 bytes inside of
  8-byte region [ffff8880a48e38e8, ffff8880a48e38f0)
The buggy address belongs to the page:
page:ffffea00029238c0 count:1 mapcount:0 mapping:ffff88812c3f5c00  
index:0xffff8880a48e3c90
flags: 0xfff00000000200(slab)
raw: 00fff00000000200 ffffea000297f6c0 0000001600000016 ffff88812c3f5c00
raw: ffff8880a48e3c90 0000000080aa00a2 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8880a48e3780: fb fc fc fb fc fc fb fc fc fb fc fc fb fc fc fb
  ffff8880a48e3800: fc fc fb fc fc fb fc fc fb fc fc fb fc fc fb fc
> ffff8880a48e3880: fc fb fc fc fb fc fc fb fc fc fb fc fc 01 fc fc
                                                           ^
  ffff8880a48e3900: fb fc fc fb fc fc fb fc fc fb fc fc fb fc fc fb
  ffff8880a48e3980: fc fc fb fc fc fb fc fc fb fc fc fb fc fc fb fc
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
