Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27096E947C
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 02:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbfJ3BPP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Oct 2019 21:15:15 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:44474 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfJ3BPP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Oct 2019 21:15:15 -0400
Received: by mail-qt1-f195.google.com with SMTP id z22so920757qtq.11
        for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2019 18:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VUfc6lAn/gdWl4VHYUwIgplvuaVBqXuhSoUl/uGlsWc=;
        b=dfNH2rJu30LT4bIn+Su7Gdd1oGp8P74+AedahtazKLFWg0Leyo2RIboMPFpH6RyybN
         ysiYfhsdBvAyydCDmu5Qbt7NoiOtqQzRcn62AuV9J3wkKS9Yy2WOSVvuQBGxwUkq0BZt
         PVLOccAxWfWerpu0VMglD8FXsIyk4Ra9C02t/Emlghx/ZfMMprsZ+H88cvmHEkWzsh1r
         /8NaETjQFCRPyp0q+kXThXVqgtHBLe9t8DhYtjg+JLEVnsZNzbNKboBeXIGQJDGFjM1V
         Vo93WCEisKHmRthVlrEFW8hec5IYzL0Fc0Yl0ZXh83dI8xZnQMGi1WVsV36WMw8x1Y7O
         R/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VUfc6lAn/gdWl4VHYUwIgplvuaVBqXuhSoUl/uGlsWc=;
        b=cyIwRbieswgnJPzKW15JNBsesXXyjYNfGkSOv2kjHVbDxaBfOKgxbs4rL3DUtVs9xC
         rSHO7L15b4P6MfcWM4ev0Is+QgbeNMHlXiqu+3/8QGVIy3IgSMuHk7GZEHtKTt6+tacC
         hRF1hqovPIudGC+i0e8weh3GexWDN+I1Zs1RudRRhBNYSm5BOC55pqRw+3bvRAlMphO2
         DqHjYQb+4K6NpKOj1+H/PvmnWxWx4prRF9eqZY4wN9MRHAz09aq4ZdFxRMZ11m/MBfM4
         y6stOhA+oT6t4GDIcUmJAleuK8MpXNQtgW+bP9Z0XqBaMwKX4b9TufMjwk9qPgYYRJkV
         /2iQ==
X-Gm-Message-State: APjAAAWe1fWgAV5kiXgZb92VKECJnlTb2CsHlqg+EVQycb768JfG//qZ
        XKKa021/qX68b0mO1i03QsK3bBQKWRPmEveThYc=
X-Google-Smtp-Source: APXvYqw1Mq1BLXrYG1IdTBI7uRLqwWBrE36qf+IbqHDoYWuMtr33L57uZHJFk+O7fzLv7RbmlV+G54xbw9rtqKFRppI=
X-Received: by 2002:aed:35e7:: with SMTP id d36mr2454296qte.59.1572398113953;
 Tue, 29 Oct 2019 18:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191028182254.30739-1-pgwipeout@gmail.com> <5230f80c-9684-72e0-8f96-602428a9e655@arm.com>
 <9e5546de-f5b6-7f60-96d0-612249e832ce@arm.com>
In-Reply-To: <9e5546de-f5b6-7f60-96d0-612249e832ce@arm.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Tue, 29 Oct 2019 21:15:03 -0400
Message-ID: <CAMdYzYrZhof2DtrNH4+Amu1ZN-6sWw57rC+2joqXSyWVn99wWw@mail.gmail.com>
Subject: Re: [PATCH 0/5] add rk3328 usb3 phy driver
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Heiko Stuebner <heiko@sntech.de>, kishon@ti.com,
        katsuhiro@katsuster.net, linux-rockchip@lists.infradead.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 29, 2019, 20:18 Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2019-10-28 6:41 pm, Robin Murphy wrote:
> > On 28/10/2019 18:22, Peter Geis wrote:
> >> It took a lot more effort than originally anticipated, but here it is.
> >> This is the driver from [0], updated to work with the current kernel.
> >> I've tested it on the rk3328-roc-cc board, both usb 2.0 and usb 3.0
> >> devices detect on hotplug.
> >
> > Thanks Peter, I'll try to give this a go on my box for confirmation.
>
> OK, I hooked it up with a vbus-drv-gpio hacked in - USB 2.0
> unplug/replug does indeed work fine, but it takes a while to acknowledge
> an unplug of a USB 3.0 device, and throws a bunch of errors every time:
>
> [  288.229568] usb usb4-port1: Cannot enable. Maybe the USB cable is bad?
> [  290.809599] usb usb4-port1: Cannot enable. Maybe the USB cable is bad?
> [  293.389594] usb usb4-port1: Cannot enable. Maybe the USB cable is bad?
> [  295.969600] usb usb4-port1: Cannot enable. Maybe the USB cable is bad?
> [  295.970418] usb 4-1: USB disconnect, device number 10
> [  299.209631] usb usb4-port1: Cannot enable. Maybe the USB cable is bad?
> [  301.789655] usb usb4-port1: Cannot enable. Maybe the USB cable is bad?
> [  301.790534] usb usb4-port1: attempt power cycle
>
> (although new devices are still detected OK eventually)
>
> Robin.
(Resending because I forgot the Android Gmail app fails at plain text)

Thanks! May I ask which board and what type of USB 3 device it was?
(I tried a usb3 hub and a Samsung sad)

Also I noticed some odd behavior when I was getting it to work.
When the u3phy driver loaded but wasn't tied to the controller, it
would put everything to sleep.
In this state, the u2 host port also failed to enumerate on boot.
It's almost as if they have something common between them that isn't
being accounted for in the u2 driver.
With the u3phy driver loaded and tied to the controller, I couldn't
get a low speed device to work in the u2 host port (the aeotec zwave
stick at 12m) but a hs device works fine.
>
>
> > One quick comment is that it might be worth importing the version from
> > Rockchip's own kernel tree, as that includes this additional patch which
> > looks like a welcome improvement:
> >
> > https://github.com/rockchip-linux/kernel/commit/12efa9acad65b4c3256683c1ccd769687be3ca56#diff-b6317b3425ac054be551abdcda910b68
> >
> >
> > Also, as it's a new phy driver, we should keep Kishon (+cc) in the loop
> > as the subsystem maintainer.
> >
> > Robin.
> >
> >> [0]
> >> https://github.com/FireflyTeam/kernel/commits/roc-rk3328-cc/drivers/phy/rockchip/phy-rockchip-inno-usb3.c
> >>
> >>
> >> Peter Geis (5):
> >>    phy: rockchip: add inno-usb3 phy driver
> >>    dt-bindings: clean up rockchip grf binding document
> >>    Documentation: bindings: add dt documentation for rockchip usb3 phy
> >>    arm64: dts: rockchip: add usb3 to rk3328 devicetree
> >>    arm64: dts: rockchip: enable usb3 on rk3328-roc-cc
> >>
> >>   .../bindings/phy/phy-rockchip-inno-usb3.yaml  |  157 +++
> >>   .../devicetree/bindings/soc/rockchip/grf.txt  |    8 +-
> >>   .../devicetree/bindings/usb/rockchip,dwc3.txt |    9 +-
> >>   .../arm64/boot/dts/rockchip/rk3328-roc-cc.dts |   21 +
> >>   arch/arm64/boot/dts/rockchip/rk3328.dtsi      |   72 ++
> >>   drivers/phy/rockchip/Kconfig                  |    9 +
> >>   drivers/phy/rockchip/Makefile                 |    1 +
> >>   drivers/phy/rockchip/phy-rockchip-inno-usb3.c | 1107 +++++++++++++++++
> >>   8 files changed, 1378 insertions(+), 6 deletions(-)
> >>   create mode 100644
> >> Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb3.yaml
> >>   create mode 100644 drivers/phy/rockchip/phy-rockchip-inno-usb3.c
> >>
> >
> > _______________________________________________
> > Linux-rockchip mailing list
> > Linux-rockchip@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-rockchip
