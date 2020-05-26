Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB1B81B753F
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2020 14:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbgDXMcG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Apr 2020 08:32:06 -0400
Received: from mail-il1-f200.google.com ([209.85.166.200]:48176 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728467AbgDXMcF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Apr 2020 08:32:05 -0400
Received: by mail-il1-f200.google.com with SMTP id h26so9431726ilf.15
        for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2020 05:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=yK0wAoGKugNS69+oM9ObjI/OyZcx0KM5Rr5d8hGyhfk=;
        b=Gqk7qzsgHyy4twfghFJbLUciQK5sMGOxKQqw0Ddonizr71YGjhuYLsbrqpKpcBfc3B
         LKkxWXNmVq5QHK10unHQHMjrEc+jah5vZWw9PvBGSQ8HCJivXKSp1JMNA3LYpfc43SOB
         9ix6BOlTc0v4RtV3ijT/4oCW8XVUI0aYCbeglekJZJZaVZkHtT6e/DPiX5a9r0GAQqWH
         C5dScSEO1+KXjwdmLBwQHRBBUWhcl2z0qWLeJpdKtgAprErRUIGCCpG9nve0zrhuPvyC
         SjmcmBiYVaPMYwe11B+tudRoxgwGGco/5pzqgeYdKg9QwESTR4M7yED9HFgbLR9oMXfx
         kyZw==
X-Gm-Message-State: AGi0PuYLp/qUUF3hQ5Myj8SGVEkKhYnkKZe6HDf/MgMNaVPN2gkRQ6hW
        6qZMkQSlpngGy7wTL0YKwgO1sDeckDGX4yl7KryxeoZjPEFh
X-Google-Smtp-Source: APiQypIJVlz/0E/OMhixpF63qSBEIklUpfcXcAxKIuCOhhWqte2oP4DM638Zjln5/L8qBnO46RGI81CrYem5xaQKnJ+Bx0O7wKJm
MIME-Version: 1.0
X-Received: by 2002:a05:6638:247:: with SMTP id w7mr7991586jaq.128.1587731523959;
 Fri, 24 Apr 2020 05:32:03 -0700 (PDT)
Date:   Fri, 24 Apr 2020 05:32:03 -0700
In-Reply-To: <Pine.LNX.4.44L0.2004240817010.26813-100000@netrider.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007c083305a4088d09@google.com>
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
WARNING in usb_queue_reset_device

------------[ cut here ]------------
usbhid 3-1:0.0: Device reset
WARNING: CPU: 0 PID: 12 at drivers/usb/core/hub.c:6007 usb_queue_reset_device+0x63/0x130 drivers/usb/core/hub.c:6007
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.6.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: events hid_reset
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
RIP: 0010:usb_queue_reset_device+0x63/0x130 drivers/usb/core/hub.c:6007
Code: 00 00 4c 8d 6d 30 4d 85 e4 74 72 e8 47 02 e0 fd 4c 89 ef e8 4f d2 19 ff 4c 89 e2 48 c7 c7 20 79 3b 86 48 89 c6 e8 f5 92 b4 fd <0f> 0b 48 8d 95 f0 04 00 00 48 c7 c0 88 2a e6 87 48 b9 00 00 00 00
RSP: 0018:ffff8881da227ce0 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffff8881cd5ae920 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff812974dd RDI: ffffed103b444f8e
RBP: ffff8881ce92d000 R08: ffff8881da211880 R09: ffffed103b646248
R10: ffffed103b646247 R11: ffff8881db23123f R12: ffff8881d4c25d80
R13: ffff8881ce92d030 R14: ffff8881da0ef400 R15: ffff8881db233e00
 hid_reset+0x219/0x3e0 drivers/hid/usbhid/hid-core.c:138
 process_one_work+0x94b/0x1620 kernel/workqueue.c:2266
 worker_thread+0x96/0xe20 kernel/workqueue.c:2412
 kthread+0x318/0x420 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Kernel Offset: disabled
Rebooting in 86400 seconds..


Tested on:

commit:         0fa84af8 Merge tag 'usb-serial-5.7-rc1' of https://git.ker..
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=147a58a7e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6b9c154b0c23aecf
dashboard link: https://syzkaller.appspot.com/bug?extid=db339689b2101f6f6071
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1131acdfe00000

