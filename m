Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D11E330313
	for <lists+linux-usb@lfdr.de>; Sun,  7 Mar 2021 17:53:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbhCGQwZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Mar 2021 11:52:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232516AbhCGQwZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 7 Mar 2021 11:52:25 -0500
Received: from smtp.gentoo.org (woodpecker.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32F4CC06174A
        for <linux-usb@vger.kernel.org>; Sun,  7 Mar 2021 08:52:25 -0800 (PST)
From:   Matthias Schwarzott <zzam@gentoo.org>
Subject: Re: Amazon Kindle disconnect after Synchronize Cache
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        hirofumi@mail.parknet.co.jp
References: <9f57532f-1fb7-0fdd-b91c-2dfecef5aff3@gentoo.org>
 <20210305191437.GC48113@rowland.harvard.edu>
 <2a1f6636-6b57-ccc5-76b3-7eae5e80e7d3@gentoo.org>
 <20210307155236.GB103559@rowland.harvard.edu>
Message-ID: <9c3121a9-3d0c-60b3-ef17-993b7d2e9149@gentoo.org>
Date:   Sun, 7 Mar 2021 17:52:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210307155236.GB103559@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am 07.03.21 um 16:52 schrieb Alan Stern:
> On Sun, Mar 07, 2021 at 06:58:10AM +0100, Matthias Schwarzott wrote:
>> Am 05.03.21 um 20:14 schrieb Alan Stern:
>>> Is runtime power management enabled?  Maybe the Kindle disconnects
>>> whenever the computer tries to suspend it.  This typically happens 2
>>> seconds after the last command was issued, which matches your
>>> observations.  If runtime PM is enabled, you can try disabling it.
>>>
>> I assume this means autosuspend is not used:
>>
>> # cat /sys/block/sde/device/power/control
>> on
> 
> This means autosuspend isn't used for the sde drive.  But the log
> extract above shows that the Kindle is sdc, not sde.
> 
Yes, confusing. From different boots with another usb disc not detected.

This time Kindle is sde again:

# dmesg |tail
[83709.973141] usb-storage 3-4:1.0: USB Mass Storage device detected
[83709.973226] scsi host8: usb-storage 3-4:1.0
[83711.028665] scsi 8:0:0:0: Direct-Access     Kindle   Internal Storage 
0100 PQ: 0 ANSI: 2
[83711.028792] sd 8:0:0:0: Attached scsi generic sg5 type 0
[83711.031536] sd 8:0:0:0: Power-on or device reset occurred
[83711.046604] sd 8:0:0:0: [sde] Attached SCSI removable disk
[83713.145467] sd 8:0:0:0: [sde] 6688768 512-byte logical blocks: (3.42 
GB/3.19 GiB)
[83713.364900] sd 8:0:0:0: [sde] Write cache: enabled, read cache: 
enabled, doesn't support DPO or FUA
[83713.364906] sde: detected capacity change from 0 to 6688768
[83713.368036]  sde: sde1
# cat /sys/block/sde/device/power/control
on

power/control reports the same value for all sd? devices on this system.

Matthias
