Return-Path: <linux-usb+bounces-11664-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC449175A4
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 03:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFF44284413
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 01:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF303134DE;
	Wed, 26 Jun 2024 01:30:24 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33820F4FB
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 01:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719365424; cv=none; b=RsSgacuW+D9RONit9VGTx37HeSj5vcqucm95yy8CRXyVNsw5q1T/kJTWxQ78egT2JxpTvqnthzliEobS2Jeja0U7hpGlcEuoV8YIE9pIj/rVLXR/yhedYnxScjo1xo0nDSem5G3waXzwK028co29otlAxSViTefBR6rv8FhHIfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719365424; c=relaxed/simple;
	bh=p2zkOZD+8+T1dAuryaMFbTjK8h6djut6lMgkrePaOWk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=MpOhbymq40qUxDKzauk1mFY2TH/SvWCSNbDJFPSqrQ7HUBpGVm5dj25C6oZ8VteLefXZpwlMWQuieow2kUv4cOn/O7ZddlkGQItuZJQuFzVo0SXLwOntPhv3u6WoUYthkA+TvNQ+YZ9TG7tUZZa8PJonmHnwOmmIezgsq+BHkRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3762363a522so101254145ab.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 18:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719365422; x=1719970222;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D/LozekO3Rawr7o5vm0SBlhMDQbth1dTopz64bhOVSI=;
        b=d0Giq5CQAjzgPnS8guQR2x0HOetMeFtBxdZKXNE39j6uhM9r0hEa9Npigz6zdzmFwl
         5fA4el7xmPAu6YZskgDlw8SDM19o4h5c6q2hTFPFpTL5J71Ea6kzsD4hHYWwGEk/iNjZ
         c8yYt+AB/kedR6EgjajMefK9CBLMUqIvYuc3vJd7CwtVwrBhKwIFJLhIFJblhITbR1te
         Gbe8PLcmeh9Gi2rBsBVB0bgHLlEbOVd/vFjraAd7kn8HpVUnOKsTb2cbZRVm/p0VBupt
         VEt1mENsYUrXHSSWOjcrvSBdPy+XycPJjpv4EU0fHxiVelqy2knsUOB/rnEL9UIuNnk5
         SXjg==
X-Forwarded-Encrypted: i=1; AJvYcCVXMRemq4xvDnvNvLifrPnkof8cgJfr//o240qPxEZn1I/f/oZTsATcw5M+k2qRvYBSZ3zVGsh8fEiMvpgIiMyASyD+IxGrPfmh
X-Gm-Message-State: AOJu0YxnFgPcYGUwersgqWXm4lc2MQu5t8TenH0fPjiAls7BWV/NkovD
	3qIA/1lJyQagfu7mSPzNbO7PvVBoC3DmRHKJ8P5zYwlOKl0yy2jhVidHDZCJVMelLkaKyKVhIvI
	a4D1LphqMUuElALgYxO+bBjuhslg9r+HW52PbmU3vXR2/K1FOYGO8nuQ=
X-Google-Smtp-Source: AGHT+IGI0fxQLvY8mOI7xe2da3Qu72XrkZlHdyAcx9r1eo2GONZMZz+PZXMIgaS/ogLXtWRbNiZ05Z6ireQSysqwJwVWsSTUJRnL
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:184f:b0:376:42a0:b2e7 with SMTP id
 e9e14a558f8ab-37642a0b586mr7471625ab.4.1719365422380; Tue, 25 Jun 2024
 18:30:22 -0700 (PDT)
Date: Tue, 25 Jun 2024 18:30:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003d868e061bc0f554@google.com>
Subject: [syzbot] [usb?] [bluetooth?] WARNING in btusb_submit_intr_urb/usb_submit_urb
From: syzbot <syzbot+8693a0bb9c10b554272a@syzkaller.appspotmail.com>
To: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, luiz.dentz@gmail.com, marcel@holtmann.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    66cc544fd75c Merge tag 'dmaengine-fix-6.10' of git://git.k..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=14280161980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3f7b9f99610e0e87
dashboard link: https://syzkaller.appspot.com/bug?extid=8693a0bb9c10b554272a
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16f59c82980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12b955b6980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b4d37fd1f3c8/disk-66cc544f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/04c8b576cea2/vmlinux-66cc544f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/05e217dc3c31/bzImage-66cc544f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8693a0bb9c10b554272a@syzkaller.appspotmail.com

------------[ cut here ]------------
usb 1-1: BOGUS urb xfer, pipe 1 != type 3
WARNING: CPU: 0 PID: 4491 at drivers/usb/core/urb.c:504 usb_submit_urb+0xc4e/0x18c0 drivers/usb/core/urb.c:503
Modules linked in:
CPU: 0 PID: 4491 Comm: kworker/u9:1 Not tainted 6.10.0-rc4-syzkaller-00164-g66cc544fd75c #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/07/2024
Workqueue: hci0 hci_power_on
RIP: 0010:usb_submit_urb+0xc4e/0x18c0 drivers/usb/core/urb.c:503
Code: f8 48 c1 e8 03 0f b6 04 18 84 c0 0f 85 b1 08 00 00 45 8b 07 48 c7 c7 40 90 6d 8c 48 8b 34 24 4c 89 e2 89 e9 e8 23 9a 3c fa 90 <0f> 0b 90 90 48 8b 5c 24 30 41 89 dc 4c 89 e7 48 c7 c6 b0 4b f2 8e
RSP: 0018:ffffc9000d817798 EFLAGS: 00010246
RAX: 6d750bdfc6b7f400 RBX: dffffc0000000000 RCX: ffff888030053c00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: 0000000000000001 R08: ffffffff81585822 R09: fffffbfff1c39994
R10: dffffc0000000000 R11: fffffbfff1c39994 R12: ffff88801c2e7560
R13: ffff88801a2af400 R14: 0000000000000001 R15: ffffffff8c6d8e28
FS:  0000000000000000(0000) GS:ffff8880b9400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000559f0e1c6bd8 CR3: 000000002e10e000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 btusb_submit_intr_urb+0x3dd/0x7b0 drivers/bluetooth/btusb.c:1409
 btusb_open+0x1a1/0x770 drivers/bluetooth/btusb.c:1865
 hci_dev_open_sync+0x2cc/0x2b40 net/bluetooth/hci_sync.c:4889
 hci_dev_do_open net/bluetooth/hci_core.c:485 [inline]
 hci_power_on+0x1c7/0x6b0 net/bluetooth/hci_core.c:1012
 process_one_work kernel/workqueue.c:3231 [inline]
 process_scheduled_works+0xa2c/0x1830 kernel/workqueue.c:3312
 worker_thread+0x86d/0xd70 kernel/workqueue.c:3393
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
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

