Return-Path: <linux-usb+bounces-11345-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBDA9098EB
	for <lists+linux-usb@lfdr.de>; Sat, 15 Jun 2024 17:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 294901F21AA2
	for <lists+linux-usb@lfdr.de>; Sat, 15 Jun 2024 15:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C50344AED4;
	Sat, 15 Jun 2024 15:27:20 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082CD4963A
	for <linux-usb@vger.kernel.org>; Sat, 15 Jun 2024 15:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718465240; cv=none; b=IOBF39iCxMJvntILeoGSZF+rfns/ICfYYmNxqJLTkMA+RGf3xb7/BYTHWm+OELH8puIpSjJ2f17jHLEi9DCMFUfTVmMMCMqTghTMxNXx31AY6sEEQGdkpr21CVTOmPS3yy7xZmWOO5FtR2xQuUQFrBmC7jCdl0bH2Tq6oUIEwoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718465240; c=relaxed/simple;
	bh=KLmwnTp5/uLSTrRQsi8bP+Cfvy4rYnzOll7HQ8+mxzw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=IIDdUKLqKU1WqcVR5WauwWh1ltLOn0ILhHHB4WwzQZMEzl5LMLnh+ZmHEevurbMDK/uv+RROwWzVMufnK89r5yXNw9uVrei+GczJZtvNz6tZOhnJoPXnHjYg/TbVcYNLnZ4+ORVebrlr7vb/sLfhSYHtrAr94uxioJizXXL5IWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-375e4d55457so17236665ab.0
        for <linux-usb@vger.kernel.org>; Sat, 15 Jun 2024 08:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718465238; x=1719070038;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8+9tTVxFZusiaA47yPp0vC08EjPeT2WvhoYv6sS5kiE=;
        b=nqnbg8ETG+uTBnett8xXkAntoGSA21FUGePpyGMnvyytalQLPsloCCnD2jNdDld70I
         Ndf1VnkNju3JTccvLwUK7z0ahFArJ4ZMHbrcWmp0vfXnSGhVCVpHO8cUhobMaTxSVW89
         4oR+B+XrycKpnZ+XZOXzkQB29Oyk1VKItZ0ILV+HT3x1mkhauZbb1WHI0tTnC4BYqhZ9
         K04GxCTlgY8qpxLkANqaOT4wfLJ2K1jOXr4CJ4v9wq/SA2w8OGrKU3QQuQikEr3LPHu3
         HYhMoKDfyi3RtinlgyalEE4Q4GPN3eZT4yVpPjCcW6dh9v8OO28EqR3Ivi7NuaAaWbdN
         omUg==
X-Forwarded-Encrypted: i=1; AJvYcCUSe3qd7QvGmRiazN0+1xSfDUPllWP2N4UR6AXSShyq2U/LnjRGXFY7zFcoUqWq1oiw4mrEO8eIkzFle0zPGPA73+SU0kYjBu3w
X-Gm-Message-State: AOJu0Yyin/+W4cEO3xcvdreB+7kVUrhMdYaBgAOd1vdhZ6W9dmRPhBoo
	weeOdIoDJvkKYvy8O2b6X92IOrmzmmBO9jKbolmHnPBH2VizzveWeyc5/TTz1U9M+kjW+7ct5it
	29RublYus2/0GA1Fc1xtzasVgNti3LGY16Oqgk9tuPyzwc9YaKTIkxNs=
X-Google-Smtp-Source: AGHT+IGJ+voMZpV3ZhKvkkvTOX0i3O+i8IcRA8nGFlcUcLelBIdZhCrzTA1OSHhfAz8nlNsuSTnoXKybfcaTItFRZPnCvplYvFA2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c29:b0:375:9deb:ceb8 with SMTP id
 e9e14a558f8ab-375e1014718mr3264365ab.3.1718465238151; Sat, 15 Jun 2024
 08:27:18 -0700 (PDT)
Date: Sat, 15 Jun 2024 08:27:18 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000014478e061aef5e1e@google.com>
Subject: [syzbot] [net?] [usb?] KMSAN: uninit-value in rtl8150_get_link_ksettings
From: syzbot <syzbot+2a7bab173edebd242de7@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, petkan@nucleusys.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    101b7a97143a Merge tag 'acpi-6.10-rc1' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=120871ca980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7ac2f8c387a23814
dashboard link: https://syzkaller.appspot.com/bug?extid=2a7bab173edebd242de7
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4f673334a91c/disk-101b7a97.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8e6db59f4091/vmlinux-101b7a97.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7e5782387c9d/bzImage-101b7a97.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2a7bab173edebd242de7@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in rtl8150_get_link_ksettings+0x3d0/0x420 drivers/net/usb/rtl8150.c:794
 rtl8150_get_link_ksettings+0x3d0/0x420 drivers/net/usb/rtl8150.c:794
 __ethtool_get_link_ksettings+0x17d/0x270 net/ethtool/ioctl.c:445
 linkinfo_prepare_data+0xe2/0x290 net/ethtool/linkinfo.c:37
 ethnl_default_dump_one net/ethtool/netlink.c:460 [inline]
 ethnl_default_dumpit+0x458/0xd80 net/ethtool/netlink.c:494
 genl_dumpit+0x19d/0x290 net/netlink/genetlink.c:1025
 netlink_dump+0xa05/0x15b0 net/netlink/af_netlink.c:2269
 __netlink_dump_start+0xb3a/0xce0 net/netlink/af_netlink.c:2386
 genl_family_rcv_msg_dumpit net/netlink/genetlink.c:1074 [inline]
 genl_family_rcv_msg net/netlink/genetlink.c:1190 [inline]
 genl_rcv_msg+0x106d/0x12c0 net/netlink/genetlink.c:1208
 netlink_rcv_skb+0x375/0x650 net/netlink/af_netlink.c:2559
 genl_rcv+0x40/0x60 net/netlink/genetlink.c:1217
 netlink_unicast_kernel net/netlink/af_netlink.c:1335 [inline]
 netlink_unicast+0xf4c/0x1260 net/netlink/af_netlink.c:1361
 netlink_sendmsg+0x10df/0x11f0 net/netlink/af_netlink.c:1905
 sock_sendmsg_nosec net/socket.c:730 [inline]
 __sock_sendmsg+0x30f/0x380 net/socket.c:745
 ____sys_sendmsg+0x877/0xb60 net/socket.c:2584
 ___sys_sendmsg+0x28d/0x3c0 net/socket.c:2638
 __sys_sendmsg+0x225/0x3c0 net/socket.c:2667
 __compat_sys_sendmsg net/compat.c:346 [inline]
 __do_compat_sys_sendmsg net/compat.c:353 [inline]
 __se_compat_sys_sendmsg net/compat.c:350 [inline]
 __ia32_compat_sys_sendmsg+0x9d/0xe0 net/compat.c:350
 ia32_sys_call+0x209f/0x40a0 arch/x86/include/generated/asm/syscalls_32.h:371
 do_syscall_32_irqs_on arch/x86/entry/common.c:165 [inline]
 __do_fast_syscall_32+0xb4/0x120 arch/x86/entry/common.c:386
 do_fast_syscall_32+0x38/0x80 arch/x86/entry/common.c:411
 do_SYSENTER_32+0x1f/0x30 arch/x86/entry/common.c:449
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e

Local variable bmcr created at:
 rtl8150_get_link_ksettings+0x52/0x420
 __ethtool_get_link_ksettings+0x17d/0x270 net/ethtool/ioctl.c:445

CPU: 1 PID: 18500 Comm: syz-executor.1 Not tainted 6.9.0-syzkaller-02339-g101b7a97143a #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/02/2024
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

