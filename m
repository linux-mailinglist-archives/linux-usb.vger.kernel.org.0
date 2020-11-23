Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C22152C13D2
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 20:09:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389168AbgKWSoI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 13:44:08 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:42804 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729528AbgKWSoH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Nov 2020 13:44:07 -0500
Received: by mail-il1-f198.google.com with SMTP id t14so14778006ilg.9
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2020 10:44:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=Y7OXxGuhTNSLjHgBwnMPkQNQXPV8jo1HjwxEZT4e6RI=;
        b=iPKF8c99IEnE/fIWAF1bsfv8uPR6svCeI2HZGGAoPhRIIriC5CBEYLlE7ba+ZfIhQK
         /XqCsqY/2UW4fNg2+y36enj4DL1O7UcA9u6m3ddxRT4yyLLQq7ZG6zX328oN1BzH+Wj1
         E8gAiaQvFowwxPCyyC+h+kOYmI+pdgNNFiRBy5YkIC3EDMYtvlM68iEvu63zpmEKT6G3
         T6iNlicbVgrYcx8XqCkrKgc/xM4U4O034sd2vKB/39OwCRZbWnmv7CCOG3ZWcn4l4e9t
         2fKjE/QAy69FmfpUIE35v3bCsof02iAkFuE0zSUnLNZFU4AvfFcuSP7V1I6W9+P+sNWU
         F84A==
X-Gm-Message-State: AOAM531i2kDtNTq1lZjGQ54TPE09fBjTv+MY4ml5mUbdNTA0PsDbGW5B
        QR7R58KKEFaGZXC6JzzH7bunSDe1PH1IclLfGzdQftzD8m7h
X-Google-Smtp-Source: ABdhPJzUPe49Pf5zqftMbICWiMg5hxz1uvONaaf2UKjilTNrUpSZLE2ariCLahkjtorhEnG6zXhsQKf4JOT6B800SIy1I/+95n3A
MIME-Version: 1.0
X-Received: by 2002:a02:c881:: with SMTP id m1mr888289jao.86.1606157046221;
 Mon, 23 Nov 2020 10:44:06 -0800 (PST)
Date:   Mon, 23 Nov 2020 10:44:06 -0800
In-Reply-To: <CAAeHK+z0Lb_5zw-fQF6AXLzL=+P6kizOJ7yu=t4SP_5UPK66kg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000031907005b4ca944b@google.com>
Subject: Re: memory leak in hub_event
From:   syzbot <syzbot+44e64397bd81d5e84cba@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
memory leak in rxrpc_lookup_local

write to /proc/sys/kernel/hung_task_check_interval_secs failed: No such file or directory
write to /proc/sys/kernel/softlockup_all_cpu_backtrace failed: No such file or directory
BUG: memory leak
unreferenced object 0xffff888117824d00 (size 256):
  comm "syz-executor.6", pid 8896, jiffies 4294943994 (age 432.900s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 0a 00 00 00 00 00 ad 17 81 88 ff ff  ................
  backtrace:
    [<0000000069b066ee>] kmalloc include/linux/slab.h:552 [inline]
    [<0000000069b066ee>] kzalloc include/linux/slab.h:664 [inline]
    [<0000000069b066ee>] rxrpc_alloc_local net/rxrpc/local_object.c:79 [inline]
    [<0000000069b066ee>] rxrpc_lookup_local+0x1c1/0x760 net/rxrpc/local_object.c:244
    [<0000000085db7132>] rxrpc_bind+0x174/0x240 net/rxrpc/af_rxrpc.c:149
    [<00000000a2a77c59>] afs_open_socket+0xdb/0x200 fs/afs/rxrpc.c:64
    [<0000000086f4a248>] afs_net_init+0x2b4/0x340 fs/afs/main.c:126
    [<00000000fafe7caa>] ops_init+0x4e/0x190 net/core/net_namespace.c:152
    [<00000000c3d26710>] setup_net+0xdb/0x2d0 net/core/net_namespace.c:342
    [<000000001d81d993>] copy_net_ns+0x14b/0x320 net/core/net_namespace.c:483
    [<0000000058b54b80>] create_new_namespaces+0x199/0x4e0 kernel/nsproxy.c:110
    [<00000000cd2a2042>] unshare_nsproxy_namespaces+0x9b/0x120 kernel/nsproxy.c:231
    [<00000000f7907f96>] ksys_unshare+0x2fe/0x5c0 kernel/fork.c:2949
    [<0000000050cbc28c>] __do_sys_unshare kernel/fork.c:3017 [inline]
    [<0000000050cbc28c>] __se_sys_unshare kernel/fork.c:3015 [inline]
    [<0000000050cbc28c>] __x64_sys_unshare+0x12/0x20 kernel/fork.c:3015
    [<00000000ade5a609>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
    [<000000003424d3b0>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff8881182a6700 (size 256):
  comm "syz-executor.2", pid 8885, jiffies 4294943999 (age 432.850s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 0a 00 00 00 00 c0 b7 16 81 88 ff ff  ................
  backtrace:
    [<0000000069b066ee>] kmalloc include/linux/slab.h:552 [inline]
    [<0000000069b066ee>] kzalloc include/linux/slab.h:664 [inline]
    [<0000000069b066ee>] rxrpc_alloc_local net/rxrpc/local_object.c:79 [inline]
    [<0000000069b066ee>] rxrpc_lookup_local+0x1c1/0x760 net/rxrpc/local_object.c:244
    [<0000000085db7132>] rxrpc_bind+0x174/0x240 net/rxrpc/af_rxrpc.c:149
    [<00000000a2a77c59>] afs_open_socket+0xdb/0x200 fs/afs/rxrpc.c:64
    [<0000000086f4a248>] afs_net_init+0x2b4/0x340 fs/afs/main.c:126
    [<00000000fafe7caa>] ops_init+0x4e/0x190 net/core/net_namespace.c:152
    [<00000000c3d26710>] setup_net+0xdb/0x2d0 net/core/net_namespace.c:342
    [<000000001d81d993>] copy_net_ns+0x14b/0x320 net/core/net_namespace.c:483
    [<0000000058b54b80>] create_new_namespaces+0x199/0x4e0 kernel/nsproxy.c:110
    [<00000000cd2a2042>] unshare_nsproxy_namespaces+0x9b/0x120 kernel/nsproxy.c:231
    [<00000000f7907f96>] ksys_unshare+0x2fe/0x5c0 kernel/fork.c:2949
    [<0000000050cbc28c>] __do_sys_unshare kernel/fork.c:3017 [inline]
    [<0000000050cbc28c>] __se_sys_unshare kernel/fork.c:3015 [inline]
    [<0000000050cbc28c>] __x64_sys_unshare+0x12/0x20 kernel/fork.c:3015
    [<00000000ade5a609>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
    [<000000003424d3b0>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff888118395100 (size 256):
  comm "syz-executor.4", pid 8892, jiffies 4294944000 (age 432.840s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 0a 00 00 00 00 00 8b 17 81 88 ff ff  ................
  backtrace:
    [<0000000069b066ee>] kmalloc include/linux/slab.h:552 [inline]
    [<0000000069b066ee>] kzalloc include/linux/slab.h:664 [inline]
    [<0000000069b066ee>] rxrpc_alloc_local net/rxrpc/local_object.c:79 [inline]
    [<0000000069b066ee>] rxrpc_lookup_local+0x1c1/0x760 net/rxrpc/local_object.c:244
    [<0000000085db7132>] rxrpc_bind+0x174/0x240 net/rxrpc/af_rxrpc.c:149
    [<00000000a2a77c59>] afs_open_socket+0xdb/0x200 fs/afs/rxrpc.c:64
    [<0000000086f4a248>] afs_net_init+0x2b4/0x340 fs/afs/main.c:126
    [<00000000fafe7caa>] ops_init+0x4e/0x190 net/core/net_namespace.c:152
    [<00000000c3d26710>] setup_net+0xdb/0x2d0 net/core/net_namespace.c:342
    [<000000001d81d993>] copy_net_ns+0x14b/0x320 net/core/net_namespace.c:483
    [<0000000058b54b80>] create_new_namespaces+0x199/0x4e0 kernel/nsproxy.c:110
    [<00000000cd2a2042>] unshare_nsproxy_namespaces+0x9b/0x120 kernel/nsproxy.c:231
    [<00000000f7907f96>] ksys_unshare+0x2fe/0x5c0 kernel/fork.c:2949
    [<0000000050cbc28c>] __do_sys_unshare kernel/fork.c:3017 [inline]
    [<0000000050cbc28c>] __se_sys_unshare kernel/fork.c:3015 [inline]
    [<0000000050cbc28c>] __x64_sys_unshare+0x12/0x20 kernel/fork.c:3015
    [<00000000ade5a609>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
    [<000000003424d3b0>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff8881116e0f00 (size 256):
  comm "syz-executor.7", pid 8894, jiffies 4294944002 (age 432.820s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 0a 00 00 00 00 00 b9 17 81 88 ff ff  ................
  backtrace:
    [<0000000069b066ee>] kmalloc include/linux/slab.h:552 [inline]
    [<0000000069b066ee>] kzalloc include/linux/slab.h:664 [inline]
    [<0000000069b066ee>] rxrpc_alloc_local net/rxrpc/local_object.c:79 [inline]
    [<0000000069b066ee>] rxrpc_lookup_local+0x1c1/0x760 net/rxrpc/local_object.c:244
    [<0000000085db7132>] rxrpc_bind+0x174/0x240 net/rxrpc/af_rxrpc.c:149
    [<00000000a2a77c59>] afs_open_socket+0xdb/0x200 fs/afs/rxrpc.c:64
    [<0000000086f4a248>] afs_net_init+0x2b4/0x340 fs/afs/main.c:126
    [<00000000fafe7caa>] ops_init+0x4e/0x190 net/core/net_namespace.c:152
    [<00000000c3d26710>] setup_net+0xdb/0x2d0 net/core/net_namespace.c:342
    [<000000001d81d993>] copy_net_ns+0x14b/0x320 net/core/net_namespace.c:483
    [<0000000058b54b80>] create_new_namespaces+0x199/0x4e0 kernel/nsproxy.c:110
    [<00000000cd2a2042>] unshare_nsproxy_namespaces+0x9b/0x120 kernel/nsproxy.c:231
    [<00000000f7907f96>] ksys_unshare+0x2fe/0x5c0 kernel/fork.c:2949
    [<0000000050cbc28c>] __do_sys_unshare kernel/fork.c:3017 [inline]
    [<0000000050cbc28c>] __se_sys_unshare kernel/fork.c:3015 [inline]
    [<0000000050cbc28c>] __x64_sys_unshare+0x12/0x20 kernel/fork.c:3015
    [<00000000ade5a609>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
    [<000000003424d3b0>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

write to /proc/sys/kernel/hung_task_check_interval_secs failed: No such file or directory
write to /proc/sys/kernel/softlockup_all_cpu_backtrace failed: No such file or directory


Tested on:

commit:         4d02da97 Merge tag 'net-5.10-rc5' of git://git.kernel.org/..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=134bda0d500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b29e92cdfa2687df
dashboard link: https://syzkaller.appspot.com/bug?extid=44e64397bd81d5e84cba
compiler:       gcc (GCC) 10.1.0-syz 20200507
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10d4463e500000

