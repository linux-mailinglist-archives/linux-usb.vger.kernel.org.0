Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9162C4B7691
	for <lists+linux-usb@lfdr.de>; Tue, 15 Feb 2022 21:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242910AbiBOSKF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Feb 2022 13:10:05 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242898AbiBOSKA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Feb 2022 13:10:00 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD6CA11942F
        for <linux-usb@vger.kernel.org>; Tue, 15 Feb 2022 10:09:49 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id b35so18052764qkp.6
        for <linux-usb@vger.kernel.org>; Tue, 15 Feb 2022 10:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vHlV/LtgGXNiZ7zK5zIyGJOfGAkSpkjLSX123D9TpgA=;
        b=lZlLqVCF5x50Bw2WI0EmXhOEjbmCR23f3VzzrlMJALYbhC7MgI5zF3t2kRSeFNXgm/
         rDDMLTaPP0dhqmJLiYSNIqgNUUb+sVxvFZnMVM65kctrFrm+2wfIdNizm8DuNZ7Ndxu9
         +T0TtFxp1mv9GBEgCqd/+joe9Uwyn5DSCKRbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vHlV/LtgGXNiZ7zK5zIyGJOfGAkSpkjLSX123D9TpgA=;
        b=KOwVCd04AbbDNganLfSiPCrMq3vUUpLrhdbrzgB2u41is6gGkcJKcWHJrb0q3MmKFQ
         98fS0aAKS94JVI58yUXvgDH93VyGE+fKTjeg+wax7KVsXtQclVEpdNYPaD0iWLOiYIaD
         lVc29KyzOC88fXVttMT0uUDYnvE0n2KwG+wxCKsC6AOCprSR8UtJuMSPOdrQHL4odD6k
         fdM6NWgS8KfMD4evb3aDNvNbLwpPUWyqfqayefApOt7TOwdLKH39oDMUo5T7wZw6ApQB
         ZfLFIR6Aqp8+Z+BirP6C0Wl7rscU6K8B6JhL0Esfe6yOoYo+Xm7qS6SC+B5pSFxBZ8Dy
         3b9A==
X-Gm-Message-State: AOAM533E+ZfeumaJNcyTdPFKAKvFUgYAkW34o87A4LFfnZGHviys3KIa
        t7glFmKUHzgT2iXIPxYV0Q99jHQK4uZV5g==
X-Google-Smtp-Source: ABdhPJwOtFY3pBFhAAZ+zJKmgFLC6TK8a/+kr+5XMtvLCsXJue0mLWoAGTjD7hXZkM1rEZRg9gkOZw==
X-Received: by 2002:a37:aac7:: with SMTP id t190mr117526qke.391.1644948588231;
        Tue, 15 Feb 2022 10:09:48 -0800 (PST)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id d23sm545690qka.50.2022.02.15.10.09.47
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 10:09:48 -0800 (PST)
Received: by mail-qt1-f175.google.com with SMTP id r14so19373198qtt.5
        for <linux-usb@vger.kernel.org>; Tue, 15 Feb 2022 10:09:47 -0800 (PST)
X-Received: by 2002:a05:6638:4810:: with SMTP id cp16mr51427jab.207.1644948168679;
 Tue, 15 Feb 2022 10:02:48 -0800 (PST)
MIME-Version: 1.0
References: <20220119204345.3769662-1-mka@chromium.org> <20220119124327.v20.3.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
 <YgJMX0QK9Koyu/uv@kroah.com> <YgLB0/aJJvGm3oYR@google.com>
In-Reply-To: <YgLB0/aJJvGm3oYR@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 15 Feb 2022 10:02:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VJmb_P9Rnn0ooNAkf3ese-BEWZr8z-Vc0RMdF=gHmNvw@mail.gmail.com>
Message-ID: <CAD=FV=VJmb_P9Rnn0ooNAkf3ese-BEWZr8z-Vc0RMdF=gHmNvw@mail.gmail.com>
Subject: Re: [PATCH v20 3/5] usb: misc: Add onboard_usb_hub driver
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Peter Chen <peter.chen@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Roger Quadros <rogerq@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, Feb 8, 2022 at 11:17 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> > > +/*
> > > + * Returns the onboard_hub platform device that is associated with the USB
> > > + * device passed as parameter.
> > > + */
> > > +static struct onboard_hub *_find_onboard_hub(struct device *dev)
> > > +{
> > > +   struct platform_device *pdev;
> > > +   struct device_node *np;
> > > +   struct onboard_hub *hub;
> > > +
> > > +   pdev = of_find_device_by_node(dev->of_node);
> > > +   if (!pdev) {
> > > +           np = of_parse_phandle(dev->of_node, "companion-hub", 0);
> > > +           if (!np) {
> > > +                   dev_err(dev, "failed to find device node for companion hub\n");
> > > +                   return ERR_PTR(-EINVAL);
> > > +           }
> > > +
> > > +           pdev = of_find_device_by_node(np);
> > > +           of_node_put(np);
> > > +
> > > +           if (!pdev || !device_is_bound(&pdev->dev)) {
> >
> > I don't understand why you need to call device_is_bound() here.  What
> > are you wanting to find here?
>
> Whether the platform driver actually probed.
>
> > You found the hub device associated to this usb device, based on the
> > of_find_device_by_node() call, so why check it again?  What could have
> > happened that this isn't the correct device?
>
> It is the correct platform device, however it might not have finished
> probing (this function is called from the USB driver). It's an unlikely
> case, but it might happen, especially if the bootloader left the hub
> regulator enabled (otherwise it would only be enabled by the platform
> driver).
>
> If device_is_bound() is a no-go (as it seems) the function could check
> the drvdata instead.

So IMO the answer here is to send a v21:

1. Switch to use drvdata just to you can avoid the controversial
device_is_bound() export.

2. Add a comment here explaining _why_ you are checking the drvdata
and return -EPROBE_DEFER. In general if it's confusing to someone
during a code review it will be confusing to someone later and so
deserves a comment. Something along the lines of: "Just to be
paranoid, we check that the drvdata is set which indicates that the
platform driver has finished probing. This handles the case where
(conceivably) we could be running at the exact same time as the
platform driver's probe. If we detect the race we request probe
deferral and we'll come back and try again."


> > > +   err = onboard_hub_add_usbdev(hub, udev);
> > > +   if (err)
> > > +           return err;
> > > +
> > > +   err = sysfs_create_link(&udev->dev.kobj, &hub->dev->kobj, "onboard_hub_dev");
> >
> > What is this link for?  Messing with sysfs links is a pain and drivers
> > really shouldn't be doing them if at all possible.
>
> Alan asked me to add them. It's not strictly needed. I'm fine with removing
> them as long as there is no strong opposition to that :)

I don't personally care either way. I'd say remove them and they can
be added back later?


> > > +   if (err)
> > > +           dev_warn(&udev->dev, "failed to create symlink to platform device '%s'): %d\n",
> > > +                    dev_name(hub->dev), err);
> > > +
> > > +   return 0;
> >
> > So you ignore the error?  That's fine, just odd.
>
> Yes, the links aren't critical for the functioning of the driver.

If you keep the links in, this is another good place for a comment,
even something as simple as what you just said above about the links
not being critical for the driver to function.

-Doug
