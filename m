Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38361293F91
	for <lists+linux-usb@lfdr.de>; Tue, 20 Oct 2020 17:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731766AbgJTP3B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 11:29:01 -0400
Received: from netrider.rowland.org ([192.131.102.5]:41765 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1731679AbgJTP3A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Oct 2020 11:29:00 -0400
Received: (qmail 946601 invoked by uid 1000); 20 Oct 2020 11:28:59 -0400
Date:   Tue, 20 Oct 2020 11:28:59 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     "M. Vefa Bicakci" <m.v.b@runbox.com>
Cc:     Pany <pany@fedoraproject.org>, Bastien Nocera <hadess@hadess.net>,
        linux-usb@vger.kernel.org
Subject: Re: Bug caused by 53965c79c2db (USB: Fix device driver race)
Message-ID: <20201020152859.GA945128@rowland.harvard.edu>
References: <CAE3RAxt0WhBEz8zkHrVO5RiyEOasayy1QUAjsv-pB0fAbY1GSw@mail.gmail.com>
 <20201017200200.GB842001@rowland.harvard.edu>
 <CAE3RAxvNUvzqKT+GK3A4cQ7Tm_tFRQJKfJ01r0ic-5066fikDA@mail.gmail.com>
 <20201019174028.GF898631@rowland.harvard.edu>
 <cf1e7059-e1d2-2e7a-89c1-0c162850fbb4@runbox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf1e7059-e1d2-2e7a-89c1-0c162850fbb4@runbox.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 20, 2020 at 08:03:23AM -0400, M. Vefa Bicakci wrote:
> On 19/10/2020 13.40, Alan Stern wrote:
> > On Mon, Oct 19, 2020 at 09:36:00AM +0000, Pany wrote:
> > > On Sat, Oct 17, 2020 at 8:02 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > > > 
> > > > On Sat, Oct 17, 2020 at 04:07:11PM +0000, Pany wrote:
> > > > > Hi,
> > > > > 
> > > > > I installed fedora 32 into an SD card, with which I booted my Macbook.
> > > > > It had worked well before, until I upgraded the kernel from 5.8.5 to
> > > > > 5.8.6 [1].
> > > > > 
> > > > > With kernel-5.8.6-200.fc32.x86_64.rpm [2] installed, the boot process
> > > > > would be stuck at "A start job is running for
> > > > > /dev/mapper/fedora_localhost_--live-home (<time> / no limit)" (See the
> > > > > photo of screen [3]).
> > > > > 
> > > > > By appending "systemd.debug-shell=1" to the kernel cmdline, I saved
> > > > > the journal [4].
> > > > > 
> > > > > This issue has been bisected to commit
> > > > > 53965c79c2dbdc898ffc7fdbab37e920594f5e14 ("USB: Fix device driver
> > > > > race")
> > > > > 
> > > > > If I revert this commit, the kernel 5.8.6 would boot successfully.
> > > > 
> > > > This should have been fixed in 5.8.14 or 5.8.15 (5.8.14 was released on
> > > > the same day that the fix was installed; I'm not sure which came first).
> > > > At any rate it certainly should work with the most recent 5.8.y kernel.
> > > > 
> > > > Alan Stern
> > > 
> > > I tried, but neither 5.8.14 nor 5.8.15 worked for me.
> > 
> > Hmmm.  Looking at the system log you captured, it appears that the
> > problem the SD card reader's driver getting reprobed incorrectly.  The
> > details aren't clear, but the log shows the device getting probed twice,
> > once as sdb and once as sdc.  If the system tried to mount one of the
> > sdb partitions as the root, and then sdb disappeared, that could explain
> > what you see.
> > 
> > I don't know why this is happening.  But you can try adding some
> > debugging messages of your own.  In drivers/usb/core/driver.c, the
> > routine __usb_bus_reprobe_drivers() should never reach the line that
> > calls device_reprobe() unless the USBIP or apple-mfi-fastcharge driver
> > is installed -- and neither of those should be involved with the card
> > reader device.  You can add a line saying:
> > 
> > 	dev_info(dev, "new driver %s\n", new_udriver->name);
> > 
> > at that point and see what it produces in the log.
> 
> Hello all,
> 
> Sorry for my lateness!
> 
> I reviewed Pany's logs, and the issue appears to be related to the
> automatic loading of the apple-mfi-fastcharge USB driver, which triggers
> a re-probe of the SD card reader, as pointed out earlier.
> 
> This happens because the id_table of the aforementioned USB driver
> (mfi_fc_id_table) matches all USB products manufactured by Apple:
> 
>  35 static const struct usb_device_id mfi_fc_id_table[] = {
>  36         { .idVendor = APPLE_VENDOR_ID,
>  37           .match_flags = USB_DEVICE_ID_MATCH_VENDOR },
>  38         {},
>  39 };
>  ...
> 218 static struct usb_device_driver mfi_fc_driver = {
> 219         .name =         "apple-mfi-fastcharge",
> 220         .probe =        mfi_fc_probe,
> 221         .disconnect =   mfi_fc_disconnect,
> 222         .id_table =     mfi_fc_id_table,
> 223         .generic_subclass = 1,
> 224 };
> 
> 
> ... and Pany's system has multiple USB devices manufactured by Apple
> (including the SD card reader), with the vendor code 0x05ac, which is
> the value included by the id_table of the apple-mfi-fastcharge driver:
> 
> Sep 29 15:22:48 fedora.local kernel: usb 2-3: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
> Sep 29 15:22:48 fedora.local kernel: usb 2-3: New USB device found, idVendor=05ac, idProduct=8406, bcdDevice= 8.20
> Sep 29 15:22:48 fedora.local kernel: usb 2-3: New USB device strings: Mfr=3, Product=4, SerialNumber=5
> Sep 29 15:22:48 fedora.local kernel: usb 2-3: Product: Card Reader
> Sep 29 15:22:48 fedora.local kernel: usb 2-3: Manufacturer: Apple
> ...
> Sep 29 15:22:48 fedora.local kernel: usb 1-5: new full-speed USB device number 3 using xhci_hcd
> Sep 29 15:22:48 fedora.local kernel: usb 1-5: New USB device found, idVendor=05ac, idProduct=0273, bcdDevice= 6.22
> Sep 29 15:22:48 fedora.local kernel: usb 1-5: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> Sep 29 15:22:48 fedora.local kernel: usb 1-5: Product: Apple Internal Keyboard / Trackpad
> Sep 29 15:22:48 fedora.local kernel: usb 1-5: Manufacturer: Apple Inc.
> ...
> 
> One way to fix this issue would be to implement a match function in the
> apple-mfi-fastcharge driver, possibly instead of an id_table, so that it
> does not match devices that it cannot bind to. This may require other
> changes in the USB core that I cannot fathom at the moment.

How about matching on the vendor ID and the product ID?  That would be 
an easy addition to the ID table.  Do the fastcharge devices have a well 
known product ID?

Alan Stern

> Pany, in the mean-time, could you add the following string to your kernel's
> command line (i.e., via GRUB, or the actual boot-loader that you use) and
> let us know whether it helps to *work around* this issue with the latest
> versions of 5.8.y kernels?
> 
> 	module_blacklist=apple-mfi-fastcharge
> 
> To emphasize, I am only suggesting this as a work-around, not as an actual
> solution.
> 
> My time is a bit limited due to having restarted full-time employment,
> but I can work on this issue during the weekend.
> 
> Thanks!
> 
> Vefa
