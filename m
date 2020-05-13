Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6E51D1F60
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 21:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390256AbgEMTiS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 15:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732626AbgEMTiQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 May 2020 15:38:16 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 491DBC061A0C
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2020 12:38:16 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id b8so185082pgi.11
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2020 12:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tuLZiJXlCiEq6nNwtj7VZt2ne1pqxpdlNfWSgWi/TyI=;
        b=agtfBvZS67e3Yg6B9qa6YcSq3IM8u+GmXVjf18m2kesh+HGBlilqxITuvqjQkDT6Fs
         NWEvXkePOEY5A4rE/v/ikydxwWJv1MR8dGLiF7MmWXCQEiTNEnBn5Ok0OFtieTk9vMHh
         L2WMKGmxDEp6dzMUYso/Pm8broee/Lez+SNh6NZWOUjupZsCkU0reHb+kXJBMItjTTGB
         NG8D4s7xwbXVZ9OZq4Y9Ofrun0ZN2tubYgNev2WrLirUilyiCKDz/896w3AHRHOb+ZDT
         Yx3U7LP3DMIcukxBKur18JwyCfiMUlx4KV/PsJq/PO6vZ3c5rp6hGNs5XFljRroQNo7u
         vSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tuLZiJXlCiEq6nNwtj7VZt2ne1pqxpdlNfWSgWi/TyI=;
        b=uAuyJIpigd/tK2S454wwDohPaCaTpfxGzvHlzqG34K1OQT+uSeNjQsMrBYMdz3c2GP
         ksW19H2LlvWtS4RT4sMtmju5rglazMqLqn48Vt2+1QqSILyW/SrtdbDp2W9WAgB9jpJF
         g9YKbOcElzzLM3bQxGvJtgoupsAamL0EjquUumaVeU4gSw+DBqTsPlRYzplI3SYivcrl
         ugtg92nviW8X0YVSwSgdWgBwG/AzgFkgQrNWZdG+vHo7sF/ypj2IJNe3x5IB3hSZKhjA
         sHo84wESuoi52q7v9dI9bWlOhJstMfD9DUYrpph11W+SL3ywiICDhe3j3wIRugpgYt5E
         1Q9g==
X-Gm-Message-State: AOAM530agq6ntpGzdhYErnHSEQQ/HW0NkUkMHYQlyDOiJC8LepntoDAY
        IuVTiEFoogd8PfGNKFpZGcxaFFM4Z4AXN0UeWYxY4g==
X-Google-Smtp-Source: ABdhPJxFkgfEoy9HhQB3pqrYqlNSEDR/OovFXa/RvDmmot+3GcylJOBJvIF94MZVvi/9o+yLCvSJoxvmP2/Q88NkDto=
X-Received: by 2002:a62:32c1:: with SMTP id y184mr770427pfy.306.1589398695447;
 Wed, 13 May 2020 12:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+z=z=e2pYQy3vtJO4rm+=Rb=av+4RidLCyp7Ae3shggqA@mail.gmail.com>
 <Pine.LNX.4.44L0.2004280920510.4958-100000@netrider.rowland.org>
 <CAAeHK+yHBZ4oxW7AbS8VwqMrULKiETBYjW6ARZ+9FiWk=hvs=g@mail.gmail.com>
 <20200513181431.GB2862@rowland.harvard.edu> <CAAeHK+wgP+P341B2F-aOFJGyompr6AqG6SiL-Qb60i=X-K6SvQ@mail.gmail.com>
 <20200513190912.GC2862@rowland.harvard.edu>
In-Reply-To: <20200513190912.GC2862@rowland.harvard.edu>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 13 May 2020 21:38:04 +0200
Message-ID: <CAAeHK+wAMZPduGeb863z36vC33G4-Wf8zrx-nwDLqr_aiEjjKA@mail.gmail.com>
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

On Wed, May 13, 2020 at 9:09 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Wed, May 13, 2020 at 08:31:35PM +0200, Andrey Konovalov wrote:
> > On Wed, May 13, 2020 at 8:14 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Wed, May 13, 2020 at 07:07:20PM +0200, Andrey Konovalov wrote:
> > > > Hi Alan,
> > > >
> > > > I've been looking at this a little more. Do I understand correctly
> > > > that even though Dummy UDC names endpoints as "ep1in", etc. it
> > > > actually allows to assign endpoints addresses different from what is
> > > > specified in the endpoint names (it uses find_endpoint() to find the
> > > > right endpoint based on ep->desc)? E.g. you can technically assign
> > > > endpoint with address 2 (| USB_DIR_IN) to "ep1in".
> > >
> > > Yes, that's right.  In fact, you can do this with any UDC.  (But with
> > > other UDCs it won't work, whereas with dummy-hcd it will.)
> > >
> > > > If this is correct, this kind of limits Dummy UDC usage with Raw
> > > > Gadget the way it is currently implemented, as Raw Gadget assumes that
> > > > the endpoint address must be fixed when the endpoint is named as
> > > > ep1in.
> > >
> > > Okay.  That makes sense, since it is true for most UDCs.
> > >
> > > > Would it be acceptable to add another mode to Dummy UDC that names the
> > > > endpoints as "ep-a"? Perhaps enabled with a module parameter. I'm not
> > > > sure if this kind of naming would be technically correct, as "ep-a"
> > > > name assumes that we can assign arbitrary transfer type to the
> > > > endpoint as well, which isn't possible with Dummy UDC, as it doesn't
> > > > support ISO transfers.
> > > >
> > > > Or do you think there can be another way to expose the fact that Dummy
> > > > UDC allows arbitrary addresses? I could hardcode this into Raw Gadget,
> > > > but it doesn't feel like the right approach.
> > >
> > > Why do you want to do this?  Does anything go wrong if you just continue
> > > to assume the endpoint numbers are fixed?
> >
> > Yes. Some USB drivers require endpoints with certain logical functions
> > to have certain addresses (e.g. for ath9k: [1]). This limits the
> > ability to use Raw Gadget + Dummy UDC for fuzzing, as sometimes we
> > can't emulate such devices unless Dummy UDC endpoint with a particular
> > address has required capabilities to implement those logical functions
> > (e.g. for ath9k: we can't emulate USB_REG_IN_PIPE endpoint, as Dummy
> > UDC only has an OUT endpoint with address 3).
> >
> > It's acceptable to be unable to emulate such devices with real UDCs
> > with fixed address endpoints, but it would be highly desirable to be
> > able to do that with Dummy UDC, as it technically supports
> > configurable endpoint addresses.
>
> Okay, that's reasonable.
>
> > [1] https://elixir.bootlin.com/linux/v5.6.12/source/drivers/net/wireless/ath/ath9k/hif_usb.h#L68
> >
> > > I suppose, if you thought this was really necessary, we could change
> > > find_endpoint() so that it looks for a match against the endpoint's name
> > > instead of against the address stored in the descriptor.
> >
> > That would make the behaviour of Dummy UDC match what is expected from
> > it based on the endpoint names, but won't help with the problem
> > described above.
>
> Would you want to do this anyway?  It doesn't seem necessary to me.

No, no need for this :)

>
> > > Or we could
> > > change the last thirteen "generic" endpoints in ep_info[] to be
> > > configurable: "ep-a", ..., "ep-m", or "ep-aout", ..., "ep-min".  (The
> > > fact that the endpoints don't support isochronous is exposed through the
> > > usb_ep_caps structures.)
> >
> > I think this should work. If we put this under a module parameter,
> > then we can make all endpoints have configurable names.
>
> No need for a module parameter; just make it a permanent change to the
> driver.

I was thinking that it could break some existing users, but I don't
know for sure.

> Would you like to submit a patch?

Sure, will do. Thanks!
