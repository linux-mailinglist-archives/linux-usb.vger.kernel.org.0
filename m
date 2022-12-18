Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE1E6505AD
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 00:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231172AbiLRX3a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 18 Dec 2022 18:29:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbiLRX33 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 18 Dec 2022 18:29:29 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 933DCCE
        for <linux-usb@vger.kernel.org>; Sun, 18 Dec 2022 15:29:28 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C735825;
        Mon, 19 Dec 2022 00:29:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671406167;
        bh=4tvV5oDSD2nB0HuXEte2yg2QtSXojwhdBvKXiD6z4Ic=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nx68UIUULu9K9FGWEh/RwDFLPJAQ1FlydpcXvjLRk02BUu5QwDiR7joSPL5YPh4lz
         XI0/H/93eKiw5IHRMTEVc2W/Owb3DaCCWJT9fVzbOujNbRI6r1lbfYUeDVU/WXrsAL
         NrJb4ZqkJ54KtbiooAFgOT0zrwkuFHizPzRGjM1Y=
Date:   Mon, 19 Dec 2022 01:29:22 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com
Subject: Re: [PATCH 1/6] usb: gadget: usb: Remove "default" from color
 matching attributes
Message-ID: <Y5+iUsdzsn+XdMMk@pendragon.ideasonboard.com>
References: <20221213083736.2284536-1-dan.scally@ideasonboard.com>
 <20221213083736.2284536-2-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221213083736.2284536-2-dan.scally@ideasonboard.com>
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

On Tue, Dec 13, 2022 at 08:37:31AM +0000, Daniel Scally wrote:
> Color matching attributes in the configfs for UVC are named with the
> phrase "default". The implication of that is that they will only be
> used _with_ the default color matching descriptor, and that will
> shortly no longer be the case.
> 
> Remove the "default" from the color matching descriptor attribute
> variables.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/usb/gadget/function/uvc_configfs.c | 29 +++++++++++-----------
>  1 file changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> index 4303a3283ba0..26d092790f12 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -1783,8 +1783,8 @@ static const struct uvcg_config_group_type uvcg_mjpeg_grp_type = {
>   * streaming/color_matching/default
>   */
>  
> -#define UVCG_DEFAULT_COLOR_MATCHING_ATTR(cname, aname, bits)		\
> -static ssize_t uvcg_default_color_matching_##cname##_show(		\
> +#define UVCG_COLOR_MATCHING_ATTR(cname, aname, bits)			\
> +static ssize_t uvcg_color_matching_##cname##_show(			\
>  	struct config_item *item, char *page)				\
>  {									\
>  	struct config_group *group = to_config_group(item);		\
> @@ -1808,26 +1808,25 @@ static ssize_t uvcg_default_color_matching_##cname##_show(		\
>  	return result;							\
>  }									\
>  									\
> -UVC_ATTR_RO(uvcg_default_color_matching_, cname, aname)
> +UVC_ATTR_RO(uvcg_color_matching_, cname, aname)
>  
> -UVCG_DEFAULT_COLOR_MATCHING_ATTR(b_color_primaries, bColorPrimaries, 8);
> -UVCG_DEFAULT_COLOR_MATCHING_ATTR(b_transfer_characteristics,
> -				 bTransferCharacteristics, 8);
> -UVCG_DEFAULT_COLOR_MATCHING_ATTR(b_matrix_coefficients, bMatrixCoefficients, 8);
> +UVCG_COLOR_MATCHING_ATTR(b_color_primaries, bColorPrimaries, 8);
> +UVCG_COLOR_MATCHING_ATTR(b_transfer_characteristics, bTransferCharacteristics, 8);
> +UVCG_COLOR_MATCHING_ATTR(b_matrix_coefficients, bMatrixCoefficients, 8);
>  
> -#undef UVCG_DEFAULT_COLOR_MATCHING_ATTR
> +#undef UVCG_COLOR_MATCHING_ATTR
>  
> -static struct configfs_attribute *uvcg_default_color_matching_attrs[] = {
> -	&uvcg_default_color_matching_attr_b_color_primaries,
> -	&uvcg_default_color_matching_attr_b_transfer_characteristics,
> -	&uvcg_default_color_matching_attr_b_matrix_coefficients,
> +static struct configfs_attribute *uvcg_color_matching_attrs[] = {
> +	&uvcg_color_matching_attr_b_color_primaries,
> +	&uvcg_color_matching_attr_b_transfer_characteristics,
> +	&uvcg_color_matching_attr_b_matrix_coefficients,
>  	NULL,
>  };
>  
> -static const struct uvcg_config_group_type uvcg_default_color_matching_type = {
> +static const struct uvcg_config_group_type uvcg_color_matching_type = {
>  	.type = {
>  		.ct_item_ops	= &uvcg_config_item_ops,
> -		.ct_attrs	= uvcg_default_color_matching_attrs,
> +		.ct_attrs	= uvcg_color_matching_attrs,
>  		.ct_owner	= THIS_MODULE,
>  	},
>  	.name = "default",
> @@ -1844,7 +1843,7 @@ static const struct uvcg_config_group_type uvcg_color_matching_grp_type = {
>  	},
>  	.name = "color_matching",
>  	.children = (const struct uvcg_config_group_type*[]) {
> -		&uvcg_default_color_matching_type,
> +		&uvcg_color_matching_type,
>  		NULL,
>  	},
>  };

-- 
Regards,

Laurent Pinchart
