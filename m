Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2735D22DFA5
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jul 2020 16:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbgGZORK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Jul 2020 10:17:10 -0400
Received: from netrider.rowland.org ([192.131.102.5]:49201 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725848AbgGZORJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 Jul 2020 10:17:09 -0400
Received: (qmail 1443029 invoked by uid 1000); 26 Jul 2020 10:17:08 -0400
Date:   Sun, 26 Jul 2020 10:17:08 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/3 v5] USB: Fix device driver race
Message-ID: <20200726141708.GB1442605@rowland.harvard.edu>
References: <ab1fcd9c7e8f4aecd1f709a74a763bcc239fe6c4.camel@hadess.net>
 <20200725145922.GC1421097@rowland.harvard.edu>
 <fa8f94ff5d62b42569b559a10638f952b2037145.camel@hadess.net>
 <20200725195707.GB1426415@rowland.harvard.edu>
 <20200726083655.GA448215@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200726083655.GA448215@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jul 26, 2020 at 10:36:55AM +0200, Greg Kroah-Hartman wrote:
> On Sat, Jul 25, 2020 at 03:57:07PM -0400, Alan Stern wrote:
> > On Sat, Jul 25, 2020 at 05:24:20PM +0200, Bastien Nocera wrote:
> > > On Sat, 2020-07-25 at 10:59 -0400, Alan Stern wrote:
> > > <snip>
> > > > > +	udev = to_usb_device(dev);
> > > > > +	if (usb_device_match_id(udev, new_udriver->id_table) == NULL &&
> > > > > +	    (!new_udriver->match || new_udriver->match(udev) != 0))
> > > > > +		return 0;
> > > > > +
> > > > > +	(void)!device_reprobe(dev);
> > > > 
> > > > What's that '!' doing hiding in there?  It doesn't affect the final 
> > > > outcome, but it sure looks weird -- if people notice it at all.
> > > 
> > > It's how we stop gcc from complaining about the warn_unused_result
> > > attribute on device_reprobe()... (void) is enough with clang, but not
> > > with gcc.
> > 
> > Hmmm.  Maybe this is an indication that device_reprobe() doesn't really 
> > need to be __must_check.
> > 
> > Greg, do you know why it's annotated this way?
> 
> Because you really should pass up the return value if an error happens
> here.  Why do we think it is safe to ignore?
> 
> And that "(void)!" is not ok, if the annotation is safe to ignore, then
> we need to remove the annotation, don't work around stuff like this
> without at the very least, a comment saying why it is ok.

I suppose Bastien could log an error message at that point.  There isn't 
much else to do.

Alan Stern
