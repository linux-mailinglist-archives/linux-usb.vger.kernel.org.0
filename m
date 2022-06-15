Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFE7754D359
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jun 2022 23:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348984AbiFOVKF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jun 2022 17:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348877AbiFOVKC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jun 2022 17:10:02 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D76427EC
        for <linux-usb@vger.kernel.org>; Wed, 15 Jun 2022 14:10:01 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id u12so25588949eja.8
        for <linux-usb@vger.kernel.org>; Wed, 15 Jun 2022 14:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gezakuSGfe/XtV5ImoouyA0+Isu2QUrY2kAucW174PM=;
        b=Rm2lvt38Xuzf4wdJoH+2Ghqc7vQuNI+phzV7EWVPUFQ6EUC1aZU5QETBEBTssdR0bo
         VE9iyxg1hiw80yeOYUGb9PDJwy+lSSy/uQQas/hFNHo0PnMZaWHR0ndR1t7ZFEAcFQ0a
         F5XbeIviI1uJCmGgq0Yn0m+Q/FXmhKXxr/1hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gezakuSGfe/XtV5ImoouyA0+Isu2QUrY2kAucW174PM=;
        b=cOwXqWgFOYjAYKC9l3+n2btSnLOzay2Xo2eNLRZ9N6Y2nH46MmyYv+zowmqQnUEIIY
         dm6NX3gQdHnouPlZGzYFmMZZxjAUMJxF8zJuL2quQpA66LmPQTwC+B99eo/GL/GVrQpA
         D/zVS2Zn0jClQXeAPKhHDPwtUUlWKZzJRHLpMnkEZLWCNfuX9+FPCAjciOEPZSEExkWt
         oMyGu6gM+6tGArabxfSC+kRw/4i7LQJpvdjHT9Hgr053kU18MBWurUFQlu9l/2VF6JuO
         dk/KHPKqubIUPZWvIsRaK1b7oMiS0UsUf9OW2/QWkrkIQICWE0uajV2s1izsq60wA4Fw
         loVw==
X-Gm-Message-State: AJIora9+jAYMk4p+WOTzM1osrqHgGBXDT2B5mC6DoBvZydEDlK9UbApb
        SsR6piy4oVr+Oz68bjwbwqCApIPGo7/h/EZR+0Y=
X-Google-Smtp-Source: AGRyM1vjG+44QtABPLvBY64fHVPeu0Y+21nRHgVS0RWu8sRMDkYCBgWjBfmApT55nutGRtEvVNbNzA==
X-Received: by 2002:a17:907:6e90:b0:711:cb3c:8c1a with SMTP id sh16-20020a1709076e9000b00711cb3c8c1amr1656493ejc.516.1655327399423;
        Wed, 15 Jun 2022 14:09:59 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id ko9-20020a170907986900b006fef5088792sm6754411ejc.108.2022.06.15.14.09.56
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 14:09:58 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id c21so16966948wrb.1
        for <linux-usb@vger.kernel.org>; Wed, 15 Jun 2022 14:09:56 -0700 (PDT)
X-Received: by 2002:a5d:6483:0:b0:20f:d046:6382 with SMTP id
 o3-20020a5d6483000000b0020fd0466382mr1626823wri.342.1655327396288; Wed, 15
 Jun 2022 14:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220609192000.990763-1-mka@chromium.org> <20220609121838.v22.2.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
In-Reply-To: <20220609121838.v22.2.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 15 Jun 2022 14:09:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W6erE8ByabmYSL_OWJPKYGqysDMGYQX6j7_PSEYGZ4YQ@mail.gmail.com>
Message-ID: <CAD=FV=W6erE8ByabmYSL_OWJPKYGqysDMGYQX6j7_PSEYGZ4YQ@mail.gmail.com>
Subject: Re: [PATCH v22 2/3] usb: misc: Add onboard_usb_hub driver
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Bastien Nocera <hadess@hadess.net>,
        Peter Chen <peter.chen@kernel.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Jun 9, 2022 at 12:20 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> @@ -11,6 +11,7 @@ usbcore-y += phy.o port.o
>  usbcore-$(CONFIG_OF)           += of.o
>  usbcore-$(CONFIG_USB_PCI)              += hcd-pci.o
>  usbcore-$(CONFIG_ACPI)         += usb-acpi.o
> +usbcore-$(CONFIG_USB_ONBOARD_HUB)      += ../misc/onboard_usb_hub_pdevs.o

I'm OK with this solution of just linking the code into the "usbcore"
if USB folks are. Thinking about it, I guess another way to solve the
circular dependency is to somehow create some type of generic
notification scheme where the USB hub driver subscribes to "a hub has
appeared" notification. ...but I don't personally have any intuition
about whether people would like that better than your solution.


> +config USB_ONBOARD_HUB
> +       bool "Onboard USB hub support"
> +       depends on OF || COMPILE_TEST
> +       help
> +         Say Y here if you want to support discrete onboard USB hubs that
> +         don't require an additional control bus for initialization, but
> +         need some non-trivial form of initialization, such as enabling a
> +         power regulator. An example for such a hub is the Realtek
> +         RTS5411.
> +
> +         This driver can be used as a module but its state (module vs
> +         builtin) must match the state of the USB subsystem. Enabling
> +         this config will enable the driver and it will automatically
> +         match the state of the USB subsystem. If this driver is a
> +         module it will be called onboard_usb_hub.
> +
> +if USB_ONBOARD_HUB
> +config USB_ONBOARD_HUB_ACTUAL
> +       tristate
> +       default m if USB=m
> +       default y if USB=y
> +endif

Do you still need to play the games with "_ACTUAL"? The USB core no
longer calls the hub directly. I think that means you can just "depend
on USB" and be done with the mess. That allows USB to be builtin and
USB_ONBOARD_HUB can be a module, right?


> +static int onboard_hub_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct onboard_hub *hub;
> +       int err;
> +
> +       hub = devm_kzalloc(dev, sizeof(*hub), GFP_KERNEL);
> +       if (!hub)
> +               return -ENOMEM;
> +
> +       hub->vdd = devm_regulator_get(dev, "vdd");
> +       if (IS_ERR(hub->vdd))
> +               return PTR_ERR(hub->vdd);
> +
> +       hub->dev = dev;
> +       mutex_init(&hub->lock);
> +       INIT_LIST_HEAD(&hub->udev_list);
> +
> +       dev_set_drvdata(dev, hub);
> +
> +       err = onboard_hub_power_on(hub);
> +       if (err)
> +               return err;
> +
> +       /*
> +        * The USB driver might have been detached from the USB devices by
> +        * onboard_hub_remove(), make sure to re-attach it if needed.
> +        *
> +        * This needs to be done deferred to avoid self-deadlocks on systems
> +        * with nested onboard hubs.
> +        */
> +       INIT_WORK(&hub->attach_usb_driver_work, onboard_hub_attach_usb_driver);
> +       schedule_work(&hub->attach_usb_driver_work);

I'm sure that the above is totally necessary but it's been long enough
since I looked at this code last that I've totally forgotten why. Any
chance you could add comments to say under what situation
onboard_hub_remove() would have detached the USB driver? Is this
something where you unbind the platform driver and then bind it again?
...and why does that cause the driver to be detached?


> +/**
> + * onboard_hub_create_pdevs -- create platform devices for onboard USB hubs
> + * @parent_hub : parent hub to scan for connected onboard hubs
> + * @pdev_list  : list of onboard hub platform devices owned by the parent hub
> + *
> + * Creates a platform device for each supported onboard hub that is connected to
> + * the given parent hub. To keep track of the platform devices they are added to
> + * a list that is owned by the parent hub.

I'm ashamed to admit how long it took me to remember why exactly we
needed a platform device to begin with and why the normal USB devices
weren't enough (it's because we won't enumerate the USB devices until
we're powered and so the platform device is in charge of powering
things up). Finally I re-read the commit message and then it made
sense, but someone looking at the code later might not think to look
at the commit message for a while. Maybe remind people in the comments
for this function? Even if it's somewhere else in the code and I
missed it, I wouldn't mind a tiny blurb here.


> +void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *pdev_list)
> +{
> +       int i;
> +       struct usb_hcd *hcd = bus_to_hcd(parent_hub->bus);
> +       struct device_node *np, *npc;
> +       struct platform_device *pdev = NULL;
> +       struct pdev_list_entry *pdle;
> +
> +       if (!parent_hub->dev.of_node)
> +               return;
> +
> +       for (i = 1; i <= parent_hub->maxchild; i++) {
> +               np = usb_of_get_device_node(parent_hub, i);
> +               if (!np)
> +                       continue;
> +
> +               if (!of_is_onboard_usb_hub(np))
> +                       goto node_put;
> +
> +               npc = of_parse_phandle(np, "companion-hub", 0);
> +               if (npc) {
> +                       /*
> +                        * Hubs with companions share the same platform device.
> +                        * Create the plaform device only for the hub that is
> +                        * connected to the primary HCD (directly or through
> +                        * other hubs).
> +                        */
> +                       if (!usb_hcd_is_primary_hcd(hcd)) {
> +                               of_node_put(npc);
> +                               goto node_put;
> +                       }
> +
> +                       pdev = of_find_device_by_node(npc);
> +                       of_node_put(npc);
> +               } else {
> +                       /*
> +                        * For root hubs this function can be called multiple times
> +                        * for the same root hub node (the HCD node). Make sure only
> +                        * one platform device is created for this hub.
> +                        */
> +                       if (!parent_hub->parent && !usb_hcd_is_primary_hcd(hcd))
> +                               goto node_put;

I don't understand the "else" case above. What case exactly are we
handling again? This is when:
* the hub is presumably just a 2.0 hub since there is no companion.
* our parent is the root hub and the USB 2.0 hub we're looking at is
not the primary

...but that doesn't make a lot of sense to me? I must have missed something...

In general though, do we even need to look at the "companion-hub"
property? If this node matches an onboard USB hub and it's the primary
HCD then we want a platform dev. Otherwise we don't, right?

-Doug
