Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1752687A22
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 11:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbjBBKZ2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 05:25:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbjBBKZ1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 05:25:27 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 474B110433
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 02:25:25 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44975505;
        Thu,  2 Feb 2023 11:25:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675333523;
        bh=XnnBfG4l1XYyrMJOpleUHhIZ9IwVIHbIYaceAzZpR2Y=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=aP8xjjXc01dNHDfBAKP3gayGPSiPyZuQVGKrB40ZI8tTg0RkrEixKGOXeO7w68G4K
         VtFux2IPHRUaAotwQgqbAWiawcxKF1ocdz54ccWRfY5B04bsKdMci6MGZMucjHEzDv
         mPQPkaSPky4t0izQPK5MR2IQoqPSB4t/1LaRReCc=
Message-ID: <779061ef-6a1f-f7b6-f378-8d77d1567aa3@ideasonboard.com>
Date:   Thu, 2 Feb 2023 10:25:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] usb: gadget: uvc: Make bmControls attr read/write
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, mgr@pengutronix.de,
        torleiv@huddly.com
References: <20230131095738.429197-1-dan.scally@ideasonboard.com>
 <Y9uN6q3Q6GiqTur8@kroah.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <Y9uN6q3Q6GiqTur8@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

On 02/02/2023 10:18, Greg KH wrote:
> On Tue, Jan 31, 2023 at 09:57:38AM +0000, Daniel Scally wrote:
>> For the Processing Unit and Camera Terminal descriptors defined in
>> the UVC Gadget we currently hard-code values into their bmControls
>> fields, which enumerates the controls the gadget is able to
>> support. This isn't appropriate since only the userspace companion
>> program to the kernel driver will know which controls are supported.
>> Make the configfs attributes that point to those fields read/write
>> so userspace can set them to appropriate values.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>>
>> This patch depends on "usb: gadget: uvc: Generalise helper functions for reuse"
>> from my recent series:
>>
>> https://lore.kernel.org/linux-usb/20230130093443.25644-3-dan.scally@ideasonboard.com/T/#u
> Odd, I think I have that in my tree, yet this fails to build with:
>
>    CALL    scripts/checksyscalls.sh
>    CC [M]  drivers/usb/gadget/function/uvc_configfs.o
> drivers/usb/gadget/function/uvc_configfs.c: In function ‘uvcg_default_processing_bm_controls_store’:
> drivers/usb/gadget/function/uvc_configfs.c:295:15: error: implicit declaration of function ‘__uvcg_iter_item_entries’ [-Werror=implicit-function-declaration]
>    295 |         ret = __uvcg_iter_item_entries(page, len, __uvcg_count_item_entries, &n,
>        |               ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/usb/gadget/function/uvc_configfs.c:295:51: error: ‘__uvcg_count_item_entries’ undeclared (first use in this function)
>    295 |         ret = __uvcg_iter_item_entries(page, len, __uvcg_count_item_entries, &n,
>        |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/usb/gadget/function/uvc_configfs.c:295:51: note: each undeclared identifier is reported only once for each function it appears in
> drivers/usb/gadget/function/uvc_configfs.c:311:51: error: ‘__uvcg_fill_item_entries’ undeclared (first use in this function)
>    311 |         ret = __uvcg_iter_item_entries(page, len, __uvcg_fill_item_entries, &tmp,
>        |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/usb/gadget/function/uvc_configfs.c: In function ‘uvcg_default_camera_bm_controls_store’:
> drivers/usb/gadget/function/uvc_configfs.c:465:51: error: ‘__uvcg_count_item_entries’ undeclared (first use in this function)
>    465 |         ret = __uvcg_iter_item_entries(page, len, __uvcg_count_item_entries, &n,
>        |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/usb/gadget/function/uvc_configfs.c:481:51: error: ‘__uvcg_fill_item_entries’ undeclared (first use in this function)
>    481 |         ret = __uvcg_iter_item_entries(page, len, __uvcg_fill_item_entries, &tmp,
>        |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
>
> What did I do wrong?


That's the error set I would expect if you didn't have that series 
earlier in the tree as __uvcg_iter_item_entries() is declared in one of 
those patches...if you have a link to the tree I can look more closely 
for you?

>
> thanks,
>
> greg k-h
