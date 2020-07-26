Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7760122DD51
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jul 2020 10:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgGZIhO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Jul 2020 04:37:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:50764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725848AbgGZIhO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 26 Jul 2020 04:37:14 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 23517206E3;
        Sun, 26 Jul 2020 08:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595752633;
        bh=YVrX0fjLkypC7ddVmCMuGRAIn/E2H8OAJJh5MC2i+/o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RpZTvuJ9vDpimJwNIFkPwxDqB/lpWQPl15BUldDkFf/WXOv0rVxlHwRsVp8bt+UDx
         67pAqEzLwVyCCLufDWqRKZK5k/GrI2p1HoLIDvISkezGsmBv/yxpSfXFyQU2VBGO4m
         ra7qtm+kb9fYdvDks8fDzBvVU5y7EhFr0FAoPcw0=
Date:   Sun, 26 Jul 2020 10:36:55 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/3 v5] USB: Fix device driver race
Message-ID: <20200726083655.GA448215@kroah.com>
References: <ab1fcd9c7e8f4aecd1f709a74a763bcc239fe6c4.camel@hadess.net>
 <20200725145922.GC1421097@rowland.harvard.edu>
 <fa8f94ff5d62b42569b559a10638f952b2037145.camel@hadess.net>
 <20200725195707.GB1426415@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200725195707.GB1426415@rowland.harvard.edu>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 25, 2020 at 03:57:07PM -0400, Alan Stern wrote:
> On Sat, Jul 25, 2020 at 05:24:20PM +0200, Bastien Nocera wrote:
> > On Sat, 2020-07-25 at 10:59 -0400, Alan Stern wrote:
> > <snip>
> > > > +	udev = to_usb_device(dev);
> > > > +	if (usb_device_match_id(udev, new_udriver->id_table) == NULL &&
> > > > +	    (!new_udriver->match || new_udriver->match(udev) != 0))
> > > > +		return 0;
> > > > +
> > > > +	(void)!device_reprobe(dev);
> > > 
> > > What's that '!' doing hiding in there?  It doesn't affect the final 
> > > outcome, but it sure looks weird -- if people notice it at all.
> > 
> > It's how we stop gcc from complaining about the warn_unused_result
> > attribute on device_reprobe()... (void) is enough with clang, but not
> > with gcc.
> 
> Hmmm.  Maybe this is an indication that device_reprobe() doesn't really 
> need to be __must_check.
> 
> Greg, do you know why it's annotated this way?

Because you really should pass up the return value if an error happens
here.  Why do we think it is safe to ignore?

And that "(void)!" is not ok, if the annotation is safe to ignore, then
we need to remove the annotation, don't work around stuff like this
without at the very least, a comment saying why it is ok.

thanks,

greg k-h
