Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 114441165C0
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2019 05:06:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfLIEGF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 8 Dec 2019 23:06:05 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:43041 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726823AbfLIEGF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 8 Dec 2019 23:06:05 -0500
Received: by mail-vk1-f196.google.com with SMTP id s62so3968522vkb.10
        for <linux-usb@vger.kernel.org>; Sun, 08 Dec 2019 20:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SSKZQVNYBrUoRU4TPgH9Xi7HOKeo/fTJhl3EcFgABvc=;
        b=bYE7UvRj8WqhH/yPnmNYzBwI9HgYLmCbDkmqzmiM6urz1iwQWs3gJP4jUyz3Nk3Cl4
         mZJ0unsgC7SUGo4APlmBV0tzbpoinfMIDbAGlv5Kmp1K1xUSURUJfKfItDQyq/w535tp
         U5hyBNlIHd4inJvg287aAk+wQyGQ+ybxr8HgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SSKZQVNYBrUoRU4TPgH9Xi7HOKeo/fTJhl3EcFgABvc=;
        b=rVDhHmEEPu/ITXCB5wf8ZAt0yBgnTWT0Ok/vOB8QO/ubgVMJaOa8XjEZjZiCII/IVG
         1jLH5aFIjBphDwH3p6BksATEeg0qFrtDZTDLeGeRUYoPSNrareCCXOA5CtWIq8pclTyi
         KG5OpO7xqX7iFsQ6vf/XCHkqUGuym9B221cQioVcfBvNZzp9y3+fl85LvlDVUtnEH8qH
         sj2afCeb1kiWiCMivWIlTDI4piztZmvdYIY77oi4FT2mW6H+vBdz8lcvMI+KDDTOXFjR
         d/dAqxbjXmmdPKQKRlUo9v85ib/hsLWG38Equl9pXkI9L3oUG6g7gxG0k+9I79WcaH3x
         jIJw==
X-Gm-Message-State: APjAAAXyCYYV8PK9GSL4WphklO1vELepeQOtHTu6svfKmGdSl9XDSqGZ
        RH186b/inTVnFMqCgcFyc9o3b+F+z0rBMBWFEbRlUQ==
X-Google-Smtp-Source: APXvYqxiLiVTMXxIQfcCgISplvC33Dty2tzSU0elJdJeDv4SwXtUrMMWJ6sQkhk52auJFaw3mV3pedUilqtbw7keBOA=
X-Received: by 2002:a1f:8fd3:: with SMTP id r202mr22038987vkd.77.1575864364344;
 Sun, 08 Dec 2019 20:06:04 -0800 (PST)
MIME-Version: 1.0
References: <20191203101552.199339-1-ikjn@chromium.org> <20191203165301.GH10631@localhost>
 <CAATdQgCqYrd_aXN5GDsso+F3WadNx3DQKK3Efk3tgkrv2VXjyw@mail.gmail.com>
 <20191204075533.GI10631@localhost> <CAATdQgBcuJenS2VSm+y4Yhn5mWE1P0CGJQ3NRdoe68dd2SRPGg@mail.gmail.com>
 <20191205142641.GL10631@localhost> <CAATdQgBK4gWvR06YJ3Z_y5NeqLKYY7Ajc0KG78rG2deR3Ga11A@mail.gmail.com>
 <20191206152604.GO10631@localhost>
In-Reply-To: <20191206152604.GO10631@localhost>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Mon, 9 Dec 2019 12:05:53 +0800
Message-ID: <CAATdQgDAZ21bEXh+YFh+fCdBxnuRi-1_x0o_hpxW0Vj0zY-j8A@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] usb: overridable hub bInterval by device node
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        GregKroah-Hartman <gregkh@linuxfoundation.org>,
        RobHerring <robh+dt@kernel.org>,
        MarkRutland <mark.rutland@arm.com>,
        AlanStern <stern@rowland.harvard.edu>,
        SuwanKim <suwan.kim027@gmail.com>,
        "GustavoA . R . Silva" <gustavo@embeddedor.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nicolas Boichat <drinkcat@chromium.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 6, 2019 at 11:25 PM Johan Hovold <johan@kernel.org> wrote:
>
> On Fri, Dec 06, 2019 at 11:57:30AM +0800, Ikjoon Jang wrote:
> > On Thu, Dec 5, 2019 at 10:26 PM Johan Hovold <johan@kernel.org> wrote:
> > >
> > > On Thu, Dec 05, 2019 at 03:32:38PM +0800, Ikjoon Jang wrote:
> > > > On Wed, Dec 4, 2019 at 3:55 PM Johan Hovold <johan@kernel.org> wrote:
> > >
> > > > > But related to my question above, why do you need to do this during
> > > > > enumeration? Why not just set the lower interval value in the hub
> > > > > driver?
> > > >
> > > > Because I want device tree's bInterval to be checked against the same rules
> > > > defined in usb_parse_endpoint(). e.g. although hardware says its maximum
> > > > is 255, but the practical limit is still 0 to 16, so the code can
> > > > print warnings when bInterval from device node is too weird.
> > >
> > > But that could be handled refactoring the code in question or similar.
> >
> > Yes, that should be worked. I can't exactly figure out how to refactor
> > the code for now, but maybe parsed endpoint descriptors are being
> > checked with default hard wired bInterval value and after that
> > an overridden value should be checked again.
> >
> > Actually I don't care about the details of software policies. I just want
> > all devices to be handled in the same manner without any further
> > special treatments.
>
> I'd say you're indeed trying to give a specific device special
> treatment. ;)

yeah right, I'm giving one treatment but I mean not any further.

>
> > > The fundamental problem here is that you're using devicetree, which is
> > > supposed to only describe the hardware, to encode policy which should be
> > > deferred to user space.
> >
> > The hub hardware has a default bInterval inside which is actually
> > adjustable. So I can think setting bInterval is to describe the hardware
> > rather than policy.
>
> No, the USB spec says bInterval is a maximum requested value and that
> the host is free to poll more often. And that's policy.

Honestly I'm a bit confused on the border line between hardware
and software definition. That's quite reasonable it's policy that software
can poll more often than hardware specified, but can we think it's just
overriding hardware property specifying maximum value from beginning?
Is it still policy? or 'overriding hardware property' part is already not
a hardware description? :-S

>
> > > So I think you need to figure out an interface that allows user space to
> > > set the polling interval for any hub at runtime instead.
> >
> > Changing the interval at runtime is an another way to solve the
> > power consumption problem, but it's not so easy. At least xhci needs
> > to restart an endpoint and no devices are changing the interval after
> > enumeration stage.
>
> The usb-hid driver actually supports configuring the polling rate
> for devices like mice and keyboards after enumeration (through a module
> parameter, but still).
>
> Unfortunately, the xhci driver does not yet support this and always uses
> the device maximum bInterval. A bug report for this was filed many years
> ago, perhaps it's time to address that (adding Mathias on CC):
>
>         https://bugzilla.kernel.org/show_bug.cgi?id=82571

Thanks!

>
> Johan
