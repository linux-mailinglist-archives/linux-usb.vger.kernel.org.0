Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46B72FB3D4
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2019 16:39:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727934AbfKMPjS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Nov 2019 10:39:18 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:41318 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726335AbfKMPjS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Nov 2019 10:39:18 -0500
Received: (qmail 2537 invoked by uid 2102); 13 Nov 2019 10:39:17 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 13 Nov 2019 10:39:17 -0500
Date:   Wed, 13 Nov 2019 10:39:17 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Michael Olbrich <m.olbrich@pengutronix.de>
cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 2/2] usb: dwc3: gadget: restart the transfer if a isoc
 request is queued too late
In-Reply-To: <20191113075308.qwwgpg7kpfcyjxau@pengutronix.de>
Message-ID: <Pine.LNX.4.44L0.1911131036340.1558-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 13 Nov 2019, Michael Olbrich wrote:

> On Wed, Nov 13, 2019 at 03:55:01AM +0000, Thinh Nguyen wrote:
> > Michael Olbrich wrote:
> > > Currently, most gadget drivers handle isoc transfers on a best effort
> > > bases: If the request queue runs empty, then there will simply be gaps in
> > > the isoc data stream.
> > >
> > > The UVC gadget depends on this behaviour. It simply provides new requests
> > > when video frames are available and assumes that they are sent as soon as
> > > possible.
> > >
> > > The dwc3 gadget currently works differently: It assumes that there is a
> > > contiguous stream of requests without any gaps. If a request is too late,
> > > then it is dropped by the hardware.
> > > For the UVC gadget this means that a live stream stops after the first
> > > frame because all following requests are late.
> > 
> > Can you explain little more how UVC gadget fails?
> > dwc3 controller expects a steady stream of data otherwise it will result 
> > in missed_isoc status, and it should be fine as long as new requests are 
> > queued. The controller doesn't just drop the request unless there's some 
> > other failure.
> 
> UVC (with a live stream) does not fill the complete bandwidth of an
> isochronous endpoint. Let's assume for the example that one video frame
> fills 3 requests. Because it is a live stream, there will be a gap between
> video frames. This is unavoidable, especially for compressed video. So the
> UVC gadget will have requests for the frame numbers 1 2 3 5 6 7 9 10 11 13 14
> 15 and so on.
> The dwc3 hardware tries to send those with frame numbers 1 2 3 4 5 6 7 8 9
> 10 11 12. So except for the fist few requests, all are late and result in a
> missed_isoc. I tried to just ignore the missed_isoc but that did not work
> for me. I only received the first frame at the other end.
> Maybe I missing something here, i don't have access to the hardware
> documentation, so I can only guess from the existing driver.

How about changing the gadget driver instead?  For frames where the UVC
gadget knows no video frame data is available (numbers 4, 8, 12, and so
on in the example above), queue a zero-length request.  Then there
won't be any gaps in the isochronous packet stream.

Alan Stern

