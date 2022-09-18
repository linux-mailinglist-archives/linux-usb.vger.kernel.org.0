Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6AEF5BBD67
	for <lists+linux-usb@lfdr.de>; Sun, 18 Sep 2022 12:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbiIRKYn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 18 Sep 2022 06:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbiIRKYg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 18 Sep 2022 06:24:36 -0400
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B8272DCF
        for <linux-usb@vger.kernel.org>; Sun, 18 Sep 2022 03:24:32 -0700 (PDT)
Received: by mail-il1-f198.google.com with SMTP id z9-20020a921a49000000b002f0f7fb57e3so17277739ill.2
        for <linux-usb@vger.kernel.org>; Sun, 18 Sep 2022 03:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=4JhMVIDDJ64BMYvLacf07McKKw+xI7f7f41PajS0mP0=;
        b=doSQPBR8QBUeFlCRJcD2nK6h54gZS7z+5rotFfmkDb42+FTHD9w4X3r3ECGy2beVao
         FyFtIa6I/kSWt8EjL6XRAtaGunhp9r2Rz9PkiJ5i+55NxSV8Vp2kUaprBAGOEfNdkkUa
         bsdGwP1TTfr04KFyjFfhM5LEtZ0bKTiKJwI5mPqBy7WKfvevl++yjVMe2baEWecd6YoF
         8C/HmnTqu0aFlOPpzqU1BI8WRZKomf1aZHPxDlkEeicrxiTFszEjYWKyHElPtS79Uflp
         GsApWvFWma7uL2NeQdsF7RUas4OHOPhyOv1wvIqHn5yw+US0JRpfMWleM+7QlqchFEEd
         H3rg==
X-Gm-Message-State: ACrzQf022rJ+j+D/JSXPNRi2REAyUqm2+UnzizPEtXUqXlVMzZfG+CFW
        LNeFZ/U2Y6FdUZr7cO7GLJv1Y9FK8ZLQtk8nNOF0OGnrGoj9
X-Google-Smtp-Source: AMsMyM6DIl2hw2Izv01tZioDPyfkdJiJEcC/mpuQjtXolvMtgqkhDLJLYrVMrfv41GHRW0LRxy1X0zBGj/DKskDLZ7mx4H/30RLR
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a41:b0:2f1:cc2a:69d3 with SMTP id
 u1-20020a056e021a4100b002f1cc2a69d3mr5243527ilv.46.1663496671433; Sun, 18 Sep
 2022 03:24:31 -0700 (PDT)
Date:   Sun, 18 Sep 2022 03:24:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002f9c9705e8f10055@google.com>
Subject: [syzbot] KASAN: use-after-free Read in mon_bin_flush
From:   syzbot <syzbot+43438abe71dab88140c2@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    a335366bad13 Merge tag 'gpio-fixes-for-v6.0-rc6' of git://..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=15212ca0880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=98a30118ec9215e9
dashboard link: https://syzkaller.appspot.com/bug?extid=43438abe71dab88140c2
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11feb890880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15a27480880000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+43438abe71dab88140c2@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xdffffc00000001fc: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000fe0-0x0000000000000fe7]
CPU: 1 PID: 3614 Comm: syz-executor111 Not tainted 6.0.0-rc5-syzkaller-00094-ga335366bad13 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/26/2022
RIP: 0010:mon_bin_flush+0x131/0x290 drivers/usb/mon/mon_bin.c:885
Code: 48 c1 e9 03 42 80 3c 29 00 0f 85 4f 01 00 00 44 89 f1 81 e1 ff 0f 00 00 48 03 48 08 48 8d 79 24 49 89 cf 48 89 f9 48 c1 e9 03 <42> 0f b6 34 29 48 89 f9 83 e1 07 83 c1 03 40 38 f1 7c 09 40 84 f6
RSP: 0018:ffffc90003bbfd98 EFLAGS: 00010007
RAX: ffff88801d023b60 RBX: ffff888078923000 RCX: 00000000000001fc
RDX: 0000000000000000 RSI: ffffffff859cd539 RDI: 0000000000000fe4
RBP: 00000000fcffee00 R08: 0000000000000005 R09: 0000000000000000
R10: 00000000fcffee00 R11: 0000000000000000 R12: 0000000000000003
R13: dffffc0000000000 R14: 0000000002fb6fc0 R15: 0000000000000fc0
FS:  0000555555576300(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ff7d93dc736 CR3: 000000001db18000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 mon_bin_ioctl+0x198/0xcc0 drivers/usb/mon/mon_bin.c:1091
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fac26b14639
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 b1 14 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff3a8a4fb8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007fac26b14639
RDX: 00000000200005c0 RSI: 00000000c0109207 RDI: 0000000000000005
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000470 R11: 0000000000000246 R12: 00007fac26ad35e0
R13: 0000000000000000 R14: 00007fff3a8a4ff0 R15: 00007fff3a8a4fe0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:mon_bin_flush+0x131/0x290 drivers/usb/mon/mon_bin.c:885
Code: 48 c1 e9 03 42 80 3c 29 00 0f 85 4f 01 00 00 44 89 f1 81 e1 ff 0f 00 00 48 03 48 08 48 8d 79 24 49 89 cf 48 89 f9 48 c1 e9 03 <42> 0f b6 34 29 48 89 f9 83 e1 07 83 c1 03 40 38 f1 7c 09 40 84 f6
RSP: 0018:ffffc90003bbfd98 EFLAGS: 00010007
RAX: ffff88801d023b60 RBX: ffff888078923000 RCX: 00000000000001fc
RDX: 0000000000000000 RSI: ffffffff859cd539 RDI: 0000000000000fe4
RBP: 00000000fcffee00 R08: 0000000000000005 R09: 0000000000000000
R10: 00000000fcffee00 R11: 0000000000000000 R12: 0000000000000003
R13: dffffc0000000000 R14: 0000000002fb6fc0 R15: 0000000000000fc0
FS:  0000555555576300(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ff7d93dc736 CR3: 000000001db18000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	48 c1 e9 03          	shr    $0x3,%rcx
   4:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
   9:	0f 85 4f 01 00 00    	jne    0x15e
   f:	44 89 f1             	mov    %r14d,%ecx
  12:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
  18:	48 03 48 08          	add    0x8(%rax),%rcx
  1c:	48 8d 79 24          	lea    0x24(%rcx),%rdi
  20:	49 89 cf             	mov    %rcx,%r15
  23:	48 89 f9             	mov    %rdi,%rcx
  26:	48 c1 e9 03          	shr    $0x3,%rcx
* 2a:	42 0f b6 34 29       	movzbl (%rcx,%r13,1),%esi <-- trapping instruction
  2f:	48 89 f9             	mov    %rdi,%rcx
  32:	83 e1 07             	and    $0x7,%ecx
  35:	83 c1 03             	add    $0x3,%ecx
  38:	40 38 f1             	cmp    %sil,%cl
  3b:	7c 09                	jl     0x46
  3d:	40 84 f6             	test   %sil,%sil


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
