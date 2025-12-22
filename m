Return-Path: <linux-usb+bounces-31665-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1921CD4B76
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 06:27:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B887030021DA
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 05:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4623C30100D;
	Mon, 22 Dec 2025 05:27:34 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f78.google.com (mail-oa1-f78.google.com [209.85.160.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FDD25332E
	for <linux-usb@vger.kernel.org>; Mon, 22 Dec 2025 05:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766381254; cv=none; b=ECZaf+wuUnfYtCle6zfY/DvgQ2ULZ/YphEcNKirRMqlCmow6txyvAEEx5pBfKgOoIVf/FYbuxm9d5ziSDH+8E5GC7DZZwKDg+kbT93ei0KPa4ME4QEjGFLn3JlH69pQ/ghJwOfe4Qh66ZvSBCcmqsedmB4wNldpOhn2YmD/6xNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766381254; c=relaxed/simple;
	bh=aPIbrt7GGLrfv5AcQ5Qjn7jAWZbt/XLoIRVMYOV3h+w=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Skubc+lrK2ltNaLCwF66yYZvH+WHQnaLTZ3ErlXRhaGmWQX1kNJ1qKjLjqZBkrLv6XLPgPw2Z5y8uM7/8c+05Zt8s+V3xZKKbXveckSEb6uzXSEpdD9KxdFu1wCUXkmrLHx+JujeYkBuH5lcQD/k0TWp63cywWRraNp5zendzS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f78.google.com with SMTP id 586e51a60fabf-3ec31d72794so4231953fac.0
        for <linux-usb@vger.kernel.org>; Sun, 21 Dec 2025 21:27:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766381251; x=1766986051;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oGHuYto+8CuPalLvrvDjBVuP9UGH/7aaB3v6lesisXk=;
        b=bCQpqAmRuvksgwoXa3Z7COkPbB/MNXDUrQhSZtnWqzg46Y0r8uZHUYNbdIl9HB2wKS
         DSeB4DuU+9iUKzu9SmpcEFdWoQIGP8BiXYWuDbt7ARzLtSHT5+yFjJ7fLTo3koVVtQ5X
         5uBYF8DDL4AAQKik2DcJHE72F9ppSrscJj0qPKp85mCvYBWxujLBPZ5JCW4cgOo3/r2w
         4rj9I2J6N0nTu1tKBdLxoKY1eDP/3I3OGBq3Q8v97v9rl1D1QaSQicBzNK6qyAr2n4WF
         q8a542CqcmGP6/SO4qM/TshzUZcmKWxyqGSrx2aXVNPdVouV+EV2wZ7L3vnPztpcebxB
         eE1A==
X-Forwarded-Encrypted: i=1; AJvYcCXCFrrohdXBylePHqZBlfD5BrU0lQIkVR3x5zwGtXPQ+AGKMTWwduJ6KN7ROvSkQ/+V+U6n2IcAp7U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsy8VdBc4J6MmvIjh7L63OUa/L8C3eoQWOWvNXrgQ0iXJZ0zOS
	wlqaf7hkAT5Wb8gD7CwA+Ig64y9qAwcLy04UIiHiT0cauHhDqD4FSJ/4rQbSCW/k47nWSpRyILy
	rV9wyibVsZx8+kX+oiuBgxGSRkD9FB55UNSTJ9pN8BhxDHT1RqeELa4bWEPs=
X-Google-Smtp-Source: AGHT+IGk0ek5uffGPoavwZo0zVQo2uF0GBp2uIUEqjqWBrJT5XAVVE+CBzdTYEvsvnzrqK4mQXFzsog0NKX0LoVQF51JGXQvFiwP
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e059:0:b0:65b:5013:818a with SMTP id
 006d021491bc7-65cfe6a996cmr4502298eaf.18.1766381251184; Sun, 21 Dec 2025
 21:27:31 -0800 (PST)
Date: Sun, 21 Dec 2025 21:27:31 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6948d6c3.a70a0220.25eec0.0084.GAE@google.com>
Subject: [syzbot] [usb?] memory leak in es58x_open
From: syzbot <syzbot+e8cb6691a7cf68256cb8@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ea1013c15392 Merge tag 'bpf-fixes' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1607bdc2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d60836e327fd6756
dashboard link: https://syzkaller.appspot.com/bug?extid=e8cb6691a7cf68256cb8
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=131add92580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5ee91238d53c/disk-ea1013c1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b8eb70b8203f/vmlinux-ea1013c1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3aed81c1b1c5/bzImage-ea1013c1.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e8cb6691a7cf68256cb8@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff88812623e000 (size 512):
  comm "dhcpcd", pid 5478, jiffies 4294946142
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 0):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4958 [inline]
    slab_alloc_node mm/slub.c:5263 [inline]
    __do_kmalloc_node mm/slub.c:5656 [inline]
    __kmalloc_noprof+0x3e0/0x660 mm/slub.c:5669
    kmalloc_noprof include/linux/slab.h:961 [inline]
    hcd_buffer_alloc+0x151/0x190 drivers/usb/core/buffer.c:134
    usb_alloc_coherent+0x44/0x70 drivers/usb/core/usb.c:1010
    es58x_alloc_urb+0x4c/0xc0 drivers/net/can/usb/etas_es58x/es58x_core.c:1553
    es58x_alloc_rx_urbs drivers/net/can/usb/etas_es58x/es58x_core.c:1711 [inline]
    es58x_open+0x1b3/0x470 drivers/net/can/usb/etas_es58x/es58x_core.c:1785
    __dev_open+0x1be/0x3c0 net/core/dev.c:1683
    __dev_change_flags+0x30c/0x380 net/core/dev.c:9734
    netif_change_flags+0x35/0x90 net/core/dev.c:9797
    dev_change_flags+0x64/0xf0 net/core/dev_api.c:68
    devinet_ioctl+0x5bf/0xd30 net/ipv4/devinet.c:1199
    inet_ioctl+0x27c/0x2b0 net/ipv4/af_inet.c:1009
    sock_do_ioctl+0x84/0x1a0 net/socket.c:1254
    sock_ioctl+0x149/0x480 net/socket.c:1375
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888126112200 (size 512):
  comm "dhcpcd", pid 5478, jiffies 4294946373
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 0):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4958 [inline]
    slab_alloc_node mm/slub.c:5263 [inline]
    __do_kmalloc_node mm/slub.c:5656 [inline]
    __kmalloc_noprof+0x3e0/0x660 mm/slub.c:5669
    kmalloc_noprof include/linux/slab.h:961 [inline]
    hcd_buffer_alloc+0x151/0x190 drivers/usb/core/buffer.c:134
    usb_alloc_coherent+0x44/0x70 drivers/usb/core/usb.c:1010
    es58x_alloc_urb+0x4c/0xc0 drivers/net/can/usb/etas_es58x/es58x_core.c:1553
    es58x_alloc_rx_urbs drivers/net/can/usb/etas_es58x/es58x_core.c:1711 [inline]
    es58x_open+0x1b3/0x470 drivers/net/can/usb/etas_es58x/es58x_core.c:1785
    __dev_open+0x1be/0x3c0 net/core/dev.c:1683
    __dev_change_flags+0x30c/0x380 net/core/dev.c:9734
    netif_change_flags+0x35/0x90 net/core/dev.c:9797
    dev_change_flags+0x64/0xf0 net/core/dev_api.c:68
    devinet_ioctl+0x5bf/0xd30 net/ipv4/devinet.c:1199
    inet_ioctl+0x27c/0x2b0 net/ipv4/af_inet.c:1009
    sock_do_ioctl+0x84/0x1a0 net/socket.c:1254
    sock_ioctl+0x149/0x480 net/socket.c:1375
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888126188800 (size 512):
  comm "dhcpcd", pid 5478, jiffies 4294946404
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 0):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4958 [inline]
    slab_alloc_node mm/slub.c:5263 [inline]
    __do_kmalloc_node mm/slub.c:5656 [inline]
    __kmalloc_noprof+0x3e0/0x660 mm/slub.c:5669
    kmalloc_noprof include/linux/slab.h:961 [inline]
    hcd_buffer_alloc+0x151/0x190 drivers/usb/core/buffer.c:134
    usb_alloc_coherent+0x44/0x70 drivers/usb/core/usb.c:1010
    es58x_alloc_urb+0x4c/0xc0 drivers/net/can/usb/etas_es58x/es58x_core.c:1553
    es58x_alloc_rx_urbs drivers/net/can/usb/etas_es58x/es58x_core.c:1711 [inline]
    es58x_open+0x1b3/0x470 drivers/net/can/usb/etas_es58x/es58x_core.c:1785
    __dev_open+0x1be/0x3c0 net/core/dev.c:1683
    __dev_change_flags+0x30c/0x380 net/core/dev.c:9734
    netif_change_flags+0x35/0x90 net/core/dev.c:9797
    dev_change_flags+0x64/0xf0 net/core/dev_api.c:68
    devinet_ioctl+0x5bf/0xd30 net/ipv4/devinet.c:1199
    inet_ioctl+0x27c/0x2b0 net/ipv4/af_inet.c:1009
    sock_do_ioctl+0x84/0x1a0 net/socket.c:1254
    sock_ioctl+0x149/0x480 net/socket.c:1375
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

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

