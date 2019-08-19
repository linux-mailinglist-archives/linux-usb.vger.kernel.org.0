Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4E794ECE
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2019 22:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728325AbfHSUUC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 16:20:02 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:48498 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727988AbfHSUUB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Aug 2019 16:20:01 -0400
Received: by mail-io1-f69.google.com with SMTP id 67so5283674iob.15
        for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2019 13:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=wevSZW5UX5fk5gUt0Ilf2YFephyvO23N5oYUGBnvx0A=;
        b=kiPrAnHpf8IiPEx0HJngzxo0b8I42w31XBZz8IIp+Ym7hkQF/NRinv0dLPfwYJmc6D
         IkAmvMCJeXABMQfpOAJPrfw8JrDexU9nQh/y5a2k6hIQnsQ8k28aqEgTisCnHqhNLXv7
         lDvGEZltaNHy+klKnLWxMKAnG2TPcPtbPGKNpBYZNwRIfMleO8fKTAYuueoDgItGDoJt
         ovyoao7pFrT/Y+pyiSh7pgKDbCLZY9HUYtau7Gf3iq4w8Vq2L+8Zc/Bnhox5Lf33cW7s
         J/Nvk+3gI12NBUflTzF+Iex78XEbo8YrRuE2qm2+MFcUJQ7DdzrIYI8u1j/zqx2+W9rV
         oPpw==
X-Gm-Message-State: APjAAAXRGpWdTbO5wx4LbKKD2uAZRIAU3jn4unc4gdvyPByf3LlQ1BUD
        BcYqnvmsTYGa2UoJUlOru308mQwvC/bvkrGLkKqcFnaxx+mQ
X-Google-Smtp-Source: APXvYqwc0eT4VdhPWVT4tXLH/zoDNl26v0l4pZFemeGq8mucabfD4FpNIGy4mLlo8Qe3+n3cM0QiuUBDNz5JRtAzLB0wxkOTPtPi
MIME-Version: 1.0
X-Received: by 2002:a6b:620f:: with SMTP id f15mr17938248iog.190.1566246000720;
 Mon, 19 Aug 2019 13:20:00 -0700 (PDT)
Date:   Mon, 19 Aug 2019 13:20:00 -0700
In-Reply-To: <Pine.LNX.4.44L0.1908191558310.1506-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000081081805907e10c8@google.com>
Subject: Re: WARNING in kmem_cache_alloc_trace
From:   syzbot <syzbot+0e7b6b6001ca8ed655f6@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, balbi@kernel.org, chunfeng.yun@mediatek.com,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer still triggered  
crash:
WARNING in yurex_write/usb_submit_urb

------------[ cut here ]------------
URB 00000000c866c77d submitted while active
WARNING: CPU: 1 PID: 2816 at drivers/usb/core/urb.c:362  
usb_submit_urb+0x10c1/0x13b0 drivers/usb/core/urb.c:362
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 2816 Comm: syz-executor.4 Not tainted 5.3.0-rc4+ #1
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  panic+0x2a3/0x6da kernel/panic.c:219
  __warn.cold+0x20/0x4a kernel/panic.c:576
  report_bug+0x262/0x2a0 lib/bug.c:186
  fixup_bug arch/x86/kernel/traps.c:179 [inline]
  fixup_bug arch/x86/kernel/traps.c:174 [inline]
  do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:272
  do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:291
  invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1028
RIP: 0010:usb_submit_urb+0x10c1/0x13b0 drivers/usb/core/urb.c:362
Code: 89 de e8 62 b7 ef fd 84 db 0f 85 42 f6 ff ff e8 25 b6 ef fd 4c 89 fe  
48 c7 c7 c0 67 18 86 c6 05 07 29 3a 04 01 e8 14 9b c5 fd <0f> 0b e9 20 f6  
ff ff c7 44 24 14 01 00 00 00 e9 d7 f6 ff ff 41 bd
RSP: 0018:ffff8881c6f3fc48 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff81288cfd RDI: ffffed1038de7f7b
RBP: ffff8881d1210000 R08: ffff8881c726c800 R09: fffffbfff11ad3a4
R10: fffffbfff11ad3a3 R11: ffffffff88d69d1f R12: 1ffff11038de7f9f
R13: 00000000fffffff0 R14: 0000000000000000 R15: ffff8881d63eff00
  yurex_write+0x369/0x8f0 drivers/usb/misc/yurex.c:493
  __vfs_write+0x76/0x100 fs/read_write.c:494
  vfs_write+0x262/0x5c0 fs/read_write.c:558
  ksys_write+0x127/0x250 fs/read_write.c:611
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x459829
Code: fd b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 cb b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f5fe5e65c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000459829
RDX: 000000000000008d RSI: 0000000020000040 RDI: 0000000000000004
RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f5fe5e666d4
R13: 00000000004c99b9 R14: 00000000004e1038 R15: 00000000ffffffff
Kernel Offset: disabled
Rebooting in 86400 seconds..


Tested on:

commit:         d0847550 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=16026986600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dbc9c80cc095da19
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14fe315a600000

