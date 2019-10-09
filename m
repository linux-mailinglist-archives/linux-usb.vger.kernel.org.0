Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB1C1D17B6
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 20:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731426AbfJISpH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 14:45:07 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:51708 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728804AbfJISpH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 14:45:07 -0400
Received: (qmail 6161 invoked by uid 2102); 9 Oct 2019 14:45:06 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 9 Oct 2019 14:45:06 -0400
Date:   Wed, 9 Oct 2019 14:45:06 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Bastien Nocera <hadess@hadess.net>
cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH 4/5] USB: Select better matching USB drivers when available
In-Reply-To: <0661117fc2ff5f926443513c6685b72b8f371d14.camel@hadess.net>
Message-ID: <Pine.LNX.4.44L0.1910091435300.1603-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 9 Oct 2019, Bastien Nocera wrote:

> On Wed, 2019-10-09 at 13:28 -0400, Alan Stern wrote:
> <snip>
> > No, that's not quite it.
> > 
> > Here's what should happen when the subclass driver is being probed:
> > First, call the generic_probe routine, and return immediately if that
> > fails.  Then call the subclass driver's probe routine.  If that gets
> > an
> > error, fail the probe call but tell the device core that the device
> > is
> > now bound to the generic driver, not to the subclass driver.
> 
> So, something like that, on top of the existing patches? (I'm not sure
> whether device_driver_attach is the correct call to use here).
> 
> -       if (udriver->probe)
> -               return udriver->probe(udev);
> -       return 0;
> +       if (!udriver->probe)
> +               return 0;

This test is unnecessary; all drivers must have a probe routine.  
Otherwise how would they know when they get bound to a device?

> +       error = udriver->probe(udev);
> +       if (error == -ENODEV &&
> +           udrv != &usb_generic_driver)

No need to test for usb_generic_driver; its probe routine always 
returns 0.  But if you want to include the test anyway, at least don't 
split the line -- it will all fit in under 80 columns.

> +               return device_driver_attach(usb_generic_driver.drvwrap.driver, dev);
> +       return error;

I think that's right.  A little testing wouldn't hurt.

> Anything else in this patch series? I was concerned about the naming
> for "generic_init" in patch 2 ("subclass").

Yes; see the suggestions in

	https://marc.info/?l=linux-usb&m=157063168632242&w=2

Also (I didn't notice this earlier), in patch 1/5 it's not necessary to 
EXPORT the usb_generic_* routines.  They don't get used in the subclass 
driver, only in usbcore.

> If there's nothing, I'll test and respin the patchset with the above
> changes tomorrow.

Okay, good.

Alan Stern

