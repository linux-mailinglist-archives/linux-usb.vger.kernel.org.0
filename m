Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB790F161D
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2019 13:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731751AbfKFMcR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Nov 2019 07:32:17 -0500
Received: from mail-il1-f197.google.com ([209.85.166.197]:45965 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731644AbfKFMcM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Nov 2019 07:32:12 -0500
Received: by mail-il1-f197.google.com with SMTP id n84so21355251ila.12
        for <linux-usb@vger.kernel.org>; Wed, 06 Nov 2019 04:32:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=FxwEXdnT5G2NQEd8PmMUeHdK02q7Pp1C9goKfaWk6fQ=;
        b=Kp0W8Mo0ktZGVSULcIgjNeJbSpXvd5ro2jRdk+0fqHRWK0o/KfxMBZsZp4/eadUun6
         mpEtDZeUMNIv8xTDkodj89tOxPtwvooTbuUfByaBDnCpmUJJjeMxMKsznOrk4uDgZp2y
         8B8gNla0Bf9qgl5otcPh+d7dYzN4X5BNZafAwcrfPrGhd7hMO1GrAuT5zgQ6EK9fKNVc
         HmSfDnfdgN+CLvphM+Cxc32m/d1gNqz5ckEqOxM/k9oeSeEQVATGexNDgya8hcSCTj9r
         3b2zoPm2sOKpKsduiXWZBFpqh3SXOwGf3UejEjKN1caas55KyjH2y0e8Mb8oX5JtukpA
         quLg==
X-Gm-Message-State: APjAAAWaM4wJn7Tuduq5ehUTFfGEq8Ev0CmLumR95UZqGU9Jro2Vcv31
        tYtWKkx2KLyvPe1ASFRB3bbHr0YP07W20435ajpDhhfaBsx5
X-Google-Smtp-Source: APXvYqyCjOfCuWqE0bZBFVHctD31OG+ozp6yMjwgOwRMXSe5BEwjmp48ZgbvK97njWjxu5ulFnJ6d7allYzh3TAEZ3NGuNY5fzb0
MIME-Version: 1.0
X-Received: by 2002:a92:9ace:: with SMTP id c75mr2459846ill.296.1573043530008;
 Wed, 06 Nov 2019 04:32:10 -0800 (PST)
Date:   Wed, 06 Nov 2019 04:32:10 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d292a50596acbc73@google.com>
Subject: WARNING in dln2_start_rx_urbs/usb_submit_urb
From:   syzbot <syzbot+48a2851be24583b864dc@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    b1aa9d83 usb: raw: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=12599e8ae00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=79de80330003b5f7
dashboard link: https://syzkaller.appspot.com/bug?extid=48a2851be24583b864dc
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=166cd064e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=144c7adce00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+48a2851be24583b864dc@syzkaller.appspotmail.com

usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
------------[ cut here ]------------
usb 1-1: BOGUS urb xfer, pipe 3 != type 1
WARNING: CPU: 1 PID: 83 at drivers/usb/core/urb.c:477  
usb_submit_urb+0x1188/0x13b0 drivers/usb/core/urb.c:477
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 83 Comm: kworker/1:2 Not tainted 5.4.0-rc6+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  panic+0x2aa/0x6e1 kernel/panic.c:221
  __warn.cold+0x2f/0x33 kernel/panic.c:582
  report_bug+0x27b/0x2f0 lib/bug.c:195
  fixup_bug arch/x86/kernel/traps.c:179 [inline]
  fixup_bug arch/x86/kernel/traps.c:174 [inline]
  do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:272
  do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:291
  invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1028
RIP: 0010:usb_submit_urb+0x1188/0x13b0 drivers/usb/core/urb.c:477
Code: 4d 85 ed 74 2c e8 b8 21 ef fd 4c 89 f7 e8 40 34 1f ff 41 89 d8 44 89  
e1 4c 89 ea 48 89 c6 48 c7 c7 40 77 14 86 e8 cd bc c4 fd <0f> 0b e9 20 f4  
ff ff e8 8c 21 ef fd 4c 89 f2 48 b8 00 00 00 00 00
RSP: 0018:ffff8881d89ef180 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8128c9cd RDI: ffffed103b13de22
RBP: ffff8881d53ae450 R08: ffff8881d8c5c800 R09: fffffbfff11ab3ae
R10: fffffbfff11ab3ad R11: ffffffff88d59d6f R12: 0000000000000003
R13: ffff8881d3571318 R14: ffff8881d037c0a0 R15: ffff8881d53ae200
  dln2_start_rx_urbs+0x6


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
