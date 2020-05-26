Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 182411B6583
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2020 22:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbgDWUhF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Apr 2020 16:37:05 -0400
Received: from mail-il1-f198.google.com ([209.85.166.198]:42321 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgDWUhE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Apr 2020 16:37:04 -0400
Received: by mail-il1-f198.google.com with SMTP id l16so7421608ilf.9
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2020 13:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=Fh1Rwz1L5Fktyzu7aZcY0NbJt9JupzD0Et8VKTqI8Dw=;
        b=rNe2VqOTT+frmERFL/bgnvlHPjXFIj1IMlqRHPtsJNwac21FouNtSPRjh/MfbDR6xQ
         XvlJ8A341JX/kIriZ+gvxoWfzh8FlwdHxLWvjdEy0Zs/aCUbBhBEuCkVQhz0WrYx4iuu
         FAeCLOZbC4J1DA82RnsEAlwOeQgPdevplij0aL884Ro3WDEMOIXxxskYlgJIK5m5P5XJ
         vD+d8VIMDHFAIo7Ner3+TrntEQolpwsoryvm8KbdJ203vDNCXq3/1N4ucViEtAwj9zbp
         QV+3l4GWmn35+DHr1X7/Q9xdYWxTmY1zp1q43yR8TGYgH/aJlajTKM4Q8QrlytmIO3ke
         fr7g==
X-Gm-Message-State: AGi0PubT8xLK7M5iBNtyeT/aPpvbOv+2gU8ySmYUcmah3NUVROb9P7PV
        La/OHEmKTUDN5WlzohSSqqm/UrVrmJyTQPWAJxkCDmSm4n9v
X-Google-Smtp-Source: APiQypIRven/Uxycbw1y/arYmjGIp1zPGSk+lq6qYoWGv5tlOatvIjsb58ugJT77RaFSloaPdHpaRShiQArumo/5i2e5SxtWDH6f
MIME-Version: 1.0
X-Received: by 2002:a5e:9401:: with SMTP id q1mr5318069ioj.80.1587674223663;
 Thu, 23 Apr 2020 13:37:03 -0700 (PDT)
Date:   Thu, 23 Apr 2020 13:37:03 -0700
In-Reply-To: <Pine.LNX.4.44L0.2004231451570.13251-100000@netrider.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001ee25205a3fb364b@google.com>
Subject: Re: WARNING in usbhid_raw_request/usb_submit_urb (3)
From:   syzbot <syzbot+db339689b2101f6f6071@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        ingrassia@epigenesys.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer still triggered crash:
WARNING in usbhid_raw_request/usb_submit_urb

usb 2-1: Ep 0 disabled: 4
------------[ cut here ]------------
usb 2-1: BOGUS urb xfer, pipe 2 != type 2
WARNING: CPU: 1 PID: 4177 at drivers/usb/core/urb.c:482 usb_submit_urb+0xa38/0x1380 drivers/usb/core/urb.c:482
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 4177 Comm: syz-executor.1 Not tainted 5.6.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
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
RIP: 0010:usb_submit_urb+0xa38/0x1380 drivers/usb/core/urb.c:482
Code: 84 40 04 00 00 e8 28 8a dd fd 4c 89 ef e8 30 5a 17 ff 41 89 d8 44 89 e1 4c 89 f2 48 89 c6 48 c7 c7 c0 dd 3b 86 e8 d0 1a b2 fd <0f> 0b e8 01 8a dd fd 0f b6 6c 24 08 bb 86 03 00 00 48 c7 c6 20 df
RSP: 0018:ffff8881cfcefb30 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000002 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff812974dd RDI: ffffed1039f9df58
RBP: 0000000000000000 R08: ffff8881d8d01880 R09: ffffed103b66439f
R10: ffffed103b66439e R11: ffff8881db321cf3 R12: 0000000000000002
R13: ffff8881c5cd60a8 R14: ffff8881c6021ed0 R15: ffff8881d9572100
 usb_start_wait_urb+0x108/0x4c0 drivers/usb/core/message.c:58
 usb_internal_control_msg drivers/usb/core/message.c:102 [inline]
 usb_control_msg+0x31c/0x4a0 drivers/usb/core/message.c:153
 usbhid_set_raw_report drivers/hid/usbhid/hid-core.c:917 [inline]
 usbhid_raw_request+0x225/0x620 drivers/hid/usbhid/hid-core.c:1265
 hid_hw_raw_request include/linux/hid.h:1079 [inline]
 hidraw_send_report+0x296/0x500 drivers/hid/hidraw.c:151
 hidraw_ioctl+0x620/0xaf0 drivers/hid/hidraw.c:422
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0x11a/0x180 fs/ioctl.c:763
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl fs/ioctl.c:770 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:770
 do_syscall_64+0xb6/0x5a0 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45c849
Code: ad b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 7b b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007fc247305c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fc2473066d4 RCX: 000000000045c849
RDX: 00000000200000c0 RSI: 0000000080404806 RDI: 0000000000000006
RBP: 000000000076bfa0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000335 R14: 00000000004c59df R15: 000000000076bfac
Kernel Offset: disabled
Rebooting in 86400 seconds..


Tested on:

commit:         0fa84af8 Merge tag 'usb-serial-5.7-rc1' of https://git.ker..
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=143e9b9be00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6b9c154b0c23aecf
dashboard link: https://syzkaller.appspot.com/bug?extid=db339689b2101f6f6071
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1067e1bbe00000

