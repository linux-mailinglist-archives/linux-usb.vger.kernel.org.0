Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3831D1BE4
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 19:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389808AbgEMRHe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 13:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728068AbgEMRHe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 May 2020 13:07:34 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D3AC061A0C
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2020 10:07:34 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id x10so84421plr.4
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2020 10:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tr2x8+YFeaia3TjFV9PT119I/vDkcDmPLSw/jSZGycI=;
        b=HLTbd5GSIqWKPhEs/QrZfS5zTvfhajCjjs9irATn7uK9nA9rYhRotux2R3pT0oSfTg
         vga1VpIxs9zSl6sYF9QtsV6P5IcN85rT0x+FmmOWJ+l1v41JTXCx7CnGpVrPZ+kniCBo
         82P+1MHGvMUK7r1zfg/sgJR6QYFF+tZL0eX8Gcawy/24jSV4HwFglno681ln0a2eOAja
         o+1pGQvVZCO1GB4fbe5++w7BlCJUH6DfKLqWIH2HgojY7UDhvV1InqOD1Xtxm+WIpyyK
         malBcHoB4aF+RyNUTuzRPaPiHt1QNXzmgD+QccToM1pgzfS2SrVTQOgaEkc+VdQk4bCE
         Z8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tr2x8+YFeaia3TjFV9PT119I/vDkcDmPLSw/jSZGycI=;
        b=fwcThZJAFPIavqJpg7VtdBut1oRj9gloMEnXHrQ4B3IW3Y1uligG5cgngKH5PTSUat
         2dFVRqEQH4qjn94sI8eeFc2xM/EaaAo8TTqSG6zJ/moBZTs0Y8S+8XLylWNr2XE7UJLc
         86Wwz+IOY5f2yZOboJq712xD8ecVgzGq/qizWSbpK5R7UUhlsh5P7c6G0P60AgdDpcgc
         AoiGqd5IM0xWzFkpdvMfWfRvDwLAE+ShaU4bQteHLIdEoN+Odp483dMF+NoDn0ziOqGl
         AfrYEqhizOHZmV5gdy60iSbRxoZd3D/HyHyfE05ZVIlsdyL5dRXgPpQwAvYPf9A2+fQd
         TgGQ==
X-Gm-Message-State: AGi0PuaILP0ewON6KYcyJbcWrRHlHQXg6COmKuA/+rRjUhAVZXRZ0neV
        AtqFt+mFJeKtHXZcr46oib52hL5Pd9o14Wv6HIml2A==
X-Google-Smtp-Source: APiQypKYZ6w1TpmTOaVaZntO5zIe0ufyU8R3U/S169sy84dYXkAFu0N2jE88YdEVRE53akNOXrT2AksyyyYiX8p7jaA=
X-Received: by 2002:a17:90a:4d4e:: with SMTP id l14mr34753067pjh.136.1589389651785;
 Wed, 13 May 2020 10:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+z=z=e2pYQy3vtJO4rm+=Rb=av+4RidLCyp7Ae3shggqA@mail.gmail.com>
 <Pine.LNX.4.44L0.2004280920510.4958-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2004280920510.4958-100000@netrider.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 13 May 2020 19:07:20 +0200
Message-ID: <CAAeHK+yHBZ4oxW7AbS8VwqMrULKiETBYjW6ARZ+9FiWk=hvs=g@mail.gmail.com>
Subject: Re: Testing endpoint halt support for raw-gadget
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 28, 2020 at 3:27 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> Better late than never...
>
> On Tue, 28 Apr 2020, Andrey Konovalov wrote:
>
> > On Tue, Apr 28, 2020 at 2:50 AM Andrey Konovalov <andreyknvl@google.com> wrote:
> > >
> > > On Mon, Apr 27, 2020 at 10:47 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> > > >
> > > > On Mon, Apr 27, 2020 at 9:51 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> > > > > Another question, which actually seems to be a major problem.
> > > > >
> > > > > It looks like automatic endpoint selection based on required features
> > > > > doesn't work in raw-gadget. The way it tries to do that is iterating
> > > > > over the list of available endpoints and finding one that has the
> > > > > right direction and transfer type. But it seems that the right way to
> > > > > do that (like it's done in usb_ep_autoconfig()) is to also patch the
> > > > > bEndpointAddress field of the endpoint descriptor.
> > > > >
> > > > > Currently with raw-gadget the endpoints are supposed to be enabled
> > > > > after a set_configuration/set_interface request from the host, so it's
> > > > > too late to patch the endpoint descriptor (the one that was sent to
> > > > > the host during enumeration). I'm guessing that sending one endpoint
> > > > > descriptor during enumeration and then using a different one (with
> > > > > patched bEndpointAddress) to set ep->desc before doing usb_ep_enable()
> > > > > won't work (as there's going to be mismatch in endpoint addresses
> > > > > between the host and the UDC), right?
>
> It certainly won't work.
>
> > > > > I wonder what we can do about that. It seems that we actually need to
> > > > > parse the descriptors and figure out the right endpoints before the
> > > > > enumeration starts.
>
> That's right.  In the case of raw-gadget, this would be done around the
> time the user tells the driver what the config descriptors are.
>
> > > > Or maybe somehow expose all endpoints and their features (like
> > > > GadgetFS) and let userspace put proper addresses into endpoint
> > > > descriptors before enumeration starts.
>
> And if the user messes up the assignment, his driver won't work.
>
> > > I think this is the way to go, giving the userspace maximum control
> > > over what's going on. Seems not too hard to implement too. The only
> > > part that is not clear to me is how to figure out the endpoint address
> > > that a particular UDC endpoint expects to have.
> > >
> > > Most of the time endpoints are named as something like "ep1in" or
> > > "ep2out", and AFAIU the number in the endpoint name is the address.
> > > However net2280 seems to have weird endpoint names "ep-a", "ep-b",
> > > etc. Looking at usb_ep_autoconfig_ss(), those endpoints supposedly
> > > have sequential addresses starting from 1 (for each in/out type). But
> > > then in the GadgetFS example [1] e.g. "ep-a" corresponds to address 7,
> > > which I don't understand. My guess is that this is done to handle both
> > > dummy_udc and net2280 in a single if case, but I'm not sure.
> > >
> > > [1] http://www.linux-usb.org/gadget/usb.c
> >
> > Oh, there's actually a comment that explains this [1] in dummy_hcd.c
> > (exactly the place where one would look for it :). So "ep-a" and
> > others are fully configurable and accept any endpoint address. OK, I
> > think I've figured out what to do here, will send a patch.
> >
> > [1] https://elixir.bootlin.com/linux/v5.7-rc3/source/drivers/usb/gadget/udc/dummy_hcd.c#L113

Hi Alan,

I've been looking at this a little more. Do I understand correctly
that even though Dummy UDC names endpoints as "ep1in", etc. it
actually allows to assign endpoints addresses different from what is
specified in the endpoint names (it uses find_endpoint() to find the
right endpoint based on ep->desc)? E.g. you can technically assign
endpoint with address 2 (| USB_DIR_IN) to "ep1in".

If this is correct, this kind of limits Dummy UDC usage with Raw
Gadget the way it is currently implemented, as Raw Gadget assumes that
the endpoint address must be fixed when the endpoint is named as
ep1in.

Would it be acceptable to add another mode to Dummy UDC that names the
endpoints as "ep-a"? Perhaps enabled with a module parameter. I'm not
sure if this kind of naming would be technically correct, as "ep-a"
name assumes that we can assign arbitrary transfer type to the
endpoint as well, which isn't possible with Dummy UDC, as it doesn't
support ISO transfers.

Or do you think there can be another way to expose the fact that Dummy
UDC allows arbitrary addresses? I could hardcode this into Raw Gadget,
but it doesn't feel like the right approach.

Thanks!
