Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCA651397F3
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2020 18:40:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728664AbgAMRkn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jan 2020 12:40:43 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38645 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbgAMRkn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jan 2020 12:40:43 -0500
Received: by mail-pf1-f193.google.com with SMTP id x185so5203085pfc.5
        for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2020 09:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BVAS/5gDM35E+vwqcWj4iTNingff3wxRTXoRrLJ2q00=;
        b=PbUozQIiNWcYiivH2d8I/Q2/mmC03ElGYL8BeMeEiv7rT62VOBMRJhYp6DUZdsTLzB
         i2aruOVld4neB7dXlGb+PPyKcrcD2QBO7p1lE3z6d08KbBBzfy/of7wNgpej6eO2NiRH
         qyJAc0F8pnU6MMVWkY81NPm7xe2OA+QsZbE4LIIRcqIBn0OPKdrPC1Q8XPCsPpyspboN
         sUr3+8leOwyY89F/oSFv3cGrNSHmUlynYX2bOUbH+MV0uOTI5ztlTTSvZTB7f47EB940
         9BYe61kQnH0QOdtBTCSmRfuc3h358BlzcWmxeCAZgWOqtNXs9cMTpai7VPRj19osxYe3
         hHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BVAS/5gDM35E+vwqcWj4iTNingff3wxRTXoRrLJ2q00=;
        b=JGSWbF41hORHIyI5GmwwbwyMVnTEASyH2CGLv6E7s50A6szN1LaGzvf0E9+SpOKuqW
         qeS9Qo16EiDxFaf549xNdYAJzExzuVQd3k/A/8HpPDKEfVPfmxi480xRWzN98srEs15C
         J6owqL5b0WVnSsknlFmQzmRXxltp6fkj2tAdnIw2uBufhLfll9AGD+Bt4QXaR4p52yR0
         CkHUX/6pf7xmicj9mlu8OAeGEG1BT5S+UMTnGgEt+Ms4E4R+Qdf01gOTOXYB5vwQBBQ4
         98MSh7H5UznbOSGqZ4vL+plBrYo4/1JobPagngf/7fiFw+ncf282BP6NNA/rHnphJNvj
         sOpA==
X-Gm-Message-State: APjAAAUlmmZmZf30G17k5tRnB1lo316qMUoBooTvgfq4Lzv2XEGe0gKh
        lYcXSsraSQDZQ3Oy10a6exvh6zfNxK4QLH82EVUt5w==
X-Google-Smtp-Source: APXvYqwZIQ4UdM7SZQDr51CoDArHUpzRGAe6Q8bNEvEr3P+INcGbapfQuu3m6Q3BghOv0Yv945p4cNNPuIJi/eX8d7k=
X-Received: by 2002:a63:d906:: with SMTP id r6mr22112095pgg.440.1578937242731;
 Mon, 13 Jan 2020 09:40:42 -0800 (PST)
MIME-Version: 1.0
References: <CAAeHK+z2+_UHNp4_D2iL9FzPtDoU1YBohCaDJG8sAy12uc_-ew@mail.gmail.com>
 <Pine.LNX.4.44L0.2001131049090.1502-100000@iolanthe.rowland.org> <CAAeHK+x9Gk3cD77MA9jkhpwO8S62i6KT7PP3NZ6QTZ2qk2FB6w@mail.gmail.com>
In-Reply-To: <CAAeHK+x9Gk3cD77MA9jkhpwO8S62i6KT7PP3NZ6QTZ2qk2FB6w@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 13 Jan 2020 18:40:31 +0100
Message-ID: <CAAeHK+zKAHGAgYKxMNJEiaBhreGB0MgWNsEUFCO8Sxiqvcq57Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] usb: gadget: add raw-gadget interface
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 13, 2020 at 6:34 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Mon, Jan 13, 2020 at 5:50 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Mon, 13 Jan 2020, Andrey Konovalov wrote:
> >
> > > I've also found an issue, but I'm not sure if that is the bug in Raw
> > > Gadget, or in the gadget layer (in the former case I'll add this fix
> > > to v5 as well). What I believe I'm seeing is
> > > __fput()->usb_gadget_unregister_driver()->usb_gadget_remove_driver()->gadget_unbind()
> > > racing with dummy_timer()->gadget_setup(). In my case it results in
> > > gadget_unbind() doing set_gadget_data(gadget, NULL), and then
> > > gadget_setup() dereferencing get_gadget_data(gadget).
> > >
> > > Alan, does it look possible for those two functions to race? Should
> > > this be prevented by the gadget layer, or should I use some kind of
> > > locking in my gadget driver to prevent this?
> >
> > In your situation this race shouldn't happen, because before
> > udc->driver->unbind() is invoked we call usb_gadget_disconnect().  If
> > that routine succeeds -- which it always does under dummy-hcd -- then
> > there can't be any more setup callbacks, because find_endpoint() will
> > always return NULL (the is_active() test fails; see the various
> > set_link_state* routines).  So I don't see how you could have ended up
> > with the race you describe.
>
> I've managed to reproduce the race by adding an mdelay() into the
> beginning of the setup() callback. AFAIU what happens is setup() gets
> called (and waits on the mdelay()), then unbind() comes in and does
> set_gadget_data(NULL), and then setup() proceeds, gets NULL through
> get_gadget_data() and crashes on null-ptr-deref. I've got the same
> crash a few times after many days of fuzzing, so I assume it can
> happen without the mdelay() as well.
>
> > However, a real UDC might not be able to perform a disconnect under
> > software control.  In that case usb_gadget_disconnect() would not
> > change the pullup state, and there would be a real possibility of a
> > setup callback racing with an unbind callback.  This seems like a
> > genuine problem and I can't think of a solution offhand.
> >
> > What we would need is a way to tell the UDC driver to stop invoking
> > gadget callbacks, _before_ the UDC driver's stop callback gets called.
> > Maybe this should be merged into the pullup callback somehow.

Perhaps for the dummy driver we need to wait for setup() to finish if
it's being executed and then stop the dummy timer in dummy_pullup()?
