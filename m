Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDF941B873E
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2020 17:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgDYPCg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Apr 2020 11:02:36 -0400
Received: from netrider.rowland.org ([192.131.102.5]:34091 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726097AbgDYPCg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Apr 2020 11:02:36 -0400
Received: (qmail 20443 invoked by uid 500); 25 Apr 2020 11:02:35 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 25 Apr 2020 11:02:35 -0400
Date:   Sat, 25 Apr 2020 11:02:35 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Testing endpoint halt support for raw-gadget
In-Reply-To: <CAAeHK+z5DXp9HL+=9z2cEOHpBUuhAV_EmDHucyc4+GtSaYJFjg@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2004251054140.19305-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 25 Apr 2020, Andrey Konovalov wrote:

> On Sat, Apr 25, 2020 at 3:53 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Fri, 24 Apr 2020, Andrey Konovalov wrote:
> >
> > > On Fri, Apr 24, 2020 at 9:36 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> >
> > > > Hi Alan,
> > > >
> > > > I've started working on a test suite for raw-gadget based on the
> > > > usbtest module as you suggested and have a few questions:
> > > >
> > > > 1. (Re test #10:) Currently there's no way to stall USB (control)
> > > > requests with raw-gadget (which is what happens when you return -EPIPE
> > > > from gadget's setup() callback AFAIU). Is stalling an important part
> > > > of the protocol? Should we somehow support it? AFAIU gadgetfs also has
> > > > no ability to stall requests that are passed to userspace.
> >
> > Yes, stalling is important, and you do need to support it.  gadgetfs
> > does have a way to stall requests on ep0 from userspace: just perform
> > I/O in the "wrong" direction.  If the host sends a control-IN request
> > and the user does a read of the ep0 file, or if the host sends a
> > control-OUT request and the user does a write, gadgetfs will call
> > usb_ep_set_halt.  (However I do not remember how the setup_can_stall
> > flag is meant to work.)
> 
> Ah, so halting ep0 after having successfully received a setup stage
> request (setup() callback returns 0) will result in a stall during the
> data stage

Or during the status stage, if there is no data stage (a 0-length 
transfer).

>  (I hope I'm using those "stage" terms right) without the
> gadget needing to queue an URB as it happens during a normal response?

Yes.

> Shouldn't this halt the endpoint until the user (or the gadget)
> unhalts it? Does this work when we want to just stall a single
> request? What happens with the requests that come after?

Ep0 is special.  See the description of protocol stalls in sections 
8.4.5 and 8.5.3 (especially 8.5.3.4) in the USB 2.0 spec.

Think about the problem for a moment.  Suppose a halt of ep0 persisted 
until it was cleared by the host.  Then it would never get cleared -- 
the only way the host can clear a halt condition is by sending a 
Clear-Halt request on ep0!

Alan Stern

