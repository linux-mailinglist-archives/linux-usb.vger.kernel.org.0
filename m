Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5BD6B5581
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2019 20:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727669AbfIQSnB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Sep 2019 14:43:01 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:49151 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726968AbfIQSnB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Sep 2019 14:43:01 -0400
Received: by mail-io1-f71.google.com with SMTP id w16so7105909ioc.15
        for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2019 11:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=/F0kKipYWqaYBt3M3avLzKPNE6WRe87ru2I5XGId8tY=;
        b=Vr+EMFshPUeijmgi5WA6+9CzE5XN5UaxqBeWZKRgDs6VGJ7EIsoVWxyMHeoZgA5H1C
         ldN5oMO65Jp//1n5gUwNwORHMg4r+bnki+6VqqEFpXNjazmZydareQ/te4sskVxyVtOO
         dUwit/c0gCkDPqxka+HSRMaef0zDld4+u5YrbyMnQ43RR8dBoM083KEXCXTSU3a1N+Mq
         7xo0yzfejmOy8Pmykm4EZKgxtUwrZZ2SCsZisvmxQfOHpOVlOm5zYRRHQe3lG6kIDk7K
         lRJzkgRc449g5Pp83jJmhW+Trtvk99zb1AFpQNZtOtASiW37Om5smlwbYOLm1cFq9nfU
         jxZQ==
X-Gm-Message-State: APjAAAUs4VrQK+r/yi5fzESk/VgFv6pI4/9R5gulRmz90IQBazceD4xz
        FG73II2uIp6mYWTEFlHgLfOI46UgiVub1GOpnGBQ+1dCFRz4
X-Google-Smtp-Source: APXvYqxQPZotl0l2IVOv3ERHpbOUR2+bKKqThcD/MS6ZsPgmd0BwKvwh2+4xsKlssE3P2h8aZ/I5HGOdVWNuLXW9VP+Qml9sfJlj
MIME-Version: 1.0
X-Received: by 2002:a6b:7510:: with SMTP id l16mr251470ioh.2.1568745780760;
 Tue, 17 Sep 2019 11:43:00 -0700 (PDT)
Date:   Tue, 17 Sep 2019 11:43:00 -0700
In-Reply-To: <Pine.LNX.4.44L0.1909171428160.1590-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000001595b0592c41731@google.com>
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
WARNING in sysfs_remove_group

------------[ cut here ]------------
sysfs group 'power' not found for kobject 'radio0'
WARNING: CPU: 0 PID: 2871 at fs/sysfs/group.c:278 sysfs_remove_group  
fs/sysfs/group.c:278 [inline]
WARNING: CPU: 0 PID: 2871 at fs/sysfs/group.c:278  
sysfs_remove_group+0x155/0x1b0 fs/sysfs/group.c:269
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 2871 Comm: v4l_id Not tainted 5.3.0-rc7+ #0
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
RIP: 0010:sysfs_remove_group fs/sysfs/group.c:278 [inline]
RIP: 0010:sysfs_remove_group+0x155/0x1b0 fs/sysfs/group.c:269
Code: 48 89 d9 49 8b 14 24 48 b8 00 00 00 00 00 fc ff df 48 c1 e9 03 80 3c  
01 00 75 41 48 8b 33 48 c7 c7 e0 c8 d0 85 e8 a0 0e 8b ff <0f> 0b eb 95 e8  
e2 d1 db ff e9 d2 fe ff ff 48 89 df e8 d5 d1 db ff
RSP: 0018:ffff8881c6c37c50 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffffffff85f2d700 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff81288ddd RDI: ffffed1038d86f7c
RBP: 0000000000000000 R08: ffff8881d5dab000 R09: ffffed103b643ee7
R10: ffffed103b643ee6 R11: ffff8881db21f737 R12: ffff8881cf7e2bd8
R13: ffffffff85f2dca0 R14: 0000000000000000 R15: ffff8881cf7e3078
  dpm_sysfs_remove+0x97/0xb0 drivers/base/power/sysfs.c:735
  device_del+0x12a/0xb10 drivers/base/core.c:2316
  device_unregister+0x11/0x30 drivers/base/core.c:2371
  video_unregister_device+0xa2/0xc0 drivers/media/v4l2-core/v4l2-dev.c:1051
  usbvision_unregister_video+0x83/0x120  
drivers/media/usb/usbvision/usbvision-video.c:1256
  usbvision_release+0x10d/0x1c0  
drivers/media/usb/usbvision/usbvision-video.c:1369
  usbvision_radio_close.cold+0x2b/0x74  
drivers/media/usb/usbvision/usbvision-video.c:1142
  v4l2_release+0x2e7/0x390 drivers/media/v4l2-core/v4l2-dev.c:455
  __fput+0x2d7/0x840 fs/file_table.c:280
  task_work_run+0x13f/0x1c0 kernel/task_work.c:113
  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
  exit_to_usermode_loop+0x1d2/0x200 arch/x86/entry/common.c:163
  prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
  syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
  do_syscall_64+0x45f/0x580 arch/x86/entry/common.c:299
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x7fa3a6eac2b0
Code: 40 75 0b 31 c0 48 83 c4 08 e9 0c ff ff ff 48 8d 3d c5 32 08 00 e8 c0  
07 02 00 83 3d 45 a3 2b 00 00 75 10 b8 03 00 00 00 0f 05 <48> 3d 01 f0 ff  
ff 73 31 c3 48 83 ec 08 e8 ce 8a 01 00 48 89 04 24
RSP: 002b:00007ffe36ff6c28 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000003 RCX: 00007fa3a6eac2b0
RDX: 0000000000000013 RSI: 0000000080685600 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000400884
R13: 00007ffe36ff6d80 R14: 0000000000000000 R15: 0000000000000000
Kernel Offset: disabled
Rebooting in 86400 seconds..


Tested on:

commit:         f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=10621965600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
dashboard link: https://syzkaller.appspot.com/bug?extid=7fa38a608b1075dfd634
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15fea979600000

