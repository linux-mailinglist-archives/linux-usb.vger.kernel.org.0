Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE6B360768
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2019 16:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727620AbfGEOIt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jul 2019 10:08:49 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:46826 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726061AbfGEOIs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Jul 2019 10:08:48 -0400
Received: (qmail 1674 invoked by uid 2102); 5 Jul 2019 10:08:47 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 5 Jul 2019 10:08:47 -0400
Date:   Fri, 5 Jul 2019 10:08:47 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>
cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Michal Nazarewicz <mina86@mina86.com>
Subject: Re: Virtual hub, resets etc...
In-Reply-To: <03595b660f319d5fb958ccbacbfe51002bff2314.camel@kernel.crashing.org>
Message-ID: <Pine.LNX.4.44L0.1907051005410.1606-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 5 Jul 2019, Benjamin Herrenschmidt wrote:

> > > > As for f_mass_storage, repeatedly attempting to queue an OUT transfer
> > > > is normal behavior.  The fact that one attempt gets an error doesn't
> > > > stop the driver from making more attempts; the only thing that would
> > > > stop it is being disabled by a config change, a suspend, a disconnect,
> > > > or an unbind.
> > > 
> > > Except it does that in a tight loop and locks up the machine...
> > 
> > Well, that wouldn't happen if your UDC accepted the requests, right?  
> 
> Sure but it would be nice if the mass storage dealt with -ESHUTDOWN
> properly and stopped :-) Or other errors... if the UDC HW for example
> dies for some reason, mass storage will lockup.

I suppose we could add code to check for this case and handle it, 
although I'm not sure what would be the right thing to do.  Delay for 
one second and try again?  Disable the gadget until the host does a 
reset?

> > Besides, f_mass_storage won't repeatedly try to queue an OUT transfer 
> > once it knows that it is suspended.
> 
> Not afaik. But I might have missed something. I didn't see any suspend
> callback in f_mass_storage.c...

Oops, right.  Sorry about that; my memory is slowly decaying.  I need
to upgrade my brain's RAM...

Alan Stern

