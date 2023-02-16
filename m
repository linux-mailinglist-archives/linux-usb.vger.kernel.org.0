Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89ABE69977F
	for <lists+linux-usb@lfdr.de>; Thu, 16 Feb 2023 15:33:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjBPOdj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Feb 2023 09:33:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjBPOdi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Feb 2023 09:33:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F1F1E1D7
        for <linux-usb@vger.kernel.org>; Thu, 16 Feb 2023 06:33:37 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CCE9010B;
        Thu, 16 Feb 2023 15:33:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676558016;
        bh=VhrgiwurOpdrz4MLS4QY0h+fm7udayiXzw84lyywCpg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=oABAhUVCnlW/wfcSaHCW+sFqMDZoAMUcP7KF5ilC2/X2vFwAKNMQuwK9Tbwhab07z
         rStY9NJ7NrGLcD97FKiucxPQHRspMybKsdM3NBpB+u+LMrzDBM5DVzbrAl6CImeGK3
         491ER4P4Nlfpp3AqpuwYHH/xiAg0CDG0h515gBZ0=
Message-ID: <bcd9faec-0b48-13aa-f186-09093ab8a6c7@ideasonboard.com>
Date:   Thu, 16 Feb 2023 14:33:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH -next v2] usb: gadget: uvc: fix missing mutex_unlock() if
 kstrtou8() fails
Content-Language: en-US
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org
References: <20230213070926.776447-1-yangyingliang@huawei.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230213070926.776447-1-yangyingliang@huawei.com>
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

Hi Yang, thank you for catching the error.

On 13/02/2023 07:09, Yang Yingliang wrote:
> If kstrtou8() fails, the mutex_unlock() is missed, move kstrtou8()
> before mutex_lock() to fix it up.
>
> Fixes: 0525210c9840 ("usb: gadget: uvc: Allow definition of XUs in configfs")
> Fixes: b3c839bd8a07 ("usb: gadget: uvc: Make bSourceID read/write")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> ---
> v1 -> v2:
>    Move kstrtou8 before mutex_lock().
> ---
>   drivers/usb/gadget/function/uvc_configfs.c | 32 +++++++++++-----------
>   1 file changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> index 18c6a1461b7e..62b759bb7613 100644
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
> @@ -742,15 +742,15 @@ static ssize_t uvcg_extension_b_nr_in_pins_store(struct config_item *item,
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
>   	if (num == xu->desc.bNrInPins) {
> @@ -795,15 +795,15 @@ static ssize_t uvcg_extension_b_control_size_store(struct config_item *item,
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
