Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6AC8E34B8
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 15:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393850AbfJXNtG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Oct 2019 09:49:06 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37804 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388216AbfJXNtF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Oct 2019 09:49:05 -0400
Received: by mail-pf1-f196.google.com with SMTP id y5so15196746pfo.4
        for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2019 06:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rL9YpRyTuHk70/QoA0F/U1TMIayhb73ZwaCrSIsUGq0=;
        b=UsqP464/4ZYI6OWZL4XHYBwL9bycMfpKQ5++JhEVtMKo0dG3NjwPEiX9R2NsXXWc4M
         XowBM8KWPOdtXCdYW5OEa81lXuS4k5IZ1px4o4beFuuF1DvWAR84tc2Xu7RehMxglk/f
         j57YzsaO+CJsTz5T6lDe0dFrntlZwRoWXvd9SuG5IF/DuV/cOQneovTMeo4ec3ZrMiw5
         dSCC+cdQLxBc8gur4COhlz3olcHe/hzc845romh421NdfIM9+XJzPTaSSWY0LqHlEAUE
         he48zkk61qfDW1TdbCe17vGExz/XLebfCtHWRXDHAMv+YIOqDbUc2tHVyprOiP7DFlMv
         1m6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rL9YpRyTuHk70/QoA0F/U1TMIayhb73ZwaCrSIsUGq0=;
        b=HjBulDLBBXMk59Ixfj55sDwYRQ5HKnLD2OkoSPVALFOnKrS2p3dvNYcIAmOdK0DRuI
         utmXcIIOOo6P+kB7bwORlOvu1mXfqGNQ/VjDnBntaQVRoJVpyuibkIvx8MrChn+5S4P+
         zCgHGvpGkW1ZrSOs0N7fzWwuWW+DX0zM2ZDMJteNErbP5RjfCyazZ3xP55EFwaAzvRnt
         9TxjZXt8WW1AE1auzReHf/n07MdIkFpaWqGZQT/xIVj8+0G3eCP9cIQNL1DU1topX0OC
         XtN6SzeluiyfMz2HG9CoceY45DqcizZkigqMKkAhSbvpGYOxEO+0e6RS/jTHd+PfCpid
         1bPQ==
X-Gm-Message-State: APjAAAU+qjgwEPQVwZSVNnH6ou8LBr3rSOkXogI9G3DRQTTxmhwPj+AV
        JHL6NZkU9xfWsee0+u19HCW0/Kbu7w2zYXlK/iT9FexQyAA=
X-Google-Smtp-Source: APXvYqzl/ZdSWSJ6mWUTfcNmk43PKaG+hCJrqHP/SB40ZEQLszeBwep9Yue5+aKI7eAEuVPxWq1LOM2ITfL5h6qRWgc=
X-Received: by 2002:a62:5503:: with SMTP id j3mr17488831pfb.93.1571924943211;
 Thu, 24 Oct 2019 06:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000001b0a40595a84593@google.com>
In-Reply-To: <00000000000001b0a40595a84593@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 24 Oct 2019 15:48:52 +0200
Message-ID: <CAAeHK+yM9+69_au5oZzqmRuFuh_SQr3nFCWGCcGueDrvsxyFgA@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in parse_term_proc_unit
To:     syzbot <syzbot+97e24236f1e2918ad968@syzkaller.appspotmail.com>
Cc:     Allison Randal <allison@lohutok.net>, alsa-devel@alsa-project.org,
        =?UTF-8?B?5b2t6L6J?= <benquike@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>, g@b4.vu,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Takashi Iwai <tiwai@suse.com>, wang6495@umn.edu,
        yuehaibing@huawei.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 24, 2019 at 3:47 PM syzbot
<syzbot+97e24236f1e2918ad968@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    22be26f7 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=13a38628e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=387eccb7ac68ec5
> dashboard link: https://syzkaller.appspot.com/bug?extid=97e24236f1e2918ad968
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12184764e00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1432ae28e00000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+97e24236f1e2918ad968@syzkaller.appspotmail.com
>
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: syz
> usb 1-1: Manufacturer: syz
> usb 1-1: SerialNumber: syz
> ==================================================================
> BUG: KASAN: use-after-free in uac_processing_unit_iProcessing
> include/uapi/linux/usb/audio.h:429 [inline]
> BUG: KASAN: use-after-free in parse_term_proc_unit+0x57a/0x5e0
> sound/usb/mixer.c:896
> Read of size 1 at addr ffff8881d5346d0e by task kworker/1:2/83
>
> CPU: 1 PID: 83 Comm: kworker/1:2 Not tainted 5.4.0-rc3+ #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0xca/0x13e lib/dump_stack.c:113
>   print_address_description.constprop.0+0x36/0x50 mm/kasan/report.c:374
>   __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:506
>   kasan_report+0xe/0x20 mm/kasan/common.c:634
>   uac_processing_unit_iProcessing include/uapi/linux/usb/audio.h:429 [inline]
>   parse_term_proc_unit+0x57a/0x5e0 sound/usb/mixer.c:896
>   __check_input_term+0xc32/0x13f0 sound/usb/mixer.c:984
>   parse_audio_feature_unit sound/usb/mixer.c:1875 [inline]
>   parse_audio_unit+0x101d/0x36f0 sound/usb/mixer.c:2753
>   snd_usb_mixer_controls+0x715/0xb90 sound/usb/mixer.c:3095
>   snd_usb_create_mixer+0x2b5/0x1890 sound/usb/mixer.c:3445
>   usb_audio_probe+0xc76/0x2010 sound/usb/card.c:653
>   usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
>   really_probe+0x281/0x6d0 drivers/base/dd.c:548
>   driver_probe_device+0x104/0x210 drivers/base/dd.c:721
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
>   bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
>   __device_attach+0x217/0x360 drivers/base/dd.c:894
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
>   device_add+0xae6/0x16f0 drivers/base/core.c:2201
>   usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
>   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
>   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
>   really_probe+0x281/0x6d0 drivers/base/dd.c:548
>   driver_probe_device+0x104/0x210 drivers/base/dd.c:721
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
>   bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
>   __device_attach+0x217/0x360 drivers/base/dd.c:894
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
>   device_add+0xae6/0x16f0 drivers/base/core.c:2201
>   usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
>   hub_port_connect drivers/usb/core/hub.c:5183 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5323 [inline]
>   port_event drivers/usb/core/hub.c:5469 [inline]
>   hub_event+0x1dd0/0x37e0 drivers/usb/core/hub.c:5551
>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> Allocated by task 83:
>   save_stack+0x1b/0x80 mm/kasan/common.c:69
>   set_track mm/kasan/common.c:77 [inline]
>   __kasan_kmalloc mm/kasan/common.c:510 [inline]
>   __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:483
>   kmalloc include/linux/slab.h:561 [inline]
>   usb_alloc_urb+0x65/0xb0 drivers/usb/core/urb.c:73
>   usb_internal_control_msg drivers/usb/core/message.c:94 [inline]
>   usb_control_msg+0x1c9/0x4a0 drivers/usb/core/message.c:152
>   usb_get_descriptor+0xc1/0x1b0 drivers/usb/core/message.c:647
>   usb_get_configuration+0x28e/0x3050 drivers/usb/core/config.c:836
>   usb_enumerate_device drivers/usb/core/hub.c:2369 [inline]
>   usb_new_device+0xd3/0x160 drivers/usb/core/hub.c:2505
>   hub_port_connect drivers/usb/core/hub.c:5183 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5323 [inline]
>   port_event drivers/usb/core/hub.c:5469 [inline]
>   hub_event+0x1dd0/0x37e0 drivers/usb/core/hub.c:5551
>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> Freed by task 83:
>   save_stack+0x1b/0x80 mm/kasan/common.c:69
>   set_track mm/kasan/common.c:77 [inline]
>   kasan_set_free_info mm/kasan/common.c:332 [inline]
>   __kasan_slab_free+0x130/0x180 mm/kasan/common.c:471
>   slab_free_hook mm/slub.c:1424 [inline]
>   slab_free_freelist_hook mm/slub.c:1475 [inline]
>   slab_free mm/slub.c:3018 [inline]
>   kfree+0xe4/0x320 mm/slub.c:3967
>   urb_destroy drivers/usb/core/urb.c:26 [inline]
>   kref_put include/linux/kref.h:65 [inline]
>   usb_free_urb.part.0+0x7a/0xc0 drivers/usb/core/urb.c:95
>   usb_free_urb+0x1b/0x30 drivers/usb/core/urb.c:94
>   usb_start_wait_urb+0x1e5/0x2b0 drivers/usb/core/message.c:79
>   usb_internal_control_msg drivers/usb/core/message.c:101 [inline]
>   usb_control_msg+0x31c/0x4a0 drivers/usb/core/message.c:152
>   usb_get_descriptor+0xc1/0x1b0 drivers/usb/core/message.c:647
>   usb_get_configuration+0x28e/0x3050 drivers/usb/core/config.c:836
>   usb_enumerate_device drivers/usb/core/hub.c:2369 [inline]
>   usb_new_device+0xd3/0x160 drivers/usb/core/hub.c:2505
>   hub_port_connect drivers/usb/core/hub.c:5183 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5323 [inline]
>   port_event drivers/usb/core/hub.c:5469 [inline]
>   hub_event+0x1dd0/0x37e0 drivers/usb/core/hub.c:5551
>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> The buggy address belongs to the object at ffff8881d5346d00
>   which belongs to the cache kmalloc-192 of size 192
> The buggy address is located 14 bytes inside of
>   192-byte region [ffff8881d5346d00, ffff8881d5346dc0)
> The buggy address belongs to the page:
> page:ffffea000754d180 refcount:1 mapcount:0 mapping:ffff8881da002a00
> index:0x0
> flags: 0x200000000000200(slab)
> raw: 0200000000000200 ffffea0007548ac0 0000000900000009 ffff8881da002a00
> raw: 0000000000000000 0000000000100010 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
>
> Memory state around the buggy address:
>   ffff8881d5346c00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   ffff8881d5346c80: 00 00 00 00 05 fc fc fc fc fc fc fc fc fc fc fc
> > ffff8881d5346d00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                        ^
>   ffff8881d5346d80: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>   ffff8881d5346e00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ==================================================================
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> syzbot can test patches for this bug, for details see:
> https://goo.gl/tpsmEJ#testing-patches

#syz dup: KASAN: slab-out-of-bounds Read in build_audio_procunit
