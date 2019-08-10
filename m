Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF8988CB9
	for <lists+linux-usb@lfdr.de>; Sat, 10 Aug 2019 20:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbfHJSPH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 10 Aug 2019 14:15:07 -0400
Received: from mail-ot1-f69.google.com ([209.85.210.69]:35958 "EHLO
        mail-ot1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbfHJSPH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 10 Aug 2019 14:15:07 -0400
Received: by mail-ot1-f69.google.com with SMTP id f11so76015366otq.3
        for <linux-usb@vger.kernel.org>; Sat, 10 Aug 2019 11:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=MsmEXwped4cbyL6h6bs/KZ2LTHxX7J5FpxmhjfgV7og=;
        b=IS6UPc4Dn9i4j3s2H104xLQd5yPUaypGMPTb3qulsPsfPOVw3LE4aFSO9hR2Hj2wg+
         N0zBoXnt0MNsrYkwH/MiwBtBpLsZ+KC8OVo0VN01AuI5E9Hv3YRGID/18mZt3iML8CUb
         /aQEkSi4N1QHntQMcNLU81MHiwEa7X4vtvldSS/GuikH54HT/dPgqeiJArnd6/UHn1nk
         6t2grd5HtXr33LSiQBEUFxlmxVctHFTwvxjhvSCSxdXA3phQxZ7i0/Og4Q+2+ju1eXAS
         xN4d/DckQWOSd/HfmBgjWfOHU8gfSafPrK1YYagfeT7Zbe8XUSClURg6UfB7CKb5ExJx
         rZ1A==
X-Gm-Message-State: APjAAAW776Z5ij0YOSxlsKuW1YVJ5M4//DIFoiRlVfR5iWpUe7g1C9aR
        LtdjJ6T1bSZqH7rb/bGgNy0xQSgoWG6AjL9a+stxjKkt8qzJ
X-Google-Smtp-Source: APXvYqzuX78j5MZdD9NknMDpWZDKRcpJUyudMpGZijC4CslADfAYaMDlmkJ3ExpZNosBtrPKqQzkTaBIJ6YYhsvueATdKqFCgLX8
MIME-Version: 1.0
X-Received: by 2002:a02:c6a9:: with SMTP id o9mr29951040jan.90.1565460906127;
 Sat, 10 Aug 2019 11:15:06 -0700 (PDT)
Date:   Sat, 10 Aug 2019 11:15:06 -0700
In-Reply-To: <0000000000005c056c058f9a5437@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000383acd058fc745d8@google.com>
Subject: Re: BUG: bad usercopy in ld_usb_read
From:   syzbot <syzbot+45b2f40f0778cfa7634e@syzkaller.appspotmail.com>
To:     akpm@linux-foundation.org, allison@lohutok.net,
        andreyknvl@google.com, cai@lca.pw, gregkh@linuxfoundation.org,
        keescook@chromium.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-usb@vger.kernel.org,
        mhund@ld-didactic.de, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot has found a reproducer for the following crash on:

HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=17cf0b16600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
dashboard link: https://syzkaller.appspot.com/bug?extid=45b2f40f0778cfa7634e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=151bab16600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=148f8cd2600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+45b2f40f0778cfa7634e@syzkaller.appspotmail.com

ldusb 4-1:0.28: Read buffer overflow, -3222596215958809898 bytes dropped
usercopy: Kernel memory exposure attempt detected from process stack  
(offset 0, size 2147479552)!
------------[ cut here ]------------
kernel BUG at mm/usercopy.c:98!
invalid opcode: 0000 [#1] SMP KASAN
CPU: 1 PID: 2023 Comm: syz-executor861 Not tainted 5.3.0-rc2+ #25
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
RIP: 0010:usercopy_abort+0xb9/0xbb mm/usercopy.c:98
Code: e8 c1 f7 d6 ff 49 89 d9 4d 89 e8 4c 89 e1 41 56 48 89 ee 48 c7 c7 e0  
f3 cd 85 ff 74 24 08 41 57 48 8b 54 24 20 e8 15 98 c1 ff <0f> 0b e8 95 f7  
d6 ff e8 80 9f fd ff 8b 54 24 04 49 89 d8 4c 89 e1
RSP: 0018:ffff8881cbda7c40 EFLAGS: 00010282
RAX: 0000000000000061 RBX: ffffffff85cdf100 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8128a0fd RDI: ffffed10397b4f7a
RBP: ffffffff85cdf2c0 R08: 0000000000000061 R09: fffffbfff11acda1
R10: fffffbfff11acda0 R11: ffffffff88d66d07 R12: ffffffff85cdf4e0
R13: ffffffff85cdf100 R14: 000000007ffff000 R15: ffffffff85cdf100
FS:  00007f10bb76a700(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7135a49000 CR3: 00000001d20e8000 CR4: 00000000001406e0
Call Trace:
  __check_object_size mm/usercopy.c:276 [inline]
  __check_object_size.cold+0x91/0xba mm/usercopy.c:250
  check_object_size include/linux/thread_info.h:119 [inline]
  check_copy_size include/linux/thread_info.h:150 [inline]
  copy_to_user include/linux/uaccess.h:151 [inline]
  ld_usb_read+0x304/0x780 drivers/usb/misc/ldusb.c:495
  __vfs_read+0x76/0x100 fs/read_write.c:425
  vfs_read+0x1ea/0x430 fs/read_write.c:461
  ksys_read+0x1e8/0x250 fs/read_write.c:587
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x446e19
Code: e8 ec e7 ff ff 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 3b 07 fc ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f10bb769d98 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 00000000006dbc38 RCX: 0000000000446e19
RDX: 00000000ffffffbc RSI: 0000000020000040 RDI: 0000000000000004
RBP: 00000000006dbc30 R08: 0000000000000000 R09: 0000000000000000
R10: 000000000000000f R11: 0000000000000246 R12: 00000000006dbc3c
R13: 0001002402090100 R14: 000048c920200f11 R15: 08983baa00000112
Modules linked in:
---[ end trace 93f3613883c53c00 ]---
RIP: 0010:usercopy_abort+0xb9/0xbb mm/usercopy.c:98
Code: e8 c1 f7 d6 ff 49 89 d9 4d 89 e8 4c 89 e1 41 56 48 89 ee 48 c7 c7 e0  
f3 cd 85 ff 74 24 08 41 57 48 8b 54 24 20 e8 15 98 c1 ff <0f> 0b e8 95 f7  
d6 ff e8 80 9f fd ff 8b 54 24 04 49 89 d8 4c 89 e1
RSP: 0018:ffff8881cbda7c40 EFLAGS: 00010282
RAX: 0000000000000061 RBX: ffffffff85cdf100 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8128a0fd RDI: ffffed10397b4f7a
RBP: ffffffff85cdf2c0 R08: 0000000000000061 R09: fffffbfff11acda1
R10: fffffbfff11acda0 R11: ffffffff88d66d07 R12: ffffffff85cdf4e0
R13: ffffffff85cdf100 R14: 000000007ffff000 R15: ffffffff85cdf100
FS:  00007f10bb76a700(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7135a49000 CR3: 00000001d20e8000 CR4: 00000000001406e0

