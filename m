Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E567155CCD3
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 15:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240978AbiF0TyG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jun 2022 15:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240830AbiF0Twg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jun 2022 15:52:36 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A67D1BEA0
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 12:52:35 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id z14so10099661pgh.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 12:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V4N/XV5AG1JF/lcVRWXIaUHhwjacSgO9qHu9c0dDYvM=;
        b=RKUQgJa4N6T5aUYk2eRSPtiYKkt4OQaSH3CHrSTJywIzBp27kfOgRHJp3pJ6oMTFIZ
         Hm3r1CfDdc8/+Utg6uH/ev/5VprIVzOMjsaRLKNscDiOdP0zLW1sTWNaLQ3viwHwxotc
         waNOHJIcCgfXrKJFz1L0k625xp4VHe4zk5ePU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V4N/XV5AG1JF/lcVRWXIaUHhwjacSgO9qHu9c0dDYvM=;
        b=v0T9kRZuavJVOpZlXH3j6lEd/QBXHvbVsRYXI01Sc6MYK6kqyQmr+kYGSsXrkidJCC
         GGMh7oALH75OOswLtUBhKY3lOrKZFrkUWqQwdW6CQLkDF+wSY1kIPr0df7g5Igmfp5mZ
         yJcawLp/5qjXjXz+/EhIiJFln0V2R5P3fIB66P5CeBpDLTUH25sJUCLAv+PryF1xoUXS
         ygojYx0jbgfRa8ZD3ZJU59pqP93SY+15rYL9vwcOALtYFChuMPOogD1d4IcbpYUmLzHt
         9FZBa8zDac28kK7S2PEGakDwbJW7D8renjpTlTjLehsTg425EP28jG7RCL1DDOEzFP8d
         +xGQ==
X-Gm-Message-State: AJIora/XvMmDgh4LpTMc6XdE3TwwAbmD0hUu5uRlKT+DxxPsZKZ2ZaiZ
        scXa6qYm0b8V86Rz2npattWBhQ==
X-Google-Smtp-Source: AGRyM1tfDJfj4YCkJqulZUOD5NK4Iy0AK2/wWZXQp3uFpG2Uznur+44u8Osde3vtvY4gJXtZeq/R5w==
X-Received: by 2002:a63:9d88:0:b0:40c:9c4d:29ba with SMTP id i130-20020a639d88000000b0040c9c4d29bamr14564388pgd.590.1656359554584;
        Mon, 27 Jun 2022 12:52:34 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:f31c:687c:3a61:62c5])
        by smtp.gmail.com with UTF8SMTPSA id e4-20020a17090301c400b0016a11750b50sm7736419plh.16.2022.06.27.12.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 12:52:34 -0700 (PDT)
Date:   Mon, 27 Jun 2022 12:52:32 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Bastien Nocera <hadess@hadess.net>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Roger Quadros <rogerq@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Peter Chen <peter.chen@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Subject: Re: [PATCH v23 2/3] usb: misc: Add onboard_usb_hub driver
Message-ID: <YroKgNPY4YHh0kGf@google.com>
References: <20220622214931.1914770-1-mka@chromium.org>
 <20220622144857.v23.2.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
 <CAD=FV=XHnRNQQo8i95ROiZPOGqAD_=FfU0uzy83Vigb+Xsr4XQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=XHnRNQQo8i95ROiZPOGqAD_=FfU0uzy83Vigb+Xsr4XQ@mail.gmail.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 24, 2022 at 01:33:25PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jun 22, 2022 at 2:49 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> > index 4c5ddbd75b7e..7fd40183a395 100644
> > --- a/drivers/usb/misc/Kconfig
> > +++ b/drivers/usb/misc/Kconfig
> > @@ -295,3 +295,19 @@ config BRCM_USB_PINMAP
> >           This option enables support for remapping some USB external
> >           signals, which are typically on dedicated pins on the chip,
> >           to any gpio.
> > +
> > +config USB_ONBOARD_HUB
> > +       bool "Onboard USB hub support"
> 
> The above needs to be "tristate", not bool.

right, thanks!

> Weirdly the way you have it if you set "CONFIG_USB=m" and
> "CONFIG_USB_ONBOARD_HUB=y" you don't get any compile errors, but also
> the onboard usb hub doesn't even get compiled (!). Once you switch to
> tristate then setting "CONFIG_USB=m" will force the onboard hub to be
> a module too (since it's underneath the "if" in the Kconfig).
> 
> ...ugh, but once you do that then you start getting compile errors if
> you have "CONFIG_USB=y" and "CONFIG_USB_ONBOARD_HUB=m". I guess that
> can be fixed with something like this
> 
> -usbcore-$(CONFIG_USB_ONBOARD_HUB)      += ../misc/onboard_usb_hub_pdevs.o
> +ifdef CONFIG_USB_ONBOARD_HUB
> +usbcore-y                      += ../misc/onboard_usb_hub_pdevs.o
> +endif

Thanks for testing and the suggestion!

> Given the problems we've had in the past, please make sure you test
> with all combinations of "=y" and "=m" for CONFIG_USB and
> CONFIG_USB_ONBOARD_HUB. Note that on sc7180-trogdor devices if you
> want CONFIG_USB to be a module don't forget to also set
> CONFIG_USB_DWC3=m or DWC3 will force you to gadget mode...

ack

I think I did an 'allmodconfig' build only test, but that didn't really help
in this case ...

> > +/**
> > + * onboard_hub_create_pdevs -- create platform devices for onboard USB hubs
> > + * @parent_hub : parent hub to scan for connected onboard hubs
> > + * @pdev_list  : list of onboard hub platform devices owned by the parent hub
> > + *
> > + * Creates a platform device for each supported onboard hub that is connected to
> > + * the given parent hub. The platform device is in charge of initializing the
> > + * hub (enable regulators, take the hub out of reset, ...) and can optionally
> > + * control whether the hub remains powered during system suspend or not.
> > +
> > + * To keep track of the platform devices they are added to
> > + * a list that is owned by the parent hub.
> 
> super nitty, but the above two lines of comment could be word-wrapped better.

Sure, I probably rephrased that at some point and forgot to re-wrap.

> > + */
> > +void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *pdev_list)
> > +{
> > +       int i;
> > +       struct usb_hcd *hcd = bus_to_hcd(parent_hub->bus);
> 
> As per my response on v22, would you be willing to rename that to
> "parent_hcd"? I'll probably still confuse myself next time I read this
> function, but at least maybe this will help me recognize more quickly
> that this isn't necessarily the child's hcd in the case of the root
> hub.

See my reply on v22, I think 'parent_hcd' could still be confusing and it
might be best to have a more detailed description of the problem. In any
case I'm open to discuss it :)
