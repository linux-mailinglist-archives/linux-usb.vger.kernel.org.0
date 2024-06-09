Return-Path: <linux-usb+bounces-11043-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 287FC901413
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jun 2024 02:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9689282AF7
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jun 2024 00:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2754C256D;
	Sun,  9 Jun 2024 00:28:29 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0E723BE
	for <linux-usb@vger.kernel.org>; Sun,  9 Jun 2024 00:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717892908; cv=none; b=HNf8ZujgLfZbFLc9wiJMtWroi1zCdBYQg24Vg4kpKa7vqTZJM2gY8n3/TSQDOVV+/2cjYEVxSqpAZ1xIZ/5dv2ZWiuXQLyypGXyn+r7+WsZAdZqNM2F1feH1HdT0DqDtfTf19Gl0PRXbPuR/GKJ9FD27ncf8REqOOAHC3jFk0Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717892908; c=relaxed/simple;
	bh=mmz54JJc3yybfHFgKCfVytER7nCl3IzG69J6glltmqU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=lCFel/ckswCI5aTKDhv96+Wo9b15HyJxABAmdgr4HuKjM2FVXzgfq7anbgR9vELfuz4tZYrHjPEPvBlR6Qb4v/hk3875xN1EvOI5oiX0zm1hG22Jb49shdbAMgmDUzS0DRoM1BbxK6XIWj7xi+IEH+exMuk3v5u3utC+E9IJKMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-7e92491e750so247125439f.1
        for <linux-usb@vger.kernel.org>; Sat, 08 Jun 2024 17:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717892906; x=1718497706;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tjSd/mQbu7tpbBHvdcZ8g7QffSYT7ae7Efa+kpXZs90=;
        b=Ax4neVqZQE+aVRAQpU2FglYs+GzHIMGEnjwjmknHsnUZU5FjblU8QzNVDHwgykT1Mk
         ciyA3/4UsaAPUMo4vibWwfnbTkVbGhHlM0GBnyJFNGmoH9bDEnPB47dACfyIegbUGN7T
         Pd3Y8PpVlVFq6uWh4bisN+HJmMy1nrKGspdXm3K57jv8nUpIL9qujCS2iDg/9C+mt6Ak
         qkll4/dFddV5DZ84kNHhr6PaGzOCbtUtCISNUaVKIRZkd0293bkWnR0fUWSI5+ueQAkm
         MSByIYy2Yz5HQ5jbYxU+EVCPebJsY4zZS0IvCiQkB5OVRogiJtbXbjTklCYpI/wYzxJk
         hdiA==
X-Forwarded-Encrypted: i=1; AJvYcCUd4saCQbyszsQUtWvhNuwTrcypwvdKK3Ta1mhYDbCsfwmcMQJFw0QpKhifoZkkp4NL2VQl0GJedXC5auq4HnEF30IpFIjjdqh8
X-Gm-Message-State: AOJu0YwTFtLWyTNSaTpAbg5e8IZqFjXFuia49b5p92HxbK/vjQDCgsxW
	R1bCN7p07RF5oAyQkMB2xNb/knX1LYEJ0AozW7rkloD8MtWgAxZzlCuTpAskjaGl/+W+q/+Qdg9
	+t/x4Zvx51BTVBnE/OTPrGOtcnASUPZj7xsK2w+TSImwUddA6BWCFpJA=
X-Google-Smtp-Source: AGHT+IFuuiZW/vtOjVZzzKuNpot5s5YMUblKeXMxi26BsDQBuOBDrUz89HPVX+3MGQuUsnI9teLh1LxyKXypIfeksLH/9heNiKx/
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1548:b0:7eb:7e0c:d198 with SMTP id
 ca18e2360f4ac-7eb7e0cd405mr1758339f.2.1717892906467; Sat, 08 Jun 2024
 17:28:26 -0700 (PDT)
Date: Sat, 08 Jun 2024 17:28:26 -0700
In-Reply-To: <000000000000b1093b0608ff6979@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000073d54b061a6a1c65@google.com>
Subject: Re: [syzbot] [usb?] INFO: rcu detected stall in raw_ioctl
From: syzbot <syzbot+5f996b83575ef4058638@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    8867bbd4a056 mm: arm64: Fix the out-of-bounds issue in con..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=10961932980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3b4350cf56c61c80
dashboard link: https://syzkaller.appspot.com/bug?extid=5f996b83575ef4058638
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15be6dce980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=101ca30a980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6ea21f50498b/disk-8867bbd4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e2fed09364aa/vmlinux-8867bbd4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4860173c7a18/Image-8867bbd4.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5f996b83575ef4058638@syzkaller.appspotmail.com

cdc_wdm 1-1:1.0: nonzero urb status received: -71
cdc_wdm 1-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 1-1:1.0: nonzero urb status received: -71
cdc_wdm 1-1:1.0: wdm_int_callback - 0 bytes
watchdog: BUG: soft lockup - CPU#0 stuck for 26s! [syz-executor782:6625]
CPU#0 Utilization every 4s during lockup:
	#1:  98% system,	  0% softirq,	  3% hardirq,	  0% idle
	#2:  98% system,	  0% softirq,	  3% hardirq,	  0% idle
	#3:  98% system,	  0% softirq,	  3% hardirq,	  0% idle
	#4:  98% system,	  0% softirq,	  3% hardirq,	  0% idle
	#5:  98% system,	  1% softirq,	  3% hardirq,	  0% idle
Modules linked in:
irq event stamp: 73096
hardirqs last  enabled at (73095): [<ffff80008037bc00>] console_emit_next_record kernel/printk/printk.c:2935 [inline]
hardirqs last  enabled at (73095): [<ffff80008037bc00>] console_flush_all+0x650/0xb74 kernel/printk/printk.c:2994
hardirqs last disabled at (73096): [<ffff80008af10b00>] __el1_irq arch/arm64/kernel/entry-common.c:533 [inline]
hardirqs last disabled at (73096): [<ffff80008af10b00>] el1_interrupt+0x24/0x68 arch/arm64/kernel/entry-common.c:551
softirqs last  enabled at (73048): [<ffff8000801ea530>] softirq_handle_end kernel/softirq.c:400 [inline]
softirqs last  enabled at (73048): [<ffff8000801ea530>] handle_softirqs+0xa60/0xc34 kernel/softirq.c:582
softirqs last disabled at (73043): [<ffff800080020de8>] __do_softirq+0x14/0x20 kernel/softirq.c:588
CPU: 0 PID: 6625 Comm: syz-executor782 Tainted: G        W          6.10.0-rc2-syzkaller-g8867bbd4a056 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/02/2024
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __daif_local_irq_restore arch/arm64/include/asm/irqflags.h:176 [inline]
pc : arch_local_irq_restore arch/arm64/include/asm/irqflags.h:195 [inline]
pc : console_emit_next_record kernel/printk/printk.c:2935 [inline]
pc : console_flush_all+0x67c/0xb74 kernel/printk/printk.c:2994
lr : console_emit_next_record kernel/printk/printk.c:2935 [inline]
lr : console_flush_all+0x678/0xb74 kernel/printk/printk.c:2994
sp : ffff800097d67380
x29: ffff800097d67480 x28: ffff800097d67530 x27: 0000000000000001
x26: ffff80009090b530 x25: ffff80009090b520 x24: dfff800000000000
x23: 1ffff000121216af x22: dfff800000000000 x21: ffff80009090b578
x20: 0000000000000000 x19: 00000000000000c0 x18: ffff800097d672b8
x17: 6965636572207375 x16: ffff80008033878c x15: 0000000000000001
x14: 1ffff00011e379c8 x13: 0000000000000000 x12: 0000000000000003
x11: 0000000000000001 x10: 0000000000ff0100 x9 : 0000000000000000
x8 : ffff0000cdc05ac0 x7 : ffff800080381d44 x6 : 0000000000000000
x5 : 0000000000000001 x4 : 0000000000000001 x3 : 0000000000000000
x2 : 0000000000000006 x1 : 0000000000000080 x0 : 0000000000000000
Call trace:
 __daif_local_irq_restore arch/arm64/include/asm/irqflags.h:175 [inline]
 arch_local_irq_restore arch/arm64/include/asm/irqflags.h:195 [inline]
 console_emit_next_record kernel/printk/printk.c:2935 [inline]
 console_flush_all+0x67c/0xb74 kernel/printk/printk.c:2994
 console_unlock+0xec/0x3d4 kernel/printk/printk.c:3063
 vprintk_emit+0x1ec/0x350 kernel/printk/printk.c:2345
 vprintk_default+0xa0/0xe4 kernel/printk/printk.c:2360
 vprintk+0x200/0x2d4 kernel/printk/printk_safe.c:45
 _printk+0xdc/0x128 kernel/printk/printk.c:2370
 usb_gadget_register_driver_owner+0x1f0/0x224 drivers/usb/gadget/udc/core.c:1711
 raw_ioctl_run drivers/usb/gadget/legacy/raw_gadget.c:595 [inline]
 raw_ioctl+0x10c0/0x33bc drivers/usb/gadget/legacy/raw_gadget.c:1306
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl fs/ioctl.c:893 [inline]
 __arm64_sys_ioctl+0x14c/0x1c8 fs/ioctl.c:893
 __invoke_syscall arch/arm64/kernel/syscall.c:34 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:48
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:133
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:152
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:712
 el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

