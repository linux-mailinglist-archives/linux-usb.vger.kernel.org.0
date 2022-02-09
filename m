Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6891C4AEFF5
	for <lists+linux-usb@lfdr.de>; Wed,  9 Feb 2022 12:30:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbiBIL3w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Feb 2022 06:29:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbiBIL3v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Feb 2022 06:29:51 -0500
X-Greylist: delayed 520 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 09 Feb 2022 02:23:15 PST
Received: from mpx1.rcs-rds.ro (mpx1.rcs-rds.ro [212.54.120.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30F80E04EC3E
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 02:23:14 -0800 (PST)
Received: from webmail.rcs-rds.ro (unknown [212.54.120.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mpx1.rcs-rds.ro (Postfix) with ESMTPSA id 5D27B1E1C4E;
        Wed,  9 Feb 2022 12:13:28 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rcs-rds.ro;
        s=MailProxy; t=1644401610;
        bh=9Y3CivBiJoLyuOCRpJ4DPiWQfWvG+gKtkvMn0jb4Y4E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References;
        b=TsW3xOPEHh7Mcb2EcEzHTuKGQdiWTKuJYT241djZZcNDyIy9mnro2RZ755cFfPbIj
         YFW9uHI1FJ433AN8gn9N5U38NOa495P5Rdbwtv1XP0NLxkF/3hAdi7U442WcgTlN1G
         UuU4W7XufLinRRXxnDewr2rB1ylVPPjqYtj4YjeY=
Received: from 82-76-245-177.rdsnet.ro ([82.76.245.177])
 via 82-76-245-177.rdsnet.ro ([82.76.245.177])
 by webmail.rcs-rds.ro
 with HTTP (HTTP/1.1 POST); Wed, 09 Feb 2022 12:13:28 +0200
MIME-Version: 1.0
Date:   Wed, 09 Feb 2022 12:13:28 +0200
From:   Eduard-Bogdan Budai <eduard.budai@rcs-rds.ro>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Bug report for pl2303 converter (ATEN USB to serial Bridge,
 idVendor=067b, idProduct=23a3, bcdDevice= 1.05)
Organization: RCS&RDS Cluj
In-Reply-To: <YgJCwn5s1Cv/LT5I@kroah.com>
References: <10d4dbe9-4b17-aeb5-0abe-bf0829173c1d@rcs-rds.ro>
 <e85bac58-6d40-b61a-b217-8c4ee3c5853e@rcs-rds.ro>
 <YgJCwn5s1Cv/LT5I@kroah.com>
Message-ID: <35338b26-41db-e772-235a-502caa30e00f@rcs-rds.ro>
X-Sender: eduard.budai@rcs-rds.ro
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DEAR_SOMETHING,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

  Thank you very much for your answer.

The newest kernel that is in the standard Ubuntu 20.04 repositories is
today Linux 5.13.0-28-generic #31~20.04.1-Ubuntu SMP Wed Jan 19 14:08:10
UTC 2022 x86_64). After moving from 5.13.0-27-generic #29~20.04.1-Ubuntu
to the newest 5.13.0-28-generic #31~20.04.1-Ubuntu, the dmesg showed:

[Wed Feb  9 11:38:51 2022] usb 3-2: new full-speed USB device number 4
using xhci_hcd
[Wed Feb  9 11:38:51 2022] usb 3-2: New USB device found, idVendor=067b,
idProduct=23a3, bcdDevice= 1.05
[Wed Feb  9 11:38:51 2022] usb 3-2: New USB device strings: Mfr=1,
Product=2, SerialNumber=0
[Wed Feb  9 11:38:51 2022] usb 3-2: Product: ATEN USB to Serial Bridge
[Wed Feb  9 11:38:51 2022] usb 3-2: Manufacturer: Prolific Technology
Inc.
[Wed Feb  9 11:38:51 2022] usbcore: registered new interface driver
usbserial_generic
[Wed Feb  9 11:38:51 2022] usbserial: USB Serial support registered for
generic
[Wed Feb  9 11:38:51 2022] usbcore: registered new interface driver
pl2303
[Wed Feb  9 11:38:51 2022] usbserial: USB Serial support registered for
pl2303
[Wed Feb  9 11:38:51 2022] pl2303 3-2:1.0: unknown device type, please
report to linux-usb@vger.kernel.org

A 5.4.0-99-generic #112~18.04.1-Ubuntu SMP Thu Feb 3 14:09:57 UTC 2022
x86_64 from a Ubuntu 18.04 recognizes the same adapter as a ttyUSB0
(which is what is needed to be used).

Unfortunately, the environment in which happened what I described below
has certain restrictions that don't allow me to try a newer kernel than
the newest that is in the standard Ubuntu repositories...

So, in my humble opinion, we will just have to wait for the 5.16 to
appear in the standard Ubuntu repositories.

Thank you again. Very much.

On 08.02.2022 12:15, Greg KH wrote:

> On Thu, Jan 20, 2022 at 05:08:15PM +0200, Eduard-Bogdan Budai wrote:
> 
>> Dear Sirs,
>> 
>> Today, when a USB-RJ45 adapter was conected to a computer running
>> Ubuntu
>> 20.04.3 in its dmesg appeared:
>> 
>> [Thu Jan 20 15:24:17 2022] usb 1-3.1: new full-speed USB device
>> number 7
>> using xhci_hcd
>> [Thu Jan 20 15:24:17 2022] usb 1-3.1: New USB device found,
>> idVendor=067b,
>> idProduct=23a3, bcdDevice= 1.05
>> [Thu Jan 20 15:24:17 2022] usb 1-3.1: New USB device strings: Mfr=1,
>> Product=2, SerialNumber=0
>> [Thu Jan 20 15:24:17 2022] usb 1-3.1: Product: ATEN USB to Serial
>> Bridge
>> [Thu Jan 20 15:24:17 2022] usb 1-3.1: Manufacturer: Prolific
>> Technology Inc.
>> [Thu Jan 20 15:24:17 2022] pl2303 1-3.1:1.0: pl2303 converter
>> detected
>> [Thu Jan 20 15:24:17 2022] pl2303 1-3.1:1.0: unknown device type,
>> please
>> report to linux-usb@vger.kernel.org
>> 
>> The kernel version is 5.13.0-27-generic #29~20.04.1-Ubuntu.
> 
> Should be fixed in newer kernel versions, this is a quite old and
> obsolete kernel version.  Can you try 5.16?
> 
> thanks,
> 
> greg k-h

-- 
Eduard-Bogdan Budai
IT Hardware Cluj
it.cluj@rcs-rds.ro
.............................................................................
mobile: 0770/064481
office: 0364/400427
e-mail: eduard.budai@rcs-rds.ro
.............................................................................
Privileged/Confidential Information may be contained in this message. If
you are not in the addresses indicated in this message (or responsible
for delivery of the message to such person), you may not copy or deliver
this message to anyone. In such a case, you should destroy this message
and kindly notify the sender by reply e-mail.
.............................................................................
