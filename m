Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED045FFF9
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 20:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbfD3S4C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 14:56:02 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:52349 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbfD3S4B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 14:56:01 -0400
Received: by mail-io1-f72.google.com with SMTP id t12so12128356ioc.19
        for <linux-usb@vger.kernel.org>; Tue, 30 Apr 2019 11:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=UtSb1a/TJthhtHAsE2xIU1UcdO20j/xmJynrN5M57B0=;
        b=M7A/1/Lr4gtDv3dOIGxZZpnLnGWA/4JYwEXj3gmikKoUF/abFzRL75gjFh+XSuoN2t
         h2C3grS6ZSrHdRUVamwwGpaTSGuWNRfCQ3O9cpQT0MTw65VYgvCWtW9tP1PfCPHQ+2m4
         w7FrqWwjrw/4NuxrnKj9D4eGjDX3WXHjDEv1jEgFqbGh/6w2T7vdKp5efn2qF41m8f61
         CQvRyy+NTwgtZGviDDaONWRoAFsyB1DQkdG17ItoZEjbyeBCVm8dhEfrblhCqay6dtXX
         ArMf8A1Yd7vUbH4JL4I/HlGGxP6ybiAmudKIC9nb+XDZ6kfEgKeu7IvQu8s1cb6wSKPU
         6wyg==
X-Gm-Message-State: APjAAAXiKwjLSB1jHcuAnVP0dhJpxniZN6Ish1NhcfgtnqPEKc3hAKQK
        KuAxZesGjUUvUleYXsLCzFuQW7R59gp1viCVgZ1Ez9qS+hZP
X-Google-Smtp-Source: APXvYqwHvUBz+VBVOZvzKN5My0ZNXMUGaoF2CpR9bkkDq95ayJFiBomkFo2QHi9PD2HRCKhbKQd56XmVsTaJalFSTmpkS3E3RkDE
MIME-Version: 1.0
X-Received: by 2002:a24:6987:: with SMTP id e129mr4985371itc.28.1556650560822;
 Tue, 30 Apr 2019 11:56:00 -0700 (PDT)
Date:   Tue, 30 Apr 2019 11:56:00 -0700
In-Reply-To: <CAAeHK+xAqa9Mz6y0ug8KxYuMYN7D2xP9xYbccKwJyjk_B4ew3g@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b7a84a0587c3f3e5@google.com>
Subject: Re: WARNING: Detected a wedged cx25840 chip; the device will not work.
From:   syzbot <syzbot+170a86bf206dd2c6217e@syzkaller.appspotmail.com>
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

pvrusb2: Attached sub-driver tuner
pvrusb2: ***WARNING*** pvrusb2 driver initialization failed due to the  
failure of one or more sub-device kernel modules.
pvrusb2: You need to resolve the failing condition before this driver can  
function.  There should be some earlier messages giving more information  
about the problem.
------------[ cut here ]------------
sysfs group 'power' not found for kobject '0-0044'
WARNING: CPU: 1 PID: 586 at fs/sysfs/group.c:254 sysfs_remove_group  
fs/sysfs/group.c:254 [inline]
WARNING: CPU: 1 PID: 586 at fs/sysfs/group.c:254  
sysfs_remove_group+0x15a/0x1b0 fs/sysfs/group.c:245
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 586 Comm: pvrusb2-context Not tainted 5.1.0-rc3-g43151d6-dirty  
#1
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
RSP: 0018:ffff88809ced7b70 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffffffff8f037e80 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff815b2132 RDI: ffffed10139daf60
RBP: 0000000000000000 R08: ffff88809ce96200 R09: ffffed1015a23edb
R10: ffffed1015a23eda R11: ffff8880ad11f6d7 R12: ffff888218b8e630
R13: ffffffff8f038520 R14: 1ffff110139daf97 R15: ffff888218b8e628
  dpm_sysfs_remove+0xa2/0xc0 drivers/base/power/sysfs.c:737
  device_del+0x175/0xb90 drivers/base/core.c:2246
usb 4-1: new high-speed USB device number 3 using dummy_hcd
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
  kthread+0x313/0x420 kernel/kthread.c:253
  ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352
Kernel Offset: disabled
Rebooting in 86400 seconds..


Tested on:

commit:         43151d6c usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=15433634a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=274aad0cf966c3bc
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13df3d24a00000

