Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3416FD440E
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 17:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfJKPYC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 11:24:02 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:49121 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbfJKPYB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Oct 2019 11:24:01 -0400
Received: by mail-io1-f72.google.com with SMTP id w16so15133240ioc.15
        for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2019 08:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=M2Zk83UHjuHOijfJsrKFxRFCeO8Fg9AWHxC+LcAN1hg=;
        b=AeIzlWeFF+ynR2eRbxyLT2kgtlKr6Q465WUm5EipY3JTzmpEKz+eA5sre0IXMbtwQ4
         yRDNKk8TSSMj/pnQjnz0G0ioGjSRTCDduNcf9UpqMyzwONvnzjTtVVreYiFtbf4Sls52
         7X2ACwdAZfxZaLKEnTI3BsvAI3xjTqHrWEoUasJDYK0uG80wsXxIlmc9Y4gDrGWpMEUe
         tudZPDsHrMymFCtwOG7BthIPxOCvpcekV7wHpKaH1xI5rnL15keomu9iiitY/JQCl/Ql
         MSjKLmrMqGkc3ejQT+Jd/P8vq9JQMWq/VgwEryt6z66Jwx+6CRK3ugJU1AbFoTz4XTPf
         ZfTw==
X-Gm-Message-State: APjAAAWCgfpRgyJcUs//91fTB+wsaxLQuw93RlGuHoiwEhntUYitxZUf
        TXTwLHl3IL8uXPeaR+nd06pSWIXgGwxUSQnECOc2lf9/iore
X-Google-Smtp-Source: APXvYqz0/5nrdneWztk4yyxy1ZRB0qhZLNu5lKN/fsvPO6z8kvVN0lvp11QFDQqDZRXw4eAdQRRk8iz0WFHYTeuKcKxBAY+p/mSz
MIME-Version: 1.0
X-Received: by 2002:a5e:8819:: with SMTP id l25mr24986ioj.18.1570807441129;
 Fri, 11 Oct 2019 08:24:01 -0700 (PDT)
Date:   Fri, 11 Oct 2019 08:24:01 -0700
In-Reply-To: <b8b1e4fef9f3ece63909c38b3302621d76770caa.camel@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008a083f0594a41bf1@google.com>
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
KMSAN: uninit-value in sd_revalidate_disk

=====================================================
BUG: KMSAN: uninit-value in check_disk_change+0x423/0x4b0  
fs/block_dev.c:1499
CPU: 1 PID: 23508 Comm: scsi_id Not tainted 5.3.0-rc7+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x191/0x1f0 lib/dump_stack.c:113
  kmsan_report+0x13a/0x2b0 mm/kmsan/kmsan_report.c:108
  __msan_warning+0x73/0xe0 mm/kmsan/kmsan_instr.c:250
  media_not_present drivers/scsi/sd.c:1527 [inline]
  sd_spinup_disk drivers/scsi/sd.c:2096 [inline]
  sd_revalidate_disk+0x4d2/0xbef0 drivers/scsi/sd.c:3114
  check_disk_change+0x423/0x4b0 fs/block_dev.c:1499
  sd_open+0x471/0x8e0 drivers/scsi/sd.c:1356
  __blkdev_get+0x4a8/0x2480 fs/block_dev.c:1569
  blkdev_get+0x228/0x6d0 fs/block_dev.c:1707
  blkdev_open+0x36b/0x490 fs/block_dev.c:1846
  do_dentry_open+0xda7/0x1810 fs/open.c:797
  vfs_open+0xaf/0xe0 fs/open.c:906
  do_last fs/namei.c:3416 [inline]
  path_openat+0x17f4/0x6bb0 fs/namei.c:3533
  do_filp_open+0x2b8/0x710 fs/namei.c:3563
  do_sys_open+0x642/0xa30 fs/open.c:1089
  __do_sys_open fs/open.c:1107 [inline]
  __se_sys_open+0xad/0xc0 fs/open.c:1102
  __x64_sys_open+0x4a/0x70 fs/open.c:1102
  do_syscall_64+0xbc/0xf0 arch/x86/entry/common.c:297
  entry_SYSCALL_64_after_hwframe+0x63/0xe7
RIP: 0033:0x7f7c9e529120
Code: 48 8b 15 1b 4d 2b 00 f7 d8 64 89 02 83 c8 ff c3 90 90 90 90 90 90 90  
90 90 90 83 3d d5 a4 2b 00 00 75 10 b8 02 00 00 00 0f 05 <48> 3d 01 f0 ff  
ff 73 31 c3 48 83 ec 08 e8 5e 8c 01 00 48 89 04 24
RSP: 002b:00007fff97dee0a8 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 00007fff97dee5c0 RCX: 00007f7c9e529120
RDX: 00007fff97dee3c0 RSI: 0000000000000800 RDI: 00007fff97dee3c0
RBP: 00000000017ac010 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fff97dee5c0
R13: 00007fff97dee3c0 R14: 00000000017ac010 R15: 0000000000000000

Local variable description: ----sshdr.i@sd_revalidate_disk
Variable was created at:
  sd_spinup_disk drivers/scsi/sd.c:3108 [inline]
  sd_revalidate_disk+0x2d3/0xbef0 drivers/scsi/sd.c:3114
  check_disk_change+0x423/0x4b0 fs/block_dev.c:1499
=====================================================


Tested on:

commit:         1e76a3e5 kmsan: replace __GFP_NO_KMSAN_SHADOW with kmsan_i..
git tree:       https://github.com/google/kmsan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=144fd0a0e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f03c659d0830ab8d
dashboard link: https://syzkaller.appspot.com/bug?extid=e7d46eb426883fb97efd
compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
80fee25776c2fb61e74c1ecb1a523375c2500b69)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=110434ab600000

