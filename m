Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 299FF146A0E
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2020 14:59:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgAWN7o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jan 2020 08:59:44 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39870 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbgAWN7n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jan 2020 08:59:43 -0500
Received: by mail-pg1-f195.google.com with SMTP id 4so1429438pgd.6
        for <linux-usb@vger.kernel.org>; Thu, 23 Jan 2020 05:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sjMzd5d5O5klno2N+Q8qNePFE0MzXCnzEzQkYIfaX68=;
        b=DRhn3f7fOhZAhxvCubwI7OXXkPSAdfpLKnJSfcZm5+ofpn5kl4WV0M91FAQrY4Nkci
         Lf952EZxGyIURUJkzJC5qSK//dRCmPv4As4HsHpzWdIp2j6oiksJ5sUiL7b9pECYRFFl
         FWMMXyyH9p1NJOrmn3pNyyc1glNmOWKj9Kfcn7Uk50PucZkM9UVMqwR0r4y7Hn5cZqK0
         qede5U8xu559B2wz+eYovfAcRwg4DNGTsuuXVXpIL5ZnbzgiyhW9++N7uP/LT37/Vfpx
         6XQ0f3Jk2vHSF/JfxmRtrbCAZcsu+qYlbbkyhA4ubikPG9gTzHjXRwMXjEsFdMJPjdiN
         HXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sjMzd5d5O5klno2N+Q8qNePFE0MzXCnzEzQkYIfaX68=;
        b=rY1JY+8PkrU/CkoTc8gGV24Nzicx/0HVpbggg799kyoEZFjQHhZ91YBx49D/ag/xqw
         12nEOGhSEdqooqD31w3Nm6R3kMI49ZdMbzYKzXtEBFPKY3QYMlf87Sfh6KUmz7LolHyB
         TCvzn0oqLv9ewlF8JiMnVg1v0wwdsZtAbc4my4AKm0311f4nE8tkgJbA6AyGn6NpfIG0
         jun4C5PJZ1SeJMZ/d8RxTfMM3OSuSxkaMf87kyInSvASqZKBYuiAEv7nRTTrLyrhL0u9
         vq6llTEzrkhuOrQzsOMaAL8UrN2dzikfKu4V04MORElu8fRQdIlgednrbJAxD1CHc3H2
         CH0A==
X-Gm-Message-State: APjAAAXwbJarbWuKOoJ9NZbMQ5s8ol3i1pSeqJDVS38SJhy+knAjI1Ky
        WpOpCXWk0MfBR/QCky27hjihltLT4cTUEc+CRNeOHQ==
X-Google-Smtp-Source: APXvYqydwMjOqmRZvj9hXXOEAV6Zabu4cg9dtHiBE17VpcHJ/ZagXcDhNfdim+R2ctxLDX/pemrsZ3ZumdooAr6QL00=
X-Received: by 2002:a63:358a:: with SMTP id c132mr4228502pga.286.1579787982282;
 Thu, 23 Jan 2020 05:59:42 -0800 (PST)
MIME-Version: 1.0
References: <0000000000007ce1f40596c3651f@google.com> <CAAeHK+yqy+xJSe8RyBoZYNbG729rCwOMz6UCJ3zONhsA2004Cw@mail.gmail.com>
In-Reply-To: <CAAeHK+yqy+xJSe8RyBoZYNbG729rCwOMz6UCJ3zONhsA2004Cw@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 23 Jan 2020 14:59:31 +0100
Message-ID: <CAAeHK+wKdT07t=FBedvBxGyu=97pFdFABU_sGgEhw38KX6C3PA@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Read in build_audio_procunit (2)
To:     syzbot <syzbot+622d4ecb979f45c6a775@syzkaller.appspotmail.com>
Cc:     Allison Randal <allison@lohutok.net>, alsa-devel@alsa-project.org,
        =?UTF-8?B?5b2t6L6J?= <benquike@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Richard Fontana <rfontana@redhat.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Takashi Iwai <tiwai@suse.com>, wang6495@umn.edu,
        yuehaibing@huawei.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 3, 2019 at 3:04 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Thu, Nov 7, 2019 at 4:34 PM syzbot
> <syzbot+622d4ecb979f45c6a775@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot found the following crash on:
> >
> > HEAD commit:    d60bbfea usb: raw: add raw-gadget interface
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=132e5bcce00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=79de80330003b5f7
> > dashboard link: https://syzkaller.appspot.com/bug?extid=622d4ecb979f45c6a775
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1478c6b4e00000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=117cbf8ae00000
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+622d4ecb979f45c6a775@syzkaller.appspotmail.com
> >
> > usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> > usb 1-1: Product: syz
> > usb 1-1: Manufacturer: syz
> > usb 1-1: SerialNumber: syz
> > usb 1-1: 0:2 : does not exist
> > ==================================================================
> > BUG: KASAN: slab-out-of-bounds in uac_extension_unit_iExtension
> > include/uapi/linux/usb/audio.h:483 [inline]
> > BUG: KASAN: slab-out-of-bounds in build_audio_procunit+0xeab/0x13f0
> > sound/usb/mixer.c:2434
> > Read of size 1 at addr ffff8881d4aaa735 by task kworker/1:2/83
> >
> > CPU: 1 PID: 83 Comm: kworker/1:2 Not tainted 5.4.0-rc6+ #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> > Google 01/01/2011
> > Workqueue: usb_hub_wq hub_event
> > Call Trace:
> >   __dump_stack lib/dump_stack.c:77 [inline]
> >   dump_stack+0xca/0x13e lib/dump_stack.c:113
> >   print_address_description.constprop.0+0x36/0x50 mm/kasan/report.c:374
> >   __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:506
> >   kasan_report+0xe/0x20 mm/kasan/common.c:634
> >   uac_extension_unit_iExtension include/uapi/linux/usb/audio.h:483 [inline]
> >   build_audio_procunit+0xeab/0x13f0 sound/usb/mixer.c:2434
> >   parse_audio_extension_unit sound/usb/mixer.c:2483 [inline]
> >   parse_audio_unit+0x1812/0x36f0 sound/usb/mixer.c:2761
> >   snd_usb_mixer_controls+0x715/0xb90 sound/usb/mixer.c:3095
> >   snd_usb_create_mixer+0x2b5/0x1890 sound/usb/mixer.c:3445
> >   usb_audio_probe+0xc76/0x2010 sound/usb/card.c:653
> >   usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
> >   really_probe+0x281/0x6d0 drivers/base/dd.c:548
> >   driver_probe_device+0x104/0x210 drivers/base/dd.c:721
> >   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
> >   bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
> >   __device_attach+0x217/0x360 drivers/base/dd.c:894
> >   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
> >   device_add+0xae6/0x16f0 drivers/base/core.c:2202
> >   usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
> >   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
> >   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
> >   really_probe+0x281/0x6d0 drivers/base/dd.c:548
> >   driver_probe_device+0x104/0x210 drivers/base/dd.c:721
> >   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
> >   bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
> >   __device_attach+0x217/0x360 drivers/base/dd.c:894
> >   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
> >   device_add+0xae6/0x16f0 drivers/base/core.c:2202
> >   usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2537
> >   hub_port_connect drivers/usb/core/hub.c:5184 [inline]
> >   hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
> >   port_event drivers/usb/core/hub.c:5470 [inline]
> >   hub_event+0x1df8/0x3800 drivers/usb/core/hub.c:5552
> >   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
> >   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
> >   kthread+0x318/0x420 kernel/kthread.c:255
> >   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> >
> > Allocated by task 83:
> >   save_stack+0x1b/0x80 mm/kasan/common.c:69
> >   set_track mm/kasan/common.c:77 [inline]
> >   __kasan_kmalloc mm/kasan/common.c:510 [inline]
> >   __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:483
> >   kmalloc include/linux/slab.h:561 [inline]
> >   usb_get_configuration+0x311/0x3100 drivers/usb/core/config.c:862
> >   usb_enumerate_device drivers/usb/core/hub.c:2370 [inline]
> >   usb_new_device+0xd3/0x160 drivers/usb/core/hub.c:2506
> >   hub_port_connect drivers/usb/core/hub.c:5184 [inline]
> >   hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
> >   port_event drivers/usb/core/hub.c:5470 [inline]
> >   hub_event+0x1df8/0x3800 drivers/usb/core/hub.c:5552
> >   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
> >   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
> >   kthread+0x318/0x420 kernel/kthread.c:255
> >   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> >
> > Freed by task 211:
> >   save_stack+0x1b/0x80 mm/kasan/common.c:69
> >   set_track mm/kasan/common.c:77 [inline]
> >   kasan_set_free_info mm/kasan/common.c:332 [inline]
> >   __kasan_slab_free+0x130/0x180 mm/kasan/common.c:471
> >   slab_free_hook mm/slub.c:1424 [inline]
> >   slab_free_freelist_hook mm/slub.c:1475 [inline]
> >   slab_free mm/slub.c:3025 [inline]
> >   kfree+0xe4/0x320 mm/slub.c:3977
> >   do_new_mount fs/namespace.c:2827 [inline]
> >   do_mount+0x68a/0x1bf0 fs/namespace.c:3143
> >   ksys_mount+0xd7/0x150 fs/namespace.c:3352
> >   __do_sys_mount fs/namespace.c:3366 [inline]
> >   __se_sys_mount fs/namespace.c:3363 [inline]
> >   __x64_sys_mount+0xba/0x150 fs/namespace.c:3363
> >   do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:290
> >   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> >
> > The buggy address belongs to the object at ffff8881d4aaa600
> >   which belongs to the cache kmalloc-256 of size 256
> > The buggy address is located 53 bytes to the right of
> >   256-byte region [ffff8881d4aaa600, ffff8881d4aaa700)
> > The buggy address belongs to the page:
> > page:ffffea000752aa80 refcount:1 mapcount:0 mapping:ffff8881da002780
> > index:0x0 compound_mapcount: 0
> > flags: 0x200000000010200(slab|head)
> > raw: 0200000000010200 ffffea000752c900 0000000a0000000a ffff8881da002780
> > raw: 0000000000000000 0000000000100010 00000001ffffffff 0000000000000000
> > page dumped because: kasan: bad access detected
> >
> > Memory state around the buggy address:
> >   ffff8881d4aaa600: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >   ffff8881d4aaa680: 00 00 00 00 00 00 00 00 00 00 00 00 00 fc fc fc
> > > ffff8881d4aaa700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> >                                       ^
> >   ffff8881d4aaa780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> >   ffff8881d4aaa800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > ==================================================================
> >
> >
> > ---
> > This bug is generated by a bot. It may contain errors.
> > See https://goo.gl/tpsmEJ for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
> >
> > syzbot will keep track of this bug report. See:
> > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> > syzbot can test patches for this bug, for details see:
> > https://goo.gl/tpsmEJ#testing-patches
>
> #syz fix: ALSA: usb-audio: Fix incorrect size check for
> processing/extension units

#syz fix:
ALSA: usb-audio: Fix incorrect size check for processing/extension units
