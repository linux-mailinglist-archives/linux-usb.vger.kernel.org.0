Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 620D1455F55
	for <lists+linux-usb@lfdr.de>; Thu, 18 Nov 2021 16:24:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbhKRP1P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Nov 2021 10:27:15 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:46931 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbhKRP1O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Nov 2021 10:27:14 -0500
Received: by mail-io1-f72.google.com with SMTP id z21-20020a5e8615000000b005e22e531c8aso3767119ioj.13
        for <linux-usb@vger.kernel.org>; Thu, 18 Nov 2021 07:24:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=noJhi/+e3YpnC2eEs5maq9hXsDixSWcA5gKwo/+amVE=;
        b=45yvKCvnvSPsd8e5ZQpJI1eNMhrmCccwK6Rel0kX6lezuGgkKKLQGTaSe9mrvfERHL
         MiKKWvys1xuuyEVMiwP3kgmSGUhzkCjHJoFVvBcy9EmiQQdH4qnl3bB2LLtaf+WOEzTG
         Hj4GBzrmogQrP7DOFO0vfpDa3ROl4acQ/lItZSiodyXJTDVKgsBJEqN4lysz4ZLXG2rJ
         W3IIfEb+CncRDpnHiJF+gIf0ThbnCsUL68t8tG/8V2CRKynKBFT2R3OfRgpjwkLp47td
         y7/eXmGewdik25ykzhfk+3+yAits10SFEENpgJy00tmHxIWrKreTab0PsXYIj5UnyfJq
         CZDg==
X-Gm-Message-State: AOAM5318aOmBBe0jW0mqZHnUtzrHgNKQT2S1RSFCC9LAqH9+nzjRygq1
        kUqShr5cf00DtoMQACAtDOdWQyx97h5HaKMtfuE3OcdosIbA
X-Google-Smtp-Source: ABdhPJyP93EKehJWrToQV5/y4M/6GexH1l5sq1yTYSbAoi7DlCvYlUZHZproV6llznzwunfRc59drI/TxurMGuTQVZpE3rpXCueA
MIME-Version: 1.0
X-Received: by 2002:a02:a91a:: with SMTP id n26mr21389261jam.46.1637249053511;
 Thu, 18 Nov 2021 07:24:13 -0800 (PST)
Date:   Thu, 18 Nov 2021 07:24:13 -0800
In-Reply-To: <89b4d11e-8e00-c78f-7b5a-5f77c1291088@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003e55ec05d111c07b@google.com>
Subject: Re: [syzbot] WARNING in usbnet_start_xmit/usb_submit_urb
From:   syzbot <syzbot+63ee658b9a100ffadbe2@syzkaller.appspotmail.com>
To:     kuba@kernel.org, linux-usb@vger.kernel.org, oneukum@suse.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in usbnet_start_xmit/usb_submit_urb

------------[ cut here ]------------
usb 4-1: BOGUS urb xfer, pipe 3 != type 1
WARNING: CPU: 0 PID: 710 at drivers/usb/core/urb.c:502 usb_submit_urb+0xed2/0x18a0 drivers/usb/core/urb.c:502
Modules linked in:
CPU: 0 PID: 710 Comm: kworker/0:2 Not tainted 5.15.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: mld mld_ifc_work
RIP: 0010:usb_submit_urb+0xed2/0x18a0 drivers/usb/core/urb.c:502
Code: 7c 24 18 e8 a0 32 aa fd 48 8b 7c 24 18 e8 26 2b 1a ff 41 89 d8 44 89 e1 4c 89 ea 48 89 c6 48 c7 c7 80 c1 85 86 e8 45 5e 03 02 <0f> 0b e9 58 f8 ff ff e8 72 32 aa fd 48 81 c5 80 06 00 00 e9 84 f7
RSP: 0018:ffffc90001da7580 EFLAGS: 00010086
RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
RDX: ffff88810d383800 RSI: ffffffff812bae18 RDI: fffff520003b4ea2
RBP: ffff888114c89800 R08: 0000000000000000 R09: 0000000000000000
R10: ffffffff812b4bfe R11: 0000000000000000 R12: 0000000000000003
R13: ffff8881045d2370 R14: 0000000000000003 R15: ffff888122f7c600
FS:  0000000000000000(0000) GS:ffff8881f6800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f3d0eb50ff8 CR3: 0000000117af8000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 usbnet_start_xmit+0x5ed/0x1f70 drivers/net/usb/usbnet.c:1464
 __netdev_start_xmit include/linux/netdevice.h:4987 [inline]
 netdev_start_xmit include/linux/netdevice.h:5001 [inline]
 xmit_one net/core/dev.c:3590 [inline]
 dev_hard_start_xmit+0x1eb/0x920 net/core/dev.c:3606
 sch_direct_xmit+0x25b/0x790 net/sched/sch_generic.c:342
 __dev_xmit_skb net/core/dev.c:3817 [inline]
 __dev_queue_xmit+0x11bf/0x31d0 net/core/dev.c:4194
 neigh_resolve_output net/core/neighbour.c:1523 [inline]
 neigh_resolve_output+0x50e/0x820 net/core/neighbour.c:1503
 neigh_output include/net/neighbour.h:527 [inline]
 ip6_finish_output2+0xb49/0x1af0 net/ipv6/ip6_output.c:126
 __ip6_finish_output.part.0+0x387/0xbb0 net/ipv6/ip6_output.c:191
 __ip6_finish_output include/linux/skbuff.h:986 [inline]
 ip6_finish_output net/ipv6/ip6_output.c:201 [inline]
 NF_HOOK_COND include/linux/netfilter.h:296 [inline]
 ip6_output+0x3d2/0x810 net/ipv6/ip6_output.c:224
 dst_output include/net/dst.h:450 [inline]
 NF_HOOK include/linux/netfilter.h:307 [inline]
 NF_HOOK include/linux/netfilter.h:301 [inline]
 mld_sendpack+0x96d/0xe00 net/ipv6/mcast.c:1826
 mld_send_cr net/ipv6/mcast.c:2127 [inline]
 mld_ifc_work+0x71c/0xdc0 net/ipv6/mcast.c:2659
 process_one_work+0x9b2/0x1690 kernel/workqueue.c:2298
 worker_thread+0x658/0x11f0 kernel/workqueue.c:2445
 kthread+0x40b/0x500 kernel/kthread.c:327
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
 </TASK>


Tested on:

commit:         048ff862 Merge tag 'usb-5.16-rc1' of git://git.kernel...
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1105444eb00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d6b387bc5d3e50f3
dashboard link: https://syzkaller.appspot.com/bug?extid=63ee658b9a100ffadbe2
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1004939eb00000

