Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4523622D866
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 17:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbgGYPON (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 11:14:13 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:35579 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgGYPOM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 11:14:12 -0400
X-Originating-IP: 82.255.60.242
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id F0B55C0004;
        Sat, 25 Jul 2020 15:14:10 +0000 (UTC)
Message-ID: <5d20f8fa370f3c86dc6cfe73c066bfd7434997d4.camel@hadess.net>
Subject: Re: [PATCH 2/3] USB: Also check for ->match
From:   Bastien Nocera <hadess@hadess.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date:   Sat, 25 Jul 2020 17:14:10 +0200
In-Reply-To: <20200725145143.GB1421097@rowland.harvard.edu>
References: <25f9d978b791d25583b18f4b5d0a929e031fec1f.camel@hadess.net>
         <20200725145143.GB1421097@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 2020-07-25 at 10:51 -0400, Alan Stern wrote:
> On Sat, Jul 25, 2020 at 11:14:07AM +0200, Bastien Nocera wrote:
> > We only ever used a the ID table matching before, but we should
> > probably
> > also support an open-coded match function.
> > 
> > Fixes: 88b7381a939de ("USB: Select better matching USB drivers when
> > available")
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > ---
> >  drivers/usb/core/generic.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/core/generic.c
> > b/drivers/usb/core/generic.c
> > index b6f2d4b44754..2b2f1ab6e36a 100644
> > --- a/drivers/usb/core/generic.c
> > +++ b/drivers/usb/core/generic.c
> > @@ -205,8 +205,9 @@ static int __check_usb_generic(struct
> > device_driver *drv, void *data)
> >  	udrv = to_usb_device_driver(drv);
> >  	if (udrv == &usb_generic_driver)
> >  		return 0;
> > -
> > -	return usb_device_match_id(udev, udrv->id_table) != NULL;
> > +	if (usb_device_match_id(udev, udrv->id_table) != NULL)
> > +		return 1;
> > +	return (udrv->match && udrv->match(udev));
> >  }
> >  
> >  static bool usb_generic_driver_match(struct usb_device *udev)
> 
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> 
> You know, at some point it would be nice to change the name of this 
> function.  __check_usb_generic doesn't explain very well what the 
> function actually does: It checks to see whether the driver is 
> non-generic and matches the device.  Something like 
> check_for_non_generic_match would be a lot better.

Sure. I'll do a follow-up patch unless there's something requiring a
respin.

Greg, there's just the typo in this commit message, all the rest was
ack'ed. Did you want to take care of that typo, or do you want me to
respin?

Cheers

