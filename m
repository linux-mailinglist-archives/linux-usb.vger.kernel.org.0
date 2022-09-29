Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C946D5EF4EE
	for <lists+linux-usb@lfdr.de>; Thu, 29 Sep 2022 14:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234255AbiI2MFd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Sep 2022 08:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbiI2MFc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Sep 2022 08:05:32 -0400
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F2F15A8B9
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 05:05:29 -0700 (PDT)
Received: by mail-il1-f198.google.com with SMTP id k6-20020a92c246000000b002f80993e780so926994ilo.13
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 05:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Fz1z99bI0lkQe8D9Lo1ewYKMF1AYz9PpbOmzmYsq5gM=;
        b=UAEyBt2eO6qF9pbCQPdOybVaOqScPfF9LgO/M7uDIRBr+egOJ3HJOEltnkjlTTEeLq
         Ud2w2QdVlCnfye97blVM/HwhQ4LzLtzbNdZFwv2KR+yQDabOL0PrwRPC7mgs/hv+uoYd
         C3SwH5mPqddNIMa8tTrJ3OXzyD9waNuaSRrX5kwHuT7BpJdtDN6+yWaqK9aWEh6v/sy/
         kjM7WXTmg4cMAwPwriPRnW/0JGyU++kkHuqpzXnL487Vc9lF1w0l5I4CnlYm2gu6aTZZ
         J/1Cvqt1Dsk/H+ExL4d2sowFGsKpnjsMBFlh0qdDMetVcPgZIfSjteA2kHMUF3OAD+I1
         bjBA==
X-Gm-Message-State: ACrzQf2N0sNhitdnhrthdXzHdO/VCH4F+nqZIX+1dlsI1/kzYb3LJdSA
        ajkf1AZdfYnSdH6DD3gkXgFOc15mPE9AZqqsV3FkvWdhtKKu
X-Google-Smtp-Source: AMsMyM4qIqwSmGthElfsy62Fv0K8QPWP157uw3Y/ph6NPYkWHlVIuG5SjyAd07fzZ6AhSoI5SumzJJ1zzf9j6eJEXzrQ4vX8tY1V
MIME-Version: 1.0
X-Received: by 2002:a5e:cb02:0:b0:6a1:3aaf:ceea with SMTP id
 p2-20020a5ecb02000000b006a13aafceeamr1281761iom.120.1664453128881; Thu, 29
 Sep 2022 05:05:28 -0700 (PDT)
Date:   Thu, 29 Sep 2022 05:05:28 -0700
In-Reply-To: <fe289e7f-dedc-a0bd-f79f-72c80dbd5028@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007e0da805e9cfb183@google.com>
Subject: Re: [syzbot] KMSAN: uninit-value in idmouse_open
From:   syzbot <syzbot+79832d33eb89fb3cd092@syzkaller.appspotmail.com>
To:     glider@google.com, linux-usb@vger.kernel.org, oneukum@suse.com,
        syzkaller-bugs@googlegroups.com
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

syzbot tried to test the proposed patch but the build/boot failed:

le included from ./include/linux/cpumask.h:12:
In file included from ./include/linux/bitmap.h:11:
In file included from ./include/linux/string.h:253:
./include/linux/fortify-string.h:387:9: warning: 'memcpy' macro redefined [-Wmacro-redefined]
#define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
        ^
./arch/x86/include/asm/string_64.h:17:9: note: previous definition is here
#define memcpy __msan_memcpy
        ^
In file included from drivers/input/gameport/gameport.c:13:
In file included from ./include/linux/module.h:13:
In file included from ./include/linux/stat.h:19:
In file included from ./include/linux/time.h:60:
In file included from ./include/linux/time32.h:13:
In file included from ./include/linux/timex.h:67:
In file included from ./arch/x86/include/asm/timex.h:5:
In file included from ./arch/x86/include/asm/processor.h:22:
In file included from ./arch/x86/include/asm/msr.h:11:
In file included from ./arch/x86/include/asm/cpumask.h:5:
In file included from ./include/linux/cpumask.h:12:
In file included from ./include/linux/bitmap.h:11:
In file included from ./include/linux/string.h:253:
./include/linux/fortify-string.h:391:9: warning: 'memmove' macro redefined [-Wmacro-redefined]
#define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
        ^
./arch/x86/include/asm/string_64.h:73:9: note: previous definition is here
#define memmove __msan_memmove
        ^
2 warnings generated.
  CC      net/netlabel/netlabel_calipso.o
  CC      net/ipv4/fib_rules.o
In file included from drivers/firewire/core-transaction.c:9:
In file included from ./include/linux/completion.h:12:
In file included from ./include/linux/swait.h:7:
In file included from ./include/linux/spinlock.h:55:
In file included from ./include/linux/preempt.h:78:
In file included from ./arch/x86/include/asm/preempt.h:7:
In file included from ./include/linux/thread_info.h:60:
In file included from ./arch/x86/include/asm/thread_info.h:53:
In file included from ./arch/x86/include/asm/cpufeature.h:5:
In file included from ./arch/x86/include/asm/processor.h:22:
In file included from ./arch/x86/include/asm/msr.h:11:
In file included from ./arch/x86/include/asm/cpumask.h:5:
In file included from ./include/linux/cpumask.h:12:
In file included from ./include/linux/bitmap.h:11:
In file included from ./include/linux/string.h:253:
./include/linux/fortify-string.h:387:9: warning: 'memcpy' macro redefined [-Wmacro-redefined]
#define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
        ^
./arch/x86/include/asm/string_64.h:17:9: note: previous definition is here
#define memcpy __msan_memcpy
        ^
In file included from drivers/firewire/core-transaction.c:9:
In file included from ./include/linux/completion.h:12:
In file included from ./include/linux/swait.h:7:
In file included from ./include/linux/spinlock.h:55:
In file included from ./include/linux/preempt.h:78:
In file included from ./arch/x86/include/asm/preempt.h:7:
In file included from ./include/linux/thread_info.h:60:
In file included from ./arch/x86/include/asm/thread_info.h:53:
In file included from ./arch/x86/include/asm/cpufeature.h:5:
In file included from ./arch/x86/include/asm/processor.h:22:
In file included from ./arch/x86/include/asm/msr.h:11:
In file included from ./arch/x86/include/asm/cpumask.h:5:
In file included from ./include/linux/cpumask.h:12:
In file included from ./include/linux/bitmap.h:11:
In file included from ./include/linux/string.h:253:
./include/linux/fortify-string.h:391:9: warning: 'memmove' macro redefined [-Wmacro-redefined]
#define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
        ^
./arch/x86/include/asm/string_64.h:73:9: note: previous definition is here
#define memmove __msan_memmove
        ^
  CC      net/rds/send.o
In file included from net/netlabel/netlabel_calipso.c:18:
In file included from ./include/linux/socket.h:8:
In file included from ./include/linux/uio.h:9:
In file included from ./include/linux/thread_info.h:60:
In file included from ./arch/x86/include/asm/thread_info.h:53:
In file included from ./arch/x86/include/asm/cpufeature.h:5:
In file included from ./arch/x86/include/asm/processor.h:22:
In file included from ./arch/x86/include/asm/msr.h:11:
In file included from ./arch/x86/include/asm/cpumask.h:5:
In file included from ./include/linux/cpumask.h:12:
In file included from   CC      drivers/block/aoe/aoecmd.o
./include/linux/bitmap.h:11:
In file included from ./include/linux/string.h:253:
./include/linux/fortify-string.h:387:9: warning: 'memcpy' macro redefined [-Wmacro-redefined]
#define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
        ^
./arch/x86/include/asm/string_64.h:17:9: note: previous definition is here
#define memcpy __msan_memcpy
        ^
In file included from net/netlabel/netlabel_calipso.c:18:
In file included from ./include/linux/socket.h:8:
In file included from ./include/linux/uio.h:9:
In file included from ./include/linux/thread_info.h:60:
In file included from ./arch/x86/include/asm/thread_info.h:53:
In file included from ./arch/x86/include/asm/cpufeature.h:5:
In file included from ./arch/x86/include/asm/processor.h:22:
In file included from ./arch/x86/include/asm/msr.h:11:
In file included from ./arch/x86/include/asm/cpumask.h:5:
In file included from ./include/linux/cpumask.h:12:
In file included from ./include/linux/bitmap.h:11:
In file included from ./include/linux/string.h:253:
./include/linux/fortify-string.h:391:9: warning: 'memmove' macro redefined [-Wmacro-redefined]
#define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
        ^
./arch/x86/include/asm/string_64.h:73:9: note: previous definition is here
#define memmove __msan_memmove
        ^
In file included from drivers/block/aoe/aoecmd.c:7:
In file included from ./include/linux/ata.h:17:
In file included from ./include/linux/string.h:253:
./include/linux/fortify-string.h:387:9: warning: 'memcpy' macro redefined [-Wmacro-redefined]
#define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
        ^
./arch/x86/include/asm/string_64.h:17:9: note: previous definition is here
#define memcpy __msan_memcpy
        ^
In file included from drivers/block/aoe/aoecmd.c:7:
In file included from ./include/linux/ata.h:17:
In file included from ./include/linux/string.h:253:
./include/linux/fortify-string.h:391:9: warning: 'memmove' macro redefined [-Wmacro-redefined]
#define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
        ^
./arch/x86/include/asm/string_64.h:73:9: note: previous definition is here
#define memmove __msan_memmove
        ^
2 warnings generated.
In file included from net/rds/send.c:35:
In file included from ./include/linux/gfp.h:7:
In file included from ./include/linux/mmzone.h:8:
In file included from ./include/linux/spinlock.h:55:
In file included from ./include/linux/preempt.h:78:
In file included from ./arch/x86/include/asm/preempt.h:7:
In file included from ./include/linux/thread_info.h:60:
In file included from ./arch/x86/include/asm/thread_info.h:53:
In file included from ./arch/x86/include/asm/cpufeature.h:5:
In file included from ./arch/x86/include/asm/processor.h:22:
In file included from ./arch/x86/include/asm/msr.h:11:
In file included from ./arch/x86/include/asm/cpumask.h:5:
In file included from ./include/linux/cpumask.h:12:
In file included from ./include/linux/bitmap.h:11:
In file included from ./include/linux/string.h:253:
./include/linux/fortify-string.h:387:9: warning: 'memcpy' macro redefined [-Wmacro-redefined]
#define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
        ^
./arch/x86/include/asm/string_64.h:17:9: note: previous definition is here
#define memcpy __msan_memcpy
        ^
In file included from net/rds/send.c:35:
In file included from ./include/linux/gfp.h:7:
In file included from ./include/linux/mmzone.h:8:
In file included from ./include/linux/spinlock.h:55:
In file included from ./include/linux/preempt.h:78:
In file included from ./arch/x86/include/asm/preempt.h:7:
In file included from ./include/linux/thread_info.h:60:
In file included from ./arch/x86/include/asm/thread_info.h:53:
In file included from ./arch/x86/include/asm/cpufeature.h:5:
In file included from ./arch/x86/include/asm/processor.h:22:
In file included from ./arch/x86/include/asm/msr.h:11:
In file included from ./arch/x86/include/asm/cpumask.h:5:
In file included from ./include/linux/cpumask.h:12:
In file included from ./include/linux/bitmap.h:11:
In file included from ./include/linux/string.h:253:
./include/linux/fortify-string.h:391:9: warning: 'memmove' macro redefined [-Wmacro-redefined]
#define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
        ^
./arch/x86/include/asm/string_64.h:73:9: note: previous definition is here
#define memmove __msan_memmove
        ^
In file included from net/ipv4/fib_rules.c:19:
In file included from ./include/linux/netdevice.h:24:
In file included from ./include/linux/timer.h:6:
In file included from ./include/linux/ktime.h:24:
In file included from ./include/linux/time.h:60:
In file included from ./include/linux/time32.h:13:
In file included from ./include/linux/timex.h:67:
In file included from ./arch/x86/include/asm/timex.h:5:
In file included from ./arch/x86/include/asm/processor.h:22:
In file included from ./arch/x86/include/asm/msr.h:11:
In file included from ./arch/x86/include/asm/cpumask.h:5:
In file included from ./include/linux/cpumask.h:12:
In file included from ./include/linux/bitmap.h:11:
In file included from ./include/linux/string.h:253:
./include/linux/fortify-string.h:387:9: warning: 'memcpy' macro redefined [-Wmacro-redefined]
#define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
        ^
./arch/x86/include/asm/string_64.h:17:9: note: previous definition is here
#define memcpy __msan_memcpy
        ^
In file included from net/ipv4/fib_rules.c:19:
In file included from ./include/linux/netdevice.h:24:
In file included from ./include/linux/timer.h:6:
In file included from ./include/linux/ktime.h:24:
In file included from ./include/linux/time.h:60:
In file included from ./include/linux/time32.h:13:
In file included from ./include/linux/timex.h:67:
In file included from ./arch/x86/include/asm/timex.h:5:
In file included from ./arch/x86/include/asm/processor.h:22:
In file included from ./arch/x86/include/asm/msr.h:11:
In file included from ./arch/x86/include/asm/cpumask.h:5:
In file included from ./include/linux/cpumask.h:12:
In file included from ./include/linux/bitmap.h:11:
In file included from ./include/linux/string.h:253:
./include/linux/fortify-string.h:391:9: warning: 'memmove' macro redefined [-Wmacro-redefined]
#define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
        ^
./arch/x86/include/asm/string_64.h:73:9: note: previous definition is here
#define memmove __msan_memmove
        ^
2 warnings generated.
2 warnings generated.
2 warnings generated.
In file included from net/wireless/scan.c:11:
In file included from ./include/linux/slab.h:15:
In file included from ./include/linux/gfp.h:7:
In file included from ./include/linux/mmzone.h:8:
In file included from ./include/linux/spinlock.h:55:
In file included from ./include/linux/preempt.h:78:
In file included from ./arch/x86/include/asm/preempt.h:7:
In file included from ./include/linux/thread_info.h:60:
In file included from ./arch/x86/include/asm/thread_info.h:53:
In file included from ./arch/x86/include/asm/cpufeature.h:5:
In file included from ./arch/x86/include/asm/processor.h:22:
In file included from ./arch/x86/include/asm/msr.h:11:
In file included from ./arch/x86/include/asm/cpumask.h:5:
In file included from ./include/linux/cpumask.h:12:
In file included from ./include/linux/bitmap.h:11:
In file included from ./include/linux/string.h:253:
./include/linux/fortify-string.h:387:9: warning: 'memcpy' macro redefined [-Wmacro-redefined]
#define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
        ^
./arch/x86/include/asm/string_64.h:17:9: note: previous definition is here
#define memcpy __msan_memcpy
        ^
In file included from net/wireless/scan.c:11:
In file included from ./include/linux/slab.h:15:
In file included from ./include/linux/gfp.h:7:
In file included from ./include/linux/mmzone.h:8:
In file included from ./include/linux/spinlock.h:55:
In file included from ./include/linux/preempt.h:78:
In file included from ./arch/x86/include/asm/preempt.h:7:
In file included from ./include/linux/thread_info.h:60:
In file included from ./arch/x86/include/asm/thread_info.h:53:
In file included from ./arch/x86/include/asm/cpufeature.h:5:
In file included from ./arch/x86/include/asm/processor.h:22:
In file included from ./arch/x86/include/asm/msr.h:11:
In file included from ./arch/x86/include/asm/cpumask.h:5:
In file included from ./include/linux/cpumask.h:12:
In file included from ./include/linux/bitmap.h:11:
In file included from ./include/linux/string.h:253:
./include/linux/fortify-string.h:391:9: warning: 'memmove' macro redefined [-Wmacro-redefined]
#define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
        ^
./arch/x86/include/asm/string_64.h:73:9: note: previous definition is here
#define memmove __msan_memmove
        ^
22 warnings generated.
 warnings generated.
2 warnings generated.
  CC      drivers/usb/common/debug.o
  CC      fs/gfs2/meta_io.o
2 warnings generated.
2 warnings generated.
2 warnings generated.
2 warnings generated.
  CC      drivers/block/aoe/aoedev.o
2 warnings generated.
2 warnings generated.
  CC      drivers/target/target_core_tmr.o
In file included from net/rds/recv.c:34:
In file included from ./include/linux/slab.h:15:
In file included from ./include/linux/gfp.h:7:
In file included from ./include/linux/mmzone.h:8:
In file included from ./include/linux/spinlock.h:55:
In file included from ./include/linux/preempt.h:78:
In file included from ./arch/x86/include/asm/preempt.h:7:
In file included from ./include/linux/thread_info.h:60:
In file included from ./arch/x86/include/asm/thread_info.h:53:
In file included from ./arch/x86/include/asm/cpufeature.h:5:
In file included from ./arch/x86/include/asm/processor.h:22:
In file included from ./arch/x86/include/asm/msr.h:11:
In file included from ./arch/x86/include/asm/cpumask.h:5:
In file included from ./include/linux/cpumask.h:12:
In file included from ./include/linux/bitmap.h:11:
In file included from ./include/linux/string.h:253:
./include/linux/fortify-string.h:387:9: warning: 'memcpy' macro redefined [-Wmacro-redefined]
#define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
        ^
./arch/x86/include/asm/string_64.h:17:9: note: previous definition is here
#define memcpy __msan_memcpy
        ^
In file included from net/rds/recv.c:34:
In file included from ./include/linux/slab.h:15:
In file included from ./include/linux/gfp.h:7:
In file included from ./include/linux/mmzone.h:8:
In file included from ./include/linux/spinlock.h:55:
In file included from ./include/linux/preempt.h:78:
In file included from ./arch/x86/include/asm/preempt.h:7:
In file included from ./include/linux/thread_info.h:60:
In file included from ./arch/x86/include/asm/thread_info.h:53:
In file included from ./arch/x86/include/asm/cpufeature.h:5:
In file included from ./arch/x86/include/asm/processor.h:22:
In file included from ./arch/x86/include/asm/msr.h:11:
In file included from ./arch/x86/include/asm/cpumask.h:5:
In file included from ./include/linux/cpumask.h:12:
In file included from ./include/linux/bitmap.h:11:
In file included from ./include/linux/string.h:253:
./include/linux/fortify-string.h:391:9: warning: 'memmove' macro redefined [-Wmacro-redefined]
#define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
        ^
./arch/x86/include/asm/string_64.h:73:9: note: previous definition is here
#define memmove __msan_memmove
        ^
  CC      fs/gfs2/aops.o
  CC      net/dccp/ackvec.o
  CC      fs/gfs2/dentry.o
In file included from drivers/usb/common/common.c:12:
In file included from ./include/linux/module.h:13:
In file included from ./include/linux/stat.h:19:
In file included from ./include/linux/time.h:60:
In file included from ./include/linux/time32.h:13:
In file included from ./include/linux/timex.h:67:
In file included from ./arch/

Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=133848f4880000


Tested on:

commit:         968c2729 x86: kmsan: fix comment in kmsan_shadow.c
git tree:       https://github.com/google/kmsan.git master
dashboard link: https://syzkaller.appspot.com/bug?extid=79832d33eb89fb3cd092
compiler:       clang version 15.0.0 (https://github.com/llvm/llvm-project.git 610139d2d9ce6746b3c617fb3e2f7886272d26ff), GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12a57360880000

