Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7C8294730
	for <lists+linux-usb@lfdr.de>; Wed, 21 Oct 2020 06:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440122AbgJUESf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 00:18:35 -0400
Received: from aibo.runbox.com ([91.220.196.211]:60492 "EHLO aibo.runbox.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2411917AbgJUESe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Oct 2020 00:18:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
         s=selector1; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
        bh=uOBSRld1N2/G/9+5k7VkTr6lVKZgaeXngUqOXvUcscc=; b=F4ZeTf4dN/1pWl/g36KJzhnWyM
        Oahl85/gmu/NZYSXxAtnM10xTA/Rdjx66onxnmCTYtRRiKxYQ03f2sqOPxdEKHA7pEzb7XRyo/gsP
        6u1QIsg+t1TDxzFDINOvKD8CxkpLiNgolPG1p+u02qX5wzd3W+XbpbLo6AeYeaPXwSLyB40MMjwHP
        NXPye3E7dd25XtXJ/Qjcd4E4cm056Nw6ZnlRhOCD4TpLyF1Ib7QJw0lZXsBxZNSWNxBu+t0nu2TOT
        /De86bGgjmEhyMt7PJS3lTIg0CB5kKJXJEGZrSlWpKMSjtPwtL+EkhXtbMgwGCIqyRvdW0VObcLRc
        xg2X8EeA==;
Received: from [10.9.9.73] (helo=submission02.runbox)
        by mailtransmit02.runbox with esmtp (Exim 4.86_2)
        (envelope-from <m.v.b@runbox.com>)
        id 1kV5a3-0003EF-0H; Wed, 21 Oct 2020 06:18:31 +0200
Received: by submission02.runbox with esmtpsa  [Authenticated alias (536975)]  (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        id 1kV5a1-00066G-0y; Wed, 21 Oct 2020 06:18:29 +0200
Subject: Re: Bug caused by 53965c79c2db (USB: Fix device driver race)
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Pany <pany@fedoraproject.org>, Bastien Nocera <hadess@hadess.net>,
        linux-usb@vger.kernel.org
References: <CAE3RAxt0WhBEz8zkHrVO5RiyEOasayy1QUAjsv-pB0fAbY1GSw@mail.gmail.com>
 <20201017200200.GB842001@rowland.harvard.edu>
 <CAE3RAxvNUvzqKT+GK3A4cQ7Tm_tFRQJKfJ01r0ic-5066fikDA@mail.gmail.com>
 <20201019174028.GF898631@rowland.harvard.edu>
 <cf1e7059-e1d2-2e7a-89c1-0c162850fbb4@runbox.com>
 <20201020152859.GA945128@rowland.harvard.edu>
From:   "M. Vefa Bicakci" <m.v.b@runbox.com>
Message-ID: <74e25095-53fa-b98c-6baf-c97eea574d1c@runbox.com>
Date:   Wed, 21 Oct 2020 00:18:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201020152859.GA945128@rowland.harvard.edu>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20/10/2020 11.28, Alan Stern wrote:
> On Tue, Oct 20, 2020 at 08:03:23AM -0400, M. Vefa Bicakci wrote:
>> On 19/10/2020 13.40, Alan Stern wrote:
>>> On Mon, Oct 19, 2020 at 09:36:00AM +0000, Pany wrote:
[Snipped by Vefa]
>>
>> ... and Pany's system has multiple USB devices manufactured by Apple
>> (including the SD card reader), with the vendor code 0x05ac, which is
>> the value included by the id_table of the apple-mfi-fastcharge driver:
>>
>> Sep 29 15:22:48 fedora.local kernel: usb 2-3: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
>> Sep 29 15:22:48 fedora.local kernel: usb 2-3: New USB device found, idVendor=05ac, idProduct=8406, bcdDevice= 8.20
>> Sep 29 15:22:48 fedora.local kernel: usb 2-3: New USB device strings: Mfr=3, Product=4, SerialNumber=5
>> Sep 29 15:22:48 fedora.local kernel: usb 2-3: Product: Card Reader
>> Sep 29 15:22:48 fedora.local kernel: usb 2-3: Manufacturer: Apple
>> ...
>> Sep 29 15:22:48 fedora.local kernel: usb 1-5: new full-speed USB device number 3 using xhci_hcd
>> Sep 29 15:22:48 fedora.local kernel: usb 1-5: New USB device found, idVendor=05ac, idProduct=0273, bcdDevice= 6.22
>> Sep 29 15:22:48 fedora.local kernel: usb 1-5: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>> Sep 29 15:22:48 fedora.local kernel: usb 1-5: Product: Apple Internal Keyboard / Trackpad
>> Sep 29 15:22:48 fedora.local kernel: usb 1-5: Manufacturer: Apple Inc.
>> ...
>>
>> One way to fix this issue would be to implement a match function in the
>> apple-mfi-fastcharge driver, possibly instead of an id_table, so that it
>> does not match devices that it cannot bind to. This may require other
>> changes in the USB core that I cannot fathom at the moment.
> 
> How about matching on the vendor ID and the product ID?  That would be
> an easy addition to the ID table.  Do the fastcharge devices have a well
> known product ID?
> 
> Alan Stern

Hello Alan,

Thank you for the feedback! Judging from the driver's code, it looks like
the product identifiers are known, but there unfortunately appear to be
256 possible product identifiers (i.e., 0x00->0xFF):


  23 /* The product ID is defined as starting with 0x12nn, as per the
  24  * "Choosing an Apple Device USB Configuration" section in
  25  * release R9 (2012) of the "MFi Accessory Hardware Specification"
  26  *
  27  * To distinguish an Apple device, a USB host can check the device
  28  * descriptor of attached USB devices for the following fields:
  29  * - Vendor ID: 0x05AC
  30  * - Product ID: 0x12nn
  31  *
  32  * Those checks will be done in .match() and .probe().
  33  */
...
166 static int mfi_fc_probe(struct usb_device *udev)
167 {
...
171
172         idProduct = le16_to_cpu(udev->descriptor.idProduct);
173         /* See comment above mfi_fc_id_table[] */
174         if (idProduct < 0x1200 || idProduct > 0x12ff) {
175                 return -ENODEV;
176         }

A quick look at drivers/usb/core/driver.c::usb_match_device indicates
that it is not yet possible to specify ranges in ID tables of USB
drivers, so I think that we would need to replace the ID table with
a match function. Interestingly enough, the comment block quoted
above mentions the use of a match function as well.

Thank you,

Vefa

As a reminder to myself, removing the ID table from the apple-mfi-fastcharge
driver and implementing a match function in this driver will likely require
cherry-picking the following commit to 5.8.y:
	0ed9498f9ecf ("USB: Simplify USB ID table match")
