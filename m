Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE5FF293AE6
	for <lists+linux-usb@lfdr.de>; Tue, 20 Oct 2020 14:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394235AbgJTMDq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 08:03:46 -0400
Received: from aibo.runbox.com ([91.220.196.211]:49798 "EHLO aibo.runbox.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394233AbgJTMDq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Oct 2020 08:03:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
         s=selector1; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
        bh=b4/9JNOv8WOIJkZklNNw32fULFEm1U90ImNpiICzduM=; b=ZOUOwnZneENVr0ZzrW3BySQB5B
        FuOgY3WX0UxDaR0lLzs7LITqn/4ynTL35LAEwTFWv56BS8p2Tgi/K727ZA6G7LsbOvjDIQRysZNYA
        pwSQFuRf+A0GbUS/AY8E2PB6XPAxlZ1FDoEcch1S7D7EYxxVR0Q4C6eIT1JmwhheqIZ7hhSy9vl01
        0FgfUjoP7w3CDvrgyVs2Res2qVlCDb3qwKr8A8LXbPiOysKITpTi4YMSqHh4pMNTMSsCYDbz0fI6e
        Nh6Pb3WU2omu6S/ZRPH7YV7y3rnYIdz2pqiPZKI390V2+S+/Oillo0f4agWrJ1xSs3U6WAzLayNl8
        8kWdlVQA==;
Received: from [10.9.9.72] (helo=submission01.runbox)
        by mailtransmit02.runbox with esmtp (Exim 4.86_2)
        (envelope-from <m.v.b@runbox.com>)
        id 1kUqMg-0005V0-FB; Tue, 20 Oct 2020 14:03:42 +0200
Received: by submission01.runbox with esmtpsa  [Authenticated alias (536975)]  (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        id 1kUqMQ-0003av-M5; Tue, 20 Oct 2020 14:03:26 +0200
Subject: Re: Bug caused by 53965c79c2db (USB: Fix device driver race)
To:     Alan Stern <stern@rowland.harvard.edu>,
        Pany <pany@fedoraproject.org>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org
References: <CAE3RAxt0WhBEz8zkHrVO5RiyEOasayy1QUAjsv-pB0fAbY1GSw@mail.gmail.com>
 <20201017200200.GB842001@rowland.harvard.edu>
 <CAE3RAxvNUvzqKT+GK3A4cQ7Tm_tFRQJKfJ01r0ic-5066fikDA@mail.gmail.com>
 <20201019174028.GF898631@rowland.harvard.edu>
From:   "M. Vefa Bicakci" <m.v.b@runbox.com>
Message-ID: <cf1e7059-e1d2-2e7a-89c1-0c162850fbb4@runbox.com>
Date:   Tue, 20 Oct 2020 08:03:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201019174028.GF898631@rowland.harvard.edu>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19/10/2020 13.40, Alan Stern wrote:
> On Mon, Oct 19, 2020 at 09:36:00AM +0000, Pany wrote:
>> On Sat, Oct 17, 2020 at 8:02 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>>>
>>> On Sat, Oct 17, 2020 at 04:07:11PM +0000, Pany wrote:
>>>> Hi,
>>>>
>>>> I installed fedora 32 into an SD card, with which I booted my Macbook.
>>>> It had worked well before, until I upgraded the kernel from 5.8.5 to
>>>> 5.8.6 [1].
>>>>
>>>> With kernel-5.8.6-200.fc32.x86_64.rpm [2] installed, the boot process
>>>> would be stuck at "A start job is running for
>>>> /dev/mapper/fedora_localhost_--live-home (<time> / no limit)" (See the
>>>> photo of screen [3]).
>>>>
>>>> By appending "systemd.debug-shell=1" to the kernel cmdline, I saved
>>>> the journal [4].
>>>>
>>>> This issue has been bisected to commit
>>>> 53965c79c2dbdc898ffc7fdbab37e920594f5e14 ("USB: Fix device driver
>>>> race")
>>>>
>>>> If I revert this commit, the kernel 5.8.6 would boot successfully.
>>>
>>> This should have been fixed in 5.8.14 or 5.8.15 (5.8.14 was released on
>>> the same day that the fix was installed; I'm not sure which came first).
>>> At any rate it certainly should work with the most recent 5.8.y kernel.
>>>
>>> Alan Stern
>>
>> I tried, but neither 5.8.14 nor 5.8.15 worked for me.
> 
> Hmmm.  Looking at the system log you captured, it appears that the
> problem the SD card reader's driver getting reprobed incorrectly.  The
> details aren't clear, but the log shows the device getting probed twice,
> once as sdb and once as sdc.  If the system tried to mount one of the
> sdb partitions as the root, and then sdb disappeared, that could explain
> what you see.
> 
> I don't know why this is happening.  But you can try adding some
> debugging messages of your own.  In drivers/usb/core/driver.c, the
> routine __usb_bus_reprobe_drivers() should never reach the line that
> calls device_reprobe() unless the USBIP or apple-mfi-fastcharge driver
> is installed -- and neither of those should be involved with the card
> reader device.  You can add a line saying:
> 
> 	dev_info(dev, "new driver %s\n", new_udriver->name);
> 
> at that point and see what it produces in the log.

Hello all,

Sorry for my lateness!

I reviewed Pany's logs, and the issue appears to be related to the
automatic loading of the apple-mfi-fastcharge USB driver, which triggers
a re-probe of the SD card reader, as pointed out earlier.

This happens because the id_table of the aforementioned USB driver
(mfi_fc_id_table) matches all USB products manufactured by Apple:

  35 static const struct usb_device_id mfi_fc_id_table[] = {
  36         { .idVendor = APPLE_VENDOR_ID,
  37           .match_flags = USB_DEVICE_ID_MATCH_VENDOR },
  38         {},
  39 };
  ...
218 static struct usb_device_driver mfi_fc_driver = {
219         .name =         "apple-mfi-fastcharge",
220         .probe =        mfi_fc_probe,
221         .disconnect =   mfi_fc_disconnect,
222         .id_table =     mfi_fc_id_table,
223         .generic_subclass = 1,
224 };


... and Pany's system has multiple USB devices manufactured by Apple
(including the SD card reader), with the vendor code 0x05ac, which is
the value included by the id_table of the apple-mfi-fastcharge driver:

Sep 29 15:22:48 fedora.local kernel: usb 2-3: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
Sep 29 15:22:48 fedora.local kernel: usb 2-3: New USB device found, idVendor=05ac, idProduct=8406, bcdDevice= 8.20
Sep 29 15:22:48 fedora.local kernel: usb 2-3: New USB device strings: Mfr=3, Product=4, SerialNumber=5
Sep 29 15:22:48 fedora.local kernel: usb 2-3: Product: Card Reader
Sep 29 15:22:48 fedora.local kernel: usb 2-3: Manufacturer: Apple
...
Sep 29 15:22:48 fedora.local kernel: usb 1-5: new full-speed USB device number 3 using xhci_hcd
Sep 29 15:22:48 fedora.local kernel: usb 1-5: New USB device found, idVendor=05ac, idProduct=0273, bcdDevice= 6.22
Sep 29 15:22:48 fedora.local kernel: usb 1-5: New USB device strings: Mfr=1, Product=2, SerialNumber=3
Sep 29 15:22:48 fedora.local kernel: usb 1-5: Product: Apple Internal Keyboard / Trackpad
Sep 29 15:22:48 fedora.local kernel: usb 1-5: Manufacturer: Apple Inc.
...

One way to fix this issue would be to implement a match function in the
apple-mfi-fastcharge driver, possibly instead of an id_table, so that it
does not match devices that it cannot bind to. This may require other
changes in the USB core that I cannot fathom at the moment.

Pany, in the mean-time, could you add the following string to your kernel's
command line (i.e., via GRUB, or the actual boot-loader that you use) and
let us know whether it helps to *work around* this issue with the latest
versions of 5.8.y kernels?

	module_blacklist=apple-mfi-fastcharge

To emphasize, I am only suggesting this as a work-around, not as an actual
solution.

My time is a bit limited due to having restarted full-time employment,
but I can work on this issue during the weekend.

Thanks!

Vefa
