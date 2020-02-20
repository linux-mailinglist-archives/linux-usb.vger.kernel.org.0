Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC271669B3
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2020 22:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbgBTVQs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Feb 2020 16:16:48 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:41570 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727721AbgBTVQs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Feb 2020 16:16:48 -0500
Received: (qmail 14801 invoked by uid 2102); 20 Feb 2020 16:16:47 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 20 Feb 2020 16:16:47 -0500
Date:   Thu, 20 Feb 2020 16:16:47 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Belisko Marek <marek.belisko@gmail.com>
cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>
Subject: Re: functionfs gadget with multiple endpoints
In-Reply-To: <CAAfyv35O2FFsvDSAv7r+GOTg=24-K-3eRPJTifWHFQFafX=DHQ@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2002201612500.1311-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 20 Feb 2020, Belisko Marek wrote:

> hi Alan,
> 
> On Thu, Feb 20, 2020 at 4:26 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Thu, 20 Feb 2020, Belisko Marek wrote:
> >
> > > Hi,
> > >
> > > I'm playing with functionfs and use configfs + functionfs + ffs-test
> > > from kernel to test connection between my device and host. ffs-test
> > > example provide 1 configuration with 1 interface and with 2 bulk
> > > endpoints.
> > >
> > > I'm writing application which will write/read data to usb device but
> > > can be accessed from other multiple application. I'm planning to write
> > > kind of gatekeeper which will serialize data to endpoint and notify
> > > reader about received data.
> > >
> > > I was thinking about other possibility to extend gadget to provide
> > > more endpoints (like 2). I was able to extend ffs-test and also I can
> > > send/receive data (using libusb) over original endpoints but not over
> > > new created one (I've run 2 instances of same application which
> > > basically create transfers for 2 different endpoints) but when running
> > > second application I got this error:
> > >
> > > libusb: error [submit_bulk_transfer] submiturb failed error -1 errno=16
> > > libusb: error [submit_bulk_transfer] submiturb failed error -1 errno=16
> >
> > Only one program at a time can claim an interface, and submitting an
> > URB to an endpoint automatically claims the endpoint's interface.
> >
> > > I'm not USB expert but multiple endpoint should be possible (maybe I
> > > need to put them to other interface?-> tried that also but got same
> > > error as above with errno=2). Thanks for any pointers and advice.
> >
> > errno=16 and errno=2 are different errors, not the same error.
> > Putting the endpoints in different interfaces should work; you probably
> > have a bug somewhere in your code.
> To clarify  it a bit. I have test program which basically
> asynchronously sends buffer to bulk endpoint.
> Then as said if start second program I got errno=16 which means busy
> as other program already occupy endpoint so this is clear.
> But when extend ffs-test in this way https://pastebin.com/xymtDuJj
> using lsusb I can see:
> 
>  Bus 001 Device 010: ID 1d6b:0104 Linux Foundation Multifunction
> Composite Gadget
> Couldn't open device, some information will be missing
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass            0 (Defined at Interface level)
>   bDeviceSubClass         0
>   bDeviceProtocol         0
>   bMaxPacketSize0        64
>   idVendor           0x1d6b Linux Foundation
>   idProduct          0x0104 Multifunction Composite Gadget
>   bcdDevice            4.12
>   iManufacturer           1
>   iProduct                2
>   iSerial                 3
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength           32
>     bNumInterfaces          1
>     bConfigurationValue     1
>     iConfiguration          4
>     bmAttributes         0x80
>       (Bus Powered)
>     MaxPower                2mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           2
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      0
>       bInterfaceProtocol      0
>       iInterface              5
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x01  EP 1 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               1
>  Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           2
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      0
>       bInterfaceProtocol      0
>       iInterface              5
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x02  EP 2 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               1
> 
> When use same program as before but writing to EP 2 OUT I got error 2.

Did you check the kernel log on the host after plugging in the USB 
cable?  There ought to be a complaint about multiple interface 
descriptors for interface 0 altsetting 0.

> Also one thing I noticed is that bNumInterfaces still shows 1 (even I
> have 2 interface descriptors) and not 2 as I would expect.

Yes, I noticed that too.  In addition, the second interface has 
bInterfaceNumber set to 0, not 1.

> Is there something I'm doing wrong or maybe it can be bug in ffs code?

I don't know the ffs code.  However I guess it's probably something 
you're doing wrong.  Maybe the incorrect bInterfaceNumber is the cause.

> Is there any drawback of using multiple endpoints in overall transfer speed?

No.  The available bandwidth gets shared between them as needed.

Alan Stern

