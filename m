Return-Path: <linux-usb+bounces-6253-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB697851D55
	for <lists+linux-usb@lfdr.de>; Mon, 12 Feb 2024 19:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A74F828368E
	for <lists+linux-usb@lfdr.de>; Mon, 12 Feb 2024 18:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4093641212;
	Mon, 12 Feb 2024 18:51:29 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747623F9EF
	for <linux-usb@vger.kernel.org>; Mon, 12 Feb 2024 18:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707763889; cv=none; b=g9Iwme91Xlr4+spGNMdW6LJopd5+PgqKkadx/gtgCP1XziXuKodmutAVhdbpcBZPZmpQx8jl3fLCK8RfUlualN0cPPUGFTtRudfiHeRGT9VZurtwM1b0wECEYGzLqIn8jrjNcpJ2TQjdOpS1y4sgkdA0G7Exjr/4vP4ZyZWRwnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707763889; c=relaxed/simple;
	bh=ziC0jdjSOn57oxkidJiFB3fh21tLRHD/tRm5IxXvmfc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=GoJ8a7lgkJyD5xrjT+72GxUCz81bSQR7Buyu53uil1YUeIQOPFWzTs9LGkTW1ONwMymeJR0XMaRD20/37BIxmIoduJLJdAY1+q1fgDaVIB0bhinMeSuVMk4nRX36fHQRkF3DkrU4x+pphjFLGhTv5aHwEEtI972icJ6ksR1Uu/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-363abe44869so34338655ab.3
        for <linux-usb@vger.kernel.org>; Mon, 12 Feb 2024 10:51:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707763886; x=1708368686;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ADqcTXDt3h4lpXEcZoVVs37L5+rC4WHYFhye8PBDplg=;
        b=RCN2Lnz/5tX0vdcmlhLkOztO9pFKlC6GyH12W7wCoYnIoiubsZDsUdCtaP2FTuhJx2
         hlutk64N3GtTEZOEYy5kjKY8y+sMylTvWVXaKRLWt+hsGaVpCvujR7A701IB8tb+uFLz
         Qae/oEY7PHTE/mkd8VAaV6+k2S9ujE2IH2u9xbMDOGW1VzzgmhUH/5yxnXzKAjavFNfk
         12OpSUSPwYBqpCuN2O8oc08I7YC3x25xdDYYeynbtx9/E7Ke5jZIKkuK6NosxUwzh86V
         KKdYrGuNUQC4l7/QNcfkh8IeqQXTs3iZb4HpwX9itevCkW+l3aEQicso0gYGlPWbzBBt
         s3TA==
X-Forwarded-Encrypted: i=1; AJvYcCV6hdF91pK8Caq+nWBcLsRajUk/kMf413WweHm4LgzPmbA03uhO3flTYRDoOCHS9f/3AoOZpWOWJBj1Pa89roEabUpk4j5x8j5p
X-Gm-Message-State: AOJu0YwzmW+F7OiY7s6R3w9CfwHbuzMbf7oK4HegTyiYZfV26/cycEcr
	EvU3dYoVHl207HblSXZlkCJG2A/2Mon78t8/jHGu3bpwBEL1ClJBk2MVFpzDno7w/raQYp5/623
	8QIpN8jLhmRcPunLH8+2Lxq7xDJLEBEp9+pZc373S4Lx2nP8puMe6roo=
X-Google-Smtp-Source: AGHT+IFbdKSQxCB0DJY/GiqaqjR8/NSQmFPFQKGctC/4muwMdSaqWUxXKBchKm9dgjbCe04xWlhcRsMAzbbYb5zbnYpfNiiA2OaT
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d02:b0:363:d720:a9d0 with SMTP id
 i2-20020a056e021d0200b00363d720a9d0mr664869ila.3.1707763886601; Mon, 12 Feb
 2024 10:51:26 -0800 (PST)
Date: Mon, 12 Feb 2024 10:51:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d23cfc061133c3ae@google.com>
Subject: [syzbot] [usb?] WARNING in wdm_rxwork/usb_submit_urb (2)
From: syzbot <syzbot+c6a1953c27ace6cc34e5@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    841c35169323 Linux 6.8-rc4
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=108afb04180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d7c92dd8d5c7a1e
dashboard link: https://syzkaller.appspot.com/bug?extid=c6a1953c27ace6cc34e5
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/38e234de95d9/disk-841c3516.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b6bebb81917b/vmlinux-841c3516.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3b5bf5ac63c3/bzImage-841c3516.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c6a1953c27ace6cc34e5@syzkaller.appspotmail.com

------------[ cut here ]------------
URB ffff88802d18b550 submitted while active
WARNING: CPU: 1 PID: 16572 at drivers/usb/core/urb.c:379 usb_submit_urb+0x1039/0x18c0 drivers/usb/core/urb.c:379
Modules linked in:
CPU: 1 PID: 16572 Comm: kworker/1:0 Not tainted 6.8.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/25/2024
Workqueue: events wdm_rxwork
RIP: 0010:usb_submit_urb+0x1039/0x18c0 drivers/usb/core/urb.c:379
Code: 00 eb 66 e8 59 f7 8e fa e9 79 f0 ff ff e8 4f f7 8e fa c6 05 25 9f 6b 08 01 90 48 c7 c7 c0 ae 4a 8c 4c 89 ee e8 f8 01 53 fa 90 <0f> 0b 90 90 e9 40 f0 ff ff e8 29 f7 8e fa eb 12 e8 22 f7 8e fa 41
RSP: 0018:ffffc90004b4fb20 EFLAGS: 00010246
RAX: e7c54bd420f7c300 RBX: 0000000000000cc0 RCX: ffff888039421dc0
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffff88802d18b558 R08: ffffffff81577992 R09: 1ffff92000969eb8
R10: dffffc0000000000 R11: fffff52000969eb9 R12: 1ffff11005523912
R13: ffff88802d18b550 R14: dffffc0000000000 R15: ffff88802a91c828
FS:  0000000000000000(0000) GS:ffff8880b9500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555555d4f938 CR3: 000000000df32000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 wdm_rxwork+0x116/0x1f0 drivers/usb/class/cdc-wdm.c:989
 process_one_work kernel/workqueue.c:2633 [inline]
 process_scheduled_works+0x913/0x1420 kernel/workqueue.c:2706
 worker_thread+0xa5f/0x1000 kernel/workqueue.c:2787
 kthread+0x2ef/0x390 kernel/kthread.c:388
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1b/0x30 arch/x86/entry/entry_64.S:242
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

