Return-Path: <linux-usb+bounces-31895-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E978CF142A
	for <lists+linux-usb@lfdr.de>; Sun, 04 Jan 2026 20:20:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B70C302514A
	for <lists+linux-usb@lfdr.de>; Sun,  4 Jan 2026 19:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1AE30FF3B;
	Sun,  4 Jan 2026 19:19:32 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB403A1E7F
	for <linux-usb@vger.kernel.org>; Sun,  4 Jan 2026 19:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767554372; cv=none; b=hIi3XSBX/WnPba0DR7riaFg6BMbiXtXIpwDZmcrm+z0Zkzqvj1x/80T0Ch82zzbyk1u5v8H8pZxRw6srC3K3lzEIcD6uS4feCFPhi4xDtgNiRfeXmCWCBseR/g34OV1nXJn3VjdOnxfphZ9z7uPZhAgoh1Cbd7fjBOxt2kXoY34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767554372; c=relaxed/simple;
	bh=Vlv6MQDmmOGEXZHTPr5+NVQB75zXXPfxUMaNWJNqc8s=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=I0tVa9r8exff9GI9lXpyqkUQzWcPiasmL2koUkXfITN0Si2ARDa9uTXzHC8iW2hdbWh6vYolnMQp1dM6wsUCt+iiw4yOTCwVAaBd0TBOZwejpgGm8ANAqEXgJRUJXWkL2rQmTce2ESFxczdNfYNtCvEwF4ZGwf6slQC8u88Hrbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-6574d3d44f9so26231488eaf.3
        for <linux-usb@vger.kernel.org>; Sun, 04 Jan 2026 11:19:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767554369; x=1768159169;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Y5h4CcQ4i6CybYIdLNzSySVZ/jerdRgkkf/ATpg6lY=;
        b=DprEWcdm7mOGBW/Xh7wcfwJeXR75HTjNZRE7gznmS5lRKWi02oN20v2h/0XtJY5uCs
         evncbx0NPO+huRMrmvcqdPtJymsiuOEc8BqZl6caLqb2E5/YcCvepgPHBUuipH+M3Ddt
         VzqhtjPWEVUmxurS5Jd9QGmYWyIOvMPPYbO6DAnZqdDyZUElIaj0BM3NNTol6vgKPfki
         KWHsbEPWWT0XQ+LwF5QYvFx6HtJMFHvaDfccqKaLJupGwFCE+CNr4GoR9B8DHUkpKzcl
         6OP2jzHIPlaek/MypknTkgH4Y6/JP1TeGDcjV3a8r+2mWiX7HE+AD80d/cPNkWarZ8gj
         ZVUA==
X-Forwarded-Encrypted: i=1; AJvYcCVmAvAdy2AQ+ISFpfPOi/Ao+HNzHnA55+Bu/wbfpVxPl05Op/6EwmVPwbpNDdVvxa3zkamh5wS5Bno=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+nDmGrf6JnkzcSTDMvT0sM8oIi/r61reh5CLOUFHyBl/IGTli
	+aTU7zdRDwXYdeuvor/IzFfdsgGxq/i20qqPClTi9rQAqXjVjRSwIngegATjgK7uwzXxiw0N/oh
	BacPOlFyLMPEp15gLsOcCRYW/inbKw4pOU1Fe5tCr4Ush0ySSQetokHN3uG8=
X-Google-Smtp-Source: AGHT+IH/F24mGMAL6rxDkOJvknWOJ2y0DW5Rb9IgryNEQV4SOTECJN1KG44dYtDrhqQxY9w4i/0+rYwOfgw8DYOdAsEMcLSaYpX6
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2228:b0:659:9a49:8fe1 with SMTP id
 006d021491bc7-65d0e932cb2mr19967934eaf.14.1767554369500; Sun, 04 Jan 2026
 11:19:29 -0800 (PST)
Date: Sun, 04 Jan 2026 11:19:29 -0800
In-Reply-To: <69322f1d.a70a0220.d98e3.01e2.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <695abd41.050a0220.a1b6.0392.GAE@google.com>
Subject: Re: [syzbot] [usb?] WARNING in ADDR_ctrl_msg/usb_submit_urb
From: syzbot <syzbot+427909a2e3b2f83d78cb@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    cc3aa43b44bd Add linux-next specific files for 20251219
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1336269a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=da1bc82c6189c463
dashboard link: https://syzkaller.appspot.com/bug?extid=427909a2e3b2f83d78cb
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11698074580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1736269a580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/30bf539e6f28/disk-cc3aa43b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0e2f8b08e342/vmlinux-cc3aa43b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ec7ee6ece11f/bzImage-cc3aa43b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+427909a2e3b2f83d78cb@syzkaller.appspotmail.com

------------[ cut here ]------------
usb 1-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c0
WARNING: drivers/usb/core/urb.c:414 at usb_submit_urb+0x105c/0x18d0 drivers/usb/core/urb.c:412, CPU#0: syz.0.17/6000
Modules linked in:
CPU: 0 UID: 0 PID: 6000 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
RIP: 0010:usb_submit_urb+0x111c/0x18d0 drivers/usb/core/urb.c:412
Code: b8 00 00 00 00 00 fc ff df 0f b6 44 05 00 84 c0 0f 85 a7 05 00 00 45 0f b6 45 00 48 8b 3c 24 48 8b 74 24 20 4c 89 fa 44 89 f1 <67> 48 0f b9 3a 49 bf 00 00 00 00 00 fc ff df e9 b7 f2 ff ff 89 e9
RSP: 0018:ffffc9000ecf7760 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff888032177a00 RCX: 0000000080000280
RDX: ffff8880203d1e80 RSI: ffffffff8c341f40 RDI: ffffffff8faef860
RBP: 1ffff110283df6ec R08: 00000000000000c0 R09: 0000000000000000
R10: ffffc9000ecf7860 R11: fffff52001d9ef18 R12: ffff8881426d1100
R13: ffff888141efb760 R14: 0000000080000280 R15: ffff8880203d1e80
FS:  0000555584472500(0000) GS:ffff888125c25000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b30663fff CR3: 00000000762fe000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 usb_start_wait_urb+0x115/0x4f0 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x232/0x3e0 drivers/usb/core/message.c:154
 ce6230_ctrl_msg+0x2b1/0x660 drivers/media/usb/dvb-usb-v2/ce6230.c:61
 ce6230_i2c_master_xfer+0x4ce/0x6d0 drivers/media/usb/dvb-usb-v2/ce6230.c:113
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
RIP: 0033:0x7f10c3b8f749
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe182be228 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f10c3de5fa0 RCX: 00007f10c3b8f749
RDX: 0000200000000a40 RSI: 0000000000000707 RDI: 0000000000000004
RBP: 00007f10c3c13f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f10c3de5fa0 R14: 00007f10c3de5fa0 R15: 0000000000000003
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


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

