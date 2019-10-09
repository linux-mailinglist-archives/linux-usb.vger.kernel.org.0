Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7028CD131D
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 17:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731192AbfJIPk2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 11:40:28 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:49787 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729471AbfJIPk2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 11:40:28 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id ED3CE1BF20F;
        Wed,  9 Oct 2019 15:40:25 +0000 (UTC)
Message-ID: <2bbaeba7abb332aaf9fb521602f7199ba1e77273.camel@hadess.net>
Subject: Re: [PATCH 3/5] USB: Implement usb_device_match_id()
From:   Bastien Nocera <hadess@hadess.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 09 Oct 2019 17:40:25 +0200
In-Reply-To: <Pine.LNX.4.44L0.1910091035260.1603-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1910091035260.1603-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2019-10-09 at 10:36 -0400, Alan Stern wrote:
> On Wed, 9 Oct 2019, Bastien Nocera wrote:
> 
> > Match a usb_device with a table of IDs.
> > 
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > ---
> >  drivers/usb/core/driver.c | 15 +++++++++++++++
> >  include/linux/usb.h       |  2 ++
> >  2 files changed, 17 insertions(+)
> > 
> > diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> > index 863e380a272b..50f92da8afcf 100644
> > --- a/drivers/usb/core/driver.c
> > +++ b/drivers/usb/core/driver.c
> > @@ -800,6 +800,21 @@ const struct usb_device_id
> *usb_match_id(struct usb_interface *interface,
> >  }
> >  EXPORT_SYMBOL_GPL(usb_match_id);
> >  
> > +const struct usb_device_id *usb_device_match_id(struct usb_device
> *udev,
> > +                             const struct usb_device_id *id)
> > +{
> > +     if (!id)
> > +             return NULL;
> > +
> > +     for (; id->idVendor || id->idProduct ; id++) {
> > +             if (usb_match_device(udev, id))
> > +                     return id;
> > +     }
> 
> This would be better if you allowed matching against just the
> idVendor 
> field rather than matching against both.  That would make it a lot 
> simpler to match all Apple devices, for instance.

That should already be possible. The matching code is the same as for
the USB interface drivers.

Something like:
static const struct usb_device_id apple_match[] = {
    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR,
      .idVendor = USB_VENDOR_APPLE
    },
    {}
}

And I couldn't use it in patch 5/5, as that's a range of product IDs,
not all of them (which would be quite a lot more).

