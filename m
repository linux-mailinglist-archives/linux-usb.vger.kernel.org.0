Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD47D5A324
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2019 20:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbfF1SHQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jun 2019 14:07:16 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:46676 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725783AbfF1SHQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jun 2019 14:07:16 -0400
Received: (qmail 4946 invoked by uid 2102); 28 Jun 2019 14:07:15 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 28 Jun 2019 14:07:15 -0400
Date:   Fri, 28 Jun 2019 14:07:15 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        USB list <linux-usb@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Pass transfer_buffer to gadget drivers
In-Reply-To: <CAAeHK+wVdjCein2rtWVYTq5Cp9jf0pcVSEvyWHYKDEh78-1xrg@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1906281403020.1335-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 28 Jun 2019, Andrey Konovalov wrote:

> On Fri, Jun 28, 2019 at 6:44 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> >
> > On Tue, Jun 18, 2019 at 3:53 PM Alan Stern <stern@rowland.harvard.edu> wrote:

...

> > > > > Another question: do I understand correctly, that we only proceed with
> > > > > submitting an URB to get the data for the control OUT request
> > > > > (ctrl->bRequestType doesn't have the USB_DIR_IN bit set) if
> > > > > ctrl->wLength != 0?
> > >
> > > That's right.  If a control-OUT transfer has wLength == 0, it means
> > > there is no data stage.  (And control-IN transfers are not allowed to
> > > have wLength == 0.)
> >
> > And another one to clarify :)
> >
> > So if we got a setup() callback, which denotes:
> > 1. an IN transfer, we need to submit an URB with response (even if
> > wLength == 0). When it completes, the transaction is over, and we will
> > get the next setup() callback (if there's going to be any).

Yes, except that wLength should never be 0 for an IN transfer.  If it 
is, it's a bug in the host.

> > 2. an OUT transfer, we need to submit an URB to fetch the data (even
> > if wLength == 0).
> 
> Or more like: to fetch the data when wLength != 0 and to acknowledge
> the request when wLength == 0.
> 
> > When it completes, the transaction is over, and we
> > will get the next setup() callback (if there's going to be any).
> >
> > Is the above correct?

Correct.

There has been some discussion (and a few patches posted) about
modifying this approach.  But for now, this is the way to do it.

Alan Stern

