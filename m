Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B26E365AB9F
	for <lists+linux-usb@lfdr.de>; Sun,  1 Jan 2023 21:55:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjAAUzy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 1 Jan 2023 15:55:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjAAUzv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 1 Jan 2023 15:55:51 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98979D55
        for <linux-usb@vger.kernel.org>; Sun,  1 Jan 2023 12:55:49 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D14B85BA;
        Sun,  1 Jan 2023 21:55:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672606547;
        bh=+/xT3WFZG8LAxqqQYuAOhTZpqwCFhGZy/l4+PQQ9bgU=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=dww6mGkFyJms9LU02rRfwlz3/PRzdFuJzrLYX5hsujh+r+19Bw+UJzAQISL7F6ocz
         eGRbKqEVldGdOQGlhRMrXFu6/DPy6xwcBetC8Z4Gm3fID4L7NVXze3Rs7+N5Q9R8Ur
         MLeVV6ZZ9E+KsbHWWH/TmFeNqJiyET6dqBQDbOSE=
Message-ID: <db45a6f2-7ea0-6c5b-64e9-e4dfcb50eb81@ideasonboard.com>
Date:   Sun, 1 Jan 2023 20:55:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com
References: <20221219144316.757680-1-dan.scally@ideasonboard.com>
 <20221219144316.757680-8-dan.scally@ideasonboard.com>
 <Y6uu2WboelP1FTFl@pendragon.ideasonboard.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v2 7/7] usb: gadget: uvc: Allow creating new color
 matching descriptors
In-Reply-To: <Y6uu2WboelP1FTFl@pendragon.ideasonboard.com>
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

Hi Laurent - thanks for the review

On 28/12/2022 02:50, Laurent Pinchart wrote:
> Hi Dan,
>
> Thank you for the patch.
>
> On Mon, Dec 19, 2022 at 02:43:16PM +0000, Daniel Scally wrote:
>> Allow users to create new color matching descriptors in addition to
>> the default one. These must be associated with a UVC format in order
>> to be transmitted to the host, which is achieved by symlinking from
>> the format to the newly created color matching descriptor - extend
>> the uncompressed and mjpeg formats to support that linking operation.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>> Changes in v2:
>>
>> 	- New section of the ABI documentation
>> 	- uvcg_format_allow_link() now checks to see if an existing link is
>> 	already there
>> 	- .allow_link() and .drop_link() track color_matching->refcnt
>>
>>   .../ABI/testing/configfs-usb-gadget-uvc       | 17 ++++
>>   drivers/usb/gadget/function/uvc_configfs.c    | 99 ++++++++++++++++++-
>>   2 files changed, 114 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
>> index 53258b7c6f2d..e7753b2cb11b 100644
>> --- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
>> +++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
>> @@ -177,6 +177,23 @@ Description:	Default color matching descriptors
>>   					  white
>>   		========================  ======================================
>>   
>> +What:		/config/usb-gadget/gadget/functions/uvc.name/streaming/color_matching/name
>> +Date:		Dec 2022
>> +KernelVersion:	6.3
>> +Description:	Additional color matching descriptors
>> +
>> +		All attributes read/write:
>> +
>> +		========================  ======================================
>> +		bMatrixCoefficients	  matrix used to compute luma and
>> +					  chroma values from the color primaries
>> +		bTransferCharacteristics  optoelectronic transfer
>> +					  characteristic of the source picture,
>> +					  also called the gamma function
>> +		bColorPrimaries		  color primaries and the reference
>> +					  white
>> +		========================  ======================================
>> +
> Should the link also be documented somewhere ?


I actually couldn't see that any of the links were described in this 
document, so I skipped it. I'm working on a more comprehensive piece of 
documentation which describes the UVC Gadget more fully, and my plan was 
to do it there.

>
>>   What:		/config/usb-gadget/gadget/functions/uvc.name/streaming/mjpeg
>>   Date:		Dec 2014
>>   KernelVersion:	4.0
>> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
>> index ef5d75942f24..3be6ca936851 100644
>> --- a/drivers/usb/gadget/function/uvc_configfs.c
>> +++ b/drivers/usb/gadget/function/uvc_configfs.c
>> @@ -771,6 +771,77 @@ uvcg_format_get_default_color_match(struct config_item *streaming)
>>   	return color_match;
>>   }
>>   
>> +static int uvcg_format_allow_link(struct config_item *src, struct config_item *tgt)
>> +{
>> +	struct mutex *su_mutex = &src->ci_group->cg_subsys->su_mutex;
>> +	struct uvcg_color_matching *color_matching_desc;
>> +	struct config_item *streaming, *color_matching;
>> +	struct uvcg_format *fmt;
>> +	int ret = 0;
>> +
>> +	mutex_lock(su_mutex);
>> +
>> +	streaming = src->ci_parent->ci_parent;
>> +	color_matching = config_group_find_item(to_config_group(streaming), "color_matching");
>> +	if (!color_matching || color_matching != tgt->ci_parent) {
>> +		ret = -EINVAL;
>> +		goto out_put_cm;
>> +	}
>> +
>> +	fmt = to_uvcg_format(src);
> It's been a long time since I worked with configfs, so I may be wrong,
> but shouldn't we check the name of the source here to make sure it's
> equal to "color_matching" ? Or do you want to allow the user to name the
> source freely ? That would be a bit confusing I think.


The source will be either streaming/uncompressed/<name> or 
streaming/mjpeg/<name>. I don't think we need to check that, as this 
function will only be called if that's where the user is attempting to 
link from. So it'll be a link from streaming/uncompressed/u to 
streaming/color_matching/yuy2 for example.

>
>> +
>> +	/*
>> +	 * There's always a color matching descriptor associated with the format
>> +	 * but without a symlink it should only ever be the default one. If it's
>> +	 * not the default, there's already a symlink and we should bail out.
>> +	 */
>> +	color_matching_desc = uvcg_format_get_default_color_match(streaming);
>> +	if (fmt->color_matching != color_matching_desc) {
> If you check the source link name, I suppose this could be dropped. Then
> you coud just write
>
> 	fmt->color_matching->refcnt--;
>
> and avoid the call to uvcg_format_get_default_color_match().


Not sure I follow here I'm afraid. As I see it, to retain the current 
functionality (sending the 1/1/4 descriptor when no other is specified) 
we need to link the default descriptor when none other is linked, so we 
need to check whether or not that's the one that's currently linked to 
know if there's another symlink hanging around already. This check is 
designed to avoid streaming/uncompressed/u being linked to both 
streaming/color_matching/yuy2 and streaming/color_matching/mjpeg for 
example.

>
>> +		ret = -EBUSY;
>> +		goto out_put_cm;
>> +	}
>> +
>> +	color_matching_desc->refcnt--;
>> +
>> +	color_matching_desc = to_uvcg_color_matching(to_config_group(tgt));
>> +	fmt->color_matching = color_matching_desc;
>> +	color_matching_desc->refcnt++;
> And this could become
>
> 	fmt->color_matching = to_uvcg_color_matching(to_config_group(tgt));
> 	fmt->color_matching->refcnt++;
>
>> +
>> +out_put_cm:
>> +	config_item_put(color_matching);
>> +	mutex_unlock(su_mutex);
>> +
>> +	return ret;
>> +}
>> +
>> +static void uvcg_format_drop_link(struct config_item *src, struct config_item *tgt)
>> +{
>> +	struct mutex *su_mutex = &src->ci_group->cg_subsys->su_mutex;
>> +	struct uvcg_color_matching *color_matching_desc;
>> +	struct config_item *streaming;
>> +	struct uvcg_format *fmt;
>> +
>> +	mutex_lock(su_mutex);
>> +
>> +	color_matching_desc = to_uvcg_color_matching(to_config_group(tgt));
>> +	color_matching_desc->refcnt--;
>> +
>> +	streaming = src->ci_parent->ci_parent;
>> +	color_matching_desc = uvcg_format_get_default_color_match(streaming);
>> +
>> +	fmt = to_uvcg_format(src);
>> +	fmt->color_matching = color_matching_desc;
>> +	color_matching_desc->refcnt++;
> 	fmt->color_matching = uvcg_format_get_default_color_match(streaming);
> 	fmt->color_matching->refcnt++;
>
> although if you increase the refcnt in
> uvcg_format_get_default_color_match() as I proposed in a previous patch
> in this series, this would just be
>
> 	fmt->color_matching = uvcg_format_get_default_color_match(streaming);
>
>> +
>> +	mutex_unlock(su_mutex);
>> +}
>> +
>> +static struct configfs_item_operations uvcg_format_item_operations = {
>> +	.release	= uvcg_config_item_release,
>> +	.allow_link	= uvcg_format_allow_link,
>> +	.drop_link	= uvcg_format_drop_link,
>> +};
>> +
>>   static ssize_t uvcg_format_bma_controls_show(struct uvcg_format *f, char *page)
>>   {
>>   	struct f_uvc_opts *opts;
>> @@ -1571,7 +1642,7 @@ static struct configfs_attribute *uvcg_uncompressed_attrs[] = {
>>   };
>>   
>>   static const struct config_item_type uvcg_uncompressed_type = {
>> -	.ct_item_ops	= &uvcg_config_item_ops,
>> +	.ct_item_ops	= &uvcg_format_item_operations,
>>   	.ct_group_ops	= &uvcg_uncompressed_group_ops,
>>   	.ct_attrs	= uvcg_uncompressed_attrs,
>>   	.ct_owner	= THIS_MODULE,
>> @@ -1767,7 +1838,7 @@ static struct configfs_attribute *uvcg_mjpeg_attrs[] = {
>>   };
>>   
>>   static const struct config_item_type uvcg_mjpeg_type = {
>> -	.ct_item_ops	= &uvcg_config_item_ops,
>> +	.ct_item_ops	= &uvcg_format_item_operations,
>>   	.ct_group_ops	= &uvcg_mjpeg_group_ops,
>>   	.ct_attrs	= uvcg_mjpeg_attrs,
>>   	.ct_owner	= THIS_MODULE,
>> @@ -1922,6 +1993,29 @@ static const struct config_item_type uvcg_color_matching_type = {
>>    * streaming/color_matching
>>    */
>>   
>> +static struct config_group *uvcg_color_matching_make(struct config_group *group,
>> +						     const char *name)
>> +{
>> +	struct uvcg_color_matching *color_match;
>> +
>> +	color_match = kzalloc(sizeof(*color_match), GFP_KERNEL);
>> +	if (!color_match)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	color_match->desc.bLength = UVC_DT_COLOR_MATCHING_SIZE;
>> +	color_match->desc.bDescriptorType = USB_DT_CS_INTERFACE;
>> +	color_match->desc.bDescriptorSubType = UVC_VS_COLORFORMAT;
>> +
>> +	config_group_init_type_name(&color_match->group, name,
>> +				    &uvcg_color_matching_type);
>> +
>> +	return &color_match->group;
>> +}
>> +
>> +static struct configfs_group_operations uvcg_color_matching_grp_group_ops = {
>> +	.make_group	= uvcg_color_matching_make,
>> +};
>> +
>>   static int uvcg_color_matching_create_children(struct config_group *parent)
>>   {
>>   	struct uvcg_color_matching *color_match;
>> @@ -1947,6 +2041,7 @@ static int uvcg_color_matching_create_children(struct config_group *parent)
>>   static const struct uvcg_config_group_type uvcg_color_matching_grp_type = {
>>   	.type = {
>>   		.ct_item_ops	= &uvcg_config_item_ops,
>> +		.ct_group_ops	= &uvcg_color_matching_grp_group_ops,
>>   		.ct_owner	= THIS_MODULE,
>>   	},
>>   	.name = "color_matching",
