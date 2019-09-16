Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27BE3B4299
	for <lists+linux-usb@lfdr.de>; Mon, 16 Sep 2019 23:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388182AbfIPVDC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Sep 2019 17:03:02 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:54703 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730647AbfIPVDC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Sep 2019 17:03:02 -0400
Received: by mail-io1-f70.google.com with SMTP id a20so1883492iok.21
        for <linux-usb@vger.kernel.org>; Mon, 16 Sep 2019 14:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=pegzZoOuKeyjSyEYptZcWb5iSCL7ogS2NV73sLALehE=;
        b=YpgAoo5bSpR3zONUv3eOA6hRyfZvSAfFA5cBJMvIMXnpLvhA56xaNbbUJUS+7x3qNc
         gec+lBb+0sbSX4xrmxeWh70NPKpmruZw1p7N1dM1yoG/xLGGAfppteaMMirCyKBCsOmp
         9v1tszEGNEPg7/YNUEFiQqzw8QImdGZZEG8gZ/Vh/Mij+TnzfQAo+Xlu/ECnXT2UuGgL
         3w+CZBQBk0kMqnl+eX5UQ/2QlFThVqQznHmD5Jha0r0YP8Umeo43x2E4UqB8VVeHdXuW
         Pp4SBwAOQ9VkNga7BGH1hTuzgknjU49rNHh6qZ6wxAWPBKaZT+1vsHTgxRl5wxs/sQgc
         FDsw==
X-Gm-Message-State: APjAAAUfkxrW4vCBGmc+Gi+PR5pZ9r3Dxmh0a3JLvGgINT4TTiHugAxp
        CfYrQ6qa4rcjQYBVZCGw7Ff3MrZIQRUIhE6DgfJuBVaZBQ90
X-Google-Smtp-Source: APXvYqzmJHv/6PjArU0AxvjCHeETGWAhfXplrziNCRcp8zsTW3UJjrfSooQX5Ys43JXtqq9BWVvq10VGeusXHhnVbfTV72rL0FfP
MIME-Version: 1.0
X-Received: by 2002:a6b:bc02:: with SMTP id m2mr269603iof.247.1568667781078;
 Mon, 16 Sep 2019 14:03:01 -0700 (PDT)
Date:   Mon, 16 Sep 2019 14:03:01 -0700
In-Reply-To: <Pine.LNX.4.44L0.1909161650440.1489-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000dcade20592b1edc7@google.com>
Subject: Re: general protection fault in usb_set_interface
From:   syzbot <syzbot+7fa38a608b1075dfd634@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        kai.heng.feng@canonical.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, mans@mansr.com, oneukum@suse.com,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer still triggered  
crash:
general protection fault in vidioc_querycap

kasan: CONFIG_KASAN_INLINE enabled
kasan: GPF could be caused by NULL-ptr deref or user memory access
general protection fault: 0000 [#1] SMP KASAN
CPU: 0 PID: 2937 Comm: v4l_id Not tainted 5.3.0-rc7+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
RIP: 0010:usb_make_path include/linux/usb.h:914 [inline]
RIP: 0010:vidioc_querycap+0x11c/0x320  
drivers/media/usb/usbvision/usbvision-video.c:460
Code: 80 3c 02 00 0f 85 03 02 00 00 4c 8b ad f0 17 00 00 48 b8 00 00 00 00  
00 fc ff df 49 8d 7d 48 4d 8d 45 04 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f  
85 c7 01 00 00 48 b8 00 00 00 00 00 fc ff df 4d 8b
RSP: 0018:ffff8881c045fa28 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff8881c045fc18 RCX: 0000000000000000
RDX: 0000000000000009 RSI: 2e4c1f4252534d27 RDI: 0000000000000048
RBP: ffff8881d5172100 R08: 0000000000000004 R09: fffffbfff0c90220
R10: fffffbfff0c9021f R11: ffffffff864810f8 R12: ffff8881d517399c
R13: 0000000000000000 R14: ffff8881c045fc48 R15: 0000000080050000
FS:  00007fd17db9e700(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f28e2972518 CR3: 00000001d9a2b000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  v4l_querycap+0x121/0x340 drivers/media/v4l2-core/v4l2-ioctl.c:1058
  __video_do_ioctl+0x969/0xba0 drivers/media/v4l2-core/v4l2-ioctl.c:2878
  video_usercopy+0x446/0xf40 drivers/media/v4l2-core/v4l2-ioctl.c:3060
  v4l2_ioctl+0x1a2/0x220 drivers/media/v4l2-core/v4l2-dev.c:360
  vfs_ioctl fs/ioctl.c:46 [inline]
  file_ioctl fs/ioctl.c:509 [inline]
  do_vfs_ioctl+0xd2d/0x1330 fs/ioctl.c:696
  ksys_ioctl+0x9b/0xc0 fs/ioctl.c:713
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:718
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x7fd17d6d1347
Code: 90 90 90 48 8b 05 f1 fa 2a 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff  
ff c3 90 90 90 90 90 90 90 90 90 90 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff  
ff 73 01 c3 48 8b 0d c1 fa 2a 00 31 d2 48 29 c2 64
RSP: 002b:00007ffd9397d098 EFLAGS: 00000202 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fd17d6d1347
RDX: 00007ffd9397d0a0 RSI: 0000000080685600 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000400884
R13: 00007ffd9397d1f0 R14: 0000000000000000 R15: 0000000000000000
Modules linked in:
---[ end trace e95ba987ba08e9f8 ]---
RIP: 0010:usb_make_path include/linux/usb.h:914 [inline]
RIP: 0010:vidioc_querycap+0x11c/0x320  
drivers/media/usb/usbvision/usbvision-video.c:460
Code: 80 3c 02 00 0f 85 03 02 00 00 4c 8b ad f0 17 00 00 48 b8 00 00 00 00  
00 fc ff df 49 8d 7d 48 4d 8d 45 04 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f  
85 c7 01 00 00 48 b8 00 00 00 00 00 fc ff df 4d 8b
RSP: 0018:ffff8881c045fa28 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff8881c045fc18 RCX: 0000000000000000
RDX: 0000000000000009 RSI: 2e4c1f4252534d27 RDI: 0000000000000048
RBP: ffff8881d5172100 R08: 0000000000000004 R09: fffffbfff0c90220
R10: fffffbfff0c9021f R11: ffffffff864810f8 R12: ffff8881d517399c
R13: 0000000000000000 R14: ffff8881c045fc48 R15: 0000000080050000
FS:  00007fd17db9e700(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f28e2972518 CR3: 00000001d9a2b000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


Tested on:

commit:         f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=12a52ac9600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
dashboard link: https://syzkaller.appspot.com/bug?extid=7fa38a608b1075dfd634
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14e7f9c3600000

