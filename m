Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED0F232041
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jul 2020 16:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbgG2OT4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jul 2020 10:19:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:42254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726449AbgG2OT4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 29 Jul 2020 10:19:56 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 29F6C2070B;
        Wed, 29 Jul 2020 14:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596032395;
        bh=q5J02Y0GAwdfb7s+oGbrd1RWBbsOVu2zuATEhvRfRgI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GT6IPpkY2HGudwn0DaZhkoB6A5VOMnxKaMqNWzUJ68QVcoz+qQOlSZ/75xbNfYog5
         Nvw0lDNyYyeBjMvFMAJj5u/vaA4hieBqGRYZtdyrTqUfHNTrlHe4qvIqzDQQfcNi2C
         odLTJXbevKo5q77GexyAgGGVX4rZjAzJUz4HlXjQ=
Date:   Wed, 29 Jul 2020 16:19:46 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Peter Chen <peter.chen@nxp.com>, Roger Quadros <rogerq@ti.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Adding and removing the same gadget multiple times
Message-ID: <20200729141946.GA2977989@kroah.com>
References: <20200728193246.GD1507946@rowland.harvard.edu>
 <20200729014656.GA17475@b29397-desktop>
 <20200729141448.GB1530967@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729141448.GB1530967@rowland.harvard.edu>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 29, 2020 at 10:14:48AM -0400, Alan Stern wrote:
> On Wed, Jul 29, 2020 at 01:47:20AM +0000, Peter Chen wrote:
> > On 20-07-28 15:32:46, Alan Stern wrote:
> > > Roger:
> > > 
> > > Your commit fac323471df6 ("usb: udc: allow adding and removing the same 
> > > gadget device") from a few years ago just caught my eye.  (I don't 
> > > recall whether I noticed it at the time.)
> > > 
> > > In any case, we need to talk about it.  What you're doing -- 
> > > unregistering and re-registering the struct device embedded in the 
> > > gadget structure -- is strictly forbidden by the kernel's device model. 
> > > It's even mentioned specifically in the kerneldoc for device_add().
> > > 
> > > Now, I guess doing this would be okay _if_ you took care not to 
> > > re-register the device until all references to the previous incarnation 
> > > have been dropped.  In particular, setting the structure's memory to 0 
> > > should not be done immediately after calling device_unregister() -- 
> > > which is what the commit does -- but rather in the release routine.
> > > 
> > > Do you know which UDC drivers actually do re-register their gadgets?  In 
> > > particular, do they have their own release routines or do they rely on 
> > > the default usb_udc_nop_release() provided by the UDC core?
> > 
> > dwc3 and cdns3 gadget driver do that, they use default usb_udc_nop_release()
> > provided by the UDC core. The usb_add_gadget_udc is called when the
> > controller role switch to device mode (the host VBUS is seen at device
> > side), and usb_del_gadget_udc is called when the cable is disconnected
> > from host.
> 
> What if the role switches back to host without the cable being
> disconnected?
> 
> > > Moving the 
> > > memset into that routine ought to be okay; leaving it where it is would 
> > > be a time bomb waiting to go off.  I'm suprised it hasn't caused 
> > > problems already.
> > 
> > I have not seen problem when do hot plug, maybe one second is enough to
> > free all resources for gadget device?
> 
> Maybe.  I don't know what other parts of the kernel might take a
> reference to the gadget's embedded struct device, but it certainly is
> not safe to wipe the struct device memory until the last reference
> has been dropped.  And it is not safe to re-register the gadget until
> the memory has been wiped.
> 
> (It used to be that userspace could keep a reference to a device
> indefinitely, just by holding open one of its sysfs attribute files.
> That may not be true any more, but there may be other ways for
> userspace to accomplish the same thing.)

Yes, this is tricky, and as you point out, 'struct device' should never
be recycled.  This should be fixed up properly or there could be real
problems as you show.

thanks,

greg k-h
