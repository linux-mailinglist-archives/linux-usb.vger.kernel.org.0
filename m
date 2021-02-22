Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57D90321B1E
	for <lists+linux-usb@lfdr.de>; Mon, 22 Feb 2021 16:18:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbhBVPQy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Feb 2021 10:16:54 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:38997 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbhBVPPV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Feb 2021 10:15:21 -0500
Received: from [123.112.65.49] (helo=[192.168.0.106])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <hui.wang@canonical.com>)
        id 1lECuw-0007bc-Bw; Mon, 22 Feb 2021 15:14:34 +0000
Subject: Re: [PATCH] USB: UAS: don't unbind and rebind the driver during
 usb_reset_device
To:     Oliver Neukum <oneukum@suse.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
References: <20210221085100.4297-1-hui.wang@canonical.com>
 <b1fe6cf4-b48f-c7e6-17c0-2ed04d8f3aa1@redhat.com>
 <ad6601a93f8fc4ec4d1451df5457e51aadf37301.camel@suse.com>
 <b28b38fa-3d19-3251-e576-38bd4d828ac1@canonical.com>
 <aba904f15b0bd07592ad59c00c07f6472c8d9663.camel@suse.com>
 <e7064799-0320-d662-47de-11181074130b@canonical.com>
 <9fd28086226b7b8b49ac9047a06e92e4da154f73.camel@suse.com>
From:   Hui Wang <hui.wang@canonical.com>
Message-ID: <2b6d426d-068e-a66f-b3e2-9c8f2de9b8d0@canonical.com>
Date:   Mon, 22 Feb 2021 23:14:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <9fd28086226b7b8b49ac9047a06e92e4da154f73.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 2/22/21 9:50 PM, Oliver Neukum wrote:
> Am Montag, den 22.02.2021, 21:02 +0800 schrieb Hui Wang:
>> On 2/22/21 8:51 PM, Oliver Neukum wrote:
>>> Am Montag, den 22.02.2021, 20:40 +0800 schrieb Hui Wang:
>>>> On 2/22/21 3:59 PM, Oliver Neukum wrote:
>>>> OK, will find a UAS device to do the test.
>>> Hi,
>>>
>>> do you have a design at all?
>> No, so far what I could find is all driven by usb-storage, I tested a
>> couple of usb-sdcard-readers and usb-scsi/ata disk adapters, they all
>> belong to USB_INTERFACE_INFO(USB_CLASS_MASS_STORAGE, USB_SC_SCSI,
>> USB_PR_BULK) instead of USB_INTERFACE_INFO(USB_CLASS_MASS_STORAGE,
>> USB_SC_SCSI, USB_PR_UAS). I plan to go to the office to find some usb
>> storage devices to test.
> Hi,
>
> please wait.  First of all, you are making the assumption that all
> resets originate from the SCSI layer. You cannot make that assumption.
>
> Secondly, yes, ideally we should not pretend that a disconnect has
> happened, when it hasn't happened, but what is your alternative.
> What exactly do you want to test? You have not even defined the
> desirable behavior and the problem you are seeing with the current
> behavior.

I planed to forcibly (simulate) trigger calling 
eh_device_reset_handler() from scsi layer and let pre_reset() or 
post_reset() return a non-zero, and test if there is use-after-free 
issue in the rest part of eh_device_reset_handler() and its callers. But 
after thinking of your comment, looks like I was wrong. Thanks for your 
instructions on this issue.

Thanks,

Hui.

> 	Regards
> 		Oliver
>
>
