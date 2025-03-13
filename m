Return-Path: <linux-usb+bounces-21731-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6A1A5FCCB
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 17:59:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6337516B92F
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 16:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31AE26A0A2;
	Thu, 13 Mar 2025 16:59:33 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C1A268FED
	for <linux-usb@vger.kernel.org>; Thu, 13 Mar 2025 16:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741885173; cv=none; b=CmOJzOiRN7ZODIzQ5sS4bC743oy3e6/lHgpgPMr0hGaCWxPMZTaekB9EDO0Lr9eqmAaVe5XrnQC4UVTw9MbqXWsaqgW1Vh762VVBQVmOkBG9iVKgyu0nBbaZ/eE9NS+kubBGItPitMIOaFwe5lOb51lObM0Sz9ZVFpgVXn2v3DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741885173; c=relaxed/simple;
	bh=5plUZokiGNszsQd5jMdJREBDilijqjztiPfhbU0oomI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=AFyjtJ0k19cgfh/kBdJBH4GrBqM0wQjKCdMclL8HVOXsRUTVtQKlOunOruQZgwHHUeu1Z0w5INxW12zZXEPRfuxxBiARS4OLIw1ngQDyLBPEOfunINtAf7C7iH9tYuyIfnJoIlCOxOceobS+gXIJc53H5iBBS7Usa+Q6NOaVRBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3d054d79dacso20630365ab.2
        for <linux-usb@vger.kernel.org>; Thu, 13 Mar 2025 09:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741885171; x=1742489971;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CAVyUdjA1Fi7LXzB/oZslQ8tsF7/jZYEXnsjntzroqE=;
        b=lOSqo9qGvtttNimLXjDGCcs1+r9tucuRkMc3+/YgrDGR0RYIpG6pPPVaHuJMiAQNNM
         XGz9zcthMZWpON6n+3iKhBxjKsY43sVZkX/GAu0A4/OvW0ctnJtPWfnFBul9KJ4hAg75
         G/nN0NMVNABIBcn7butudsMzL/1nOLDmdvP2Ui/kyK93Z4iBFRDzCo9HhntlfVwulMDi
         L2Di1XkimSFbaXzwQi3dat195MZBWewIzMVnQK892X9fI8On2hLQw3jwk0HWfJsUONGT
         WEET+U883skgxlZLkjwrdFi9p7YxLNPl1+nJ8VX10EuO4RVmnaj2cItA4XaAh+LhmWpj
         SP/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXeriqbV7JlHiOdv5jmDRCyOFS4Qiw0Jm93xnpYVfJIr+Nn3Jhypvimznxv1M8Y2m6uOCmoCzDC6Gg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqCA2N3MzKoGKKrICU4GQ0/eruwCmfgRvX7PhxWOGIHlqCb1Mc
	4CBTUR/A5N8ggpxc7FxKVs+OKoKCtUUsNlzpaElC6ZMk5tONVHXSFDygI9KJsVOttE/cE8hi+d+
	8/Vou2FQGE1/a6XapjBOq/BX2OkHPx/wP4yIxeTgqEgIZRItoyMqr7cQ=
X-Google-Smtp-Source: AGHT+IGaGZzlBUeOGaoLnZmW9bgDBCxgtJaE55nziPEvab/sw8+W63R2zUJ4P/BgZbmd5Zz4Rq0ngyXdUb7Mlq/C3Db/n3UoXyQz
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c262:0:b0:3d4:712e:29eb with SMTP id
 e9e14a558f8ab-3d482051ea1mr6445ab.5.1741885170964; Thu, 13 Mar 2025 09:59:30
 -0700 (PDT)
Date: Thu, 13 Mar 2025 09:59:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67d30ef2.050a0220.14e108.003a.GAE@google.com>
Subject: [syzbot] [input?] [usb?] WARNING in hanwang_open/usb_submit_urb
From: syzbot <syzbot+9fe8f6caeb5661802ca2@syzkaller.appspotmail.com>
To: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    b331a3d8097f xhci: Handle spurious events on Etron host is..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=17db1fa0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f429368eda610a89
dashboard link: https://syzkaller.appspot.com/bug?extid=9fe8f6caeb5661802ca2
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=164a34b7980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11f04664580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6dd3e4d1c59b/disk-b331a3d8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/58f91d593dc0/vmlinux-b331a3d8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6cbf2795aa43/bzImage-b331a3d8.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9fe8f6caeb5661802ca2@syzkaller.appspotmail.com

------------[ cut here ]------------
usb 1-1: BOGUS urb xfer, pipe 1 != type 3
WARNING: CPU: 0 PID: 2827 at drivers/usb/core/urb.c:503 usb_submit_urb+0xe4b/0x1730 drivers/usb/core/urb.c:503
Modules linked in:
CPU: 0 UID: 0 PID: 2827 Comm: acpid Not tainted 6.14.0-rc3-syzkaller-00071-gb331a3d8097f #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:usb_submit_urb+0xe4b/0x1730 drivers/usb/core/urb.c:503
Code: 84 3c 02 00 00 e8 65 93 ee fc 4c 89 ef e8 fd ca d4 fe 45 89 e0 89 e9 4c 89 f2 48 89 c6 48 c7 c7 00 53 a2 87 e8 f6 a8 b2 fc 90 <0f> 0b 90 90 e9 e9 f8 ff ff e8 37 93 ee fc 49 81 c4 c0 05 00 00 e9
RSP: 0018:ffffc90001617818 EFLAGS: 00010282
RAX: 0000000000000000 RBX: ffff888104e85600 RCX: ffffffff813f4dd9
RDX: ffff8881163eba80 RSI: ffffffff813f4de6 RDI: 0000000000000001
RBP: 0000000000000001 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000003
R13: ffff88810138b0b0 R14: ffff888113321760 R15: ffff888104e8567c
FS:  00007fd474ef6740(0000) GS:ffff8881f5800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055c4f0adf170 CR3: 00000001163ca000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 hanwang_open+0xa8/0xf0 drivers/input/tablet/hanwang.c:284
 input_open_device+0x230/0x390 drivers/input/input.c:600
 evdev_open_device drivers/input/evdev.c:391 [inline]
 evdev_open+0x52d/0x690 drivers/input/evdev.c:478
 chrdev_open+0x237/0x6a0 fs/char_dev.c:414
 do_dentry_open+0x6cb/0x1390 fs/open.c:956
 vfs_open+0x82/0x3f0 fs/open.c:1086
 do_open fs/namei.c:3830 [inline]
 path_openat+0x1e88/0x2d80 fs/namei.c:3989
 do_filp_open+0x20c/0x470 fs/namei.c:4016
 do_sys_openat2+0x17a/0x1e0 fs/open.c:1428
 do_sys_open fs/open.c:1443 [inline]
 __do_sys_openat fs/open.c:1459 [inline]
 __se_sys_openat fs/open.c:1454 [inline]
 __x64_sys_openat+0x175/0x210 fs/open.c:1454
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd474fc09a4
Code: 24 20 48 8d 44 24 30 48 89 44 24 28 64 8b 04 25 18 00 00 00 85 c0 75 2c 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00 00 0f 05 <48> 3d 00 f0 ff ff 76 60 48 8b 15 55 a4 0d 00 f7 d8 64 89 02 48 83
RSP: 002b:00007ffd7571ff60 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007ffd75720248 RCX: 00007fd474fc09a4
RDX: 0000000000080800 RSI: 00007ffd75720148 RDI: 00000000ffffff9c
RBP: 00007ffd75720148 R08: 00000000000000f4 R09: 00007ffd75720148
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000080800
R13: 0000000000000020 R14: 00007ffd75720248 R15: 00007ffd75720148
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

