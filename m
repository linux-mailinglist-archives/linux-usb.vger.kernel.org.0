Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFA02B947A
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2019 17:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404485AbfITPwU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Sep 2019 11:52:20 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34159 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404366AbfITPwU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Sep 2019 11:52:20 -0400
Received: by mail-pf1-f193.google.com with SMTP id b128so4809056pfa.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2019 08:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6wvEOmwOEcZ49FFGK9qnRLbvko/xufe/W/eA5BYL058=;
        b=q3wbxwPdMMlC9bfXpwiwY3HG8Kn4lhezKrR/ZYi99YDSahMR9SCVikMbFWg4Rd7ar9
         ymf5yubkoGb8vlcXDpTnRnKQAnefZOuql/8o/TsmAqMQsFokMpSOZsUN61NtFr/mMHUW
         xWdTBkWiYGQMzgm+J9PKrVDlCQrNJKdQO/dWiJsxqCz9P8Dout5AM6jIgeIrdasbN4+a
         t1HS2q13bIxlazCr7V5Tbp26aavvKhZG4ovjeOnJ9YGmuvJOK3eRSLVVCqOj4v4QKGFs
         tg31ois0rjgJjb8Hu8Iv196wmgM4iS+Mf9NHnSqw4DKzwp+Ug5yY+l72oXEsAlikZ0qV
         hKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6wvEOmwOEcZ49FFGK9qnRLbvko/xufe/W/eA5BYL058=;
        b=CmjovA0R4zhuDDlcoIq9h/S3OA1QQnATDGHsAJXDn8bnmQ8SM4DXgx/q8o2kFAJ2Yu
         DST1G1raZOVNCUeSoSkWNH4Br30s1NCcWo9g+TKV+E+H84NolSw+fLaBbOVVdsyCBACS
         1/x5uEaZ0lVqyyU6uIBNso3D5Xhjpm3bzgD7XvQQZv0fASkm0T4cJaxLjUwr8SLewjEI
         Jgd7yvYlg13hJGue3I2eqAshcjxjaHRX1ylw3OTX/dSoAFubZDC3DtUGhxkjU5aP1bOa
         N4VhSB6nm0fZmavTFt5g/0Jc333RdOpYvV83Vp2NSfEU1dDka3e386/qEQR+1wxL56CJ
         yvYA==
X-Gm-Message-State: APjAAAW7fhTbW7RZiixf1nozhzMbY50C1ceAksTKM7Wc0b9zelXdfvzw
        a09xCHKgyavYmih/Ve3o0Q5ZyWE/hXbfdRo+bCq4lA==
X-Google-Smtp-Source: APXvYqyRG7I6bo+Vh0DYqw6zU79dbfBvMTaH8Cuuuo9DV08tKLdkUOvpwyoFsCX/kpu23mP+jTtxBvjlkczLxeVw0KM=
X-Received: by 2002:a17:90a:c255:: with SMTP id d21mr5540380pjx.129.1568994738851;
 Fri, 20 Sep 2019 08:52:18 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000047e8e70592ebfd00@google.com>
In-Reply-To: <00000000000047e8e70592ebfd00@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 20 Sep 2019 17:52:07 +0200
Message-ID: <CAAeHK+y5k9xDr-=RO=aoFycw-ceR_ev6EnrkrAX1_7YWs+FRyw@mail.gmail.com>
Subject: Re: general protection fault in close_rio
To:     syzbot <syzbot+ffb8ab77a232a91eb24d@syzkaller.appspotmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 19, 2019 at 8:19 PM syzbot
<syzbot+ffb8ab77a232a91eb24d@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    e0bd8d79 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=10c403c9600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=8847e5384a16f66a
> dashboard link: https://syzkaller.appspot.com/bug?extid=ffb8ab77a232a91eb24d
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>
> Unfortunately, I don't have any reproducer for this crash yet.
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+ffb8ab77a232a91eb24d@syzkaller.appspotmail.com
>
> kasan: CONFIG_KASAN_INLINE enabled
> kasan: GPF could be caused by NULL-ptr deref or user memory access
> general protection fault: 0000 [#1] SMP KASAN
> CPU: 0 PID: 18871 Comm: syz-executor.4 Not tainted 5.3.0+ #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> RIP: 0010:dev_name include/linux/device.h:1342 [inline]
> RIP: 0010:__dev_printk+0x3a/0x203 drivers/base/core.c:3335
> Code: 89 f5 53 e8 6f ab d1 fe 48 85 ed 0f 84 bc 01 00 00 e8 61 ab d1 fe 48
> 8d 7d 50 b8 ff ff 37 00 48 89 fa 48 c1 e0 2a 48 c1 ea 03 <80> 3c 02 00 74
> 05 e8 12 62 f8 fe 4c 8b 7d 50 4d 85 ff 75 27 e8 34
> RSP: 0018:ffff8881d5fe7cf8 EFLAGS: 00010206
> RAX: dffffc0000000000 RBX: ffffed103abfcfa6 RCX: ffffffff8388846d
> RDX: 000000000000001e RSI: ffffffff826c929f RDI: 00000000000000f0
> RBP: 00000000000000a0 R08: ffff8881b2c7b000 R09: fffffbfff0e586ed
> R10: ffff8881d5fe7e28 R11: ffffffff872c3767 R12: ffffffff85f2b0e0
> R13: ffff8881d5fe7d50 R14: ffff8881ca3eaa08 R15: ffffffff83888440
> FS:  0000555556264940(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000001b2e82d000 CR3: 00000001caefb000 CR4: 00000000001406f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>   _dev_info+0xd7/0x109 drivers/base/core.c:3381
>   close_rio.cold+0x1f/0x24 drivers/usb/misc/rio500.c:96
>   __fput+0x2d7/0x840 fs/file_table.c:280
>   task_work_run+0x13f/0x1c0 kernel/task_work.c:113
>   tracehook_notify_resume include/linux/tracehook.h:188 [inline]
>   exit_to_usermode_loop+0x1d2/0x200 arch/x86/entry/common.c:163
>   prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
>   syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
>   do_syscall_64+0x45f/0x580 arch/x86/entry/common.c:300
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x4135d1
> Code: 75 14 b8 03 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 04 1b 00 00 c3 48
> 83 ec 08 e8 0a fc ff ff 48 89 04 24 b8 03 00 00 00 0f 05 <48> 8b 3c 24 48
> 89 c2 e8 53 fc ff ff 48 89 d0 48 83 c4 08 48 3d 01
> RSP: 002b:00007ffe720c0770 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
> RAX: 0000000000000000 RBX: 0000000000000006 RCX: 00000000004135d1
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000005
> RBP: 0000000000000001 R08: ffffffff81160fc4 R09: 000000004679f032
> R10: 00007ffe720c0850 R11: 0000000000000293 R12: 000000000075c9a0
> R13: 000000000075c9a0 R14: 0000000000760ec0 R15: 000000000075bfd4
> Modules linked in:
> ---[ end trace a70ef99560251cf4 ]---
> RIP: 0010:dev_name include/linux/device.h:1342 [inline]
> RIP: 0010:__dev_printk+0x3a/0x203 drivers/base/core.c:3335
> Code: 89 f5 53 e8 6f ab d1 fe 48 85 ed 0f 84 bc 01 00 00 e8 61 ab d1 fe 48
> 8d 7d 50 b8 ff ff 37 00 48 89 fa 48 c1 e0 2a 48 c1 ea 03 <80> 3c 02 00 74
> 05 e8 12 62 f8 fe 4c 8b 7d 50 4d 85 ff 75 27 e8 34
> RSP: 0018:ffff8881d5fe7cf8 EFLAGS: 00010206
> RAX: dffffc0000000000 RBX: ffffed103abfcfa6 RCX: ffffffff8388846d
> RDX: 000000000000001e RSI: ffffffff826c929f RDI: 00000000000000f0
> RBP: 00000000000000a0 R08: ffff8881b2c7b000 R09: fffffbfff0e586ed
> R10: ffff8881d5fe7e28 R11: ffffffff872c3767 R12: ffffffff85f2b0e0
> R13: ffff8881d5fe7d50 R14: ffff8881ca3eaa08 R15: ffffffff83888440
> FS:  0000555556264940(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000001b2e82d000 CR3: 00000001caefb000 CR4: 00000000001406f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

Most probably the same bug:

https://syzkaller.appspot.com/bug?extid=745b0dff8028f9488eba

#syz dup: KASAN: invalid-free in disconnect_rio (2)
