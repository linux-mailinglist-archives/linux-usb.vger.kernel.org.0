Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB4491D1D80
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 20:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390185AbgEMSbr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 14:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2390151AbgEMSbr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 May 2020 14:31:47 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 484EFC061A0C
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2020 11:31:47 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id u22so153172plq.12
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2020 11:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xDUPx+UaFzLXvDBrHu+ZD2HL4Y17ZzIs+vVchTAg+iQ=;
        b=ZIkCzPL58nS9T0Ct7WV5QEPK12ENcpR9QP/4cgkfiXaoqnDf7YeQg+EOsJdTKKdVRL
         9s85TkQPbI2aZ4xL4c1FrD/WAIxhSIZB6hWRSygivAQxUVHm2Vx2Nc4sZN8ACFV2uUF6
         /3BlM63fXoiwxU/86x70ZXcT0fwdqhZcZZ5e3b0kMyGqgYQb/fKLSFoVctZze1T4sJ6P
         gHftcSypYp6RcuRETmokf/6gk5oSLorUdvVuMAGrVKTm39cjhp4yKbQSmPS0LH/0xsVp
         s39ACPBEPP4oWaWlmKmc/gCWBC0yt1t4XPt40xmK5HDAzWnhCfNxVg+yWtwZ0yPy3LP8
         pTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xDUPx+UaFzLXvDBrHu+ZD2HL4Y17ZzIs+vVchTAg+iQ=;
        b=UyAR/kbZc2sEyNrIxlXIWnne1QsoAKem5grrQtz4EidT2oxrf/OD+tdo+eaegjuD+G
         MS9GEiww5wS0l5Lmg1FOXuhKWz/HrFyoVw2UxhWH3gpxOjLaH7ksNe4O83Ldn5u0OTe7
         mPJGUnHKUpK/nJlfLKsPJPCbD3F807ZHEp04xPMg/hLzsk2rAL083qxiiTdK252xX/fP
         7e0JwDJKlTlcvDfiv3cU62y0gKqwe4XfA4UtCHUQnC+UZXOk35ivxxrmZ63FE7NAdB2M
         HmmgsQhoklyAR79zYHaSHjCAGp+kCZJ3oIFqcb2QjDw4v09xe8SR/kWTf6JwN9aLiw1/
         x95w==
X-Gm-Message-State: AGi0PuYsw5pomcVtD4VTan5Q92LxaawHPTyZnC7xBeJUQhirAouoFzGF
        IS2ll/jOjcXM2wNI5VSXPrCO6Da+gCOot9SFkvT0LQ==
X-Google-Smtp-Source: APiQypK2zeXoWyzd8nVUhSNdNHnzULIeC5S5+yANc+xRu26w6HKJYUEzgfJ8xan1zs94p0OqkmjSwFC3hQORpYo9AIA=
X-Received: by 2002:a17:90a:9e9:: with SMTP id 96mr35194085pjo.41.1589394706426;
 Wed, 13 May 2020 11:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+z=z=e2pYQy3vtJO4rm+=Rb=av+4RidLCyp7Ae3shggqA@mail.gmail.com>
 <Pine.LNX.4.44L0.2004280920510.4958-100000@netrider.rowland.org>
 <CAAeHK+yHBZ4oxW7AbS8VwqMrULKiETBYjW6ARZ+9FiWk=hvs=g@mail.gmail.com> <20200513181431.GB2862@rowland.harvard.edu>
In-Reply-To: <20200513181431.GB2862@rowland.harvard.edu>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 13 May 2020 20:31:35 +0200
Message-ID: <CAAeHK+wgP+P341B2F-aOFJGyompr6AqG6SiL-Qb60i=X-K6SvQ@mail.gmail.com>
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

On Wed, May 13, 2020 at 8:14 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Wed, May 13, 2020 at 07:07:20PM +0200, Andrey Konovalov wrote:
> > Hi Alan,
> >
> > I've been looking at this a little more. Do I understand correctly
> > that even though Dummy UDC names endpoints as "ep1in", etc. it
> > actually allows to assign endpoints addresses different from what is
> > specified in the endpoint names (it uses find_endpoint() to find the
> > right endpoint based on ep->desc)? E.g. you can technically assign
> > endpoint with address 2 (| USB_DIR_IN) to "ep1in".
>
> Yes, that's right.  In fact, you can do this with any UDC.  (But with
> other UDCs it won't work, whereas with dummy-hcd it will.)
>
> > If this is correct, this kind of limits Dummy UDC usage with Raw
> > Gadget the way it is currently implemented, as Raw Gadget assumes that
> > the endpoint address must be fixed when the endpoint is named as
> > ep1in.
>
> Okay.  That makes sense, since it is true for most UDCs.
>
> > Would it be acceptable to add another mode to Dummy UDC that names the
> > endpoints as "ep-a"? Perhaps enabled with a module parameter. I'm not
> > sure if this kind of naming would be technically correct, as "ep-a"
> > name assumes that we can assign arbitrary transfer type to the
> > endpoint as well, which isn't possible with Dummy UDC, as it doesn't
> > support ISO transfers.
> >
> > Or do you think there can be another way to expose the fact that Dummy
> > UDC allows arbitrary addresses? I could hardcode this into Raw Gadget,
> > but it doesn't feel like the right approach.
>
> Why do you want to do this?  Does anything go wrong if you just continue
> to assume the endpoint numbers are fixed?

Yes. Some USB drivers require endpoints with certain logical functions
to have certain addresses (e.g. for ath9k: [1]). This limits the
ability to use Raw Gadget + Dummy UDC for fuzzing, as sometimes we
can't emulate such devices unless Dummy UDC endpoint with a particular
address has required capabilities to implement those logical functions
(e.g. for ath9k: we can't emulate USB_REG_IN_PIPE endpoint, as Dummy
UDC only has an OUT endpoint with address 3).

It's acceptable to be unable to emulate such devices with real UDCs
with fixed address endpoints, but it would be highly desirable to be
able to do that with Dummy UDC, as it technically supports
configurable endpoint addresses.

[1] https://elixir.bootlin.com/linux/v5.6.12/source/drivers/net/wireless/ath/ath9k/hif_usb.h#L68

> I suppose, if you thought this was really necessary, we could change
> find_endpoint() so that it looks for a match against the endpoint's name
> instead of against the address stored in the descriptor.

That would make the behaviour of Dummy UDC match what is expected from
it based on the endpoint names, but won't help with the problem
described above.

> Or we could
> change the last thirteen "generic" endpoints in ep_info[] to be
> configurable: "ep-a", ..., "ep-m", or "ep-aout", ..., "ep-min".  (The
> fact that the endpoints don't support isochronous is exposed through the
> usb_ep_caps structures.)

I think this should work. If we put this under a module parameter,
then we can make all endpoints have configurable names.
