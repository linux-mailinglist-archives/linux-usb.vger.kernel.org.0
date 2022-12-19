Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C353965097B
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 10:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231234AbiLSJpB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 04:45:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbiLSJpA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 04:45:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A8995A9
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 01:44:59 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C5296825;
        Mon, 19 Dec 2022 10:44:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671443097;
        bh=nZKFqIj9GkBY/ARVrkMmGL6omLQaK9pBBT7glbHXUWs=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=u3ZkEYYjr54DTC6mGKELqvV4kJYhAe8+gaZ0p15wnjvmyp9afvQj/ycj/0ZYbAcpS
         Haq8sPGVk9DvzYChHGPuGWZaOktArcfs+/qHl5dlIqBlWn6NHXFUhpUc7voIbcWGVG
         Jqs0+OUh+dMrRrgj/BYAHk3h35SBEIgfTEWsR7vc=
Message-ID: <df474580-3481-2924-c485-9259626acb95@ideasonboard.com>
Date:   Mon, 19 Dec 2022 09:44:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de, torleiv@huddly.com
References: <20221213083736.2284536-1-dan.scally@ideasonboard.com>
 <20221213083736.2284536-7-dan.scally@ideasonboard.com>
 <167110563688.9133.15927668222226418339@Monstersaurus>
 <97d59440-016f-8326-6553-dc032db48b3c@ideasonboard.com>
 <Y5+fbfqO/P3VrwZT@pendragon.ideasonboard.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH 6/6] usb: gadget: uvc: Allow creating new color matching
 descriptors
In-Reply-To: <Y5+fbfqO/P3VrwZT@pendragon.ideasonboard.com>
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

Hi Laurent

On 18/12/2022 23:17, Laurent Pinchart wrote:
> On Thu, Dec 15, 2022 at 12:03:03PM +0000, Dan Scally wrote:
>> On 15/12/2022 12:00, Kieran Bingham wrote:
>>> Quoting Daniel Scally (2022-12-13 08:37:36)
>>>> Allow users to create new color matching descriptors in addition to
>>>> the default one. These must be associated with a UVC format in order
>>>> to be transmitted to the host, which is achieved by symlinking from
>>>> the format to the newly created color matching descriptor - extend
>>>> the uncompressed and mjpeg formats to support that linking operation.
>>>>
>>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>>> ---
>>>>    .../ABI/testing/configfs-usb-gadget-uvc       |  4 +-
>>>>    drivers/usb/gadget/function/uvc_configfs.c    | 79 ++++++++++++++++++-
>>>>    2 files changed, 79 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
>>>> index 3512f4899fe3..ce629f0880a9 100644
>>>> --- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
>>>> +++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
>>>> @@ -160,10 +160,10 @@ Date:             Dec 2014
>>>>    KernelVersion: 4.0
>>>>    Description:   Color matching descriptors
>>>>    
>>>> -What:          /config/usb-gadget/gadget/functions/uvc.name/streaming/color_matching/default
>>>> +What:          /config/usb-gadget/gadget/functions/uvc.name/streaming/color_matching/name
>>> Hrm... do we need to keep 'default' (and keep it available in patch
>>> 1/6?) so that the default is still kept accesible?
>> It's still there - it's just no longer necessarily the only entry
>>
>>> That would mean others are added as siblings to the default, and then
>>> the one that gets linked is the one that is used perhaps?
>> Yep that's how it's implemented
>>
>>> Feels like that would overcomplicate 'the default case' maybe ... but
>>> I'm weary that this is 'removing' the default from ABI...?
>>>
>>>>    Date:          Dec 2014
>>>>    KernelVersion: 4.0
>>> Hrm ... and this would leave the documentation stating that you could
>>> provide custom color matching descriptors from v4.0 onwards, which would
>>> be inaccurate ?
>> Ah, good point...fair enough, I'll add a new entry for the custom named
>> ones.
>>
>>> So I'm not sure we can just rename this documentation segment eitherway.
>>>
>>>> -Description:   Default color matching descriptors
>>>> +Description:   color matching descriptors
>>>>    
>>>>                   All attributes read/write:
>>>>    
>>>> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
>>>> index 4fbc42d738a4..82c10f0dab71 100644
>>>> --- a/drivers/usb/gadget/function/uvc_configfs.c
>>>> +++ b/drivers/usb/gadget/function/uvc_configfs.c
>>>> @@ -769,6 +769,58 @@ static struct uvcg_cmd *uvcg_format_get_default_cmd(struct config_item *streamin
>>>>           return cmd;
>>>>    }
>>>>    
>>>> +static int uvcg_format_allow_link(struct config_item *src, struct config_item *tgt)
>>>> +{
>>>> +       struct mutex *su_mutex = &src->ci_group->cg_subsys->su_mutex;
>>>> +       struct config_item *streaming, *color_matching;
>>>> +       struct uvcg_cmd *color_matching_desc;
>>>> +       struct uvcg_format *fmt;
>>>> +       int ret = 0;
>>>> +
>>>> +       mutex_lock(su_mutex);
>>>> +
>>>> +       streaming = src->ci_parent->ci_parent;
>>>> +       color_matching = config_group_find_item(to_config_group(streaming), "color_matching");
>>>> +       if (!color_matching || color_matching != tgt->ci_parent) {
>>>> +               ret = -EINVAL;
>>>> +               goto out_put_cm;
>>>> +       }
>>>> +
>>>> +       color_matching_desc = to_uvcg_cmd(to_config_group(tgt));
>>>> +       fmt = to_uvcg_format(src);
>>>> +       fmt->color_matching = color_matching_desc;
> As you store a pointer to the target, don't you need to keep a reference
> to it somehow, to avoid the target being deleted ? Or is that handled by
> configfs itself ?


configfs is doing it in configfs_symlink()

> It also looks like you need to refcount the number of links to the
> target, to disallow changes to the color matching attributes when the
> descriptor is linked.


Yes; I had thought that that was unnecessary so skipped it, but turns 
out I'm wrong - I'll add that in.

> This being said, are links the best option here ? Why can't we create
> color matching descriptors as children of format descriptors the same
> way that frame descriptors are handled ?


We can do it that way, but I thought that it made more sense to expand 
the current implementation because


1) I'm reluctant to get rid of the default descriptor and I wouldn't 
want to have them in multiple places.

2) We're planning to expand the uncompressed format to support more than 
just yuy2, which for some cameras might result in _a lot_ of available 
formats (vivid has 80!). It seems easier to have color matching 
descriptors that you can set once and simply link to than have to 
recreate them for each format.

>
>>>> +
>>>> +out_put_cm:
>>>> +       config_item_put(color_matching);
>>>> +       mutex_unlock(su_mutex);
>>>> +
>>>> +       return ret;
>>>> +}
>>>> +
>>>> +static void uvcg_format_drop_link(struct config_item *src, struct config_item *tgt)
>>>> +{
>>>> +       struct config_item *streaming;
>>>> +       struct mutex *su_mutex = &src->ci_group->cg_subsys->su_mutex;
>>>> +       struct uvcg_format *fmt;
>>>> +       struct uvcg_cmd *cmd;
>>>> +
>>>> +       mutex_lock(su_mutex);
>>>> +
>>>> +       streaming = src->ci_parent->ci_parent;
>>>> +       cmd = uvcg_format_get_default_cmd(streaming);
>>>> +
>>>> +       fmt = to_uvcg_format(src);
>>>> +       fmt->color_matching = cmd;
>>>> +
>>>> +       mutex_unlock(su_mutex);
>>>> +}
>>>> +
>>>> +static struct configfs_item_operations uvcg_format_item_operations = {
> Not a candidate for this patch (or this series), but I wonder if this
> could be made const. It would involve making several pointers in struct
> config_item_type const, which may or may not be straightforward.
>
>>>> +       .release        = uvcg_config_item_release,
>>>> +       .allow_link     = uvcg_format_allow_link,
>>>> +       .drop_link      = uvcg_format_drop_link,
>>>> +};
>>>> +
>>>>    static ssize_t uvcg_format_bma_controls_show(struct uvcg_format *f, char *page)
>>>>    {
>>>>           struct f_uvc_opts *opts;
>>>> @@ -1569,7 +1621,7 @@ static struct configfs_attribute *uvcg_uncompressed_attrs[] = {
>>>>    };
>>>>    
>>>>    static const struct config_item_type uvcg_uncompressed_type = {
>>>> -       .ct_item_ops    = &uvcg_config_item_ops,
>>>> +       .ct_item_ops    = &uvcg_format_item_operations,
>>>>           .ct_group_ops   = &uvcg_uncompressed_group_ops,
>>>>           .ct_attrs       = uvcg_uncompressed_attrs,
>>>>           .ct_owner       = THIS_MODULE,
>>>> @@ -1764,7 +1816,7 @@ static struct configfs_attribute *uvcg_mjpeg_attrs[] = {
>>>>    };
>>>>    
>>>>    static const struct config_item_type uvcg_mjpeg_type = {
>>>> -       .ct_item_ops    = &uvcg_config_item_ops,
>>>> +       .ct_item_ops    = &uvcg_format_item_operations,
>>>>           .ct_group_ops   = &uvcg_mjpeg_group_ops,
>>>>           .ct_attrs       = uvcg_mjpeg_attrs,
>>>>           .ct_owner       = THIS_MODULE,
>>>> @@ -1912,6 +1964,28 @@ static const struct config_item_type uvcg_color_matching_type = {
>>>>     * streaming/color_matching
>>>>     */
>>>>    
>>>> +static struct config_group *uvcg_color_matching_make(struct config_group *group,
>>>> +                                                    const char *name)
>>>> +{
>>>> +       struct uvcg_cmd *cmd;
>>>> +
>>>> +       cmd = kzalloc(sizeof(*cmd), GFP_KERNEL);
>>>> +       if (!cmd)
>>>> +               return ERR_PTR(-ENOMEM);
>>>> +
>>>> +       cmd->desc.bLength = UVC_DT_COLOR_MATCHING_SIZE;
>>>> +       cmd->desc.bDescriptorType = USB_DT_CS_INTERFACE;
>>>> +       cmd->desc.bDescriptorSubType = UVC_VS_COLORFORMAT;
>>>> +
>>>> +       config_group_init_type_name(&cmd->group, name, &uvcg_color_matching_type);
>>>> +
>>>> +       return &cmd->group;
>>>> +}
>>>> +
>>>> +static struct configfs_group_operations uvcg_color_matching_grp_group_ops = {
>>>> +       .make_group     = uvcg_color_matching_make,
>>>> +};
>>>> +
>>>>    static int uvcg_color_matching_create_children(struct config_group *parent)
>>>>    {
>>>>           struct uvcg_cmd *cmd;
>>>> @@ -1937,6 +2011,7 @@ static int uvcg_color_matching_create_children(struct config_group *parent)
>>>>    static const struct uvcg_config_group_type uvcg_color_matching_grp_type = {
>>>>           .type = {
>>>>                   .ct_item_ops    = &uvcg_config_item_ops,
>>>> +               .ct_group_ops   = &uvcg_color_matching_grp_group_ops,
>>>>                   .ct_owner       = THIS_MODULE,
>>>>           },
>>>>           .name = "color_matching",
