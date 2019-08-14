Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA518D24E
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2019 13:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727157AbfHNLiG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Aug 2019 07:38:06 -0400
Received: from mail-ot1-f72.google.com ([209.85.210.72]:56427 "EHLO
        mail-ot1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbfHNLiG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Aug 2019 07:38:06 -0400
Received: by mail-ot1-f72.google.com with SMTP id q22so94845485otl.23
        for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2019 04:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=YWQkpPFDkZrCtHRJpBrQhhdaTaxg9rth8B7pR83gTLY=;
        b=IWLc+aX6RLz3/DBtixOOkkbbenSRbjFj/3bKrUyNbopMTGbDCmt3mOoZL4/vsGBFn2
         zeJPVVzU8NSqlJAQdbQirxdvd6jRS8rQPs8mA6OU4IShgm9X2tNUDlMtDJ+zJFbh152k
         0Q8Tt3fopodb7vIvFWG8Jq/HOfMzpcVv6Mbdh0S7ZFYNaBm3CqKNkW4Jr16OzIIJnu2D
         vl0PdHHAzVIftaX9cCKqezV0tI55ZsVMEjOweXXm9E05OxIg+cb7h4nez0m/VlLTrOrx
         rbFUkC+Uo80v2nzdrjr0+sk4ORiM5qO6Bphdrf3PuXV7LLlkId8/d86qiefEws1PMjhu
         r4Gw==
X-Gm-Message-State: APjAAAWCUIqAfleoUphXzUEqFy3msdpXmrz9Dxtx3ckyZnC0Il7oENM3
        yzz0Uu+I8+X/mvDqoeaOowszaV2WPaaHxGzCDjj1u8BW+hel
X-Google-Smtp-Source: APXvYqzn1jlyElPyeuZyrEOQDiA7iCHtsdE5gE/FFFK+D7+LHT+5Gzd46ohTJEhcvLbd7I10L8kQRQINURwT6Zh1zJDYSGji9CjP
MIME-Version: 1.0
X-Received: by 2002:a6b:ed01:: with SMTP id n1mr22583424iog.255.1565782685518;
 Wed, 14 Aug 2019 04:38:05 -0700 (PDT)
Date:   Wed, 14 Aug 2019 04:38:05 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c4157e0590123002@google.com>
Subject: divide error in usbtmc_generic_read
From:   syzbot <syzbot+55b0304b360654a7537b@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        guido.kiener@rohde-schwarz.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, steve_bayless@keysight.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    d0847550 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=16295d4a600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dbc9c80cc095da19
dashboard link: https://syzkaller.appspot.com/bug?extid=55b0304b360654a7537b
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1288a31c600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15282e86600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+55b0304b360654a7537b@syzkaller.appspotmail.com

divide error: 0000 [#1] SMP KASAN
CPU: 1 PID: 1761 Comm: syz-executor063 Not tainted 5.3.0-rc4+ #26
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
RIP: 0010:usbtmc_generic_read+0x135/0x1190 drivers/usb/class/usbtmc.c:816
Code: 48 c1 ea 03 0f b6 14 02 48 89 f8 83 e0 07 83 c0 01 38 d0 7c 08 84 d2  
0f 85 50 08 00 00 41 0f b7 6e 34 31 d2 31 ff 8b 44 24 28 <f7> f5 89 d6 41  
89 d4 e8 2f 54 c9 fd 44 8b 6c 24 28 45 85 e4 44 89
RSP: 0018:ffff8881d2b77a58 EFLAGS: 00010246
RAX: 0000000000000002 RBX: 000000004f894bad RCX: ffffffff837487cd
RDX: 0000000000000000 RSI: ffffffff837487da RDI: 0000000000000000
RBP: 0000000000000000 R08: ffff8881d20a0000 R09: ffffed103a56ef90
R10: ffffed103a56ef8f R11: 0000000000000003 R12: ffff8881d08e7180
R13: 0000000020000000 R14: ffff8881d0404c80 R15: ffff8881d08e7180
FS:  0000555555b74880(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000006cc090 CR3: 00000001d615e000 CR4: 00000000001406e0
Call Trace:
  usbtmc_ioctl_generic_read drivers/usb/class/usbtmc.c:1029 [inline]
  usbtmc_ioctl+0x27d/0x2ab0 drivers/usb/class/usbtmc.c:2089
  vfs_ioctl fs/ioctl.c:46 [inline]
  file_ioctl fs/ioctl.c:509 [inline]
  do_vfs_ioctl+0xd2d/0x1330 fs/ioctl.c:696
  ksys_ioctl+0x9b/0xc0 fs/ioctl.c:713
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:718
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x4419a9
Code: e8 8c e8 ff ff 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 cb 08 fc ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ffd0abd6738 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00000000004419a9
RDX: 0000000020000000 RSI: 00000000c0145b0e RDI: 0000000000000004
RBP: 000000000000a984 R08: 000000000000000f R09: 00000000004002c8
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000402700
R13: 0000000000402790 R14: 0000000000000000 R15: 0000000000000000
Modules linked in:
---[ end trace a91d281a4d83213c ]---
RIP: 0010:usbtmc_generic_read+0x135/0x1190 drivers/usb/class/usbtmc.c:816
Code: 48 c1 ea 03 0f b6 14 02 48 89 f8 83 e0 07 83 c0 01 38 d0 7c 08 84 d2  
0f 85 50 08 00 00 41 0f b7 6e 34 31 d2 31 ff 8b 44 24 28 <f7> f5 89 d6 41  
89 d4 e8 2f 54 c9 fd 44 8b 6c 24 28 45 85 e4 44 89
RSP: 0018:ffff8881d2b77a58 EFLAGS: 00010246
RAX: 0000000000000002 RBX: 000000004f894bad RCX: ffffffff837487cd
RDX: 0000000000000000 RSI: ffffffff837487da RDI: 0000000000000000
RBP: 0000000000000000 R08: ffff8881d20a0000 R09: ffffed103a56ef90
R10: ffffed103a56ef8f R11: 0000000000000003 R12: ffff8881d08e7180
R13: 0000000020000000 R14: ffff8881d0404c80 R15: ffff8881d08e7180
FS:  0000555555b74880(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000006cc090 CR3: 00000001d615e000 CR4: 00000000001406e0


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
