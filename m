Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18EEC241F80
	for <lists+linux-usb@lfdr.de>; Tue, 11 Aug 2020 20:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgHKSBk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Aug 2020 14:01:40 -0400
Received: from netrider.rowland.org ([192.131.102.5]:48089 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726023AbgHKSBk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Aug 2020 14:01:40 -0400
Received: (qmail 342208 invoked by uid 1000); 11 Aug 2020 14:01:39 -0400
Date:   Tue, 11 Aug 2020 14:01:39 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Eli Billauer <eli.billauer@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: [RFC]mooring API
Message-ID: <20200811180139.GA342144@rowland.harvard.edu>
References: <1596722827.2488.8.camel@suse.com>
 <20200806152039.GC197575@rowland.harvard.edu>
 <1597070118.2515.3.camel@suse.com>
 <20200810151723.GE299045@rowland.harvard.edu>
 <1597167552.28022.4.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1597167552.28022.4.camel@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 11, 2020 at 07:39:12PM +0200, Oliver Neukum wrote:
> Am Montag, den 10.08.2020, 11:17 -0400 schrieb Alan Stern:
> > On Mon, Aug 10, 2020 at 04:35:18PM +0200, Oliver Neukum wrote:
> 
> > 
> > You mean, the URB could have been anchored already, but another CPU 
> > could moor it just as this CPU is unachoring it?
> 
> I was worrying about accidental unanchoring of a moored URB, actually.
> 
> > For one thing, I doubt that a single smp_rmb() will provide any real 
> > protection.  For another, it would be best to just avoid races in the 
> > first place.  Can you think of any use case where it makes sense to moor 
> > an URB just as it is completing (or indeed at any time while it is 
> > active)?
> 
> No, I am removing it.
> 
> 
> > I should have said: require drivers that want to unmoor an URB to do so 
> > either before it is submitted or in (or after) the completion handler.  
> > In other words, don't moor or unmoor an URB while it is active.  How 
> > about that?
> 
> Entirely reasonable.
> 
> > > What do you think of the API itself?
> > 
> > It looks fine as far as I can tell.  But I haven't worked on any drivers 
> > that use anchors.
> 
> Writing decent documentation for that is actually hard. Any sugestions?

In the kerneldoc for usb_moor_urb and usb_unmoor_urb, mention that to 
avoid races, URBs should be moored or unmoored only when they are not 
active: before they are submitted, in the completion handler routine, or 
after the completion handler has run.

You'll have to figure out a good way of explaining the advantages of 
forcing drivers to do their own unmooring.  Maybe urb_destroy() should 
check for URBs that are still moored.

Alan Stern
