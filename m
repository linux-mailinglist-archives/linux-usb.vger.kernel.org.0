Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E90A650945
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 10:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbiLSJVw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 04:21:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231531AbiLSJVu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 04:21:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99FA663B8
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 01:21:48 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0776B825;
        Mon, 19 Dec 2022 10:21:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671441706;
        bh=0WBoX+XjtMDtPt7Rkv4QNW1gaI3Uyilw7XcPwSZZzkU=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=ZSdEzdiLGiM8wl4xE8CUK+yebS31epot27c5IsyLq5gpyziVCC5QX8XOrQXU7l3EF
         WJBgvfuXKllK80YWUC5AwGhGtoMzgTdsKHPF7O0MLvHeT3M7ik+ILkqsj0VIATop1/
         0HXcvmFYuTqx/zwpi8rtSSFjFrzUTjjusq2nrt1U=
Message-ID: <26f86f15-273e-5479-3254-8d919c1672e6@ideasonboard.com>
Date:   Mon, 19 Dec 2022 09:21:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de, torleiv@huddly.com
References: <20221213083736.2284536-1-dan.scally@ideasonboard.com>
 <20221213083736.2284536-6-dan.scally@ideasonboard.com>
 <167110507266.9133.9781573969949845356@Monstersaurus>
 <699fe3cf-ecda-4301-cae7-49eb165aa10e@ideasonboard.com>
 <Y5+cbZPU3ZJ0KsCe@pendragon.ideasonboard.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH 5/6] usb: gadget: uvc: Make color matching attributes
 read/write
In-Reply-To: <Y5+cbZPU3ZJ0KsCe@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Morning Laurent

On 18/12/2022 23:04, Laurent Pinchart wrote:
> On Fri, Dec 16, 2022 at 03:53:05PM +0000, Dan Scally wrote:
>> On 15/12/2022 11:51, Kieran Bingham wrote:
>>> Quoting Daniel Scally (2022-12-13 08:37:35)
>>>> In preparation for allowing more than the default color matching
>>>> descriptor, make the color matching attributes writeable.
>>>>
>>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>>> ---
>>>>    .../ABI/testing/configfs-usb-gadget-uvc       |  2 +-
>>>>    drivers/usb/gadget/function/uvc_configfs.c    | 32 ++++++++++++++++++-
>>>>    2 files changed, 32 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
>>>> index 611b23e6488d..3512f4899fe3 100644
>>>> --- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
>>>> +++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
>>>> @@ -165,7 +165,7 @@ Date:               Dec 2014
>>>>    KernelVersion: 4.0
>>>>    Description:   Default color matching descriptors
>>>>    
>>>> -               All attributes read only:
>>>> +               All attributes read/write:
>>> Do we need to specify here what acceptable values can now be written at
>>> all?
>> Yes I guess so...we probably need better documentation for this
>> somewhere. I don't think this file is the right place to describe it
>> fully, it's more of an enumeration. We probably need something like
>> Documentation/usb/gadget_serial.rst
> That would make sense. I think you can also heavily quote or reference
> the USB video class documentation.


Ack. I've started this.

>
>>>>                   ========================  ======================================
>>>>                   bMatrixCoefficients       matrix used to compute luma and
>>>> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
>>>> index 6f5932c9f09c..4fbc42d738a4 100644
>>>> --- a/drivers/usb/gadget/function/uvc_configfs.c
>>>> +++ b/drivers/usb/gadget/function/uvc_configfs.c
>>>> @@ -1845,7 +1845,37 @@ static ssize_t uvcg_color_matching_##cname##_show(                       \
>>>>           return result;                                                  \
>>>>    }                                                                      \
>>>>                                                                           \
>>>> -UVC_ATTR_RO(uvcg_color_matching_, cname, aname)
>>>> +static ssize_t uvcg_color_matching_##cname##_store(                    \
>>>> +       struct config_item *item, const char *page, size_t len)         \
>>>> +{                                                                      \
>>>> +       struct config_group *group = to_config_group(item);             \
>>>> +       struct mutex *su_mutex = &group->cg_subsys->su_mutex;           \
>>>> +       struct uvcg_cmd *cmd = to_uvcg_cmd(group);                      \
>>>> +       struct f_uvc_opts *opts;                                        \
>>>> +       struct config_item *opts_item;                                  \
>>>> +       int ret;                                                        \
> I'd make this one last.


Hah I overthought this quite a lot because following the preprocessing 
num might be shorter. No problem though, I'll switch it to last.
>
>>>> +       u##bits num;                                                    \
> In other places we use
>
> 	typeof(cmd->desc.aname) num;
>
> Up to you.
>
>>>> +                                                                       \
>>>> +       ret = kstrtou##bits(page, 0, &num);                             \
>>>> +       if (ret)                                                        \
>>>> +               return ret;                                             \
>>> I don't know how horrible it would be - or if there's any other
>>> precendence, but I'm weary that setting '1', or '4' in here from
>>> userspace is fairly meaningless.
>>>
>>> Of course - the user doing so would have to know from the spec perhaps
>>> what they are configuring - but it makes me wonder if we should support
>>> string matching in here to also convert say "BT.709" to the appropriate
>>> integer value (if a non-integer was set).
>>>
>>> It may depend on how 'most' other configfs entries that would be similar
>>> to this would expect to operate.
>> This might be abusing configfs slightly, though I did something similar
>> for the custom string descriptors (see [1] and ctrl-f for
>> "uvcg_language_strings_show") and I think it's a worthwhile thing. What
>> about an "enumerate options" attribute that's read only and simply
>> enumerates the settings with their corresponding descriptions? The
>> problem with string parsing is you've still got to know the exact string
>> to pass (and googling "BT.709" tells me it can also be called "Rec.709",
>> "Rec. 709" and "ITU 709" for example) so you'd have to look it up
>> anyway. I'm thinking something like:
>>
>> $ cat enumerate_options
>> bColorPrimaries - This defines the color primaries and the reference white
>> value       desc
>> 0           Unspecified (Image characteristics unknown)
>> 1           BT.709 (sRGB)
>> 2           BT.470-2 (M)
>> 3           BT.470 (B, G)
>> 4           SMPTE 170M
>> 5           SMPTE 240M
>> 6-255       Reserved
>>
>> bTransferCharacteristics - This field defines the opto-electronic transfer
>>                                                   characteristics of the
>> source picture, also
>>                                                   called the gamma function
>> value       desc
>> 0           Unspecified (Image characteristics unknown)
>> 1           BT.7-0
>> 2           BT.470-2 M
>> ...          ...
>>
>>
>> ... and so on. What do you think?
> I think it's overkill. The userspace side of the UVC gadget is expected
> to have good knowledge of UVC. This isn't an interface meant for users.


Fair enough

>
>> [1] https://lore.kernel.org/linux-usb/20221121092517.225242-6-dan.scally@ideasonboard.com/
>>
>>>> +                                                                       \
>>>> +       mutex_lock(su_mutex); /* for navigating configfs hierarchy */   \
>>>> +                                                                       \
>>>> +       opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;     \
>>>> +       opts = to_f_uvc_opts(opts_item);                                \
>>>> +                                                                       \
>>>> +       mutex_lock(&opts->lock);                                        \
> Don't you need a similar linked check as in uvcg_frame_##cname##_store()
> ?


Yes, actually. I was halfway through explaining why I had considered it 
unnecessary and skipped it, and then realised I was wrong :)

>
>>>> +                                                                       \
>>>> +       cmd->desc.aname = num;                                          \
>>>> +       ret = len;                                                      \
>>>> +                                                                       \
>>>> +       mutex_unlock(&opts->lock);                                      \
>>>> +       mutex_unlock(su_mutex);                                         \
>>>> +                                                                       \
>>>> +       return ret;                                                     \
>>>> +}                                                                      \
>>>> +UVC_ATTR(uvcg_color_matching_, cname, aname)
>>>>    
>>>>    UVCG_COLOR_MATCHING_ATTR(b_color_primaries, bColorPrimaries, 8);
>>>>    UVCG_COLOR_MATCHING_ATTR(b_transfer_characteristics, bTransferCharacteristics, 8);
