Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 770CB139441
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2020 16:05:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728799AbgAMPFn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jan 2020 10:05:43 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:56008 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726567AbgAMPFn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jan 2020 10:05:43 -0500
Received: (qmail 1544 invoked by uid 2102); 13 Jan 2020 10:05:42 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 13 Jan 2020 10:05:42 -0500
Date:   Mon, 13 Jan 2020 10:05:42 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Pete Zaitcev <zaitcev@redhat.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tomasz =?UTF-8?B?TW/FhA==?= <desowin@gmail.com>,
        <linux-usb@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] usbmon: Report device address assigned to USB device
In-Reply-To: <20200111175216.5b5680ea@suzdal.zaitcev.lan>
Message-ID: <Pine.LNX.4.44L0.2001131003350.1502-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 11 Jan 2020, Pete Zaitcev wrote:

> On Wed, 8 Jan 2020 16:55:13 +0100
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > On Mon, Jan 06, 2020 at 10:37:17AM +0100, Tomasz Moń wrote:
> > > Make USB device addresses match while sniffing USB communication
> > > with usbmon and hardware USB sniffer (OpenVizsla) at the same time.
> > > On xHCI root hubs the address is assigned by hardware and can be
> > > different than devnum.
> > 
> > This breaks the userspace abi for matching up the devnum with the number
> > that is listed by the kernel to userspace, making it really hard to
> > match things up for xhci devices now :(
> > 
> > I understand the need to look at this data, but you can't do it in a way
> > that will change things like this.
> 
> This sounds reasonable, although perhaps unfortunate. I acked Tomasz's
> patch because I thought that XHCI is new, and thus it's no big deal
> if its results are different.
> 
> Of course I rushed to examine the packet structure, but yes, there's
> no space in the header, not without some trickery. For example, the
> upper 8 bits of the ID are probably the same for all packets, so
> it may be stuffed in there. Or, it might be possible to create an
> extra header and attach it at the end of ISO descriptors.
> 
> Alan's suggestion of leaving the physical address in /sys appeals
> the most to me, honestly. One thing though, libpcap will need to
> rifle through /sys and then store that address, so its serialization
> has to be changed no matter what. Unfortunately, I'm wholly ignorant
> as to what syntax it uses and how extensible it is.

Alternatively, libpcap can ignore the issue and just display the device
numbers, as it does now.  A separate program or the user could convert
the number to a physical address, if necessary, using the information 
in sysfs.

Alan Stern

