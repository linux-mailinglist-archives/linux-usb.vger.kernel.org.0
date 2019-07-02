Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7DD75C763
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 04:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbfGBChD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jul 2019 22:37:03 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:3110 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbfGBChD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Jul 2019 22:37:03 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1ac34d0000>; Mon, 01 Jul 2019 19:37:01 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 01 Jul 2019 19:37:02 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 01 Jul 2019 19:37:02 -0700
Received: from [10.19.108.127] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Jul
 2019 02:37:01 +0000
Subject: Re: [PATCH] usb: storage: skip only when uas driver is loaded
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, <stern@rowland.harvard.edu>,
        <usb-storage@lists.one-eyed-alien.net>, <oneukum@suse.com>
References: <20190701084848.32502-1-jckuo@nvidia.com>
 <20190701085248.GA28681@kroah.com>
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <8e8e8703-8620-b625-4917-bbb8d999caa4@nvidia.com>
Date:   Tue, 2 Jul 2019 10:36:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190701085248.GA28681@kroah.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1562035021; bh=77aJVnm/xorkjQ2KebRy3Sx0Cp8Zc4bA3d8JzQexgwo=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=AnYkRgAPjcYArgNuf+hJz5gnAAUw4BlV3S5H979f/NmoWq5pIr08Vdvra/ZkHoKs8
         WfbBvMkuEExbDSlspAW7w8otoOylZAVNSI834rgPYdgkWwZzNr5Ou46SGqNyWYvZpw
         SMqe5k9VuRGdyC1WKkeMOTfiQ677U8YsN6Tt0kEV6BRV4xhVtHIybmL65v3lx3CPf6
         8+hPzGCc2WETrLKXN/eYDJXDXZL/9RHN+rHZiYW9IjN3B+8W+qnRCapDkWF0QJ+L/5
         Ofz4Rx6L7s+bcB3bZilL6EyD95r/mlW2uIrAzCYW0yyhpdEcHApVsCDzveyZpvxvbo
         3a1X+XUNJE20A==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/1/19 4:52 PM, Greg KH wrote:
> On Mon, Jul 01, 2019 at 04:48:48PM +0800, JC Kuo wrote:
>> When usb-storage driver detects a UAS capable device, it ignores the
>> device if CONFIG_USB_UAS is enabled. usb-storage driver assumes uas
>> driver certainly will be loaded. However, it's possible that uas
>> driver will not be loaded, for example, uas kernel module is not
>> installed properly or it is in modprobe blacklist.
>>
>> In case of uas driver not being loaded, the UAS capable device will
>> not fallback to work at Bulk-only-transfer mode. The device just
>> disappears without any notification to user/userspace.
>>
>> This commit changes usb-storage driver to skip UAS capable device
>> only when uas driver is already loaded to make sure the device will
>> at least work with Bulk protocol.
> 
> But what happens if the driver is loaded afterward, because 'modprobe'
> was called by the driver core (or it should have been, because this is a
> device that supports that protocol)?
If uas driver is loaded after usb-storage driver probed the device, the device will still work with Bulk-only protocol, though it can't make uses of streams.

> 
> I think you just broke working systems :(
> 
> Why wouldn't the UAS driver get loaded automatically if it is configured
> in the system as it is today?
An user might want to completely disable uas for some reason so he/she adds "blacklist uas" to modprobe conf file. I think in case of this, usb-storage driver has to enable this device with the legacy Bulk-only protocol instead of ignoring the device.

As an alternative to this patch, I thought I could get uas driver loaded before usb-storage driver so I tried moving the functions in drivers/usb/storage/uas-detect.h into uas.c and letting usb-storage links uas_use_uas_driver() of uas.ko. However, that didn't work because uas driver actually depends on usb-storage driver for usb_stor_adjust_quirks(). There will be a recursive dependency.

Please let me know if there is better approach to avoid the issue.

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
