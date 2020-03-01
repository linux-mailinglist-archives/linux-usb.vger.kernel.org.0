Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80CDE174E02
	for <lists+linux-usb@lfdr.de>; Sun,  1 Mar 2020 16:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgCAPXP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 1 Mar 2020 10:23:15 -0500
Received: from netrider.rowland.org ([192.131.102.5]:51367 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726188AbgCAPXP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 1 Mar 2020 10:23:15 -0500
Received: (qmail 1718 invoked by uid 500); 1 Mar 2020 10:23:14 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 1 Mar 2020 10:23:14 -0500
Date:   Sun, 1 Mar 2020 10:23:14 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     James <bjlockie@lockie.ca>
cc:     linux-usb@vger.kernel.org
Subject: Re: USB2 device?
In-Reply-To: <a8003c66-2a9b-c3ab-e7bb-d6b8a2b84a66@lockie.ca>
Message-ID: <Pine.LNX.4.44L0.2003011021530.692-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 29 Feb 2020, James wrote:

> 
> 
> On 2020-02-29 6:05 p.m., Alan Stern wrote:
> > On Sat, 29 Feb 2020, James wrote:
> >
> >> I forgot sudo.
> >>
> >> This looks like the interface is USB 3 but the device internals are USB 2.
> >> Does that make sense?
> > No.
> What does "SuperSpeed USB Device Capability:" mean?

According to the spec: "the required device-level capabilities
descriptor which shall be implemented by all SuperSpeed devices".

> >>     SuperSpeed USB Device Capability:
> >>       bLength                10
> >>       bDescriptorType        16
> >>       bDevCapabilityType      3
> >>       bmAttributes         0x00
> >>       wSpeedsSupported   0x0006
> >>         Device can operate at Full Speed (12Mbps)
> >>         Device can operate at High Speed (480Mbps)
> >> $ sudo lsusb -v -d 0bda:b812
> >>
> >> Bus 003 Device 002: ID 0bda:b812 Realtek Semiconductor Corp. 802.11ac NIC
> >> Device Descriptor:
> >>     bLength                18
> >>     bDescriptorType         1
> >>     bcdUSB               2.10
> >>     bDeviceClass            0
> >>     bDeviceSubClass         0
> >>     bDeviceProtocol         0
> >>     bMaxPacketSize0        64
> >>     idVendor           0x0bda Realtek Semiconductor Corp.
> >>     idProduct          0xb812
> >>     bcdDevice            2.10
> > These are exactly the same vendor, product, and serial IDs as the first
> > device.  So you should expect them to be the same.
> >
> > Alan Stern
> >
> I have another one on order, hopefully it is better.
> It might have the same USB id but I know it seems like a better vendor 
> (Netis).

If it's from a different vendor then it will have a different vendor 
ID.

Alan Stern

