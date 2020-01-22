Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA4B2145B92
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2020 19:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbgAVS2P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jan 2020 13:28:15 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40555 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726164AbgAVS2P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jan 2020 13:28:15 -0500
Received: by mail-oi1-f195.google.com with SMTP id c77so327402oib.7
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2020 10:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/nmCPb+XXCVt5KhfGb/8H7zZgYObjRj8769ul8BOa2o=;
        b=hdEtixhHfOZuWMp0/X6AY8Ms4a/2ls0PXttrGni4Z/DBE8LLDiXkABZ0PJ58/gV3Au
         /H0Vjqh2uiHmAwmKNvHB15NHTXKz5eQ1qKrd9tYQvGzi+a+kjDkILD3xOWwcjoG5Zn2F
         mUSZ7B5yHXHdC3euPJ5fOXA1O6ILZ8Qvf4v3/TSKND60QxAmvIE2w2uLIquwDjxWPZD7
         9AIp/qQcEJDRQPYzU5F/lhOgJCi5Lc7w4EQjdRgCfEGDu0m/mgZAzQO3fcY9AQ0+NpXA
         H6wwuQKh5/qXBUB4sW5JgHSqkbsChQBpEsh+TgajyWylfp6QxvaI213QqIEgTYUE6kES
         GgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/nmCPb+XXCVt5KhfGb/8H7zZgYObjRj8769ul8BOa2o=;
        b=L0Pl/pzD2MmW9lA8QO3zTKgHLxwlm1mZ3Lz8l2I7mxpNKwZXlKX+L0GsaFq2biTjVJ
         HERJCEQHM36hMEwhYcMy3Y41Z/N/iMVkybOlI6b92IOQDKe38nOIDNP2SV2dCDCFLnyN
         +Y3TCd/lDnNPFBkhKmSWAeToCBkm4L5gri1yHSotDBT56mVZKx14WGqvAsB9pTM6Twr2
         GnvcRHv9OLXQpOR87TeoaNbvi/shguNCjSGUvV+0f+sNsJzZObaU8iy3fJlnt7+fyS8/
         VNYoKx9pjlO/5yi+ox4Kubk5moeGh05y4USH83YjSEhFxPTq24ZSi99Tq0xcqrWedTxo
         yLAw==
X-Gm-Message-State: APjAAAUJUEpnQt03DxrFg4TRfJoC69s2M+1Q6dvUe5RKXT3AtpvKSb/u
        2eUMp9RAHZOBQH5C+JV/FGMMQtDnQM26vsEB3Jm9vw==
X-Google-Smtp-Source: APXvYqzSW3nTaM3W/BugRvoJ65EPdnrE0AXnH4fjjOZ+G8Qyw5uBexwDzoPs/jd+hW+LN2XWrUZOYIeT7Ac7gpkLWDE=
X-Received: by 2002:aca:c551:: with SMTP id v78mr7775111oif.161.1579717694073;
 Wed, 22 Jan 2020 10:28:14 -0800 (PST)
MIME-Version: 1.0
References: <20191212014233.32799-1-john.stultz@linaro.org>
 <20191212014233.32799-8-john.stultz@linaro.org> <20191218163738.GA12358@bogus>
 <CALAqxLU=KPJoPKHP14BWcLYJdBoK8DC5+7hRtqCvE2-HZHWxZA@mail.gmail.com> <CAL_Jsq+9uSMfpQZxmfJX4Y4R_xwkK413SqNZ3x6XpKpMvWA56Q@mail.gmail.com>
In-Reply-To: <CAL_Jsq+9uSMfpQZxmfJX4Y4R_xwkK413SqNZ3x6XpKpMvWA56Q@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 22 Jan 2020 10:28:03 -0800
Message-ID: <CALAqxLVgyyDmoKAxrKp-GvkBZ4hfbMgEBThPeVmJ7EZ6GzLjFw@mail.gmail.com>
Subject: Re: [PATCH v7 7/8] dt-bindings: misc: Add bindings for HiSilicon usb
 hub and data role switch functionality on HiKey960
To:     Rob Herring <robh@kernel.org>
Cc:     lkml <linux-kernel@vger.kernel.org>, Yu Chen <chenyu56@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
        Guillaume Gardet <Guillaume.Gardet@arm.com>,
        Jack Pham <jackp@codeaurora.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

(Sorry for the slow reply. The holidays and other priorities struck
and I'm only now just getting back to this!)

On Wed, Dec 18, 2019 at 11:57 AM Rob Herring <robh@kernel.org> wrote:
> On Wed, Dec 18, 2019 at 11:21 AM John Stultz <john.stultz@linaro.org> wrote:
> > On Wed, Dec 18, 2019 at 8:37 AM Rob Herring <robh@kernel.org> wrote:
> > > As a whole this is HiSilicon specific, but really it is not. It's really
> > > just a hub, a mux, and connectors for which we have bindings for. I
> > > think you need to model the actual hub in DT. We have 2 ways already to
> > > describe hubs in DT: a I2C device or USB device.
> > >
> > > AIUI, the board looks something like this:
> > >
> > > ctrl -> mux --> hub -> type-a connector
> > >             +-> type-c connector
> > >
> > > If the hub I2C is not used, then you could do something like this:
> > >
> > > ctrl {
> > >     mux-controls = <&usb_gpio_mux>;
> > >     connector@0 {
> > >         // type C connector binding
> > >     };
> > >     hub@1 {
> > >         // USB device binding
> > >     };
> > > };
> >
> > I can't say I totally grok all this, but I'll go digging to try to
> > better understand it.
> > I don't believe there is any I2C involved here, so I'll try the
> > approach you outline above.
>
> Well, it is there in the schematics.

Fair point. Though at least for the USB5734 hub, I don't believe we've
made use of the i2c on it (at least that I can see).  From the
existing driver, the control is basically just 3 GPIOs:  type-c power,
hub power, and the mux/switch.

Trying to get my head around your suggestion:
ctrl {
    mux-controls = <&usb_gpio_mux>;
    connector@0 {
        // type C connector binding
    };
    hub@1 {
        // USB device binding
    };
};

The usb_gpio_mux would be the gpio mux switch.

For the "type C connector binding", that would probably be the rt1711h
type-c chip.

For the "USB device binding" that would be a yet to be implemented
USB5734 hub driver, I'm guessing?

Though I'm not sure I understand how the hub driver gets a signal to
power-on/power-off its gpio-regulator from the mux state?  I'm maybe
still missing some details on the mux infrastructure.

> > > The only new bindings you really need are adding 'mux-controls' to the
> > > USB host controller and the hub binding (we already have a few).

So this is a little confusing to me. Why is the host controller
involved?  It seems to me all of this is down-stream of the
controller, and it's just taking whatever the switch gives it.

I think the switch needs to be signalled from the rt1711h type-c
connector (when it detects the cable and determines the role). That
said, I'm not sure how it would think to control the mux in that case
(as that's pretty special case for this specific hardware). That's why
we're using the role notifier intermediary trick in the current code.

So I guess we could still have the roll notifier intermediary driver
which then controls the mux?

I know that's more a driver implementation detail and not really
hardware description, :) but I'm just trying to figure out how it's
going to come together and actually work.

> > Is the idea to extend the rt1711h and
> > dwc3 drivers further to support the mux/hub bit (this part is fairly
> > foggy to me), completely removing the need for the misc driver?
>
> I imagine that you need some driver to determine the state of the mux.
> Perhaps a usb-mux driver which is instantiated by the host controller
> driver when it sees a mux-controls property. Sorry, haven't looked at
> the driver side of this at all.
>
> > I did take an attempt at something similar with an earlier iteration
> > of the patch set, where I was trying to move the vbus-gpio as a
> > gpio-regulator to be controlled by the rt1711h/tpcm core, but that
> > approach didn't work properly and Hans suggested I just go back to the
> > approach submitted here:
> >   https://lkml.org/lkml/2019/10/22/42
>
> I don't see why that would matter. If you need to sense the Vbus
> state, then you do need a GPIO typically. But for an enable line, it's
> just another level of abstraction.

My concern is that I suspect the issue we had then was that the order
and the timing that we switch the 3 GPIOs ends up being important. In
the current implementation we can adjust them linearly together, where
as when I took a stab at having the vbus gpio was modeled as a
regulator and controlled independently by the rt1711h, the typec state
machine would get confused as I'm guessing the mux/switch wasn't where
it expected it to be when it wanted to change the state of the type-c
vbus.

Thoughts?

Thanks again for the review and feedback. And sorry to let so much
time (and mental context) pass.
-john
