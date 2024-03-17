Return-Path: <linux-usb+bounces-8020-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EFB87DD7B
	for <lists+linux-usb@lfdr.de>; Sun, 17 Mar 2024 15:43:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2F6A1C20921
	for <lists+linux-usb@lfdr.de>; Sun, 17 Mar 2024 14:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102841BC5C;
	Sun, 17 Mar 2024 14:43:24 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4548C610C
	for <linux-usb@vger.kernel.org>; Sun, 17 Mar 2024 14:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710686603; cv=none; b=NZaK1u4PvrTWdePSCAOSEw0doNXIB8fC3sP5Dn//vf8wjSuTpmvSMIXhbsoq3DWMODv7GqiMHsk8hpdZ5v30KLvYyhiJORu/6RaMyTalgc5m/fU9njBTo6fxfUPI3zAni4lFxykViCOX+vYarLLAks2Gf9mcZNeaL43SoSACJcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710686603; c=relaxed/simple;
	bh=1piAQqG5obqShU/tUMwPYZPnHvv1aBkmLwwk6AvgoCY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Q23YTyZqE/fjT1EAcvZAaj3sd58RDElUB0u7BwDw4bUyYNUKRe/WLcwNikp8fQZkYrKC3Pf65c7xR5LNsXQ8QJdo8LwQA2nBiPtfKGqlIojTA4d9ECmHnuTfLHiRjEHDaK7ex0BY4r0LBO6jIMVtapy6NmFWoLKQwxtk9RZp3tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-7c7c9831579so332093739f.0
        for <linux-usb@vger.kernel.org>; Sun, 17 Mar 2024 07:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710686601; x=1711291401;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EAJU0QC5hMGmQr0QLfhlk49w7WSutZvWX1XUq5wil+k=;
        b=kHn/QyuGm360rePIbLwm2WXXjQAi2zaZfRlpebae+tCskI4N5jNq3TGM+qIn2dg9wY
         kDfl6ViDCPg2YUKXpNhfPsXo5QCcj9lNDJE6R4TfdyXRBB7ef/V+KJg/B1150cQJdC6I
         Te0siQxNb5aIerLo38TB6PJySXCODYhp4JBfaZwWvRNyppMR/jZ+aJJfBdlZxNafCcI7
         mEZXyUgJKEGIWjqo1RweV7FPWvbWLjL1D8B7Ozsn76Xe4sHr23dqCzzcoybkNztoKhkV
         IIpJlu9/hK1ZM5ovuN45LRFxKAEZMWEplaCHMNsCVA2Q1wtGagwBAZHM6pm4kPT/6ii+
         8PZA==
X-Forwarded-Encrypted: i=1; AJvYcCWHaPJb2QxukE5O8RUekx6Ut5GKl6RxNC6j/HVB7e14+vMlb64sk/D4CLIiHCYf1sayWkML6D8NmKCtAgKmwMZnQ1URmGAlzY23
X-Gm-Message-State: AOJu0YwVos+vkxFpSQIMUkZ7VAX5gy6qO5bUcvRQ1Q7tyed7rfCMqvBy
	PlChlROZ/w5lRFMmH/pDiT+Q7EtmpZz/OlXdXH4JkGXdwlCbVA4hXwvB8l6HTXxJDbZVP+6i3Aj
	33RBuRQYbK9Cpk4PEL0fx+9W6Mrf0RrzJhPCD+VItak1JZ7Y7gJWkI8Q=
X-Google-Smtp-Source: AGHT+IHh2M0Mtf5+8D6PFC3HYzJ3ck0RwGR4c9+KUw9MeDUm+enscKt4yf2gm2VE0XjStr8NaE5cLsnw4ObheM+8Znuyhv/c3b45
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:3709:b0:476:f2cb:8790 with SMTP id
 k9-20020a056638370900b00476f2cb8790mr535297jav.0.1710686601500; Sun, 17 Mar
 2024 07:43:21 -0700 (PDT)
Date: Sun, 17 Mar 2024 07:43:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000346bbd0613dc4396@google.com>
Subject: [syzbot] [usb?] WARNING in usbnet_start_xmit/usb_submit_urb (2)
From: syzbot <syzbot+d693c07c6f647e0388d3@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, oneukum@suse.com, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d99e42ce6b83 Merge tag 'usb-serial-6.9-rc1' of https://git..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=111aa901180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dd8c589043bc2b49
dashboard link: https://syzkaller.appspot.com/bug?extid=d693c07c6f647e0388d3
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1248049e180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14bbf9fa180000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/69f01028417d/disk-d99e42ce.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b4624715c637/vmlinux-d99e42ce.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0a940dfca61e/bzImage-d99e42ce.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d693c07c6f647e0388d3@syzkaller.appspotmail.com

------------[ cut here ]------------
usb 3-1: BOGUS urb xfer, pipe 3 != type 1
WARNING: CPU: 1 PID: 2507 at drivers/usb/core/urb.c:503 usb_submit_urb+0xe47/0x1730 drivers/usb/core/urb.c:503
Modules linked in:
CPU: 1 PID: 2507 Comm: kworker/1:5 Not tainted 6.8.0-rc6-syzkaller-00189-gd99e42ce6b83 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/29/2024
Workqueue: mld mld_ifc_work
RIP: 0010:usb_submit_urb+0xe47/0x1730 drivers/usb/core/urb.c:503
Code: 84 3c 02 00 00 e8 59 ba 43 fd 4c 89 ef e8 61 16 07 ff 45 89 e0 89 e9 4c 89 f2 48 89 c6 48 c7 c7 a0 37 f0 86 e8 0a 46 0d fd 90 <0f> 0b 90 90 e9 ed f8 ff ff e8 2b ba 43 fd 49 81 c4 b8 05 00 00 e9
RSP: 0018:ffffc9000157f308 EFLAGS: 00010082
RAX: 0000000000000000 RBX: ffff8881123c3000 RCX: ffffffff81177339
RDX: ffff888115e8d700 RSI: ffffffff81177346 RDI: 0000000000000001
RBP: 0000000000000003 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000001
R13: ffff888120fb00a8 R14: ffff888103eeb240 R15: ffff8881123c307c
FS:  0000000000000000(0000) GS:ffff8881f6700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f4293372238 CR3: 00000001227c5000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 usbnet_start_xmit+0x693/0x2440 drivers/net/usb/usbnet.c:1453
 __netdev_start_xmit include/linux/netdevice.h:4989 [inline]
 netdev_start_xmit include/linux/netdevice.h:5003 [inline]
 xmit_one net/core/dev.c:3547 [inline]
 dev_hard_start_xmit+0x137/0x6d0 net/core/dev.c:3563
 sch_direct_xmit+0x18e/0x830 net/sched/sch_generic.c:342
 __dev_xmit_skb net/core/dev.c:3776 [inline]
 __dev_queue_xmit+0x12b2/0x3ed0 net/core/dev.c:4317
 dev_queue_xmit include/linux/netdevice.h:3171 [inline]
 neigh_resolve_output net/core/neighbour.c:1563 [inline]
 neigh_resolve_output+0x582/0x8f0 net/core/neighbour.c:1543
 neigh_output include/net/neighbour.h:542 [inline]
 ip6_finish_output2+0xad9/0x22b0 net/ipv6/ip6_output.c:137
 __ip6_finish_output+0x3a5/0xbc0 net/ipv6/ip6_output.c:211
 ip6_finish_output net/ipv6/ip6_output.c:222 [inline]
 NF_HOOK_COND include/linux/netfilter.h:303 [inline]
 ip6_output+0x23a/0x8c0 net/ipv6/ip6_output.c:243
 dst_output include/net/dst.h:451 [inline]
 NF_HOOK.constprop.0+0xff/0x570 include/linux/netfilter.h:314
 mld_sendpack+0x6e6/0xd10 net/ipv6/mcast.c:1818
 mld_send_cr net/ipv6/mcast.c:2119 [inline]
 mld_ifc_work+0x756/0xcd0 net/ipv6/mcast.c:2650
 process_one_work+0x886/0x15d0 kernel/workqueue.c:2633
 process_scheduled_works kernel/workqueue.c:2706 [inline]
 worker_thread+0x8b9/0x1290 kernel/workqueue.c:2787
 kthread+0x2c6/0x3a0 kernel/kthread.c:388
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:243
 </TASK>


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

