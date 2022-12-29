Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E40FE658881
	for <lists+linux-usb@lfdr.de>; Thu, 29 Dec 2022 03:05:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbiL2CFX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Dec 2022 21:05:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbiL2CFV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Dec 2022 21:05:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63536F6C
        for <linux-usb@vger.kernel.org>; Wed, 28 Dec 2022 18:05:19 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E4FA109;
        Thu, 29 Dec 2022 03:05:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672279517;
        bh=LD+FAVp0mXXm4Eu+7ks7+qluA44ombsyy+3jhtbwOW4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q5xE/E97Lyu7VeFOqvrckiS93Dn9jatf119rzg+kixP42z+8hVv22cjvB/rbCr1xg
         KMMpVjgF9KKfCmUCdViTinm3z9WFvntcpZfhUA3f6DFxQlL6SboG6ISKoqXzQnvydQ
         3fn28epi0okVk1i3/01iGi2+GfafYOnucBSTIlF8=
Date:   Thu, 29 Dec 2022 04:05:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, mgr@pengutronix.de
Subject: Re: [PATCH v2 6/9] usb: gadget: uvc: Allow linking XUs to string
 descriptors
Message-ID: <Y6z12UBWLaYzeOei@pendragon.ideasonboard.com>
References: <20221121092517.225242-1-dan.scally@ideasonboard.com>
 <20221121092517.225242-7-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221121092517.225242-7-dan.scally@ideasonboard.com>
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

On Mon, Nov 21, 2022 at 09:25:14AM +0000, Daniel Scally wrote:
> Add .allow_link() and .drop_link() callbacks to allow users to link
> an extension unit descriptor to a string descriptor.

A link seems weird to me for this. Wouldn't it be better to store the
name in uvcg_extension in a similar way that device or config strings
are handled in drievrs/usb/gadget/configfs.c ?

> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v2:
> 
> 	- New patch
> 
>  drivers/usb/gadget/function/uvc_configfs.c | 60 ++++++++++++++++++++++
>  drivers/usb/gadget/function/uvc_configfs.h |  1 +
>  2 files changed, 61 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> index da2f70036993..5c51862150c4 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -1053,8 +1053,68 @@ static void uvcg_extension_release(struct config_item *item)
>  	kfree(xu);
>  }
>  
> +static int uvcg_extension_allow_link(struct config_item *src, struct config_item *tgt)
> +{
> +	struct mutex *su_mutex = &src->ci_group->cg_subsys->su_mutex;
> +	struct uvcg_extension *xu = to_uvcg_extension(src);
> +	struct config_item *strings;
> +	struct uvcg_string *string;
> +	struct config_item *opts_item;
> +	struct f_uvc_opts *opts;
> +	int ret = 0;
> +
> +	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
> +
> +	/* Validate that the target of the link is an entry in strings/<langid> */
> +	opts_item = src->ci_parent->ci_parent->ci_parent;
> +
> +	strings = config_group_find_item(to_config_group(opts_item), "strings");
> +	if (!strings || tgt->ci_parent->ci_parent != strings) {
> +		ret = -EINVAL;
> +		goto put_strings;
> +	}
> +
> +	string = to_uvcg_string(tgt);
> +	opts = to_f_uvc_opts(opts_item);
> +
> +	mutex_lock(&opts->lock);
> +
> +	xu->string_descriptor_index = string->usb_string.id;
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
> +static void uvcg_extension_drop_link(struct config_item *src, struct config_item *tgt)
> +{
> +	struct mutex *su_mutex = &src->ci_group->cg_subsys->su_mutex;
> +	struct uvcg_extension *xu = to_uvcg_extension(src);
> +	struct config_item *opts_item;
> +	struct f_uvc_opts *opts;
> +
> +	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
> +
> +	opts_item = src->ci_parent->ci_parent->ci_parent;
> +	opts = to_f_uvc_opts(opts_item);
> +
> +	mutex_lock(&opts->lock);
> +
> +	xu->string_descriptor_index = 0;
> +
> +	mutex_unlock(&opts->lock);
> +
> +	mutex_unlock(su_mutex);
> +}
> +
>  static struct configfs_item_operations uvcg_extension_item_ops = {
>  	.release	= uvcg_extension_release,
> +	.allow_link	= uvcg_extension_allow_link,
> +	.drop_link	= uvcg_extension_drop_link,
>  };
>  
>  static const struct config_item_type uvcg_extension_type = {
> diff --git a/drivers/usb/gadget/function/uvc_configfs.h b/drivers/usb/gadget/function/uvc_configfs.h
> index a714426a174a..e1308026aed6 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.h
> +++ b/drivers/usb/gadget/function/uvc_configfs.h
> @@ -183,6 +183,7 @@ struct uvcg_extension_unit_descriptor {
>  struct uvcg_extension {
>  	struct config_item item;
>  	struct list_head list;
> +	u8 string_descriptor_index;
>  	struct uvcg_extension_unit_descriptor desc;
>  };
>  

-- 
Regards,

Laurent Pinchart
