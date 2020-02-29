Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 076EC1747EC
	for <lists+linux-usb@lfdr.de>; Sat, 29 Feb 2020 17:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbgB2QMI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Feb 2020 11:12:08 -0500
Received: from netrider.rowland.org ([192.131.102.5]:60547 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727119AbgB2QMH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 Feb 2020 11:12:07 -0500
Received: (qmail 17359 invoked by uid 500); 29 Feb 2020 11:12:06 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 29 Feb 2020 11:12:06 -0500
Date:   Sat, 29 Feb 2020 11:12:06 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     James <bjlockie@lockie.ca>
cc:     linux-usb@vger.kernel.org
Subject: Re: USB2 device?
In-Reply-To: <c9e86046-5b14-c7ab-4a52-dc5cc052eb23@lockie.ca>
Message-ID: <Pine.LNX.4.44L0.2002291103560.16560-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 28 Feb 2020, James wrote:

> I plugged the Realtek in where the Kingston was expecting it too be a 
> USB3 port.
> I didn't know a device could change ports.

Devices don't actually change ports.  What's going on is this: Each
physical USB-3 port on the computer is wired internally to two
different USB buses: a USB-3 bus and a USB-2 bus.  An electronic switch
automatically selects the appropriate bus connection based on the speed
of the device attached to the port.

To the kernel, it looks like there are two different ports.  But in 
reality there's just one port with two different internal connections.

> $ lsusb
> Bus 004 Device 003: ID 13fe:6300 Kingston Technology Company Inc. USB 
> DISK 3.0
> 
> $ lsusb -t
> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M\
>      |__ Port 1: Dev 3, If 0, Class=Mass Storage, Driver=usb-storage, 5000M
> 
> $ lsusb
> Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 003 Device 006: ID 0bda:b812 Realtek Semiconductor Corp. 802.11ac NIC
> 
> $ lsusb -t
> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
> /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
>      |__ Port 1: Dev 6, If 0, Class=Vendor Specific Class, 
> Driver=rtl88x2bu, 480M
> 
>    bcdUSB               2.10
> Means it's USB2,  right?

Yes.

> It doesn't matter if it's plugged in a USB2 port?

A USB-2 device should work okay in either a USB-2 or a USB-3 port.

> How reliable is this?

Quite reliable.  However, on occasion something goes wrong when a 
USB-3 device is plugged in.  For some reason the USB-3 connection 
fails; when this happens the device switches over to the USB-2 
connection and then communicates at the lower speed.  It still works, 
but in a degraded manner.

Alan Stern

