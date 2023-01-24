Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3673679E18
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jan 2023 16:58:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234427AbjAXP62 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Jan 2023 10:58:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234292AbjAXP61 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Jan 2023 10:58:27 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42BC4BA
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 07:58:26 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B33158A9;
        Tue, 24 Jan 2023 16:58:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674575904;
        bh=V90iYP6OyEn8GxyKJUREEcZqEeLiH1VI1viljGKVpvs=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=MfjGOQH2uuy3uYx79v6dV9WN83zNlrzfanI+mf71J32gHj/xh1Y+IC0o+oCpTZwRC
         V7NCQ7R2iGuAPYlaDeyhxbxYswkL87HIKknKFdU0z5jIMbMcfJgqvw4y1zvfwHtbpn
         zdSdHTkWT2H13tgYHZIhyyMOZlaU4K7Aazff/hx0=
Message-ID: <f7018d27-b6fe-3e68-79d3-34158260cad0@ideasonboard.com>
Date:   Tue, 24 Jan 2023 15:58:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, mgr@pengutronix.de
References: <20221121092517.225242-1-dan.scally@ideasonboard.com>
 <20221121092517.225242-7-dan.scally@ideasonboard.com>
 <Y6z12UBWLaYzeOei@pendragon.ideasonboard.com>
 <5c471dd6-a694-4a15-c319-2b53519a5d82@ideasonboard.com>
 <Y7LNSyyahVGjjbXK@pendragon.ideasonboard.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v2 6/9] usb: gadget: uvc: Allow linking XUs to string
 descriptors
In-Reply-To: <Y7LNSyyahVGjjbXK@pendragon.ideasonboard.com>
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

On 02/01/2023 12:25, Laurent Pinchart wrote:
> Hi Dan,
>
> On Sun, Jan 01, 2023 at 09:09:43PM +0000, Dan Scally wrote:
>> On 29/12/2022 02:05, Laurent Pinchart wrote:
>>> On Mon, Nov 21, 2022 at 09:25:14AM +0000, Daniel Scally wrote:
>>>> Add .allow_link() and .drop_link() callbacks to allow users to link
>>>> an extension unit descriptor to a string descriptor.
>>> A link seems weird to me for this. Wouldn't it be better to store the
>>> name in uvcg_extension in a similar way that device or config strings
>>> are handled in drievrs/usb/gadget/configfs.c ?
>> I think it's _easier_ that way but it conceptually makes more sense to
>> me like this. The primary problem I had with that method though is that
>> I couldn't see a good way to specify the language, if we do it that way.
>> Or do we just say we only support US English?
> Good question. As mentioned in a separate e-mail, I think string
> handling should be implemented in core gadget configfs helpers. I hope
> I'll be able to use my free get out of jail card and defer the decision
> on how to implement it to the USB gadget maintainers :-)


Coming back to this after the break and other things got in the way...my 
expectation here would be to just move roughly the current 
implementation to the strings config group that's at the root of a USB 
gadget's configfs directory structure (where the manufacturer, product 
and serialnumber attributes currently live)...I.E. still to create a 
config item for the string with the id and string attributes and link to 
them from other parts of the config like the extension units to assign 
them. That puts them into the "core" part rather than UVC gadget...but 
the actual functionality wouldn't be changing much. Is that what you meant?

>
>>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>>> ---
>>>> Changes in v2:
>>>>
>>>> 	- New patch
>>>>
>>>>    drivers/usb/gadget/function/uvc_configfs.c | 60 ++++++++++++++++++++++
>>>>    drivers/usb/gadget/function/uvc_configfs.h |  1 +
>>>>    2 files changed, 61 insertions(+)
>>>>
>>>> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
>>>> index da2f70036993..5c51862150c4 100644
>>>> --- a/drivers/usb/gadget/function/uvc_configfs.c
>>>> +++ b/drivers/usb/gadget/function/uvc_configfs.c
>>>> @@ -1053,8 +1053,68 @@ static void uvcg_extension_release(struct config_item *item)
>>>>    	kfree(xu);
>>>>    }
>>>>    
>>>> +static int uvcg_extension_allow_link(struct config_item *src, struct config_item *tgt)
>>>> +{
>>>> +	struct mutex *su_mutex = &src->ci_group->cg_subsys->su_mutex;
>>>> +	struct uvcg_extension *xu = to_uvcg_extension(src);
>>>> +	struct config_item *strings;
>>>> +	struct uvcg_string *string;
>>>> +	struct config_item *opts_item;
>>>> +	struct f_uvc_opts *opts;
>>>> +	int ret = 0;
>>>> +
>>>> +	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
>>>> +
>>>> +	/* Validate that the target of the link is an entry in strings/<langid> */
>>>> +	opts_item = src->ci_parent->ci_parent->ci_parent;
>>>> +
>>>> +	strings = config_group_find_item(to_config_group(opts_item), "strings");
>>>> +	if (!strings || tgt->ci_parent->ci_parent != strings) {
>>>> +		ret = -EINVAL;
>>>> +		goto put_strings;
>>>> +	}
>>>> +
>>>> +	string = to_uvcg_string(tgt);
>>>> +	opts = to_f_uvc_opts(opts_item);
>>>> +
>>>> +	mutex_lock(&opts->lock);
>>>> +
>>>> +	xu->string_descriptor_index = string->usb_string.id;
>>>> +
>>>> +	mutex_unlock(&opts->lock);
>>>> +
>>>> +put_strings:
>>>> +	config_item_put(strings);
>>>> +	mutex_unlock(su_mutex);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static void uvcg_extension_drop_link(struct config_item *src, struct config_item *tgt)
>>>> +{
>>>> +	struct mutex *su_mutex = &src->ci_group->cg_subsys->su_mutex;
>>>> +	struct uvcg_extension *xu = to_uvcg_extension(src);
>>>> +	struct config_item *opts_item;
>>>> +	struct f_uvc_opts *opts;
>>>> +
>>>> +	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
>>>> +
>>>> +	opts_item = src->ci_parent->ci_parent->ci_parent;
>>>> +	opts = to_f_uvc_opts(opts_item);
>>>> +
>>>> +	mutex_lock(&opts->lock);
>>>> +
>>>> +	xu->string_descriptor_index = 0;
>>>> +
>>>> +	mutex_unlock(&opts->lock);
>>>> +
>>>> +	mutex_unlock(su_mutex);
>>>> +}
>>>> +
>>>>    static struct configfs_item_operations uvcg_extension_item_ops = {
>>>>    	.release	= uvcg_extension_release,
>>>> +	.allow_link	= uvcg_extension_allow_link,
>>>> +	.drop_link	= uvcg_extension_drop_link,
>>>>    };
>>>>    
>>>>    static const struct config_item_type uvcg_extension_type = {
>>>> diff --git a/drivers/usb/gadget/function/uvc_configfs.h b/drivers/usb/gadget/function/uvc_configfs.h
>>>> index a714426a174a..e1308026aed6 100644
>>>> --- a/drivers/usb/gadget/function/uvc_configfs.h
>>>> +++ b/drivers/usb/gadget/function/uvc_configfs.h
>>>> @@ -183,6 +183,7 @@ struct uvcg_extension_unit_descriptor {
>>>>    struct uvcg_extension {
>>>>    	struct config_item item;
>>>>    	struct list_head list;
>>>> +	u8 string_descriptor_index;
>>>>    	struct uvcg_extension_unit_descriptor desc;
>>>>    };
>>>>    
