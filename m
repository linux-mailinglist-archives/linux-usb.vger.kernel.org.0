Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 384CC28683C
	for <lists+linux-usb@lfdr.de>; Wed,  7 Oct 2020 21:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728244AbgJGTZn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Oct 2020 15:25:43 -0400
Received: from netrider.rowland.org ([192.131.102.5]:53449 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728198AbgJGTZn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Oct 2020 15:25:43 -0400
Received: (qmail 469681 invoked by uid 1000); 7 Oct 2020 15:25:42 -0400
Date:   Wed, 7 Oct 2020 15:25:42 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Doug Anderson <dianders@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Stephen Boyd <swboyd@chromium.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: Add binding for discrete
 onboard USB hubs
Message-ID: <20201007192542.GA468921@rowland.harvard.edu>
References: <CAD=FV=XkV2eGuPhpo-v4bYy12DVNtDAtjyzpKs7r6SOUZf6-sg@mail.gmail.com>
 <20201006004510.GD4135817@google.com>
 <20201006141820.GA416765@rowland.harvard.edu>
 <20201006165957.GA191572@google.com>
 <20201006171524.GB423499@rowland.harvard.edu>
 <20201006192536.GB191572@google.com>
 <20201007010023.GA438733@rowland.harvard.edu>
 <20201007160336.GA620323@google.com>
 <20201007163838.GA457977@rowland.harvard.edu>
 <20201007172847.GB620323@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007172847.GB620323@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 07, 2020 at 10:28:47AM -0700, Matthias Kaehlcke wrote:
> On Wed, Oct 07, 2020 at 12:38:38PM -0400, Alan Stern wrote:
> > On Wed, Oct 07, 2020 at 09:03:36AM -0700, Matthias Kaehlcke wrote:
> > > Ok, I wasn't sure if the hubs suspend asynchronously from each other. If they
> > > do it should indeed not be a problem to have the "master" wait for its peers.
> > 
> > Well, order of suspending is selectable by the user.  It can be either 
> > asynchronous or reverse order of device registration, which might pose a 
> > problem.  We don't know in advance which of two peer hubs will be 
> > registered first.  It might be necessary to introduce some additional 
> > explicit synchronization.
> 
> I'm not sure we are understanding each other completely. I agree that
> synchronization is needed to have the primary hub wait for its peers, that
> was one of my initial concerns.
> 
> Lets use an example to clarify my secondary concern: a hub chip provides a
> USB 3 and a USB 2 hub, lets say the USB 3 hub is the primary.
> 
> Here is some pseudo-code for the suspend function:
> 
> hub_suspend(hub)
>   ...
> 
>   if (hub->primary) {
>     device_pm_wait_for_dev(hub->peer)
> 
>     // check for connected devices and turn regulator off
>   }
> 
>   ...
> }
> 
> What I meant with 'asynchronous suspend' in this context:
> 
> Can hub_suspend() of the peer hub be executed (asynchronously) while the
> primary is blocked on device_pm_wait_for_dev(),

Yes, that's exactly what would happen with async suspend.

>  or would the primary wait
> forever if the peer hub isn't suspended yet?

That wouldn't happen.  device_pm_wait_for_dev is smart; it will return 
immediately if neither device uses async suspend.  But in that case you 
could end up removing power from the peer hub before it had suspended.

That's why I said you might need to add additional synchronization.  The 
suspend routines for the two hubs could each check to see whether the 
other device had suspended yet, and the last one would handle the power 
regulator.  The additional synchronization is for the case where the two 
checks end up being concurrent.

> > > > And hubs would need to know their peers in any case, because you have to
> > > > check if any devices attached to the peer have wakeup enabled.
> > > 
> > > My concern was about all hubs (including 'secondaries') having to know their
> > > peers and check on each other, in the scenario we are now talking about only
> > > the "master" hub needs to know and check on its peers, which is fine.
> > 
> > Not all hubs would need this.  Only ones marked in DT as having a power 
> > regulator.
> 
> Sure, as long as the primary (with a power regulator) can wait for its peers
> to suspend without the risk of blocking forever (my doubt above).

If we take this approach, we'll have to give up on the idea that the 
primary can always suspend after the peer.

Alan Stern
