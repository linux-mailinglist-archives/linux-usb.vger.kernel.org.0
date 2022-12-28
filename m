Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAC6A6571F6
	for <lists+linux-usb@lfdr.de>; Wed, 28 Dec 2022 03:02:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232475AbiL1CCO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Dec 2022 21:02:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiL1CCN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Dec 2022 21:02:13 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEC01ED
        for <linux-usb@vger.kernel.org>; Tue, 27 Dec 2022 18:02:12 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD86625B;
        Wed, 28 Dec 2022 03:02:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672192931;
        bh=9Ykrkt6zu9kIFuuhumRdwNTIRYlaFzdlVUCMl8vGPkw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HdUwBCAD36X6+bHXPWwxSz1X69fXNP8cKpIyEPGvOMGdYzvS39GqNiEhBm1jpsaT3
         57U5oKxX8iukWOisjjhPRSGf6fvrpgXLRaSDR4wKcBnZ2TBEK43gfrlFwvXjP2AoeX
         7gq6tm7PkGr2sysausBYTiZVoLScOxyfsJ4ypAE0=
Date:   Wed, 28 Dec 2022 04:02:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        mgr@pengutronix.de, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 2/3] usb: gadget: uvc: Add new disable_interrupt_ep
 attribute
Message-ID: <Y6ujn+PSrCZKgJfx@pendragon.ideasonboard.com>
References: <20221205143758.1096914-1-dan.scally@ideasonboard.com>
 <20221205143758.1096914-3-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221205143758.1096914-3-dan.scally@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Dan,

Thank you for the patch.

On Mon, Dec 05, 2022 at 02:37:57PM +0000, Daniel Scally wrote:
> Add a new attribute to the default control config group that allows
> users to specify whether they want to disable the default interrupt
> endpoint for the VideoControl interface.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

Apart from the missing documentation, this looks good to me.

> ---
>  drivers/usb/gadget/function/u_uvc.h        |  2 +
>  drivers/usb/gadget/function/uvc_configfs.c | 53 ++++++++++++++++++++++
>  2 files changed, 55 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/u_uvc.h b/drivers/usb/gadget/function/u_uvc.h
> index 24b8681b0d6f..7e6d31a8fad7 100644
> --- a/drivers/usb/gadget/function/u_uvc.h
> +++ b/drivers/usb/gadget/function/u_uvc.h
> @@ -29,6 +29,8 @@ struct f_uvc_opts {
>  	unsigned int					streaming_interface;
>  	char						function_name[32];
>  
> +	bool						disable_interrupt_ep;
> +
>  	/*
>  	 * Control descriptors array pointers for full-/high-speed and
>  	 * super-speed. They point by default to the uvc_fs_control_cls and
> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> index 4303a3283ba0..644d87eee164 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -716,8 +716,61 @@ static ssize_t uvcg_default_control_b_interface_number_show(
>  
>  UVC_ATTR_RO(uvcg_default_control_, b_interface_number, bInterfaceNumber);
>  
> +static ssize_t uvcg_default_control_disable_interrupt_ep_show(
> +	struct config_item *item, char *page)
> +{
> +	struct config_group *group = to_config_group(item);
> +	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
> +	struct config_item *opts_item;
> +	struct f_uvc_opts *opts;
> +	int result = 0;
> +
> +	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
> +
> +	opts_item = item->ci_parent;
> +	opts = to_f_uvc_opts(opts_item);
> +
> +	mutex_lock(&opts->lock);
> +	result += sprintf(page, "%u\n", opts->disable_interrupt_ep);
> +	mutex_unlock(&opts->lock);
> +
> +	mutex_unlock(su_mutex);
> +
> +	return result;
> +}
> +
> +static ssize_t uvcg_default_control_disable_interrupt_ep_store(
> +	struct config_item *item, const char *page, size_t len)
> +{
> +	struct config_group *group = to_config_group(item);
> +	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
> +	struct config_item *opts_item;
> +	struct f_uvc_opts *opts;
> +	ssize_t ret;
> +	u8 num;
> +
> +	ret = kstrtou8(page, 0, &num);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
> +
> +	opts_item = item->ci_parent;
> +	opts = to_f_uvc_opts(opts_item);
> +
> +	mutex_lock(&opts->lock);
> +	opts->disable_interrupt_ep = num;
> +	mutex_unlock(&opts->lock);
> +
> +	mutex_unlock(su_mutex);
> +
> +	return len;
> +}
> +UVC_ATTR(uvcg_default_control_, disable_interrupt_ep, disable_interrupt_ep);
> +
>  static struct configfs_attribute *uvcg_default_control_attrs[] = {
>  	&uvcg_default_control_attr_b_interface_number,
> +	&uvcg_default_control_attr_disable_interrupt_ep,
>  	NULL,
>  };
>  

-- 
Regards,

Laurent Pinchart
