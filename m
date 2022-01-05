Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78BEA485236
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jan 2022 13:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239930AbiAEMEV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jan 2022 07:04:21 -0500
Received: from mail-il1-f200.google.com ([209.85.166.200]:33461 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239925AbiAEMEV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jan 2022 07:04:21 -0500
Received: by mail-il1-f200.google.com with SMTP id q12-20020a056e0220ec00b002b4dfeb7b27so19612049ilv.0
        for <linux-usb@vger.kernel.org>; Wed, 05 Jan 2022 04:04:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=vlosiNkLfvR5wFR8TE+UyXMuDj/qYsdFOTsef1bsPDY=;
        b=teKo4f7eg5+c219D4Za9wTzGOfgVIwh4bql4uATEUlPbfL/akFrWstRIXQfT3T8fZc
         W75BomAinVfHFNGwXNBNiGaG2EVUi6AJxQ4HraNUp+FiovvDhYt5qgRJuz8L/qhfcPnX
         XQd5NoBpV6WqUpCzXOUfSIchdIW3cyuQZhw9Hz4Vq1JIRkCVQKsrChs1HvR2h5+WlyeF
         TxI/yoXOBpc2glGDESWmeuF17mH1VPyCdJkOUg2SVOZ7FnfK7N6Rb99bHJw54ncTm9n6
         EoJpzQDEFgsX0ZvQBtJaXGmggKrkjmeJRnCvywlU9KyQ7YEdkkMqGJxbirItQlmmkUY+
         tQVQ==
X-Gm-Message-State: AOAM533Gfs1hQZZ1ichjlbXPCVJ4BE6UlrnPw/7MfXU6XBg3IxLY6A2J
        fUuMzRKSYGFqxVzI/OpwO1iWFp7+La8qdVw34uXwYF0jC2Pv
X-Google-Smtp-Source: ABdhPJyMTyM54skcRggviO4qzMc1f3d5yRrSmguwztxsHvvTv5T5FnnyD1crPPg10YPD68gbQiLbXAosYdSfSZzctvOwGxJDT7MZ
MIME-Version: 1.0
X-Received: by 2002:a05:6638:160d:: with SMTP id x13mr24582724jas.120.1641384260891;
 Wed, 05 Jan 2022 04:04:20 -0800 (PST)
Date:   Wed, 05 Jan 2022 04:04:20 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cf7a2405d4d48d3b@google.com>
Subject: [syzbot] KMSAN: uninit-value in ax88178_reset
From:   syzbot <syzbot+6ca9f7867b77c2d316ac@syzkaller.appspotmail.com>
To:     andrew@lunn.ch, davem@davemloft.net, glider@google.com,
        kuba@kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux@rempel-privat.de,
        netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    b0a8b5053e8b kmsan: core: add dependency on DEBUG_KERNEL
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=159cf693b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=46a956fc7a887c60
dashboard link: https://syzkaller.appspot.com/bug?extid=6ca9f7867b77c2d316ac
compiler:       clang version 14.0.0 (/usr/local/google/src/llvm-git-monorepo 2b554920f11c8b763cd9ed9003f4e19b919b8e1f), GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14413193b00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=127716a3b00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6ca9f7867b77c2d316ac@syzkaller.appspotmail.com

asix 1-1:0.0 eth1: Failed to read reg index 0x0000: -32
asix 1-1:0.0 eth1: Failed to read reg index 0x0000: -32
=====================================================
BUG: KMSAN: uninit-value in ax88178_reset+0xfd2/0x1590 drivers/net/usb/asix_devices.c:946 drivers/net/usb/asix_devices.c:946
 ax88178_reset+0xfd2/0x1590 drivers/net/usb/asix_devices.c:946 drivers/net/usb/asix_devices.c:946
 usbnet_open+0x16d/0x1940 drivers/net/usb/usbnet.c:894 drivers/net/usb/usbnet.c:894
 __dev_open+0x920/0xb90 net/core/dev.c:1490 net/core/dev.c:1490
 __dev_change_flags+0x4da/0xd40 net/core/dev.c:8796 net/core/dev.c:8796
 dev_change_flags+0xf5/0x280 net/core/dev.c:8867 net/core/dev.c:8867
 devinet_ioctl+0xfc1/0x3060 net/ipv4/devinet.c:1144 net/ipv4/devinet.c:1144
 inet_ioctl+0x59f/0x820 net/ipv4/af_inet.c:969 net/ipv4/af_inet.c:969
 sock_do_ioctl net/socket.c:1118 [inline]
 sock_do_ioctl net/socket.c:1118 [inline] net/socket.c:1235
 sock_ioctl+0xa3f/0x13d0 net/socket.c:1235 net/socket.c:1235
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]
 vfs_ioctl fs/ioctl.c:51 [inline] fs/ioctl.c:860
 __do_sys_ioctl fs/ioctl.c:874 [inline] fs/ioctl.c:860
 __se_sys_ioctl+0x2df/0x4a0 fs/ioctl.c:860 fs/ioctl.c:860
 __x64_sys_ioctl+0xd8/0x110 fs/ioctl.c:860 fs/ioctl.c:860
 do_syscall_x64 arch/x86/entry/common.c:51 [inline]
 do_syscall_x64 arch/x86/entry/common.c:51 [inline] arch/x86/entry/common.c:82
 do_syscall_64+0x54/0xd0 arch/x86/entry/common.c:82 arch/x86/entry/common.c:82
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Local variable status created at:
 ax88178_reset+0x69/0x1590
 usbnet_open+0x16d/0x1940 drivers/net/usb/usbnet.c:894 drivers/net/usb/usbnet.c:894

CPU: 1 PID: 3057 Comm: dhcpcd Not tainted 5.16.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
=====================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
