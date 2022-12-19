Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B50565080E
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 08:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbiLSHav (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 02:30:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiLSHat (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 02:30:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D87213AF
        for <linux-usb@vger.kernel.org>; Sun, 18 Dec 2022 23:30:46 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 40581825;
        Mon, 19 Dec 2022 08:30:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671435043;
        bh=j4gC26iD+JUULFvc0WLPHfvRe2LA299meEOfoZbRTyc=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=t/GyqXN6Gr5+31P528BUVjK3f4yDmMj5PQ+lanNjxawTo/Kp4+ln3rulNWQd8GmHT
         HgPzbH+Ck9iWtGvRejuO0BX8D6lF0OJsuPyhNPjcCxMzW/rnq0KT2REdgR3mczKxMC
         UZ8d+MQ9jSlbh8VspGV0M3fMdzPbJA8RBfvIR0Dc=
Message-ID: <5d8746a1-8568-de12-424e-68e9a9896c7d@ideasonboard.com>
Date:   Mon, 19 Dec 2022 07:30:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com
References: <20221213083736.2284536-1-dan.scally@ideasonboard.com>
 <Y59X9+ndt7GxBvJx@pendragon.ideasonboard.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH 0/6] UVC Gadget: Extend color matching support
In-Reply-To: <Y59X9+ndt7GxBvJx@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Morning Laurent

On 18/12/2022 18:12, Laurent Pinchart wrote:
> Hi Dan,
>
> Thank you for the series.
>
> On Tue, Dec 13, 2022 at 08:37:30AM +0000, Daniel Scally wrote:
>> The current UVC gadget implementation hardcodes a single color matching
>> descriptor and transmits it a single time following all the format and frame
> I'm not sure I would use "transmits" in this context.  Descriptors are
> for sure transmitted over the wire, but all in one go, not as individual
> units (at least within a configuration descriptor).  Maybe "includes"
> would be a better term ? This is nitpicking for the cover letter, but
> the comment applies more importantly to commit messages and code for the
> whole series.


I've used the same term I think in the series yes. No problem; I'll swap 
to includes.

>
>> descriptors. This is inflexible, and additionally applies only to the _last_
>> format in the array of descriptors.
>>
>> This series extends the support such that the default descriptor can be amended
>> and is transmitted once-per-format instead of once-only, it then adds the ability
>> to create new color matching descriptors and associate them with particular formats.
>> The default color matching descriptor is retained and used where the user does not
>> link a new color matching descriptor to the format, so the default interaction
>> with userspace is unchanged from the current implementation.
> I wonder if we shouldn't drop the default descriptor. If userspace
> doesn't specify one, then we really can't know what colorimetry data
> applies to the frames. Instead of providing a default to the host, not
> providing any colorimetry information would be better.


According to the spec:


"In the absence of this descriptor, or in the case of "Unspecified" 
values within the descriptor, color matching defaults will be assumed. 
The color matching defaults are compliant with sRGB since the BT.709 
transfer function and the sRGB transfer function are very similar"


And it goes on to identify the default values for each of the 
descriptor's fields...which happen to be the values that are set in our 
default descriptor. So I think that including that default descriptor 
shouldn't change the host's behaviour, but does give userspace an easy 
way to see what's set...I think it's fine to keep.

>
>> Daniel Scally (6):
>>    usb: gadget: usb: Remove "default" from color matching attributes
>>    usb: gadget: uvc: Add struct for color matching in configs
>>    usb: gadget: uvc: Copy color matching descriptor for each frame
>>    usb: gadget: uvc: Remove the hardcoded default color matching
>>    usb: gadget: uvc: Make color matching attributes read/write
>>    usb: gadget: uvc: Allow creating new color matching descriptors
>>
>>   .../ABI/testing/configfs-usb-gadget-uvc       |   6 +-
>>   drivers/usb/gadget/function/f_uvc.c           |   9 -
>>   drivers/usb/gadget/function/u_uvc.h           |   1 -
>>   drivers/usb/gadget/function/uvc_configfs.c    | 247 +++++++++++++++---
>>   drivers/usb/gadget/function/uvc_configfs.h    |   9 +
>>   5 files changed, 228 insertions(+), 44 deletions(-)
