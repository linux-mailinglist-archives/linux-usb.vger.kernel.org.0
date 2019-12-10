Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E50C11917F
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2019 21:06:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfLJUGd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 15:06:33 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:33071 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbfLJUGd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 15:06:33 -0500
Received: by mail-pj1-f67.google.com with SMTP id r67so7829193pjb.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2019 12:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KYuCvJCnn+Faxgj02yKxGaH8zvOq4VASGRA5HJAqsCg=;
        b=MTD9ktrwv9Qe/EGdE/2bZh4yhicS6KKK9nz5TQxiiS1ecQnyibdyrMQY72EQIOhZd/
         PS9LxNpumkkm6U94oNtI1W0xasDtfC+JQSaLHlLi8/sP/7nUMzha0t11YlEdsJ2KTLHx
         ngORqYuNTJFAP5OG/HktQQlw9+kLZuB63iEPTZFxyOnaPzPdcgoMOcLbLzxqeNB+MaGb
         hxsyAAq427/mFeHszAcFuhybujDavy5AqNdde5bsymH127c9hICpStzUAFxAl/Kzb+zb
         4UngusSLcZvC9XvNpMXnBQvNEQbqCBnftfTmkNl2impvBFgZsGUIBh+8h56xmzcA4zC7
         bYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KYuCvJCnn+Faxgj02yKxGaH8zvOq4VASGRA5HJAqsCg=;
        b=ZE7UioCGqnczkHXv1NDggYNtE8e9tn7wOxNFmQuB0V8dj/Not35105zsz7zDaf6JCv
         oDtGkDysd1Xb7r7EnMfI6skeDkS3ijSqGyQJ8Xi8+h4nR7niT81WpkeZfTnrupUSUNdy
         nx+khNWVyYHJieZuRtBvRlVIovztTMLJwawaSQqma3udmaxsnFTMgK1dXScVxL+y/XEj
         rUlZRUlozL+trMyWckcqoIAbMlhLbFDIjRn5sRhh8ffW7vmWFHn2elFZNz75RPs08Zag
         /trK90Ll2St4u7IKbKRO7NkEr+j/xBKELLvu46VBFleM0Dendxy8DGYar44YGL0MF8qE
         2NDA==
X-Gm-Message-State: APjAAAVSAG+Vd/rZxvjeD3F6osyoBZFzF/DCpxFxEWSWEIGo6kSVCHWL
        JPiV02yxBlzuJ84Yj93ZEPIBZrhFz1ywDif8963qFA==
X-Google-Smtp-Source: APXvYqytg3awAocSi7YUInZyP1bVBjSPyqFgrC7zY8QdBIKePfmb2aWjEP6W2ZEt7kUcS+0WS6Z8R75KRdXwZP7s//U=
X-Received: by 2002:a17:90a:1a1a:: with SMTP id 26mr7368500pjk.129.1576008391887;
 Tue, 10 Dec 2019 12:06:31 -0800 (PST)
MIME-Version: 1.0
References: <0000000000006ab7cc05994cbae2@google.com> <Pine.LNX.4.44L0.1912101440100.1647-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1912101440100.1647-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 10 Dec 2019 21:06:20 +0100
Message-ID: <CAAeHK+wY+35uBvr0=FnKsWOj91QhXuVE++V7frn5AihAPLvo5Q@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in usbvision_v4l2_open
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+c7b0ec009a216143df30@syzkaller.appspotmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Souptick Joarder <jrdr.linux@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        USB list <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Richard Fontana <rfontana@redhat.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 10, 2019 at 8:48 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Mon, 9 Dec 2019, syzbot wrote:
>
> > Hello,
> >
> > syzbot found the following crash on:
> >
> > HEAD commit:    1f22d15c usb: gadget: add raw-gadget interface
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=1296f42ae00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=8ccee2968018adcb
> > dashboard link: https://syzkaller.appspot.com/bug?extid=c7b0ec009a216143df30
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> >
> > Unfortunately, I don't have any reproducer for this crash yet.
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+c7b0ec009a216143df30@syzkaller.appspotmail.com
> >
> > ==================================================================
> > BUG: KASAN: use-after-free in __mutex_lock_common
> > kernel/locking/mutex.c:1043 [inline]
> > BUG: KASAN: use-after-free in __mutex_lock+0x124d/0x1360
> > kernel/locking/mutex.c:1106
> > Read of size 8 at addr ffff8881cad4d8b8 by task v4l_id/4526
> >
> > CPU: 0 PID: 4526 Comm: v4l_id Not tainted 5.4.0-syzkaller #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> > Google 01/01/2011
> > Call Trace:
> >   __dump_stack lib/dump_stack.c:77 [inline]
> >   dump_stack+0xef/0x16e lib/dump_stack.c:118
> >   print_address_description.constprop.0+0x36/0x50 mm/kasan/report.c:374
> >   __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:506
> >   kasan_report+0xe/0x20 mm/kasan/common.c:638
> >   __mutex_lock_common kernel/locking/mutex.c:1043 [inline]
> >   __mutex_lock+0x124d/0x1360 kernel/locking/mutex.c:1106
> >   usbvision_v4l2_open+0x77/0x340
> > drivers/media/usb/usbvision/usbvision-video.c:314
> >   v4l2_open+0x20f/0x3d0 drivers/media/v4l2-core/v4l2-dev.c:423
> >   chrdev_open+0x219/0x5c0 fs/char_dev.c:414
> >   do_dentry_open+0x494/0x1120 fs/open.c:797
> >   do_last fs/namei.c:3412 [inline]
> >   path_openat+0x142b/0x4030 fs/namei.c:3529
> >   do_filp_open+0x1a1/0x280 fs/namei.c:3559
> >   do_sys_open+0x3c0/0x580 fs/open.c:1097
> >   do_syscall_64+0xb7/0x5b0 arch/x86/entry/common.c:294
> >   entry_SYSCALL_64_after_hwframe+0x49/0xbe
>
> This looks like a race in v4l2_open(): The function drops the
> videodev_lock mutex before calling the video driver's open routine, and
> the device can be unregistered during the short time between.
>
> This patch tries to make the race much more likely to happen, for
> testing and verification.
>
> Andrey, will syzbot run the same test with this patch, even though it
> says it doesn't have a reproducer?

Hi Alan,

No, unfortunately there's nothing to run if there's no reproducer.
It's technically possible to run the same program log that triggered
the bug initially, but since the bug wasn't reproduced with this log
even without the patch, there isn't much sense in running it with the
patch applied.

Thanks!

>
> Alan Stern
>
> #syz test: https://github.com/google/kasan.git 1f22d15c
>
> Index: usb-devel/drivers/media/usb/usbvision/usbvision-video.c
> ===================================================================
> --- usb-devel.orig/drivers/media/usb/usbvision/usbvision-video.c
> +++ usb-devel/drivers/media/usb/usbvision/usbvision-video.c
> @@ -1585,6 +1585,7 @@ static void usbvision_disconnect(struct
>                 wake_up_interruptible(&usbvision->wait_frame);
>                 wake_up_interruptible(&usbvision->wait_stream);
>         } else {
> +               msleep(100);
>                 usbvision_release(usbvision);
>         }
>
> Index: usb-devel/drivers/media/v4l2-core/v4l2-dev.c
> ===================================================================
> --- usb-devel.orig/drivers/media/v4l2-core/v4l2-dev.c
> +++ usb-devel/drivers/media/v4l2-core/v4l2-dev.c
> @@ -419,9 +419,10 @@ static int v4l2_open(struct inode *inode
>         video_get(vdev);
>         mutex_unlock(&videodev_lock);
>         if (vdev->fops->open) {
> -               if (video_is_registered(vdev))
> +               if (video_is_registered(vdev)) {
> +                       msleep(200);
>                         ret = vdev->fops->open(filp);
> -               else
> +               } else
>                         ret = -ENODEV;
>         }
>
>
