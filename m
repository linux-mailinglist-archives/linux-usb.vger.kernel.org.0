Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5548719CC57
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2020 23:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388148AbgDBVZF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Apr 2020 17:25:05 -0400
Received: from mail-il1-f199.google.com ([209.85.166.199]:42295 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731842AbgDBVZE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Apr 2020 17:25:04 -0400
Received: by mail-il1-f199.google.com with SMTP id j88so4709251ilg.9
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2020 14:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=7DSGAtFq8cBRMK5Ky7QRP/F+L98XsCIsky9uoP3uDLg=;
        b=PlUUljJH+wg3TmffGJdiYc4K8trB5luBvzVogsBIvlz9ZXOtO5kjwa8ZoXAc2L/UCL
         Q/PmSrNrWBCb8NpQt7vI3/zw5mksc6WzzT8enqGhKmaYI+joJlzazk8awra5cN6w64Ke
         wYh8IFbzeVrjj+Sz1kAjX6KiuH0vVBA9QS58EJLb6izrkO/ltESwRZ8b8JjcfeYh7c2O
         qP79C2Ff75UWW2zRIlx0LvC/G/Sy9nK9imPZL8/cJpAr5tmipLF080zXjME6k+Fr1bWi
         K/NCxcEdG4wqFUIP16p7Wyqg/C418vVbtfffBvuUHzuBgYhZoqt17Y0c76m41AGn8htN
         9QfA==
X-Gm-Message-State: AGi0Pub8ECClwRQ9mQlosOZqOnZOgp09N0TAUuDVOG0d60OYt4L6qxLu
        GpzD+QmdqTHBSulJVyGSrQYqNDytKkHa+Pyn1iLRtLfvO68L
X-Google-Smtp-Source: APiQypILci59R8TeoWBPU+pLhDRVwa4sob2rWj6PZeTrYuFK4l9tk+3E4RVwEzBQT1LnM+f9HPUGEAt2mWJdFt7Jx9vmfQ8cgOin
MIME-Version: 1.0
X-Received: by 2002:a6b:8f11:: with SMTP id r17mr4461879iod.92.1585862703642;
 Thu, 02 Apr 2020 14:25:03 -0700 (PDT)
Date:   Thu, 02 Apr 2020 14:25:03 -0700
In-Reply-To: <Pine.LNX.4.44L0.2004021428320.852-100000@netrider.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001cfc5605a2556fb7@google.com>
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

------------[ cut here ]------------
usb 1-1: BOGUS urb xfer, pipe 2 != type 2, pipe 0x80005600, ep attr 0x00, ep addr 0xff
WARNING: CPU: 1 PID: 8507 at drivers/usb/core/urb.c:490 usb_submit_urb+0xa41/0x1380 drivers/usb/core/urb.c:490
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 8507 Comm: syz-executor.0 Not tainted 5.6.0-rc7-syzkaller #0
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
RIP: 0010:usb_submit_urb+0xa41/0x1380 drivers/usb/core/urb.c:490
Code: f7 e8 53 5e 17 ff 41 89 e9 41 89 d8 44 89 e1 41 55 48 89 c6 8b 44 24 30 48 c7 c7 80 dd 3b 86 50 48 8b 54 24 40 e8 c7 1e b2 fd <0f> 0b 58 5a e8 f6 8d dd fd 0f b6 6c 24 08 bb 86 03 00 00 48 c7 c6
RSP: 0018:ffff8881cfef7b28 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000002 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff812974dd RDI: ffffed1039fdef57
RBP: 0000000080005600 R08: ffff8881c528e200 R09: ffffed103b666248
R10: ffffed103b666247 R11: ffff8881db33123f R12: 0000000000000002
R13: 00000000000000ff R14: ffff8881d999d0a0 R15: ffff8881da357800
 usb_start_wait_urb+0x108/0x4c0 drivers/usb/core/message.c:58
 usb_internal_control_msg drivers/usb/core/message.c:102 [inline]
 usb_control_msg+0x31c/0x4a0 drivers/usb/core/message.c:153
 usbhid_set_raw_report drivers/hid/usbhid/hid-core.c:917 [inline]
 usbhid_raw_request+0x21f/0x640 drivers/hid/usbhid/hid-core.c:1265
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
RSP: 002b:00007fe66e55bc78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fe66e55c6d4 RCX: 000000000045c849
RDX: 00000000200000c0 RSI: 0000000080404806 RDI: 0000000000000006
RBP: 000000000076bfa0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000335 R14: 00000000004c59df R15: 000000000076bfac
Kernel Offset: disabled
Rebooting in 86400 seconds..


Tested on:

commit:         0fa84af8 Merge tag 'usb-serial-5.7-rc1' of https://git.ker..
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15ddbf2fe00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6b9c154b0c23aecf
dashboard link: https://syzkaller.appspot.com/bug?extid=db339689b2101f6f6071
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1559e85de00000

