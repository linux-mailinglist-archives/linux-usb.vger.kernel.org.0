Return-Path: <linux-usb+bounces-23686-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 550D9AA8BE6
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 07:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B635416DBD1
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 05:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F101B4156;
	Mon,  5 May 2025 05:59:29 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EDC1B0F31
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 05:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746424769; cv=none; b=HksxcEmW9S22ZpedCFbgxGQ19etoAsgo0s6u85dZx0eZaIdTFfJo8J4i285XfJCLLF7Fo5I+mF6c45Weh+yy8MxmMIMPOVKAKTMqHbioukM4DiYoulBzgxlJCdoXx/kKvI27tAEAvMdx1pc73xLJy92dnF3pfkHqCbXQxmapibg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746424769; c=relaxed/simple;
	bh=T8BOhzj6gnh1orolpakOJwBtatSNBf9YtDaPC5/V3hA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=K9IX9zDyB2h1oabkoerV9RJBm8Z/8cJnoeZZCvBJ4DkpYbFc+JzflsKXhswKUsoQ7sh5l0+OyOumOWMN61pwAtLhFgk1D3l+s6DlH4GOgJ4lfOTDbRBaETHu/2xPzVjzQ1nFkdTIi1Q2aVnuqOv8AKpXCGlYhIMs8vc8Z2PrOAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d8f1c1ce45so80650035ab.2
        for <linux-usb@vger.kernel.org>; Sun, 04 May 2025 22:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746424766; x=1747029566;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KutsmWOwsPqBpoNxW5I/vuWTL3F2OwtZR13w1gq13k0=;
        b=ZpOG/Ot28/sUFvNDs6Yuxr+d4dfQSQPMs+gZrVMPWh5oxaj8bD1oTH2NHEgtlTCMoz
         9L09oiDfg/GGX/2aVpkmoBjQlq8EpH/7PcvEs0GIWpxXn0jXP3Qs0rOwJ6Oz+/iND2Ot
         sMDFmrX//24XvjjCJZPJcW0fWGU8kDiXHukNr6QSY+FsywdS/UNJtOGArIdEeHcKWI1X
         qrP6tGFo/biUVSNGv3FuNMUHyRY/EW0Zk+LWIw47gn9N8keWXphVyp1g3AhHZ/vMX5w+
         jemr4q9MBMWcIskGnELkJhhJOPuwW6WOv6epb+L4GABR7VsNSM0v2sNLyePDVKIp8XRE
         G2sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXgEXYOVa4w9ovlXTaIQ6usgSRihcvZqL2zQTBWcpRyI3/SmvnATF5oDRdOs/EKilslceylaKdfdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YylAzFcD+SaEvnpXVSkI4yekv6ZTd8jgA7Y1lCQsQSxkLJYWCz1
	hOlRII2wDjDPXO+3k07WVADlL5ICy50o4+Fq/56Q4BGevFkfhb6F+kxWj6Zr0E4bvWURFAC4TNy
	Bdg+Xu7ecwyKBGu37RhIQkiG5i4rjaImqFRz2LWMp0U92z/fZz74tDqg=
X-Google-Smtp-Source: AGHT+IFrE2B83fmtCzbD7ysalL9wZfd6+x4E48Syd0LLPZjBKdKKAIcFRhGURbZbRBURkaTeyM9SfI3UeM5UGH/jxsyOBn2GF2bX
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1908:b0:3d8:2187:5cea with SMTP id
 e9e14a558f8ab-3da5b23733dmr58521355ab.1.1746424766508; Sun, 04 May 2025
 22:59:26 -0700 (PDT)
Date: Sun, 04 May 2025 22:59:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681853be.a70a0220.254cdc.0045.GAE@google.com>
Subject: [syzbot] [usb?] WARNING in osif_xfer/usb_submit_urb
From: syzbot <syzbot+4687ab80180e5d724f51@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4f79eaa2ceac kbuild: Properly disable -Wunterminated-strin..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=11436f74580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a9a25b7a36123454
dashboard link: https://syzkaller.appspot.com/bug?extid=4687ab80180e5d724f51
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=103081cc580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17ba139b980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/12c9f96176cf/disk-4f79eaa2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c24afd828d55/vmlinux-4f79eaa2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b2d77950e184/bzImage-4f79eaa2.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4687ab80180e5d724f51@syzkaller.appspotmail.com

------------[ cut here ]------------
usb 1-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c1
WARNING: CPU: 1 PID: 5832 at drivers/usb/core/urb.c:413 usb_submit_urb+0x1112/0x1870 drivers/usb/core/urb.c:411
Modules linked in:
CPU: 1 UID: 0 PID: 5832 Comm: syz-executor397 Not tainted 6.15.0-rc4-syzkaller-00052-g4f79eaa2ceac #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/19/2025
RIP: 0010:usb_submit_urb+0x1112/0x1870 drivers/usb/core/urb.c:411
Code: 0f b6 44 05 00 84 c0 0f 85 38 06 00 00 45 0f b6 04 24 48 c7 c7 20 5f 12 8c 48 8b 74 24 18 4c 89 fa 44 89 f1 e8 7f 6a 6f fa 90 <0f> 0b 90 90 49 bd 00 00 00 00 00 fc ff df e9 2b f4 ff ff 89 e9 80
RSP: 0018:ffffc9000401f6d0 EFLAGS: 00010246
RAX: 76fdec7c67ae9b00 RBX: ffff8880216ebd00 RCX: ffff888023fc9e00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000002
RBP: 1ffff110034f4a08 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffffbfff1bba4b4 R12: ffff88801a7a5040
R13: dffffc0000000000 R14: 0000000080000280 R15: ffff88801a7a5700
FS:  0000555562d49380(0000) GS:ffff8881261cc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fb480077df0 CR3: 000000007c70a000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 usb_start_wait_urb+0x114/0x4c0 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x232/0x3e0 drivers/usb/core/message.c:154
 osif_usb_read drivers/i2c/busses/i2c-robotfuzz-osif.c:41 [inline]
 osif_xfer+0x21a/0x5e0 drivers/i2c/busses/i2c-robotfuzz-osif.c:69
 __i2c_transfer+0x871/0x2170 drivers/i2c/i2c-core-base.c:-1
 i2c_transfer+0x25b/0x3a0 drivers/i2c/i2c-core-base.c:2315
 i2c_transfer_buffer_flags+0x105/0x190 drivers/i2c/i2c-core-base.c:2343
 i2c_master_recv include/linux/i2c.h:79 [inline]
 i2cdev_read+0x10d/0x220 drivers/i2c/i2c-dev.c:155
 vfs_read+0x1fd/0x980 fs/read_write.c:568
 ksys_read+0x145/0x250 fs/read_write.c:713
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f62e575f119
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 31 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd8ac089d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 0000200000000000 RCX: 00007f62e575f119
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 00007f62e57d2610 R08: 00232d6332692f76 R09: 00007ffd8ac08ba8
R10: 000000000000001f R11: 0000000000000246 R12: 0000000000000001
R13: 00007ffd8ac08b98 R14: 0000000000000001 R15: 0000000000000001
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

