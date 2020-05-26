Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 577A319C7D8
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2020 19:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388922AbgDBRWE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Apr 2020 13:22:04 -0400
Received: from mail-il1-f200.google.com ([209.85.166.200]:51564 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729549AbgDBRWE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Apr 2020 13:22:04 -0400
Received: by mail-il1-f200.google.com with SMTP id j12so3966461ilf.18
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2020 10:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=B/XTuHBSiQ3gIBuNZet8aYUG6N2S7fb2DwvFhED2020=;
        b=O2YP9ZqAlVYRylVCkOgs5RpxEvHQEwrobxT/Je61bAzMWqfsD65kQnWGIjOqSl7KSB
         wg8+2EjWoiw8VpT+yvSJfv+9DEpoqtmCkVPlDk8Kl9weB3pCCcKH4eHbcBeF70b2AKAb
         HeYMgE43/zhATSVv6V57Uhe8je69EjQ6b1gf3nfsOgOGu7NjKaXQCBxExQoOwQVq0hFU
         bLwX8yvpy5PiQyK6r4O1+7G3pieZIw/LVkl2y7mQQv0oI1QCo7F9k3cQFIaIqRyrr1LS
         Net4dVKs2OdlTZExVluALVC5qV3eofOZIvvL03xPXnMrZQuJCBjUxDcTiz/b65CQ2Pei
         na8w==
X-Gm-Message-State: AGi0PuZfsSjVzMKWOthMIISwATMLDJtPOnZUPtvfDHVN91i8fDExI3zL
        uZm5wY7F6zza+PQVNMper0sxNchVLSBQSvxrAfyxBIlZpXFJ
X-Google-Smtp-Source: APiQypLGPPBWr2wVDBADwyq0zGJhXUyZTNH4f8Vkk4ANS/pdnPyh2rRvcHllQnf6HeyJ2Z9WZxSh0EFgoyh6EeyyOC+bgo0Pu4Lb
MIME-Version: 1.0
X-Received: by 2002:a05:6638:c50:: with SMTP id g16mr4157249jal.99.1585848123295;
 Thu, 02 Apr 2020 10:22:03 -0700 (PDT)
Date:   Thu, 02 Apr 2020 10:22:03 -0700
In-Reply-To: <CAAeHK+wpZ3t-1WFr9Tyt51HFP+m=umFz_=EKcNAGif1Ekyf=gQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000e8b8005a2520af1@google.com>
Subject: Re: WARNING in usbhid_raw_request/usb_submit_urb (3)
From:   syzbot <syzbot+db339689b2101f6f6071@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        ingrassia@epigenesys.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer still triggered crash:
WARNING in usbhid_raw_request/usb_submit_urb

------------[ cut here ]------------
usb 3-1: BOGUS urb xfer, pipe 2 != type 2, ep addr 0x00, pipe 0x80001a00, xfertype 0
WARNING: CPU: 1 PID: 4932 at drivers/usb/core/urb.c:478 usb_submit_urb+0x11eb/0x14d0 drivers/usb/core/urb.c:478
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 4932 Comm: syz-executor.2 Not tainted 5.6.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xef/0x16e lib/dump_stack.c:118
 panic+0x2aa/0x6e1 kernel/panic.c:221
 __warn.cold+0x2f/0x30 kernel/panic.c:582
 report_bug+0x27b/0x2f0 lib/bug.c:195
 fixup_bug arch/x86/kernel/traps.c:174 [inline]
 fixup_bug arch/x86/kernel/traps.c:169 [inline]
 do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:267
 do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:286
 invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1027
RIP: 0010:usb_submit_urb+0x11eb/0x14d0 drivers/usb/core/urb.c:478
Code: fd 4c 89 ff e8 36 57 17 ff 45 89 e9 44 89 e1 48 c7 c7 80 dd 3b 86 55 48 89 c6 53 44 8b 44 24 2c 48 8b 54 24 30 e8 ad 17 b2 fd <0f> 0b 58 5a e9 bb f3 ff ff e8 d7 86 dd fd 0f 1f 44 00 00 e8 cd 86
RSP: 0018:ffff8881c7ff7b30 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000080001a00 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff812974dd RDI: ffffed1038ffef58
RBP: 0000000000000000 R08: ffff8881cd729880 R09: ffffed103b666248
R10: ffffed103b666247 R11: ffff8881db33123f R12: 0000000000000002
R13: 0000000000000000 R14: ffff8881d98d7000 R15: ffff8881d02f30a0
 usb_start_wait_urb+0x108/0x4c0 drivers/usb/core/message.c:58
 usb_internal_control_msg drivers/usb/core/message.c:102 [inline]
 usb_control_msg+0x31c/0x4a0 drivers/usb/core/message.c:153
 usbhid_set_raw_report drivers/hid/usbhid/hid-core.c:917 [inline]
 usbhid_raw_request+0x21f/0x640 drivers/hid/usbhid/hid-core.c:1265
 hid_hw_raw_request include/linux/hid.h:1079 [inline]
 hidraw_send_report+0x296/0x500 drivers/hid/hidraw.c:151
 hidraw_ioctl+0x620/0xaf0 drivers/hid/hidraw.c:422
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0x11a/0x180 fs/ioctl.c:763
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl fs/ioctl.c:770 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:770
 do_syscall_64+0xb6/0x5a0 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45c849
Code: ad b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 7b b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007fa1cf489c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fa1cf48a6d4 RCX: 000000000045c849
RDX: 00000000200000c0 RSI: 0000000080404806 RDI: 0000000000000006
RBP: 000000000076bfa0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000335 R14: 00000000004c59df R15: 000000000076bfac
Kernel Offset: disabled
Rebooting in 86400 seconds..


Tested on:

commit:         0fa84af8 Merge tag 'usb-serial-5.7-rc1' of https://git.ker..
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1652148fe00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6b9c154b0c23aecf
dashboard link: https://syzkaller.appspot.com/bug?extid=db339689b2101f6f6071
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1174b8fbe00000

