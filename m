Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E14DB409B
	for <lists+linux-usb@lfdr.de>; Mon, 16 Sep 2019 20:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390517AbfIPSto (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Sep 2019 14:49:44 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:53233 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730107AbfIPStL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Sep 2019 14:49:11 -0400
Received: by mail-io1-f72.google.com with SMTP id g8so1086407iop.19
        for <linux-usb@vger.kernel.org>; Mon, 16 Sep 2019 11:49:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=F5NQvrUFVwU+iYEomKDgHpNzH9BuzuG1Oq9cILqoF9w=;
        b=s3pILBuRxb9+JnDC23IdJO3Ev/AcvR+lnc3EUXSeFfWt4C+EkUAVcGL7EcvEov0lpI
         yjdcMi6VzSeraecbO4DgUCcb8rlElV2xEA94z6KDT8V1yNNqAPOlBrfXfAQdDopHVNQR
         S7ljQEbEDRTA88miVW3JUYYL/dIrHRZ9VbFwHoijiQVKsqJ/dr6TsiJRlhT2F295xuGD
         1fR1Q3z62yHjIvwbG9Bq5RlTCUSwUg4PWeLAmF9sBGJ5d9pKA4JVGJyb9TEHMg//1Au1
         mnBwRkYtBBZLK3grTeYIMuxco5a099+lIqpNvA6JNRTiPljNTcrwga1eaN1UC+kWJqf0
         Gh1Q==
X-Gm-Message-State: APjAAAXayMlHVHEbUmmlpjL+jql0hE5nLYWyktn7FwXCuP3T4sQIfm+4
        cbwAdL4mDle9RcqbPuPbsrfM9ssb8xM56Qv/ZzkVjbpIG3sL
X-Google-Smtp-Source: APXvYqw3P64aFVztpt9L2rmR2DtHi9s6MW4xDKqLCr5gsOt4FQ/bH8ofPvnN+yxBVy6i+DOaBrafpW0wiKTu/tg1tSat6oibElQz
MIME-Version: 1.0
X-Received: by 2002:a6b:148b:: with SMTP id 133mr1540961iou.81.1568659749577;
 Mon, 16 Sep 2019 11:49:09 -0700 (PDT)
Date:   Mon, 16 Sep 2019 11:49:09 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000025ae690592b00fbd@google.com>
Subject: WARNING in __alloc_pages_nodemask
From:   syzbot <syzbot+e38fe539fedfc127987e@syzkaller.appspotmail.com>
To:     aarcange@redhat.com, akpm@linux-foundation.org,
        andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-usb@vger.kernel.org, mhocko@suse.com,
        rientjes@google.com, syzkaller-bugs@googlegroups.com,
        vbabka@suse.cz, yang.shi@linux.alibaba.com, zhongjiang@huawei.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=14b15371600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
dashboard link: https://syzkaller.appspot.com/bug?extid=e38fe539fedfc127987e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1093bed1600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1603cfc6600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+e38fe539fedfc127987e@syzkaller.appspotmail.com

WARNING: CPU: 0 PID: 1720 at mm/page_alloc.c:4696  
__alloc_pages_nodemask+0x36f/0x780 mm/page_alloc.c:4696
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 1720 Comm: syz-executor388 Not tainted 5.3.0-rc7+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  panic+0x2a3/0x6da kernel/panic.c:219
  __warn.cold+0x20/0x4a kernel/panic.c:576
  report_bug+0x262/0x2a0 lib/bug.c:186
  fixup_bug arch/x86/kernel/traps.c:179 [inline]
  fixup_bug arch/x86/kernel/traps.c:174 [inline]
  do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:272
  do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:291
  invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1028
RIP: 0010:__alloc_pages_nodemask+0x36f/0x780 mm/page_alloc.c:4696
Code: fe ff ff 65 48 8b 04 25 00 ef 01 00 48 05 60 10 00 00 41 be 01 00 00  
00 48 89 44 24 58 e9 ee fd ff ff 81 e5 00 20 00 00 75 02 <0f> 0b 45 31 f6  
e9 6b ff ff ff 8b 44 24 68 89 04 24 65 8b 2d e9 7e
RSP: 0018:ffff8881d320f9d8 EFLAGS: 00010046
RAX: 0000000000000000 RBX: 1ffff1103a641f3f RCX: 0000000000000000
RDX: 0000000000000000 RSI: dffffc0000000000 RDI: 0000000000040a20
RBP: 0000000000000000 R08: ffff8881d3bcc800 R09: ffffed103a541d19
R10: ffffed103a541d18 R11: ffff8881d2a0e8c7 R12: 0000000000000012
R13: 0000000000000012 R14: 0000000000000000 R15: ffff8881d2a0e8c0
  alloc_pages_current+0xff/0x200 mm/mempolicy.c:2153
  alloc_pages include/linux/gfp.h:509 [inline]
  kmalloc_order+0x1a/0x60 mm/slab_common.c:1257
  kmalloc_order_trace+0x18/0x110 mm/slab_common.c:1269
  __usbhid_submit_report drivers/hid/usbhid/hid-core.c:588 [inline]
  usbhid_submit_report+0x5b5/0xde0 drivers/hid/usbhid/hid-core.c:638
  usbhid_request+0x3c/0x70 drivers/hid/usbhid/hid-core.c:1252
  hid_hw_request include/linux/hid.h:1053 [inline]
  hiddev_ioctl+0x526/0x1550 drivers/hid/usbhid/hiddev.c:735
  vfs_ioctl fs/ioctl.c:46 [inline]
  file_ioctl fs/ioctl.c:509 [inline]
  do_vfs_ioctl+0xd2d/0x1330 fs/ioctl.c:696
  ksys_ioctl+0x9b/0xc0 fs/ioctl.c:713
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:718
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x444949
Code: e8 bc af 02 00 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 1b d8 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007fffed614ab8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00000000004002e0 RCX: 0000000000444949
RDX: 0000000020000080 RSI: 00000000400c4808 RDI: 0000000000000004
RBP: 00000000006cf018 R08: 18c1180b508ac6d9 R09: 00000000004002e0
R10: 000000000000000f R11: 0000000000000246 R12: 00000000004025f0
R13: 0000000000402680 R14: 0000000000000000 R15: 0000000000000000
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
