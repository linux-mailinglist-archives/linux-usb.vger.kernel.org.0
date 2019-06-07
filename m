Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF38B38E53
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 17:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729613AbfFGPCp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 11:02:45 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:35028 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728682AbfFGPCp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jun 2019 11:02:45 -0400
Received: (qmail 4174 invoked by uid 2102); 7 Jun 2019 11:02:44 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 7 Jun 2019 11:02:44 -0400
Date:   Fri, 7 Jun 2019 11:02:44 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        USB list <linux-usb@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Pass transfer_buffer to gadget drivers
In-Reply-To: <CAAeHK+xxn1dSJBwBv7g=Mp3e9XARmJwb9JgjLjbDLx0rE+9tew@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1906071056380.1612-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 7 Jun 2019, Andrey Konovalov wrote:

> > > The problem is that I want to receive that data (from the data stage)
> > > from within my gadget driver module. But it's not passed to the
> > > setup() callback. And the question is: how do I do that then?
> >
> > I just caught up on this thread...
> >
> > The answer is simple: The gadget driver's setup() callback routine
> > submits a request for endpoint 0.  The Data Stage data is sent or
> > received (depending on the direction encoded in the Setup information)
> > by this request.
> 
> Ah, OK, got it, thanks!
> 
> Although while looking at the dummy_hcd implementation, I saw that it
> accesses usb->transfer_buffer in case USB_REQ_GET_STATUS in
> handle_control_request(), which is called right before the setup()
> callback is called. So the data already available there without any
> additional requests. Is this an implementation detail that is specific
> to dummy_hcd?

Yes, it is.  dummy-hcd is unusual in that it combines both a USB host
controller and a USB device controller in a single driver.

Normal UDC drivers do handle USB_REQ_GET_STATUS on their own without 
requiring the use of an explicit usb_request, because they handle the 
entire transfer internally and don't involve the gadget driver.  
However, they don't have access to any transfer_buffer; all they can do 
is exchange packets with the host.

Alan Stern

