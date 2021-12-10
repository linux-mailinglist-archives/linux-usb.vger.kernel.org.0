Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54FDF470660
	for <lists+linux-usb@lfdr.de>; Fri, 10 Dec 2021 17:51:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234977AbhLJQyz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Dec 2021 11:54:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233093AbhLJQyz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Dec 2021 11:54:55 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31640C0617A1
        for <linux-usb@vger.kernel.org>; Fri, 10 Dec 2021 08:51:20 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id j11so8566582pgs.2
        for <linux-usb@vger.kernel.org>; Fri, 10 Dec 2021 08:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7WxCqvv4ObUVtEOab2u1wdUa6vtacHS/9P1D+Qu3Q4I=;
        b=Pz7q1yMrprNeLuXSehtn+mjl+OolYIRza+5Q+bVzL5P0PJkqAptjr+rq47XyVZ6A+2
         CWs4P9jqt34H45D18Jtu3XCmfnX3/fo2tC88wYLD7uyZLJ14trpEUFqQA68hzvjqcoS7
         TqoOyHlngnRLK9zeiwKDPaXGnvkrSkzAoejZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7WxCqvv4ObUVtEOab2u1wdUa6vtacHS/9P1D+Qu3Q4I=;
        b=imB/+/RLPjcybOjZJ2dcp4pxk0JgX5s1R3nR5jFBdycmIQB69SenqbHiU7C0IPIiDd
         URX7kMVhuD5v34eyNXfWybnabeNxs8AzJFv5ERWEh4KQDu4TJLZAqXTZpQ0dbQyeC+iT
         LaTjo1YYPHyZExDHjH6CitGS9USxAhRlvzVgwkI9UkRGlRGpWA1cXJCWcDt6CDVpb6VZ
         nNnVE1GYvDtoSkuAd/JrJsNG00CWLL+yWXjHtU5D7+Tf4tXGSjJ51u4oHXar9nPbqO0l
         tn9MerJFnxe9aTDTdQYqHTUvjKGkdlAYOFtm8RVXCDgaGhAH3ewga87WK2QGLiYC3mpl
         psNQ==
X-Gm-Message-State: AOAM5331CSa2FN9QfTLg+lr0FGQHPO8kP8qfK4OQwohbNJDtP/6dVNE8
        ArvDi1QEoGqxEKytD4kGxxQWfA==
X-Google-Smtp-Source: ABdhPJwrDkvAU1dIOXyjaCC1yzNcBxHY1hnaRtjYvmiv1zAZE1OYcWlBpJH14W2wnL+jMKjPtDtXcA==
X-Received: by 2002:a63:135a:: with SMTP id 26mr40251046pgt.87.1639155079759;
        Fri, 10 Dec 2021 08:51:19 -0800 (PST)
Received: from localhost ([2620:15c:202:201:d386:8bb1:aaa7:a294])
        by smtp.gmail.com with UTF8SMTPSA id l9sm4030038pfu.55.2021.12.10.08.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Dec 2021 08:51:19 -0800 (PST)
Date:   Fri, 10 Dec 2021 08:51:17 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Roger Quadros <rogerq@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Bastien Nocera <hadess@hadess.net>
Subject: Re: [PATCH v17 1/7] usb: misc: Add onboard_usb_hub driver
Message-ID: <YbOFhcICfrbl6bZV@google.com>
References: <20211116200739.924401-1-mka@chromium.org>
 <20211116120642.v17.1.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
 <CAD=FV=VnRQzvgjVzTNgx5kaC6VDvFGvTx2njtdTo27LW1zxWJA@mail.gmail.com>
 <YZaS3NpfUqqg4L+v@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YZaS3NpfUqqg4L+v@google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 18, 2021 at 09:52:28AM -0800, Matthias Kaehlcke wrote:
> On Wed, Nov 17, 2021 at 04:11:34PM -0800, Doug Anderson wrote:
> > Hi,
> > 
> > On Tue, Nov 16, 2021 at 12:07 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> > >
> > > --- a/drivers/usb/misc/Kconfig
> > > +++ b/drivers/usb/misc/Kconfig
> > > @@ -284,3 +284,20 @@ config BRCM_USB_PINMAP
> > >           This option enables support for remapping some USB external
> > >           signals, which are typically on dedicated pins on the chip,
> > >           to any gpio.
> > > +
> > > +config USB_ONBOARD_HUB
> > > +       tristate "Onboard USB hub support"
> > 
> > Aren't you back to shenanigans now that you're being called straight
> > from the USB core? What if you're a module and the USB core is
> > builtin? It can't call you, right? ...or what if you're builtin but
> > the USB core is a module (yeah, I know that sounds insane but I don't
> > think anything technically prevents it)?
> 
> Indeed, a dependency involving USB host mode is needed, as previously
> with xhci_plat.
> 
> > Can you just add a dependency here such that if the USB core is a
> > module that you're a module and if the USB core is builtin that you're
> > builtin?
> 
> I couldn't find a way to specify that in the config options of the driver
> itself. I fear the dependency has to be specified in CONFIG_USB, like it
> was done previously with USB_XHCI_PLATFORM:
> 
> https://patchwork.kernel.org/project/linux-usb/patch/20210813125146.v16.6.I7a3a7d9d2126c34079b1cab87aa0b2ec3030f9b7@changeid/
> 
> Hope that isn't controversial.

Ugh, actually adding

  depends on USB_ONBOARD_HUB || !USB_ONBOARD_HUB

to CONFIG_USB does not work. The problem is that USB_ONBOARD_HUB depends on
CONFIG_USB (not through an explicit dependency, but the 'misc' directory it
resides in is only included when CONFIG_USB=y/m), so the above rule would
introduce a circular dependency.

Unless there is some other way to specify "don't allow building
USB_ONBOARD_HUB as a module, unless USB is a module" I fear USB_ONBOARD_HUB
must be bool, which isn't really great :(
