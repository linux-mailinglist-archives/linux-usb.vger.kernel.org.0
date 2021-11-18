Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB657455183
	for <lists+linux-usb@lfdr.de>; Thu, 18 Nov 2021 01:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241825AbhKRAOw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Nov 2021 19:14:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240630AbhKRAOs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Nov 2021 19:14:48 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54B35C061570
        for <linux-usb@vger.kernel.org>; Wed, 17 Nov 2021 16:11:49 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id k21so5675638ioh.4
        for <linux-usb@vger.kernel.org>; Wed, 17 Nov 2021 16:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QQmfsxDLxgEs9nX9rSOSZBMe+yfw/Mx6HQKSmuKCC3g=;
        b=Kb4PcktbaPyqHZ2UQU1v+/ez0LRcLtjC2X24LD92/dndf9/61zXTJbtySx8bxMrfOr
         QEfS1D+TV8oOQvh1TYtPrsaYsZ9KleEl/UOfci3IoO4IBwoi9jbigV8L2Q6iVKRsuxZk
         7DXPA61QQTPLY2JG9ESVsQRExfu9E6FZac4VU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QQmfsxDLxgEs9nX9rSOSZBMe+yfw/Mx6HQKSmuKCC3g=;
        b=gRzYHMZbQQpTohUMJZIsNZ34peMp8V4d6D3bIg0W1jr0zA5lQgoNNIiv1aYAS5nH/i
         XABw9PMNxg1yY0Adro9M3gzS4jTxwzZdCMCUnwBkYz3xufDckIJeUbRi6bdaGcSnCwtZ
         Izwf18q5yMAegg0vbS6pJT/m8+GFTezsWtByRIHsgcFy6JSapLZ/cpLmpDBBrmgWfWD8
         dOr/Aqj96bYFxXMn23oLR19udtR8VD+iHw5ZdSsNQr8dlguw9HzG6cjCMO/oset9nHfW
         /3qFuaqatRkfaWMfXm95P9L/0aIaAIOxAM+RRvYe4nB+LASbkBNKMb0YdBMnLhqsvX7S
         Z0jQ==
X-Gm-Message-State: AOAM530dDe2zu7tPwqSo7gRnol6QKHJjaxqbAUSDvXMSxZwHptCxZHEn
        xuyBVL2pGpV1RL/Ogfqbe0zUkFnGshbTGg==
X-Google-Smtp-Source: ABdhPJxznYw8k+o6tERatZMJCKZM7/8MCLLyMVAyikTuDapAL1em1NAZKCS4Eu95kwLaj6bbnVG0RQ==
X-Received: by 2002:a5d:87d4:: with SMTP id q20mr14741591ios.190.1637194308494;
        Wed, 17 Nov 2021 16:11:48 -0800 (PST)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id c2sm829472ilr.70.2021.11.17.16.11.47
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 16:11:47 -0800 (PST)
Received: by mail-io1-f52.google.com with SMTP id y16so5646372ioc.8
        for <linux-usb@vger.kernel.org>; Wed, 17 Nov 2021 16:11:47 -0800 (PST)
X-Received: by 2002:a6b:440f:: with SMTP id r15mr14131151ioa.128.1637194307041;
 Wed, 17 Nov 2021 16:11:47 -0800 (PST)
MIME-Version: 1.0
References: <20211116200739.924401-1-mka@chromium.org> <20211116120642.v17.1.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
In-Reply-To: <20211116120642.v17.1.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 17 Nov 2021 16:11:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VnRQzvgjVzTNgx5kaC6VDvFGvTx2njtdTo27LW1zxWJA@mail.gmail.com>
Message-ID: <CAD=FV=VnRQzvgjVzTNgx5kaC6VDvFGvTx2njtdTo27LW1zxWJA@mail.gmail.com>
Subject: Re: [PATCH v17 1/7] usb: misc: Add onboard_usb_hub driver
To:     Matthias Kaehlcke <mka@chromium.org>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, Nov 16, 2021 at 12:07 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> --- a/drivers/usb/misc/Kconfig
> +++ b/drivers/usb/misc/Kconfig
> @@ -284,3 +284,20 @@ config BRCM_USB_PINMAP
>           This option enables support for remapping some USB external
>           signals, which are typically on dedicated pins on the chip,
>           to any gpio.
> +
> +config USB_ONBOARD_HUB
> +       tristate "Onboard USB hub support"

Aren't you back to shenanigans now that you're being called straight
from the USB core? What if you're a module and the USB core is
builtin? It can't call you, right? ...or what if you're builtin but
the USB core is a module (yeah, I know that sounds insane but I don't
think anything technically prevents it)?

Can you just add a dependency here such that if the USB core is a
module that you're a module and if the USB core is builtin that you're
builtin?


> +void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *pdev_list)
> +{
> +       int i;
> +       struct device_node *np, *npc;
> +       struct platform_device *pdev;
> +       struct pdev_list_entry *pdle;
> +
> +       INIT_LIST_HEAD(pdev_list);
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
> +               if (!npc)
> +                       goto create_pdev;
> +
> +               pdev = of_find_device_by_node(npc);
> +               of_node_put(npc);
> +
> +               if (pdev) {
> +                       /* the companion hub already has a platform device, nothing to do here */
> +                       put_device(&pdev->dev);
> +                       goto node_put;
> +               }
> +
> +create_pdev:

I don't really like this "goto". I'd rather just use an "if" test for
the few lines even if the indentation gets to be a bit much.

-Doug
