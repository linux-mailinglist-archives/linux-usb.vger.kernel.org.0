Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 459C9340112
	for <lists+linux-usb@lfdr.de>; Thu, 18 Mar 2021 09:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbhCRIei (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Mar 2021 04:34:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:52266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229512AbhCRIeK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Mar 2021 04:34:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE47264E0C;
        Thu, 18 Mar 2021 08:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616056450;
        bh=iYjlr808wwAeBllRfa8NhdqcGqRsqLViMayFYpq9858=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SVCfutdnYi0alPo3BWcal1TGqvMUZJPiEVkp1QsmBIDSlHrOOy5IgQ9V8Mfq/M7Gc
         sPCwqp9Abygd+J4xMDUqHwRA7l1IJGkgOQFClj+yaOkPxkoyj3Mqu4RtHqZSQEQ4uY
         j34RVUVNW5uQnweCtQAMMDFW2bCs1+cII1ujYZQ4=
Date:   Thu, 18 Mar 2021 09:34:07 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     jiangzhipeng <jzp0409@163.com>
Cc:     linux-usb@vger.kernel.org, "edison.jiang" <jiangzhipeng@yulong.com>
Subject: Re: [PATCH] usb: acpi: Fix shifting 31 bits
Message-ID: <YFMQfxVibUWl7P0L@kroah.com>
References: <20210317142513.1340-1-jzp0409@163.com>
 <YFIXVojHb3LmCOTb@kroah.com>
 <20210318100635.000024c6@163.com>
 <YFLkyTGi6PHc4XMd@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFLkyTGi6PHc4XMd@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 18, 2021 at 06:27:37AM +0100, Greg KH wrote:
> On Thu, Mar 18, 2021 at 10:14:30AM +0800, jiangzhipeng wrote:
> > On Wed, 17 Mar 2021 15:51:02 +0100
> > Greg KH <gregkh@linuxfoundation.org> wrote:
> > 
> > > On Wed, Mar 17, 2021 at 10:25:13PM +0800, jzp0409 wrote:
> > > > From: "edison.jiang" <jiangzhipeng@yulong.com>
> > > > 
> > > > Fix undefined behaviour in the usb apci driver by using 'BIT'
> > > > marcro.  
> > > 
> > > What is undefined about it?
> > > 
> > > > 
> > > > Signed-off-by: edison.jiang <jiangzhipeng@yulong.com>  
> > > 
> > > This name is not a valid signed-off-by name (I doubt you sign
> > > documents with a ".", right?) and it does not match the "From:" name
> > > either, so something needs to be fixed before this patch could be
> > > accepted.
> > > 
> > > > ---
> > > >  drivers/usb/core/usb-acpi.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/usb/core/usb-acpi.c
> > > > b/drivers/usb/core/usb-acpi.c index 50b2fc7..3e467a8 100644
> > > > --- a/drivers/usb/core/usb-acpi.c
> > > > +++ b/drivers/usb/core/usb-acpi.c
> > > > @@ -122,7 +122,7 @@ static enum usb_port_connect_type
> > > > usb_acpi_get_connect_type(acpi_handle handle,
> > > >   * Private to usb-acpi, all the core needs to know is that
> > > >   * port_dev->location is non-zero when it has been set by the
> > > > firmware. */
> > > > -#define USB_ACPI_LOCATION_VALID (1 << 31)
> > > > +#define USB_ACPI_LOCATION_VALID BIT(31)  
> > > 
> > > I do not understand what this is trying to fix, please be more
> > > specific.
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > 
> > cppcheck error:
> > linux/drivers/usb/core/usb-acpi.c:191]: (error) Shifting signed 32-bit
> > value by 31 bits is undefined behaviour
> > 
> 
> That does not explain anything, sorry.

In other words, cppcheck is usually horrid and you need to do some real
work to determine what it is trying to say, and to see if it just is
wrong or not.  Please do that research and if there is a real issue,
submit a patch to resolve it and put that information in the changelog
text to explain what is happening.

As it is, this change doesn't seem to actually do anything except quiet
a random tool.  And that tool is wrong here.

thanks,

greg k-h
