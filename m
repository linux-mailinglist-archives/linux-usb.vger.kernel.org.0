Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 843CC691CF9
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 11:37:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232169AbjBJKha (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 05:37:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232223AbjBJKhR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 05:37:17 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12615DBCD
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 02:36:50 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0373DE70;
        Fri, 10 Feb 2023 11:36:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676025409;
        bh=Ft8+MxnCUTH5UF/qAy8b1d9p2quiRCtQh8TCUSOvMKk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VXpVbZ3CNRtm13trtEIcG8Bwy2ENzDCL+5/Y+2tm8iNOYz6lUwGzkO9oxynTsxJGB
         wnsI+xbbd3OGyMgRezkOJzScc93AIZkdituQGLQpKqAroBUjVmnwB6nYNPTKatLGa8
         N85niuqPFa5fAeCbF39uFHmKzGAR7e9I8qOR3Ghc=
Date:   Fri, 10 Feb 2023 12:36:47 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-usb@vger.kernel.org, dan.scally@ideasonboard.com,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH -next] usb: gadget: uvc: fix missing mutex_unlock() if
 kstrtou8() fails
Message-ID: <Y+YeP/aXNKBrXi5L@pendragon.ideasonboard.com>
References: <20230210071718.4072995-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230210071718.4072995-1-yangyingliang@huawei.com>
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

On Fri, Feb 10, 2023 at 03:17:18PM +0800, Yang Yingliang wrote:
> Add missing mutex_unlock() if kstrtou8() fails in store functions.
> 
> Fixes: 0525210c9840 ("usb: gadget: uvc: Allow definition of XUs in configfs")
> Fixes: b3c839bd8a07 ("usb: gadget: uvc: Make bSourceID read/write")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/usb/gadget/function/uvc_configfs.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> index 18c6a1461b7e..c2f0eb1c1f87 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -598,8 +598,10 @@ static ssize_t uvcg_default_output_b_source_id_store(struct config_item *item,
>  	cd = &opts->uvc_output_terminal;
>  
>  	result = kstrtou8(page, 0, &num);
> -	if (result)
> +	if (result) {
> +		mutex_unlock(su_mutex);
>  		return result;
> +	}

A better fix would, I think, be to move the kstrtou8() call before
locking any mutex. It doesn't need to be protected by a lock.

Same below.

>  
>  	mutex_lock(&opts->lock);
>  	cd->bSourceID = num;
> @@ -713,8 +715,10 @@ static ssize_t uvcg_extension_b_num_controls_store(struct config_item *item,
>  	opts = to_f_uvc_opts(opts_item);
>  
>  	ret = kstrtou8(page, 0, &num);
> -	if (ret)
> +	if (ret) {
> +		mutex_unlock(su_mutex);
>  		return ret;
> +	}
>  
>  	mutex_lock(&opts->lock);
>  	xu->desc.bNumControls = num;
> @@ -748,8 +752,10 @@ static ssize_t uvcg_extension_b_nr_in_pins_store(struct config_item *item,
>  	opts = to_f_uvc_opts(opts_item);
>  
>  	ret = kstrtou8(page, 0, &num);
> -	if (ret)
> +	if (ret) {
> +		mutex_unlock(su_mutex);
>  		return ret;
> +	}
>  
>  	mutex_lock(&opts->lock);
>  
> @@ -801,8 +807,10 @@ static ssize_t uvcg_extension_b_control_size_store(struct config_item *item,
>  	opts = to_f_uvc_opts(opts_item);
>  
>  	ret = kstrtou8(page, 0, &num);
> -	if (ret)
> +	if (ret) {
> +		mutex_unlock(su_mutex);
>  		return ret;
> +	}
>  
>  	mutex_lock(&opts->lock);
>  

-- 
Regards,

Laurent Pinchart
