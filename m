Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DACB41BB374
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 03:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbgD1Bcb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Apr 2020 21:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726233AbgD1Bcb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Apr 2020 21:32:31 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 286C0C03C1A8
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2020 18:32:31 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id t9so416571pjw.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2020 18:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3c28BLoUcawgzMH2F+ja18xonEWNG3Ku5CNlCJmk/24=;
        b=m4dZEOfbodNmGEMK/eIoqX4fi+MfTWGFuXi+LDqGn2pkwk9IHon8fkK0Ehekw7pTvq
         pKanqi9xSBrqKv01H/bnp8uvlpj5cpG38+PKTqd/rWftoCrQ4UnDmx6fFrE6n77J1HJV
         TWsxv7lOe2/yzDi9eqI7wjQ9hhptD0o9WLbPsyWPvb07qSit4D9v7ClDgFmm4iB58tdh
         quL0azvyNmrCOlQ9J/Y+5i8LkNn3N5MatTSNC58kT3mJEmdZqxTyNyAoNhlgoYnETn5Z
         6YjyCMdMLSHhzOuaXlVvW47tplbmuvH9yvx3jOciNSwHm1so6wtzrXQ+04jNnue0+nti
         phGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3c28BLoUcawgzMH2F+ja18xonEWNG3Ku5CNlCJmk/24=;
        b=eLeJT4PpUhR0eiyoAkSQmSSXLiJP44eyFZpxPwUqR+BtqAfL7WOTZsk2zx7wgEB9lm
         Bdlien/3lxrqE7b4QG0+Xn3Z2e7jgDDSuJDT1QixjDIOmSRjgiPuKl/nlotVAuvinCKj
         k3s0pqti0NXADPeHD3EXxsjSBRRYxYhOUfJAFEYWmfkDUwRvWy519Z0ZD8mThg1bHZb+
         yD8LizozHofCbBXtvxCdkuT84Lnj0BJ0BAfGE3v8SdBNk5Um2pIYw0cc9Eb/WUsqjI6w
         x6PCXWsgjdqDpo1WD0j4V+EFTuNwnVLQJNbauXF7yI4J7963Tc/wMKt7yFOKT81Ht/vs
         vqnw==
X-Gm-Message-State: AGi0PuY0jEhzJjPkaweV0Qyb5vR7dgVKY8PvMDPRR3d46/E0GOZnyhI4
        HdDg6r6MxtA6s3X47fqOWCIyj5Q34+Uml/IctENX5A==
X-Google-Smtp-Source: APiQypK9wXFWOTq/Vq8foAx3TmaRIk8iMwJPjtsPfy6OPjg6OaN2Sxq0wd9z9rkHM6Ivd23r9QDZ4WrfQoAOiiMbDdE=
X-Received: by 2002:a17:90a:a608:: with SMTP id c8mr1876059pjq.90.1588037550260;
 Mon, 27 Apr 2020 18:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+x7Fihwriocp8Kpr+AQks6h3syZa+g0Wd+Q62fg-y93Lg@mail.gmail.com>
 <Pine.LNX.4.44L0.2004092015180.30065-100000@netrider.rowland.org>
 <CAAeHK+wYc1De7AN12mkkjDsx-PJODOAvBCOtcDSykSjq6gwCNA@mail.gmail.com>
 <CAAeHK+ykiDzvzFu1sKLXqiGxsnJP_iKXGttNk22Smzu1O31p=Q@mail.gmail.com>
 <CAAeHK+xqQC4guQrSs3JTCM+Bm=ZHKNT=4zgucTo9xbcz6htEZw@mail.gmail.com> <CAAeHK+xMva7Rx9M0fUX+6G5me1rV8dGPK-KPhNac3vAtJFee-A@mail.gmail.com>
In-Reply-To: <CAAeHK+xMva7Rx9M0fUX+6G5me1rV8dGPK-KPhNac3vAtJFee-A@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 28 Apr 2020 03:32:19 +0200
Message-ID: <CAAeHK+z=z=e2pYQy3vtJO4rm+=Rb=av+4RidLCyp7Ae3shggqA@mail.gmail.com>
Subject: Re: Testing endpoint halt support for raw-gadget
To:     Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 28, 2020 at 2:50 AM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Mon, Apr 27, 2020 at 10:47 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> >
> > On Mon, Apr 27, 2020 at 9:51 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> > >
> > > On Fri, Apr 24, 2020 at 9:36 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> > > >
> > > > On Fri, Apr 10, 2020 at 2:29 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> > > > >
> > > > > On Thu, 9 Apr 2020, Andrey Konovalov wrote:
> > > > >
> > > > > > Hi Alan and Greg,
> > > > > >
> > > > > > I've been thinking about what kind of features raw-gadget might be
> > > > > > missing, that would allow more flexibility in emulating USB devices.
> > > > > > One of the things that is currently missing is halting endpoints.
> > > > > > Adding this functionality seems to be fairly easy, but it's unclear to
> > > > > > me how to test it. Any suggestions?
> > > > >
> > > > > You should use the usbtest driver along with the testusb program in
> > > > > tools/usb.  Of course, to do it you will need a userspace driver for
> > > > > raw-gadget.  usbtest works best with gadget-zero, but it can be used
> > > > > (in degraded form) with any USB device.
> > > >
> > > > Hi Alan,
> > > >
> > > > I've started working on a test suite for raw-gadget based on the
> > > > usbtest module as you suggested and have a few questions:
> > >
> > > Another question, which actually seems to be a major problem.
> > >
> > > It looks like automatic endpoint selection based on required features
> > > doesn't work in raw-gadget. The way it tries to do that is iterating
> > > over the list of available endpoints and finding one that has the
> > > right direction and transfer type. But it seems that the right way to
> > > do that (like it's done in usb_ep_autoconfig()) is to also patch the
> > > bEndpointAddress field of the endpoint descriptor.
> > >
> > > Currently with raw-gadget the endpoints are supposed to be enabled
> > > after a set_configuration/set_interface request from the host, so it's
> > > too late to patch the endpoint descriptor (the one that was sent to
> > > the host during enumeration). I'm guessing that sending one endpoint
> > > descriptor during enumeration and then using a different one (with
> > > patched bEndpointAddress) to set ep->desc before doing usb_ep_enable()
> > > won't work (as there's going to be mismatch in endpoint addresses
> > > between the host and the UDC), right?
> > >
> > > I wonder what we can do about that. It seems that we actually need to
> > > parse the descriptors and figure out the right endpoints before the
> > > enumeration starts.
> >
> > Or maybe somehow expose all endpoints and their features (like
> > GadgetFS) and let userspace put proper addresses into endpoint
> > descriptors before enumeration starts.
>
> I think this is the way to go, giving the userspace maximum control
> over what's going on. Seems not too hard to implement too. The only
> part that is not clear to me is how to figure out the endpoint address
> that a particular UDC endpoint expects to have.
>
> Most of the time endpoints are named as something like "ep1in" or
> "ep2out", and AFAIU the number in the endpoint name is the address.
> However net2280 seems to have weird endpoint names "ep-a", "ep-b",
> etc. Looking at usb_ep_autoconfig_ss(), those endpoints supposedly
> have sequential addresses starting from 1 (for each in/out type). But
> then in the GadgetFS example [1] e.g. "ep-a" corresponds to address 7,
> which I don't understand. My guess is that this is done to handle both
> dummy_udc and net2280 in a single if case, but I'm not sure.
>
> [1] http://www.linux-usb.org/gadget/usb.c

Oh, there's actually a comment that explains this [1] in dummy_hcd.c
(exactly the place where one would look for it :). So "ep-a" and
others are fully configurable and accept any endpoint address. OK, I
think I've figured out what to do here, will send a patch.

[1] https://elixir.bootlin.com/linux/v5.7-rc3/source/drivers/usb/gadget/udc/dummy_hcd.c#L113
