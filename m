Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4ACBAE4C
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 09:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730862AbfIWHIq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Sep 2019 03:08:46 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48]:40133 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730388AbfIWHIq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Sep 2019 03:08:46 -0400
Received: by mail-wm1-f48.google.com with SMTP id b24so7942231wmj.5
        for <linux-usb@vger.kernel.org>; Mon, 23 Sep 2019 00:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LaGBn9bZ38qPWaW3SDtoHHVPuiUKIg/p3DIaIvMQhSE=;
        b=pWDxXmirrHgEoMOaxO4t0hGy/bi2OgVElvsubqd1zgs28NpeMv9MmEZXM7uF+syuRR
         ZWV5MjYJmCIFk6OBSCl4K5IxKV9b1nMDzDWZOwv++HqcYYweSKW9/ZIX04kBBgG7vNAh
         sD6EjIEdG3vivgKGnkLOL4NCYVh3bJ9ffpIR2PtusNXf4rWHfBQQGRnq5tmI3OZnhB61
         wxedDh3MWsMAWUmP8sw1zcCyfQjgnx7MOUS+dDG24UMbdqA0VysN1rlCpWy7LPhz8P02
         p4OrDtsgFYLRc/rNQEqHKRMic037Rk0LYJ+Ly8MqrvC0AF+I2giKhBPgfGSR3N+hQB77
         wAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LaGBn9bZ38qPWaW3SDtoHHVPuiUKIg/p3DIaIvMQhSE=;
        b=P4+t2P3kXGhcu8pI9AgmIu/lIRoBPxHDp9LvIXEV/l3eGIPeTN3SK5pjvbzETUkRl/
         BxCInzK+/h2EvUk7Xebb9DI4czLWNSBnQbu0e4qI5xU9IYzcsR5Gwy+x09bCntx/KzT9
         9tCuzdAgyhn8EpXfRcE+q4+yyEb2Bozno1CwISC0IzyCdujxSabgLbNDA1wwkDKFrMEC
         GXq/z+h0nlb51xh/1P0HhwwjWdz3OS4ZHbK+XzYkwMDoOgxt0HEIvcESPY+wi9HaZSqU
         ECPyBYMYE57eCzv5nzVuj1djkwc3bt3Lhy6H8cOsEF+LqzIzAeVKIodniOuc2fRmxkV2
         vbvQ==
X-Gm-Message-State: APjAAAX/y2a4vd+XqY82ebphFHNIGn5NlmUc9A4Y3j/wJnrZzf3p9ehq
        WXafoYgnc98oe15USyJR6mf1jxBptESUR6tKM+74qr6Z+EE=
X-Google-Smtp-Source: APXvYqzdkaMemVLDpC9Bj8TAE61w7vQ+2rdK+IvWJ6tlSTEgT0mc5ysMueEOkwObqdt6FpX5oMM02s9KKTTlU5Oz0iQ=
X-Received: by 2002:a7b:c0d4:: with SMTP id s20mr13083891wmh.101.1569222523355;
 Mon, 23 Sep 2019 00:08:43 -0700 (PDT)
MIME-Version: 1.0
References: <CADGPSwj3aTJjjHvPSZVgxNRGikznL5i=-8Q2hOUb1LoLbWcRDA@mail.gmail.com>
 <87a7avh8uu.fsf@gmail.com>
In-Reply-To: <87a7avh8uu.fsf@gmail.com>
From:   alex zheng <tc0721@gmail.com>
Date:   Mon, 23 Sep 2019 15:08:06 +0800
Message-ID: <CADGPSwjTn1KwMcxKdajNwxbLi09-SQ1Eu=1m57Z+LNnj0i2BeA@mail.gmail.com>
Subject: Re: BUG report: usb: dwc3: Link TRB triggered an intterupt without
 IOC being setted
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        xiaowei.zheng@dji.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi, balbi,

Thank you for your reply~

Felipe Balbi <felipe.balbi@linux.intel.com> =E4=BA=8E2019=E5=B9=B49=E6=9C=
=8823=E6=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=881:36=E5=86=99=E9=81=93=
=EF=BC=9A
>
>
> Hi,
>
> (it helps when you Cc correct maintainers ;-)
>
> alex zheng <tc0721@gmail.com> writes:
>
> > Hi all,
> >
> > I am a user of dwc3 USB host controller, I found there are some
> > confused behavior of trb event on this controller.
> > When I run a raw USB data transfer(run bulk in&out transfer with
> > libusb) and iperf3(over rndis) at the same time,
> > there are some strange interrupts occurs and make the driver report
> > error(ERROR DMA transfer).
> > And:
>
> So dwc3 is workingo n host mode. Which platform is this?

This is our self-design platform (ARM v7 cpu core  with synopsys DWC
USB3.0 controller).
version info: Linux localhost 4.9.130-645692-g6ecde01-dirty #394 SMP
PREEMPT Sun Sep 22 15:10:51 CST 2019 armv7l

>
> > 1. this problem only hapened in USB SS mode
> > 2. this problem seems not hapen when I run same test case with other
> > xhci controller(such as asmedia/intel pcie xhci controller) on PC.
> > 3. the kernel version is 4.9.130
>
> Have you tried a more recent kernel? 4.9 is really ancient. Please try
> v5.3.

Our platform only support 4.9 kernel now, and it may take a lot of
work to do to support the recent kernel.
Are there any causes may lead the link TRB trigger a interrupt when
the IOC bit is not setted?

>
> > I think this may be a hw bug of DWC3 USB controller, could anyone
> > please give me some help to debug this problem=EF=BC=9F
> >
> > The detail log see as below:
> > [  131.074102] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto: xHCI
> > handle event, 8000
> > 27630 [  131.074109] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> > process trans event : ep_index =3D 11, event_dma =3D 1eb13e90
> > 27631 [  131.074117] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> > inc_deq, start trb dma =3D 1eb13e90, dequeue_p =3D e482ce90, trb_free n=
um
> > =3D 1871, ring type =3D 2
> > 27632 [  131.074123] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> > inc_deq 111, start trb dma =3D 1eb13ea0, dequeue_p =3D e482cea0, trb_fr=
ee
> > num =3D 1872, ring type =3D 2
> > 27633 [  131.074130] c0 3 (ksoftirqd/0) xhci-hcd xh[  133.057617] c0 3
> > (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto: ERROR Transfer event TRB DMA
> > ptr not part of current TD ep_index 16 comp_code 1
> > 27634 [  133.059312] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> > Looking for event-dma 000000001eb0fff0 trb-start 000000001eb10000
> > trb-end 000000001eb10000 seg-start 000000001eb10000 seg-end
> > 000000001eb10ff0
> > 27635 [  133.066215] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> > ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16
> > comp_code 1
> > 27636 [  133.067908] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> > Looking for event-dma 000000001eb10000 trb-start 000000001eb10230
> > trb-end 000000001eb10230 seg-start 000000001eb10000 seg-end
> > 000000001eb10ff0
> > 27637 [  133.070572] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> > ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16
> > comp_code 1
> > 27638 [  133.072260] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> > Looking for event-dma 000000001eb10010 trb-start 000000001eb10230
> > trb-end 000000001eb10230 seg-start 000000001eb10000 seg-end
> > 000000001eb10ff0
> > 27639 [  133.075052] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> > ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16
> > comp_code 1
> > 27640 [  133.076739] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> > Looking for event-dma 000000001eb10020 trb-start 000000001eb10230
> > trb-end 000000001eb10230 seg-start 000000001eb10000 seg-end
> > 000000001eb10ff0
> > 27641 [  133.079472] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> > ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16
> > comp_code 1
> > 27642 [  133.081159] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> > Looking for event-dma 000000001eb10030 trb-start 000000001eb10230
> > trb-end 000000001eb10230 seg-start 000000001eb10000 seg-end
> > 000000001eb10ff0
> > 27643 [  133.083896] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> > ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16
> > comp_code 1
> > 27644 [  133.085584] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> > Looking for event-dma 000000001eb10040 trb-start 000000001eb10230
> > trb-end 000000001eb10230 seg-start 000000001eb10000 seg-end
> > 000000001eb10ff0
> > 27645 [  133.088328] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> > ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16
> > comp_code 1
> >
> > 1. According these logs above the link trb whose address is 0x1eb0fff0
> > occurs a transfer event, but this DMA address is not in the trb ring,
> > then the driver report an error(and followed a few error logs witch
> > invalid DMA address).
> > 2. I dump the data of the address(0x1eb0fff0) and find the IOC bit is
> > not set, see as below:
> > # dump_reg.sh 0x1eb0fff0 4
> > 0x1eb0fff0:0x1EB10000 0x00000000 0x00000000 0x00001800
>
> --
> balbi
