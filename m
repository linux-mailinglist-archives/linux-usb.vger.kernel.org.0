Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 010EC3C8A68
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jul 2021 20:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239918AbhGNSIG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jul 2021 14:08:06 -0400
Received: from netrider.rowland.org ([192.131.102.5]:40189 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229736AbhGNSIF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Jul 2021 14:08:05 -0400
Received: (qmail 388714 invoked by uid 1000); 14 Jul 2021 14:05:12 -0400
Date:   Wed, 14 Jul 2021 14:05:12 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Hylke Hellinga <hylke.hellinga@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: ASMedia Technology Inc. ASM1143 USB 3.1 Host Controller causing
 random full speed USB resets
Message-ID: <20210714180512.GF380727@rowland.harvard.edu>
References: <CABUoX8tR+DpknjXCwtVkBh6O-rUisZ2V5RepzxRO-k5XBX7J=g@mail.gmail.com>
 <20210713184251.GC355405@rowland.harvard.edu>
 <CABUoX8sNbLuG0FB2_VtH14KhuBoRFB19a2V3cpgzdNDqiVUULA@mail.gmail.com>
 <CABUoX8sT_=8aUdzhphwJXnRN2m_cKuJrDi1MtOrkaCTThT0wmA@mail.gmail.com>
 <CABUoX8tX6+JpPRz7oyJV2fsiEbWxE+aZEYoBdjqWvLKL-4Odow@mail.gmail.com>
 <20210714145423.GB380727@rowland.harvard.edu>
 <CABUoX8uUhW4bdUZ6Roo=jEn=3UwUq2QVAMPcnyg8rbLzua09=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABUoX8uUhW4bdUZ6Roo=jEn=3UwUq2QVAMPcnyg8rbLzua09=w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 14, 2021 at 07:39:51PM +0200, Hylke Hellinga wrote:
> Yes, I did.
> 
> I've connected both the mouse, keyboard and headset to the pc and it would
> function normally. I know it has to do with the switch itself. But I have
> no idea how to fix it.

When you connect the mouse directly to the PC, does it still run at full 
speed or does it go up to high speed?

> The switch works fine under windows and macos, and it is even advertised to
> work under linux. But you never know with amazon products whether that is
> actually the case.

Do you have any other Linux computers you can try the switch with?  Or 
USB ports on your computer connected to a different host controller?

> I don't have a different usb switch I can test. I've tried different input
> usb cables as well. The usb cable coming from the switch going into my
> computer is pretty long.

Well, maybe a shorter cable would help.  But basically, I have no idea 
how to fix it either.  A possible workaround would be to make the usbhid 
driver ignore all the errors coming from the mouse instead of resetting 
it, but such a change would not be generally acceptable for the kernel.

It ought to be possible to get the equivalent of a usbmon trace under 
Windows or Mac OS, using Wireshark.  That would at least show if the 
same errors occur in those settings, and if they do, how the operating 
systems deal with them.

To track down the problem any further would require a more detailed 
knowledge of the USB support in Windows or Mac OS (which I don't have) 
and/or some rather expensive USB bus analyzer hardware.  It would be 
cheaper and quicker just to get a different brand of switch.  :-(

Alan Stern
