Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8177B654B2E
	for <lists+linux-usb@lfdr.de>; Fri, 23 Dec 2022 03:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbiLWCke convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 22 Dec 2022 21:40:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbiLWCkd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Dec 2022 21:40:33 -0500
X-Greylist: delayed 58089 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 22 Dec 2022 18:40:31 PST
Received: from fallback4.mail.ox.ac.uk (fallback4.mail.ox.ac.uk [129.67.1.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 688D218E25
        for <linux-usb@vger.kernel.org>; Thu, 22 Dec 2022 18:40:31 -0800 (PST)
Received: from relay20.mail.ox.ac.uk ([163.1.2.170])
        by fallback4.mail.ox.ac.uk with esmtp (Exim 4.92)
        (envelope-from <dimpase@cs.ox.ac.uk>)
        id 1p8Is9-0000YK-GR; Thu, 22 Dec 2022 10:32:21 +0000
Received: from smtp8.mail.ox.ac.uk ([163.1.2.204])
        by relay20.mail.ox.ac.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <dimpase@cs.ox.ac.uk>)
        id 1p8Is1-000735-Fh; Thu, 22 Dec 2022 10:32:13 +0000
Received: from 170.red-88-24-106.staticip.rima-tde.net ([88.24.106.170]:37392 helo=[127.0.0.1])
        by smtp8.mail.ox.ac.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <dimpase@cs.ox.ac.uk>)
        id 1p8Is0-000350-So; Thu, 22 Dec 2022 10:32:13 +0000
Date:   Thu, 22 Dec 2022 10:32:09 +0000
From:   Dima Pasechnik <dimpase@cs.ox.ac.uk>
To:     Alan Stern <stern@rowland.harvard.edu>, dima.pasechnik@cs.ox.ac.uk
CC:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: usb 1-3: Product: BBC micro:bit CMSIS-DAP not recognised
User-Agent: K-9 Mail for Android
In-Reply-To: <Y6ITkWEb25Si4zts@rowland.harvard.edu>
References: <Y6Bfx+Ksm/Qz3N8y@hilbert> <Y6B8jd7dHsa85Wny@kroah.com> <Y6CRbgwHzjr2KNxK@hilbert> <Y6CpKxZ4KsiYttbL@hilbert> <Y6Csfzqvy6GExhVB@kroah.com> <Y6DjwFAp4M8I+T4P@hilbert> <Y6Fc2Fz8w4KoX952@kroah.com> <Y6HLqYpxwT+v3BgX@hilbert> <Y6ITkWEb25Si4zts@rowland.harvard.edu>
Message-ID: <35B854FE-1F32-47FD-8ED1-CDE033327531@cs.ox.ac.uk>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Oxford-Username: coml0531
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 20 December 2022 19:57:05 WET, Alan Stern <stern@rowland.harvard.edu> wrote:
>On Tue, Dec 20, 2022 at 02:50:17PM +0000, dima.pasechnik@cs.ox.ac.uk wrote:
>> See https://tech.microbit.org/hardware/ 
>> (choose V2.2X there)
>> I have nRF52833-QDAA (there is also a different option)
>
>Under the "USB Communications" section, that page says:
>
>USB classes supported	Mass Storage Class (MSC)
>			Communications Device Class (CDC)
>			CMSIS-DAP HID & WinUSB
>			WebUSB CMSIS-DAP HID
>
>You already know about the MSC and CDC classes.  The other two appear to 
>be versions of a CMSIS-DAP HID protocol, which is clearly not a serial 
>communications protocol since it is HID.
>
>So it looks like you aren't missing anything.
>
>> here is "details" on the board itself (describing firmware, I suppose)
>> 
>> # DAPLink Firmware - see https://daplink.io
>> Build ID: alpha9-189-g5dd23001 (gcc)
>> Unique ID: 9905360200052833525e24a702a68552000000006e052820
>> HIC ID: 6e052820
>> Auto Reset: 1
>> Automation allowed: 0
>> Overflow detection: 0
>> Incompatible image detection: 1
>> Page erasing: 0
>> Daplink Mode: Interface
>> Interface Version: 0256
>> Bootloader Version: 0256
>> Git SHA: 5dd23001a7a3199d74870790049d6686e183316c
>> Local Mods: 0
>> USB Interfaces: MSD, CDC, HID, WebUSB
>
>Which agrees with the information on the web site.  I have no idea what 
>WebUSB is supposed to be.

WebUSB is a JavaScript API, supported by Chromium -derived browsers (Firefox not there yet)

https://en.wikipedia.org/wiki/WebUSB


>  In the lsusb output it doesn't have any 
>resources -- in particular, no endpoints -- so all of its communications 
>must occur over endpoint 0.
>
>> Bootloader CRC: 0xa60a7780
>> Interface CRC: 0x0bac75fa
>> Remount count: 0
>> URL: https://microbit.org/device/?id=9905&v=0256
>
>The dmesg log in your original message showed you were trying to bind 
>the usb-serial generic driver to interfaces 4 and 5.  But interface 4 is 
>the WebUSB thing which, whatever it is, certainly isn't a serial 
>interface.  And interface 5 is another HID interface; it calls itself 
>CMSIS-DAP v2.  It sounds like an updated form of the other CMSIS-DAP HID 
>interface.  It probably would have bound to the HID driver if you hadn't 
>told the usb-serial driver to control it.
>
>In short, there's no reason at all to expect the micro:bit board to give 
>rise to a ttyUSB device.

Thanks for the advice, much appreciated.

Best,
Dmitrii

>
>Alan Stern
