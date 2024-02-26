Return-Path: <linux-usb+bounces-7065-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B89866FE4
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 11:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 575DB1F266B0
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 10:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF3422337;
	Mon, 26 Feb 2024 09:42:29 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B9A1CD2B
	for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 09:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708940549; cv=none; b=CZKTuzmxJwceK//h3U6pi87s3fnWMRcefGBWuiCksIQn4kzWfXSbeFPEKCfZBE2O2E2RkRV/CmWdbK47e3I9iybNgflJy/ipbxKthQv/kiJbguEhE4v8j2LSuvCGABApf7XIfotnubJkkhmombphB9CsM3hSU69Jd3oXqxByZpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708940549; c=relaxed/simple;
	bh=2r+Jg4IirYez90/CeN3v3u34PFYDkfTtbokSRqIaL/M=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=uY6vUyM6bK3SOJoKgNgxvWBeHOISeOjscGEV/+wDGxQ/ixL8QTctlKk8xtr/O1XP0+WeP6zC4gNJrhkKVruqLUA96LITZRpkrm1jo7pItiNVHHPX6NEt4PbLjz1aE7XN0DgYSBmIdG2O4aipkVWqZjjmakZznYbZikdKhL8Kf/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-365067c1349so24338255ab.3
        for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 01:42:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708940547; x=1709545347;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6mzm746klVmYl18EiU1HABrzvIW1GEwskKuL2oGrXzc=;
        b=Qnq2bub1PYuAflZSEhcIOVDRblL0il9ljzOFqPC0bqa+TEaCNNRm0nl7KqdgatCm/B
         jbAk8SrS3nCh7eMrWoJO3hP0WtwVi1/Po57nlaFstYlGfQFPhthjhxUaDlz2m/Nxd/8+
         7r6QrjAl8RZL+Nrh8GTdBwKoTypxrViq5vLEkc/lVkA7HvqYgr/HN56qzPE/EQ2Bc7/h
         nJY0F0s5ZAlrLADAqLx99rmd/EBjJTAVGrpIGEA86xJO6pgx7otYUqXkLLm6Wg0Hg5bD
         efG2rNUFF3ZPe/c287IYh3MsTDerflljFNIwYqh9USmv+0tSxTaQ7RNr8kO/6/yzWWny
         jpfA==
X-Forwarded-Encrypted: i=1; AJvYcCV7sx6eurFtTvnCTOR809UB8paqUtct+JvFplPP+Za1Gq/ETMWZhAqv2kcF9gieKOdDNpc2Sy/ifjdQip5et6sMaFs8BYY3xAjv
X-Gm-Message-State: AOJu0YydXOxtZw8+5WtXb7ikPSTqmrj3pViroH8EaCv4YOW8Z92jjxWM
	51PLCcNw95aVkxLBw2n9OUKR+b6WgAemYDxmduw23z+sJ1jCjhBjxslt+FlgswCPVk9lRWR6WCj
	DlTD6ULlrHIb9jQTpgHSFqsVbMfFvNp5chquFLU6AIAE49YESBQmlxxI=
X-Google-Smtp-Source: AGHT+IGg+zmSUa5QfjPli/WDJFydT/dqQ9GQYePyx5iMd/vjx9Dt5vNWCWX2/17AgZMbPFsDTgrOMI4IKTPWZ5Zb9P8/CDyG6ETt
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d86:b0:365:26e3:6e48 with SMTP id
 h6-20020a056e021d8600b0036526e36e48mr515484ila.0.1708940546977; Mon, 26 Feb
 2024 01:42:26 -0800 (PST)
Date: Mon, 26 Feb 2024 01:42:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003eb868061245ba7f@google.com>
Subject: [syzbot] [usb-storage?] divide error in isd200_ata_command
From: syzbot <syzbot+28748250ab47a8f04100@syzkaller.appspotmail.com>
To: bvanassche@acm.org, emilne@redhat.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	martin.petersen@oracle.com, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com, tasos@tasossah.com, 
	usb-storage@lists.one-eyed-alien.net
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f2e367d6ad3b Merge tag 'for-6.8/dm-fix-3' of git://git.ker..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=114e10e4180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=eff9f3183d0a20dd
dashboard link: https://syzkaller.appspot.com/bug?extid=28748250ab47a8f04100
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1064b372180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10aca6ac180000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c55ca1fdc5ad/disk-f2e367d6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4556a82fb4ed/vmlinux-f2e367d6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/95338ed9dad1/bzImage-f2e367d6.xz

The issue was bisected to:

commit 321da3dc1f3c92a12e3c5da934090d2992a8814c
Author: Martin K. Petersen <martin.petersen@oracle.com>
Date:   Tue Feb 13 14:33:06 2024 +0000

    scsi: sd: usb_storage: uas: Access media prior to querying device properties

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15a3934a180000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=17a3934a180000
console output: https://syzkaller.appspot.com/x/log.txt?x=13a3934a180000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+28748250ab47a8f04100@syzkaller.appspotmail.com
Fixes: 321da3dc1f3c ("scsi: sd: usb_storage: uas: Access media prior to querying device properties")

divide error: 0000 [#1] PREEMPT SMP KASAN PTI
CPU: 0 PID: 5070 Comm: usb-storage Not tainted 6.8.0-rc5-syzkaller-00297-gf2e367d6ad3b #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/25/2024
RIP: 0010:isd200_scsi_to_ata drivers/usb/storage/isd200.c:1318 [inline]
RIP: 0010:isd200_ata_command+0x776/0x2380 drivers/usb/storage/isd200.c:1529
Code: 62 fa 49 8d 7c 24 0c 48 89 f8 48 c1 e8 03 42 0f b6 04 28 84 c0 0f 85 00 18 00 00 41 0f b7 5c 24 0c 48 8b 7c 24 18 89 f8 31 d2 <f7> f3 41 89 d0 49 83 c4 06 4c 89 e0 48 c1 e8 03 42 0f b6 04 28 84
RSP: 0018:ffffc900043ffc00 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff888023230000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc900043ffd50 R08: ffffffff873161fd R09: ffffffff87315c95
R10: 0000000000000008 R11: ffff888023230000 R12: ffff88807f7a0000
R13: dffffc0000000000 R14: ffff888021da1000 R15: ffff88807c10a110
FS:  0000000000000000(0000) GS:ffff8880b9400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000563828985bd8 CR3: 000000002e0cc000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 usb_stor_control_thread+0x4b1/0xa50 drivers/usb/storage/usb.c:368
 kthread+0x2ef/0x390 kernel/kthread.c:388
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1b/0x30 arch/x86/entry/entry_64.S:242
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:isd200_scsi_to_ata drivers/usb/storage/isd200.c:1318 [inline]
RIP: 0010:isd200_ata_command+0x776/0x2380 drivers/usb/storage/isd200.c:1529
Code: 62 fa 49 8d 7c 24 0c 48 89 f8 48 c1 e8 03 42 0f b6 04 28 84 c0 0f 85 00 18 00 00 41 0f b7 5c 24 0c 48 8b 7c 24 18 89 f8 31 d2 <f7> f3 41 89 d0 49 83 c4 06 4c 89 e0 48 c1 e8 03 42 0f b6 04 28 84
RSP: 0018:ffffc900043ffc00 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff888023230000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc900043ffd50 R08: ffffffff873161fd R09: ffffffff87315c95
R10: 0000000000000008 R11: ffff888023230000 R12: ffff88807f7a0000
R13: dffffc0000000000 R14: ffff888021da1000 R15: ffff88807c10a110
FS:  0000000000000000(0000) GS:ffff8880b9400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000563828985bd8 CR3: 000000000df32000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess), 1 bytes skipped:
   0:	fa                   	cli
   1:	49 8d 7c 24 0c       	lea    0xc(%r12),%rdi
   6:	48 89 f8             	mov    %rdi,%rax
   9:	48 c1 e8 03          	shr    $0x3,%rax
   d:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
  12:	84 c0                	test   %al,%al
  14:	0f 85 00 18 00 00    	jne    0x181a
  1a:	41 0f b7 5c 24 0c    	movzwl 0xc(%r12),%ebx
  20:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  25:	89 f8                	mov    %edi,%eax
  27:	31 d2                	xor    %edx,%edx
* 29:	f7 f3                	div    %ebx <-- trapping instruction
  2b:	41 89 d0             	mov    %edx,%r8d
  2e:	49 83 c4 06          	add    $0x6,%r12
  32:	4c 89 e0             	mov    %r12,%rax
  35:	48 c1 e8 03          	shr    $0x3,%rax
  39:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
  3e:	84                   	.byte 0x84


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

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

