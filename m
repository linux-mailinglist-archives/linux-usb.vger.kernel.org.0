Return-Path: <linux-usb+bounces-18870-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AA59FDE15
	for <lists+linux-usb@lfdr.de>; Sun, 29 Dec 2024 10:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04F951882711
	for <lists+linux-usb@lfdr.de>; Sun, 29 Dec 2024 09:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C784E78F38;
	Sun, 29 Dec 2024 09:01:23 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD1141C72
	for <linux-usb@vger.kernel.org>; Sun, 29 Dec 2024 09:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735462883; cv=none; b=iwd3BBqFv9CHRHBvgkAs6fIrNccSf9a67hZMdO2o6YSEm+kV0KDWMmfTBKZ7E+l9QoVcGrh5E1CIc9eiTeQhvc9uJZTQGsAaBqfIwV8jC8/HbnyZgHagoS869Q/4YErT9TKTZqU6noZtxqyY5wXRDN2l7yA8UMeK0ONjVhRQRtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735462883; c=relaxed/simple;
	bh=7ANbV8ojWJJRa0n7PXfQrkdNCFVIIq8uSdjJQwpoNPE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=AkpnICSxzvnavq+D9lZC8qsrhLVW+qPTVhmDT2kYjOEAI0Dl8F4JRiLBoVVmNGTg9qQ4DYWg1LuumCsCv02vt0tkTnR0aPOIICEq/DqjDQCVWsR1VZKNeth3rf7/O/leitjQe6VSh8d0/G8J6yxDTlR9oyulmt5VSMedI7L47CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-8498a21afc2so637515439f.1
        for <linux-usb@vger.kernel.org>; Sun, 29 Dec 2024 01:01:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735462881; x=1736067681;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nXc1lFx82qGnJwsxsA/KUZNzRqzwCOmC8BjpY0CbMd8=;
        b=sFVEkyZunvFGWUpk9EDwaFo5WNR3H/lIpMMs58e1x+H6kzSPx8wRS9SknTN2h83cO+
         xAzowTIpeGRSrQ/hjYC2QXGqUqcETmmNBVqxcZykhuyMDxTuRSrnGPPE4xCQ+IEd+F8C
         wLE9Zla4oZfX4lvnCiEpucO39rmx+PaV764j/3a8ml1bJvzroQofuCG443EzQbmGjJgg
         bRWjsKVwqsKMpjnXffsF5GTL8wZyUMvM22E/CNQlMZVrpx4Wn2UrU8uZcFbGHFzjmyVP
         voRQZnP/r9hPO5AP3YdGwzqyW+HNpzT8SgBFWQMNZOyFwCoU/3W/tz0v3zqgaF8+EBZJ
         Ytkg==
X-Forwarded-Encrypted: i=1; AJvYcCU/MVeh0atJkbZ6MPkr+AnhQzCg0lrJzv7lCbCkrFywJX07KRtWCW1MFAMZvTBawV7c2pOeWYKFIds=@vger.kernel.org
X-Gm-Message-State: AOJu0YzviRhqtVsFXi9W/wHoSChy5QxY6SYsUV0EGr6zjEVuRfVghwCN
	YdNza2K128AiowW0t7cPlvTaRiAmtfQxSZzmYCT2Rzm9Ds8QrpsOmyJ7JKKZufWeUgguSYbeAJN
	Wmh4Vldu8wpOC/5Iev7NYR3Qf796XryzrielynjNe+THtgoGEg0Z6234=
X-Google-Smtp-Source: AGHT+IF4Gz7iy6kMbqgR13RxJVpDWricUtI1hB3s9Z2knBRxe/GGRwsqKjSo7gFoWqo22aHsHmMHvh7vK0+tGgzYqKYj4Ezocr9J
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:16cd:b0:3a7:8720:9de8 with SMTP id
 e9e14a558f8ab-3c2d14d182emr243894335ab.5.1735462881085; Sun, 29 Dec 2024
 01:01:21 -0800 (PST)
Date: Sun, 29 Dec 2024 01:01:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67710fe1.050a0220.226966.00be.GAE@google.com>
Subject: [syzbot] [usb-storage?] WARNING in usb_stor_msg_common/usb_submit_urb
From: syzbot <syzbot+73c662df6e55838c6ac6@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com, usb-storage@lists.one-eyed-alien.net
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d7123c77dc60 usb: gadget: f_tcm: Refactor goto check_condi..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=171080b0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c7df994a0b7c30a9
dashboard link: https://syzkaller.appspot.com/bug?extid=73c662df6e55838c6ac6
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1558f4c4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ccb59f24626e/disk-d7123c77.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b51b5c87b9dc/vmlinux-d7123c77.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f66bf96bc8cc/bzImage-d7123c77.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+73c662df6e55838c6ac6@syzkaller.appspotmail.com

------------[ cut here ]------------
URB ffff888112d14800 submitted while active
WARNING: CPU: 1 PID: 3987 at drivers/usb/core/urb.c:379 usb_submit_urb+0x14da/0x1730 drivers/usb/core/urb.c:379
Modules linked in:
CPU: 1 UID: 0 PID: 3987 Comm: usb-storage Not tainted 6.13.0-rc4-syzkaller-00068-gd7123c77dc60 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
RIP: 0010:usb_submit_urb+0x14da/0x1730 drivers/usb/core/urb.c:379
Code: fe eb cb bb fe ff ff ff e9 c1 f3 ff ff e8 8e e1 f1 fc c6 05 c9 fa de 05 01 90 48 c7 c7 e0 c6 a1 87 48 89 de e8 27 dc b5 fc 90 <0f> 0b 90 90 e9 b6 fe ff ff bb f8 ff ff ff e9 91 f3 ff ff 48 89 ef
RSP: 0018:ffffc90001fff758 EFLAGS: 00010282
RAX: 0000000000000000 RBX: ffff888112d14800 RCX: ffffffff811f67f9
RDX: ffff8881115bd7c0 RSI: ffffffff811f6806 RDI: 0000000000000001
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: ffff888112d14800
R13: ffff88812ec3cd50 R14: ffffc90001fff808 R15: ffff88812ec3cdd8
FS:  0000000000000000(0000) GS:ffff8881f5900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555d1dbc3838 CR3: 0000000113b3e000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 usb_stor_msg_common+0x248/0x570 drivers/usb/storage/transport.c:143
 usb_stor_bulk_transfer_buf+0x17c/0x410 drivers/usb/storage/transport.c:395
 ene_send_scsi_cmd+0x131/0x610 drivers/usb/storage/ene_ub6250.c:502
 ene_init drivers/usb/storage/ene_ub6250.c:2197 [inline]
 ene_transport+0x13f6/0x37e0 drivers/usb/storage/ene_ub6250.c:2310
 usb_stor_invoke_transport+0xef/0x1580 drivers/usb/storage/transport.c:611
 usb_stor_control_thread+0x5e9/0xac0 drivers/usb/storage/usb.c:462
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
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

