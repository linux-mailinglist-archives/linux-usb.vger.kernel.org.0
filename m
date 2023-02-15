Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3358A6979C4
	for <lists+linux-usb@lfdr.de>; Wed, 15 Feb 2023 11:22:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbjBOKWR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Feb 2023 05:22:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbjBOKWQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Feb 2023 05:22:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AF6E32E6A
        for <linux-usb@vger.kernel.org>; Wed, 15 Feb 2023 02:22:15 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C9E027C;
        Wed, 15 Feb 2023 11:22:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676456533;
        bh=h9ncSyDhPWBuV8rf+kPxRy1NJNSwPo4RycOL/mcHvIg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eXjrceiLwAMT0mQn0mlm3+3Rk1if4nOd5L7pDyzo/x1eZ03Y3sHStIGyXbu7hIuNq
         bq89oLv6cWdlUaytPxQNzN7AH/tNpeaXNqqcFK+CMtuRRx1oj3YWKbJczYilEZvcu7
         YgOq8PoDFHk55Z8cafkpHF10QuwD4G3Ku5lyK23U=
Date:   Wed, 15 Feb 2023 12:22:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-usb@vger.kernel.org, dan.scally@ideasonboard.com,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH -next v2] usb: gadget: uvc: fix missing mutex_unlock() if
 kstrtou8() fails
Message-ID: <Y+yyVUzmWC5MJubv@pendragon.ideasonboard.com>
References: <20230213070926.776447-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230213070926.776447-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Yang,

Thank you for the patch.

On Mon, Feb 13, 2023 at 03:09:26PM +0800, Yang Yingliang wrote:
> If kstrtou8() fails, the mutex_unlock() is missed, move kstrtou8()
> before mutex_lock() to fix it up.
> 
> Fixes: 0525210c9840 ("usb: gadget: uvc: Allow definition of XUs in configfs")
> Fixes: b3c839bd8a07 ("usb: gadget: uvc: Make bSourceID read/write")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v1 -> v2:
>   Move kstrtou8 before mutex_lock().
> ---
>  drivers/usb/gadget/function/uvc_configfs.c | 32 +++++++++++-----------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> index 18c6a1461b7e..62b759bb7613 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -590,6 +590,10 @@ static ssize_t uvcg_default_output_b_source_id_store(struct config_item *item,
>  	int result;
>  	u8 num;
>  
> +	result = kstrtou8(page, 0, &num);
> +	if (result)
> +		return result;
> +
>  	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
>  
>  	opts_item = group->cg_item.ci_parent->ci_parent->
> @@ -597,10 +601,6 @@ static ssize_t uvcg_default_output_b_source_id_store(struct config_item *item,
>  	opts = to_f_uvc_opts(opts_item);
>  	cd = &opts->uvc_output_terminal;
>  
> -	result = kstrtou8(page, 0, &num);
> -	if (result)
> -		return result;
> -
>  	mutex_lock(&opts->lock);
>  	cd->bSourceID = num;
>  	mutex_unlock(&opts->lock);
> @@ -707,15 +707,15 @@ static ssize_t uvcg_extension_b_num_controls_store(struct config_item *item,
>  	int ret;
>  	u8 num;
>  
> +	ret = kstrtou8(page, 0, &num);
> +	if (ret)
> +		return ret;
> +
>  	mutex_lock(su_mutex);
>  
>  	opts_item = item->ci_parent->ci_parent->ci_parent;
>  	opts = to_f_uvc_opts(opts_item);
>  
> -	ret = kstrtou8(page, 0, &num);
> -	if (ret)
> -		return ret;
> -
>  	mutex_lock(&opts->lock);
>  	xu->desc.bNumControls = num;
>  	mutex_unlock(&opts->lock);
> @@ -742,15 +742,15 @@ static ssize_t uvcg_extension_b_nr_in_pins_store(struct config_item *item,
>  	int ret;
>  	u8 num;
>  
> +	ret = kstrtou8(page, 0, &num);
> +	if (ret)
> +		return ret;
> +
>  	mutex_lock(su_mutex);
>  
>  	opts_item = item->ci_parent->ci_parent->ci_parent;
>  	opts = to_f_uvc_opts(opts_item);
>  
> -	ret = kstrtou8(page, 0, &num);
> -	if (ret)
> -		return ret;
> -
>  	mutex_lock(&opts->lock);
>  
>  	if (num == xu->desc.bNrInPins) {
> @@ -795,15 +795,15 @@ static ssize_t uvcg_extension_b_control_size_store(struct config_item *item,
>  	int ret;
>  	u8 num;
>  
> +	ret = kstrtou8(page, 0, &num);
> +	if (ret)
> +		return ret;
> +
>  	mutex_lock(su_mutex);
>  
>  	opts_item = item->ci_parent->ci_parent->ci_parent;
>  	opts = to_f_uvc_opts(opts_item);
>  
> -	ret = kstrtou8(page, 0, &num);
> -	if (ret)
> -		return ret;
> -
>  	mutex_lock(&opts->lock);
>  
>  	if (num == xu->desc.bControlSize) {

-- 
Regards,

Laurent Pinchart
