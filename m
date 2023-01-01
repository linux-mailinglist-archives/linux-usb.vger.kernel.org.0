Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14BA365AB91
	for <lists+linux-usb@lfdr.de>; Sun,  1 Jan 2023 21:34:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbjAAUeJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 1 Jan 2023 15:34:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjAAUeI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 1 Jan 2023 15:34:08 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A8901CB
        for <linux-usb@vger.kernel.org>; Sun,  1 Jan 2023 12:34:07 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3E295BA;
        Sun,  1 Jan 2023 21:34:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672605244;
        bh=oabfXwbyrVCR4KjB3yov9v54IA4kN/CH4z2DW3BZHic=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=sCQ9rcQocaKrIQ1gjqcxqJ9pROA7IWlZaRtW02ygTexFS4nWbcFVyFm7/mpbRiS0M
         z4qvPQ2rDcep4wMmboX/Kvo6glWIdBEuIg+EH7tRP/ItJs0MiBwj0OP/eBvOH/RDcL
         a7EYgjLThzugCWtKt9vcTnFgaBDh+v8PA3pkalPM=
Message-ID: <0ae65812-c937-d071-455b-7c1d6418b080@ideasonboard.com>
Date:   Sun, 1 Jan 2023 20:34:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 0/9] Add XU support to UVC Gadget
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, mgr@pengutronix.de
References: <20221121092517.225242-1-dan.scally@ideasonboard.com>
 <Y6zc0sFxIGbOciwD@pendragon.ideasonboard.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <Y6zc0sFxIGbOciwD@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Laurent

On 29/12/2022 00:18, Laurent Pinchart wrote:
> Hi Dan,
>
> On Mon, Nov 21, 2022 at 09:25:08AM +0000, Daniel Scally wrote:
>> Hello all
>>
>> This series adds support for the definition of extension units in configfs for
>> the UVC Gadget. The XUs are modelled as config_items within a new "extensions"
>> group under control, which seemed like an appropriate place to put them.
>>
>> To allow the XU's to be inserted in the function graph, the bSourceID attribute
>> for the default output terminal is made writeable - users will need to configure
>> it with the bUnitID of the XU that they want to use as the OT's source. This does
>> mean that the XUs can _only_ be placed immediately preceding the OT, but I think
>> that that's fine for now.
> Is this something that we'll be able to extend later in a
> backward-compatible way ?


Yes...placing the XUs requires users to set the source of the Output 
Terminal and the XU. If we later make them placeable anywhere in the 
chain they'd just have to be set differently, I think it's fine.

>
> Please also note that, in general, nothing prevents a device from
> exposing multiple XUs, as well as exposing XUs that are not linked in
> the IT to OT pipeline. Is this also something we'll be able to support
> if needed ?


I've tried both scenarios already and found no problems.

>> Series level changes:
>>
>>    - Added patches 5-9 which additionally add the ability to create string
>>    descriptors through configfs and link them to the extension units as well as
>>    to override the default descriptors for the IAD and VC/VS interfaces
>>
>> The XUs configured through this series have been tested via uvc-gadget, uvcvideo
>> and uvcdynctrl.
> Do you have an example script that shows how to create and link an XU
> through configfs ? That would give an overview of the feature, useful
> for review.


Yes, but it's not currently public. I can get it updated to the 
uvc-gadget master branch before I'll get round to a v3 of this series so 
I can link it on that submission.

>
>> Daniel Scally (9):
>>    usb: gadget: uvc: Make bSourceID read/write
>>    usb: gadget: uvc: Generalise helper functions for reuse
>>    usb: gadget: uvc: Allow definition of XUs in configfs
>>    usb: gadget: uvc: Copy XU descriptors during .bind()
>>    usb: gadget: uvc: Support arbitrary string descriptors
>>    usb: gadget: uvc: Allow linking XUs to string descriptors
>>    usb: gadget: uvc: Attach custom string descriptors
>>    usb: gadget: uvc: Allow linking function to string descs
>>    usb: gadget: uvc: Use custom strings if available
>>
>>   .../ABI/testing/configfs-usb-gadget-uvc       |   50 +-
>>   drivers/usb/gadget/function/f_uvc.c           |  134 +-
>>   drivers/usb/gadget/function/u_uvc.h           |   22 +
>>   drivers/usb/gadget/function/uvc.h             |    1 +
>>   drivers/usb/gadget/function/uvc_configfs.c    | 1087 ++++++++++++++++-
>>   drivers/usb/gadget/function/uvc_configfs.h    |   60 +
>>   6 files changed, 1283 insertions(+), 71 deletions(-)
