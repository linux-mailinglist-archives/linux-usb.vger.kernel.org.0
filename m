Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E43789D89
	for <lists+linux-usb@lfdr.de>; Mon, 12 Aug 2019 14:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728327AbfHLMGV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Aug 2019 08:06:21 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39776 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbfHLMGU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Aug 2019 08:06:20 -0400
Received: by mail-pg1-f194.google.com with SMTP id u17so49368293pgi.6
        for <linux-usb@vger.kernel.org>; Mon, 12 Aug 2019 05:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sgx0vew/l/5gv4406bm2WvE+6I0CHR07hqlrz86Z3sc=;
        b=uJEt2ROVPd1UqcXIH8AZcEWJe2gU2l2WikWj/lTXEu5TAQO5UI7HxMZhSjWGSNpSM/
         kD67Pst1Dyzx7qbYrLXSvu+Mr08ddVTHrPLPkSReXtjEyuOfJ2szasvJY7Q1juthSE+O
         ZN5d5+3WpJ8VQexHVYk2PQhh6erlNiX5z9RVYgbCQIuL3cODpt1V8Jl+vCfCixh/0O7E
         92/TSySWGPp9zO0p00eOTgQmAdQTHS88ikyrRrA73j948ugOl+8ULRHL2jU6SZXLcic4
         YmfbiWs7shR+wQkLf29qMOFftl73S3yAhgbTADzXO1DxWuSyQjH0/iK3D3AGpyYzODyS
         j5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sgx0vew/l/5gv4406bm2WvE+6I0CHR07hqlrz86Z3sc=;
        b=YMkZ3ALYYriomMTMZDnOGvkidVfF2EUPokCWFnfFrkdUr0SGz1aY6xCOR2nP9tZTkS
         IwinlQClq2T9AreFia+BTNHEmpQOz+Pnvkgikx84VgAvkp/bPvtmcN5+q60OQuSCCzuk
         Ca2XL8rn5jMHj2MmeUT3JGOjjE6kfuO9R8xAGVssZurGmM2vRCBZ1GKqKMu6IgRL2imR
         suWFeN0XDQEog5m0wtlmqMC/QEsL+BuN9qKzpfywyuhO/98ugA7iDUw+vBnJo/HfrQBm
         L2bWApF2wUamN9ES+LBbUaLCgHpHmuhn01xKDYkOrNDh6lh8QZGEbcWMgXpnm5lEL4/+
         zTvA==
X-Gm-Message-State: APjAAAU5d0rdZSH6W3gnyiXy27pBXE+a+ERmTAxge6sX5c/j4qS3PhCi
        5BwvusADPEGVvuirgNMSwprRcFgDNXN9PBCI8Immpg==
X-Google-Smtp-Source: APXvYqzdCQuAop5oRPu4EMtfBSPg2dydPnlQBeJzj9Fz8EdqkN3nC2NN4tp/bM/cPBx2GTfWFoh9z4egZLpy0FJbn4E=
X-Received: by 2002:aa7:86c6:: with SMTP id h6mr35801985pfo.51.1565611579482;
 Mon, 12 Aug 2019 05:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000005c056c058f9a5437@google.com>
In-Reply-To: <0000000000005c056c058f9a5437@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 12 Aug 2019 14:06:08 +0200
Message-ID: <CAAeHK+wcAgqNvEO_S_EXgdvhBN2qkQbPii8XVT_7UVnS1WaB6g@mail.gmail.com>
Subject: Re: BUG: bad usercopy in ld_usb_read
To:     syzbot <syzbot+45b2f40f0778cfa7634e@syzkaller.appspotmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>, Qian Cai <cai@lca.pw>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 8, 2019 at 2:38 PM syzbot
<syzbot+45b2f40f0778cfa7634e@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=13aeaece600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
> dashboard link: https://syzkaller.appspot.com/bug?extid=45b2f40f0778cfa7634e
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>
> Unfortunately, I don't have any reproducer for this crash yet.
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+45b2f40f0778cfa7634e@syzkaller.appspotmail.com
>
> ldusb 6-1:0.124: Read buffer overflow, -131383996186150 bytes dropped
> usercopy: Kernel memory exposure attempt detected from SLUB
> object 'kmalloc-2k' (offset 8, size 65062)!
> ------------[ cut here ]------------
> kernel BUG at mm/usercopy.c:98!
> invalid opcode: 0000 [#1] SMP KASAN
> CPU: 0 PID: 15185 Comm: syz-executor.2 Not tainted 5.3.0-rc2+ #25
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> RIP: 0010:usercopy_abort+0xb9/0xbb mm/usercopy.c:98
> Code: e8 c1 f7 d6 ff 49 89 d9 4d 89 e8 4c 89 e1 41 56 48 89 ee 48 c7 c7 e0
> f3 cd 85 ff 74 24 08 41 57 48 8b 54 24 20 e8 15 98 c1 ff <0f> 0b e8 95 f7
> d6 ff e8 80 9f fd ff 8b 54 24 04 49 89 d8 4c 89 e1
> RSP: 0018:ffff8881ccb3fc38 EFLAGS: 00010286
> RAX: 0000000000000067 RBX: ffffffff86a659d4 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: ffffffff8128a0fd RDI: ffffed1039967f79
> RBP: ffffffff85cdf2c0 R08: 0000000000000067 R09: fffffbfff11acdaa
> R10: fffffbfff11acda9 R11: ffffffff88d66d4f R12: ffffffff86a696e8
> R13: ffffffff85cdf180 R14: 000000000000fe26 R15: ffffffff85cdf140
> FS:  00007ff6daf91700(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f1de6600000 CR3: 00000001ca554000 CR4: 00000000001406f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>   __check_heap_object+0xdd/0x110 mm/slub.c:3914
>   check_heap_object mm/usercopy.c:234 [inline]
>   __check_object_size mm/usercopy.c:280 [inline]
>   __check_object_size+0x32d/0x39b mm/usercopy.c:250
>   check_object_size include/linux/thread_info.h:119 [inline]
>   check_copy_size include/linux/thread_info.h:150 [inline]
>   copy_to_user include/linux/uaccess.h:151 [inline]
>   ld_usb_read+0x304/0x780 drivers/usb/misc/ldusb.c:495

#syz dup: KASAN: use-after-free Read in ld_usb_release

>   __vfs_read+0x76/0x100 fs/read_write.c:425
>   vfs_read+0x1ea/0x430 fs/read_write.c:461
>   ksys_read+0x1e8/0x250 fs/read_write.c:587
>   do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x459829
> Code: fd b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7
> 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff
> ff 0f 83 cb b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00
> RSP: 002b:00007ff6daf90c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
> RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000459829
> RDX: 000000000000fe26 RSI: 00000000200000c0 RDI: 0000000000000003
> RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007ff6daf916d4
> R13: 00000000004c6c73 R14: 00000000004dbee8 R15: 00000000ffffffff
> Modules linked in:
> ---[ end trace 4fe8dba032d24ceb ]---
> RIP: 0010:usercopy_abort+0xb9/0xbb mm/usercopy.c:98
> Code: e8 c1 f7 d6 ff 49 89 d9 4d 89 e8 4c 89 e1 41 56 48 89 ee 48 c7 c7 e0
> f3 cd 85 ff 74 24 08 41 57 48 8b 54 24 20 e8 15 98 c1 ff <0f> 0b e8 95 f7
> d6 ff e8 80 9f fd ff 8b 54 24 04 49 89 d8 4c 89 e1
> RSP: 0018:ffff8881ccb3fc38 EFLAGS: 00010286
> RAX: 0000000000000067 RBX: ffffffff86a659d4 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: ffffffff8128a0fd RDI: ffffed1039967f79
> RBP: ffffffff85cdf2c0 R08: 0000000000000067 R09: fffffbfff11acdaa
> R10: fffffbfff11acda9 R11: ffffffff88d66d4f R12: ffffffff86a696e8
> R13: ffffffff85cdf180 R14: 000000000000fe26 R15: ffffffff85cdf140
> FS:  00007ff6daf91700(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f1de6600000 CR3: 00000001ca554000 CR4: 00000000001406f0
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
