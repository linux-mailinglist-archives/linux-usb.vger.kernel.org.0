Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 960B226C979
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 21:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727555AbgIPTJ2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 15:09:28 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:54312 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727395AbgIPRo0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Sep 2020 13:44:26 -0400
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 3BED73AE1EF
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2020 14:41:09 +0000 (UTC)
Received: from [192.168.0.28] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id D67D3240011;
        Wed, 16 Sep 2020 14:39:40 +0000 (UTC)
Message-ID: <9d329243e4ed6b09afade2659e09b847e9c780fc.camel@hadess.net>
Subject: Re: USB driver ID matching broken
From:   Bastien Nocera <hadess@hadess.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrey Konovalov <andreyknvl@google.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        syzkaller <syzkaller@googlegroups.com>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        "M. Vefa Bicakci" <m.v.b@runbox.com>
Date:   Wed, 16 Sep 2020 16:39:40 +0200
In-Reply-To: <20200916141513.GA2977321@kroah.com>
References: <CAAeHK+zOrHnxjRFs=OE8T=O9208B9HP_oo8RZpyVOZ9AJ54pAA@mail.gmail.com>
         <20200916141513.GA2977321@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.37.90 (3.37.90-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2020-09-16 at 16:15 +0200, Greg Kroah-Hartman wrote:
> On Wed, Sep 16, 2020 at 03:33:25PM +0200, Andrey Konovalov wrote:
> > Hi Bastien, Greg, Alan,
> > 
> > Looks like commit adb6e6ac20ee ("USB: Also match device drivers
> > using
> > the ->match vfunc") broke the USB driver ID matching process. This,
> > in
> > turn, led to a complete breakage of the USB fuzzing instance.
> > 
> > This is how an attempt to connect a USB device looks now:
> > 
> > [   39.781642][   T12] usb 1-1: new high-speed USB device number 2
> > using dummy_hcd
> > [   40.299955][   T12] usb 1-1: New USB device found,
> > idVendor=0cf3,
> > idProduct=9271, bcdDevice= 1.08
> > [   40.303072][   T12] usb 1-1: New USB device strings: Mfr=1,
> > Product=2, SerialNumber=3
> > [   40.305678][   T12] usb 1-1: Product: syz
> > [   40.307041][   T12] usb 1-1: Manufacturer: syz
> > [   40.308556][   T12] usb 1-1: SerialNumber: syz
> > [   40.314825][   T12] usbip-host 1-1: 1-1 is not in match_busid
> > table... skip!
> > [   42.500114][   T51] usb 1-1: USB disconnect, device number 2
> > 
> > It seems that when going through the list of registered IDs the
> > code
> > tries to match against USB/IP and succeeds as usbip_match() always
> > returns true.
> > 
> > I'm not sure what's the best fix for this is.
> 
> I thought that is what the patch from Bastien was supposed to fix?
> 
> If it didn't, we can revert it.

It wasn't. Are you thinking of "usbip: Implement a match function to
fix usbip" by M. Vefa Bicakci (CC:ed)?

Seems to me that usbip wants to match *every* device. Wouldn't that be
a bug in usbip?

