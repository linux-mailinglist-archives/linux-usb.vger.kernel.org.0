Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D20C312E818
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2020 16:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728662AbgABPbx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jan 2020 10:31:53 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:41572 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728561AbgABPbx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jan 2020 10:31:53 -0500
Received: (qmail 1992 invoked by uid 2102); 2 Jan 2020 10:31:52 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 2 Jan 2020 10:31:52 -0500
Date:   Thu, 2 Jan 2020 10:31:52 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
cc:     "Rene D. Obermueller" <cmdrrdo@gmail.com>,
        <linux-usb@vger.kernel.org>
Subject: Re: ERROR: unexpected command completion code 0x11 for DJ-Tech CTRL
 (resending as plain text ;)
In-Reply-To: <56774185-d171-d63c-5a87-ae8438dcbd0d@linux.intel.com>
Message-ID: <Pine.LNX.4.44L0.2001021024090.1546-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2 Jan 2020, Mathias Nyman wrote:

> On 24.12.2019 17.28, Alan Stern wrote:
> > On Mon, 23 Dec 2019, Mathias Nyman wrote:
> > 
> >> The Maximum Packet Size of the full-speed bulk endpoint looks a bit suspicious (maxp 4)
> >>
> >> 12478.521580: xhci_add_endpoint: State disabled mult 1 max P. Streams 0 interval 125 us max ESIT payload 0 CErr 3 Type Bulk OUT burst 0 maxp 4 deq 00000000fff71001
> >>
> >> For full speed bulk endpoints only support 8, 16, 32 and 64 bytes Max Packet sizes.
> >> Host are not required to support other values. See USB2 spec section 5.8.3 for details
> >>
> >> Maybe forcing it to one of the allowed values could work.
> >> Does the below hack help? (untested)?
> > 
> > Is this the sort of thing we should handle in
> > config.c:usb_parse_endpoint()?
> > 
> > Even though 4 is not a valid maxpacket size for full-speed bulk
> > endpoints, many host controllers and hubs will handle it okay.  Much
> > the same is true for devices that have a high-speed bulk endpoint with
> > maxpacket set to 1024.  Should we try to treat these two errors the
> > same way?
> 
> Makes sense.
> Looks like config.c:usb_parse_endpoint() shows a warning if maxpacket size is incorrect for
> high-speed bulk endpoints, but leaves the maxpacket size unchanged.
> If xhci is used then the xhci driver will later force the maxpacket to 512

Does the driver do this because otherwise the controller will refuse to
handle the endpoint?

There are indeed high-speed devices that have a bulk endpoint with
maxpacket set to 1024; I have used some.  They work okay with EHCI
because the driver and the controller will accept the invalid value.  
But probably they won't work with xHCI.

> I'm all for both checking and forcing maxpacket sizes in usb_parse_endpoint(), but
> is there a risk that we break some devices that used to work. For example full-speed
> bulk devices with maxpacket 4 that work fine under EHCI, but device can't handle
> a new maxpacket size set to 8?

I haven't run across that combination before, so I don't know.  Maybe
the reason it worked okay until now is because those devices never need
to perform a bulk transfer containing more than 4 bytes?

In any case, making this sort of change would definitely break the
1024-byte maxpacket devices mentioned above.

> Or should we only warn in config.c if the maxpacket sizes are not according to specifications,
> and leave it to the host controller drivers to force new maxpacket values?

I think that would be a lot safer.

Alan Stern

