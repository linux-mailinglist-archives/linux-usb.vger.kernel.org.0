Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14CFB6879FC
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 11:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232605AbjBBKUa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 05:20:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232584AbjBBKU3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 05:20:29 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BA9283062
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 02:20:25 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6381505;
        Thu,  2 Feb 2023 11:20:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675333223;
        bh=ZQGV4gY0HtnSzrL6QvqvJSWpos4nKo6ZMisjBIpxlhw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=U3x8eM5ZKcQ2BIaX2O7FUlAYazAig6h6xcOHRW0SWAIdSKfXWR8vul2TxKYRDwsvF
         qj59Uq8A4o5tqtT0azHmVRsB3lFp1rVpzpRe/4xbBdd6TIUJf0I7O6RKfrSiorA41L
         mceoWLoCRV8Q3xVf3XsXtEwFLAVRq6VRKNvMqC4k=
Message-ID: <f1d817b8-ab8d-e69d-8a06-d860aabf07fc@ideasonboard.com>
Date:   Thu, 2 Feb 2023 10:20:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 0/7] UVC Gadget: Extend color matching support
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com
References: <20230130142639.217885-1-dan.scally@ideasonboard.com>
 <Y9uN+9zwS97kUilT@kroah.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <Y9uN+9zwS97kUilT@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Morning Greg

On 02/02/2023 10:18, Greg KH wrote:
> On Mon, Jan 30, 2023 at 02:26:32PM +0000, Daniel Scally wrote:
>> The current UVC gadget implementation hardcodes a single color matching
>> descriptor and includes it in the payload of USB descriptors a single time
>> following all the format and frame descriptors. This is inflexible, and
>> additionally applies only to the _last_ format in the array of descriptors.
>>
>> This series extends the support such that the default descriptor can be amended
>> and is included once-per-format instead of once-only, it then adds the ability
>> to create new color matching descriptors and associate them with particular formats.
>> The default color matching descriptor is retained and used where the user does not
>> link a new color matching descriptor to the format, so the default interaction
>> with userspace is unchanged from the current implementation.
>>
>> Daniel Scally (7):
>>    usb: gadget: usb: Remove "default" from color matching attributes
>>    usb: uvc: Enumerate valid values for color matching
>>    usb: gadget: uvc: Add struct for color matching in configs
>>    usb: gadget: uvc: Copy color matching descriptor for each frame
>>    usb: gadget: uvc: Remove the hardcoded default color matching
>>    usb: gadget: uvc: Make color matching attributes read/write
>>    usb: gadget: uvc: Allow creating new color matching descriptors
>>
>>   .../ABI/testing/configfs-usb-gadget-uvc       |  19 +-
>>   drivers/usb/gadget/function/f_uvc.c           |   9 -
>>   drivers/usb/gadget/function/u_uvc.h           |   1 -
>>   drivers/usb/gadget/function/uvc_configfs.c    | 282 ++++++++++++++++--
>>   drivers/usb/gadget/function/uvc_configfs.h    |  22 +-
>>   include/uapi/linux/usb/video.h                |  30 ++
>>   6 files changed, 315 insertions(+), 48 deletions(-)
>>
>> -- 
>> 2.34.1
>>
> This series does not apply against my tree at all, what was it made
> against?


I thought I had rebased it against usb-linus, was that the wrong branch 
to use? If not then I probably messed it up somehow, I can rebase and 
resend.

> thanks,
>
> greg k-h
