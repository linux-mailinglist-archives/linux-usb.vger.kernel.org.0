Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE00E12CC3F
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 04:53:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbfL3DxM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 29 Dec 2019 22:53:12 -0500
Received: from mail-il1-f200.google.com ([209.85.166.200]:52536 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbfL3DxM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 29 Dec 2019 22:53:12 -0500
Received: by mail-il1-f200.google.com with SMTP id n9so27461186ilm.19
        for <linux-usb@vger.kernel.org>; Sun, 29 Dec 2019 19:53:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=QFH+qW3J/16INYjNRxXbTehCb50b/OjjpTQl6yL7Mgw=;
        b=LpcBi2j4NsxXaJVyUc+60JKYsJ3Ep99MkTNlWr6yFgQmSMAP7Q9f0D0mlpDyYLNQB+
         TcNjJfSenvzLpF5uVXF7WHm1Uc/VuLAfrZwAsWsa15CH1/JSyCkPn19WEkQiiWOXm/C+
         BZeH9dsrEU/EHQ0t5aEyDS7IvLZfdfKBMkrTcClimTtdZI9lEDAfX9uHOQcQJPIRf9SB
         J+piXltyixsq85fHMDJ/RgNS2wzkaoJ3bENNV73rPO9dYQmonUWvAAC12hU7UpqJE1vh
         tpeVb3Vq9ffwr96Tw9YCbbokMiP1vbvOoXo/miIfw9DY+94OHONzzBNES1AB0yuDGVaf
         HtgQ==
X-Gm-Message-State: APjAAAV7vv/6IbOsvJEfCHsVquOM6+CuniIbz+6a5Sq49+OGirTeNVuw
        5fkKuxixgdK5yhf4UTdX73isiN1pBflihX1i5tBOdjgat6O6
X-Google-Smtp-Source: APXvYqx4OzLImous1aCutVowPBUpD47wejOEgiojhbkbDMo2oMrsyDwQmoDj7oobJP0RL7hMxv9d6SGgVUn3HcdpTbQSrF1v4Uo5
MIME-Version: 1.0
X-Received: by 2002:a02:9503:: with SMTP id y3mr49704411jah.14.1577677991682;
 Sun, 29 Dec 2019 19:53:11 -0800 (PST)
Date:   Sun, 29 Dec 2019 19:53:11 -0800
In-Reply-To: <000000000000e906be059580f8cd@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000043a9a3059ae3c8ef@google.com>
Subject: Re: WARNING in usbhid_raw_request/usb_submit_urb (2)
From:   syzbot <syzbot+10e5f68920f13587ab12@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, ingrassia@epigenesys.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot has found a reproducer for the following crash on:

HEAD commit:    ecdf2214 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=17416885e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b06a019075333661
dashboard link: https://syzkaller.appspot.com/bug?extid=10e5f68920f13587ab12
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13598885e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+10e5f68920f13587ab12@syzkaller.appspotmail.com

------------[ cut here ]------------
usb 1-1: BOGUS urb xfer, pipe 2 != type 2
WARNING: CPU: 0 PID: 2388 at drivers/usb/core/urb.c:478  
usb_submit_urb+0x1188/0x13b0 drivers/usb/core/urb.c:478
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 2388 Comm: syz-executor.0 Not tainted 5.5.0-rc2-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xef/0x16e lib/dump_stack.c:118
  panic+0x2aa/0x6e1 kernel/panic.c:221
  __warn.cold+0x2f/0x30 kernel/panic.c:582
  report_bug+0x27b/0x2f0 lib/bug.c:195
  fixup_bug arch/x86/kernel/traps.c:174 [inline]
  fixup_bug arch/x86/kernel/traps.c:169 [inline]
  do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:267
  do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:286
  invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1027
RIP: 0010:usb_submit_urb+0x1188/0x13b0 drivers/usb/core/urb.c:478
Code: 4d 85 ed 74 2c e8 78 90 e7 fd 4c 89 f7 e8 70 2c 1d ff 41 89 d8 44 89  
e1 4c 89 ea 48 89 c6 48 c7 c7 80 59 15 86 e8 20 ad bc fd <0f> 0b e9 20 f4  
ff ff e8 4c 90 e7 fd 4c 89 f2 48 b8 00 00 00 00 00
RSP: 0018:ffff8881cf197b30 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000002 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff81295dad RDI: ffffed1039e32f58
RBP: 0000000000000000 R08: ffff8881cfe6b100 R09: fffffbfff11f1ebe
R10: fffffbfff11f1ebd R11: ffffffff88f8f5ef R12: 0000000000000002
R13: ffff8881da370d80 R14: ffff8881d01e90a0 R15: ffff8881cfe18e00
  usb_start_wait_urb+0x108/0x2b0 drivers/usb/core/message.c:57
  usb_internal_control_msg drivers/usb/core/message.c:101 [inline]
  usb_control_msg+0x31c/0x4a0 drivers/usb/core/message.c:152
  usbhid_set_raw_report drivers/hid/usbhid/hid-core.c:917 [inline]
  usbhid_raw_request+0x21f/0x640 drivers/hid/usbhid/hid-core.c:1265
  hid_hw_raw_request include/linux/hid.h:1079 [inline]
  hidraw_send_report+0x296/0x500 drivers/hid/hidraw.c:151
  hidraw_write+0x34/0x50 drivers/hid/hidraw.c:164
  __vfs_write+0x76/0x100 fs/read_write.c:494
  vfs_write+0x262/0x5c0 fs/read_write.c:558
  ksys_write+0x127/0x250 fs/read_write.c:611
  do_syscall_64+0xb6/0x5c0 arch/x86/entry/common.c:294
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45a919
Code: ad b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 7b b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f181187dc78 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 000000000045a919
RDX: 0000000000000002 RSI: 0000000020000040 RDI: 0000000000000007
RBP: 000000000075bfc8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f181187e6d4
R13: 00000000004cbe90 R14: 00000000004e5ce0 R15: 00000000ffffffff
Kernel Offset: disabled
Rebooting in 86400 seconds..

