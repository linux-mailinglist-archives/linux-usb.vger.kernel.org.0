Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93109631D89
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 10:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbiKUJ5s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Nov 2022 04:57:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbiKUJ5o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 04:57:44 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31C0012771
        for <linux-usb@vger.kernel.org>; Mon, 21 Nov 2022 01:57:43 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 75FCC74C;
        Mon, 21 Nov 2022 10:57:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669024661;
        bh=7npvkC08IJINhuIaR9L6hRAQJv7Nku1itNwvMDP3sg8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Cpm0cLiFoYqJ8VNMG3D5x2aSxSLizMHz5g+7ZxbTvhlcjUE24okp1X75MQjrvxyvr
         5+loFjKdnLt1X9HnojYY6OaYW0BBxZFzq73ctFwSkLZiTis2mOfIvaGiMrFybC5AM/
         1wgEupvOfQzOzmfJHJKPxr3phkKk0bdgjfsKEpKo=
Message-ID: <a350247d-396a-d732-793d-f9e07a09d032@ideasonboard.com>
Date:   Mon, 21 Nov 2022 09:57:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 8/9] usb: gadget: uvc: Allow linking function to string
 descs
Content-Language: en-US
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, mgr@pengutronix.de
References: <20221121092517.225242-1-dan.scally@ideasonboard.com>
 <20221121092517.225242-9-dan.scally@ideasonboard.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20221121092517.225242-9-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all - apologies, meant to add this discussion point before sending

On 21/11/2022 09:25, Daniel Scally wrote:
> Currently the string descriptors for the IAD, VideoControl Interface
> and VideoStreaming Interfaces are hardcoded into f_uvc. Now that we
> can create arbitrary string descriptors, add a mechanism to define
> string descriptors for the IAD, VC and VS interfaces by linking to
> the appropriate directory at function level.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v2:
>
> 	- New patch
>
>   drivers/usb/gadget/function/u_uvc.h        |  8 +++
>   drivers/usb/gadget/function/uvc_configfs.c | 59 ++++++++++++++++++++++
>   2 files changed, 67 insertions(+)
>
> diff --git a/drivers/usb/gadget/function/u_uvc.h b/drivers/usb/gadget/function/u_uvc.h
> index c1c9ea5931d3..331cdf5ba9c8 100644
> --- a/drivers/usb/gadget/function/u_uvc.h
> +++ b/drivers/usb/gadget/function/u_uvc.h
> @@ -88,6 +88,14 @@ struct f_uvc_opts {
>   	struct list_head				languages;
>   	unsigned int					nlangs;
>   
> +	/*
> +	 * Indexes into the function's string descriptors allowing users to set
> +	 * custom descriptions rather than the hard-coded defaults.
> +	 */
> +	u8						iad_index;
> +	u8						vs0_index;
> +	u8						vs1_index;
> +
>   	/*
>   	 * Read/write access to configfs attributes is handled by configfs.
>   	 *
> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> index 5c51862150c4..e8faa31998fa 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -3197,8 +3197,67 @@ static void uvc_func_item_release(struct config_item *item)
>   	usb_put_function_instance(&opts->func_inst);
>   }
>   
> +static int uvc_func_allow_link(struct config_item *src, struct config_item *tgt)
> +{
> +	struct mutex *su_mutex = &src->ci_group->cg_subsys->su_mutex;
> +	struct config_item *strings;
> +	struct uvcg_string *string;
> +	struct f_uvc_opts *opts;
> +	int ret = 0;
> +
> +	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
> +
> +	/* Validate that the target is an entry in strings/<langid> */
> +	strings = config_group_find_item(to_config_group(src), "strings");
> +	if (!strings || tgt->ci_parent->ci_parent != strings) {
> +		ret = -EINVAL;
> +		goto put_strings;
> +	}
> +
> +	string = to_uvcg_string(tgt);
> +
> +	opts = to_f_uvc_opts(src);
> +	mutex_lock(&opts->lock);
> +
> +	if (!strcmp(tgt->ci_name, "iad_desc"))
> +		opts->iad_index = string->usb_string.id;
> +	else if (!strcmp(tgt->ci_name, "vs0_desc"))
> +		opts->vs0_index = string->usb_string.id;
> +	else if (!strcmp(tgt->ci_name, "vs1_desc"))
> +		opts->vs1_index = string->usb_string.id;
> +	else
> +		ret = -EINVAL;


Is this reliance on the name of the target to set the right internal 
index an acceptable method? I wasn't quite sure, but it seemed like the 
simplest way to do it.

> +
> +	mutex_unlock(&opts->lock);
> +
> +put_strings:
> +	config_item_put(strings);
> +	mutex_unlock(su_mutex);
> +
> +	return ret;
> +}
> +
> +static void uvc_func_drop_link(struct config_item *src, struct config_item *tgt)
> +{
> +	struct f_uvc_opts *opts;
> +
> +	opts = to_f_uvc_opts(src);
> +	mutex_lock(&opts->lock);
> +
> +	if (!strcmp(tgt->ci_name, "iad_desc"))
> +		opts->iad_index = 0;
> +	else if (!strcmp(tgt->ci_name, "vs0_desc"))
> +		opts->vs0_index = 0;
> +	else if (!strcmp(tgt->ci_name, "vs1_desc"))
> +		opts->vs1_index = 0;
> +
> +	mutex_unlock(&opts->lock);
> +}
> +
>   static struct configfs_item_operations uvc_func_item_ops = {
>   	.release	= uvc_func_item_release,
> +	.allow_link	= uvc_func_allow_link,
> +	.drop_link	= uvc_func_drop_link,
>   };
>   
>   #define UVCG_OPTS_ATTR(cname, aname, limit)				\
