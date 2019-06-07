Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5E4D38D79
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 16:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728662AbfFGOjB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 10:39:01 -0400
Received: from mail-pf1-f177.google.com ([209.85.210.177]:45073 "EHLO
        mail-pf1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728252AbfFGOjB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jun 2019 10:39:01 -0400
Received: by mail-pf1-f177.google.com with SMTP id s11so1303263pfm.12
        for <linux-usb@vger.kernel.org>; Fri, 07 Jun 2019 07:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fXZyy+TfPPbT4jZipfJ5YApPB94m0d29bEBiCx/qk/0=;
        b=JAJQBM5m5S/pDyIxZf9ebvfGQvcXysSZmkw7TXpj9Mt1SeNCt170mj3OTcsW0F5yY4
         sRPB4THbw1cNykRyidDjWqgy536ehVvSfYd5df8GaDtMMyHL32ATPNTnWucyoWkD+cfu
         P1vfSx2kNCNx6c5UQvuhhex4tFX1DJCtZcJvkjc4CmIVwSHsiIoPYRorePqsjouuOQwb
         lZv8kinfuBAUSZTyahRQX1nkuUfTsryE47cxLlikux08VQhmRhZzuJtq4e0YYxaqIzBR
         VfE3XWyV3iwyXM5dDYY8aljHbyhtco17CubGe80WaufmDnsnwjdAG9kVdYfMus8sTTld
         T+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fXZyy+TfPPbT4jZipfJ5YApPB94m0d29bEBiCx/qk/0=;
        b=R5WCH2DqG15U2at8UeS3S5fXJKtoU/hmx99oz97VWNNeooJvdE/8mSjeL6FbmViy6v
         kqGDA/+5U2W203LvkFvXWF1wzFv7SapKC2Yg3NttDDxoC+YxDbQOxoLRo99ecDEVdc2B
         Ij4ubr3sUPYM6Uq3Epbeujo+Bow9FJXtvluHTtPheIHF26Ou9ywMPj3h9V+ML3cABlcV
         lSWNKTkeQpc1SuKA2hajpM+lLrYBSSbfBwtCwEnSL9v4BSg9/WjxvGBqv992e9ErC0Mw
         3Xff/MA71O03FMsbKAYOpIhtT0Hqew2zsZiUgV1s+Jud1TN9QIJwSNopofuMQT9Lq4mt
         mDwA==
X-Gm-Message-State: APjAAAVjmhdjmNez90LjX4AXoCDOM3BMnKv16qXyKfHyPon/HFqAXr4x
        8/R4DNsqANivkmE6AxwooP37j6ml6umc8a3pquf0+w==
X-Google-Smtp-Source: APXvYqxJ33xkqtWEFxw5OF4t7OMIS6PLhFrSvUP1m2ORdVB8JX22RHf42GlC6gS7eUxpMKJz/UoDYkPUou4vAuIpUUE=
X-Received: by 2002:a65:64d9:: with SMTP id t25mr3011903pgv.130.1559918339473;
 Fri, 07 Jun 2019 07:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+y8Aj1r1XyNHwXe2dF_yxoQSe2_u4-aDOPkYk9Q9tRGzA@mail.gmail.com>
 <Pine.LNX.4.44L0.1906071001510.1612-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1906071001510.1612-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 7 Jun 2019 16:38:48 +0200
Message-ID: <CAAeHK+xxn1dSJBwBv7g=Mp3e9XARmJwb9JgjLjbDLx0rE+9tew@mail.gmail.com>
Subject: Re: Pass transfer_buffer to gadget drivers
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        USB list <linux-usb@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 7, 2019 at 4:04 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Fri, 7 Jun 2019, Andrey Konovalov wrote:
>
> > On Fri, Jun 7, 2019 at 2:43 PM Felipe Balbi
> > <felipe.balbi@linux.intel.com> wrote:
> > >
> > >
> > > Hi,
> > >
> > > Andrey Konovalov <andreyknvl@google.com> writes:
> > > >> >> Andrey Konovalov <andreyknvl@google.com> writes:
> > > >> >> > I've noticed that when the host performs a control request,
> > > >> >> > urb->transfer_buffer/transfer_buffer_length are not passed to the
> > > >> >> > gadget drivers via the setup() call, the only thing that is passed is
> > > >> >> > the usb_ctrlrequest struct. Is there a way to get the transfer_buffer
> > > >> >> > from within a gadget driver? If not, what approach would the best to
> > > >> >> > implement this?
> > > >> >>
> > > >> >> I think you need to further explain what you mean here.
> > > >> >>
> > > >> >> What do you mean by gadget driver in this case?
> > > >> >>
> > > >> >> If you mean the drivers under drivers/usb/gadget/{function,legacy}
> > > >> >> directories then there's no way that they can have access to anything
> > > >> >> from the host.
> > > >> >>
> > > >> >> Remember that gadget and host are two completely distinct units. The
> > > >> >> only thing they share is a USB cable. When it comes to Control
> > > >> >> Transfers, if a data stage is necessary, that must be encoded in the
> > > >> >> wLength field of the control structure.
> > > >> >>
> > > >> >> Also, host side does *not* pass its usb_ctrlrequest struct to the
> > > >> >> gadget, it passes a series of 8 bytes which are oblivious to where in
> > > >> >> memory they were from the host point of view.
> > > >> >>
> > > >> >> If if you have the same machine acting as both host and device, each
> > > >> >> side has no knowledge of that fact.
> > > >> >
> > > >> > Hi Felipe,
> > > >> >
> > > >> > What I meant is that any module (gadget driver) that implements
> > > >> > usb_gadget_driver struct callbacks and registers it, will only get
> > > >> > usb_ctrlrequest through the setup() callback, but not the
> > > >> > transfer_buffer/length.
> > > >>
> > > >> A control request is *always* 8 bytes. That's mandated by the USB
> > > >> specification.
> > > >>
> > > >> > And therefore it can't access the data that is
> > > >> > attached to a control request.
> > > >>
> > > >> There is no data attached to a control request. A Control Transfer is
> > > >> composed of 2 or 3 stages:
> > > >>
> > > >> - SETUP stage
> > > >>         an 8 byte transfer descriptor type thing
> > > >>
> > > >> - (optional) Data stage
> > > >>         if wLength of control request contains a value > 0, then this
> > > >>         stage fires up to transfer the amount of data communicated in
> > > >>         wLength (during previous stage).
> > > >>
> > > >> - Status Stage
> > > >>         A zero length transfer to communicate successful end of transfer
> > > >>         (in case it completes fine) or an error (in case of STALL
> > > >>         condition).
> > > >
> > > > Hm, then why does the usb_control_msg() function accepts a data and
> > > > size arguments? Which are described in the comment as "pointer to the
> > > > data to send" and "length in bytes of the data to send" accordingly?
> > > > Or is this the buffer for the response?
> > >
> > > That's for the data stage :-)
> >
> > Sure =)
> >
> > >
> > > usb_control_msg() is an upper lever API to encode and entire Control
> > > Transfer (all stages of it).
> > >
> > > What is the problem you see, then?
> >
> > The problem is that I want to receive that data (from the data stage)
> > from within my gadget driver module. But it's not passed to the
> > setup() callback. And the question is: how do I do that then?
>
> I just caught up on this thread...
>
> The answer is simple: The gadget driver's setup() callback routine
> submits a request for endpoint 0.  The Data Stage data is sent or
> received (depending on the direction encoded in the Setup information)
> by this request.

Ah, OK, got it, thanks!

Although while looking at the dummy_hcd implementation, I saw that it
accesses usb->transfer_buffer in case USB_REQ_GET_STATUS in
handle_control_request(), which is called right before the setup()
callback is called. So the data already available there without any
additional requests. Is this an implementation detail that is specific
to dummy_hcd?

>
> Alan Stern
>
