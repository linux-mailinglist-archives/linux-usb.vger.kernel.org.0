Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5B075C8CB
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 07:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbfGBF3T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 01:29:19 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:10318 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbfGBF3S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jul 2019 01:29:18 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1aebac0000>; Mon, 01 Jul 2019 22:29:16 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 01 Jul 2019 22:29:17 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 01 Jul 2019 22:29:17 -0700
Received: from [10.19.108.127] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Jul
 2019 05:29:16 +0000
Subject: Re: [PATCH] usb: storage: skip only when uas driver is loaded
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, <stern@rowland.harvard.edu>,
        <usb-storage@lists.one-eyed-alien.net>, <oneukum@suse.com>
References: <20190701084848.32502-1-jckuo@nvidia.com>
 <20190701085248.GA28681@kroah.com>
 <8e8e8703-8620-b625-4917-bbb8d999caa4@nvidia.com>
 <20190702044249.GA694@kroah.com>
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <f6ed2505-5da9-c217-a052-a19d197c5c8e@nvidia.com>
Date:   Tue, 2 Jul 2019 13:29:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190702044249.GA694@kroah.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1562045356; bh=cGO5oVOl6Tcoyjq+IeJlWiq2/aXzxMPj3o/BESBGJtk=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=BSjsVnTYR3g6zSD/JxoQuG6RuxjBWaoEHrJe56U+F9YTin7c6TE9Z5+S59YekRVHb
         xDollmWmm4bOEao6tT2S8nedl2hCKcb11vGZoufHNcy8m2NZx5cXJlB8xCccFGhML+
         0tAQximVwCfOmA6nCBB2lWTwPECXVHBDJl/xbaudZL+xt4eCQdZXKiXV+fEn4G0Zny
         wt0wRQHb3b+sUckv0NzWVIpHAejV9tJaVzhJQp9HLZ6jFMfVcc/ivIMGdJ23dBX88M
         iL+315FEHygKppB6Q5PWHTbD3CIuNFSHXF1z3b4khOmJHmZhbaS9VAVrHYFThxz/b+
         67vVpIYA3urRQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/2/19 12:42 PM, Greg KH wrote:
> On Tue, Jul 02, 2019 at 10:36:59AM +0800, JC Kuo wrote:
>> On 7/1/19 4:52 PM, Greg KH wrote:
>>> On Mon, Jul 01, 2019 at 04:48:48PM +0800, JC Kuo wrote:
>>>> When usb-storage driver detects a UAS capable device, it ignores the
>>>> device if CONFIG_USB_UAS is enabled. usb-storage driver assumes uas
>>>> driver certainly will be loaded. However, it's possible that uas
>>>> driver will not be loaded, for example, uas kernel module is not
>>>> installed properly or it is in modprobe blacklist.
>>>>
>>>> In case of uas driver not being loaded, the UAS capable device will
>>>> not fallback to work at Bulk-only-transfer mode. The device just
>>>> disappears without any notification to user/userspace.
>>>>
>>>> This commit changes usb-storage driver to skip UAS capable device
>>>> only when uas driver is already loaded to make sure the device will
>>>> at least work with Bulk protocol.
>>>
>>> But what happens if the driver is loaded afterward, because 'modprobe'
>>> was called by the driver core (or it should have been, because this is a
>>> device that supports that protocol)?
>> If uas driver is loaded after usb-storage driver probed the device,
>> the device will still work with Bulk-only protocol, though it can't
>> make uses of streams.
> 
> Which is not a good thing, and is what the original code was there to
> prevent happening.
> 
>>> I think you just broke working systems :(
>>>
>>> Why wouldn't the UAS driver get loaded automatically if it is configured
>>> in the system as it is today?
>> An user might want to completely disable uas for some reason so he/she
>> adds "blacklist uas" to modprobe conf file. I think in case of this,
>> usb-storage driver has to enable this device with the legacy Bulk-only
>> protocol instead of ignoring the device.
> 
> Why would they want to do that?  Where are people doing this in ways
> that breaks their systems?

I think that could be because user sees issues with UAS but he/she is not
aware of the quirks parameter that usb-storage module offers to disable UAS
for any particular device.

IMHO, blacklisting uas driver should not break the system because the UAS
devices are supposed to be working fine with legacy Bulk-only protocol if
system software doesn't have UAS support.

> 
>> As an alternative to this patch, I thought I could get uas driver
>> loaded before usb-storage driver so I tried moving the functions in
>> drivers/usb/storage/uas-detect.h into uas.c and letting usb-storage
>> links uas_use_uas_driver() of uas.ko. However, that didn't work
>> because uas driver actually depends on usb-storage driver for
>> usb_stor_adjust_quirks(). There will be a recursive dependency.
>>
>> Please let me know if there is better approach to avoid the issue.
> 
> If users blacklist the uas driver, that's their choice and they should
> rebuild their kernel :)
> 
> Or better yet, talk to us to get the issue fixed for why they would want
> to blacklist such a driver.

Agree. :)

> 
> As it is, this patch is not acceptable.

Understood. Thanks for the comments. I will drop this patch.

Thanks,
JC

> 
> thanks,
> 
> greg k-h
> 

-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
