Return-Path: <linux-usb+bounces-19474-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD70A14990
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 07:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C9843A4849
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 06:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC00E1F76C1;
	Fri, 17 Jan 2025 06:14:26 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF99D1F76A3
	for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2025 06:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737094466; cv=none; b=fC2MfrR5caJgtBm/W0ra2YuUJc2fQ0gTAiRI6Tjj8tn0hOeJp5yHtz1emblwsRzp+soOhScAlpTDdNdvHppR2qbqDNF1Lfb+y6ki3HOxSsuIjXOHR67xK1PnF9MBijBZkI34R/JHpZ3/GiXFL8TBjg3dFeCP1Wg4iIJVf2tgtzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737094466; c=relaxed/simple;
	bh=SQInhTpv/YeWPtWFJ0PiM5OOj2Tu/k8Pcw4sIlCfaxw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=fGllauwSMCPt+jWorUrcAcoHtuNPO84SKamr4fPAt0NsXMqQIZqa3c2H5rA/2COa2fa7t8AEsakd9E+fd7tfCtst8jCBTVuPctZMbGME3j59Z6gd9pdMdqgVhX1KvaXhAnTc4V2ki4kCuUk62DfMECtktMb1lhDVyb/Wc37w1oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3a7e39b48a2so32891845ab.0
        for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2025 22:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737094464; x=1737699264;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lu+w6dMMxnQIvwTBW3iUrZR77SzQbght4aqKqW2Ritw=;
        b=xF8yXlmLx4FQbKtP9Va18uaI14zFM/C2otzB0DYmFpq3oKgBDHJ6ZnU9X5+2Hw4K07
         /Ben8hMMpvW+K/Q7KinRZr732s88sB26SprJm6KT9q9Nun/drXIp9n/aLSPRmQSMnfTF
         V1fNufEuC+yyWQBAC3zrml7TdJTzXyyBp59wmZj2KisMvRFTTrHMX3W58fVGXd6iYcPc
         13RNTNMqKLR9W4I/5aEQ+cI80KFZ0Hfy/sqkbH3fMD5xUAiAYcpT6uotb+GUEFKiKOWW
         lx3bCks/h0ezbYDGDvmgY/kQHCJgjdOqNX0PyX40/2xriHFLBMU6EYFRtrmzw/PlIiRQ
         pPOg==
X-Forwarded-Encrypted: i=1; AJvYcCWIcUIatK2jEhtDxoJ0VL+FsHY8bLoW/FcqX1ANQym8WSYJNVL/F6q3X5s2qUtY/aDwcENavC9ghEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLkLx9ENL2GxnwjttVjO86L1t3UtnaJdEa13Hggwp4wN1NLV6G
	WV5O0eZhemxjenVvRNaC9OVDhT4kV7QJW8Fe+1wkzVCJQ0CPTOij80JCBw9S9VSsgujSaCHT4Zg
	LL2IJ+8z5wfXp+agbnjiX5nzd4stLsVQhG0h4BjaPu0cExeoXkxydq3E=
X-Google-Smtp-Source: AGHT+IHQvY770JOh8dmsoEk6idadJHQ3Sgn8BJYzKjqDccZWnR/X5EKMavEBK9x9ulc4Z/OtVAibt7RleCodRGTumdr/gIiGhmV/
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b4c:b0:3a7:e86a:e803 with SMTP id
 e9e14a558f8ab-3cf743f8834mr11598645ab.8.1737094464012; Thu, 16 Jan 2025
 22:14:24 -0800 (PST)
Date: Thu, 16 Jan 2025 22:14:23 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6789f53f.050a0220.20d369.0054.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in status_show
From: syzbot <syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, shuah@kernel.org, syzkaller-bugs@googlegroups.com, 
	valentina.manea.m@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    be548645527a Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=105adbc4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ad08f7f48e13abcd
dashboard link: https://syzkaller.appspot.com/bug?extid=83976e47ec1ef91e66f1
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=179bbef8580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12d51cb0580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/68edb33a6611/disk-be548645.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9c748ff58068/vmlinux-be548645.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6ae2859fc0e3/bzImage-be548645.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000081: 0000 [#1] PREEMPT SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000408-0x000000000000040f]
CPU: 0 UID: 0 PID: 5830 Comm: syz-executor351 Not tainted 6.13.0-rc6-syzkaller-00290-gbe548645527a #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
RIP: 0010:status_show_vhci drivers/usb/usbip/vhci_sysfs.c:80 [inline]
RIP: 0010:status_show+0x306/0x5a0 drivers/usb/usbip/vhci_sysfs.c:160
Code: 03 80 3c 02 00 0f 85 9c 02 00 00 48 8b 9b 88 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d bb 08 04 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 7d 02 00 00 4c 8b ab 08 04 00 00 c1 e5 04 41 bf
RSP: 0018:ffffc90003cbfad8 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff87534bb9
RDX: 0000000000000081 RSI: ffffffff87534d75 RDI: 0000000000000408
RBP: 000000000000000f R08: 0000000000000005 R09: 0000000000000000
R10: 000000000000000f R11: 64666b636f732020 R12: ffffc90003cbfb28
R13: ffff888034b8c02d R14: ffffffff87534ab0 R15: ffff888034b8c000
FS:  0000555582a4a380(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020000000 CR3: 0000000035336000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 dev_attr_show+0x53/0xe0 drivers/base/core.c:2423
 sysfs_kf_seq_show+0x223/0x3e0 fs/sysfs/file.c:59
 seq_read_iter+0x4f4/0x12b0 fs/seq_file.c:230
 kernfs_fop_read_iter+0x414/0x580 fs/kernfs/file.c:279
 new_sync_read fs/read_write.c:484 [inline]
 vfs_read+0x87f/0xbe0 fs/read_write.c:565
 ksys_read+0x12b/0x250 fs/read_write.c:708
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5c749f72e9
Code: 48 83 c4 28 c3 e8 37 17 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fffd7fbd308 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 00007fffd7fbd4d8 RCX: 00007f5c749f72e9
RDX: 0000000000000062 RSI: 0000000020001080 RDI: 0000000000000003
RBP: 00007f5c74a6a610 R08: 0000000000000000 R09: 00007fffd7fbd4d8
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00007fffd7fbd4c8 R14: 0000000000000001 R15: 0000000000000001
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:status_show_vhci drivers/usb/usbip/vhci_sysfs.c:80 [inline]
RIP: 0010:status_show+0x306/0x5a0 drivers/usb/usbip/vhci_sysfs.c:160
Code: 03 80 3c 02 00 0f 85 9c 02 00 00 48 8b 9b 88 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d bb 08 04 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 7d 02 00 00 4c 8b ab 08 04 00 00 c1 e5 04 41 bf
RSP: 0018:ffffc90003cbfad8 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff87534bb9
RDX: 0000000000000081 RSI: ffffffff87534d75 RDI: 0000000000000408
RBP: 000000000000000f R08: 0000000000000005 R09: 0000000000000000
R10: 000000000000000f R11: 64666b636f732020 R12: ffffc90003cbfb28
R13: ffff888034b8c02d R14: ffffffff87534ab0 R15: ffff888034b8c000
FS:  0000555582a4a380(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020000000 CR3: 0000000035336000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	03 80 3c 02 00 0f    	add    0xf00023c(%rax),%eax
   6:	85 9c 02 00 00 48 8b 	test   %ebx,-0x74b80000(%rdx,%rax,1)
   d:	9b                   	fwait
   e:	88 00                	mov    %al,(%rax)
  10:	00 00                	add    %al,(%rax)
  12:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  19:	fc ff df
  1c:	48 8d bb 08 04 00 00 	lea    0x408(%rbx),%rdi
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	0f 85 7d 02 00 00    	jne    0x2b1
  34:	4c 8b ab 08 04 00 00 	mov    0x408(%rbx),%r13
  3b:	c1 e5 04             	shl    $0x4,%ebp
  3e:	41                   	rex.B
  3f:	bf                   	.byte 0xbf


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

