Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787BE3A49C4
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jun 2021 22:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbhFKUEZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Jun 2021 16:04:25 -0400
Received: from mail-il1-f199.google.com ([209.85.166.199]:53951 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbhFKUEW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Jun 2021 16:04:22 -0400
Received: by mail-il1-f199.google.com with SMTP id q4-20020a056e020784b02901e2ee9a8333so4138604ils.20
        for <linux-usb@vger.kernel.org>; Fri, 11 Jun 2021 13:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=Gm9wAuxeZ5ViQMFI/NZpf8tivPJ0QTzwjSVbaw+KOjw=;
        b=KPz0bh9nj1Pg30UOUxbmA0NxKK6Ro/7ZO6VvMhglTcd/37jr2JmiPKoY9U1UNW6EnD
         0HySOLnoxcYjiXONRCYWiL2TlRsLFDomtiEyEl/T8rMlwCtYvSREwQtlzlrcdZbKz5lC
         8s6vOqOLQItsfm4IUPvM4OtvVFeUbHRMm8BuRftda6yoVWhTh0NApAvvWgRwhjvR2fea
         TUbSM/W3EKibjHvz9UoyhuKSC+M7ksVRoubcSeegRaEZbXpzHy351vxNcRA0dIlDQRhK
         ZXWqiLEBehkodjNKLZbEAAUUdKvapnHvzc5+QDVzY0PIzGa50DMXwbfCPfgPavFNG2U4
         ujkg==
X-Gm-Message-State: AOAM530tmeRBdcQvCgSr72iZGdeUoiTHYfDguPoTQFdW8AazQKO/o2Mb
        2g2LvpB7ydH65MU1NYgZkYmqulu3d/RsW4Rudb8I9kI63oyE
X-Google-Smtp-Source: ABdhPJwSvRLmivzDtY2VHHSTH+5byguK4i8OIsvmr7kdCqqL1uKGYD0JvGaPAzdc3qfmLiIkaKKeUt1Bg9+3uLQzMnRzeQplESUg
MIME-Version: 1.0
X-Received: by 2002:a5e:8d16:: with SMTP id m22mr4530588ioj.139.1623441743845;
 Fri, 11 Jun 2021 13:02:23 -0700 (PDT)
Date:   Fri, 11 Jun 2021 13:02:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000074a21005c482fce2@google.com>
Subject: [syzbot] WARNING in vmk80xx_auto_attach/usb_submit_urb
From:   syzbot <syzbot+5f29dc6a889fc42bd896@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mathias.nyman@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    614124be Linux 5.13-rc5
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12188667d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=547a5e42ca601229
dashboard link: https://syzkaller.appspot.com/bug?extid=5f29dc6a889fc42bd896
compiler:       Debian clang version 11.0.1-2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1687ec3fd00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=172f44ffd00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5f29dc6a889fc42bd896@syzkaller.appspotmail.com

usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
------------[ cut here ]------------
usb 1-1: BOGUS urb xfer, pipe 1 != type 3
WARNING: CPU: 1 PID: 20 at drivers/usb/core/urb.c:494 usb_submit_urb+0xacd/0x1550 drivers/usb/core/urb.c:493
Modules linked in:
CPU: 1 PID: 20 Comm: kworker/1:0 Not tainted 5.13.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_submit_urb+0xacd/0x1550 drivers/usb/core/urb.c:493
Code: d8 48 c1 e8 03 42 8a 04 28 84 c0 0f 85 bd 07 00 00 44 8b 03 48 c7 c7 00 8a e1 8a 4c 89 f6 4c 89 fa 89 e9 31 c0 e8 83 d6 8f fb <0f> 0b 4c 8b 74 24 30 45 89 f7 4c 89 ff 48 c7 c6 b0 e1 8d 8d e8 8a
RSP: 0018:ffffc90000da6880 EFLAGS: 00010246
RAX: 0c18ab37a32f8700 RBX: ffffffff8ae18828 RCX: ffff888012c30000
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: 0000000000000001 R08: ffffffff81655632 R09: ffffed1017365f90
R10: ffffed1017365f90 R11: 0000000000000000 R12: ffff888022972100
R13: dffffc0000000000 R14: ffffffff8ae22a60 R15: ffff88801da57118
FS:  0000000000000000(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f156613e000 CR3: 0000000018033000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 usb_start_wait_urb+0x11a/0x550 drivers/usb/core/message.c:58
 vmk80xx_write_packet drivers/comedi/drivers/vmk80xx.c:213 [inline]
 vmk80xx_reset_device drivers/comedi/drivers/vmk80xx.c:226 [inline]
 vmk80xx_auto_attach+0xcc7/0x22d0 drivers/comedi/drivers/vmk80xx.c:817


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
