Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 546E822DD52
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jul 2020 10:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgGZIh6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Jul 2020 04:37:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:51070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725810AbgGZIh6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 26 Jul 2020 04:37:58 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 544E520714;
        Sun, 26 Jul 2020 08:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595752677;
        bh=ML/f9CAI2HOK9mlkt9dYYLGQRHoLaEEjAuYSeB7bmlk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mlEdWwWOU/S0KshwF0yPRXNlL/nUGMtTU3lSJ17Qg2nG4Hkfq0bNkllLffdYaHc9v
         fxeRu7+cj5xSOzYk/2gbxfB4GubjaeipEXL8F8oRzUEAl9pdbU8yTVNndJ3E6oK/Ti
         L+u7AQGaU8sWlG2ebGWJQNTeUQuSgf8zZXdj/lHA=
Date:   Sun, 26 Jul 2020 10:37:55 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/3] USB: Also check for ->match
Message-ID: <20200726083755.GB448215@kroah.com>
References: <25f9d978b791d25583b18f4b5d0a929e031fec1f.camel@hadess.net>
 <20200725145143.GB1421097@rowland.harvard.edu>
 <5d20f8fa370f3c86dc6cfe73c066bfd7434997d4.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d20f8fa370f3c86dc6cfe73c066bfd7434997d4.camel@hadess.net>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 25, 2020 at 05:14:10PM +0200, Bastien Nocera wrote:
> On Sat, 2020-07-25 at 10:51 -0400, Alan Stern wrote:
> > On Sat, Jul 25, 2020 at 11:14:07AM +0200, Bastien Nocera wrote:
> > > We only ever used a the ID table matching before, but we should
> > > probably
> > > also support an open-coded match function.
> > > 
> > > Fixes: 88b7381a939de ("USB: Select better matching USB drivers when
> > > available")
> > > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > > ---
> > >  drivers/usb/core/generic.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/usb/core/generic.c
> > > b/drivers/usb/core/generic.c
> > > index b6f2d4b44754..2b2f1ab6e36a 100644
> > > --- a/drivers/usb/core/generic.c
> > > +++ b/drivers/usb/core/generic.c
> > > @@ -205,8 +205,9 @@ static int __check_usb_generic(struct
> > > device_driver *drv, void *data)
> > >  	udrv = to_usb_device_driver(drv);
> > >  	if (udrv == &usb_generic_driver)
> > >  		return 0;
> > > -
> > > -	return usb_device_match_id(udev, udrv->id_table) != NULL;
> > > +	if (usb_device_match_id(udev, udrv->id_table) != NULL)
> > > +		return 1;
> > > +	return (udrv->match && udrv->match(udev));
> > >  }
> > >  
> > >  static bool usb_generic_driver_match(struct usb_device *udev)
> > 
> > Acked-by: Alan Stern <stern@rowland.harvard.edu>
> > 
> > You know, at some point it would be nice to change the name of this 
> > function.  __check_usb_generic doesn't explain very well what the 
> > function actually does: It checks to see whether the driver is 
> > non-generic and matches the device.  Something like 
> > check_for_non_generic_match would be a lot better.
> 
> Sure. I'll do a follow-up patch unless there's something requiring a
> respin.
> 
> Greg, there's just the typo in this commit message, all the rest was
> ack'ed. Did you want to take care of that typo, or do you want me to
> respin?

Never make me hand-edit a patch, that ensures it will go to the end of
the line :(

ALso, your patches are not showing up as linked to each other, so they
are all over the place in my mailbox.  Please use something like git
send-email or other tools that will properly link them to ensure I can
see them correctly.

thanks,

greg k-h
