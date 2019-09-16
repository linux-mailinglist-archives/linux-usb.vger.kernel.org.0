Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DECCB4177
	for <lists+linux-usb@lfdr.de>; Mon, 16 Sep 2019 22:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391015AbfIPUAO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Sep 2019 16:00:14 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40963 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727880AbfIPUAO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Sep 2019 16:00:14 -0400
Received: by mail-pf1-f193.google.com with SMTP id q7so559910pfh.8
        for <linux-usb@vger.kernel.org>; Mon, 16 Sep 2019 13:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=GkrRDU4n+A0mwdRr9SZP5oIS+Dn9buzlq9OjWSBq+U4=;
        b=c0ymhVx5/QZhSh4uc2bqUht0XOUXdrplY+Qinz9udzz/RGT4dQdYTF+k0Ndep7R67U
         lf7pzTYmvUq5AxJ/QgXvuXBQUDat6iaqvhMv+kV5JtcMdEineArUr5zYk3y32qtUlgBv
         7znrll+LPEAMk8LnQaD6kN5cRlDfJ38NwMXOhQILW0010Ja+5W+mbaLiE0pnDH8enyPz
         GLiHo0jQOdKTxPOi00r2X5mQUbA7tDB6dVETXVcE/o0cgk0OJNHF3AvPZvDvlFHyKRkg
         CdNfuAlvFb0wVDtCUMPcJSdC7WqCeKQw4G/sTI70yfsnzHxTl7ve7iSOxrY2C0/FubbH
         /u/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=GkrRDU4n+A0mwdRr9SZP5oIS+Dn9buzlq9OjWSBq+U4=;
        b=iN/CfjpNoNZ0gJVKOlrFYbJGw2z35Dyc4tnym1+6PFxOuP3+5vu8ZnaHUogeM2Hh4f
         m+cojvpa1f17pTrsyEsJAbWYNsqP57zlgDaGWmFiWtPR/OHBggxTAvRszLeeaAf95CUd
         pLrrdRg2vJmyUxrI+ml7Gf/pZEAYjv2C8EWxQ69/w06oPLfRGHQwYUeFFldCO1Epc3W7
         dt4VVsposVBW36Wg/zGDm6bExeVVXYo81BcgNocxcEDx8nJJgfg3oWcqiOwFMaJ2/RCp
         zVAnvyUa/6w7oDxouuJVPRebg4ptfPtSZGZ8aC9+AWe7kR3S/GeepoJ4ydLC4bs2upVp
         Sx0g==
X-Gm-Message-State: APjAAAWlIlSPjlGopT06A/EH7AlA4XHwImyKTXelWOzbTJJ5ad2iR2Fw
        JdvZlECiIUVI7Pyb5aXAfFOuNg==
X-Google-Smtp-Source: APXvYqzzeBqfN19EkgRYHn2FKS9cRAy4ZLMoQatugO67DgdlU8I5c+fdmfBKhC6fq8aw2Tpg8JT34w==
X-Received: by 2002:a63:5a0a:: with SMTP id o10mr371691pgb.282.1568664012969;
        Mon, 16 Sep 2019 13:00:12 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598] ([2620:15c:17:3:3a5:23a7:5e32:4598])
        by smtp.gmail.com with ESMTPSA id f20sm31526161pgg.56.2019.09.16.13.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 13:00:12 -0700 (PDT)
Date:   Mon, 16 Sep 2019 13:00:11 -0700 (PDT)
From:   David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To:     syzbot <syzbot+e38fe539fedfc127987e@syzkaller.appspotmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
cc:     Andrea Arcangeli <aarcange@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-usb@vger.kernel.org, mhocko@suse.com,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz,
        yang.shi@linux.alibaba.com, zhongjiang@huawei.com
Subject: Re: WARNING in __alloc_pages_nodemask
In-Reply-To: <00000000000025ae690592b00fbd@google.com>
Message-ID: <alpine.DEB.2.21.1909161258150.118156@chino.kir.corp.google.com>
References: <00000000000025ae690592b00fbd@google.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 16 Sep 2019, syzbot wrote:

> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=14b15371600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
> dashboard link: https://syzkaller.appspot.com/bug?extid=e38fe539fedfc127987e
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1093bed1600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1603cfc6600000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+e38fe539fedfc127987e@syzkaller.appspotmail.com
> 
> WARNING: CPU: 0 PID: 1720 at mm/page_alloc.c:4696
> __alloc_pages_nodemask+0x36f/0x780 mm/page_alloc.c:4696
> Kernel panic - not syncing: panic_on_warn set ...
> CPU: 0 PID: 1720 Comm: syz-executor388 Not tainted 5.3.0-rc7+ #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google
> 01/01/2011
> Call Trace:
> __dump_stack lib/dump_stack.c:77 [inline]
> dump_stack+0xca/0x13e lib/dump_stack.c:113
> panic+0x2a3/0x6da kernel/panic.c:219
> __warn.cold+0x20/0x4a kernel/panic.c:576
> report_bug+0x262/0x2a0 lib/bug.c:186
> fixup_bug arch/x86/kernel/traps.c:179 [inline]
> fixup_bug arch/x86/kernel/traps.c:174 [inline]
> do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:272
> do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:291
> invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1028
> RIP: 0010:__alloc_pages_nodemask+0x36f/0x780 mm/page_alloc.c:4696
> Code: fe ff ff 65 48 8b 04 25 00 ef 01 00 48 05 60 10 00 00 41 be 01 00 00 00
> 48 89 44 24 58 e9 ee fd ff ff 81 e5 00 20 00 00 75 02 <0f> 0b 45 31 f6 e9 6b
> ff ff ff 8b 44 24 68 89 04 24 65 8b 2d e9 7e
> RSP: 0018:ffff8881d320f9d8 EFLAGS: 00010046
> RAX: 0000000000000000 RBX: 1ffff1103a641f3f RCX: 0000000000000000
> RDX: 0000000000000000 RSI: dffffc0000000000 RDI: 0000000000040a20
> RBP: 0000000000000000 R08: ffff8881d3bcc800 R09: ffffed103a541d19
> R10: ffffed103a541d18 R11: ffff8881d2a0e8c7 R12: 0000000000000012
> R13: 0000000000000012 R14: 0000000000000000 R15: ffff8881d2a0e8c0
> alloc_pages_current+0xff/0x200 mm/mempolicy.c:2153
> alloc_pages include/linux/gfp.h:509 [inline]
> kmalloc_order+0x1a/0x60 mm/slab_common.c:1257
> kmalloc_order_trace+0x18/0x110 mm/slab_common.c:1269
> __usbhid_submit_report drivers/hid/usbhid/hid-core.c:588 [inline]
> usbhid_submit_report+0x5b5/0xde0 drivers/hid/usbhid/hid-core.c:638
> usbhid_request+0x3c/0x70 drivers/hid/usbhid/hid-core.c:1252
> hid_hw_request include/linux/hid.h:1053 [inline]
> hiddev_ioctl+0x526/0x1550 drivers/hid/usbhid/hiddev.c:735
> vfs_ioctl fs/ioctl.c:46 [inline]
> file_ioctl fs/ioctl.c:509 [inline]
> do_vfs_ioctl+0xd2d/0x1330 fs/ioctl.c:696
> ksys_ioctl+0x9b/0xc0 fs/ioctl.c:713
> __do_sys_ioctl fs/ioctl.c:720 [inline]
> __se_sys_ioctl fs/ioctl.c:718 [inline]
> __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:718
> do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
> entry_SYSCALL_64_after_hwframe+0x49/0xbe

Adding Jiri and Benjamin.  The hid report length is simply too large for 
the page allocator to allocate: this is triggering because the resulting 
allocation order is > MAX_ORDER-1.  Any way to make this allocate less 
physically contiguous memory?
