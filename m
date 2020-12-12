Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5A82D8625
	for <lists+linux-usb@lfdr.de>; Sat, 12 Dec 2020 12:02:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438830AbgLLLCA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 12 Dec 2020 06:02:00 -0500
Received: from mx3.molgen.mpg.de ([141.14.17.11]:58381 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2438829AbgLLLCA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 12 Dec 2020 06:02:00 -0500
Received: from [192.168.0.2] (ip5f5af43e.dynamic.kabel-deutschland.de [95.90.244.62])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 0FCD22064621F;
        Sat, 12 Dec 2020 12:01:18 +0100 (CET)
Subject: Re: usb usb1-port10: disabled by hub (EMI?), re-enabling...
To:     Mario Limonciello <Mario.Limonciello@dell.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        USB list <linux-usb@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
References: <c8408e58-8bc3-dbe7-2a99-1b1f0d3eae21@molgen.mpg.de>
 <X89ABDFgyjpQPeRq@kroah.com>
 <8c5d6edd-d41b-0d86-e0ea-d1a1689625de@molgen.mpg.de>
 <DM6PR19MB2636B65562B4A768A9629E94FACD0@DM6PR19MB2636.namprd19.prod.outlook.com>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <c441ebc6-1c31-919d-784c-1ae704ef7ffe@molgen.mpg.de>
Date:   Sat, 12 Dec 2020 12:01:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB2636B65562B4A768A9629E94FACD0@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear Mario, dear Greg,


Am 08.12.20 um 19:16 schrieb Limonciello, Mario:
>>>> On a Dell Precision 3540/0M14W7, BIOS 1.9.1 07/06/2020
>>>>
>>>>       $ lspci -nn | grep -i usb
>>>>       00:14.0 USB controller [0c03]: Intel Corporation Cannon Point-LP USB 3.1 xHCI Controller [8086:9ded] (rev 30)
>>>>       3a:00.0 USB controller [0c03]: Intel Corporation JHL6340 Thunderbolt 3 USB 3.1 Controller (C step) [Alpine Ridge 2C 2016] [8086:15db] (rev 02)
>>>>
>>>> at each boot Linux 5.6 to 5.9 logs the error below.
>>>>
>>>>       [   95.528190] usb usb1-port10: disabled by hub (EMI?), re-enabling...
>>>>
>>>> Everything seems to be fine, so I wonder, why this is level error. Is it a
>>>> hardware error?
>>>
>>> Yes, it is a hardware issue.
> 
> To me from your logs it looks like it's Intel BT device with this problem.
> https://linux-hardware.org/index.php?id=usb:8087-0aaa
> 
> Does BT actually work after bootup completes?

Asking the user, and checking the device, no Bluetooth device is listed 
by GNOME.

> BTW I notice that you are setting auto-suspend on your kernel command line.  Presumably
> that's not the default for this module.  Is this possibly causing the behavior?

Good point. I removed it, and the behavior was the same.

> Also I notice that you have an error loading firmware for the device.  You might check
> that you have the latest firmware from linux-firmware.  If you do - maybe it's related
> to the HW error?
> 
> [  105.743441] Bluetooth: hci0: Failed to send firmware data (-110)
> [  105.743558] Bluetooth: hci0: sending frame failed (-19)
> [  105.743633] Bluetooth: hci0: Intel reset sent to retry FW download
> 
> And lastly if you want to confirm it's actually BT causing the problem, I believe you
> should be able to turn off BT in UEFI firmware setup.

Good idea. I did that, and disabling the BT device in the firmware 
(which took several seconds), the error was gone.

>> Thank you for the confirmation. Mario, do you know if this issues is
>> known to the Dell hardware team?
> 
> I'm sorry, I don't know.  You would need to work with the support team on a case.
> 
> My own opinion:
> I would suspect you'll have a better result if there is a functional issue to show.

Thank you for your help. The device seems broken, but I’ll try to find 
some live system to rule out a problem with Debian.


Kind regards,

Paul
