Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47053D449E
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 17:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbfJKPmC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 11:42:02 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:41346 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727149AbfJKPmC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Oct 2019 11:42:02 -0400
Received: by mail-io1-f69.google.com with SMTP id q18so15127309ios.8
        for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2019 08:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=kFsPfbIuVLLP06mBsnv++deRNxJoBeYlYpS0DCBKJRY=;
        b=hZeZvRpFrEW0XX0frAgc3PEzrKTDD+kk3y7iqQGDwK7/ZKb3zevlqw91MI+ULmZ/sC
         haOP+8rP+wiNQcmxbuIQ0NEmImCcUZQXPqO91qEnDBa/I2OsFaTSDxXbX6Vj3e/Otlt+
         lhqDON2SbWScPxXuuzIcZiJU/YkDLFdN/S08VvEaJa47MwL+JMa81FYMcz/GollJuySr
         Ch11DrxvuJP/bgGZZmT2Mn7KEYz+cq5A8q8f+xgMm2G0vh2TrdYVgcg0AULQ6cL1qOqO
         tTsjBQCoBxAZCA4XTYL7QGUEV7rzmVJXCkNJSz/FEsEDRv0Z/TjYdmvok7nHFFuHonTj
         14Og==
X-Gm-Message-State: APjAAAXZp2D0mOXTY21J3tf3Wdkrs5vvza5FIQYeGcAAThPcXVSQU6vY
        zeZaU9XEGREG8n6xtvBGN4RTawpfez5gAR0xsJUle2I0/huS
X-Google-Smtp-Source: APXvYqxXLVkmWggCu+Lv+8QrqPqjahv/fK5bYpGS0bKVyVgxGg2uLnvbq0VxIpHqkH2HZnuRzFPxtwoZNQtlC05V5hfbsFmrBVIb
MIME-Version: 1.0
X-Received: by 2002:a5e:9b04:: with SMTP id j4mr106545iok.45.1570808521184;
 Fri, 11 Oct 2019 08:42:01 -0700 (PDT)
Date:   Fri, 11 Oct 2019 08:42:01 -0700
In-Reply-To: <CAG_fn=WsN0d8VO6=4jtDP9rHqBMp0zBvJQ7qrvQhZkkaj6NNsg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ea5bf90594a45b81@google.com>
Subject: Re: KMSAN: uninit-value in alauda_check_media
From:   syzbot <syzbot+e7d46eb426883fb97efd@syzkaller.appspotmail.com>
To:     glider@google.com, gregkh@linuxfoundation.org,
        jaskaransingh7654321@gmail.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com,
        usb-storage@lists.one-eyed-alien.net
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer still triggered  
crash:
KMSAN: uninit-value in alauda_check_media

=====================================================
BUG: KMSAN: uninit-value in alauda_transport+0x462/0x57f0  
drivers/usb/storage/alauda.c:1138
CPU: 1 PID: 11015 Comm: usb-storage Not tainted 5.4.0-rc2+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x191/0x1f0 lib/dump_stack.c:113
  kmsan_report+0x14c/0x2c0 mm/kmsan/kmsan_report.c:110
  __msan_warning+0x73/0xe0 mm/kmsan/kmsan_instr.c:245
  alauda_check_media+0x344/0x3310 drivers/usb/storage/alauda.c:461
  alauda_transport+0x462/0x57f0 drivers/usb/storage/alauda.c:1138
  usb_stor_invoke_transport+0xf5/0x27e0 drivers/usb/storage/transport.c:606
  usb_stor_transparent_scsi_command+0x5d/0x70  
drivers/usb/storage/protocol.c:108
  usb_stor_control_thread+0xca6/0x11a0 drivers/usb/storage/usb.c:380
  kthread+0x4b5/0x4f0 kernel/kthread.c:256
  ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355

Local variable description: ----status@alauda_check_media
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 11015 Comm: usb-storage Tainted: G    B             5.4.0-rc2+  
#0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x191/0x1f0 lib/dump_stack.c:113
  panic+0x3c9/0xc1e kernel/panic.c:220
  kmsan_report+0x2b4/0x2c0 mm/kmsan/kmsan_report.c:133
  __msan_warning+0x73/0xe0 mm/kmsan/kmsan_instr.c:245
  alauda_check_media+0x344/0x3310 drivers/usb/storage/alauda.c:461
  alauda_transport+0x462/0x57f0 drivers/usb/storage/alauda.c:1138
  usb_stor_invoke_transport+0xf5/0x27e0 drivers/usb/storage/transport.c:606
  usb_stor_transparent_scsi_command+0x5d/0x70  
drivers/usb/storage/protocol.c:108
  usb_stor_control_thread+0xca6/0x11a0 drivers/usb/storage/usb.c:380
  kthread+0x4b5/0x4f0 kernel/kthread.c:256
  ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355
Kernel Offset: disabled
Rebooting in 86400 seconds..


Tested on:

commit:         c40e5c97 kmsan: drop some dead code in kmsan_shadow.c
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=153ba453600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=49548798e87d32d7
dashboard link: https://syzkaller.appspot.com/bug?extid=e7d46eb426883fb97efd
compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
80fee25776c2fb61e74c1ecb1a523375c2500b69)

