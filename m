Return-Path: <linux-usb+bounces-12367-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D6093A85D
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2024 22:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3951283BA8
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2024 20:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D20F14389D;
	Tue, 23 Jul 2024 20:55:24 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CDD143885
	for <linux-usb@vger.kernel.org>; Tue, 23 Jul 2024 20:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721768123; cv=none; b=Rdz3mUrgskP1uMhFsPkPJSFHYafjFFjbuiZ18WXn8FqIt44vBtOQcuLB71Me39aVAj6AQAhrzISSC0bvAYHem7adj+AE3iUCAHeCag4ipd9txQGvvzJVM+f0lNWczUDuoN87CCAV9XcLXtTZM2yqYCuK6NvIujY33nV6uqnZm4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721768123; c=relaxed/simple;
	bh=HsvLOBK2mmBYGRBmpFlLUyt7LeOW6RHsU4k1nmmlNts=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=sBjJ38zHBHmzYyDYvmQrYbBGLXFR+msIXThjIcLyyX8BneCqcMoQl/638f9Qp/3Lhz6dJD5XAwQrYwo6iQfc8/2+5WxxuBoAgEFoPBOVkLLsV7ceUSAAunEfI4/bKl+18+a6nyJWHmmIBaVH+H0L2uCleuCWim11mGAhBpmxJ2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-807b123d985so1124937239f.0
        for <linux-usb@vger.kernel.org>; Tue, 23 Jul 2024 13:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721768121; x=1722372921;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W7lAaSmTNN0zGRBsnkxpsKhL9bI5flt6hDAwqoPeP9k=;
        b=i+T8BaP9iZkjayRmS4AgkJLyAwe039ccIALgpmSKMukYizKqzG7ZlnfFn3Y8WgQE69
         /HrFaKBy5GmUPED+JPvpzE6sNEZe6bjLOH0YL5dBemmxpUcen/z6Edobu60Cm+hT87gT
         hDuqdR03GLH5bgcW2tcDJVQJ4vnkeVJa7Fq3VUFskaZRqu9eM+vOYnxzbgKmAY43Fz/+
         OU74DkANQlaaFGE5kc/vgdQ5v6spAqHP81D2xJhmF7OOyeJEfz8JvRoq5RmfoZmvJl+n
         fGxn+mLbJ7MpHxhg9KBW6toMWWhOwEzh8WAlGr2Isv8+TvImllRDYQF33FZSOV7zxnV+
         sBTg==
X-Forwarded-Encrypted: i=1; AJvYcCW51NCXNnpxmMoYApI3nIWEmrzocOu27V9BgHbm4EYUAAxr2gSg8phQ1sxXvFxe9V5LvyJpY8OkWLajywhCe5bFB7vfyCAYNRnw
X-Gm-Message-State: AOJu0YyI0XO+YQEUV/TKf7rIQIP1dMo2YKI7bGBHwO31Uz5VZtkQBT6E
	RvriAmUS+qdykuGJb9B9JyP4x3l/vGV94vwvSaf6jbCEqJlyGIq/yJc7tr05jhcvjBcDKliAK52
	wgRZVoBQIJbJkBR0WzcNvmIti/7cGyiVAZ7iyBYkCDeKQ1xZ46bHuTtQ=
X-Google-Smtp-Source: AGHT+IFuOkIyph15440mIkcaG0bPanLLP25Z8ciLSRv8Wx8X9eoXXhFesMOet9ez3rMCy9HG3yYEEvQzZp87wmHYmyJmg/w4AQma
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:8507:b0:4b7:c9b5:6765 with SMTP id
 8926c6da1cb9f-4c28a4de736mr64162173.5.1721768121544; Tue, 23 Jul 2024
 13:55:21 -0700 (PDT)
Date: Tue, 23 Jul 2024 13:55:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000045457e061df061c3@google.com>
Subject: [syzbot] [usb?] KMSAN: kernel-infoleak in raw_ioctl (2)
From: syzbot <syzbot+17ca2339e34a1d863aad@syzkaller.appspotmail.com>
To: andreyknvl@gmail.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2c9b3512402e Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1197b6b5980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6bfb33a8ad10458f
dashboard link: https://syzkaller.appspot.com/bug?extid=17ca2339e34a1d863aad
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1626b995980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1572eb21980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f8543636ba6c/disk-2c9b3512.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/403c612b7ac5/vmlinux-2c9b3512.xz
kernel image: https://storage.googleapis.com/syzbot-assets/88dc686d170a/bzImage-2c9b3512.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+17ca2339e34a1d863aad@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: kernel-infoleak in instrument_copy_to_user include/linux/instrumented.h:114 [inline]
BUG: KMSAN: kernel-infoleak in _copy_to_user+0xbc/0x110 lib/usercopy.c:45
 instrument_copy_to_user include/linux/instrumented.h:114 [inline]
 _copy_to_user+0xbc/0x110 lib/usercopy.c:45
 copy_to_user include/linux/uaccess.h:191 [inline]
 raw_ioctl_ep0_read drivers/usb/gadget/legacy/raw_gadget.c:786 [inline]
 raw_ioctl+0x3d2e/0x5440 drivers/usb/gadget/legacy/raw_gadget.c:1315
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0x261/0x450 fs/ioctl.c:893
 __x64_sys_ioctl+0x96/0xe0 fs/ioctl.c:893
 x64_sys_call+0x1a06/0x3c10 arch/x86/include/generated/asm/syscalls_64.h:17
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:3985 [inline]
 slab_alloc_node mm/slub.c:4028 [inline]
 __do_kmalloc_node mm/slub.c:4148 [inline]
 __kmalloc_noprof+0x661/0xf30 mm/slub.c:4161
 kmalloc_noprof include/linux/slab.h:685 [inline]
 raw_alloc_io_data drivers/usb/gadget/legacy/raw_gadget.c:675 [inline]
 raw_ioctl_ep0_read drivers/usb/gadget/legacy/raw_gadget.c:778 [inline]
 raw_ioctl+0x3bcb/0x5440 drivers/usb/gadget/legacy/raw_gadget.c:1315
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0x261/0x450 fs/ioctl.c:893
 __x64_sys_ioctl+0x96/0xe0 fs/ioctl.c:893
 x64_sys_call+0x1a06/0x3c10 arch/x86/include/generated/asm/syscalls_64.h:17
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Bytes 0-4095 of 4096 are uninitialized
Memory access of size 4096 starts at ffff888116edb000
Data copied to user address 00007ffefdca74d8

CPU: 0 PID: 5057 Comm: syz-executor289 Not tainted 6.10.0-syzkaller-11185-g2c9b3512402e #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/2024
=====================================================


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

