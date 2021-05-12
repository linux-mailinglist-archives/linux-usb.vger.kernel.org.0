Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6A0A37EF3B
	for <lists+linux-usb@lfdr.de>; Thu, 13 May 2021 01:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236666AbhELXAL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 May 2021 19:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349177AbhELWam (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 May 2021 18:30:42 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41354C06138E
        for <linux-usb@vger.kernel.org>; Wed, 12 May 2021 15:28:16 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id v6so31567784ljj.5
        for <linux-usb@vger.kernel.org>; Wed, 12 May 2021 15:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zpuSVjKnd4Q/JUCBr5MA4TroaNsMxpRZib7L8EDA+Do=;
        b=oEgvr7s+UdFc5aoOn13VA2zxM4ckiXTEvq4SxAi15WwW8XAawCwo2F81HFAUqmfQ93
         Fyv5yrqModgAxJPHlwPJd5iTXR/oKCO2VBedmEZzz7ul7Ng4AlBauS7aRhvCzJS8XLSz
         zJRmETN9JJW6EcmPLqxFJRE0+6NKjkMQ/pQ/bZF77oZs7/zG+baxLHGjoTX8wBPfYBtD
         WSsgnlKfxaYV43ZV4uVv345w6yLHWVzMrNJU7+wxxeDub9R+Dv9bRm79EbrWc+Gvtxnk
         QSjtOXgPw7Llf6aBD8rcpwurQ9oUgU0YnWlyYT5/JoDqycE4zwsTxDAIi6t4tL00yMIX
         4BSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zpuSVjKnd4Q/JUCBr5MA4TroaNsMxpRZib7L8EDA+Do=;
        b=dehqrr7W9B/sAs3IHqJKmoJJ4XQn1Jyd9vCDHYC1K6huVbi2yV6qzOIqQBr070YRSB
         V6wrMoI5KleAvpf7L6gpEB5V+6rgSzu+RN1ZiDZyHxJ0KQZU0X0TxONSAa2douUx2SWb
         wu0G0cFJ9RKJlcSwEiW2d+BzdBSV+eQIj72LfrlxPT+NKCu29rI6QysUwaZli8ZMJETb
         NFwch786CGQqWmKxA6aqaRCnyLeFwJdQqenqW80LKxN305Ei2pIHALy2P81VG6q6z8fH
         ldXytv5tynN+duRu+3GZ/EeeE2YXy7ZJoHdzMFoSu5rQ9YAho5535zY37CAPQsgxkUgH
         NmKA==
X-Gm-Message-State: AOAM533Npdk1+Ty8xy2t8zqejl7zQqnjQs1y0CQX15LmF7GoxU8IBMcq
        nXSDpcXKNODDzjP3zTM8OQNjx9vTED7vnIz1VHFusw==
X-Google-Smtp-Source: ABdhPJz8pT0IMA22SKNig3Imu57ETWyjItTI6v9mz/D5pYMjfujrj/HOhm7ZYzUcA/DVXAEiT+g37AWxBXRJtHia+p0=
X-Received: by 2002:a2e:9787:: with SMTP id y7mr30698250lji.65.1620858494395;
 Wed, 12 May 2021 15:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210424021631.1972022-1-rajatja@google.com> <20210512010049.GA89346@rocinante.localdomain>
 <CAA93t1ohAFM1U2xTvbd1J1dUCaZwh6GYNGib_AM0J7+qHwSf1A@mail.gmail.com>
In-Reply-To: <CAA93t1ohAFM1U2xTvbd1J1dUCaZwh6GYNGib_AM0J7+qHwSf1A@mail.gmail.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Wed, 12 May 2021 15:27:38 -0700
Message-ID: <CACK8Z6HuKqgYQZGJZGQGr5FC96naV+1yXZuwYTy5Ydb5=k40KA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] driver core: Move the "removable" attribute from
 USB to core
To:     Rajat Jain <rajatxjain@gmail.com>
Cc:     =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        "open list:ULTRA-WIDEBAND (UWB) SUBSYSTEM:" 
        <linux-usb@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
        Jesse Barnes <jsbarnes@google.com>,
        Dmitry Torokhov <dtor@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Posted a v3 of this patch here:
https://lore.kernel.org/patchwork/patch/1428133/

On Tue, May 11, 2021 at 6:21 PM Rajat Jain <rajatxjain@gmail.com> wrote:
>
> Hi Krzysztof,
>
> Thanks a lot for your comments. Please see inline.
>
> On Tue, May 11, 2021 at 6:00 PM Krzysztof Wilczy=C5=84ski <kw@linux.com> =
wrote:
> >
> > Hi Rajat,
> >
> > I have few questions below, but to add in advance, I might be confusing
> > the role that "type->supports_removable" and "dev->removable" plays
> > here, and if so then I apologise.
> >
> > [...]
> > > @@ -2504,8 +2523,16 @@ static int device_add_attrs(struct device *dev=
)
> > >                       goto err_remove_dev_online;
> > >       }
> > >
> > > +     if (type && type->supports_removable) {
> > > +             error =3D device_create_file(dev, &dev_attr_removable);
> > > +             if (error)
> > > +                     goto err_remove_dev_waiting_for_supplier;
> > > +     }
> > > +
> > >       return 0;
> >
> > Would a check for "dev->removable =3D=3D DEVICE_REMOVABLE" here be more
> > appropriate?
> >
> > Unless you wanted to add sysfs objects when the device hints that it ha=
s
> > a notion of being removable even though it might be set to "unknown" or
> > "fixed" (if that state is at all possible then), and in which case usin=
g
> > the dev_is_removable() helper would also not be an option since it does
> > a more complex check internally.
> >
> > Technically, you could always add this sysfs object (similarly to what
> > USB core did) as it would then show the correct state depending on
> > "dev->removable".
> >
> > Also, I suppose, it's not possible for a device to have
> > "supports_removable" set to true, but "removable" would be different
> > than "DEVICE_REMOVABLE", correct?
>
> No, that is not true.
>
> device_type->supports_removable=3D1 indicates that the bus / subsystem
> is capable of differentiating between removable and fixed devices.
> It's essentially describing a capability of the bus / subsystem. This
> flag needs to be true for a subsystem for any it's devices'
> dev->removable field to be considered meaningful.
>
> OTOH, the dev->removable =3D> indicates the location of the device IF
> device_type->supports location is true. Yes, it can be fixed /
> removable / unknown (whatever the bus decides) if the
> device_type->supports_location is true.
>
> One of my primary considerations was also that the existing UAPI for
> the USB's "removable" attribute shouldn't be changed. Currently, it
> exists for all USB devices, so I think the current code / check is OK.
>
> >
> > [...]
> > > +enum device_removable {
> > > +     DEVICE_REMOVABLE_UNKNOWN =3D 0,
> > > +     DEVICE_REMOVABLE,
> > > +     DEVICE_FIXED,
> > > +};
> >
> > I know this was moved from the USB core, but I personally find it
> > a little bit awkward to read, would something like that be acceptable?
> >
> > enum device_removable {
> >         DEVICE_STATE_UNKNOWN =3D 0,
> >         DEVICE_STATE_REMOVABLE,
> >         DEVICE_STATE_FIXED,
> > };
> >
> > The addition of state to the name follows the removable_show() function
> > where the local variable is called "state", and I think it makes sense
> > to call this as such.  What do you think?
>
> I think I made a mistake by using the "state" as the local variable
> there. I will change it to "location". I'm happy to change the enums
> above to DEVICE_LOCATION_REMOVABLE* etc if there is a wider consensus
> on this. IMHO, the current shorter one also looks OK.
>
> >
> > > +static inline bool dev_is_removable(struct device *dev)
> > > +{
> > > +     return dev && dev->type && dev->type->supports_removable
> > > +         && dev->removable =3D=3D DEVICE_REMOVABLE;
> > > +}
> >
> > Similarly to my question about - would a simple check to see if
> > "dev->removable" is set to "DEVICE_REMOVABLE" here be enough?
>
> No, as I mentioned above, the dev->removable field should be
> considered meaningful only if device_type->supports_location is true.
> So the check for supports_removable is needed here.
>
> Please feel free to send me more thoughts.
>
> Thanks & Best Regards,
>
> Rajat
>
>
> >
> > Krzysztof
