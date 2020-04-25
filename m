Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 178141B8322
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2020 03:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbgDYBxg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Apr 2020 21:53:36 -0400
Received: from netrider.rowland.org ([192.131.102.5]:34015 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726032AbgDYBxf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Apr 2020 21:53:35 -0400
Received: (qmail 19441 invoked by uid 500); 24 Apr 2020 21:53:34 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 24 Apr 2020 21:53:34 -0400
Date:   Fri, 24 Apr 2020 21:53:34 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Testing endpoint halt support for raw-gadget
In-Reply-To: <CAAeHK+z1O4KgCnxrpD9yvYFUGybNmKPHVEcHetuQHz2J9V4n4w@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2004242118210.17660-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 24 Apr 2020, Andrey Konovalov wrote:

> On Fri, Apr 24, 2020 at 9:36 PM Andrey Konovalov <andreyknvl@google.com> wrote:

> > Hi Alan,
> >
> > I've started working on a test suite for raw-gadget based on the
> > usbtest module as you suggested and have a few questions:
> >
> > 1. (Re test #10:) Currently there's no way to stall USB (control)
> > requests with raw-gadget (which is what happens when you return -EPIPE
> > from gadget's setup() callback AFAIU). Is stalling an important part
> > of the protocol? Should we somehow support it? AFAIU gadgetfs also has
> > no ability to stall requests that are passed to userspace.

Yes, stalling is important, and you do need to support it.  gadgetfs
does have a way to stall requests on ep0 from userspace: just perform
I/O in the "wrong" direction.  If the host sends a control-IN request
and the user does a read of the ep0 file, or if the host sends a
control-OUT request and the user does a write, gadgetfs will call
usb_ep_set_halt.  (However I do not remember how the setup_can_stall
flag is meant to work.)

> > 2. Re test #4: the test fails with length that is not divisible by
> > endpoint's max packet value when using dummy_hcd (assuming that gadget
> > keeps queueing URBs with max packet length), as dummy_hcd's transfer()
> > function sets status to -EOVERFLOW when this happens. Is this
> > expected?

Yes, it is.  If you want to avoid overflow errors, you have to set the
"vary" parameter to a multiple of the bulk-IN endpoint's maxpacket
value and the "length" parameter to a multiple of that.

> > 3. Re test #7: the test fails when e.g. vary parameter is set to some
> > odd value when using dummy_hcd. AFAIU this happens since dummy_hcd
> > doesn't have no_sg_constraint flag set and therefore the sanity check
> > in usb_submit_urb() fails. Is this expected?

No, I don't think so.  Have you tried setting no_sg_constraint?  
Probably we just forgot to do it.

> 4. Re test #13: it seems that both dummy_hcd and the UDC on Raspberry
> Pi Zero handle host driven endpoint halts themselves without any need
> to support them on the gadget side. Thus this test can't really be
> used to test the halt implementation I have for raw-gadget. Are there
> other ways to test it?

Have you tried running the USBCV tests, available from usb.org?  They
need a Windows host to run on but are otherwise pretty straightforward.
If a mass-storage gadget (like g-mass-storage) can pass the USBCV
Mass-Storage test, for example, that's a pretty stringent verification.  

Try them on any userspace gadget drivers you have lying around.

Alan Stern

