Return-Path: <linux-usb+bounces-31173-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D93CA56B8
	for <lists+linux-usb@lfdr.de>; Thu, 04 Dec 2025 22:10:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 117BD31B80A9
	for <lists+linux-usb@lfdr.de>; Thu,  4 Dec 2025 21:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200B530F7E4;
	Thu,  4 Dec 2025 20:56:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE58930EF9E
	for <linux-usb@vger.kernel.org>; Thu,  4 Dec 2025 20:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764881764; cv=none; b=M495ghxxaFernxnP/wLsRQMaeLza+ITnVaerXVe1Yec2c811WA+5yV4U6dFEK05xYKBHuY238BcjNI4qB8UXEKsW9mTrSnplekA8e56RKiX+mopldnxMSsx+SC8e+DGbz+qh3R7QLarLUdb3hFYOz95XB5nNx/SGnueRMysRbKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764881764; c=relaxed/simple;
	bh=IxZpvCXwvq7Ma5Pc/u7miJl6YroWhrartm1z8I4nHMc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PItVGsKjqdvegbNiv4ajEpdxnoC2JyDJG+APk8wx+b4jbE/VrM9hHY/efeESt66edQb+4YB0kIrNgI8UC5eX+BS8xZQ2mmfmCNezpIIwIJMdQmKlLj0ebH2AEIDm6JU0SNn7HV1YHdcNg/3xVJZCCAnCAT4hbhyHWFOnyhfIRtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-657486eb435so1591875eaf.1
        for <linux-usb@vger.kernel.org>; Thu, 04 Dec 2025 12:56:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764881762; x=1765486562;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pePZFOSCRXNCxNIr3NZ0gnPbN18XAPfX01S/xgElQF4=;
        b=pPvrvLuPvouDR743YL1nxWoIOqnvX9rnj+axCpCFj+CB3nJG7ujUORYQCheOVyz0I8
         Tw/SA5Wn5gjlneITvsmp8Ie6YyyDZ2Yc9BpJDY1rE3x23V9BNoe787ZxyN+GUmnuUX5G
         DetXB76C+de3/HR3H833qIixxYbRecDQFgS8Hqg4qi94Gxc40wGAZ8fexyx8SjL/+YPP
         +DhUyYjTZ9fUsJDI+DYfdFbpWlDYdAkF/Iie3i32+RDeKsEYHhhGGrduPZ6vpMV4Ffzx
         ZQtuV5sYrZSLKwGpXqJNXYsjMi0GZL9OE96pVJaDsl1b4Uw4DgYg3x1LsjnaFD/8YJ5i
         98pw==
X-Forwarded-Encrypted: i=1; AJvYcCVDNu8mZfru46+VPE5FfCXLgWqsv6lNv+Bcyq/OqFWEkCnc306vjoI9Vm+6TXkOKHeF9oNGNCMC6Bc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVejNTuJ9pZsxwuM3DXN4t1cD0iDjE6FS6Dv8es3BZMzIYEpdO
	mnLzoRwPgeewvomaVHqBKWioubd3Vi4hF4ihu/oPPZNNAhVEr0kYJvyQiXmnDz0NDl0WdD/EouR
	VwgrexPN2aEUTGucQlVAhEIYY3tVpF6LYbImh53pnTBHhM4NspX8d6vAOM3I=
X-Google-Smtp-Source: AGHT+IFaK61s8S9X2NAiKUpqEgFUP/5D1iDvL43HHS4olKpdVzM3KSnYwBPzCgkdkXfgzdPMnmhAgjO7g5/fscPqefipjNZogCHt
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fe4:b0:450:730e:d109 with SMTP id
 5614622812f47-45379ddc5eemr2208199b6e.48.1764881761941; Thu, 04 Dec 2025
 12:56:01 -0800 (PST)
Date: Thu, 04 Dec 2025 12:56:01 -0800
In-Reply-To: <m2o6oe85fv.fsf@posteo.net>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6931f561.a70a0220.2ea503.00e7.GAE@google.com>
Subject: Re: [syzbot] [usb?] WARNING in usb_start_wait_urb
From: syzbot <syzbot+e6a50a2e7cbb4f775d04@syzkaller.appspotmail.com>
To: charmitro@posteo.net, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in usb_start_wait_urb

------------[ cut here ]------------
usb 1-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c0
WARNING: drivers/usb/core/urb.c:414 at 0x0, CPU#1: syz.0.17/6455
Modules linked in:
CPU: 1 UID: 0 PID: 6455 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
RIP: 0010:usb_submit_urb+0x111c/0x18d0 drivers/usb/core/urb.c:412
Code: b8 00 00 00 00 00 fc ff df 0f b6 44 05 00 84 c0 0f 85 a7 05 00 00 45 0f b6 45 00 48 8b 3c 24 48 8b 74 24 20 4c 89 fa 44 89 f1 <67> 48 0f b9 3a 49 bf 00 00 00 00 00 fc ff df e9 b7 f2 ff ff 89 e9
RSP: 0018:ffffc90003f1f800 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff88807523df00 RCX: 0000000080000280
RDX: ffff8881404becc0 RSI: ffffffff8c35e540 RDI: ffffffff8fd058d0
RBP: 1ffff110287ec848 R08: 00000000000000c0 R09: 0000000000000000
R10: ffffc90003f1f900 R11: fffff520007e3f2c R12: ffff88807d6a5100
R13: ffff888143f64240 R14: 0000000080000280 R15: ffff8881404becc0
FS:  00007f80746386c0(0000) GS:ffff888125af0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000558e2419d738 CR3: 000000007303a000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 usb_start_wait_urb+0x115/0x4f0 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x232/0x3e0 drivers/usb/core/message.c:154
 dtv5100_i2c_msg+0x231/0x2f0 drivers/media/usb/dvb-usb/dtv5100.c:65
 dtv5100_i2c_xfer+0x269/0x3c0 drivers/media/usb/dvb-usb/dtv5100.c:86
 __i2c_transfer+0x871/0x2110 drivers/i2c/i2c-core-base.c:-1
 i2c_transfer+0x25b/0x3a0 drivers/i2c/i2c-core-base.c:2317
 i2cdev_ioctl_rdwr+0x460/0x740 drivers/i2c/i2c-dev.c:306
 i2cdev_ioctl+0x64b/0x820 drivers/i2c/i2c-dev.c:467
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f807378f749
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f8074638038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f80739e5fa0 RCX: 00007f807378f749
RDX: 0000200000000240 RSI: 0000000000000707 RDI: 0000000000000004
RBP: 00007f8073813f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f80739e6038 R14: 00007f80739e5fa0 R15: 00007ffc05fa7018
 </TASK>
----------------
Code disassembly (best guess):
   0:	b8 00 00 00 00       	mov    $0x0,%eax
   5:	00 fc                	add    %bh,%ah
   7:	ff                   	(bad)
   8:	df 0f                	fisttps (%rdi)
   a:	b6 44                	mov    $0x44,%dh
   c:	05 00 84 c0 0f       	add    $0xfc08400,%eax
  11:	85 a7 05 00 00 45    	test   %esp,0x45000005(%rdi)
  17:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
  1b:	48 8b 3c 24          	mov    (%rsp),%rdi
  1f:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
  24:	4c 89 fa             	mov    %r15,%rdx
  27:	44 89 f1             	mov    %r14d,%ecx
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	49 bf 00 00 00 00 00 	movabs $0xdffffc0000000000,%r15
  36:	fc ff df
  39:	e9 b7 f2 ff ff       	jmp    0xfffff2f5
  3e:	89 e9                	mov    %ebp,%ecx


Tested on:

commit:         f231ce51 media: dvb-usb: dib0700: fix zero-length cont..
git tree:       https://github.com/charmitro/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=122b301a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b9f785244b836412
dashboard link: https://syzkaller.appspot.com/bug?extid=e6a50a2e7cbb4f775d04
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Note: no patches were applied.

