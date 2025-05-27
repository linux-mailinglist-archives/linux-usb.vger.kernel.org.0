Return-Path: <linux-usb+bounces-24315-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37129AC4614
	for <lists+linux-usb@lfdr.de>; Tue, 27 May 2025 04:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7ABFB167544
	for <lists+linux-usb@lfdr.de>; Tue, 27 May 2025 02:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A6770808;
	Tue, 27 May 2025 02:02:32 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091CD2DCC0C
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 02:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748311352; cv=none; b=ET9gYpCGVp2iIYvkW/it9ySUMhgLIm+Lu6Vtf/QuRR4pOpE+OSvTgtY/wuycLovYQ6kv2AEY/lmqDDk11jHQDzkeRRzwlhbO7v8O6KmXjDhib5Nuz0Wk/K+c0zF8GXZJgAxtgk6ycSmCPsrtNB70IM4Qz9q5QqhFYVqYoX//M2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748311352; c=relaxed/simple;
	bh=8GHjWkUmMsrgO/7uifOHXKYwcIsRlSw3gCJYHms7gJ0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gWrb0iAoISNqhgxi+6TGZgkDfIsSbW8HUHxDV4vnnZfv5Aa49CaiKTbi11zQzDHpTMu9kQmg1mRIjDgGhL9NgiOq73nhhrBqkW9w7cysoDIxUMjFVTY1OvUlhoFWqOqdel1yRuhDl9kEu7/imjRywv5DdsWccItY3yUo+eABkg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-86cab385db7so826489539f.3
        for <linux-usb@vger.kernel.org>; Mon, 26 May 2025 19:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748311350; x=1748916150;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=diiR1thZm5NHrj8Dq0MJFMFDAReJQAV4nbpN2zbDz0E=;
        b=ndJ0mdyL0OrhbOHTCwq/7jHe0y8RFWKUbH/ZawY2OlIoesE9KM4TSayrfD0ol1vlzp
         Pddnh5SvxLQ7gTrBTPRmVmVpa0j7Z+CWtyzp8HzJDwgiUPmAhzClATqSEvY70qeYiKgG
         bt/LoCLoEAzJfsJfvcDLdBvNYexWIPif7T1LV7vAg/JaKOV34J2v+MwIDoOe7SQ3YE5F
         h+A7H2fy2Mun4Du+gtdd8MfQ5RSPFe8vOB/tM2gK1NyhT/chYcv8GqDuMwqmm5UhDmSP
         SZIS3GO7j7CRsdAGKKOqXcBkRq+jCi/dXM3UFhR7mcNPqFTaPdqMcsPVgVgZgkZy3CAQ
         rQ9g==
X-Forwarded-Encrypted: i=1; AJvYcCWUDYefkAFZw1XcJvMMptfow+7o622lmhr5h0DZ2PzR1wpv7DxVvn1Uyfh/a4yASiip1mgDDu22Yi8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo8fExUbUqsHWV3q+oNTEtqYaT0j/OL/W1Xkk9/Xh9luHwW5WZ
	XjomakxtLzxFnGMmZR5gutG4b/+2ZlRj+gPcx49jn3sofNCH1ZNz4ZaVaTBB1hQRhNfQGTJApJE
	dD1BK18MMH/GSI+PvyHuI7fq2IW0aJnmRjVXThXfZVpLXZpo3a7/OgnIyI8c=
X-Google-Smtp-Source: AGHT+IHqZ3dIRE5aE+11Qm2cCPr9DihaND5gLXT/9TPrlYFnU0Qk0WQPu5UskDqd4PpT7mdqIBVKclEsLBEz4DXZjr7Tbp/KUd5o
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3e85:b0:869:d4de:f7 with SMTP id
 ca18e2360f4ac-86cbb905927mr1234845239f.12.1748311350134; Mon, 26 May 2025
 19:02:30 -0700 (PDT)
Date: Mon, 26 May 2025 19:02:30 -0700
In-Reply-To: <682ec5f4.a00a0220.2a3337.000e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68351d36.a70a0220.253bc2.009d.GAE@google.com>
Subject: Re: [syzbot] [usb?] WARNING in dtv5100_i2c_msg/usb_submit_urb
From: syzbot <syzbot+0335df380edd9bd3ff70@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    0ff41df1cb26 Linux 6.15
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=15245df4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=23c237720c19259f
dashboard link: https://syzkaller.appspot.com/bug?extid=0335df380edd9bd3ff70
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16e4cdf4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11e07882580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ddad0afe528e/disk-0ff41df1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1e3cda1e4903/vmlinux-0ff41df1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/65288d07516b/bzImage-0ff41df1.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0335df380edd9bd3ff70@syzkaller.appspotmail.com

------------[ cut here ]------------
usb 1-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c0
WARNING: CPU: 0 PID: 5833 at drivers/usb/core/urb.c:413 usb_submit_urb+0x1112/0x1870 drivers/usb/core/urb.c:411
Modules linked in:
CPU: 0 UID: 0 PID: 5833 Comm: syz-executor411 Not tainted 6.15.0-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:usb_submit_urb+0x1112/0x1870 drivers/usb/core/urb.c:411
Code: 0f b6 44 05 00 84 c0 0f 85 38 06 00 00 45 0f b6 04 24 48 c7 c7 a0 87 12 8c 48 8b 74 24 18 4c 89 fa 44 89 f1 e8 df db 6e fa 90 <0f> 0b 90 90 49 bd 00 00 00 00 00 fc ff df e9 2b f4 ff ff 89 e9 80
RSP: 0018:ffffc9000440f610 EFLAGS: 00010246
RAX: eecd5c38d4424c00 RBX: ffff888021eac200 RCX: ffff888033e81e00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000002
RBP: 1ffff1100435d80c R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffffbfff1bba984 R12: ffff888021aec060
R13: dffffc0000000000 R14: 0000000080000280 R15: ffff888028cb5dc0
FS:  000055555d4a6380(0000) GS:ffff8881260c2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd4d4ed1140 CR3: 00000000779d6000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 usb_start_wait_urb+0x114/0x4c0 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x232/0x3e0 drivers/usb/core/message.c:154
 dtv5100_i2c_msg+0x250/0x330 drivers/media/usb/dvb-usb/dtv5100.c:60
 dtv5100_i2c_xfer+0x1a4/0x3c0 drivers/media/usb/dvb-usb/dtv5100.c:86
 __i2c_transfer+0x871/0x2170 drivers/i2c/i2c-core-base.c:-1
 i2c_transfer+0x25b/0x3a0 drivers/i2c/i2c-core-base.c:2315
 i2c_transfer_buffer_flags+0x105/0x190 drivers/i2c/i2c-core-base.c:2343
 i2c_master_send include/linux/i2c.h:109 [inline]
 i2cdev_write+0x112/0x1b0 drivers/i2c/i2c-dev.c:183
 do_loop_readv_writev include/linux/uio.h:-1 [inline]
 vfs_writev+0x4a5/0x9a0 fs/read_write.c:1057
 do_writev+0x14d/0x2d0 fs/read_write.c:1101
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa54bca17b9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 c1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff3a510bc8 EFLAGS: 00000246 ORIG_RAX: 0000000000000014
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fa54bca17b9
RDX: 0000000000000001 RSI: 0000200000000680 RDI: 0000000000000004
RBP: 00007fa54bd145f0 R08: 00232d6332692f76 R09: 0000000000000006
R10: 000000000000000f R11: 0000000000000246 R12: 0000000000000001
R13: 431bde82d7b634db R14: 0000000000000001 R15: 0000000000000001
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

