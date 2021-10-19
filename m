Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 402FB433C0E
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 18:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhJSQ1H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 12:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233550AbhJSQ1G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Oct 2021 12:27:06 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3F4C061749
        for <linux-usb@vger.kernel.org>; Tue, 19 Oct 2021 09:24:53 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id z24so448536qtv.9
        for <linux-usb@vger.kernel.org>; Tue, 19 Oct 2021 09:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=15SUVNjuA+MqctsOYnbPTmIlkRsNZOxO4riu8UF//h0=;
        b=fK+lPSwI1RGJXAeOcYSmAi+RRs1ueziY8FqbXBa7BV7E6/7ByaK9ZCRh4GJ/AD3tJH
         KMFoi6ZnmXOtxgyveYyZLIIKkdqGEn4bgFZ3npMLiyPPZEXjf0FRBJ1QWsPUmy1GmqQ+
         ORo+WtPrWflHN2JPS3no9tLz1jt1sMSSC3YZ8rMATQuYIPelGrmMCmKm7S+8Ep+km5v3
         UFS0dGbUDHUjmRPJuqMEekENex2g/uxRI7rjUae03apr/DsfFWa8coFytMyrG4wID414
         L3Evm2x5kDzlTqn1GMnnCbRu6EW8I//L9ZRBKvMu+bHgTrg4SBgU0SLRCd4fcA3rvy1K
         JUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=15SUVNjuA+MqctsOYnbPTmIlkRsNZOxO4riu8UF//h0=;
        b=JfifEXoJXp0jI3VVtVUlQgwv26UJfhQoBB3/NHB6KAVWtSQ+sMvqlDMnYzbh69S06F
         fOYlC1SujtlvgEOs0U74YlRL6U6ViBTYtvzkcmRphYQiG90EEoyu3dmJOXenLM7RGc/V
         1phZMBFZjlqKH6hf2QrD3MpMSldNnmRRdodxW8pgfb/v7NhwK6m3qCB8mGwqVab7KLKb
         DM2DkPGAKF3Je6SxuhI7goqeQHaVetjn+Qd7YNVLxC+5jm4qNX57QgzZhPTlI4JwpFou
         sJo+mgkl+nBM8/WbFhiGhyNLwweI4yn/wtaK61eyBnRkmD1aiuF/1Aq7L1GsjaS4hYPi
         zqQw==
X-Gm-Message-State: AOAM531oKUi9bpYpSsk/AJvXY2rciWOHiFgDyt72xDobP01kjs/NU35K
        lcPZuSIB78QbwxzA1W3suBw+ZuNw4NjQYgK565s9hA==
X-Google-Smtp-Source: ABdhPJwhsxdepZGrzEMoIzc6l/55gIir0sm89iZlWRUPYW3kP59vAcG9XWpOFy592VMNC+pRPFoGt4IIFn2UIbiT9J8=
X-Received: by 2002:ac8:7d92:: with SMTP id c18mr1039528qtd.388.1634660693042;
 Tue, 19 Oct 2021 09:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210727004118.2583774-1-mka@chromium.org>
In-Reply-To: <20210727004118.2583774-1-mka@chromium.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 19 Oct 2021 19:24:41 +0300
Message-ID: <CAA8EJpq55e+fk9oDi8+JXDWiPcXDXK5oz1DL5eqfx+FkT-xhnw@mail.gmail.com>
Subject: Re: [PATCH v15 0/6] usb: misc: Add onboard_usb_hub driver
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Peter Chen <peter.chen@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        open list <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-usb@vger.kernel.org,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Al Cooper <alcooperx@gmail.com>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Andy Gross <agross@kernel.org>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Nishanth Menon <nm@ti.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 27 Jul 2021 at 03:41, Matthias Kaehlcke <mka@chromium.org> wrote:
>
> This series adds:
> - the onboard_usb_hub_driver
> - glue in the xhci-plat driver to create and destroy the
>   onboard_usb_hub platform devices if needed
> - a device tree binding for the Realtek RTS5411 USB hub controller
> - device tree changes that add RTS5411 entries for the QCA SC7180
>   based boards trogdor and lazor
> - a couple of stubs for platform device functions to avoid
>   unresolved symbols with certain kernel configs
>
> The main issue the driver addresses is that a USB hub needs to be
> powered before it can be discovered. For discrete onboard hubs (an
> example for such a hub is the Realtek RTS5411) this is often solved
> by supplying the hub with an 'always-on' regulator, which is kind
> of a hack. Some onboard hubs may require further initialization
> steps, like changing the state of a GPIO or enabling a clock, which
> requires even more hacks. This driver creates a platform device
> representing the hub which performs the necessary initialization.
> Currently it only supports switching on a single regulator, support
> for multiple regulators or other actions can be added as needed.
> Different initialization sequences can be supported based on the
> compatible string.

I have the feeling that you might want to check if you can use pwrseq
subsystem being proposed at
https://lore.kernel.org/linux-arm-msm/20211006035407.1147909-1-dmitry.baryshkov@linaro.org/.
It has been created for exactly the same reason of handling complex
power up/down requirements in a bus-neutral way. So instead of
creating an onboard-usb-hub, you might want to populate the hub node
with the reference to pwrseq device and make usb core call into
pwrseq. How does that sound to you?

>
> Besides performing the initialization the driver can be configured
> to power the hub off during system suspend. This can help to extend
> battery life on battery powered devices which have no requirements
> to keep the hub powered during suspend. The driver can also be
> configured to leave the hub powered when a wakeup capable USB device
> is connected when suspending, and power it off otherwise.


-- 
With best wishes
Dmitry
