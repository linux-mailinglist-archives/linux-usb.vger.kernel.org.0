Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB685EF4EB
	for <lists+linux-usb@lfdr.de>; Thu, 29 Sep 2022 14:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235484AbiI2MDZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Sep 2022 08:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbiI2MDY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Sep 2022 08:03:24 -0400
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C591E9D50A
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 05:03:22 -0700 (PDT)
Received: by mail-il1-f198.google.com with SMTP id h9-20020a056e021b8900b002f19c2a1836so910924ili.23
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 05:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Fz1z99bI0lkQe8D9Lo1ewYKMF1AYz9PpbOmzmYsq5gM=;
        b=Si+fFvaITDEaSSS/lAzKBf+GXwaLYegWkv5NbAbcP+nUfIpItkiowTQWRPzJW8GR2G
         /gFho+F9j5yTspMaqeDYoweJ5VemERqtRAT0obLn752/w3OFLUc7oCCwPdKlWG24M/We
         u4cj2eTtlt6WxLZhSskwQWwOG78vdtIH39rl9LX4AffX2HHmg01b3ugE9qvXCZNenjVG
         CeWhokm60kE2jHA/LRCuIgXL2Ljz1dWK8L7F7Rv9NPFSJ+anMygaKj4Wq91C5+QNgCQd
         b5F3vNA4qlB0+Gb7NVDCdt+quu5SBj3jI15ouEKdoEcDYQEsA3V9oo5TWm0Uv823c/f6
         j7Gg==
X-Gm-Message-State: ACrzQf0p0Hu2cc2sbjMQReHDhvxtyAJClNNPps0Xo1XVJAPtjxBd57Ol
        cuElB5xgEopaeXNsP5KkqodN4dM3VA3Bhfpq9YTZALEVFK7n
X-Google-Smtp-Source: AMsMyM6pk+ZRAxY/jEJjupDCNposUSC+qQGaHbSX36x9t7DXiN6xkkErZhTgK5XEaNIjlR8Cak+5b3dUyJpll6VPfrBdjK0FIjSF
MIME-Version: 1.0
X-Received: by 2002:a02:a682:0:b0:34c:14fc:b490 with SMTP id
 j2-20020a02a682000000b0034c14fcb490mr1657223jam.196.1664453002172; Thu, 29
 Sep 2022 05:03:22 -0700 (PDT)
Date:   Thu, 29 Sep 2022 05:03:22 -0700
In-Reply-To: <fe289e7f-dedc-a0bd-f79f-72c80dbd5028@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f0a64c05e9cfa921@google.com>
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

