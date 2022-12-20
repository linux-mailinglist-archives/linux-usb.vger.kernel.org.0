Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 360AD65277A
	for <lists+linux-usb@lfdr.de>; Tue, 20 Dec 2022 20:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234040AbiLTT5v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Dec 2022 14:57:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234026AbiLTT5M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Dec 2022 14:57:12 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id CBAE91DF23
        for <linux-usb@vger.kernel.org>; Tue, 20 Dec 2022 11:57:06 -0800 (PST)
Received: (qmail 65756 invoked by uid 1000); 20 Dec 2022 14:57:05 -0500
Date:   Tue, 20 Dec 2022 14:57:05 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     dima.pasechnik@cs.ox.ac.uk
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: usb 1-3: Product: BBC micro:bit CMSIS-DAP not recognised
Message-ID: <Y6ITkWEb25Si4zts@rowland.harvard.edu>
References: <Y6Bfx+Ksm/Qz3N8y@hilbert>
 <Y6B8jd7dHsa85Wny@kroah.com>
 <Y6CRbgwHzjr2KNxK@hilbert>
 <Y6CpKxZ4KsiYttbL@hilbert>
 <Y6Csfzqvy6GExhVB@kroah.com>
 <Y6DjwFAp4M8I+T4P@hilbert>
 <Y6Fc2Fz8w4KoX952@kroah.com>
 <Y6HLqYpxwT+v3BgX@hilbert>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6HLqYpxwT+v3BgX@hilbert>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 20, 2022 at 02:50:17PM +0000, dima.pasechnik@cs.ox.ac.uk wrote:
> See https://tech.microbit.org/hardware/ 
> (choose V2.2X there)
> I have nRF52833-QDAA (there is also a different option)

Under the "USB Communications" section, that page says:

USB classes supported	Mass Storage Class (MSC)
			Communications Device Class (CDC)
			CMSIS-DAP HID & WinUSB
			WebUSB CMSIS-DAP HID

You already know about the MSC and CDC classes.  The other two appear to 
be versions of a CMSIS-DAP HID protocol, which is clearly not a serial 
communications protocol since it is HID.

So it looks like you aren't missing anything.

> here is "details" on the board itself (describing firmware, I suppose)
> 
> # DAPLink Firmware - see https://daplink.io
> Build ID: alpha9-189-g5dd23001 (gcc)
> Unique ID: 9905360200052833525e24a702a68552000000006e052820
> HIC ID: 6e052820
> Auto Reset: 1
> Automation allowed: 0
> Overflow detection: 0
> Incompatible image detection: 1
> Page erasing: 0
> Daplink Mode: Interface
> Interface Version: 0256
> Bootloader Version: 0256
> Git SHA: 5dd23001a7a3199d74870790049d6686e183316c
> Local Mods: 0
> USB Interfaces: MSD, CDC, HID, WebUSB

Which agrees with the information on the web site.  I have no idea what 
WebUSB is supposed to be.  In the lsusb output it doesn't have any 
resources -- in particular, no endpoints -- so all of its communications 
must occur over endpoint 0.

> Bootloader CRC: 0xa60a7780
> Interface CRC: 0x0bac75fa
> Remount count: 0
> URL: https://microbit.org/device/?id=9905&v=0256

The dmesg log in your original message showed you were trying to bind 
the usb-serial generic driver to interfaces 4 and 5.  But interface 4 is 
the WebUSB thing which, whatever it is, certainly isn't a serial 
interface.  And interface 5 is another HID interface; it calls itself 
CMSIS-DAP v2.  It sounds like an updated form of the other CMSIS-DAP HID 
interface.  It probably would have bound to the HID driver if you hadn't 
told the usb-serial driver to control it.

In short, there's no reason at all to expect the micro:bit board to give 
rise to a ttyUSB device.

Alan Stern
