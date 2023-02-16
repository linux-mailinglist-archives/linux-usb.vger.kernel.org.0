Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 668A169975E
	for <lists+linux-usb@lfdr.de>; Thu, 16 Feb 2023 15:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbjBPO03 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Feb 2023 09:26:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbjBPO02 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Feb 2023 09:26:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8C3710242;
        Thu, 16 Feb 2023 06:26:18 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09D8110B;
        Thu, 16 Feb 2023 15:26:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676557577;
        bh=sA65bn0TGQs6om8e/KPMxmXURS3KslDykq9AzqoUIFg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=A2euq+dCedT5uyqEOQN7/t+oOhRp2u9XR7ZEXz4NzX+qvoLP0pO8Zl0KCbwi1sZ4S
         zQ+o5szep6Iqvl5CYONLe0+AAdfg7gYh00VSVOvxPCz+AAQmSbohoWk5SrZaCig9rF
         0ecd0vVkjAfKEN+tVKD9I5XGwi3p3OoPoGGOoeMM=
Message-ID: <a3f5ec02-6e23-c3a6-3c5b-9413337615ec@ideasonboard.com>
Date:   Thu, 16 Feb 2023 14:26:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] usb: gadget: uvc: unlock on an error paths
To:     Dan Carpenter <error27@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <Y+4ehE7/GgnRZuo0@kili>
Content-Language: en-US
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <Y+4ehE7/GgnRZuo0@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks Dan. This one was tackled by Yang already actually: 
https://lore.kernel.org/linux-usb/20230213070926.776447-1-yangyingliang@huawei.com/

On 16/02/2023 12:16, Dan Carpenter wrote:
> This code accidentally returns without dropping the "su_mutex" if
> kstrtou8() fails.  It's probably better to just do the kstrtou8() before
> taking the lock.
>
> Fixes: b3c839bd8a07 ("usb: gadget: uvc: Make bSourceID read/write")
> Fixes: 0525210c9840 ("usb: gadget: uvc: Allow definition of XUs in configfs")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>   drivers/usb/gadget/function/uvc_configfs.c | 31 +++++++++++-----------
>   1 file changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> index 18c6a1461b7e..a59c1a95bfcd 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -590,6 +590,10 @@ static ssize_t uvcg_default_output_b_source_id_store(struct config_item *item,
>   	int result;
>   	u8 num;
>   
> +	result = kstrtou8(page, 0, &num);
> +	if (result)
> +		return result;
> +
>   	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
>   
>   	opts_item = group->cg_item.ci_parent->ci_parent->
> @@ -597,10 +601,6 @@ static ssize_t uvcg_default_output_b_source_id_store(struct config_item *item,
>   	opts = to_f_uvc_opts(opts_item);
>   	cd = &opts->uvc_output_terminal;
>   
> -	result = kstrtou8(page, 0, &num);
> -	if (result)
> -		return result;
> -
>   	mutex_lock(&opts->lock);
>   	cd->bSourceID = num;
>   	mutex_unlock(&opts->lock);
> @@ -707,15 +707,15 @@ static ssize_t uvcg_extension_b_num_controls_store(struct config_item *item,
>   	int ret;
>   	u8 num;
>   
> +	ret = kstrtou8(page, 0, &num);
> +	if (ret)
> +		return ret;
> +
>   	mutex_lock(su_mutex);
>   
>   	opts_item = item->ci_parent->ci_parent->ci_parent;
>   	opts = to_f_uvc_opts(opts_item);
>   
> -	ret = kstrtou8(page, 0, &num);
> -	if (ret)
> -		return ret;
> -
>   	mutex_lock(&opts->lock);
>   	xu->desc.bNumControls = num;
>   	mutex_unlock(&opts->lock);
> @@ -742,14 +742,15 @@ static ssize_t uvcg_extension_b_nr_in_pins_store(struct config_item *item,
>   	int ret;
>   	u8 num;
>   
> +	ret = kstrtou8(page, 0, &num);
> +	if (ret)
> +		return ret;
> +
>   	mutex_lock(su_mutex);
>   
>   	opts_item = item->ci_parent->ci_parent->ci_parent;
>   	opts = to_f_uvc_opts(opts_item);
>   
> -	ret = kstrtou8(page, 0, &num);
> -	if (ret)
> -		return ret;
>   
>   	mutex_lock(&opts->lock);
>   
> @@ -795,15 +796,15 @@ static ssize_t uvcg_extension_b_control_size_store(struct config_item *item,
>   	int ret;
>   	u8 num;
>   
> +	ret = kstrtou8(page, 0, &num);
> +	if (ret)
> +		return ret;
> +
>   	mutex_lock(su_mutex);
>   
>   	opts_item = item->ci_parent->ci_parent->ci_parent;
>   	opts = to_f_uvc_opts(opts_item);
>   
> -	ret = kstrtou8(page, 0, &num);
> -	if (ret)
> -		return ret;
> -
>   	mutex_lock(&opts->lock);
>   
>   	if (num == xu->desc.bControlSize) {
