Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4029460D94
	for <lists+linux-usb@lfdr.de>; Sat,  6 Jul 2019 00:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728251AbfGEWBe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jul 2019 18:01:34 -0400
Received: from gate.crashing.org ([63.228.1.57]:40935 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725884AbfGEWBe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Jul 2019 18:01:34 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x65M1HGt013708;
        Fri, 5 Jul 2019 17:01:18 -0500
Message-ID: <15f6a7e8cbe534cbc4f647f6f99cdef80a7b01ad.camel@kernel.crashing.org>
Subject: Re: Virtual hub, resets etc...
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Michal Nazarewicz <mina86@mina86.com>
Date:   Sat, 06 Jul 2019 08:01:17 +1000
In-Reply-To: <Pine.LNX.4.44L0.1907051005410.1606-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1907051005410.1606-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2019-07-05 at 10:08 -0400, Alan Stern wrote:
> On Fri, 5 Jul 2019, Benjamin Herrenschmidt wrote:
> 
> > > > > As for f_mass_storage, repeatedly attempting to queue an OUT transfer
> > > > > is normal behavior.  The fact that one attempt gets an error doesn't
> > > > > stop the driver from making more attempts; the only thing that would
> > > > > stop it is being disabled by a config change, a suspend, a disconnect,
> > > > > or an unbind.
> > > > 
> > > > Except it does that in a tight loop and locks up the machine...
> > > 
> > > Well, that wouldn't happen if your UDC accepted the requests, right?  
> > 
> > Sure but it would be nice if the mass storage dealt with -ESHUTDOWN
> > properly and stopped :-) Or other errors... if the UDC HW for example
> > dies for some reason, mass storage will lockup.
> 
> I suppose we could add code to check for this case and handle it, 
> although I'm not sure what would be the right thing to do.  Delay for 
> one second and try again?  Disable the gadget until the host does a 
> reset?

I think just stop it until the next reset yes.

> > > Besides, f_mass_storage won't repeatedly try to queue an OUT transfer 
> > > once it knows that it is suspended.
> > 
> > Not afaik. But I might have missed something. I didn't see any suspend
> > callback in f_mass_storage.c...
> 
> Oops, right.  Sorry about that; my memory is slowly decaying.  I need
> to upgrade my brain's RAM...

Haha, I wish I didn't have that problem too :)

Cheers,
Ben.


