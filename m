Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 880DCC0A7F
	for <lists+linux-usb@lfdr.de>; Fri, 27 Sep 2019 19:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbfI0RiR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Sep 2019 13:38:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:39848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726033AbfI0RiR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Sep 2019 13:38:17 -0400
Received: from localhost (unknown [62.119.166.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C181521655;
        Fri, 27 Sep 2019 17:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569605896;
        bh=4oQDsYqSe8qY3vskdyg1rHrS+L1B5JI0/4ubwm4OOw0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kzh90bn+Aa9Ksw/FAIb/BQsB85keB40URC/xgpo3o7rtLizZoRjUOJfMk2Of2sRwM
         qXJuSwT5/j44qL8SkNSQXwOuVtqB5AmNsawrhNFe4W096EVqYUsGkKw+RNomu9P4Sl
         bsQqpI4/VlTa4tqxefrGOMYF2pfYyp1sAvprEmv8=
Date:   Fri, 27 Sep 2019 19:38:09 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org, benjamin.tissoires@redhat.com
Subject: Re: Driver for something that's neither a device nor an interface
 driver?
Message-ID: <20190927173809.GB1801491@kroah.com>
References: <5e53febe013938d7b878de46a5ef9f18587bd4db.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e53febe013938d7b878de46a5ef9f18587bd4db.camel@hadess.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 27, 2019 at 07:29:52PM +0200, Bastien Nocera wrote:
> Hey,
> 
> I'm trying to write a "power supply" class driver for Apple MFi
> devices, and struggling a little with the USB drivers.
> 
> To ask many Apple devices to draw more power, we need to make a call to
> the device using a vendor command. It doesn't go to an interface, but
> to the device itself.
> 
> The call done in the kernel would look something like:
> usb_control_msg(mfi->udev, usb_sndctrlpipe(mfi->udev, 0), 
>                 0x40, /* Vendor-defined USB get enabled capabilities request. */
>                 USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
>                 current_ma, /* wValue, current offset */
>                 current_ma, /* wIndex, current offset */
>                 NULL, 0, USB_CTRL_GET_TIMEOUT);
> 
> But I can't figure out what type of driver I'd need to just be able to
> export that power_supply interface.
> 
> Trying to use a "struct usb_device_driver" didn't work as probe
> functions were never called, and a "struct usb_driver" gets unbound
> after user-space and the ipheth drivers comes around.

What does the usb descriptors for the device look like?  Is it only the
"default" control endpoint and no interfaces?  What does the output of
'usbdevices' show for the device?

Normally you just bind to the "default" interface for the device, and
all is good, there should be a few other drivers in the tree that do
this, but I can't think of one off the top of my head at the moment.

thanks,

greg k-h
