Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF125A36FA
	for <lists+linux-usb@lfdr.de>; Sat, 27 Aug 2022 12:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234021AbiH0KWZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Aug 2022 06:22:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232966AbiH0KWY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 27 Aug 2022 06:22:24 -0400
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D271E0C4
        for <linux-usb@vger.kernel.org>; Sat, 27 Aug 2022 03:22:23 -0700 (PDT)
Received: by mail-il1-f198.google.com with SMTP id w11-20020a056e021c8b00b002ea48389206so2916181ill.3
        for <linux-usb@vger.kernel.org>; Sat, 27 Aug 2022 03:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc;
        bh=Gb7abvGIHoaB/5SBUEpY/fy+KAw1/SvawtzKQ+r85EU=;
        b=H1IKdqR7EWAEifnOHuxCwNr0YydHmy3ImAoM5z8hT40NzqfI51H72Wdv6ok+jISU2o
         zZOHz0gk9FYrcJ0j7YdLFPXpSR9NG5OzOzWBFb16tqdiXUSWBO1bANn1b+jue1ar9H03
         Pquk6z8BoL15JpHiaJ3rz5467vak5QmzC7WVkj/ES3unyw1Zyp1k/Du8Uo0oUTGFELJS
         U1FhuE9OVxjv2/xFFRam0R+kSJhanNxlQPC/HKw39CnKUzPBx5eQmFNagIULdv6+4MwW
         7WFxWUGPnjPb3dh4eJ3jAKuGO2m/s9DABNmIAgq/hEw0mas0kh/19o/YMkkv0UwkKYH2
         TTVw==
X-Gm-Message-State: ACgBeo2zAeMbv8h0sCXhs8f+F8jdAKn3KE9c8FF2T84UHpU2BK5ZK1Oh
        i4jT7C/sUgtdnC9PZFRNdmKcp7VmBYptii/ekY4YF3TJPGmt
X-Google-Smtp-Source: AA6agR5hmEyV7Vp5romEdJsYJsNhDtxKXA9ReYvnliAArlj2k8k8quqeHF3rzrEoFixJvj+jEPhqJlF9ZvZVR57cw+F47QmVc+Co
MIME-Version: 1.0
X-Received: by 2002:a02:6a43:0:b0:348:e25e:21ad with SMTP id
 m3-20020a026a43000000b00348e25e21admr5738465jaf.242.1661595742554; Sat, 27
 Aug 2022 03:22:22 -0700 (PDT)
Date:   Sat, 27 Aug 2022 03:22:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fedb3e05e736678c@google.com>
Subject: [syzbot] usb-testing boot error: BUG: unable to handle kernel paging
 request in kernel_execve
From:   syzbot <syzbot+9bf040803765a6ca02c4@syzkaller.appspotmail.com>
To:     ebiederm@xmission.com, keescook@chromium.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    4dce3b375179 usb/hcd: Fix dma_map_sg error check
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=1000fa65080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3cb39b084894e9a5
dashboard link: https://syzkaller.appspot.com/bug?extid=9bf040803765a6ca02c4
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9bf040803765a6ca02c4@syzkaller.appspotmail.com

BUG: unable to handle page fault for address: ffffdc0000000000
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 100026067 P4D 100026067 PUD 0 
Oops: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 258 Comm: kworker/u4:1 Not tainted 6.0.0-rc1-syzkaller-00028-g4dce3b375179 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/22/2022
RIP: 0010:strnlen+0x3b/0x70 lib/string.c:504
Code: 74 3c 48 bb 00 00 00 00 00 fc ff df 49 89 fc 48 89 f8 eb 09 48 83 c0 01 48 39 e8 74 1e 48 89 c2 48 89 c1 48 c1 ea 03 83 e1 07 <0f> b6 14 1a 38 ca 7f 04 84 d2 75 11 80 38 00 75 d9 4c 29 e0 48 83
RSP: 0000:ffffc9000181fe08 EFLAGS: 00010246
RAX: ffff000000000000 RBX: dffffc0000000000 RCX: 0000000000000000
RDX: 1fffe00000000000 RSI: 0000000000020000 RDI: ffff000000000000
RBP: ffff000000020000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000006 R11: 0000000000000000 R12: ffff000000000000
R13: ffff000000000000 R14: dffffc0000000000 R15: 1ffff11021cd1ab0
FS:  0000000000000000(0000) GS:ffff8881f6800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffdc0000000000 CR3: 0000000007825000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 strnlen include/linux/fortify-string.h:119 [inline]
 copy_string_kernel+0x27/0x460 fs/exec.c:616
 copy_strings_kernel+0xb3/0x190 fs/exec.c:655
 kernel_execve+0x377/0x500 fs/exec.c:2001
 call_usermodehelper_exec_async+0x2e3/0x580 kernel/umh.c:112
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306
 </TASK>
Modules linked in:
CR2: ffffdc0000000000
---[ end trace 0000000000000000 ]---
RIP: 0010:strnlen+0x3b/0x70 lib/string.c:504
Code: 74 3c 48 bb 00 00 00 00 00 fc ff df 49 89 fc 48 89 f8 eb 09 48 83 c0 01 48 39 e8 74 1e 48 89 c2 48 89 c1 48 c1 ea 03 83 e1 07 <0f> b6 14 1a 38 ca 7f 04 84 d2 75 11 80 38 00 75 d9 4c 29 e0 48 83
RSP: 0000:ffffc9000181fe08 EFLAGS: 00010246
RAX: ffff000000000000 RBX: dffffc0000000000 RCX: 0000000000000000
RDX: 1fffe00000000000 RSI: 0000000000020000 RDI: ffff000000000000
RBP: ffff000000020000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000006 R11: 0000000000000000 R12: ffff000000000000
R13: ffff000000000000 R14: dffffc0000000000 R15: 1ffff11021cd1ab0
FS:  0000000000000000(0000) GS:ffff8881f6800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffdc0000000000 CR3: 0000000007825000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	74 3c                	je     0x3e
   2:	48 bb 00 00 00 00 00 	movabs $0xdffffc0000000000,%rbx
   9:	fc ff df
   c:	49 89 fc             	mov    %rdi,%r12
   f:	48 89 f8             	mov    %rdi,%rax
  12:	eb 09                	jmp    0x1d
  14:	48 83 c0 01          	add    $0x1,%rax
  18:	48 39 e8             	cmp    %rbp,%rax
  1b:	74 1e                	je     0x3b
  1d:	48 89 c2             	mov    %rax,%rdx
  20:	48 89 c1             	mov    %rax,%rcx
  23:	48 c1 ea 03          	shr    $0x3,%rdx
  27:	83 e1 07             	and    $0x7,%ecx
* 2a:	0f b6 14 1a          	movzbl (%rdx,%rbx,1),%edx <-- trapping instruction
  2e:	38 ca                	cmp    %cl,%dl
  30:	7f 04                	jg     0x36
  32:	84 d2                	test   %dl,%dl
  34:	75 11                	jne    0x47
  36:	80 38 00             	cmpb   $0x0,(%rax)
  39:	75 d9                	jne    0x14
  3b:	4c 29 e0             	sub    %r12,%rax
  3e:	48                   	rex.W
  3f:	83                   	.byte 0x83


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
