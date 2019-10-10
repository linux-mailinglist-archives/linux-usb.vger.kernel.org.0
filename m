Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64937D2A07
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2019 14:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387687AbfJJMxM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Oct 2019 08:53:12 -0400
Received: from smtp1.lauterbach.com ([62.154.241.196]:54527 "EHLO
        smtp1.lauterbach.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387512AbfJJMxM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Oct 2019 08:53:12 -0400
Received: (qmail 1943 invoked by uid 484); 10 Oct 2019 12:53:09 -0000
X-Qmail-Scanner-Diagnostics: from 10.2.10.40 by smtp1.lauterbach.com (envelope-from <ingo.rohloff@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(10.2.10.40):. 
 Processed in 0.3351 secs); 10 Oct 2019 12:53:09 -0000
Received: from unknown (HELO ingpc3.intern.lauterbach.com) (Authenticated_SSL:irohloff@[10.2.10.40])
          (envelope-sender <ingo.rohloff@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <gregkh@linuxfoundation.org>; 10 Oct 2019 12:53:08 -0000
Date:   Thu, 10 Oct 2019 14:53:08 +0200
From:   Ingo Rohloff <ingo.rohloff@lauterbach.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-hotplug@vger.kernel.org
Subject: Re: [PATCH] USB: usbfs: Suppress emission of uevents for interfaces
 handled via usbfs
Message-ID: <20191010130913.5af35519@ingpc3.intern.lauterbach.com>
In-Reply-To: <20191010102411.GA541845@kroah.com>
References: <20191009123829.07eacc7f@ingpc3.intern.lauterbach.com>
        <20191010102411.GA541845@kroah.com>
Organization: Lauterbach GmbH
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Greg

> > +	else {
> > +		/* suppress uevents for devices handled by usbfs */
> > +		dev_set_uevent_suppress(&intf->dev, 1);
> >  		err = usb_driver_claim_interface(&usbfs_driver, intf, ps);
> > +		if (err != 0)  
> > +			dev_set_uevent_suppress(&intf->dev, 0);

> Did checkpatch let this go through?  Shouldn't that be:
> 		if (err)

I actually wanted it the way it is, but it really might not be the best option.
Let me explain:
The main goal was to suppress bind/unbind uevents produced by libusb
or any other user space program which calls
ioctl USBDEVFS_CLAIMINTERFACE/USBDEVFS_RELEASEINTERFACE .

Now I can suppress uevents produced by usb_driver_claim_interface
with the code above.
But I was not sure how to handle the call to usb_driver_release_interface 
from devio.c/releaseintf()

The strategy I used was: 
1) Set suppression of uevents when user space program tries to claim interface
2) If claiming the interface works, then KEEP uevents suppressed,
   otherwise undo suppression.
   That's why its "if err !=0"; error happened => undo suppression.
3) When interface is released make sure suppression is undone AFTER unbinding the driver.

Thinking about your comment: It might be better + simpler to just use
1) Suppress uevents when calling usb_driver_claim_interface. Undo suppression right after the call.
2) Suppress uevents when calling usb_driver_release_interface. Undo suppression right after the call.

The main semantic problem I do not know about: 
Is it correct to modify uevent suppression of an USB interface device 
even if it CANNOT be claimed by usbfs ?
I grepped the source code for usage of dev_set_uevent_suppress, but it seems not to be 100%
clear how that should be used (sometimes uevents are only suppressed temporarily to implement
a delay, sometimes they are actually kept suppressed).

I will prepare/send an alternative.

with best regards
  Ingo

PS:
> ...
> No need for this in the changelog body :)

I should have read the documentation about how to send correct E-Mails for patches more intensively.
I just found out about "git send-email" and had not set it up (did now...). I am sorry.

> And did you send this patch twice?

Unfortunately yes: I was struggling how to format this correctly.
