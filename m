Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99D9E2415C3
	for <lists+linux-usb@lfdr.de>; Tue, 11 Aug 2020 06:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbgHKEhM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Aug 2020 00:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbgHKEhL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Aug 2020 00:37:11 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B59C061787
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2020 21:37:10 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id a6so2353532oog.9
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2020 21:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FPdGPls7XKnK6l88IhsscH6AnhZFYq5rNB+PX3ZFR10=;
        b=dxM1z0BXDg7afqYJjQfxO/1MwrEEycqlmIvtkr78rcvSx5zSGDmtjx7RfUB4iahSRI
         hpJKOS62qM66XQvcpwByUcZSxLv8dBj+QgnI/79a5Sj43X1OVTComqFOq7lW9XFjv7dX
         z3jNtbfL9Fkxt+yFpAwfBGvVB3vhYuMJ/Fuw3m68et3TztY/RQywPJ2asv1CvjSmyTXM
         WOt0NigS+vakIelTY8UMnqpIQauXZuxERuajNmRqxYkHmfs09Ng0ahY2RATff7JM4zcn
         ZEFCgYr6mM0EXIlvIc1HlGE4ArISfjFlS82KJeyBXg31Ek4qQ23YHYU00h8EToKdqATd
         NzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FPdGPls7XKnK6l88IhsscH6AnhZFYq5rNB+PX3ZFR10=;
        b=ZFRg1x2T7kEKto2oKDOqk66q1XrqVOp/xezj7CW2dK7CtVBGIk0OX7r4rMPFkHXjY1
         HIm+OeZTFrCK4xoAlW0s+KnrpBX/XHlDawg0+l68dmCTVNJxZunCuwXVCAaj6wtbKUv3
         RJJFKx9OiLixfx4j35vRf2mQc2M9g5tZ2KpbT7BEr6MXZaRRA4Vkrs8YrsjrWq+/SU7b
         WQD1m9aV4EJnNoWxtdMtFl++19x1lUT/IA7/bGk72/iI2WOxd6cO3qVbWP1Y7KH8AaOS
         TBBV1pUx4y6JdPfyNHJdkbjYbb0m+UP8Rk2hTCctQ51dhc4zWk0HvAaIXoH86FcCaHS0
         APsg==
X-Gm-Message-State: AOAM530XS1SfxN9VGPe2UZZA3W7EJaLWzsLORooUA2HPKKCsQEYTeJEP
        one/hyfyxmP8DPaTm5+xKG3PbiAXTfrOoj+R2CVjQQ==
X-Google-Smtp-Source: ABdhPJxM9JRpnyVw1z5GDRbBjP7hicHOZu1FavU7lQF0kZi/nJnX2jui7VosuKd0dv38Z0cz/XRvr2yosDYuIzuEHCw=
X-Received: by 2002:a4a:a648:: with SMTP id j8mr3662355oom.36.1597120629344;
 Mon, 10 Aug 2020 21:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191016033340.1288-1-john.stultz@linaro.org> <20191016033340.1288-12-john.stultz@linaro.org>
 <20200810183503.3e8bae80@coco.lan>
In-Reply-To: <20200810183503.3e8bae80@coco.lan>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 10 Aug 2020 21:36:58 -0700
Message-ID: <CALAqxLUu76m=Q_tDht4DmtgXYmL7Ma1zVJZzvhcsHn2hMAgpLA@mail.gmail.com>
Subject: Re: [RFC][PATCH v3 11/11] misc: hisi_hikey_usb: Driver to support usb
 functionality of Hikey960
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     lkml <linux-kernel@vger.kernel.org>, Yu Chen <chenyu56@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Felipe Balbi <balbi@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Jack Pham <jackp@codeaurora.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 10, 2020 at 9:35 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> Em Wed, 16 Oct 2019 03:33:40 +0000
> John Stultz <john.stultz@linaro.org> escreveu:
>
> > From: Yu Chen <chenyu56@huawei.com>
> >
> > The HiKey960 has a fairly complex USB configuration due to it
> > needing to support a USB-C port for host/device mode and multiple
> > USB-A ports in host mode using a single USB controller.
> >
> > See schematics here:
> >   https://github.com/96boards/documentation/raw/master/consumer/hikey/hikey960/hardware-docs/HiKey960_Schematics.pdf
> >
> > This driver acts as a usb-role-switch intermediary, intercepting
> > the role switch notifications from the tcpm code, and passing
> > them on to the dwc3 core.
> >
> > In doing so, it also controls the onboard hub and power gpios in
> > order to properly route the data lines between the USB-C port
> > and the onboard hub to the USB-A ports.
> >
> > NOTE: It was noted that controlling the TYPEC_VBUS_POWER_OFF and
> > TYPEC_VBUS_POWER_ON values here is not reccomended. I'm looking
> > for a way to remove that bit from the logic here, but wanted to
> > still get feedback on this approach.
>
> Let me somewhat hijack this thread. I'm trying to add support here
> for the Hikey 970 driver. Maybe you might help me finding the remaing
> issues over there ;-)

So.. just as a heads up, this is a fairly old version of this patch. I
have the current version here:
  https://git.linaro.org/people/john.stultz/android-dev.git/commit/?h=dev/hikey960-mainline-WIP&id=1155346a06472177b8a7e7918de052549916f06f

So you may want to rework ontop of that.

That said, the last time I submitted the hub/mux driver, Rob pushed
back suggesting that the vbus, switch and hub power should probably be
DT describable:
  https://lore.kernel.org/lkml/20191218163738.GA12358@bogus/

I'm at the point where I probably don't have additional cycles to
spend to rework all the supporting drivers to support such a DT
binding, so I'm not very optimistic this patch will go upstream (its
much easier to float the current hub/mux driver).  So you may want to
focus on Rob's feedback there rather than any of my feedback here. :)


> The Hikey 970 has lots of things in common with Hikey 960, but
> the USB hub uses a somewhat different approach (based on what I
> saw at the Linaro's 4.9 official Hikey kernel tree).
>
> Basically, with the enclosed patch applied, the USB hub needs these
> at the DT file:
>
>                 hikey_usbhub: hikey_usbhub {
>                         compatible = "hisilicon,kirin970_hikey_usbhub";
>
>                         typec-vbus-gpios = <&gpio26 1 0>;
>                         otg-switch-gpios = <&gpio4 2 0>;
>                         hub_reset_en_gpio = <&gpio0 3 0>;
>                         hub-vdd-supply = <&ldo17>;
>                         usb-role-switch;
> ...
>                 }
>
> E.g. when compared with Hikey 960, the USB hub:
>
> - Hikey 970 uses a regulator instead of GPIO for powering on;

So, it might not be too hard to rework the hikey960 hub power gpio to
a gpio-regulator binding, and then both platforms can use the same
code?

> - Hikey 970 has a reset pin controlled via GPIO.

You might be able to put this reset pin under the dwc3 resets?


> It should be simple to add support for it, as done by the
> enclosed patch. With this, the phy driver for Hikey 970 and a new
> small driver to properly set clocks and reset lines at dwg3[1],
> I can now see the hub on my Hikey970:
>
>         $ lsusb
>         Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>         Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>
> Still, I'm missing something to make it work, as, besides the hub,
> right now, it doesn't detect the keyboard/mouse, which are
> attached at the USB hub.
>
> Do you have any ideas?

Not sure about the hub keyboard mouse issue. I worry that may be an
issue with the hub power not being on?
Make sure the mux driver is in the expected state when you boot up and
switch modes.

> [1] Right now, this is needed:
>         https://github.com/96boards-hikey/linux/blob/hikey970-v4.9/drivers/usb/dwc3/dwc3-hisi.c
>
>     Placing dwc3 directly under soc at DT causes some weird NMI, with
>     either produce an OOPS or hangs the machine at boot time.

I suspect you can drop the dwc3-hisi glue code once you move the clks
and resets to the dwc3 node directly, as we did for hikey960.
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/hisilicon/hi3660.dtsi?id=4bcf69e57063c9b1b15df1a293c969e80a1c97e6#n1169

thanks
-john
