Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5BF875386
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2019 18:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389590AbfGYQGS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jul 2019 12:06:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:41928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387547AbfGYQGS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Jul 2019 12:06:18 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3B04722C7B;
        Thu, 25 Jul 2019 16:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564070777;
        bh=89pEwnRNXneCXWpX3LRvn8ipYqLu00X2/nxu+Wn9204=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Zb75NrwHK2UpRnJLn6dr9+gbUb6SU+ucj6LRsvKRlFuSGKOaZG4c0JIapPi2StFcC
         KINbuiSkMcv/vagZkdQyhYTM1KETnzizC+6CtyMycN3wcf5a4BYvZcAmO8ABNml4Lm
         UtRQCGLeaMLCOmoy75ciI73om4R2eHYD2vlwXlio=
Subject: Re: [PATCH v2] usbip: tools: fix GCC8 warning for strncpy
To:     "Liu, Changcheng" <changcheng.liu@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     valentina.manea.m@gmail.com, linux-usb@vger.kernel.org
References: <20190725132209.GA27590@jerryopenix>
 <2cac538b-3806-8b1f-9dce-34be9d862102@kernel.org>
 <20190725144441.GA10957@jerryopenix>
From:   shuah <shuah@kernel.org>
Message-ID: <e552d185-9f9b-155b-c7fa-fd8a1f3ee3f1@kernel.org>
Date:   Thu, 25 Jul 2019 10:06:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725144441.GA10957@jerryopenix>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/25/19 8:44 AM, Liu, Changcheng wrote:
> On 08:19 Thu 25 Jul, shuah wrote:
>> On 7/25/19 7:22 AM, Liu, Changcheng wrote:
>>> GCC8 started emitting warning about using strncpy with number of bytes
>>> exactly equal destination size which could lead to non-zero terminated
>>> string being copied. Use "SYSFS_PATH_MAX - 1" & "SYSFS_BUS_ID_SIZE - 1"
>>> as number of bytes to ensure name is always zero-terminated.
>>>
>>> Signed-off-by: Changcheng Liu <changcheng.liu@aliyun.com>
>>> ---
>>> v1 -> v2:
>>>    * Correct array tail index
>>> ---
>>>    tools/usb/usbip/libsrc/usbip_common.c        | 6 ++++--
>>>    tools/usb/usbip/libsrc/usbip_device_driver.c | 6 ++++--
>>>    2 files changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tools/usb/usbip/libsrc/usbip_common.c b/tools/usb/usbip/libsrc/usbip_common.c
>>> index bb424638d75b..b8d7d480595a 100644
>>> --- a/tools/usb/usbip/libsrc/usbip_common.c
>>> +++ b/tools/usb/usbip/libsrc/usbip_common.c
>>> @@ -226,8 +226,10 @@ int read_usb_device(struct udev_device *sdev, struct usbip_usb_device *udev)
>>>    	path = udev_device_get_syspath(sdev);
>>>    	name = udev_device_get_sysname(sdev);
>>> -	strncpy(udev->path,  path,  SYSFS_PATH_MAX);
>>> -	strncpy(udev->busid, name, SYSFS_BUS_ID_SIZE);
>>> +	strncpy(udev->path,  path,  SYSFS_PATH_MAX - 1);
>>> +	udev->path[SYSFS_PATH_MAX - 1] = '\0';
>>> +	strncpy(udev->busid, name, SYSFS_BUS_ID_SIZE - 1);
>>> +	udev->busid[SYSFS_BUS_ID_SIZE - 1] = '\0';
>>
>> strlcpy() would be better choice here. Any reason to not use that?
>>
> @Shuah: linux tools link with libc which doesn't implment strlcpy yet.
> So tools source code can't use strlcpy function like other kernel source
> code.

Right I keep forgetting that. :)
Thinking about it, udev_device_get_syspath() could return
null. Not related to this change anyway.

Thanks for fixing this.

Greg! Please pick this up:

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
