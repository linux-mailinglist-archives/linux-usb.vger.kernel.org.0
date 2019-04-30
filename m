Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47E5AF2A0
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 11:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbfD3JQ0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 30 Apr 2019 05:16:26 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:45357 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726165AbfD3JQ0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 05:16:26 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-34-USjcvSGtMuWsnYZLV05f2w-1; Tue, 30 Apr 2019 10:16:22 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b::d117) by AcuMS.aculab.com
 (fd9f:af1c:a25b::d117) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue,
 30 Apr 2019 10:16:21 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Tue, 30 Apr 2019 10:16:21 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Alan Stern' <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>
CC:     "gregKH@linuxfoundation.org" <gregKH@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] UAS: fix alignment of scatter/gather segments
Thread-Topic: [PATCH] UAS: fix alignment of scatter/gather segments
Thread-Index: AQHU/rSuaPqmHe5MjEO6F2S1cXOj3qZUY+mA
Date:   Tue, 30 Apr 2019 09:16:21 +0000
Message-ID: <734e89837b454acea32b990fa2aff902@AcuMS.aculab.com>
References: <1556557130.20085.24.camel@suse.com>
 <Pine.LNX.4.44L0.1904291346170.1632-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1904291346170.1632-100000@iolanthe.rowland.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: USjcvSGtMuWsnYZLV05f2w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Alan Stern
> Sent: 29 April 2019 18:55
> On Mon, 29 Apr 2019, Oliver Neukum wrote:
> 
> > On Mo, 2019-04-29 at 12:08 -0400, Alan Stern wrote:
> > > On Mon, 29 Apr 2019, Oliver Neukum wrote:
> > >
> > > > On Mo, 2019-04-29 at 15:06 +0000, David Laight wrote:
> > >
> > > > But the statement the old comment made are no longer correct.
> > >
> > > Perhaps David would be satisfied if the comment were changed to say
> > > that _some_ USB controller drivers have this unusual alignment
> > > requirement.
> >
> > It would seem to me that every controller that does not do
> > scatter/gather has this requirement. In other words, this is
> > the true requirement of USB. It does not come from the
> > controller. It comes from the protocol's need to not
> > send a short package.

The hardware requirement is that packets that need to be joined
together to make a long request must be 'full'.
In many cases this means a zero length packet must be sent to
correctly terminate a request that is a multiple of the packet size.
Since the software has to add the zero length packet there is
no real difference between a single scatter-gather transmit and
multiple single packet trnasmits.

For USB2 bulk transfers the packet size is 512, and for USB3 1024.
The old comment suggested 2048 for some unsupported interface.

> Are you sure that xHCI has this requirement?  I haven't checked the
> spec.  I know that UHCI, OHCI, and EHCI do need this alignment (and
> OHCI and EHCI do in fact have hardware support for scatter-gather).
> 
> More precisely, what matters is whether the controller is able to merge
> two different DMA segments into a single packet.  UHCI can't.  OHCI and
> EHCI can, but only if the first segment ends at a page boundary and the
> second begins at a page boundary -- it's easier just to say that the
> segments have to be maxpacket-aligned.

XHCI (for USB2 or USB3) can handle almost arbitrary fragments.
There are a couple of annoying restrictions (IIRC):
- Fragments cannot cross a 64k boundary.
  (How much would it cost the hardware to have a 32bit (or even 64bit)
  counter.)
- The 'Link TRB' between ring segments must be aligned to a packet boundary.
I believe the Linux XHCI driver now handles both these cases.
(It hadn't used to - which is why I know anything about USB3 and XHCI.)

I also recall issues with non word aligned buffers for some controllers.

> > The second, old, comment is about controllers.
> 
> Well, if the drivers would use bounce buffers to work around the
> controllers' issues then they wouldn't have this special requirement.
> So it really is a combination of what the hardware can do and what the
> driver can do.

Indeed.
So any comment should refer to what the linux usb drivers requires
of their 'user', not what happens on the USB wire.

It might me that you do end up having to request 1k aligned
buffers for XHCI, but the comment should say that you are
adding a far stronger restriction than that required by the
driver and controller.

Given that XHCI is the most common interface (at least on x86)
if the 1k alignment forces extra bounce buffers in any code
paths it could be a performance issue.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

