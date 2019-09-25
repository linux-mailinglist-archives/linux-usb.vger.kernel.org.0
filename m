Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22CC0BDFE7
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2019 16:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730342AbfIYOUB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Sep 2019 10:20:01 -0400
Received: from netrider.rowland.org ([192.131.102.5]:56001 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726481AbfIYOUA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Sep 2019 10:20:00 -0400
Received: (qmail 15813 invoked by uid 500); 25 Sep 2019 10:20:00 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 25 Sep 2019 10:20:00 -0400
Date:   Wed, 25 Sep 2019 10:20:00 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     David Heinzelmann <heinzelmann.david@gmail.com>
cc:     Greg KH <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] Check for changed device descriptors when a connection-change
 occurs before validating the connection.
In-Reply-To: <20190924100119.GA7353@dhe-pc>
Message-ID: <Pine.LNX.4.44L0.1909251010290.14432-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 24 Sep 2019, David Heinzelmann wrote:

> > I really don't understand this.
> > 
> > Your patch involves the case where there was a connect-change event but 
> > the port is still enabled.  Now maybe I've forgotten about one of the 
> > pathways, but it seems like that combination should never occur.
> > 
> > Certainly it shouldn't occur in your case.  The device disconnects and 
> > then reconnects with a new set of descriptors.  The disconnect should 
> > cause the port to be disabled, and the port should remain disabled 
> > after the reconnect occurs.  So how can your new code run in the first 
> > place?
> > 
> > Alan Stern
> > 
> 
> Hi,
> 
> I have a log with two devices which are connected to a hub and the hub is plugged in. 
> 
> The device which is not working in this log:
> 
> Sep 24 08:32:21 kernel: usb 2-6-port1: status 0203 change 0011
> Sep 24 08:32:21 kernel: usb 2-6.1: new SuperSpeed Gen 1 USB device number 65 using xhci_hcd

Ah, SuperSpeed.  You're using a USB-3 device.  That does make a
difference.

> Sep 24 08:32:21 kernel: usb 2-6.1: udev 65, busnum 2, minor = 192
> Sep 24 08:32:21 kernel: usb 2-6.1: New USB device found, idVendor=1409, idProduct=3240, bcdDevice= 0.00
> Sep 24 08:32:21 kernel: usb 2-6.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> Sep 24 08:32:21 kernel: usb 2-6.1: Product: USB 3.0 Camera
> Sep 24 08:32:21 kernel: usb 2-6.1: Manufacturer: Camera Manufacturer
> 
> Now the firmware download happens and the device is re-enumerating and a disconnect/connect should occur.
> But the only change which is seen is the following output:
> 
> Sep 24 08:32:23 kernel: usb 2-6-port1: link state change
> Sep 24 08:32:23 kernel: usb 2-6-port1: status 0203, change 0041, 5.0 Gb/s
> 
> Now the resuscitation is happening but from my understanding this is not correct as in the reality there was a
> reconnect from the device. So I tried to initiate a device reconnect if the device descriptor changed.
> 
> It also seems to me that the enumeration from the second device (usb 2-6-port1) is blocking 
> the port change event and so the actual disconnect is missed.

Now it all makes sense.  Yes, I agree that your patch is the
appropriate thing to do -- except that it contains at least one logic
error: It doesn't handle the return code from
usb_get_device_descriptor() properly.

Also, I think you should expand the immediately preceding comment.  
Explain that it is indeed possible for the port to be enabled at this
point, because USB-3 connections are initialized automatically by the
host controller hardware when the connection is detected.

Alan Stern

