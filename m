Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0ED022C32A
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 12:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgGXKc6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 06:32:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbgGXKc5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 06:32:57 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81983C0619D3
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2020 03:32:57 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id o1so4229815plk.1
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2020 03:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uQRNSX6GKTYP9+OqNYvAFOFw8R2HlA03YvI30+NZRTQ=;
        b=ltTBe/LDBT+g8E7tj4vmkg+HBjA7iQ3EqcW53+IkbleyZqXLQyjP2RCHxibqRwUIyD
         Xr5+vCHVdBn4eebYABvTHjo3KbXs9oSp2pJBoOPbB6vhl8eey2ZN2uS5V1QSrH9HbhSO
         EC/7r06xE8hhj7IcT10MfYQItM9Z9wIFHF4R7KN7WrdM+8BsMKjB3Nn+L/qhK/nGe3We
         6ixRDISg0k67q+t0Nnv5/uD7/yvop60csdXYLaBzwMHlS8ilBchzgQilb3cycpUbDBUJ
         snR2+L16INOi/wtnexkduirvvhLJjiGvS1GQMdHSwtUiM7o/IH66RO4QWnDBv7a1xsFN
         PZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uQRNSX6GKTYP9+OqNYvAFOFw8R2HlA03YvI30+NZRTQ=;
        b=L5IuzSyrIPf/HtoqwskqJk1EMkIe+wfTnxrzEf135XY6lg4643PQntqUsPliidJpQA
         ii4MjnEKnQhnlfBDLpbWGWoggVL1HyVIXHNXtypDPM0ybC1Ms+nvBhv5Fbu8RvVDd5C7
         IwmcC+aoLwNcoPg0PYe9rEflhU6/+LqAunBC9wDXlm5fuPhht709nU1ry9Ta9RYBOXu1
         Jft1tbP0KyyIwh7c6vx1X75c9UTam3acp638t3wv3ipfnJ2ip1dbyLz0RYaWR5reTLfg
         HHSIvJVyvTh8X59MX22RGKV4mZRfAY/1Jj5IrEQ9mtB2K42DGr3GCapqzRq3wwjGrWs6
         5ebw==
X-Gm-Message-State: AOAM531hO8dx9++4aqtIIVVAeVR0J1MHwOpjONWAOT7BDuNqIbt2ZKtI
        nipI1hSF5lsu9VkPGpz80+PLAzAJ+Bwf6XPG+MNtVisNq/Y=
X-Google-Smtp-Source: ABdhPJyqrj3ojxgXzqneekoGAgshvEjC0ULDuGkE9NiXNEgYYTd3emPTXPCcUWV5rTgFrpARu1gruHmAV4OjnytdHqY=
X-Received: by 2002:a17:902:b098:: with SMTP id p24mr7844076plr.18.1595586776837;
 Fri, 24 Jul 2020 03:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <ee32a093d43fe6631617c203ea7c86cb700ceac5.camel@hadess.net>
In-Reply-To: <ee32a093d43fe6631617c203ea7c86cb700ceac5.camel@hadess.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 24 Jul 2020 13:32:40 +0300
Message-ID: <CAHp75VeKY0FSdfza0E9Fz8=2dCyPXwPZYE0kjywiRQAsvmbiow@mail.gmail.com>
Subject: Re: [PATCH v4] USB: Fix device driver race
To:     Bastien Nocera <hadess@hadess.net>
Cc:     USB <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 24, 2020 at 12:03 PM Bastien Nocera <hadess@hadess.net> wrote:
>
> When a new device with a specialised device driver is plugged in, the
> new driver will be modprobe()'d but the driver core will attach the
> "generic" driver to the device.
>
> After that, nothing will trigger a reprobe when the modprobe()'d device
> driver has finished initialising, as the device has the "generic"
> driver attached to it.
>
> Trigger a reprobe ourselves when new specialised drivers get registered.

...

> +static int __usb_bus_reprobe_drivers(struct device *dev, void *data)
> +{
> +       struct usb_device_driver *new_udriver = data;
> +       struct usb_device_driver *udriver;
> +       struct usb_device *udev;
> +
> +       if (!dev->driver)
> +               return 0;
> +
> +       udriver = to_usb_device_driver(dev->driver);
> +       if (udriver != &usb_generic_driver)
> +               return 0;

What about

static bool is_dev_usb_generic_driver(dev)
{
      struct usb_device_driver *udd = dev->driver ?
to_usb_device_driver(dev->driver) : NULL;

      return udd == &usb_generic_driver;
}

  if (!is_dev_usb_generic_driver)
    return 0;

?

> +       udev = to_usb_device(dev);
> +       if (usb_device_match_id(udev, new_udriver->id_table) != NULL ||
> +           (new_udriver->match && new_udriver->match(udev) == 0))
> +               device_reprobe(dev);
> +
> +       return 0;

What about

     udev = to_usb_device(dev);
     if (usb_device_match_id(udev, new_udriver->id_table) == NULL)
       return 0;
?

  if (new_udriver->match && new_udriver->match(udev) == 0))
               device_reprobe(dev);
    return 0;

> +}

...

> +               /* Check whether any device could be better served with
> +                * this new driver
> +                */

Comment style?

...

> +               if (new_udriver->match || new_udriver->id_table)

But match check is incorporated in the loop function.

> +                       bus_for_each_dev(&usb_bus_type, NULL, new_udriver,
> +                                        __usb_bus_reprobe_drivers);

-- 
With Best Regards,
Andy Shevchenko
