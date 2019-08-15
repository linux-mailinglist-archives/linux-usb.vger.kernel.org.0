Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A37BB8E1AA
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 02:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728464AbfHOAIT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Aug 2019 20:08:19 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36689 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbfHOAIT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Aug 2019 20:08:19 -0400
Received: by mail-ot1-f66.google.com with SMTP id k18so2317107otr.3
        for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2019 17:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uGI92pBT4wjU7CSUDxKnDPZXXoJ9HToSaovQyHjBUqw=;
        b=OKJCAs9QM3AQySC5VmY3lRiFA5MWMAETr0ugV15cv4Aprd1TPNnyqWUFW/SPkg3XAb
         dG4SQnLnLNpeNVv6OF8pNrI+Ii/HuXLS1SnSi0j/YJHHrskBUP+DLQGZiU4IXcS9EuAZ
         uODfEMLKiHgJekyiQYhN4lNqH24O0XFze7YEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uGI92pBT4wjU7CSUDxKnDPZXXoJ9HToSaovQyHjBUqw=;
        b=ieRIuI4VOkHtDEyRhH87x2rSKwcmwcWsThBMUbgpLnLU3eYPQImf+oIdYbqIGSiVaU
         g0KwN4M3mrMRxruj2g44PZwq6onqx/+rbsIhb/DXa4JSk9AUw/a++mdP6JD1m/28DLNU
         z/ek9JvEu1jI6kOUmWigp/rRo25mWXNg9r+gyGazwFmC6S6UQmqaY5BjaJ/v8YXAxzqs
         qy+IwterqV9OhcdNZD+W5st16RWjL7W8YZUDiQVn4n7gGwxCBJil2hZBMr1EB8Fj7Dl3
         FZCSdqRebzEHVRe1IL6ihREtgqj6T/+H5srHjHsPnW2GK6RQ9ZMEDm8sJLWuRYgb0+Wc
         6YFw==
X-Gm-Message-State: APjAAAUezzBi7pcHpfmp25zBkl7rZN9TowMkL4zltSOla8IzhYpYap1c
        K3h8VYXYeJTp+ngLJlaz0ARIv1NJxtg=
X-Google-Smtp-Source: APXvYqzDpZ8YG//YOcWy7Kuhlj7A9CSopP/WbXJ55Oi+TExSQ+GnwMNl1xde0aKnYRA43BIUSZQVvQ==
X-Received: by 2002:a05:6830:1699:: with SMTP id k25mr1503117otr.11.1565827697363;
        Wed, 14 Aug 2019 17:08:17 -0700 (PDT)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com. [209.85.210.42])
        by smtp.gmail.com with ESMTPSA id z17sm429047oth.48.2019.08.14.17.08.16
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2019 17:08:16 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id q20so1476917otl.0
        for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2019 17:08:16 -0700 (PDT)
X-Received: by 2002:a9d:70c6:: with SMTP id w6mr236433otj.349.1565827695529;
 Wed, 14 Aug 2019 17:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAHX4x86QCrkrnPEfrup8k96wyqg=QR_vgetYLqP1AEa02fx1vw@mail.gmail.com>
 <20190813060249.GD6670@kroah.com> <CAHX4x87DbJ4cKuwVO3OS=UzwtwSucFCV073W8bYHOPHW8NiA=A@mail.gmail.com>
 <20190814212012.GB22618@kroah.com>
In-Reply-To: <20190814212012.GB22618@kroah.com>
From:   Nick Crews <ncrews@chromium.org>
Date:   Wed, 14 Aug 2019 18:08:03 -0600
X-Gmail-Original-Message-ID: <CAHX4x84YM0PcoQw17FxMz=6=NPq2+HUUw2GWZarAKzZxr+ax=A@mail.gmail.com>
Message-ID: <CAHX4x84YM0PcoQw17FxMz=6=NPq2+HUUw2GWZarAKzZxr+ax=A@mail.gmail.com>
Subject: Re: Policy to keep USB ports powered in low-power states
To:     Duncan Laurie <dlaurie@google.com>
Cc:     linux-usb@vger.kernel.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Daniel Kurtz <djkurtz@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Adding Duncan Laurie who I think has some more intimate knowledge
of how this is implemented in HW. Duncan, could you correct or elaborate
on my answers below as you see fit? Also, sorry if I make some beginner
mistakes here, I'm just getting familiar with the USB subsystem, and thanks for
your patience.

On Wed, Aug 14, 2019 at 3:20 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Aug 14, 2019 at 02:12:07PM -0600, Nick Crews wrote:
> > Thanks for the fast response!
> >
> > On Tue, Aug 13, 2019 at 12:02 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Mon, Aug 12, 2019 at 06:08:43PM -0600, Nick Crews wrote:
> > > > Hi Greg!
> > >
> > > Hi!
> > >
> > > First off, please fix your email client to not send html so that vger
> > > does not reject your messages :)
> >
> > Thanks, should be good now.
> >
> > >
> > > > I am working on a Chrome OS device that supports a policy called "USB Power
> > > > Share," which allows users to turn the laptop into a charge pack for their
> > > > phone. When the policy is enabled, power will be supplied to the USB ports
> > > > even when the system is in low power states such as S3 and S5. When
> > > > disabled, then no power will be supplied in S3 and S5. I wrote a driver
> > > > <https://lore.kernel.org/patchwork/patch/1062995/> for this already as part
> > > > of drivers/platform/chrome/, but Enric Balletbo i Serra, the maintainer,
> > > > had the reasonable suggestion of trying to move this into the USB subsystem.
> > >
> > > Correct suggestion.
> > >
> > > > Has anything like this been done before? Do you have any preliminary
> > > > thoughts on this before I start writing code? A few things that I haven't
> > > > figured out yet:
> > > > - How to make this feature only available on certain devices. Using device
> > > > tree? Kconfig? Making a separate driver just for this device that plugs
> > > > into the USB core?
> > > > - The feature is only supported on some USB ports, so we need a way of
> > > > filtering on a per-port basis.
> > >
> > > Look at the drivers/usb/typec/ code, I think that should do everything
> > > you need here as this is a typec standard functionality, right?
> >
> > Unfortunately this is for USB 2.0 ports, so it's not type-C.
> > Is the type-C code still worth looking at?
>
> If this is for USB 2, does it use the "non-standard" hub commands to
> turn on and off power?  If so, why not just use the usbreset userspace
> program for that?

It does not use the standard hub commands. The USB ports are controlled
by an Embedded Controller (EC), so to control this policy we send a command
to the EC. Since the command to send to the EC is very specific, this would need
to go into a "hub driver" unique for these Wilco devices. We would make it so
that the normal hub registration is intercepted by something that sees this is a
Wilco device, and instead register the hub as a "wilco-hub", which has its own
special "power_share" sysfs attribute, but still is treated as a normal USB hub
otherwise?

>
> And how are you turning a USB 2 port into a power source?  That feels
> really odd given the spec.  Is this part of the standard somewhere or
> just a firmware/hardware hack that you are adding to a device?

The EC twiddles something in the port' HW so that the port turns into a
DCP (Dedicated Charging Port) and only supplies power, not data. So I
think yes, this is a bit of a hack that does not conform to the spec.

>
> Is there some port information in the firmware that describes this
> functionality?  If so, can you expose it through sysfs to the port that
> way?

[I'm not sure I'm answering your question, but] I believe that we could
make the BIOS firmware describe the USB ports' capabilities, and the
kernel's behavior would be gated upon what the firmware reports. I see
that struct usb_port already contains a "quirks" field, should we add a
POWER_SHARE quirk to include/linux/usb/quirks.h? I would guess that
should that should be reserved for quirks shared between many USB
devices/hubs?

Thanks,
Nick

>
> thanks,
>
> greg k-h
