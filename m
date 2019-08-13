Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4BB8BC75
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2019 17:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729827AbfHMPIe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Aug 2019 11:08:34 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36135 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729743AbfHMPIe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Aug 2019 11:08:34 -0400
Received: by mail-pl1-f193.google.com with SMTP id g4so2922750plo.3
        for <linux-usb@vger.kernel.org>; Tue, 13 Aug 2019 08:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kvzvYiVI29Y9ntn+ryKpnR+ICsnBopPzX57yon+8Oy4=;
        b=plCQiKwvw2+YgYk60znqOklxNzoI7y84NBD+ZHbfdiHskhSGauDzPp6ohFNvBjG/D2
         PtAVMUuNgg5qL0KfC7RvCRdYBC8Kz61qHA4Iqyz8refbx5B1NnaVnhTDZ7nt+UDWJXx6
         9u04By1ECDXLLmx5PDqTizk80kcVAnmf9+NK74krT+RraUpDWqJ1+Uod284ljJxj2qyC
         1dx0g8CV06IzwzisfjPCTaeWhXpw+nzmDE4PDC5D6jpeWLBi0i7qua+HsTlsDpTDDCAY
         NSC5N+SdZY8ly6wloFBiTnZzy/w9GRmVk78hsdYfSB7o4Rp+ozdMa1IKvAcQ3Tlf/xlJ
         2Pjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kvzvYiVI29Y9ntn+ryKpnR+ICsnBopPzX57yon+8Oy4=;
        b=FfAy3vw23ciQ9wMZ5jUigpPkQNzW5og/bgduj4W0CKjyb3TBQZuf68VaWgAlqv/28/
         3MzG5ZRK3TLvXSh8Vq8Zmopw9YSRkYlw0ncJgSskm5pHNwMBLvoxtj7VM/3mUxeOQKJp
         gCARX79zIGqgI4wLCKKMMrSC4xV8lqusf7l1FyRDaJGGWLRPB5vd+IsXvqmKmA+bybXF
         Q2X0qWgxKomZ0BH1VP0GArB+/WEpNmBuCqbtf1fk2a/5lj/PdjHCymQNuO1kMvCDbIz2
         A3MBDB/sx/KOiRHjLyBTndp5guOSB04YweyXbcHbS8+unxeWok6iweSWU839+UCx6h83
         Bs1w==
X-Gm-Message-State: APjAAAUlw4qIk3dwmPQY0jiHfZIuza9rp2UOKUgWSmcw+IdRYWININ/y
        K1O3yVBSAzu18q+gKVJSIgbQM1XsyumvF3cZb/TtVg==
X-Google-Smtp-Source: APXvYqzdoi8AKGpLReePEcFTfBvkJgD5Tp6bChwGAluy0B2KObFT7If8UITqQVL8NbmfkPj0Yz0aMOom+0YYfU3SXOc=
X-Received: by 2002:a17:902:8649:: with SMTP id y9mr10521777plt.252.1565708913012;
 Tue, 13 Aug 2019 08:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000009f4316058fab3bd7@google.com> <1565700220.7043.8.camel@suse.com>
In-Reply-To: <1565700220.7043.8.camel@suse.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 13 Aug 2019 17:08:21 +0200
Message-ID: <CAAeHK+zzj_+Qvm217KO2OHnfBMWbepP0Y-OYTWpOw3ghe5ji=g@mail.gmail.com>
Subject: Re: KMSAN: uninit-value in smsc75xx_bind
To:     Oliver Neukum <oneukum@suse.com>
Cc:     syzbot <syzbot+6966546b78d050bb0b5d@syzkaller.appspotmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Alexander Potapenko <glider@google.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        steve.glendinning@shawell.net, LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 13, 2019 at 2:43 PM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Freitag, den 09.08.2019, 01:48 -0700 schrieb syzbot:
> > Hello,
> >
> > syzbot found the following crash on:
> >
> > HEAD commit:    beaab8a3 fix KASAN build
> > git tree:       kmsan
>
> [..]
> > Call Trace:
> >   __dump_stack lib/dump_stack.c:77 [inline]
> >   dump_stack+0x191/0x1f0 lib/dump_stack.c:113
> >   kmsan_report+0x162/0x2d0 mm/kmsan/kmsan_report.c:109
> >   __msan_warning+0x75/0xe0 mm/kmsan/kmsan_instr.c:294
> >   smsc75xx_wait_ready drivers/net/usb/smsc75xx.c:976 [inline]
> >   smsc75xx_bind+0x541/0x12d0 drivers/net/usb/smsc75xx.c:1483
>
> >
> > Local variable description: ----buf.i93@smsc75xx_bind
> > Variable was created at:
> >   __smsc75xx_read_reg drivers/net/usb/smsc75xx.c:83 [inline]
> >   smsc75xx_wait_ready drivers/net/usb/smsc75xx.c:969 [inline]
> >   smsc75xx_bind+0x44c/0x12d0 drivers/net/usb/smsc75xx.c:1483
> >   usbnet_probe+0x10d3/0x3950 drivers/net/usb/usbnet.c:1722
>
> Hi,
>
> this looks like a false positive to me.
> The offending code is likely this:
>
>         if (size) {
>                 buf = kmalloc(size, GFP_KERNEL);
>                 if (!buf)
>                         goto out;
>         }
>
>         err = usb_control_msg(dev->udev, usb_rcvctrlpipe(dev->udev, 0),
>                               cmd, reqtype, value, index, buf, size,
>                               USB_CTRL_GET_TIMEOUT);
>
> which uses 'buf' uninitialized. But it is used for input.
> What is happening here?

AFAICS, the uninitialized use of buf that KMSAN points out is in the
"if (buf & PMT_CTL_DEV_RDY)"  statement in smsc75xx_wait_ready(). Does
__smsc75xx_read_reg/usb_control_msg() always initialize buf? Can it
just initialize the first few bytes for example?
