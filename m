Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2686CBCA0E
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2019 16:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441300AbfIXOTx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Sep 2019 10:19:53 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41]:55495 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436753AbfIXOTw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Sep 2019 10:19:52 -0400
Received: by mail-wm1-f41.google.com with SMTP id a6so296502wma.5
        for <linux-usb@vger.kernel.org>; Tue, 24 Sep 2019 07:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FR7L5z1qU3B0ZEzn3nw7CVicXRhTCKS87UFeBTRCMGw=;
        b=lBBMMC9FY2cq2x/XlKZoKbO6LxCTmA/z3+WIic+iU1cwlgqrVpxBFt4jw3Sko34zlz
         /CrqrsAQSfcPQdKmdpdb1Re4Wd/wrsgipUBJw2Ra6LiMahJyIK7lFmRQ2joy9qw0Fryu
         U9PcLnpUAaqIKd2S0skuGk9PvavieFLpFNouf7Fw8WRT+yZvvB8qbwCjjqsfeTWIsBPi
         YllkbiI1z0uu/Gn8Z0XTrGgxOxXRoqxl8MHeFdGIh6vs+SvZEpSTPItWluW+bTVJVDW3
         1CsC/JwNlzJu1kjc2PTGSYjcRQWCstyrDwhDu/2teIS2cqwqo1nXQ4O56+85ycyFjmw4
         X5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FR7L5z1qU3B0ZEzn3nw7CVicXRhTCKS87UFeBTRCMGw=;
        b=doBMOInZ/sYOQL/IV3YuX2GlssNb9cp9NVc2EWCpui7JnXWkRXyHbSmB2U3UCUpSRm
         XktPSK3N8guZ1QpsLr5BdqXERO9/WMKd1pedEF9ojnKU8uFvxGJVwFBz9mmjltaZVTpU
         EOC1PIXk/vZ24NW92HFRYyD/dtp9u+pQ9/LP3C6gATcyXNoCvdL2QnMuAdJQhJnTmdBZ
         tVvvQYn4WOQkLp/5loGNLRq2n0fLJalfepaCIoN1iWvLf2a02YCl+tqURH2lzIPfngEi
         UGfvzkh0WIGhli/uGP1brv4F7kwLE9sO1ucOq2cpvXDVNR33aQu4/Co8UyevAGQTIsT5
         9tXg==
X-Gm-Message-State: APjAAAW3IYYJVCKC5ydRpgXEqxDQbnUYnu6Yu7dLTeDUUJtQUTuNFghJ
        hWK78E8pel9m+r8L7gjbGM/uNEDjvnYja4EJ9Ro=
X-Google-Smtp-Source: APXvYqxtvws5GvdR/Z69CKxFyrPAGEVMJEgNkhNKC7oopBleZxAdawxLVaPGmRyhboavrHAwDkgecQkDxxnEtEEHIL0=
X-Received: by 2002:a7b:c0d4:: with SMTP id s20mr269334wmh.101.1569334790640;
 Tue, 24 Sep 2019 07:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <CADGPSwj3aTJjjHvPSZVgxNRGikznL5i=-8Q2hOUb1LoLbWcRDA@mail.gmail.com>
 <87a7avh8uu.fsf@gmail.com> <CADGPSwjTn1KwMcxKdajNwxbLi09-SQ1Eu=1m57Z+LNnj0i2BeA@mail.gmail.com>
 <87muevs34d.fsf@gmail.com>
In-Reply-To: <87muevs34d.fsf@gmail.com>
From:   alex zheng <tc0721@gmail.com>
Date:   Tue, 24 Sep 2019 22:19:14 +0800
Message-ID: <CADGPSwhzoK1MYe6BWo6g-aSvvmOnpZHsJcK2yqviOrRqYCZvDw@mail.gmail.com>
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

Hi Balbi,

This SOC was released last year, and it was woke up on kernel v4.9.

After these days debugging I think it seem more like a hardware related iss=
ue.
We will check the Synopsys databook again to find something which may help,
and may consider to try these cases on more recent kernel later.

Thank you for your advices~

Felipe Balbi <felipe.balbi@linux.intel.com> =E4=BA=8E2019=E5=B9=B49=E6=9C=
=8823=E6=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=886:45=E5=86=99=E9=81=93=
=EF=BC=9A

>
>
> Hi Alex,
>
> alex zheng <tc0721@gmail.com> writes:
> >> > I am a user of dwc3 USB host controller, I found there are some
> >> > confused behavior of trb event on this controller.
> >> > When I run a raw USB data transfer(run bulk in&out transfer with
> >> > libusb) and iperf3(over rndis) at the same time,
> >> > there are some strange interrupts occurs and make the driver report
> >> > error(ERROR DMA transfer).
> >> > And:
> >>
> >> So dwc3 is workingo n host mode. Which platform is this?
> >
> > This is our self-design platform (ARM v7 cpu core  with synopsys DWC
> > USB3.0 controller).
> > version info: Linux localhost 4.9.130-645692-g6ecde01-dirty #394 SMP
> > PREEMPT Sun Sep 22 15:10:51 CST 2019 armv7l
>
> This is a brand new design and you're waking it up on v4.9? Could've
> tracked upstream more closely, IMHO.
>
> >> > 1. this problem only hapened in USB SS mode
> >> > 2. this problem seems not hapen when I run same test case with other
> >> > xhci controller(such as asmedia/intel pcie xhci controller) on PC.
> >> > 3. the kernel version is 4.9.130
> >>
> >> Have you tried a more recent kernel? 4.9 is really ancient. Please try
> >> v5.3.
> >
> > Our platform only support 4.9 kernel now, and it may take a lot of
> > work to do to support the recent kernel.
>
> In that case, I'm afraid you're on your own. Have a look at known
> synopsys errata.
>
> On a side-node, getting a cortex-A7 to boot with upstream kernel should
> be only about adding a DeviceTree nowadays. Remember that for Linux to
> boot, all you need is a system timer and UART. If you're using ARM IP
> for interrupts, timers, etc, it should be really straight forward to
> boot on v5.3
>
> > Are there any causes may lead the link TRB trigger a interrupt when
> > the IOC bit is not setted?
>
> No idea, perhaps you should have a deeper look at both Synopsys databook
> and xHCI specification.
>
> In any case, v4.9 is really old.
>
> Good luck
>
> --
> balbi
