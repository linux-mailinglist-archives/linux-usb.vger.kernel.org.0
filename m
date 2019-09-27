Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68EBFC0BD0
	for <lists+linux-usb@lfdr.de>; Fri, 27 Sep 2019 20:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbfI0S6A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Sep 2019 14:58:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:57362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725790AbfI0S6A (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Sep 2019 14:58:00 -0400
Received: from localhost (unknown [62.119.166.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E9CAA207FF;
        Fri, 27 Sep 2019 18:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569610679;
        bh=wRkSwHWzFRh05/aqmtzFZ7pZY/ylsORvzBi6h7/MRpk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=foLvGXcbpLhCmZmbojIBKDNSZ0lYKOmDorNroBhFx4ijh8VuNcl5xri5mg7KfFF++
         bzVc+yUb67SMqZpw2AGxagUzbTywKZPKeAiBqcBy8taNEf4Vw31r64Ff35MHdlIp3i
         zc6M0rZ9NbD6Encyfni1kSgaV1StJ4MkgKltN2sw=
Date:   Fri, 27 Sep 2019 20:57:55 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org, benjamin.tissoires@redhat.com
Subject: Re: Driver for something that's neither a device nor an interface
 driver?
Message-ID: <20190927185755.GA1808068@kroah.com>
References: <5e53febe013938d7b878de46a5ef9f18587bd4db.camel@hadess.net>
 <20190927173809.GB1801491@kroah.com>
 <e9842d24e72a4995047eede8e47e11db662879d7.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9842d24e72a4995047eede8e47e11db662879d7.camel@hadess.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 27, 2019 at 07:44:08PM +0200, Bastien Nocera wrote:
> On Fri, 2019-09-27 at 19:38 +0200, Greg KH wrote:
> > What does the usb descriptors for the device look like?  Is it only
> > the
> > "default" control endpoint and no interfaces?  What does the output
> > of
> > 'usbdevices' show for the device?
> 
> The device in question can be an iPhone, an iPod Classic/Nano, or an
> iPad, amongst others, and they usually have useful interfaces, such as
> mass storage for the older ones, or ethernet, PTP, etc.

Ah.  Then why do you have to do this from a kernel driver?  Why can't
you do this from userspace?

> > Normally you just bind to the "default" interface for the device, and
> > all is good, there should be a few other drivers in the tree that do
> > this, but I can't think of one off the top of my head at the moment.
> 
> All the interfaces (in the different configurations) are used for
> something in the case of the iPhone 6S I'm trying to use.
> 
> I've attached the output of "lsusb -v" for the device below.

What about interface "9", the "Apple USB Multiplexor"?  What driver
binds to that thing?  It's a vendor-specific protocol, so there
shouldn't be any class driver assigned to it, unlike most of the other
interfaces.

thanks,

greg k-h
