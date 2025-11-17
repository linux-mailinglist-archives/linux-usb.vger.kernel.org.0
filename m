Return-Path: <linux-usb+bounces-30570-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DF230C64A2B
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 15:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E9367356BC3
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 14:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487D3333432;
	Mon, 17 Nov 2025 14:24:33 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4334E1EEA55
	for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 14:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763389473; cv=none; b=Z/IyX95pZFAs6TPh6F18zDDsG9y//EBQJSDQFAAvwU8uQWDItkNsGqpJi0ux5B7v2iDS0MxTeb4gEb/GPtn68RRQsEK4TG8kHIHgk4qOjGK7kYcdZj/6tj4jTFOO+W2cdg8NR4ti4Aif1aVGvjb79k48R9DrJPJ9Gqe61zLEIvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763389473; c=relaxed/simple;
	bh=+WnHARyZtydI4Bj4wx3QFcE2kybwmprPbxnEnrPT52Q=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Gm42IUJ9zBtIAh0D8dHQJoOPKzDexrT8OF+Ze442j6t8fZWI2JZCHTcQ2Ji4SIi8HuExVZQi7zygqKw3mTJgZP8eN68blalfVDmanfQ4Y9HBcwMbxYt9qrFOhYw0ANcJY557+0OW6Zfg1t8Q9aBMmsn2sLj4XvaMD+dZAEjuGjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-432fb58f876so124382715ab.1
        for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 06:24:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763389470; x=1763994270;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TroKSSOOY32YSuyTmBNMMILgpi/Ky4EqsVpoXNyy8L4=;
        b=UKtG6j3wK8Kz3NtqxmoFIrq/7V7NM39mI3nlqdXz2REHG7jGybSiQS0HXDcD2Xc70A
         4KhUhEIoxMpxmo3pgRCbxSM0pwnaztBsJNl0D2u3h1OzuGUZxFha6nNvwbWRiKAhmJTT
         YVh2dC5yw4/2zs91rmmOkWeOiY4YEwmk63AM0C3bH/O2Z0f4gMTb7lh3Ax+TqNkPCoBf
         r8Af6ioVoZ1CpAnPhMMOACQZNWHZ6ORliC6jjgo0atQdKdqJIYp9BxQYSVItZw2vaF6Q
         ySoyKXWudF7/CHkzdwse87bLt7xPMgbfRwEkp1N8njSGuxC+PnL7z6/EU4C4iQr7Pr+4
         kN+g==
X-Forwarded-Encrypted: i=1; AJvYcCVvYui6oSg+v9eXf6m0Sa11bpkQOsIGkcXhIfDbIXEdnkkNV/rr+5PsvBF7+O2dg7peLVIZZ2srVUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUEaYhHEOpm+PZvH4wFAmXkierofmmZXxV91d56N/N5nrQrFbE
	/l/P8AKRIJvzmEN4eYhezExAAdYXlqGxiaeswgRn8MBb8PH2BFs+pOqbqTDU8bHuD7Q9C0ufRWE
	riAZeWqW75NpkS6u2nN5CM2KYrqYCw9YAOzRLkHaSvlJjh7YB7ddy/yvY5Zg=
X-Google-Smtp-Source: AGHT+IEQkT1KcZ/RnyNM7F0CuS3t9HPv2teDm+oZFDsOR2tvuvSHefwFo7D0TP62D+CKHT1/OwGORuLrSVYAuTuaxqpNR+yoBtT8
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3389:b0:433:74ba:8bf5 with SMTP id
 e9e14a558f8ab-4348c9496e4mr153121245ab.23.1763389470497; Mon, 17 Nov 2025
 06:24:30 -0800 (PST)
Date: Mon, 17 Nov 2025 06:24:30 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <691b301e.a70a0220.f6df1.0011.GAE@google.com>
Subject: [syzbot] [bluetooth?] [usb?] memory leak in __hci_cmd_sync_sk
From: syzbot <syzbot+f098d64cc684b8dbaf65@syzkaller.appspotmail.com>
To: johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, luiz.dentz@gmail.com, 
	marcel@holtmann.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e927c520e1ba Merge tag 'loongarch-fixes-6.18-1' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10158d32580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb128cd5cb439809
dashboard link: https://syzkaller.appspot.com/bug?extid=f098d64cc684b8dbaf65
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1782c914580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10a5f0b4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b755c257d71b/disk-e927c520.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b906cb4856d7/vmlinux-e927c520.xz
kernel image: https://storage.googleapis.com/syzbot-assets/bb3525aba146/bzImage-e927c520.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f098d64cc684b8dbaf65@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff888112c22900 (size 240):
  comm "kworker/u9:1", pid 5133, jiffies 4294947154
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 6c5ee80a):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4983 [inline]
    slab_alloc_node mm/slub.c:5288 [inline]
    kmem_cache_alloc_node_noprof+0x36f/0x5e0 mm/slub.c:5340
    __alloc_skb+0x203/0x240 net/core/skbuff.c:660
    alloc_skb include/linux/skbuff.h:1383 [inline]
    bt_skb_alloc include/net/bluetooth/bluetooth.h:510 [inline]
    hci_cmd_sync_alloc+0x30/0x140 net/bluetooth/hci_sync.c:58
    hci_cmd_sync_add net/bluetooth/hci_sync.c:99 [inline]
    __hci_cmd_sync_sk+0x84/0x290 net/bluetooth/hci_sync.c:168
    __hci_cmd_sync_ev+0x3e/0x50 net/bluetooth/hci_sync.c:250
    send_hci_cmd_sync+0x5e/0xf0 net/bluetooth/mgmt.c:2615
    hci_cmd_sync_work+0xd5/0x160 net/bluetooth/hci_sync.c:332
    process_one_work+0x26b/0x620 kernel/workqueue.c:3263
    process_scheduled_works kernel/workqueue.c:3346 [inline]
    worker_thread+0x2c4/0x4f0 kernel/workqueue.c:3427
    kthread+0x15b/0x310 kernel/kthread.c:463
    ret_from_fork+0x210/0x240 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff88810b0ee3c0 (size 704):
  comm "kworker/u9:1", pid 5133, jiffies 4294947154
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 4e765d9f):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4983 [inline]
    slab_alloc_node mm/slub.c:5288 [inline]
    kmem_cache_alloc_node_noprof+0x36f/0x5e0 mm/slub.c:5340
    kmalloc_reserve+0xe6/0x180 net/core/skbuff.c:579
    __alloc_skb+0xd4/0x240 net/core/skbuff.c:670
    alloc_skb include/linux/skbuff.h:1383 [inline]
    bt_skb_alloc include/net/bluetooth/bluetooth.h:510 [inline]
    hci_cmd_sync_alloc+0x30/0x140 net/bluetooth/hci_sync.c:58
    hci_cmd_sync_add net/bluetooth/hci_sync.c:99 [inline]
    __hci_cmd_sync_sk+0x84/0x290 net/bluetooth/hci_sync.c:168
    __hci_cmd_sync_ev+0x3e/0x50 net/bluetooth/hci_sync.c:250
    send_hci_cmd_sync+0x5e/0xf0 net/bluetooth/mgmt.c:2615
    hci_cmd_sync_work+0xd5/0x160 net/bluetooth/hci_sync.c:332
    process_one_work+0x26b/0x620 kernel/workqueue.c:3263
    process_scheduled_works kernel/workqueue.c:3346 [inline]
    worker_thread+0x2c4/0x4f0 kernel/workqueue.c:3427
    kthread+0x15b/0x310 kernel/kthread.c:463
    ret_from_fork+0x210/0x240 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff888112c22b00 (size 240):
  comm "kworker/u9:1", pid 5133, jiffies 4294947360
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc a204b710):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4983 [inline]
    slab_alloc_node mm/slub.c:5288 [inline]
    kmem_cache_alloc_node_noprof+0x36f/0x5e0 mm/slub.c:5340
    __alloc_skb+0x203/0x240 net/core/skbuff.c:660
    alloc_skb include/linux/skbuff.h:1383 [inline]
    bt_skb_alloc include/net/bluetooth/bluetooth.h:510 [inline]
    hci_cmd_sync_alloc+0x30/0x140 net/bluetooth/hci_sync.c:58
    hci_cmd_sync_add net/bluetooth/hci_sync.c:99 [inline]
    __hci_cmd_sync_sk+0x84/0x290 net/bluetooth/hci_sync.c:168
    __hci_cmd_sync_ev+0x3e/0x50 net/bluetooth/hci_sync.c:250
    send_hci_cmd_sync+0x5e/0xf0 net/bluetooth/mgmt.c:2615
    hci_cmd_sync_work+0xd5/0x160 net/bluetooth/hci_sync.c:332
    process_one_work+0x26b/0x620 kernel/workqueue.c:3263
    process_scheduled_works kernel/workqueue.c:3346 [inline]
    worker_thread+0x2c4/0x4f0 kernel/workqueue.c:3427
    kthread+0x15b/0x310 kernel/kthread.c:463
    ret_from_fork+0x210/0x240 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff88810b0edb80 (size 704):
  comm "kworker/u9:1", pid 5133, jiffies 4294947360
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 4e765d9f):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4983 [inline]
    slab_alloc_node mm/slub.c:5288 [inline]
    kmem_cache_alloc_node_noprof+0x36f/0x5e0 mm/slub.c:5340
    kmalloc_reserve+0xe6/0x180 net/core/skbuff.c:579
    __alloc_skb+0xd4/0x240 net/core/skbuff.c:670
    alloc_skb include/linux/skbuff.h:1383 [inline]
    bt_skb_alloc include/net/bluetooth/bluetooth.h:510 [inline]
    hci_cmd_sync_alloc+0x30/0x140 net/bluetooth/hci_sync.c:58
    hci_cmd_sync_add net/bluetooth/hci_sync.c:99 [inline]
    __hci_cmd_sync_sk+0x84/0x290 net/bluetooth/hci_sync.c:168
    __hci_cmd_sync_ev+0x3e/0x50 net/bluetooth/hci_sync.c:250
    send_hci_cmd_sync+0x5e/0xf0 net/bluetooth/mgmt.c:2615
    hci_cmd_sync_work+0xd5/0x160 net/bluetooth/hci_sync.c:332
    process_one_work+0x26b/0x620 kernel/workqueue.c:3263
    process_scheduled_works kernel/workqueue.c:3346 [inline]
    worker_thread+0x2c4/0x4f0 kernel/workqueue.c:3427
    kthread+0x15b/0x310 kernel/kthread.c:463
    ret_from_fork+0x210/0x240 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


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

