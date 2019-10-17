Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86CA6DADB8
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2019 15:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731433AbfJQNAa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Oct 2019 09:00:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:51288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730054AbfJQNAa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Oct 2019 09:00:30 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F14A320854;
        Thu, 17 Oct 2019 13:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571317229;
        bh=utxbP7DZ991ZtnLhNuk/aD8CXvaozdF3gKWGEwFcDUs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=nuDVVmE3h/6DkpDXgpXmJAfKkpe4a3H28tzzH/o4F5dA6m4WBatvowBRNZ6imPZk6
         mTKt6QXEOdvD0jWECIn3VETrC1W9QL5yYIgAagKut9wQ8kXOKjaFHMqxwLGeNgbxYD
         NIs9SaobGRhsp1UX8tT0gPAMMIaMEOBMIQ7xmwpM=
Subject: Re: [PATCH v2] usbip: tools: Fix read_usb_vudc_device() error path
 handling
To:     GwanYeong Kim <gy741.kim@gmail.com>
Cc:     valentina.manea.m@gmail.com, gregkh@linuxfoundation.org,
        allison@lohutok.net, opensource@jilayne.com,
        changcheng.liu@intel.com, tglx@linutronix.de,
        linux-usb@vger.kernel.org, shuah <shuah@kernel.org>
References: <20191016131832.GC56859@kroah.com>
 <20191017022512.3809-1-gy741.kim@gmail.com>
 <e460e4fb-cefa-9dea-f0f6-7e92f3727034@kernel.org>
 <20191017142605.000041f6@gmail.com>
From:   shuah <shuah@kernel.org>
Message-ID: <948530c4-0f42-1244-faee-aad531074bf3@kernel.org>
Date:   Thu, 17 Oct 2019 07:00:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191017142605.000041f6@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/16/19 11:26 PM, GwanYeong Kim wrote:
> On Wed, 16 Oct 2019 20:33:39 -0600
> shuah <shuah@kernel.org> wrote:
> 
>> On 10/16/19 8:25 PM, GwanYeong Kim wrote:
>>> cannot be less than 0 - fread() returns 0 on error.
>>>
>>
>> This isn't really accurate right. fread() doesn't always
>> return 0 in error. It could return < number of elements
>> and set errno.
>>
>> Please make changes to reflect that.
> 
> Will reflect this.
> 
>>
>>> Signed-off-by: GwanYeong Kim <gy741.kim@gmail.com>
>>> ---
>>>    tools/usb/usbip/libsrc/usbip_device_driver.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c
>>> b/tools/usb/usbip/libsrc/usbip_device_driver.c index
>>> 051d7d3f443b..959bb29d0477 100644 ---
>>> a/tools/usb/usbip/libsrc/usbip_device_driver.c +++
>>> b/tools/usb/usbip/libsrc/usbip_device_driver.c @@ -69,7 +69,7 @@
>>> int read_usb_vudc_device(struct udev_device *sdev, struct
>>> usbip_usb_device *dev) FILE *fd = NULL; struct udev_device *plat;
>>>    	const char *speed;
>>> -	int ret = 0;
>>> +	size_t ret = 0;
>>
>> You don't need to initialize this.
> 
> Exactly, because "ret" variable receives a "fread()" return value,
> 
>>
>>>    
>>>    	plat = udev_device_get_parent(sdev);
>>>    	path = udev_device_get_syspath(plat);
>>> @@ -79,7 +79,7 @@ int read_usb_vudc_device(struct udev_device
>>> *sdev, struct usbip_usb_device *dev) if (!fd)
>>>    		return -1;
>>>    	ret = fread((char *) &descr, sizeof(descr), 1, fd);
>>> -	if (ret < 0)
>>> +	if (ret != 1)
>>
>> Why not print error message?
> 
> 
> Sorry, I'll add a message.
> 
> How about this?
> 
> err("Cannot read vudc device descr file");

Using strerror() with errno gives you more information. Add that
to them essage you proposed.

thanks,
-- Shuah
