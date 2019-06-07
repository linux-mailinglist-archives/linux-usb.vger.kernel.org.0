Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD78438C2A
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 16:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729315AbfFGOEJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 10:04:09 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:34740 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728203AbfFGOEJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jun 2019 10:04:09 -0400
Received: (qmail 1674 invoked by uid 2102); 7 Jun 2019 10:04:08 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 7 Jun 2019 10:04:08 -0400
Date:   Fri, 7 Jun 2019 10:04:08 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        USB list <linux-usb@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Pass transfer_buffer to gadget drivers
In-Reply-To: <CAAeHK+y8Aj1r1XyNHwXe2dF_yxoQSe2_u4-aDOPkYk9Q9tRGzA@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1906071001510.1612-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 7 Jun 2019, Andrey Konovalov wrote:

> On Fri, Jun 7, 2019 at 2:43 PM Felipe Balbi
> <felipe.balbi@linux.intel.com> wrote:
> >
> >
> > Hi,
> >
> > Andrey Konovalov <andreyknvl@google.com> writes:
> > >> >> Andrey Konovalov <andreyknvl@google.com> writes:
> > >> >> > I've noticed that when the host performs a control request,
> > >> >> > urb->transfer_buffer/transfer_buffer_length are not passed to the
> > >> >> > gadget drivers via the setup() call, the only thing that is passed is
> > >> >> > the usb_ctrlrequest struct. Is there a way to get the transfer_buffer
> > >> >> > from within a gadget driver? If not, what approach would the best to
> > >> >> > implement this?
> > >> >>
> > >> >> I think you need to further explain what you mean here.
> > >> >>
> > >> >> What do you mean by gadget driver in this case?
> > >> >>
> > >> >> If you mean the drivers under drivers/usb/gadget/{function,legacy}
> > >> >> directories then there's no way that they can have access to anything
> > >> >> from the host.
> > >> >>
> > >> >> Remember that gadget and host are two completely distinct units. The
> > >> >> only thing they share is a USB cable. When it comes to Control
> > >> >> Transfers, if a data stage is necessary, that must be encoded in the
> > >> >> wLength field of the control structure.
> > >> >>
> > >> >> Also, host side does *not* pass its usb_ctrlrequest struct to the
> > >> >> gadget, it passes a series of 8 bytes which are oblivious to where in
> > >> >> memory they were from the host point of view.
> > >> >>
> > >> >> If if you have the same machine acting as both host and device, each
> > >> >> side has no knowledge of that fact.
> > >> >
> > >> > Hi Felipe,
> > >> >
> > >> > What I meant is that any module (gadget driver) that implements
> > >> > usb_gadget_driver struct callbacks and registers it, will only get
> > >> > usb_ctrlrequest through the setup() callback, but not the
> > >> > transfer_buffer/length.
> > >>
> > >> A control request is *always* 8 bytes. That's mandated by the USB
> > >> specification.
> > >>
> > >> > And therefore it can't access the data that is
> > >> > attached to a control request.
> > >>
> > >> There is no data attached to a control request. A Control Transfer is
> > >> composed of 2 or 3 stages:
> > >>
> > >> - SETUP stage
> > >>         an 8 byte transfer descriptor type thing
> > >>
> > >> - (optional) Data stage
> > >>         if wLength of control request contains a value > 0, then this
> > >>         stage fires up to transfer the amount of data communicated in
> > >>         wLength (during previous stage).
> > >>
> > >> - Status Stage
> > >>         A zero length transfer to communicate successful end of transfer
> > >>         (in case it completes fine) or an error (in case of STALL
> > >>         condition).
> > >
> > > Hm, then why does the usb_control_msg() function accepts a data and
> > > size arguments? Which are described in the comment as "pointer to the
> > > data to send" and "length in bytes of the data to send" accordingly?
> > > Or is this the buffer for the response?
> >
> > That's for the data stage :-)
> 
> Sure =)
> 
> >
> > usb_control_msg() is an upper lever API to encode and entire Control
> > Transfer (all stages of it).
> >
> > What is the problem you see, then?
> 
> The problem is that I want to receive that data (from the data stage)
> from within my gadget driver module. But it's not passed to the
> setup() callback. And the question is: how do I do that then?

I just caught up on this thread...

The answer is simple: The gadget driver's setup() callback routine
submits a request for endpoint 0.  The Data Stage data is sent or
received (depending on the direction encoded in the Setup information)  
by this request.

Alan Stern

