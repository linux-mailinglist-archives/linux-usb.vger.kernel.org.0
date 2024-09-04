Return-Path: <linux-usb+bounces-14637-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A8B96BB67
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 14:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C22B1284BF5
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 12:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176331D588F;
	Wed,  4 Sep 2024 12:00:34 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548D21D094E
	for <linux-usb@vger.kernel.org>; Wed,  4 Sep 2024 12:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725451233; cv=none; b=J5tVrKNc/PilpYjqb9evzjOMemVH15Eq33iK4s+iNH7xPpBgW+FK/E8aUmZLApAVvZlk8aFQf8K5Vs7XLxqL6uqmnsBWwkNhiyqNSQ7sFymKpp2P5rUojFjn19gD8S4+YsVpqt0M5cw7GTy/ohjjHH4RSt0n+MVI5M3vgoNzWUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725451233; c=relaxed/simple;
	bh=LotsMZQLGbpgWtMdeUoqb0JoyeRU3z5VSU/DLHyC0zI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=izVe2B9+rozgJzkWh3Il31zDpKpybQLwpa/ke1JQCsZKlLWuBTthktSw4WjgK3DlKhpZyv2dKXtN9nyQBDT4pYnLBmrM/tree/QN6Fhc4ac1VVliHOcHJNtGLAmSVhP8lJvJQ1X5ZnHCdIdhlqjIHw2eBiq4G8/EwsGoTAejDaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-39d5537a659so70385155ab.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Sep 2024 05:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725451230; x=1726056030;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IMKGNV1Sd2HPCALfxFpty/63gpdBjLmsdNKo0ZVwKxg=;
        b=N7VKCp+1GSl/DdT4RN4N+a9LODykBpW/NARG5WFq4Bi7ITB8aL1IbHt2FiacoaWCCY
         IfdzB9+bFGITN7k1xaJVXId+86YfrCGcLtp5zmcK7ux8oLJZbZYPI7mE34K/FC6GSDI2
         QmhZD9cHepgzT6EluX+9PvLfvJCZgWUK7o8TW5SBSCEhw0/UPoxMD0qFOeTNwovdPF45
         MMCLodSeHBQcXSem078WsEbOR5CdGdgQG7/XfX5C0SuMlWKfpU9gFLPhqx512VFnKDCF
         zSB8AIpsb/fsQYzMEWJXmGupaEApjoh/MIVyESFMZV9ah9HWjuA2iCeO0KLZnqPRap6P
         Q05g==
X-Forwarded-Encrypted: i=1; AJvYcCWi3e+38Kjmy38MGL5fiuorz9FOgYFLK1mifxfCbsY2ScL88iKPTeqqRzOgPRSfvvao/PERtiLFN1s=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsk1AYLbR8PJJql6XKTqKwks0YXL0Yu89XDHTscy3NFqkSFIp0
	N7S3s/eYmjUvib+gK7wOXVw5IpZNbw4pGMIDtu1SYuGNanbz5PThfFk1dmDcbB8Xg0QA+Kj7jOx
	B+mAxc8Iz2nf6WdmfZMJuNxxaU0qjWW6kgFPNo7C1L+t3j7V88DentO0=
X-Google-Smtp-Source: AGHT+IF2e9Ikq8FWA1oMH4xBEJt3o/3R8XylN+cezKrpHRcejLcOKo7hZRPr2KlojXtIfD/E4gkC/JnyaZDsZVif9c1A1tqj7I1P
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b49:b0:39f:54d6:5597 with SMTP id
 e9e14a558f8ab-39f54d657ebmr5705065ab.3.1725451229930; Wed, 04 Sep 2024
 05:00:29 -0700 (PDT)
Date: Wed, 04 Sep 2024 05:00:29 -0700
In-Reply-To: <000000000000407108061e0ed264@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a338d6062149eb22@google.com>
Subject: Re: [syzbot] [usb?] KMSAN: kernel-usb-infoleak in usbtmc_write
From: syzbot <syzbot+9d34f80f841e948c3fdb@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    88fac17500f4 Merge tag 'fuse-fixes-6.11-rc7' of git://git...
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=12281339980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=35c699864e165c51
dashboard link: https://syzkaller.appspot.com/bug?extid=9d34f80f841e948c3fdb
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1702531f980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=150dd8af980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6e5a9ba13ba0/disk-88fac175.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/229238ec073e/vmlinux-88fac175.xz
kernel image: https://storage.googleapis.com/syzbot-assets/64327bdcda24/bzImage-88fac175.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9d34f80f841e948c3fdb@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: kernel-usb-infoleak in usb_submit_urb+0x597/0x2350 drivers/usb/core/urb.c:430
 usb_submit_urb+0x597/0x2350 drivers/usb/core/urb.c:430
 usbtmc_write+0xc32/0x1220 drivers/usb/class/usbtmc.c:1606
 vfs_write+0x493/0x1550 fs/read_write.c:588
 ksys_write+0x20f/0x4c0 fs/read_write.c:643
 __do_sys_write fs/read_write.c:655 [inline]
 __se_sys_write fs/read_write.c:652 [inline]
 __x64_sys_write+0x93/0xe0 fs/read_write.c:652
 x64_sys_call+0x306a/0x3ba0 arch/x86/include/generated/asm/syscalls_64.h:2
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:3994 [inline]
 slab_alloc_node mm/slub.c:4037 [inline]
 __kmalloc_cache_noprof+0x4f0/0xb00 mm/slub.c:4184
 kmalloc_noprof include/linux/slab.h:681 [inline]
 usbtmc_create_urb drivers/usb/class/usbtmc.c:757 [inline]
 usbtmc_write+0x3d3/0x1220 drivers/usb/class/usbtmc.c:1547
 vfs_write+0x493/0x1550 fs/read_write.c:588
 ksys_write+0x20f/0x4c0 fs/read_write.c:643
 __do_sys_write fs/read_write.c:655 [inline]
 __se_sys_write fs/read_write.c:652 [inline]
 __x64_sys_write+0x93/0xe0 fs/read_write.c:652
 x64_sys_call+0x306a/0x3ba0 arch/x86/include/generated/asm/syscalls_64.h:2
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Byte 15 of 16 is uninitialized
Memory access of size 16 starts at ffff88810bce7000

CPU: 0 UID: 0 PID: 5229 Comm: syz-executor195 Not tainted 6.11.0-rc6-syzkaller-00026-g88fac17500f4 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/06/2024
=====================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

