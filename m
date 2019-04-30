Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 069E5FF35
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 20:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfD3SAB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 14:00:01 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:56077 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbfD3SAB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 14:00:01 -0400
Received: by mail-io1-f70.google.com with SMTP id y5so11955515ioc.22
        for <linux-usb@vger.kernel.org>; Tue, 30 Apr 2019 11:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=i1hNmIlzVNTyKhhowyG+Xc4x0UuOGxlZW8Ho3IlyYRI=;
        b=XZ9tmA50H2mqoiI5VLYRQ0PiE/sbs49eC5GBenL1JctFGe0CbbXThD0psUHWJ5NFrq
         Eu5rV9vPEbfhNnA3Mn1ebjXp0kyVuHMKcc6z4Nk2EFJJHtdrTVuK23d/KT8m9Utdj2v3
         FSPLIp3CcrEtqutFuJi7NeFhdZkaJ2sX9ay+tzMhQHFgEsqhzpAi82S7BXL/v8c98afN
         V3HytdSiXWjEYJ+7FpmFacRtww9ApV35m0l7FpRN+dRH5DNdl9ua2GyETgtO/Gik9y9f
         yq4oB8zMUiItBe/NdzWZwKvWLZBZjAkiw5anOcFea1r+g4qIr/t97QK3kFiuTt8t7sg4
         Z4/Q==
X-Gm-Message-State: APjAAAVr6go8cNGrhUaOU2+xkChPbZMdvOII+BUj0qxA5hUywruNWnSR
        Ijgq1+aWSU8Pl+dZDGPCpf7qsIq3+xuKpZ3M353niCuPfysj
X-Google-Smtp-Source: APXvYqxuUrE2nlzrRMGpu9w5k2U4DSjiS+lLd/PJcC0lFmoQuMdIeGKAtdUEmXYUl6Zk2Sh+HygwuCfv+JtcigTMyfzBUpDzUcSs
MIME-Version: 1.0
X-Received: by 2002:a5d:91c1:: with SMTP id k1mr2395471ior.180.1556647200359;
 Tue, 30 Apr 2019 11:00:00 -0700 (PDT)
Date:   Tue, 30 Apr 2019 11:00:00 -0700
In-Reply-To: <CAAeHK+zn-26NHw8seueTyQV1o=O9x0U3m9-jV4V70Ctfutk8Fg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006b0d230587c32bf2@google.com>
Subject: Re: WARNING: Support for this device (Terratec Grabster AV400) is experimental.
From:   syzbot <syzbot+af8f8d2ac0d39b0ed3a0@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer still triggered  
crash:
WARNING in sysfs_remove_group

pvrusb2: Important functionality might not be entirely working.
pvrusb2: Please consider contacting the driver author to help with further  
stabilization of the driver.
------------[ cut here ]------------
pvrusb2: **********
sysfs group 'power' not found for kobject '0-0044'
WARNING: CPU: 0 PID: 586 at fs/sysfs/group.c:254 sysfs_remove_group  
fs/sysfs/group.c:254 [inline]
WARNING: CPU: 0 PID: 586 at fs/sysfs/group.c:254  
sysfs_remove_group+0x15a/0x1b0 fs/sysfs/group.c:245
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 586 Comm: pvrusb2-context Not tainted 5.1.0-rc3-g43151d6-dirty  
#1
usb 5-1: New USB device found, idVendor=0ccd, idProduct=0039, bcdDevice=  
d.3c
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xe8/0x16e lib/dump_stack.c:113
  panic+0x29d/0x5f2 kernel/panic.c:214
  __warn.cold+0x20/0x48 kernel/panic.c:571
  report_bug+0x262/0x2a0 lib/bug.c:186
  fixup_bug arch/x86/kernel/traps.c:179 [inline]
  fixup_bug arch/x86/kernel/traps.c:174 [inline]
  do_error_trap+0x130/0x1f0 arch/x86/kernel/traps.c:272
  do_invalid_op+0x37/0x40 arch/x86/kernel/traps.c:291
  invalid_op+0x14/0x20 arch/x86/entry/entry_64.S:973
RIP: 0010:sysfs_remove_group fs/sysfs/group.c:254 [inline]
RIP: 0010:sysfs_remove_group+0x15a/0x1b0 fs/sysfs/group.c:245
Code: 48 89 d9 49 8b 14 24 48 b8 00 00 00 00 00 fc ff df 48 c1 e9 03 80 3c  
01 00 75 41 48 8b 33 48 c7 c7 a0 31 7a 8e e8 e6 c2 6e ff <0f> 0b eb 95 e8  
0d de d3 ff e9 d2 fe ff ff 48 89 df e8 00 de d3 ff
RSP: 0018:ffff88809cc9fb70 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffffffff8f037e80 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff815b2132 RDI: ffffed1013993f60
RBP: 0000000000000000 R08: ffff88809cc93100 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff888097d06eb0
R13: ffffffff8f038520 R14: 1ffff11013993f97 R15: ffff888097d06ea8
  dpm_sysfs_remove+0xa2/0xc0 drivers/base/power/sysfs.c:737
  device_del+0x175/0xb90 drivers/base/core.c:2246
  device_unregister+0x27/0xd0 drivers/base/core.c:2301
  i2c_unregister_device drivers/i2c/i2c-core-base.c:814 [inline]
  __unregister_client drivers/i2c/i2c-core-base.c:1422 [inline]
  __unregister_client+0x7d/0x90 drivers/i2c/i2c-core-base.c:1418
  device_for_each_child+0x100/0x170 drivers/base/core.c:2401
  i2c_del_adapter drivers/i2c/i2c-core-base.c:1485 [inline]
  i2c_del_adapter+0x35b/0x640 drivers/i2c/i2c-core-base.c:1447
  pvr2_i2c_core_done+0x6e/0xbb  
drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c:662
  pvr2_hdw_destroy+0x17e/0x380 drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2669
  pvr2_context_destroy+0x89/0x240  
drivers/media/usb/pvrusb2/pvrusb2-context.c:79
  pvr2_context_check drivers/media/usb/pvrusb2/pvrusb2-context.c:146 [inline]
  pvr2_context_thread_func+0x65e/0x870  
drivers/media/usb/pvrusb2/pvrusb2-context.c:167
usb 5-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
  kthread+0x313/0x420 kernel/kthread.c:253
usb 3-1: New USB device found, idVendor=0ccd, idProduct=0039, bcdDevice=  
d.3c
  ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352
Kernel Offset: disabled
Rebooting in 86400 seconds..


Tested on:

commit:         43151d6c usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=11e467a8a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=274aad0cf966c3bc
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1479a4b8a00000

