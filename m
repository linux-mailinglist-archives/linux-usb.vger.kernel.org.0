Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10BDF6511BF
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 19:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231702AbiLSSZJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 13:25:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbiLSSZI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 13:25:08 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2808112759
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 10:25:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B28876109E
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 18:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95228C433D2;
        Mon, 19 Dec 2022 18:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1671474306;
        bh=yM48q77Apt56921m8lppwKcgJAtvEEFh0KX1Mwu4xFs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ALX59m5BBj5ylIk1YhExvwVykXGiH1jkCqjm3UHYimO166i2LBVOdxyvLaBgxUC4+
         qZKU1xY3jRl0z3mf8cuUOvGNVnWZ9vxL9aq9s8iwhdUe8j+Q2JRYhhVLDqSIfzoH/r
         G20jIn+iYggoRAX+CQnBBut5haNQfXmAZN31QdOY=
Date:   Mon, 19 Dec 2022 19:25:03 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     dima.pasechnik@cs.ox.ac.uk
Cc:     linux-usb@vger.kernel.org
Subject: Re: usb 1-3: Product: BBC micro:bit CMSIS-DAP not recognised
Message-ID: <Y6Csfzqvy6GExhVB@kroah.com>
References: <Y6Bfx+Ksm/Qz3N8y@hilbert>
 <Y6B8jd7dHsa85Wny@kroah.com>
 <Y6CRbgwHzjr2KNxK@hilbert>
 <Y6CpKxZ4KsiYttbL@hilbert>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6CpKxZ4KsiYttbL@hilbert>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 19, 2022 at 06:10:51PM +0000, dima.pasechnik@cs.ox.ac.uk wrote:
> On Mon, Dec 19, 2022 at 04:29:34PM +0000, dima.pasechnik@cs.ox.ac.uk wrote:
> > On Mon, Dec 19, 2022 at 04:00:29PM +0100, Greg KH wrote:
> > > On Mon, Dec 19, 2022 at 12:57:43PM +0000, dima.pasechnik@cs.ox.ac.uk wrote:
> > > > this is a popular in UK education board: https://microbit.org/
> > > > - the currently sold (Version 2) one. It does on the same USB 3 things:
> > > >   mass storage, ACM, and serial. Serial appears unknown to the kernel.
> > > > 
> > > > With Linux kernel 6.0.8 on x86_54, and various USB serial drivers installed, upon plugging into USB
> > > > port, I see in dmesg:
> > > > 
> > > > [45460.035306] usb 1-3: new full-speed USB device number 10 using xhci_hcd
> > > > [45460.166959] usb 1-3: New USB device found, idVendor=0d28, idProduct=0204, bcdDevice=10.00
> > > > [45460.166965] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> > > > [45460.166967] usb 1-3: Product: BBC micro:bit CMSIS-DAP
> > > > [45460.166968] usb 1-3: Manufacturer: Arm
> > > > [45460.166970] usb 1-3: SerialNumber: 9905360200052833525e24a702a68552000000006e052820
> > > > [45460.172168] usb-storage 1-3:1.0: USB Mass Storage device detected
> > > > [45460.172538] scsi host1: usb-storage 1-3:1.0
> > > > [45460.173203] cdc_acm 1-3:1.1: ttyACM0: USB ACM device
> > > > [45460.175258] hid-generic 0003:0D28:0204.0005: hiddev96,hidraw0: USB HID v1.00 Device [Arm BBC micro:bit CMSIS-DAP] on usb-0000:00:14.0-3/input3
> > > > [45460.175581] usbserial_generic 1-3:1.4: The "generic" usb-serial driver is only for testing and one-off prototypes.
> > > > [45460.175585] usbserial_generic 1-3:1.4: Tell linux-usb@vger.kernel.org to add your device to a proper driver.
> > > > [45460.175587] usbserial_generic 1-3:1.4: device has no bulk endpoints
> > > > [45460.175818] usbserial_generic 1-3:1.5: The "generic" usb-serial driver is only for testing and one-off prototypes.
> > > > [45460.175821] usbserial_generic 1-3:1.5: Tell linux-usb@vger.kernel.org to add your device to a proper driver.
> > > > [45460.175823] usbserial_generic 1-3:1.5: generic converter detected
> > > 
> > > Is there some script adding this device id to the generic driver such
> > > that you are binding to this device?  Did the script come with the
> > > device?
> > 
> > It didn't bind to a /dev/ttyUSB* device, even if I manually loaded the corresponding modules.
> > Then I read somewhere I had to do 
> > 
> >     echo 0d28 0204 >/sys/bus/usb-serial/drivers/generic/new_id
> > 
> > (the numbers there are VID and PID of the board)
> > to make it recognisible by the driver.

That is only if you want to manually bind the generic driver to this
device.  The kernel takes this and says "are you sure you want to do
this, if so, email this address and talk to these developers" :)

> > Unfortunately I can't easily tell you how it behaved without it,
> > as it seems to be impossible to remove things there :-(
> > https://unix.stackexchange.com/questions/463291/how-to-remove-device-id-from-manually-entered-usb-serial-driver
> > Can it be wiped by reinstalling the kernel? I can do this...
> 
> OK, I removed the "new_id" by kernel reinstall, and
> now all I get is the following:
> 
> [  176.427839] usb 1-3: new full-speed USB device number 5 using xhci_hcd
> [  176.558808] usb 1-3: New USB device found, idVendor=0d28, idProduct=0204, bcdDevice=10.00
> [  176.558825] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [  176.558833] usb 1-3: Product: BBC micro:bit CMSIS-DAP
> [  176.558839] usb 1-3: Manufacturer: Arm
> [  176.558845] usb 1-3: SerialNumber: 9905360200052833525e24a702a68552000000006e052820
> [  176.566864] hid-generic 0003:0D28:0204.0001: hiddev96,hidraw0: USB HID v1.00 Device [Arm BBC micro:bit CMSIS-DAP] on usb-0000:00:14.0-3/input3
> [  177.727061] usb-storage 1-3:1.0: USB Mass Storage device detected
> [  177.733180] scsi host0: usb-storage 1-3:1.0
> [  177.733333] usbcore: registered new interface driver usb-storage
> [  177.733607] cdc_acm 1-3:1.1: ttyACM0: USB ACM device
> [  177.733646] usbcore: registered new interface driver cdc_acm
> [  177.733648] cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters
> [  177.739250] usbcore: registered new interface driver uas
> [  178.752970] scsi 0:0:0:0: Direct-Access     MBED     VFS              0.1  PQ: 0 ANSI: 2
> [  178.759252] sd 0:0:0:0: [sda] 131200 512-byte logical blocks: (67.2 MB/64.1 MiB)
> [  178.759440] sd 0:0:0:0: [sda] Write Protect is off
> [  178.759443] sd 0:0:0:0: [sda] Mode Sense: 03 00 00 00
> [  178.759611] sd 0:0:0:0: [sda] No Caching mode page found
> [  178.759613] sd 0:0:0:0: [sda] Assuming drive cache: write through
> [  178.769674]  sda:
> [  178.769773] sd 0:0:0:0: [sda] Attached SCSI removable disk
> 
> As you see, no USB serial driver is loaded.
> However, https://tech.microbit.org/software/daplink-interface/
> tells you that there is a 2nd CPU on the board, aka "interface chip",
> capable of UART.

And that would be the ttyACM0 device node, right?  Why not use just use that?

> If I manually load the driver:
> # insmod /lib/modules/6.0.8-gentoo-x86_64/kernel/drivers/usb/serial/usbserial.ko vendor=0x0d28 product=0x0204
> and re-insert the USB connector, I see dmesg log as in my previous
> message, and indeed, /dev/ttyUSB0 appears.

Yes, but does using that device node actually work?

> Well, perhaps, it's all supposed to work without a kernel module, hard
> to say. It's however confusing that a /dev/tty1 (or some other number)
> appears, but it's totally non-transparent that it is a USB connection
> (no reflection of it in dmesg).

Again, try ttyACM0 and see if that works.

thanks,

greg k-h
