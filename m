Return-Path: <linux-usb+bounces-24457-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB29ACCA3C
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jun 2025 17:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 398313A5D17
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jun 2025 15:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E5723D2A3;
	Tue,  3 Jun 2025 15:31:32 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BCE23CEE5
	for <linux-usb@vger.kernel.org>; Tue,  3 Jun 2025 15:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748964691; cv=none; b=bvs3wiLSdixF//3hHgtJV9qfwbpXEVMZv1zsYbk4NtDrARYzkJ//i93gtt999tOBg3uiivTQm0xqPapBugcRVSD7YhVUrGvSEiKbzUTGNU5AhaOZJzRCjWDARr3J5FEBc2tirPrXG96HFr9ur+R3PicFTPACfPSxuLehbib5mRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748964691; c=relaxed/simple;
	bh=PFXJYGFLtLX7vFLrt0z8PSAtWdECtHV3t2TAjCiIyF0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=B32vRlFR8hCf9Y3aTC0VH7x0vGLjBM1JGXlkToD7O78bFli1IKsuaIluFgCsFfLq8ncJL3N/CxEVBHF+uJYyH65Tua09VzbcWK5kdIWVXNy0uJmFOqiQZhY1hdMm027CbK3+F7XM/fmvCWpSc51tqNaEgUhLpZ1y2I0rXA9B0OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3ddba1b53e8so8266135ab.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Jun 2025 08:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748964689; x=1749569489;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GAVSA8Z20LfJYI8icc/3dunATI/t7i9/bRad+C4O4Xc=;
        b=P5H2Zx0uEszwE/AKjLD2TFPj65GO6pvzfynkxSQzMdwILOhFa0eFRb0zCfZGcO+si2
         ag1Vcu82Hfl2wGDMl3YZ5wyMv2NqlpGQ57gf8jOKxPE4rf+m8N2S0IlJ64jVCVDOLKmn
         8rJLDvjdRDLutl8AudDDPAT6cFVxaTogQI3EDrM4IQDIxMIfU0Nw4H9Vwzf+wT6jBsav
         WwvUm52K0i1+sM0fBjH4aR0+hpDiPwt2khFYM1JaIp8y96SeWDy2SM/0poGHdaeFNHLY
         GZR2w+u3IAB4Kxzz9VLPxRU86fbduDsat1TbJ9i9vtSyV0arOZPeMtfGIhLxTSvj3gtE
         Sx0g==
X-Forwarded-Encrypted: i=1; AJvYcCUo9+LW1oomS+QL0l/Vy+PHIKFo/3GeAUXZxT7RCrlDExz57T3Wksc9zJMvgpEko4X6BjbZa/IOSb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWtwPpHtjfJfPATYfk5+KMswOF/EGSSr3Ta2iF145lo8sAOF/x
	4nHbLgquiWDaLdV7H8WhuglxrorwFv6VGfF1VRLhLAfsGLnBtDwLvH98ewUEsvxmM6GWw9kC5qn
	jOlXR7Uk9kSSg5rNoht2tyFnVSxQSbW9K+kut8CfI4AGBjI7Wcu4VdcU75HE=
X-Google-Smtp-Source: AGHT+IGKu2HbwU02zkRnkBN+6fEeYWhnjL9Z+Yug9QKyorhWRczyHHu96xE+PHUz0q0+ck5gsb/d2JLCI2sC7S6zjMkhJmUNG6lx
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:16c5:b0:3dd:b4f4:2bba with SMTP id
 e9e14a558f8ab-3ddb4f42c4fmr68966565ab.22.1748964689170; Tue, 03 Jun 2025
 08:31:29 -0700 (PDT)
Date: Tue, 03 Jun 2025 08:31:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683f1551.050a0220.55ceb.0016.GAE@google.com>
Subject: [syzbot] [net?] WARNING in ipmr_rules_exit (2)
From: syzbot <syzbot+a25af2d6c990a65eca95@syzkaller.appspotmail.com>
To: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    342e4955a1f1 usb: usbtmc: Fix timeout value in get_stb
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=135a19f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cc73a376913a3005
dashboard link: https://syzkaller.appspot.com/bug?extid=a25af2d6c990a65eca95
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/3d4486b9330e/disk-342e4955.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b0b416348409/vmlinux-342e4955.xz
kernel image: https://storage.googleapis.com/syzbot-assets/053a330bcf59/bzImage-342e4955.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a25af2d6c990a65eca95@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 13600 at net/ipv4/ipmr.c:440 ipmr_free_table net/ipv4/ipmr.c:440 [inline]
WARNING: CPU: 0 PID: 13600 at net/ipv4/ipmr.c:440 ipmr_rules_exit+0x13a/0x1c0 net/ipv4/ipmr.c:361
Modules linked in:

CPU: 0 UID: 0 PID: 13600 Comm: syz-executor Not tainted 6.15.0-rc6-syzkaller-00166-g342e4955a1f1 #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:ipmr_free_table net/ipv4/ipmr.c:440 [inline]
RIP: 0010:ipmr_rules_exit+0x13a/0x1c0 net/ipv4/ipmr.c:361
Code: ff df 48 c1 ea 03 80 3c 02 00 75 7c 48 c7 85 58 09 00 00 00 00 00 00 5b 5d 41 5c 41 5d 41 5e c3 cc cc cc cc e8 d7 79 16 fb 90 <0f> 0b 90 eb 93 e8 cc 79 16 fb 0f b6 1d 73 37 05 04 31 ff 89 de e8
RSP: 0018:ffffc90014e2fc10 EFLAGS: 00010293

RAX: 0000000000000000 RBX: ffff88812c1dc000 RCX: ffffffff8665f0fd
RDX: ffff8881222c9d40 RSI: ffffffff8665f169 RDI: 0000000000000005
RBP: ffff88812ea70000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000001
R13: ffff88812ea70958 R14: ffff88812ea70000 R15: fffffbfff148e04c
FS:  000055558afcb500(0000) GS:ffff8882691c2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fc07c1d33d0 CR3: 000000014620e000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 ipmr_net_exit_batch+0x53/0xa0 net/ipv4/ipmr.c:3160
 ops_exit_list+0x128/0x180 net/core/net_namespace.c:177
 setup_net+0x4e8/0x850 net/core/net_namespace.c:396
 copy_net_ns+0x2a6/0x5f0 net/core/net_namespace.c:518
 create_new_namespaces+0x3ea/0xad0 kernel/nsproxy.c:110
 unshare_nsproxy_namespaces+0xc0/0x1f0 kernel/nsproxy.c:228
 ksys_unshare+0x45b/0xa40 kernel/fork.c:3375
 __do_sys_unshare kernel/fork.c:3446 [inline]
 __se_sys_unshare kernel/fork.c:3444 [inline]
 __x64_sys_unshare+0x31/0x40 kernel/fork.c:3444
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f31d7a50167
Code: 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 10 01 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe9bbc8f18 EFLAGS: 00000206
 ORIG_RAX: 0000000000000110
RAX: ffffffffffffffda RBX: 00007f31d7c75f40 RCX: 00007f31d7a50167
RDX: 0000000000000005 RSI: 00007ffe9bbc8de0 RDI: 0000000040000000
RBP: 00007f31d7c76738 R08: 00007f31d87a7d60 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000008
R13: 0000000000000003 R14: 0000000000000009 R15: 0000000000000000
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

