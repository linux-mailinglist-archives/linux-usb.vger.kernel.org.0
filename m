Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB63B861DB
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 14:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389986AbfHHMb7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 08:31:59 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39431 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403900AbfHHMb7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Aug 2019 08:31:59 -0400
Received: by mail-pg1-f193.google.com with SMTP id u17so44002646pgi.6
        for <linux-usb@vger.kernel.org>; Thu, 08 Aug 2019 05:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OZoVHIu8e15aX6EBenYKl1PyRN7jL5FRWw2SqjL1ydU=;
        b=bfCSp4WLejz+9owvTUI7Qt1hrhG+RW1Nr3A7MZ+Z7lrer7DSQMrXK22O6t56DTZfkr
         irTU1IfSqL+3hGf8C5LN6yndgLTHoZkZ7bS/g/uzlnjLwevwSqkRhOO2UbmdM4T6aoyd
         e3umoGM/ybJNUKLOHf+dLh+I0/UuiPD0Rgbv1HQL5MkX1YVMgLbeRiICLnLlJeMnnaiG
         0ynzFstsm/YnoNHkVfe9DT/x9KF//Vei+HFauhCKcEhQW2BMLpkw+30bCM3Gks+jbcUD
         X3DyDc1H0Y7rn4eBl37b+D6YVehLhUuEHAV7mGrBlbP7XaxwmoMKku6VV96gasCed5lJ
         vGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OZoVHIu8e15aX6EBenYKl1PyRN7jL5FRWw2SqjL1ydU=;
        b=rIMwYW2JuFeQFwR/d58BC62oSwamHPsvhF1QGLjSunbBBG47bx3u79RJ1eBC29Wvmh
         O/Uw6esM6j5mhKAixcH1b12UMrsihBIg9jL3Mw1QahZdB3TwwxOlFqB27x5j4q3lPYkr
         PiufNUrf4ARI19BKlAzRICeWxOY/L8TLx6ZoyDuz4kln7hxhQ3hgY6Cfoz6qJQcy9euX
         fCDBbw+5/SIoFuOEKLGaJgB9I9scnsa6+YVzO3U/u11wRGFUCtF7xDo5xcp0A14Q1KrT
         b+NceXW2zVnOri0OQxBjiyZJ6xgaQIwTg66XWc6q+S4r5eWYPVooHqVvrpldMIJqGg0M
         BZ8w==
X-Gm-Message-State: APjAAAU4yVkWA93JuNuuFZ4NOLyJItVN4mZGyZ+yui0ix9QT70mVi1za
        Q+5q+pyzF84JMbdZkFF/8M/j44LkpQUW/OojZq/cUg==
X-Google-Smtp-Source: APXvYqwq/u+BtEJGEKiowmnetpPLkwAyA5pvQ+7Vq+k/6zoovhih1cN5j2ipju/DobcxNuVcu6NjnHYmAug7ZkrG6CA=
X-Received: by 2002:a65:4b8b:: with SMTP id t11mr12506491pgq.130.1565267517206;
 Thu, 08 Aug 2019 05:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190808080330.12292-1-hdanton@sina.com>
In-Reply-To: <20190808080330.12292-1-hdanton@sina.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 8 Aug 2019 14:31:46 +0200
Message-ID: <CAAeHK+yzpyCX4dVKwgYXg5oca1yecJ+T5R=6WbEtLzowRSN-9g@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in dvb_usb_device_exit (2)
To:     Hillf Danton <hdanton@sina.com>
Cc:     syzbot <syzbot+c58e976e022432ee60b4@syzkaller.appspotmail.com>,
        allison@lohutok.net, LKML <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
        mail@maciej.szmigiero.name,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Oliver Neukum <oneukum@suse.com>, Sean Young <sean@mess.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: multipart/mixed; boundary="0000000000005803a0058f9a3ec8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--0000000000005803a0058f9a3ec8
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 8, 2019 at 10:03 AM Hillf Danton <hdanton@sina.com> wrote:
>
>
> [respin due to "Sender frequency limited" and therefore the Cc list once
> cut short:(]
>
> Tue, 06 Aug 2019 06:18:08 -0700
> > Hello,
> >
> > syzbot found the following crash on:
> >
> > HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=114fd9aa600000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
> > dashboard link: https://syzkaller.appspot.com/bug?extid=c58e976e022432ee60b4
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=173ee42c600000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16d9442c600000
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+c58e976e022432ee60b4@syzkaller.appspotmail.com
> >
> > input: TeVii S421 PCI as
> > /devices/platform/dummy_hcd.0/usb1/1-1/rc/rc0/input5
> > dvb-usb: schedule remote query interval to 150 msecs.
> > dw2102: su3000_power_ctrl: 0, initialized 1
> > dvb-usb: TeVii S421 PCI successfully initialized and connected.
> > usb 1-1: USB disconnect, device number 2
> > ==================================================================
> > BUG: KASAN: use-after-free in dvb_usb_device_exit+0x19a/0x1a0
> > drivers/media/usb/dvb-usb/dvb-usb-init.c:305
> > Read of size 8 at addr ffff8881d50468e8 by task kworker/1:1/22
> >
> > CPU: 1 PID: 22 Comm: kworker/1:1 Not tainted 5.3.0-rc2+ #25
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> > Google 01/01/2011
> > Workqueue: usb_hub_wq hub_event
> > Call Trace:
> >   __dump_stack lib/dump_stack.c:77 [inline]
> >   dump_stack+0xca/0x13e lib/dump_stack.c:113
> >   print_address_description+0x6a/0x32c mm/kasan/report.c:351
> >   __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
> >   kasan_report+0xe/0x12 mm/kasan/common.c:612
> >   dvb_usb_device_exit+0x19a/0x1a0  drivers/media/usb/dvb-usb/dvb-usb-init.c:305
> >   usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
> >   __device_release_driver drivers/base/dd.c:1120 [inline]
> >   device_release_driver_internal+0x404/0x4c0 drivers/base/dd.c:1151
> >   bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:556
> >   device_del+0x420/0xb10 drivers/base/core.c:2288
> >   usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
> >   usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2199
> >   hub_port_connect drivers/usb/core/hub.c:4949 [inline]
> >   hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
> >   port_event drivers/usb/core/hub.c:5359 [inline]
> >   hub_event+0x1454/0x3640 drivers/usb/core/hub.c:5441
> >   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
> >   process_scheduled_works kernel/workqueue.c:2331 [inline]
> >   worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
> >   kthread+0x318/0x420 kernel/kthread.c:255
> >   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> >
> > Allocated by task 22:
> >   save_stack+0x1b/0x80 mm/kasan/common.c:69
> >   set_track mm/kasan/common.c:77 [inline]
> >   __kasan_kmalloc mm/kasan/common.c:487 [inline]
> >   __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:460
> >   slab_post_alloc_hook mm/slab.h:520 [inline]
> >   slab_alloc_node mm/slub.c:2766 [inline]
> >   slab_alloc mm/slub.c:2774 [inline]
> >   __kmalloc_track_caller+0xc8/0x2a0 mm/slub.c:4331
> >   kmemdup+0x23/0x50 mm/util.c:120
> >   kmemdup include/linux/string.h:432 [inline]
> >   dw2102_probe+0x627/0xc40 drivers/media/usb/dvb-usb/dw2102.c:2372
> >   usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
> >   really_probe+0x281/0x650 drivers/base/dd.c:548
> >   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
> >   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
> >   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
> >   __device_attach+0x217/0x360 drivers/base/dd.c:882
> >   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
> >   device_add+0xae6/0x16f0 drivers/base/core.c:2114
> >   usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
> >   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
> >   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
> >   really_probe+0x281/0x650 drivers/base/dd.c:548
> >   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
> >   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
> >   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
> >   __device_attach+0x217/0x360 drivers/base/dd.c:882
> >   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
> >   device_add+0xae6/0x16f0 drivers/base/core.c:2114
> >   usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
> >   hub_port_connect drivers/usb/core/hub.c:5098 [inline]
> >   hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
> >   port_event drivers/usb/core/hub.c:5359 [inline]
> >   hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
> >   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
> >   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
> >   kthread+0x318/0x420 kernel/kthread.c:255
> >   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> >
> > Freed by task 22:
> >   save_stack+0x1b/0x80 mm/kasan/common.c:69
> >   set_track mm/kasan/common.c:77 [inline]
> >   __kasan_slab_free+0x130/0x180 mm/kasan/common.c:449
> >   slab_free_hook mm/slub.c:1423 [inline]
> >   slab_free_freelist_hook mm/slub.c:1470 [inline]
> >   slab_free mm/slub.c:3012 [inline]
> >   kfree+0xe4/0x2f0 mm/slub.c:3953
> >   dw2102_probe+0x871/0xc40 drivers/media/usb/dvb-usb/dw2102.c:2406
> >   usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
> >   really_probe+0x281/0x650 drivers/base/dd.c:548
> >   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
> >   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
> >   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
> >   __device_attach+0x217/0x360 drivers/base/dd.c:882
> >   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
> >   device_add+0xae6/0x16f0 drivers/base/core.c:2114
> >   usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
> >   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
> >   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
> >   really_probe+0x281/0x650 drivers/base/dd.c:548
> >   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
> >   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
> >   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
> >   __device_attach+0x217/0x360 drivers/base/dd.c:882
> >   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
> >   device_add+0xae6/0x16f0 drivers/base/core.c:2114
> >   usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
> >   hub_port_connect drivers/usb/core/hub.c:5098 [inline]
> >   hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
> >   port_event drivers/usb/core/hub.c:5359 [inline]
> >   hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
> >   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
> >   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
> >   kthread+0x318/0x420 kernel/kthread.c:255
> >   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> >
> > The buggy address belongs to the object at ffff8881d5046600
> >   which belongs to the cache kmalloc-4k of size 4096
> > The buggy address is located 744 bytes inside of
> >   4096-byte region [ffff8881d5046600, ffff8881d5047600)
> > The buggy address belongs to the page:
> > page:ffffea0007541000 refcount:1 mapcount:0 mapping:ffff8881da00c280
> > index:0x0 compound_mapcount: 0
> > flags: 0x200000000010200(slab|head)
> > raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da00c280
> > raw: 0000000000000000 0000000000070007 00000001ffffffff 0000000000000000
> > page dumped because: kasan: bad access detected
> >
> > Memory state around the buggy address:
> >   ffff8881d5046780: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >   ffff8881d5046800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > > ffff8881d5046880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >                                                            ^
> >   ffff8881d5046900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >   ffff8881d5046980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > ==================================================================
>
> Recompute desc after copying properties.
>
> --- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
> +++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
> @@ -276,7 +276,8 @@ int dvb_usb_device_init(struct usb_inter
>
>         d->udev = udev;
>         memcpy(&d->props, props, sizeof(struct dvb_usb_device_properties));
> -       d->desc = desc;
> +       cold = 0;
> +       d->desc = dvb_usb_find_device(udev, &d->props, &cold);
>         d->owner = owner;
>
>         usb_set_intfdata(intf, d);
> --
>

#syz test: https://github.com/google/kasan.git e96407b4

--0000000000005803a0058f9a3ec8
Content-Type: text/x-patch; charset="US-ASCII"; name="dvb-usb-init.patch"
Content-Disposition: attachment; filename="dvb-usb-init.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jz2nut2l0>
X-Attachment-Id: f_jz2nut2l0

LS0tIGEvZHJpdmVycy9tZWRpYS91c2IvZHZiLXVzYi9kdmItdXNiLWluaXQuYworKysgYi9kcml2
ZXJzL21lZGlhL3VzYi9kdmItdXNiL2R2Yi11c2ItaW5pdC5jCkBAIC0yNzYsNyArMjc2LDggQEAg
aW50IGR2Yl91c2JfZGV2aWNlX2luaXQoc3RydWN0IHVzYl9pbnRlcgogCiAJZC0+dWRldiA9IHVk
ZXY7CiAJbWVtY3B5KCZkLT5wcm9wcywgcHJvcHMsIHNpemVvZihzdHJ1Y3QgZHZiX3VzYl9kZXZp
Y2VfcHJvcGVydGllcykpOwotCWQtPmRlc2MgPSBkZXNjOworCWNvbGQgPSAwOworCWQtPmRlc2Mg
PSBkdmJfdXNiX2ZpbmRfZGV2aWNlKHVkZXYsICZkLT5wcm9wcywgJmNvbGQpOwogCWQtPm93bmVy
ID0gb3duZXI7CiAKIAl1c2Jfc2V0X2ludGZkYXRhKGludGYsIGQpOwo=
--0000000000005803a0058f9a3ec8--
