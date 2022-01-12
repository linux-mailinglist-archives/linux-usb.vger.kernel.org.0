Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1447E48C76C
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jan 2022 16:41:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354720AbiALPk6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jan 2022 10:40:58 -0500
Received: from netrider.rowland.org ([192.131.102.5]:49001 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1354711AbiALPkv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jan 2022 10:40:51 -0500
Received: (qmail 235380 invoked by uid 1000); 12 Jan 2022 10:40:49 -0500
Date:   Wed, 12 Jan 2022 10:40:49 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     James <bjlockie@lockie.ca>, linux-usb <linux-usb@vger.kernel.org>
Subject: Re: problem with USB-C
Message-ID: <Yd72gTFL0BsC7vtR@rowland.harvard.edu>
References: <830aa508-5c20-c7c9-5ba9-04bcf5ac7178@lockie.ca>
 <Yd59HLmparwNaok9@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yd59HLmparwNaok9@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 12, 2022 at 08:02:52AM +0100, Greg KH wrote:
> On Tue, Jan 11, 2022 at 07:56:53PM -0500, James wrote:
> > $ lsusb -tv
> > /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
> >     ID 1d6b:0003 Linux Foundation 3.0 root hub
> > /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
> >     ID 1d6b:0002 Linux Foundation 2.0 root hub
> > /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
> >     ID 1d6b:0003 Linux Foundation 3.0 root hub
> > /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 480M
> >     ID 1d6b:0002 Linux Foundation 2.0 root hub
> >     |__ Port 5: Dev 2, If 0, Class=Human Interface Device, Driver=usbhid,
> > 1.5M
> >         ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
> >     |__ Port 5: Dev 2, If 1, Class=Human Interface Device, Driver=usbhid,
> > 1.5M
> >         ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
> >     |__ Port 6: Dev 3, If 0, Class=Human Interface Device, Driver=usbhid,
> > 1.5M
> >         ID 30fa:0400
> > 
> > With my USB3 drive plugged in to the USB-C port which is supposed to be
> > USB3.1.
> > https://asrock.com/MB/AMD/B450M%20Pro4/index.us.asp
> > 
> > $ lsusb -tv
> > /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
> >     ID 1d6b:0003 Linux Foundation 3.0 root hub
> > /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
> >     ID 1d6b:0002 Linux Foundation 2.0 root hub
> > /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
> >     ID 1d6b:0003 Linux Foundation 3.0 root hub
> > /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 480M
> >     ID 1d6b:0002 Linux Foundation 2.0 root hub
> >     |__ Port 1: Dev 4, If 0, Class=Mass Storage, Driver=uas, 480M
> >         ID 0bc2:2321 Seagate RSS LLC Expansion Portable

Is that Seagate storage device really supposed to be USB-3.1?  It is 
connected at only USB-2 speed!  Maybe something is wrong with the drive 
or the cable.

> >     |__ Port 5: Dev 2, If 0, Class=Human Interface Device, Driver=usbhid,
> > 1.5M
> >         ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
> >     |__ Port 5: Dev 2, If 1, Class=Human Interface Device, Driver=usbhid,
> > 1.5M
> >         ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
> >     |__ Port 6: Dev 3, If 0, Class=Human Interface Device, Driver=usbhid,
> > 1.5M
> >         ID 30fa:0400
> > 
> > 
> > Why are the hubs listed as Linux Foundation 3.0 root hubs and not 3.1 root
> > hubs?
> 
> Because your devices do not advertise themselves as a USB 3.1 root hub.
> Perhaps the documentation is incorrect?

No, that's not it at all.

The reason why the root hubs for buses 2 and 4 above are both listed as 
"Linux Foundation 3.0 root hub" is because in hcd.c, the 
usb31_rh_dev_descriptor and usb3_rh_dev_descriptor structures both set 
their idProduct values to 0x03, 0x00 (0x0003 in little-endian form).  
Therefore the hardware database can't distinguish between them.

One possibility would be for the usb31_rh_dev_descriptor to use 0x04, 
0x00 (with the corresponding update to the udev hardware database).  
Another possibility is for the hardware database entry for product 0x0003
to be changed simply to "Linux Foundation USB-3 root hub", so that it 
doesn't specify 3.0, 3.1, or 3.2.

Alan Stern
