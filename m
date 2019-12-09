Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96204116598
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2019 04:48:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbfLIDr7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 8 Dec 2019 22:47:59 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:38191 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727066AbfLIDr7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 8 Dec 2019 22:47:59 -0500
Received: by mail-ua1-f68.google.com with SMTP id z17so5042774uac.5
        for <linux-usb@vger.kernel.org>; Sun, 08 Dec 2019 19:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y+vxa3qCisuYX81ZvQKh/06NrXG6iSdwdH4Sz/s9g3g=;
        b=k8jJUyVSl6cE4W+fWhINdIPhwRBP5gNyjYOHsG6BtSo72KlCvh7X4RDiFph7rJprIi
         XyazImi+bK0wINFqmmHwu03wtt5n94j9ydqfRE1VwIEqu6u4HXz3sipGT/0IrBaoGQFT
         OcGMO3nxsp+5D+E0hapuUO37q/Xcf3Z0IImYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y+vxa3qCisuYX81ZvQKh/06NrXG6iSdwdH4Sz/s9g3g=;
        b=I76eyK9A+XBV1epW+XLHElUnF8C9phSVVFEsYiR4y7zYDHUziYd/UXyrUkSRdpbF/3
         uqPL892SVCNZG31AM68esKNQ7lK9rMPm3KmJ5OhuqX3ivNS2NC3o2ukQLqz2beTTn1oM
         OWBqfJYwAAvjMsWcYfDh0cXbyNbAxPWj61r9aXAR/GPrUJwpbzrYeHP9uuwFTmbin4EN
         4M1g1TZD1aHeDu48rF7gTKc0rC11XTVLb9QSOkrCUR7FZTncVW1DOaLrGBQzS8+NGPgo
         jSQMQ6QhurSlK5Stfd2P28OS98wCtFPDWM0Ffww09ipRaaKEIa5ji3BSSxPT1qEb2rsD
         vo9Q==
X-Gm-Message-State: APjAAAUdbyoyllK52Z+Tmiu9yeQRp8zKW6QMuXUhLtyqwk4vsCZQLo0b
        oWTlXJ1FxC9blqD3a8Pd31c1R6RaxT1hC4GOyo+D/w==
X-Google-Smtp-Source: APXvYqw2Y9m8C3sZpyxjV87zZFwVpnaCBxRbzi4DdUd8/DIvSJj/1SrjcwuU7XlgujbYOE7ZR3vziSReJMhZOUXDYC0=
X-Received: by 2002:ab0:3487:: with SMTP id c7mr20535526uar.25.1575863278400;
 Sun, 08 Dec 2019 19:47:58 -0800 (PST)
MIME-Version: 1.0
References: <CAATdQgBK4gWvR06YJ3Z_y5NeqLKYY7Ajc0KG78rG2deR3Ga11A@mail.gmail.com>
 <Pine.LNX.4.44L0.1912060958550.1618-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1912060958550.1618-100000@iolanthe.rowland.org>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Mon, 9 Dec 2019 11:47:47 +0800
Message-ID: <CAATdQgAxCja9L33QFQOEfPjOrGc5-pTGXifsYnxAZ+LOLkcuxA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] usb: overridable hub bInterval by device node
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        GregKroah-Hartman <gregkh@linuxfoundation.org>,
        RobHerring <robh+dt@kernel.org>,
        MarkRutland <mark.rutland@arm.com>,
        SuwanKim <suwan.kim027@gmail.com>,
        "GustavoA . R . Silva" <gustavo@embeddedor.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nicolas Boichat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 6, 2019 at 11:00 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Fri, 6 Dec 2019, Ikjoon Jang wrote:
>
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
> > >
> >
> > Yes, that should be worked. I can't exactly figure out how to refactor
> > the code for now, but maybe parsed endpoint descriptors are being
> > checked with default hard wired bInterval value and after that
> > an overridden value should be checked again.
> >
> > Actually I don't care about the details of software policies. I just want
> > all devices to be handled in the same manner without any further
> > special treatments.
> >
> > > The fundamental problem here is that you're using devicetree, which is
> > > supposed to only describe the hardware, to encode policy which should be
> > > deferred to user space.
> >
> > The hub hardware has a default bInterval inside which is actually
> > adjustable. So I can think setting bInterval is to describe the hardware
> > rather than policy.
>
> If the hardware is adjustable, why don't you adjust the hardware
> instead of changing the software?

sorry, I meant "hardware has a default value but it's actually
adjustable (by software)". Adjusting hardware is the best option but
our hub doesn't allow to do that, so the current approach is patching
a hardware descriptor on enumeration stage.

>
> > > So I think you need to figure out an interface that allows user space to
> > > set the polling interval for any hub at runtime instead.
> >
> > Changing the interval at runtime is an another way to solve the
> > power consumption problem, but it's not so easy. At least xhci needs
> > to restart an endpoint and no devices are changing the interval after
> > enumeration stage.
>
> Restarting endpoints is easy; just call usb_set_interface().

I thought just changing urb->interval at runtime will be more acceptable.
Maybe I'll need an another approach if this patch is unacceptable.

Thank you!

>
> Alan Stern
>
