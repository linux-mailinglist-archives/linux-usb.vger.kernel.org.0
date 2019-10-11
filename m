Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2594CD4292
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 16:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728198AbfJKOSz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 10:18:55 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38742 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728149AbfJKOSy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Oct 2019 10:18:54 -0400
Received: by mail-pg1-f193.google.com with SMTP id x10so5886868pgi.5
        for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2019 07:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yoMVKHDANohlAdb5zxdvxg69/UYoMm/KT4X5akubYBQ=;
        b=s2PJBxVJnHyxvp02+EPM0NjgLYSIErC3ATW/gLjj6sCJChtumFuP3RLAMLnlytff8F
         MLdft2AlNFUwHPdwA/nblu1C65sucd+8MGLormcw+3s/xs0TxY/LZ1ODwE0QTAZZlznV
         SCwnYQkAOxEPib8d0YZ9+7uCEVlvg8G1GQhX9vz5wfJ9f3MC56LSOKCtSjBIc2p5SGEC
         XVxX+fvw+3flvwDDRjHZFivvW4bSH9NlNcsEB4KyUtSwSvkahr4ml5Hc2RxrwHWT8jt+
         e6/WnEVklyDJresRyc6VHRoIN2gLOcNl8VOZma2j1L4i90wjSij5yUH9/9+8hAaXHuJM
         VnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yoMVKHDANohlAdb5zxdvxg69/UYoMm/KT4X5akubYBQ=;
        b=c+ionzzn9QH8gK7nWzWnV0MwUiZfVvnjMRfrphdzS/IH/+VSd06MKYJiYTBErSIWqN
         8/2UHYHhJzW5cBzIEiDaq/xngUx0rpXtfAaviYbmGT9rBJBAPag+XK68iYenCYj1rhjT
         3WD+bH53GUQBOjIYaxAh52tDCELmNL6n9wKI2uRzeV3bzile/MkSt1D261Q4S62KrgMv
         ovb0465JAR5PFR/H/7Mtfzogg5vNqpPiSusnfDvJzqLVt0MqHW4OEcXDdFm9StX7GsLt
         g3+OVCY0rfZEOIRKx4JAgDdY2OhSAxttqemtkFdgnUHqfiEj8KRx5xWP/d0YzV6xjyJm
         M7IQ==
X-Gm-Message-State: APjAAAV4H/Yw35rbLIERLs7+wZhkYZU9xMeUlCD3Toswi0UPXjP7kxmA
        251X2rNBDcmpZIE5gvcaQLqjhJvpy2wmZdfw0+J3jw==
X-Google-Smtp-Source: APXvYqz+pdf+0dBDvFeDuFmond5Ww8v6pIafG+BQPs2OXn5tOXrf1XKQ4eXbGsrVt2JBXKhjFEIBEufmQ1IHn4H+DIM=
X-Received: by 2002:a65:4c03:: with SMTP id u3mr17200592pgq.440.1570803533488;
 Fri, 11 Oct 2019 07:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <b8b1e4fef9f3ece63909c38b3302621d76770caa.camel@gmail.com> <Pine.LNX.4.44L0.1910111003100.1529-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1910111003100.1529-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 11 Oct 2019 16:18:42 +0200
Message-ID: <CAAeHK+zR=S1cyaYfehyUDrpMGMXvxgLEeS8V2ze2HkwYUp6bjg@mail.gmail.com>
Subject: Re: KMSAN: uninit-value in alauda_check_media
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Jaskaran Singh <jaskaransingh7654321@gmail.com>,
        syzbot <syzbot+e7d46eb426883fb97efd@syzkaller.appspotmail.com>,
        Alexander Potapenko <glider@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        usb-storage@lists.one-eyed-alien.net
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 11, 2019 at 4:08 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Fri, 11 Oct 2019, Jaskaran Singh wrote:
>
> > On Mon, 2019-10-07 at 12:39 -0700, syzbot wrote:
> > > Hello,
> > >
> > > syzbot found the following crash on:
> > >
> > > HEAD commit:    1e76a3e5 kmsan: replace __GFP_NO_KMSAN_SHADOW with
> > > kmsan_i..
> > > git tree:       https://github.com/google/kmsan.git master
> > > console output:
> > > https://syzkaller.appspot.com/x/log.txt?x=1204cc63600000
> > > kernel config:
> > > https://syzkaller.appspot.com/x/.config?x=f03c659d0830ab8d
> > > dashboard link:
> > > https://syzkaller.appspot.com/bug?extid=e7d46eb426883fb97efd
> > > compiler:       clang version 9.0.0 (/home/glider/llvm/clang
> > > 80fee25776c2fb61e74c1ecb1a523375c2500b69)
> > > syz repro:
> > > https://syzkaller.appspot.com/x/repro.syz?x=123c860d600000
> > > C reproducer:
> > > https://syzkaller.appspot.com/x/repro.c?x=110631b7600000
> > >
> > > IMPORTANT: if you fix the bug, please add the following tag to the
> > > commit:
> > > Reported-by: syzbot+e7d46eb426883fb97efd@syzkaller.appspotmail.com
> > >
> > > =====================================================
> > > BUG: KMSAN: uninit-value in alauda_transport+0x462/0x57f0
> > > drivers/usb/storage/alauda.c:1137
> > > CPU: 0 PID: 12279 Comm: usb-storage Not tainted 5.3.0-rc7+ #0
> > > Hardware name: Google Google Compute Engine/Google Compute Engine,
> > > BIOS
> > > Google 01/01/2011
> > > Call Trace:
> > >   __dump_stack lib/dump_stack.c:77 [inline]
> > >   dump_stack+0x191/0x1f0 lib/dump_stack.c:113
> > >   kmsan_report+0x13a/0x2b0 mm/kmsan/kmsan_report.c:108
> > >   __msan_warning+0x73/0xe0 mm/kmsan/kmsan_instr.c:250
> > >   alauda_check_media+0x344/0x3310 drivers/usb/storage/alauda.c:460
> > >   alauda_transport+0x462/0x57f0 drivers/usb/storage/alauda.c:1137
> > >   usb_stor_invoke_transport+0xf5/0x27e0
> > > drivers/usb/storage/transport.c:606
> > >   usb_stor_transparent_scsi_command+0x5d/0x70
> > > drivers/usb/storage/protocol.c:108
> > >   usb_stor_control_thread+0xca6/0x11a0 drivers/usb/storage/usb.c:380
> > >   kthread+0x4b5/0x4f0 kernel/kthread.c:256
> > >   ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355
>
>
> > #syz test: https://github.com/google/kmsan.git 1e76a3e5
> >
> > diff --git a/drivers/usb/storage/alauda.c
> > b/drivers/usb/storage/alauda.c
> > index ddab2cd3d2e7..bb309b9ad65b 100644
> > --- a/drivers/usb/storage/alauda.c
> > +++ b/drivers/usb/storage/alauda.c
> > @@ -452,7 +452,7 @@ static int alauda_init_media(struct us_data *us)
> >  static int alauda_check_media(struct us_data *us)
> >  {
> >       struct alauda_info *info = (struct alauda_info *) us->extra;
> > -     unsigned char status[2];
> > +     unsigned char *status = us->iobuf;
> >       int rc;
> >
> >       rc = alauda_get_media_status(us, status);

[...]

> Now yes, it's true that defining status as an array on the stack is
> also a bug, since USB transfer buffers are not allowed to be stack
> variables.

Hi Alan,

I'm curious, what is the reason for disallowing that? Should we try to
somehow detect such cases automatically?

Thanks!
