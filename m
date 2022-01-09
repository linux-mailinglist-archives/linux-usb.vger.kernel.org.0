Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4F48488761
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jan 2022 03:44:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235085AbiAICoj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Jan 2022 21:44:39 -0500
Received: from netrider.rowland.org ([192.131.102.5]:43655 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S232210AbiAICoj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 8 Jan 2022 21:44:39 -0500
Received: (qmail 140417 invoked by uid 1000); 8 Jan 2022 21:44:38 -0500
Date:   Sat, 8 Jan 2022 21:44:38 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     James <bjlockie@lockie.ca>, linux-usb <linux-usb@vger.kernel.org>
Subject: Re: why does my keyboard have 2 interfaces?
Message-ID: <YdpMFv4vjT8CZ3UQ@rowland.harvard.edu>
References: <01df8679-05fa-9728-c853-51576c49a7bb@lockie.ca>
 <6d26d56a-0572-f6b2-4895-c3fd7063276d@lockie.ca>
 <7d9c9c91-ae1b-47e5-0b5c-de0fd8f826b4@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d9c9c91-ae1b-47e5-0b5c-de0fd8f826b4@infradead.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jan 08, 2022 at 06:19:27PM -0800, Randy Dunlap wrote:
> 
> 
> On 1/8/22 16:21, James wrote:
> > 
> > $ lsusb -tv
> >  /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
> >      ID 1d6b:0002 Linux Foundation 2.0 root hub
> >      |__ Port 1: Dev 5, If 0, Class=Human Interface Device, Driver=usbhid, 1.5M
> >          ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
> 
> Interface 0 is the control interface, for setup/config/etc commands.

Or possibly it is the boot interface, for use by the BIOS before the 
operating system is running.

> >      |__ Port 1: Dev 5, If 1, Class=Human Interface Device, Driver=usbhid, 1.5M
> >          ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
> 
> Interfaces 1..N are for function data transfer.
> 
> > 
> > I tried my other computer and all the devices seem to have 2 interfaces.

Not all of them.  Device 4 on port 7 has only one interface.

> >  lsusb -tv
> > /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/6p, 10000M
> >     ID 1d6b:0003 Linux Foundation 3.0 root hub
> > /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/12p, 480M
> >     ID 1d6b:0002 Linux Foundation 2.0 root hub
> >     |__ Port 4: Dev 9, If 1, Class=Human Interface Device, Driver=usbhid, 12M
> >         ID 25a7:fa61 Areson Technology Corp Elecom Co., Ltd MR-K013 Multicard Reader
> >     |__ Port 4: Dev 9, If 0, Class=Human Interface Device, Driver=usbhid, 12M
> >         ID 25a7:fa61 Areson Technology Corp Elecom Co., Ltd MR-K013 Multicard Reader
> >     |__ Port 5: Dev 3, If 1, Class=Video, Driver=uvcvideo, 480M
> >         ID 0408:a061 Quanta Computer, Inc.
> >     |__ Port 5: Dev 3, If 0, Class=Video, Driver=uvcvideo, 480M
> >         ID 0408:a061 Quanta Computer, Inc.
> >     |__ Port 7: Dev 4, If 0, Class=Vendor Specific Class, Driver=, 12M
> >         ID 04f3:0c03 Elan Microelectronics Corp.
> >     |__ Port 10: Dev 5, If 0, Class=Wireless, Driver=btusb, 12M
> >         ID 8087:0026 Intel Corp.
> >     |__ Port 10: Dev 5, If 1, Class=Wireless, Driver=btusb, 12M
> >         ID 8087:0026 Intel Corp.
> > 
> 
> -- 
> ~Randy

Alan Stern
