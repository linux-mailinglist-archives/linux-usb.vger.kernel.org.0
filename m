Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1ABE65ABA7
	for <lists+linux-usb@lfdr.de>; Sun,  1 Jan 2023 22:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbjAAVSU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 1 Jan 2023 16:18:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjAAVST (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 1 Jan 2023 16:18:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B49DD85
        for <linux-usb@vger.kernel.org>; Sun,  1 Jan 2023 13:18:18 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F0A36DB;
        Sun,  1 Jan 2023 22:18:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672607896;
        bh=xTbsz3NV8xZg4h+0rkRcJ4/S8QTz572CBxcPhhg8KUQ=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=hEJBgrgiEjLhRpsAmf2V7nKDmr+rufXEepDFyf/cueoazQkT1wkm491QTme214yay
         9MSOB7SvmRwB4VYQ+0sem+8ed2gY0TKMYW5Ma9wPOKGEzFnZiNJ7g+wpES1xZzTEqd
         A2R+J4ICxO6/PTSr1/zlb6VZFymnEw8OpTbLji48=
Message-ID: <c9546d48-63de-16db-d3ea-65535103a49f@ideasonboard.com>
Date:   Sun, 1 Jan 2023 21:18:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, mgr@pengutronix.de
References: <20221121092517.225242-1-dan.scally@ideasonboard.com>
 <20221121092517.225242-2-dan.scally@ideasonboard.com>
 <Y6zfiiCjcGTHeYd9@pendragon.ideasonboard.com>
 <Y6zfvXakE9stRqXw@pendragon.ideasonboard.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v2 1/9] usb: gadget: uvc: Make bSourceID read/write
In-Reply-To: <Y6zfvXakE9stRqXw@pendragon.ideasonboard.com>
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

On 29/12/2022 00:30, Laurent Pinchart wrote:
> On Thu, Dec 29, 2022 at 02:30:04AM +0200, Laurent Pinchart wrote:
>> Hi Dan,
>>
>> Thank you for the patch.
>>
>> On Mon, Nov 21, 2022 at 09:25:09AM +0000, Daniel Scally wrote:
>>> At the moment, the UVC function graph is hardcoded IT -> PU -> OT.
>>> To add XU support we need the ability to insert the XU descriptors
>>> into the chain. To facilitate that, make the output terminal's
>>> bSourceID attribute writeable so that we can configure its source.
>>>
>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>> ---
>>> Changes in v2:
>>>
>>> 	- Updated the ABI Documentation to reflect the change.
>>>
>>>   .../ABI/testing/configfs-usb-gadget-uvc       |  2 +-
>>>   drivers/usb/gadget/function/uvc_configfs.c    | 57 ++++++++++++++++++-
>>>   2 files changed, 57 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
>>> index 611b23e6488d..feb3f2cc0c16 100644
>>> --- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
>>> +++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
>>> @@ -52,7 +52,7 @@ Date:		Dec 2014
>>>   KernelVersion:	4.0
>>>   Description:	Default output terminal descriptors
>>>   
>>> -		All attributes read only:
>>> +		All attributes read only except bSourceID:
>>>   
>>>   		==============	=============================================
>>>   		iTerminal	index of string descriptor
>>> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
>>> index 4303a3283ba0..af4258120f9a 100644
>>> --- a/drivers/usb/gadget/function/uvc_configfs.c
>>> +++ b/drivers/usb/gadget/function/uvc_configfs.c
>>> @@ -483,11 +483,66 @@ UVC_ATTR_RO(uvcg_default_output_, cname, aname)
>>>   UVCG_DEFAULT_OUTPUT_ATTR(b_terminal_id, bTerminalID, 8);
>>>   UVCG_DEFAULT_OUTPUT_ATTR(w_terminal_type, wTerminalType, 16);
>>>   UVCG_DEFAULT_OUTPUT_ATTR(b_assoc_terminal, bAssocTerminal, 8);
>>> -UVCG_DEFAULT_OUTPUT_ATTR(b_source_id, bSourceID, 8);
>>>   UVCG_DEFAULT_OUTPUT_ATTR(i_terminal, iTerminal, 8);
>>>   
>>>   #undef UVCG_DEFAULT_OUTPUT_ATTR
>>>   
>>> +static ssize_t uvcg_default_output_b_source_id_show(struct config_item *item,
>>> +						    char *page)
>>> +{
>>> +	struct config_group *group = to_config_group(item);
>>> +	struct f_uvc_opts *opts;
>>> +	struct config_item *opts_item;
>>> +	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
>>> +	struct uvc_output_terminal_descriptor *cd;
>>> +	int result;
>>> +
>>> +	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
>>> +
>>> +	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent->ci_parent;
>>> +	opts = to_f_uvc_opts(opts_item);
>>> +	cd = &opts->uvc_output_terminal;
>>> +
>>> +	mutex_lock(&opts->lock);
>>> +	result = sprintf(page, "%u\n", le8_to_cpu(cd->bSourceID));
>>> +	mutex_unlock(&opts->lock);
>>> +
>>> +	mutex_unlock(su_mutex);
>>> +
>>> +	return result;
>>> +}
>>> +
>>> +static ssize_t uvcg_default_output_b_source_id_store(struct config_item *item,
>>> +						     const char *page, size_t len)
>>> +{
>>> +	struct config_group *group = to_config_group(item);
>>> +	struct f_uvc_opts *opts;
>>> +	struct config_item *opts_item;
>>> +	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
>>> +	struct uvc_output_terminal_descriptor *cd;
>>> +	int result;
>>> +	u8 num;
>>> +
>>> +	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
>>> +
>>> +	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent->ci_parent;
>>> +	opts = to_f_uvc_opts(opts_item);
>>> +	cd = &opts->uvc_output_terminal;
>>> +
>>> +	result = kstrtou8(page, 0, &num);
>>> +	if (result)
>>> +		return result;
>>> +
>>> +	mutex_lock(&opts->lock);
>>> +	cd->bSourceID = num;
>>> +	mutex_unlock(&opts->lock);
>>> +
>>> +	mutex_unlock(su_mutex);
>>> +
>>> +	return len;
>>> +}
>>> +UVC_ATTR(uvcg_default_output_, b_source_id, bSourceID);
>> Feel free to shoot this idea down if it's a bad one: given that the
>> bSourceID attributes serve to create a pipeline by linking entities,
>> would it make sense to model these links with symlinks ?
> I forgot to mention that this would handle the bSourceID attribute
> automatically, avoiding mistakes. But maybe we're over-engineering all
> this...


Hmmmm, maybe. I lean towards over-engineered, but not strongly so. 
Assuming the string descriptors stand as is, the .allow_link() for XUs 
would have to account for linking to both a string and another unit. The 
position of the Source ID field in the Unit Descriptors differs, and for 
the XUs is nested behind another struct...and properly supporting XUs as 
specified means we'd need to allow multiple links in to an XU, all of 
which might make it a bit more complicated than it is helpful. Happy to 
be convinced otherwise though; I'm on the fence about it.

>
>>> +
>>>   static struct configfs_attribute *uvcg_default_output_attrs[] = {
>>>   	&uvcg_default_output_attr_b_terminal_id,
>>>   	&uvcg_default_output_attr_w_terminal_type,
