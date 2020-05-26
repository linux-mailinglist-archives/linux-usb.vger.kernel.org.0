Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAC391CC34A
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2020 19:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728171AbgEIRmn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 May 2020 13:42:43 -0400
Received: from foss.arm.com ([217.140.110.172]:60588 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726214AbgEIRmn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 9 May 2020 13:42:43 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A84F1FB;
        Sat,  9 May 2020 10:42:42 -0700 (PDT)
Received: from [192.168.122.166] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A42CA3F71F;
        Sat,  9 May 2020 10:42:41 -0700 (PDT)
Subject: Re: WARNING in memtype_reserve
To:     syzbot <syzbot+353be47c9ce21b68b7ed@syzkaller.appspotmail.com>,
        bp@alien8.de, dave.hansen@linux.intel.com,
        dmitry.torokhov@gmail.com, ebiederm@xmission.com,
        gregkh@linuxfoundation.org, hpa@zytor.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        luto@kernel.org, mingo@redhat.com, peterz@infradead.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com,
        tglx@linutronix.de, x86@kernel.org
References: <000000000000f0d8d205a531f1a3@google.com>
From:   Jeremy Linton <jeremy.linton@arm.com>
Message-ID: <a710a5b5-9a1e-1487-9bc9-a4db726fbf26@arm.com>
Date:   Sat, 9 May 2020 12:42:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <000000000000f0d8d205a531f1a3@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 5/9/20 2:20 AM, syzbot wrote:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    d5eeab8d Merge tag 'scsi-fixes' of git://git.kernel.org/pu..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=15093632100000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=b0212dbee046bc1f
> dashboard link: https://syzkaller.appspot.com/bug?extid=353be47c9ce21b68b7ed
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> userspace arch: i386
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=168ee02c100000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=119f3788100000
> 
> The bug was bisected to:
> 
> commit 2bef9aed6f0e22391c8d4570749b1acc9bc3981e
> Author: Jeremy Linton <jeremy.linton@arm.com>
> Date:   Mon May 4 20:13:48 2020 +0000
> 
>      usb: usbfs: correct kernel->user page attribute mismatch
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1701f168100000
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=1481f168100000
> console output: https://syzkaller.appspot.com/x/log.txt?x=1081f168100000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+353be47c9ce21b68b7ed@syzkaller.appspotmail.com
> Fixes: 2bef9aed6f0e ("usb: usbfs: correct kernel->user page attribute mismatch")
> 
> ------------[ cut here ]------------
> memtype_reserve failed: [mem 0xffffffffff000-0x00008fff], req write-back
> WARNING: CPU: 1 PID: 7025 at arch/x86/mm/pat/memtype.c:589 memtype_reserve+0x69f/0x820 arch/x86/mm/pat/memtype.c:589
> Kernel panic - not syncing: panic_on_warn set ...
> CPU: 1 PID: 7025 Comm: syz-executor254 Not tainted 5.7.0-rc4-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0x188/0x20d lib/dump_stack.c:118
>   panic+0x2e3/0x75c kernel/panic.c:221
>   __warn.cold+0x2f/0x35 kernel/panic.c:582
>   report_bug+0x27b/0x2f0 lib/bug.c:195
>   fixup_bug arch/x86/kernel/traps.c:175 [inline]
>   fixup_bug arch/x86/kernel/traps.c:170 [inline]
>   do_error_trap+0x12b/0x220 arch/x86/kernel/traps.c:267
>   do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:286
>   invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1027
> RIP: 0010:memtype_reserve+0x69f/0x820 arch/x86/mm/pat/memtype.c:589
> Code: 48 8b 2c ed c0 00 29 88 e8 ae ad 3e 00 48 8d 4b ff 49 89 e8 4c 89 e2 48 c7 c6 20 01 29 88 48 c7 c7 80 f9 28 88 e8 79 e8 0f 00 <0f> 0b 41 bf ea ff ff ff e9 03 fc ff ff 41 bf ea ff ff ff e9 f8 fb
> RSP: 0018:ffffc900015e7790 EFLAGS: 00010282
> RAX: 0000000000000000 RBX: 0000000000009000 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: ffffffff815ce181 RDI: fffff520002bcee4
> RBP: ffffffff8828ff40 R08: ffff888097ce85c0 R09: ffffed1015ce45f1
> R10: ffff8880ae722f83 R11: ffffed1015ce45f0 R12: 000ffffffffff000
> R13: 1ffff920002bcef8 R14: dffffc0000000000 R15: 0000000000000000
>   reserve_pfn_range+0x173/0x470 arch/x86/mm/pat/memtype.c:941
>   track_pfn_remap+0x18b/0x280 arch/x86/mm/pat/memtype.c:1033
>   remap_pfn_range+0x202/0xbf0 mm/memory.c:2130
>   dma_direct_mmap+0x197/0x260 kernel/dma/direct.c:453
>   dma_mmap_attrs+0xfe/0x150 kernel/dma/mapping.c:237
>   usbdev_mmap+0x3ae/0x730 drivers/usb/core/devio.c:254
>   call_mmap include/linux/fs.h:1912 [inline]
>   mmap_region+0xafb/0x1540 mm/mmap.c:1772
>   do_mmap+0x849/0x1160 mm/mmap.c:1545
>   do_mmap_pgoff include/linux/mm.h:2553 [inline]
>   vm_mmap_pgoff+0x197/0x200 mm/util.c:506
>   ksys_mmap_pgoff+0x457/0x5b0 mm/mmap.c:1595
>   do_syscall_32_irqs_on arch/x86/entry/common.c:337 [inline]
>   do_fast_syscall_32+0x270/0xe90 arch/x86/entry/common.c:396
>   entry_SYSENTER_compat+0x70/0x7f arch/x86/entry/entry_64_compat.S:139
> Kernel Offset: disabled
> Rebooting in 86400 seconds..
> 
> 
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> syzbot can test patches for this bug, for details see:
> https://goo.gl/tpsmEJ#testing-patches
> 

Adding a range check in dma_direct_mmap() looks like a fine fix. I'm 
curious how the mapping attribute changed though. I expected that would 
be rare on x86 (ISA devices/etc).

What is the GCE USB controller here? Its not the same as the virtual 
qemu/pci/xhci right?

