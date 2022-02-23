Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A86C4C16F7
	for <lists+linux-usb@lfdr.de>; Wed, 23 Feb 2022 16:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242043AbiBWPi2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Feb 2022 10:38:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235281AbiBWPi2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Feb 2022 10:38:28 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 4568ABBE18
        for <linux-usb@vger.kernel.org>; Wed, 23 Feb 2022 07:38:00 -0800 (PST)
Received: (qmail 1010641 invoked by uid 1000); 23 Feb 2022 10:37:59 -0500
Date:   Wed, 23 Feb 2022 10:37:59 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH] usb: core: improve handling of hubs with no ports
Message-ID: <YhZU1/FIO9wWLxLH@rowland.harvard.edu>
References: <994d8963-ca4d-d4cb-a3f6-988d6aa9bcd7@gmail.com>
 <YhWXgyJ4lk8OpT57@rowland.harvard.edu>
 <4701f080-ef18-dbb2-7dd9-d9171a73411f@gmail.com>
 <YhZB9C/xGaoslZzT@rowland.harvard.edu>
 <4f818e25-1c39-b4a3-ed09-370cb4a2c2a7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f818e25-1c39-b4a3-ed09-370cb4a2c2a7@gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 23, 2022 at 03:58:35PM +0100, Heiner Kallweit wrote:
> On 23.02.2022 15:17, Alan Stern wrote:
> > On Wed, Feb 23, 2022 at 01:26:23PM +0100, Heiner Kallweit wrote:
> >> On 23.02.2022 03:10, Alan Stern wrote:
> >>> On Tue, Feb 22, 2022 at 10:13:09PM +0100, Heiner Kallweit wrote:
> >>>>
> >>>> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> >>>> index 83b5aff25..e3f40d1f4 100644
> >>>> --- a/drivers/usb/core/hub.c
> >>>> +++ b/drivers/usb/core/hub.c
> >>>> @@ -1423,9 +1423,8 @@ static int hub_configure(struct usb_hub *hub,
> >>>>  		ret = -ENODEV;
> >>>>  		goto fail;
> >>>>  	} else if (hub->descriptor->bNbrPorts == 0) {
> >>>> -		message = "hub doesn't have any ports!";
> >>>> -		ret = -ENODEV;
> >>>> -		goto fail;
> >>>> +		dev_info(hub_dev, "hub has no ports, exiting\n");
> >>>> +		return -ENODEV;
> >>>>  	}
> >>>>  
> >>>>  	/*
> >>>
> >>> How about instead changing xhci-hcd so that it doesn't try to register 
> >>> a USB-3 root hub if the controller doesn't have any USB-3 ports?  I 
> >>> think that would make more sense.
> >>>
> >> Right, this would be better. I checked and it seems to be a little bit
> >> bigger endeavor. If I let register_root_hub() fail, then this removes
> >> the USB3 bus/host (shared hcd), but also the USB2 bus/host.
> >> It took an additional change to xhci_plat_probe() to make it work on my
> >> system. Not sure what the impact could be on systems not using
> >> xhci_plat_probe(). Users may face the same issue like me, and having
> >> a USB3 hub with no ports may remove also the USB2 bus/host.
> > 
> > Don't change register_root_hub().  Just change xhci_plat_probe(); make 
> > it skip the second call to usb_add_hcd() if there are no USB-3 ports.
> > 
> How would I know the number of USB-3 ports before calling usb_add_hcd()?
> get_hub_descriptor() can be called only later in usb_add_hcd().

Where do you think get_hub_descriptor() gets that information from?
It's stored in xhci->usb3_rhub.num_ports.

(Now, because I'm not very familiar with the xhci-hcd driver, I can't 
tell you whether xhci->usb3_rhub.num_ports gets initialized before or 
after the usb_add_hcd() call for the shared_hcd.  You'll have to figure 
that out yourself.)

Alan Stern
