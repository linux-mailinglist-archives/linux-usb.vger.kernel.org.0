Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C03BA124EFE
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2019 18:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbfLRRVV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Dec 2019 12:21:21 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:33992 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbfLRRVV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Dec 2019 12:21:21 -0500
Received: by mail-oi1-f194.google.com with SMTP id l136so1458297oig.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2019 09:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qhOjO/1gjiU66/m8Xa5+Rrg7RA8so1GtC0PAJud5ghg=;
        b=om9dPwAjIU47ga82gy5KKpWBDVfzap35dWTr/XUPxPDlU0FIPA0gef7eEJjUfEO67V
         rylx2xY1hU7ziHnwS6iVDY1TPgy+YUxJXCFXAHILLXwgp1kjmNEUNX2he+bTOHIs9NPU
         CEoMjKwIy/542tQba6lQr/s+0piM6M7vYCSlvbhMKyoOneH65NmIYmFEdKSLM6DRfuSt
         MSVQPWoqJpJZ38kI+GJbmLVNyI8Rf7uMDQPrEcHuO6b11Vjc5vUaTK02U/Fcs8zQjPLs
         0c9ygZaABIGAOOfO3gIDQS0gGfYe71PnX/vekinxRV3DVP8VT4wyvMjl+hNrGkUkWxV7
         5M5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qhOjO/1gjiU66/m8Xa5+Rrg7RA8so1GtC0PAJud5ghg=;
        b=sYJC0qtjvaOb7sbBNuwMZ1UWnCgbPdf9c3o33mMECNZRGOc9XsYBZpeESS2It1oza/
         BFBjqQLryXB6qSoLqvz0LZcN3NyudugV7z1ZdxRavu8XcSe00ujxBh7lIywJDPl/LhCE
         VNEkZJdpGFLuCKB36GDtiih+Mqnb6R+6BsW5plxp1S42qaQZUrfEiwaKJfqXhn8JeL4m
         fNr8NKKxTkJRWMbvvDr80NV8zbubjmA5FIy9/btbQ9nq0BDRjj59DtsMPXqlY8Rpc7Lg
         4mJPpEKUW2qAZyRZgzph6rNocC1bKQWNio7MOH9bkjYtaxr5ff+oM6YcCJ60f7d9OK+2
         na9Q==
X-Gm-Message-State: APjAAAX2b7g3e30n+fm4xG4Aq9sg2qaONiSbkHgAGsYgYoMM+ot7sdMa
        4hs3Ez3iaJ0mJ7M66SP0h6Veh1VH2qKcZPENqKZ8XQ==
X-Google-Smtp-Source: APXvYqy9yB9O2gc/s3TvIPq5EZergrpBAODzTElqm/0+LfSrgIdkX4baam98niE2ZGYKR0djgev3Q1jmksxw8X7Z49o=
X-Received: by 2002:aca:c551:: with SMTP id v78mr1055611oif.161.1576689680623;
 Wed, 18 Dec 2019 09:21:20 -0800 (PST)
MIME-Version: 1.0
References: <20191212014233.32799-1-john.stultz@linaro.org>
 <20191212014233.32799-8-john.stultz@linaro.org> <20191218163738.GA12358@bogus>
In-Reply-To: <20191218163738.GA12358@bogus>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 18 Dec 2019 09:21:05 -0800
Message-ID: <CALAqxLU=KPJoPKHP14BWcLYJdBoK8DC5+7hRtqCvE2-HZHWxZA@mail.gmail.com>
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

On Wed, Dec 18, 2019 at 8:37 AM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Dec 12, 2019 at 01:42:32AM +0000, John Stultz wrote:
> > From: Yu Chen <chenyu56@huawei.com>
> >
> > This patch adds binding documentation to support usb hub and usb
> > data role switch of Hisilicon HiKey960 Board.
> >
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > CC: ShuFan Lee <shufan_lee@richtek.com>
> > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> > Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > Cc: Yu Chen <chenyu56@huawei.com>
> > Cc: Felipe Balbi <balbi@kernel.org>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Cc: Jun Li <lijun.kernel@gmail.com>
> > Cc: Valentin Schneider <valentin.schneider@arm.com>
> > Cc: Guillaume Gardet <Guillaume.Gardet@arm.com>
> > Cc: Jack Pham <jackp@codeaurora.org>
> > Cc: linux-usb@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Yu Chen <chenyu56@huawei.com>
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > ---
> > v3: Reworked as usb-role-switch intermediary
> >
> > v7: Switched over to YAML dt binding description
> > ---
> >  .../bindings/misc/hisilicon-hikey-usb.yaml    | 85 +++++++++++++++++++
> >  1 file changed, 85 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml b/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
> > new file mode 100644
> > index 000000000000..1fc3b198ef73
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
> > @@ -0,0 +1,85 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright 2019 Linaro Ltd.
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/misc/hisilicon-hikey-usb.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: HiKey960 onboard USB GPIO Hub
> > +
> > +maintainers:
> > +  - John Stultz <john.stultz@linaro.org>
> > +
> > +description: |
> > +  Supports the onboard HiKey960 USB GPIO hub, which acts as a
> > +  role-switch intermediary to detect the state of the USB-C
> > +  port, to switch the hub into dual-role USB-C or host mode,
> > +  which enables the onboard USB-A host ports.
>
> Honestly I'm torn between whatever works for you because this is pretty
> "special" dev board design and it should more accurately match the
> hardware design. I think we can do the later and it doesn't really need
> anything new.
>
> > +
> > +  Schematics about the hub can be found here:
> > +    https://github.com/96boards/documentation/raw/master/consumer/hikey/hikey960/hardware-docs/HiKey960_Schematics.pdf
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: hisilicon,gpio_hubv1
>
> As a whole this is HiSilicon specific, but really it is not. It's really
> just a hub, a mux, and connectors for which we have bindings for. I
> think you need to model the actual hub in DT. We have 2 ways already to
> describe hubs in DT: a I2C device or USB device.
>
> AIUI, the board looks something like this:
>
> ctrl -> mux --> hub -> type-a connector
>             +-> type-c connector
>
> If the hub I2C is not used, then you could do something like this:
>
> ctrl {
>     mux-controls = <&usb_gpio_mux>;
>     connector@0 {
>         // type C connector binding
>     };
>     hub@1 {
>         // USB device binding
>     };
> };

I can't say I totally grok all this, but I'll go digging to try to
better understand it.
I don't believe there is any I2C involved here, so I'll try the
approach you outline above.



> Or if I2C is used and the hub is under the I2C controller:
>
> ctrl {
>     port@0 {
>         mux-controls = <&usb_gpio_mux>;
>         endpoint@0 { // mux state 0
>                 remote-endpoint = <&usb_c_connector_port>;
>         };
>         endpoint@1 { // mux state 1
>                 remote-endpoint = <&usb_hub_port>;
>         };
> };
>
> The only new bindings you really need are adding 'mux-controls' to the
> USB host controller and the hub binding (we already have a few).
>
> If the USB2 and USB3 signals come from 2 different host controller
> nodes, then I think it will need to look like the 2nd case regardless
> of I2C. (It's strange that USB3 was not routed to Type-C connector. Can
> you do USB2 on Type-C and USB3 on hub simultaneously? You need USB2 to
> enumerate, right?)

Yea, it is strange, and I unfortunately don't know why only USB2 was
exported to the type-c connector.
And to my knowledge, you cannot use both the type-c and hub simultaneously.


> > +
> > +  typec-vbus-gpios:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle to the typec-vbus gpio
>
> This should be modeled as a GPIO regulator, and belongs as part of a
> connector node. See bindings/connector/usb-connector.txt.
>
> > +
> > +  otg-switch-gpios:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle to the otg-switch gpio
>
> This would be the gpio-mux binding instead.
>
> > +
> > +  hub-vdd33-en-gpios:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle to the hub 3.3v power enablement gpio
>
> This should be modeled as a GPIO regulator.
>
> What about the reset line on the hub?

Unknown. I don't have any details on that.


> > +
> > +  usb-role-switch:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: Support role switch.
>
> This normally is a controller property. Role switch is foreign to the
> hub, so doesn't really belong there for sure.

So this part was critical to being able to get role switch
notification from the connector and to properly switch modes without
adding extra notifier gunk from the previous patch that folks didn't
like.

Trying to understand further,  your suggestion here is to re-model the
binding, as gpio regulators and gpio muxes, and use a usb-connector
node to describe them,  but I'm missing how I connect that to the
driver implementation I have? Is the idea to extend the rt1711h and
dwc3 drivers further to support the mux/hub bit (this part is fairly
foggy to me), completely removing the need for the misc driver?

I did take an attempt at something similar with an earlier iteration
of the patch set, where I was trying to move the vbus-gpio as a
gpio-regulator to be controlled by the rt1711h/tpcm core, but that
approach didn't work properly and Hans suggested I just go back to the
approach submitted here:
  https://lkml.org/lkml/2019/10/22/42

thanks
-john
