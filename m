Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2B7C952D6
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2019 02:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728807AbfHTAuH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 20:50:07 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:49544 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728773AbfHTAuH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Aug 2019 20:50:07 -0400
Received: by mail-io1-f69.google.com with SMTP id k13so5938898ioh.16
        for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2019 17:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=ayISk8pRIZ3fvLz0q0dseQ9S0ykGRFj0hmMBya3EZZY=;
        b=oUJU2rJk4sehciAmHFbWfXKFYmaLeoTexqcBt9BAZQT4Uxj9SJzIjwSVOfiTAoSpoU
         js0sSgiMZnVPvpmEsH4wgejIFXzdz8y3c7taXlDVnqiKpbDrV+b6MY+PsJomXOE042vm
         C2ble/KxcS98ofFaUprWhHZX4Uf2pOj4+kMDOxO7HzC302qVczRJjVWmaaPhIR1pdcZf
         1m7P4CY3nKXxSATRvPQaeZx+ijJuMBX15dvy4tXFMsOKtiMIk7sx57Pl4+OBObAZMZqO
         fAg/Wb3wHKRLNO/sE7jQLm6CgzPcKxuR8J3xspbXv+xtjlUmD5reSagjnlPww2LQMBkG
         MFag==
X-Gm-Message-State: APjAAAW9T2xtuSHhG6UGg3hIriEzMCtKfJ7gOUGxs+uTYsP4Ge298tCS
        +rlyff4ktIdHJC5mjZ2K+uYzwJyGHKKnVaWUk6VL/O7Dpitk
X-Google-Smtp-Source: APXvYqx0McsdF+sn6ssiL6gFDgRhemyAQaQFGH6OYx2mD5Ykw68jfXazglGGJcCFqkfi9F3gqRDGnQIg3wGPL2mU8sH7oDhWqQXf
MIME-Version: 1.0
X-Received: by 2002:a6b:ee12:: with SMTP id i18mr28234407ioh.172.1566262206499;
 Mon, 19 Aug 2019 17:50:06 -0700 (PDT)
Date:   Mon, 19 Aug 2019 17:50:06 -0700
In-Reply-To: <00000000000098afd80590796d14@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000719222059081d6f2@google.com>
Subject: Re: WARNING in wdm_write/usb_submit_urb
From:   syzbot <syzbot+d232cca6ec42c2edb3fc@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot has found a reproducer for the following crash on:

HEAD commit:    e06ce4da usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=14a8c0b6600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d0c62209eedfd54e
dashboard link: https://syzkaller.appspot.com/bug?extid=d232cca6ec42c2edb3fc
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12b6dfba600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15f63a4c600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+d232cca6ec42c2edb3fc@syzkaller.appspotmail.com

------------[ cut here ]------------
URB 000000005fab893a submitted while active
WARNING: CPU: 1 PID: 1788 at drivers/usb/core/urb.c:362  
usb_submit_urb+0x10c1/0x13b0 drivers/usb/core/urb.c:362
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 1788 Comm: syz-executor522 Not tainted 5.3.0-rc5+ #27
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
RIP: 0010:usb_submit_urb+0x10c1/0x13b0 drivers/usb/core/urb.c:362
Code: 89 de e8 82 bc ef fd 84 db 0f 85 42 f6 ff ff e8 45 bb ef fd 4c 89 fe  
48 c7 c7 80 68 18 86 c6 05 27 30 3a 04 01 e8 34 a1 c5 fd <0f> 0b e9 20 f6  
ff ff c7 44 24 14 01 00 00 00 e9 d7 f6 ff ff 41 bd
RSP: 0018:ffff8881d036fc98 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff81288cfd RDI: ffffed103a06df85
RBP: ffff8881cfce56a0 R08: ffff8881d1ce4800 R09: ffffed103b663ee7
R10: ffffed103b663ee6 R11: ffff8881db31f737 R12: 1ffff1103a06dfa7
R13: 00000000fffffff0 R14: ffff8881cfce5688 R15: ffff8881d8106d00
  wdm_write+0x828/0xd87 drivers/usb/class/cdc-wdm.c:423
  __vfs_write+0x76/0x100 fs/read_write.c:494
  vfs_write+0x262/0x5c0 fs/read_write.c:558
  ksys_write+0x127/0x250 fs/read_write.c:611
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x447029
Code: e8 ec e7 ff ff 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 3b 07 fc ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f1e9e0a4da8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00000000006dcc28 RCX: 0000000000447029
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 00000000006dcc20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000006dcc2c
R13: 0000000020000000 R14: 00000000004af170 R15: 00000000000003e8
Kernel Offset: disabled
Rebooting in 86400 seconds..

