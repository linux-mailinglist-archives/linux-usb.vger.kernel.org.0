Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD38612E988
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2020 18:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbgABRtB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jan 2020 12:49:01 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:54782 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727706AbgABRtB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jan 2020 12:49:01 -0500
Received: (qmail 2306 invoked by uid 2102); 2 Jan 2020 12:49:00 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 2 Jan 2020 12:49:00 -0500
Date:   Thu, 2 Jan 2020 12:49:00 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
cc:     Roger Whittaker <Roger.Whittaker@suse.com>,
        Takashi Iwai <tiwai@suse.de>, Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Takashi Iwai <tiwai@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Certain cameras no longer working with uvcvideo on recent
 (openSUSE) kernels
In-Reply-To: <20200102170310.GF4843@pendragon.ideasonboard.com>
Message-ID: <Pine.LNX.4.44L0.2001021246480.1309-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2 Jan 2020, Laurent Pinchart wrote:

> Hi Roger,
> 
> On Thu, Jan 02, 2020 at 04:57:42PM +0000, Roger Whittaker wrote:
> > On Thu, Jan 02, 2020 at 06:38:07PM +0200, Laurent Pinchart wrote:
> > 
> > > Roger, would you be able to set the uvcvideo trace module parameter to
> > > 0xffff before plugging the device, and provide the messages printed by
> > > the driver to the kernel log both with and without the above commit ?
> > 
> > With 5.3.12-2-default, loading uvcvideo with
> > 
> > options uvcvideo trace=0xffff
> 
> Thank you.
> 
> > On plugging:
> > 
> > [   73.571566] usb 1-1.4.3.1: new high-speed USB device number 12 using xhci_hcd
> > [   73.729180] usb 1-1.4.3.1: config 1 interface 2 altsetting 0 endpoint 0x82 has wMaxPacketSize 0, skipping
> > [   73.729552] usb 1-1.4.3.1: New USB device found, idVendor=1778, idProduct=0214, bcdDevice= 7.07
> > [   73.729558] usb 1-1.4.3.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > [   73.729561] usb 1-1.4.3.1: Product: IPEVO Point 2 View
> > [   73.729564] usb 1-1.4.3.1: Manufacturer: IPEVO Inc.
> > [   73.732670] hid-generic 0003:1778:0214.0009: hiddev98,hidraw8: USB HID v1.10 Device [IPEVO Inc. IPEVO Point 2 View] on usb-0000:00:14.0-1.4.3.1/input0
> > [   73.781765] videodev: Linux video capture interface: v2.00
> > [   73.807553] uvcvideo: Probing generic UVC device 1.4.3.1
> > [   73.807693] uvcvideo: no class-specific streaming interface descriptors found.
> 
> It seems that Alan's patch causes more than the endpoint to be ignored.

Roger, you can get more information by plugging in the device and then
posting the contents of /sys/kernel/debug/usb/devices (or just the
portion that refers to the camera).  It would be interesting to compare 
the values from the kernel with the commit present and the kernel with 
the commit reverted.

Alan Stern

