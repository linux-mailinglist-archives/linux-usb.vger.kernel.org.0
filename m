Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E17841D295
	for <lists+linux-usb@lfdr.de>; Thu, 30 Sep 2021 06:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348037AbhI3FBU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Sep 2021 01:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbhI3FBT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Sep 2021 01:01:19 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84FBAC06161C
        for <linux-usb@vger.kernel.org>; Wed, 29 Sep 2021 21:59:37 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id b22so3142578pls.1
        for <linux-usb@vger.kernel.org>; Wed, 29 Sep 2021 21:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VTM9z+DcTeYF3hZgKWEu9ebVrBPYT2J8Mz8sj8erXZk=;
        b=PCpbwU/Blt/pbMA6NT2nm2SIqNzMnAtcLzxhxbtj3rTw2MHvXasv4KZ/zpwWPlZn7y
         xPWsxFGYK8u70vbz7XcbGiHpsKtrQjK346ig5ArayijRkOVR0ZSgmSdFgnxE9i5Sf9pW
         0deGfEYYnNhaWRDtv3KVBZBS8spTYrA43Nq9+AxcJVFP4EVbUPaWHgG3/ccF/i1QocQh
         Qw4w3IvzGqNsfXW9sLxObs8iR9rV/NKytwQ8uw+30BCP3sXi3JaL/1APxK4M9G1CofGl
         mDPEFjR6CHHEV+e1F5uOIa2vub/p77kBLKF9waZAxea7kzN/oqO6LWY664QZ4RAJnbzu
         9G/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VTM9z+DcTeYF3hZgKWEu9ebVrBPYT2J8Mz8sj8erXZk=;
        b=XYvIaj2lmDulI2EQOsu1gwfKsvGMhAhNZN0Kk52yFsz3cF4guojJXr0n0g/bqviys2
         rbKDjkXf+HBxM09kn+8pdWBfNu1fJa6uLdlgirR2i9OhUu7B2C8u3JGGlEy+GfPDw/+x
         kObUNtMEXQUorj6rJZ22ZLO9GbPuegCPfoLBhHeq4X0KS9VMdzx+Bf0UR7q4xAhSqqiC
         5j463hQEDUFoHvjEhwxsBLD/k4R1nigo9EGr3CwzATgqmst4rDDJK0N18s/YRF6v5uag
         GquNSwRUas1dALdaz4Kn5mbmhEF9kIUNLcDjhzqs+N0ogiO+2Tqf0FABQHoY2XnZfgUM
         84yg==
X-Gm-Message-State: AOAM530f5tnDc4kSds5n2/qpeoEROUkTX8h7r6Afz85dYesr+p0gQd/L
        1Qc3osOxG0+3H2HGYTSbs1wYUsH3cUw96gUNO6eTlQ==
X-Google-Smtp-Source: ABdhPJyybPbFqs+kvSA+EffRawV4Hj+ykPs983Fz8BFHzbiq+5hEn89iPiOxS6iB4aUV2nFWiaggHuioY3Gye2yZA4U=
X-Received: by 2002:a17:902:bd8d:b0:13a:8c8:a2b2 with SMTP id
 q13-20020a170902bd8d00b0013a08c8a2b2mr2377812pls.89.1632977976213; Wed, 29
 Sep 2021 21:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210930010511.3387967-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930010511.3387967-2-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930014229.GA447956@rowland.harvard.edu> <CAPcyv4iiEC3B2i81evZpLP+XHa8dLkfgWmrY7HocORwP8FMPZQ@mail.gmail.com>
 <f9b7cf97-0a14-1c80-12ab-23213ec2f4f2@linux.intel.com>
In-Reply-To: <f9b7cf97-0a14-1c80-12ab-23213ec2f4f2@linux.intel.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 29 Sep 2021 21:59:25 -0700
Message-ID: <CAPcyv4gDgQYf0ct_Xy32gQBcWhs6d2uL+wUq4pfzszDHcUHbwQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] driver core: Move the "authorized" attribute from
 USB/Thunderbolt to core
To:     "Kuppuswamy, Sathyanarayanan" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Borislav Petkov <bp@alien8.de>, X86 ML <x86@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jason Wang <jasowang@redhat.com>,
        Andi Kleen <ak@linux.intel.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PCI <linux-pci@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 29, 2021 at 7:39 PM Kuppuswamy, Sathyanarayanan
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>
>
>
> On 9/29/21 6:55 PM, Dan Williams wrote:
> >> Also, you ignored the usb_[de]authorize_interface() functions and
> >> their friends.
> > Ugh, yes.
>
> I did not change it because I am not sure about the interface vs device
> dependency.
>

This is was the rationale for has_probe_authorization flag. USB
performs authorization of child devices based on the authorization
state of the parent interface.

> I think following change should work.
>
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index f57b5a7a90ca..84969732d09c 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -334,7 +334,7 @@ static int usb_probe_interface(struct device *dev)
>         if (udev->dev.authorized == false) {
>                 dev_err(&intf->dev, "Device is not authorized for usage\n");
>                 return error;
> -       } else if (intf->authorized == 0) {
> +       } else if (intf->dev.authorized == 0) {

== false.

>                 dev_err(&intf->dev, "Interface %d is not authorized for usage\n",
>                                 intf->altsetting->desc.bInterfaceNumber);
>                 return error;
> @@ -546,7 +546,7 @@ int usb_driver_claim_interface(struct usb_driver *driver,
>                 return -EBUSY;
>
>         /* reject claim if interface is not authorized */
> -       if (!iface->authorized)
> +       if (!iface->dev.authorized)

I'd do == false to keep it consistent with other conversions.

>                 return -ENODEV;
>
>         dev->driver = &driver->drvwrap.driver;
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 47548ce1cfb1..ab3c8d1e4db9 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -1791,9 +1791,9 @@ void usb_deauthorize_interface(struct usb_interface *intf)
>
>         device_lock(dev->parent);
>
> -       if (intf->authorized) {
> +       if (intf->dev.authorized) {
>                 device_lock(dev);
> -               intf->authorized = 0;
> +               intf->dev.authorized = 0;

= false;

>                 device_unlock(dev);
>
>                 usb_forced_unbind_intf(intf);
> @@ -1811,9 +1811,9 @@ void usb_authorize_interface(struct usb_interface *intf)
>   {
>         struct device *dev = &intf->dev;
>
> -       if (!intf->authorized) {
> +       if (!intf->dev.authorized) {
>                 device_lock(dev);
> -               intf->authorized = 1; /* authorize interface */
> +               intf->dev.authorized = 1; /* authorize interface */

= true

...not sure that comment is worth preserving.
