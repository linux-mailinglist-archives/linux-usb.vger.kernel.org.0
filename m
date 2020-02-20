Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3181660D6
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2020 16:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbgBTPXO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Feb 2020 10:23:14 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:59424 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728295AbgBTPXN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Feb 2020 10:23:13 -0500
Received: (qmail 1524 invoked by uid 2102); 20 Feb 2020 10:23:12 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 20 Feb 2020 10:23:12 -0500
Date:   Thu, 20 Feb 2020 10:23:12 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>
cc:     James <bjlockie@lockie.ca>, <linux-usb@vger.kernel.org>
Subject: Re: USB questions
In-Reply-To: <20200220072745.GA3240818@kroah.com>
Message-ID: <Pine.LNX.4.44L0.2002201015140.1453-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 20 Feb 2020, Greg KH wrote:

> On Wed, Feb 19, 2020 at 04:55:28PM -0500, James wrote:
> > https://asrock.com/MB/AMD/B450M%20Pro4/index.us.asp#Specification
> > - 2 x USB 2.0 Ports (Supports ESD Protection)
> > - 1 x USB 3.1 Gen2 Type-A Port (10 Gb/s) (Supports ESD Protection)
> > - 1 x USB 3.1 Gen2 Type-C Port (10 Gb/s) (Supports ESD Protection)
> > - 4 x USB 3.1 Gen1 Ports (Supports ESD Protection)
> > 
> > $ lsusb
> > Bus 004 Device 002: ID 13fe:6300 Kingston Technology Company Inc. USB DISK
> > 3.0
> > Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> > Bus 003 Device 004: ID 051d:0002 American Power Conversion Uninterruptible
> > Power Supply
> > Bus 003 Device 003: ID 04a9:190f Canon, Inc. CanoScan LiDE 220
> > Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> > Bus 002 Device 002: ID 0bc2:2321 Seagate RSS LLC Expansion Portable
> > Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> > Bus 001 Device 006: ID 1bcf:0005 Sunplus Innovation Technology Inc. Optical
> > Mouse
> > Bus 001 Device 005: ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
> > Bus 001 Device 004: ID 1a40:0101 Terminus Technology Inc. Hub
> > Bus 001 Device 003: ID 046d:082c Logitech, Inc. HD Webcam C615
> > Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> > 
> > $ lsusb -t
> > /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
> >     |__ Port 1: Dev 2, If 0, Class=Mass Storage, Driver=usb-storage, 5000M
> > /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
> >     |__ Port 2: Dev 3, If 0, Class=Vendor Specific Class, Driver=, 480M
> >     |__ Port 4: Dev 4, If 0, Class=Human Interface Device, Driver=usbfs,
> > 1.5M
> > /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
> >     |__ Port 2: Dev 2, If 0, Class=Mass Storage, Driver=uas, 5000M
> > /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 480M
> >     |__ Port 5: Dev 3, If 0, Class=Audio, Driver=snd-usb-audio, 480M
> >     |__ Port 5: Dev 3, If 1, Class=Audio, Driver=snd-usb-audio, 480M
> >     |__ Port 5: Dev 3, If 2, Class=Video, Driver=uvcvideo, 480M
> >     |__ Port 5: Dev 3, If 3, Class=Video, Driver=uvcvideo, 480M
> >     |__ Port 6: Dev 4, If 0, Class=Hub, Driver=hub/4p, 480M
> >         |__ Port 3: Dev 6, If 0, Class=Human Interface Device,
> > Driver=usbhid, 1.5M
> >         |__ Port 1: Dev 5, If 1, Class=Human Interface Device,
> > Driver=usbhid, 1.5M
> >         |__ Port 1: Dev 5, If 0, Class=Human Interface Device,
> > Driver=usbhid, 1.5M
> > 
> > 
> > 1. Does this mean the installer used the USB2 connections on the motherboard
> > even though it looks like USB3.1 Gen ones were available?
> 
> No, why do you say that?
> 
> > 2. What is the number after the slash (4p) on xhci_hcd/4p?
> 
> ports.
> 
> > 3. Shouldn't "Linux Foundation 3.0 root hub" be "Linux Foundation 3.1 Gen 1
> > root hub"?
> 
> No, we don't say that from within the kernel.

But there's no reason we couldn't.  Greg, you could allocate a new
Product ID value for USB-3.1 root hubs and update lsusb to recognize
it.  (I don't know if it's worth including the "Gen 1" vs "Gen 2" part,
though.)

Alan Stern

