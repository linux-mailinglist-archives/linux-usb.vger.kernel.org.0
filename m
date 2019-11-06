Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C82D3F1C2E
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2019 18:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729328AbfKFRNK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Nov 2019 12:13:10 -0500
Received: from mail-il1-f197.google.com ([209.85.166.197]:49325 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727824AbfKFRNJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Nov 2019 12:13:09 -0500
Received: by mail-il1-f197.google.com with SMTP id c2so22260165ilj.16
        for <linux-usb@vger.kernel.org>; Wed, 06 Nov 2019 09:13:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=WsMxdV+W3wwqHTs+iCPhAwFOLdmjVwNTGfvPeK6mtPU=;
        b=nGXnM3PiTijcGD93mcmybUYsSmIdxis2ikZjGv2QZckVCJlEoSdNYBHrgXcAjkytGL
         4r75G8Ihx6H/qAbL6ehz7fbA5PSZ9p7Q0CMGqLzvUzgCN72CsfmvG+cQkOIkVAghH9dC
         Hy7ZJnD5RX+GLpzQENTPFL8GC4XU5vtdmVT8NyhxzGdhfLH2ImlUFrXhlN8ARrALj7V7
         XOgch3oi3qqXwtb8vFixm02fDpYbd9q63fGGsf6yC34A8H2Gj7gG9CFenEKWR7wvCpDM
         PW8KMlS15a0i4lIvXni97B2qpAV9Ux+Czgw68ZZ8Q7WXvrrMB1EJBvI5o5u7aKW/GVNy
         qBjw==
X-Gm-Message-State: APjAAAXc+odFqMlEhAIXBTUYJJoOb2mtAhLpBCQvbXZlY94nWzNBDx/T
        5gdintSVhKbENAurZUSPXTzXz26O9E6cLSTitiHJxJBr9BHY
X-Google-Smtp-Source: APXvYqwHTMiLlD19IQ3V6eu173n6ZHXLVsjnAZM3ONuyfn9BuF6hTyUNFPjT/ah6Po2oS2qSvC4ZwQ0aiAt3nsAl3EYfybEckjmJ
MIME-Version: 1.0
X-Received: by 2002:a92:360b:: with SMTP id d11mr3776421ila.143.1573060388960;
 Wed, 06 Nov 2019 09:13:08 -0800 (PST)
Date:   Wed, 06 Nov 2019 09:13:08 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b1c4700596b0a982@google.com>
Subject: KASAN: global-out-of-bounds Write in kbd_event
From:   syzbot <syzbot+19340dff067c2d3835c0@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org, jslaby@suse.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        rei4dan@gmail.com, slyfox@gentoo.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    b1aa9d83 usb: raw: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=125cd8fce00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=79de80330003b5f7
dashboard link: https://syzkaller.appspot.com/bug?extid=19340dff067c2d3835c0
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=123d089ae00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14167958e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+19340dff067c2d3835c0@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: global-out-of-bounds in clear_bit  
include/asm-generic/bitops-instrumented.h:56 [inline]
BUG: KASAN: global-out-of-bounds in kbd_keycode  
drivers/tty/vt/keyboard.c:1411 [inline]
BUG: KASAN: global-out-of-bounds in kbd_event+0xe6b/0x3790  
drivers/tty/vt/keyboard.c:1495
Write of size 8 at addr ffffffff89a1b2d8 by task syz-executor108/1722

CPU: 1 PID: 1722 Comm: syz-executor108 Not tainted 5.4.0-rc6+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description.constprop.0.cold+0x5/0x2fc mm/kasan/report.c:374
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:506
  kasan_report+0xe/0x20 mm/kasan/common.c:634
  check_memory_region_inline mm/kasan/generic.c:185 [inline]
  check_memory_region+0x128/0x190 mm/kasan/generic.c:192
  clear_bit include/asm-generic/bitops-instrumented.h:56 [inline]
  kbd_keycode drivers/tty/vt/keyboard.c:1411 [inline]
  kbd_event+0xe6b/0x3790 drivers/tty/vt/keyboard.c:1495
  input_to_handler+0x3b6/0x4c0 drivers/input/input.c:118
  input_pass_values.part.0+0x2e3/0x720 drivers/input/input.c:145
  input_pass_values drivers/input/input.c:949 [inline]
  input_set_keycode+0x290/0x320 drivers/input/input.c:954
  evdev_handle_set_keycode_v2+0xc4/0x120 drivers/input/evdev.c:882
  evdev_do_ioctl drivers/input/evdev.c:1150 [inline]
  evdev_ioctl_handler+0xd49/0x19f0 drivers/input/evdev.c:1284
  vfs_ioctl fs/ioctl.c:46 [inline]
  file_ioctl fs/ioctl.c:509 [inline]
  do_vfs_ioctl+0xd2d/0x1330 fs/ioctl.c:696
  ksys_ioctl+0x9b/0xc0 fs/ioctl.c:713
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:718
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x444dc9
Code: e8 bc af 02 00 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 1b d8 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007fffaf4eda08 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00000000004002e0 RCX: 0000000000444dc9
RDX: 0000000020000080 RSI: 0000000040284504 RDI: 0000000000000004
RBP: 00000000006cf018 R08: 090b000000008300 R09: 00000000004002e0
R10: 000000000000000f R11: 0000000000000246 R12: 0000000000402a70
R13: 0000000000402b00 R14: 0000000000000000 R15: 0000000000000000

The buggy address belongs to the variable:
  key_down+0x78/0x80

Memory state around the buggy address:
  ffffffff89a1b180: fa fa fa fa 04 fa fa fa fa fa fa fa 01 fa fa fa
  ffffffff89a1b200: fa fa fa fa 00 01 fa fa fa fa fa fa 00 00 00 00
> ffffffff89a1b280: 00 00 00 00 00 00 00 00 fa fa fa fa 00 00 00 00
                                                     ^
  ffffffff89a1b300: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  ffffffff89a1b380: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
