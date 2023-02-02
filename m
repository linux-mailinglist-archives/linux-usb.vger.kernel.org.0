Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36A7C687A53
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 11:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232680AbjBBKeY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 05:34:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232712AbjBBKeB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 05:34:01 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 507646A32D
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 02:34:00 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22446505;
        Thu,  2 Feb 2023 11:33:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675334038;
        bh=GhQp8fYmfbLJ+Q+J5wmJFdaO75oKGFpZggXJIMvSWVI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Vup1BCrg7u0Ywm+ZqIgBWf0W27KEle1sKwigbFQ0p+vvdJOJaNjdbGjgw3MtAqMBk
         lF+bGTVaFygvzv5VQ+WmQ/oenagcfUiqcF3M5RsGgLqdh0BBjJx2oOESCaTQqjfYHO
         wNGirOqpU0nYO0TEFPHjhPKNjscSnCHLM5HFHynE=
Message-ID: <980273ba-c6a3-30e3-9140-ea3b083eb3e0@ideasonboard.com>
Date:   Thu, 2 Feb 2023 10:33:55 +0000
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
 <f1d817b8-ab8d-e69d-8a06-d860aabf07fc@ideasonboard.com>
 <Y9uQmDmuG5a3CCIJ@kroah.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <Y9uQmDmuG5a3CCIJ@kroah.com>
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


On 02/02/2023 10:29, Greg KH wrote:
> On Thu, Feb 02, 2023 at 10:20:20AM +0000, Dan Scally wrote:
>> Morning Greg
>>
>> On 02/02/2023 10:18, Greg KH wrote:
>>> On Mon, Jan 30, 2023 at 02:26:32PM +0000, Daniel Scally wrote:
>>>> The current UVC gadget implementation hardcodes a single color matching
>>>> descriptor and includes it in the payload of USB descriptors a single time
>>>> following all the format and frame descriptors. This is inflexible, and
>>>> additionally applies only to the _last_ format in the array of descriptors.
>>>>
>>>> This series extends the support such that the default descriptor can be amended
>>>> and is included once-per-format instead of once-only, it then adds the ability
>>>> to create new color matching descriptors and associate them with particular formats.
>>>> The default color matching descriptor is retained and used where the user does not
>>>> link a new color matching descriptor to the format, so the default interaction
>>>> with userspace is unchanged from the current implementation.
>>>>
>>>> Daniel Scally (7):
>>>>     usb: gadget: usb: Remove "default" from color matching attributes
>>>>     usb: uvc: Enumerate valid values for color matching
>>>>     usb: gadget: uvc: Add struct for color matching in configs
>>>>     usb: gadget: uvc: Copy color matching descriptor for each frame
>>>>     usb: gadget: uvc: Remove the hardcoded default color matching
>>>>     usb: gadget: uvc: Make color matching attributes read/write
>>>>     usb: gadget: uvc: Allow creating new color matching descriptors
>>>>
>>>>    .../ABI/testing/configfs-usb-gadget-uvc       |  19 +-
>>>>    drivers/usb/gadget/function/f_uvc.c           |   9 -
>>>>    drivers/usb/gadget/function/u_uvc.h           |   1 -
>>>>    drivers/usb/gadget/function/uvc_configfs.c    | 282 ++++++++++++++++--
>>>>    drivers/usb/gadget/function/uvc_configfs.h    |  22 +-
>>>>    include/uapi/linux/usb/video.h                |  30 ++
>>>>    6 files changed, 315 insertions(+), 48 deletions(-)
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>> This series does not apply against my tree at all, what was it made
>>> against?
>>
>> I thought I had rebased it against usb-linus, was that the wrong branch to
>> use? If not then I probably messed it up somehow, I can rebase and resend.
> usb-linus is not the right branch for new features, please use usb-next.
> Although for the next 24 hours, you should probably use usb-testing as
> that has your other changes in it already, before I merge it into
> usb-next.


Ack. I'll resend the series shortly.

>
> thanks,
>
> greg k-h
