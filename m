Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 665C8651AFC
	for <lists+linux-usb@lfdr.de>; Tue, 20 Dec 2022 07:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232716AbiLTG5f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Dec 2022 01:57:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbiLTG5e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Dec 2022 01:57:34 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A57A92BF9
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 22:57:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 34FD661283
        for <linux-usb@vger.kernel.org>; Tue, 20 Dec 2022 06:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3995CC433EF;
        Tue, 20 Dec 2022 06:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1671519451;
        bh=uureOuZhqkh7pdt6bC74mSu8m6mZ78hGAmxIPnWhC8o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BvZez0pNnhhbUglK3u+lknuHmxnYXSJqvtQJ6pdVhZ1Z+n197Xx+lUuGJcPehH73T
         QbvgFhYfW44bGFr6MxxTc61GJV850qQURo/RckTpcqgoLR7/pH6lu/2hhJsMfbVNaA
         MxPOkT39TAxksqdZttziySzyqErcmNi8sLIletlE=
Date:   Tue, 20 Dec 2022 07:57:28 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     dima.pasechnik@cs.ox.ac.uk
Cc:     linux-usb@vger.kernel.org
Subject: Re: usb 1-3: Product: BBC micro:bit CMSIS-DAP not recognised
Message-ID: <Y6Fc2Fz8w4KoX952@kroah.com>
References: <Y6Bfx+Ksm/Qz3N8y@hilbert>
 <Y6B8jd7dHsa85Wny@kroah.com>
 <Y6CRbgwHzjr2KNxK@hilbert>
 <Y6CpKxZ4KsiYttbL@hilbert>
 <Y6Csfzqvy6GExhVB@kroah.com>
 <Y6DjwFAp4M8I+T4P@hilbert>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6DjwFAp4M8I+T4P@hilbert>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 19, 2022 at 10:20:48PM +0000, dima.pasechnik@cs.ox.ac.uk wrote:
> On Mon, Dec 19, 2022 at 07:25:03PM +0100, Greg KH wrote:
> [...]
> > 
> > That is only if you want to manually bind the generic driver to this
> > device.  The kernel takes this and says "are you sure you want to do
> > this, if so, email this address and talk to these developers" :)
> 
> One does need a dedicated /dev/ttyUSB. It is similar, but not
> identical, to /dev/ttyACM. Cf. e.g.
> https://rfc1149.net/blog/2013/03/05/what-is-the-difference-between-devttyusbx-and-devttyacmx/

Yes, they are a little different and the main point here is your device
says it is a ACM-compliant device, so just use that tty device node to
talk to it.  That is the standard for talking serial protocols to USB
devices.

By forcing the device to the generic usb-serial driver, you are saying
"this random endpoint is really a tty pass-through device" is that the
case?  Why would you have both a ACM and a pass-through set of endpoints
in the same USB device?

> And the board makes an effort to establish
> a dedicated /dev/ttyUSB. Indeed, after I plugged the board in 21:35
> and did "ls -l /dev/tty*" I saw
> 
> crw--w---- 1 root tty       4,  0 Dec 19 21:28 /dev/tty0
> crw------- 1 dima tty       4,  1 Dec 19 21:35 /dev/tty1
> crw--w---- 1 root tty       4, 10 Dec 19 21:28 /dev/tty10
> crw--w---- 1 root tty       4, 11 Dec 19 21:28 /dev/tty11

Those are not USB-serial devices :)

Seeing those device nodes is one thing, did you connect to the ttyUSBX
device nodes and talk to the device properly?

> Needless to say, there is also /dev/ttyACM0 popping up - so this part
> of the communication is OK.

And I think that is the usb-serial connect to this device.

> I think it's prudent that the kernel understands that it's a
> a proper ttyUSB device, apparing as /dev/ttyUSB, and advertises it as
> such. Without it, it's hard to detect it, and indeed, the only way I see
> this,  without an active usbserial driver, is by the time shown next to 
> /dev/tty*

There is no "proper" ttyUSB type of device.  That set of drivers was
created because there was no USB standard for usb-serial devices way
back in the day so people made custom chips for them with custom
protocols.  Then people realized this was a bad thing and came up with
the USB ACM spec so that you would NOT have to write a custom kernel
driver for their devices.

So if this device does need to be controlled by the usb-serial driver,
what chip is in it and what protocol does it talk?  As Alan said, the
output of `lsusb -v` for the device would be helpful.

> > > As you see, no USB serial driver is loaded.
> > > However, https://tech.microbit.org/software/daplink-interface/
> > > tells you that there is a 2nd CPU on the board, aka "interface chip",
> > > capable of UART.
> > 
> > And that would be the ttyACM0 device node, right?  Why not use just use that?
> Actually, the "interface chip" is reponsible not only for ttyACM, but
> for USB mass storage, and USB serial, all crammed in into the same
> physical USB port.

Are there specs on this chip anywhere?

> ttyACM is a slightly different from serial USB device, understanding slightly different set
> of commands. (as I wrote above)

There is no "one set" of serial USB commands to talk.  The article you
point to is not really correct.  ACM devices are NOT always modems,
often they are just manufacturers wanting to not have to write custom
kernel drivers, as USB originally was designed.

> An application might want to talk to the board on several virtual ports in
> the same time, why not? If it's a real-time communication, say?

USB is not for "real-time" devices :)

> > > If I manually load the driver:
> > > # insmod /lib/modules/6.0.8-gentoo-x86_64/kernel/drivers/usb/serial/usbserial.ko vendor=0x0d28 product=0x0204
> > > and re-insert the USB connector, I see dmesg log as in my previous
> > > message, and indeed, /dev/ttyUSB0 appears.
> > 
> > Yes, but does using that device node actually work?
> > 
> > > Well, perhaps, it's all supposed to work without a kernel module, hard
> > > to say. It's however confusing that a /dev/tty1 (or some other number)
> > > appears, but it's totally non-transparent that it is a USB connection
> > > (no reflection of it in dmesg).
> > 
> > Again, try ttyACM0 and see if that works.
> 
> Yes, it does basic things, I can use web interface for
> https://python.microbit.org/ to upload and run Python
> (https://python.microbit.org/) programs on the board. I only know
> Chromium talks to the board via webUSB (https://wicg.github.io/webusb/)
> I don't know yet whether one can try several USB interfaces from it. 

If ttyACM0 works, use it!  Why do you need anything else here?

thanks,

greg k-h
