Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD8151792F3
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2020 16:05:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728278AbgCDPFX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Mar 2020 10:05:23 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:34774 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726981AbgCDPFX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Mar 2020 10:05:23 -0500
Received: (qmail 1622 invoked by uid 2102); 4 Mar 2020 10:05:22 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 4 Mar 2020 10:05:22 -0500
Date:   Wed, 4 Mar 2020 10:05:21 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Tony Fischetti <tony.fischetti@gmail.com>
cc:     linux-usb@vger.kernel.org, <linux-kernel@vger.kernel.org>
Subject: Re: Trouble adding QUIRK_ALWAYS_POLL to quirky USB mouse
In-Reply-To: <CAOMV6SWp3UgY+4AThCLeYmAk2gmh5m0UhG7+=ujPvKFsUdjU-A@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2003041002440.1509-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 3 Mar 2020, Tony Fischetti wrote:

> Hi all,
> 
> I have a lenovo pixart mouse (vendorId: 0x17ef, productId: 0x608d)
> that's afflicted with the apparently common problem of disconnecting
> and re-connecting every minute, each time incrementing the device
> number
> 
> I tried to apply a patch very much like the one in this commit with
> the identical problem: dcf768b0ac868630e7bdb6f2f1c9fe72788012fa
> The particular patch I applied appears at the end of this email (not
> meant to be submitted/applied, just as a reference)
> 
> The problem is that when I apply the patch and boot the new kernel,
> the quirk appears not to have been registered (it doesn't appear in
> /sys/module/usbhid/parameters/quirks)
> It is only when I add the kernel boot parameter
> usbhid.quirks=0x17ef:0x608d:0x00000400 that it appears to be working
> 
> Anyone have any ideas on how to fix this? I'd like to submit a patch
> fixing this issue once I get it sorted out

If you have usbhid loaded as a module instead of built into the kernel, 
then it probably is getting loaded from the initramfs.  If you didn't 
rebuild the initramfs image after creating the new kernel, you would 
end up loading the original module without the new quirk entry.

It's easy enough to test this.  After booting, do:

	rmmod usbhid ; modprobe usbhid

and see if the quirk entry then shows up in sysfs.

Alan Stern

