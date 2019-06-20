Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41F354DACF
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2019 21:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbfFTT4H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jun 2019 15:56:07 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39465 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfFTT4G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jun 2019 15:56:06 -0400
Received: by mail-wm1-f66.google.com with SMTP id z23so4328638wma.4;
        Thu, 20 Jun 2019 12:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9F+TFz278OvmgGveVAhnZx9blmEE+B73SBakz05khe0=;
        b=gofsVpmFqog4HJSmRiaLdyy9/YouIMxG4iLoMDrKXafy2ro+czdIbou6rpmNF6M/gS
         sQCOORj1sNfaxIgIjCXiCK/+33nyQTd6Cyyq6NoC9xFjBfIOGJrNyGLyVY/OKLmxRBy4
         Mn27T7r5LjIInNpxlR71SOVbjZGYgh8jva2h9OMitwu3nohzA4BWjBHoM9Y1lqfAHOIU
         RVIi4afL/quV9l/CW+scH6GolGkmmJ3mK5CTO005KBUqKe6VJ9dH1XyAptH2guH/Ejic
         +82iTeHU452CghcvbeDwAW4QBh+g1oqiD8ODjR3mnznWoL6n+1l8sIXlPv0oZm4t7MfK
         6WjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9F+TFz278OvmgGveVAhnZx9blmEE+B73SBakz05khe0=;
        b=tjrqyfrzPHeZmvzJWZ3Duj7XSwAKiWSy0Lmxkgm4yr7ubbB2NEIRsKS6x6eWuEbpTs
         OQAj3Wk+DiqBa2bJLBkbtPOJ/9Yl5m7jndHMVNJ/5U4/IQpJncnn3Em5ppS7q2NkwyA2
         Urq7QxqvAWbzjg+OsDAZTKB8IKbNqOdrtPQ4foLQz9/AxaV7fNzvl3p1zPp34PoYFfPh
         yGcPurrKlLrtfynnbOtElaFOtDaXXxO8EFL4O63iZSlf9Wq6ptubMO+/6sTlTKTKAxz3
         +U9u8315dMGlVuA020fPOSZNtpGXT/lfS0VGtBTMyCUIpBi9GXmrSNLYaBosRYPQQWkH
         lFMw==
X-Gm-Message-State: APjAAAXpDKt4rjtqx+ZsSDK1zirj7GVCljcV0aY2pYzSVURUpDF8smtJ
        0qtoX6bA3nVEBgq72T5dpYpJcQ2xE6g=
X-Google-Smtp-Source: APXvYqwbDIinMwKnV9v5XAMP5U3w+vsZny31TDHhpYUtcVJVEgHmncpvrKiXHUL7dHQiXpsqWs32/g==
X-Received: by 2002:a1c:618a:: with SMTP id v132mr762793wmb.17.1561060564147;
        Thu, 20 Jun 2019 12:56:04 -0700 (PDT)
Received: from debian64.daheim (pD9E29A96.dip0.t-ipconnect.de. [217.226.154.150])
        by smtp.gmail.com with ESMTPSA id q20sm1100856wra.36.2019.06.20.12.56.03
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 12:56:03 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1] helo=debian64.localnet)
        by debian64.daheim with esmtp (Exim 4.92)
        (envelope-from <chunkeey@gmail.com>)
        id 1he3AA-000692-Us; Thu, 20 Jun 2019 21:56:02 +0200
From:   Christian Lamparter <chunkeey@gmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+6d237e74cdc13f036473@syzkaller.appspotmail.com>,
        andreyknvl@google.com, chunkeey@googlemail.com,
        davem@davemloft.net, kvalo@codeaurora.org,
        Kernel development list <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Subject: Re: KASAN: slab-out-of-bounds Read in p54u_load_firmware_cb
Date:   Thu, 20 Jun 2019 21:56:02 +0200
Message-ID: <3232861.cjm3rXpEJU@debian64>
In-Reply-To: <Pine.LNX.4.44L0.1906201544001.1346-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1906201544001.1346-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thursday, June 20, 2019 9:46:32 PM CEST Alan Stern wrote:
> On Wed, 19 Jun 2019, syzbot wrote:
> 
> > syzbot has found a reproducer for the following crash on:
> > 
> > HEAD commit:    9939f56e usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=135e29faa00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=df134eda130bb43a
> > dashboard link: https://syzkaller.appspot.com/bug?extid=6d237e74cdc13f036473
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=175d946ea00000
> > 
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+6d237e74cdc13f036473@syzkaller.appspotmail.com
> > 
> > usb 3-1: Direct firmware load for isl3887usb failed with error -2
> > usb 3-1: Firmware not found.
> > ==================================================================
> > BUG: KASAN: slab-out-of-bounds in p54u_load_firmware_cb.cold+0x97/0x13d  
> > drivers/net/wireless/intersil/p54/p54usb.c:936
> > Read of size 8 at addr ffff8881c9cf7588 by task kworker/1:5/2759
> > 
> > CPU: 1 PID: 2759 Comm: kworker/1:5 Not tainted 5.2.0-rc5+ #11
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
> > Google 01/01/2011
> > Workqueue: events request_firmware_work_func
> > Call Trace:
> >   __dump_stack lib/dump_stack.c:77 [inline]
> >   dump_stack+0xca/0x13e lib/dump_stack.c:113
> >   print_address_description+0x67/0x231 mm/kasan/report.c:188
> >   __kasan_report.cold+0x1a/0x32 mm/kasan/report.c:317
> >   kasan_report+0xe/0x20 mm/kasan/common.c:614
> >   p54u_load_firmware_cb.cold+0x97/0x13d  
> > drivers/net/wireless/intersil/p54/p54usb.c:936
> >   request_firmware_work_func+0x126/0x242  
> > drivers/base/firmware_loader/main.c:785
> >   process_one_work+0x905/0x1570 kernel/workqueue.c:2269
> >   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
> >   kthread+0x30b/0x410 kernel/kthread.c:255
> >   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> > 
> > Allocated by task 1612:
> >   save_stack+0x1b/0x80 mm/kasan/common.c:71
> >   set_track mm/kasan/common.c:79 [inline]
> >   __kasan_kmalloc mm/kasan/common.c:489 [inline]
> >   __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:462
> >   kmalloc include/linux/slab.h:547 [inline]
> >   syslog_print kernel/printk/printk.c:1346 [inline]
> >   do_syslog kernel/printk/printk.c:1519 [inline]
> >   do_syslog+0x4f4/0x12e0 kernel/printk/printk.c:1493
> >   kmsg_read+0x8a/0xb0 fs/proc/kmsg.c:40
> >   proc_reg_read+0x1c1/0x280 fs/proc/inode.c:221
> >   __vfs_read+0x76/0x100 fs/read_write.c:425
> >   vfs_read+0x18e/0x3d0 fs/read_write.c:461
> >   ksys_read+0x127/0x250 fs/read_write.c:587
> >   do_syscall_64+0xb7/0x560 arch/x86/entry/common.c:301
> >   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> > 
> > Freed by task 1612:
> >   save_stack+0x1b/0x80 mm/kasan/common.c:71
> >   set_track mm/kasan/common.c:79 [inline]
> >   __kasan_slab_free+0x130/0x180 mm/kasan/common.c:451
> >   slab_free_hook mm/slub.c:1421 [inline]
> >   slab_free_freelist_hook mm/slub.c:1448 [inline]
> >   slab_free mm/slub.c:2994 [inline]
> >   kfree+0xd7/0x280 mm/slub.c:3949
> >   syslog_print kernel/printk/printk.c:1405 [inline]
> >   do_syslog kernel/printk/printk.c:1519 [inline]
> >   do_syslog+0xff3/0x12e0 kernel/printk/printk.c:1493
> >   kmsg_read+0x8a/0xb0 fs/proc/kmsg.c:40
> >   proc_reg_read+0x1c1/0x280 fs/proc/inode.c:221
> >   __vfs_read+0x76/0x100 fs/read_write.c:425
> >   vfs_read+0x18e/0x3d0 fs/read_write.c:461
> >   ksys_read+0x127/0x250 fs/read_write.c:587
> >   do_syscall_64+0xb7/0x560 arch/x86/entry/common.c:301
> >   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> > 
> > The buggy address belongs to the object at ffff8881c9cf7180
> >   which belongs to the cache kmalloc-1k of size 1024
> > The buggy address is located 8 bytes to the right of
> >   1024-byte region [ffff8881c9cf7180, ffff8881c9cf7580)
> > The buggy address belongs to the page:
> > page:ffffea0007273d00 refcount:1 mapcount:0 mapping:ffff8881dac02a00  
> > index:0x0 compound_mapcount: 0
> > flags: 0x200000000010200(slab|head)
> > raw: 0200000000010200 dead000000000100 dead000000000200 ffff8881dac02a00
> > raw: 0000000000000000 00000000000e000e 00000001ffffffff 0000000000000000
> > page dumped because: kasan: bad access detected
> > 
> > Memory state around the buggy address:
> >   ffff8881c9cf7480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >   ffff8881c9cf7500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > > ffff8881c9cf7580: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> >                        ^
> >   ffff8881c9cf7600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >   ffff8881c9cf7680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > ==================================================================
> 
> Isn't this the same as syzkaller bug 200d4bb11b23d929335f ?  Doesn't
> the same patch fix it?
> 
I think Kalle hasn't applied it yet? It's still sitting on the patchwork queue:
<https://patchwork.kernel.org/patch/10951527/>

Regards,
Christian


