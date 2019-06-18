Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE0264A2D7
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 15:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbfFRNxw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 09:53:52 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:39892 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725970AbfFRNxw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jun 2019 09:53:52 -0400
Received: (qmail 2414 invoked by uid 2102); 18 Jun 2019 09:53:50 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 18 Jun 2019 09:53:50 -0400
Date:   Tue, 18 Jun 2019 09:53:50 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        USB list <linux-usb@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Pass transfer_buffer to gadget drivers
In-Reply-To: <CAAeHK+y6W=w1_bJYa_T4SLYfZnRCKrtiz5o6Nvnmedq8Um2-LA@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1906180948100.1659-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 18 Jun 2019, Andrey Konovalov wrote:

> On Tue, Jun 18, 2019 at 3:31 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> >
> > On Fri, Jun 7, 2019 at 5:05 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> > >
> > > On Fri, Jun 7, 2019 at 5:02 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > > >
> > > > On Fri, 7 Jun 2019, Andrey Konovalov wrote:
> > > >
> > > > > > > The problem is that I want to receive that data (from the data stage)
> > > > > > > from within my gadget driver module. But it's not passed to the
> > > > > > > setup() callback. And the question is: how do I do that then?
> > > > > >
> > > > > > I just caught up on this thread...
> > > > > >
> > > > > > The answer is simple: The gadget driver's setup() callback routine
> > > > > > submits a request for endpoint 0.  The Data Stage data is sent or
> > > > > > received (depending on the direction encoded in the Setup information)
> > > > > > by this request.
> > > > >
> > > > > Ah, OK, got it, thanks!
> > > > >
> > > > > Although while looking at the dummy_hcd implementation, I saw that it
> > > > > accesses usb->transfer_buffer in case USB_REQ_GET_STATUS in
> > > > > handle_control_request(), which is called right before the setup()
> > > > > callback is called. So the data already available there without any
> > > > > additional requests. Is this an implementation detail that is specific
> > > > > to dummy_hcd?
> > > >
> > > > Yes, it is.  dummy-hcd is unusual in that it combines both a USB host
> > > > controller and a USB device controller in a single driver.
> > > >
> > > > Normal UDC drivers do handle USB_REQ_GET_STATUS on their own without
> > > > requiring the use of an explicit usb_request, because they handle the
> > > > entire transfer internally and don't involve the gadget driver.
> > > > However, they don't have access to any transfer_buffer; all they can do
> > > > is exchange packets with the host.
> > >
> > > OK, I see. Thanks a lot!
> >
> > Another question: do I understand correctly, that we only proceed with
> > submitting an URB to get the data for the control OUT request
> > (ctrl->bRequestType doesn't have the USB_DIR_IN bit set) if
> > ctrl->wLength != 0?

That's right.  If a control-OUT transfer has wLength == 0, it means 
there is no data stage.  (And control-IN transfers are not allowed to 
have wLength == 0.)

> Also, does the gadget subsystem guarantee, that we get the complete()
> callback for the DATA stage of the OUT control request before we get a
> setup() callback for the next control request if there's any?

As I recall, this isn't mentioned in the documentation.  But the UDC
drivers I know of do behave that way, and it's reasonable to assume
they all do.

After all, a data-stage transfer can't complete _after_ the next Setup
packet arrives.  Reception of a new Setup packet invalidates all
ongoing control transfers.

Alan Stern

