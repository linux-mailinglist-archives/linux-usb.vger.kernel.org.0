Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3692397AFD
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 15:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728597AbfHUNhB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 09:37:01 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:38341 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726372AbfHUNhB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Aug 2019 09:37:01 -0400
Received: by mail-io1-f71.google.com with SMTP id h4so2687704iol.5
        for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2019 06:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=mRTZJc1jjEZEYf7q0sRvK6k1VMvoSSMcdBBjtL90lxk=;
        b=m5k1O6TfE7SG/UDxndtsUl3bVF+xk4nomQkGnaJzz9KAp2Y4KuaPneeaSXj/w+u8P+
         rPHTkcbiBEm+RCGIiJ6Hp4gYyzBRoeTIBkvzJHiXLyfDkbcjcMNqtHedWTClwaggYnU7
         UASnkM5dRl/V2H8jjMEulHExV+XJdBo8lw81LTa6uSdDAU0cTgvO0+IBSWDXkJj9qDVX
         72h+ACwP/pUfrEx0RFuPYkkVcVS5Ep0eUvuWyPa/sbEQRxPg5FYaEEw4LmQQXrGka00l
         eGFnWt9ST6TH1aJ9Yp72HnhtAUABIoVcOUauX4aSRJ2E4QpbS+I2h/pQ6RGnxBEASbF6
         edfg==
X-Gm-Message-State: APjAAAUOincZGz/2Uvc7CEIIWs/5dADYGQDdTEcR9+ZX/K7tNXbwcQxF
        g3gGi/v8BjoWsRvBX/Gy1wuzsMeYH5tct9oA3hwFxYTeErV/
X-Google-Smtp-Source: APXvYqzsH60Biu2lDjToZaOz1gXiIgi+Li3dNt9BmXB/b8IjLM0IutxLn5d5ddLTPD0JTXlR9kgas5VUgZcQXgBWf1RtVSoLI7Jf
MIME-Version: 1.0
X-Received: by 2002:a02:a812:: with SMTP id f18mr9790811jaj.1.1566394620396;
 Wed, 21 Aug 2019 06:37:00 -0700 (PDT)
Date:   Wed, 21 Aug 2019 06:37:00 -0700
In-Reply-To: <CAAeHK+x-q8u_-qyc6=5QjuLAtQafOftdmK_JEFVrvzjmowf2Ow@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ed58060590a0aa30@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in hidraw_ioctl
From:   syzbot <syzbot+5a6c4ec678a0c6ee84ba@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer still triggered  
crash:
KASAN: slab-out-of-bounds Read in hidraw_ioctl

==================================================================
BUG: KASAN: slab-out-of-bounds in strlen+0x79/0x90 lib/string.c:525
Read of size 1 at addr ffff8881c8035f38 by task syz-executor.4/2833

CPU: 1 PID: 2833 Comm: syz-executor.4 Not tainted 5.3.0-rc2+ #1
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x6a/0x32c mm/kasan/report.c:351
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
  kasan_report+0xe/0x12 mm/kasan/common.c:612
  strlen+0x79/0x90 lib/string.c:525
  strlen include/linux/string.h:281 [inline]
  hidraw_ioctl+0x245/0xae0 drivers/hid/hidraw.c:446
  vfs_ioctl fs/ioctl.c:46 [inline]
  file_ioctl fs/ioctl.c:509 [inline]
  do_vfs_ioctl+0xd2d/0x1330 fs/ioctl.c:696
  ksys_ioctl+0x9b/0xc0 fs/ioctl.c:713
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:718
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x459829
Code: fd b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 cb b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f7a68f6dc78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000459829
RDX: 0000000000000000 RSI: 0000000080404805 RDI: 0000000000000004
RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f7a68f6e6d4
R13: 00000000004c21de R14: 00000000004d5620 R15: 00000000ffffffff

Allocated by task 0:
(stack is not available)

Freed by task 0:
(stack is not available)

The buggy address belongs to the object at ffff8881c8035e60
  which belongs to the cache shmem_inode_cache of size 1168
The buggy address is located 216 bytes inside of
  1168-byte region [ffff8881c8035e60, ffff8881c80362f0)
The buggy address belongs to the page:
page:ffffea0007200d00 refcount:1 mapcount:0 mapping:ffff8881da115180  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da115180
raw: 0000000000000000 00000000800c000c 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881c8035e00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
  ffff8881c8035e80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ffff8881c8035f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                                         ^
  ffff8881c8035f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
  ffff8881c8036000: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


Tested on:

commit:         e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=14f14a1e600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=171cd95a600000

