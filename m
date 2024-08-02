Return-Path: <linux-usb+bounces-12893-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFA39460B0
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 17:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B77D7B21378
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 15:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F455136341;
	Fri,  2 Aug 2024 15:42:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDD315C132
	for <linux-usb@vger.kernel.org>; Fri,  2 Aug 2024 15:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722613363; cv=none; b=NhCo35v7VrlHJGzBaI3aO6k47H6V88w9lZCM+reSYWpL0vZenHDCcV9FXmH04hRKF6m8znNa+hlPBKBe1m4Sb0t3Z400MdTcD0F/6TsUZntz9/ypExeV/MwF+psbMxpjy5aRXkwsu0wmVxJA0YGLmYpeVCPdtl/angXciwE5UbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722613363; c=relaxed/simple;
	bh=wq9ctuiUCiXHryZBSgTI6gxp2GEyh4EnMGHu40pf4k4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=rr9fVyrmQMqisNL7uzLr8M/ea52qmnRCSyRzYdsbQeFZ3SE4V9EhBgjvMr/x6t6kfQ1f0Wx8fl+15LHQ1Ao4ikmbcLTPjngw2TIFe2N5qqgBWV5uKjwR0A2TM2r6F74O73LwMSzqMGx2ql+h2NUETDNVh7y46/h2VG73viEh2aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-398ae4327f1so42374565ab.1
        for <linux-usb@vger.kernel.org>; Fri, 02 Aug 2024 08:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722613360; x=1723218160;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sVl04E7x0dvLdJdkJLudxByg96SiL7CFJgqGpyvdXSg=;
        b=s/0hTwZjQZWMTgsK89lk/FTIDzQe2sOm8B88PLb3Zp0VM/+NO1GFCow3DFFJ0TUlNu
         yi/+Hz+oC/zbeau94NuWeOX1QZycDc7eVXDMRdkA81dy6OO4ZUf8bDphTsmNJHfrY6nm
         HBhLPdeY+MOErallh3ddhlPPYu/O50S5Wldlij6y6nVh1Vqyx0c/VzyxZT/gBpPL8SaR
         gI3i4JkCOfJBQEIQq2edLtxA0ucNs/8Xg6mdfqBg2l4nGH2A+j2Q0hNjdjr0O8goe9vb
         8XBjisHpuZLVQ22FnDs67XEOcxGUqY6rUbCuDO9WEOZLQz43AfDMK2Q7ALg8hpEOSED/
         bb6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJdv7ChxvJSzWvvl1Hejo/rYAevD847p89CZyjrA4bx8qNpVlav47oTfY7/KjCYunVdOKkmUUJq2Ccbs1gN5zzlTYhuPmup864
X-Gm-Message-State: AOJu0YzGeGs+7ucqbQSGQ7BSoZMHLAgIuJ41ZZj6ZvDGJT4ckoLQNR3S
	C8NwpHJMDWlqka9wFErOy81lWscpEZju4K8iXCVzUAdIpLLrKlaxrsMmZsFjxIrlYwC2MmhmJ5/
	+yljo6VdRPsWg4ECiVbpS8YWfsRG3pp8FPxKZuvkylkwAjUQ67l3OGTM=
X-Google-Smtp-Source: AGHT+IG5Kkfb2mDN8DI1tEctsnkyOW3LQ1A//RvKO0ed21Yb7bWl81wQ9yCazJ4N/DKF+WreeAyXFIaVGMHUTrpwObRTIfNFGA+C
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a23:b0:39b:c00:85aa with SMTP id
 e9e14a558f8ab-39b20054434mr2692095ab.0.1722613360449; Fri, 02 Aug 2024
 08:42:40 -0700 (PDT)
Date: Fri, 02 Aug 2024 08:42:40 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006f6622061eb52dba@google.com>
Subject: [syzbot] [usb?] KMSAN: kernel-usb-infoleak in usbtmc_generic_write
From: syzbot <syzbot+8f282cce71948071c335@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    94ede2a3e913 profiling: remove stale percpu flip buffer va..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12166111980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2a7cf62669c9536b
dashboard link: https://syzkaller.appspot.com/bug?extid=8f282cce71948071c335
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b4adcb60c426/disk-94ede2a3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/50bde94d1be7/vmlinux-94ede2a3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0756c72c7478/bzImage-94ede2a3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8f282cce71948071c335@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: kernel-usb-infoleak in usb_submit_urb+0x597/0x2350 drivers/usb/core/urb.c:430
 usb_submit_urb+0x597/0x2350 drivers/usb/core/urb.c:430
 usbtmc_generic_write+0x7b6/0xe80 drivers/usb/class/usbtmc.c:1213
 usbtmc_write+0xdbd/0x1220 drivers/usb/class/usbtmc.c:1622
 vfs_write+0x493/0x1550 fs/read_write.c:588
 ksys_write+0x20f/0x4c0 fs/read_write.c:643
 __do_sys_write fs/read_write.c:655 [inline]
 __se_sys_write fs/read_write.c:652 [inline]
 __x64_sys_write+0x93/0xe0 fs/read_write.c:652
 x64_sys_call+0x3490/0x3c10 arch/x86/include/generated/asm/syscalls_64.h:2
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:3994 [inline]
 slab_alloc_node mm/slub.c:4037 [inline]
 __kmalloc_cache_noprof+0x4f0/0xb00 mm/slub.c:4184
 kmalloc_noprof include/linux/slab.h:681 [inline]
 usbtmc_create_urb drivers/usb/class/usbtmc.c:757 [inline]
 usbtmc_generic_write+0x430/0xe80 drivers/usb/class/usbtmc.c:1176
 usbtmc_write+0xdbd/0x1220 drivers/usb/class/usbtmc.c:1622
 vfs_write+0x493/0x1550 fs/read_write.c:588
 ksys_write+0x20f/0x4c0 fs/read_write.c:643
 __do_sys_write fs/read_write.c:655 [inline]
 __se_sys_write fs/read_write.c:652 [inline]
 __x64_sys_write+0x93/0xe0 fs/read_write.c:652
 x64_sys_call+0x3490/0x3c10 arch/x86/include/generated/asm/syscalls_64.h:2
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Bytes 1-3 of 4 are uninitialized
Memory access of size 4 starts at ffff88805376e000

CPU: 1 UID: 0 PID: 5623 Comm: syz.0.70 Not tainted 6.11.0-rc1-syzkaller-00043-g94ede2a3e913 #0
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

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

