Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDFBC650528
	for <lists+linux-usb@lfdr.de>; Sun, 18 Dec 2022 23:53:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbiLRWxA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 18 Dec 2022 17:53:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiLRWw6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 18 Dec 2022 17:52:58 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44519A47B
        for <linux-usb@vger.kernel.org>; Sun, 18 Dec 2022 14:52:57 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7CDDD9E5;
        Sun, 18 Dec 2022 23:52:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671403974;
        bh=7ghnXHMHUEcqsakRHJORbPjwgFFGYYjQbFL9BesFtx4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sPf9iCDLRH8VdDajl5vz9vzMdRHLrRbBaobEnhUAbsoQ3x2LI3EragAwUfMrVfpqm
         8DBHDPiHyjuwCGLjHSWrH3uy+56lAaNVBsJWI9OysLHFtzzQchpdOwflBE2EyOK3bc
         C5s6J6q+VkKS7+azCvcGTfkgeC0ZPtEUm8vf0qrA=
Date:   Mon, 19 Dec 2022 00:52:49 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com
Subject: Re: [PATCH 4/6] usb: gadget: uvc: Remove the hardcoded default color
 matching
Message-ID: <Y5+ZwdwT2b2nT730@pendragon.ideasonboard.com>
References: <20221213083736.2284536-1-dan.scally@ideasonboard.com>
 <20221213083736.2284536-5-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221213083736.2284536-5-dan.scally@ideasonboard.com>
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

On Tue, Dec 13, 2022 at 08:37:34AM +0000, Daniel Scally wrote:
> A hardcoded default color matching descriptor is embedded in struct
> f_uvc_opts but no longer has any use - remove it.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/usb/gadget/function/f_uvc.c | 9 ---------
>  drivers/usb/gadget/function/u_uvc.h | 1 -
>  2 files changed, 10 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> index 6e196e06181e..46bdea73cdeb 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -793,7 +793,6 @@ static struct usb_function_instance *uvc_alloc_inst(void)
>  	struct uvc_camera_terminal_descriptor *cd;
>  	struct uvc_processing_unit_descriptor *pd;
>  	struct uvc_output_terminal_descriptor *od;
> -	struct uvc_color_matching_descriptor *md;
>  	struct uvc_descriptor_header **ctl_cls;
>  	int ret;
>  
> @@ -842,14 +841,6 @@ static struct usb_function_instance *uvc_alloc_inst(void)
>  	od->bSourceID			= 2;
>  	od->iTerminal			= 0;
>  
> -	md = &opts->uvc_color_matching;
> -	md->bLength			= UVC_DT_COLOR_MATCHING_SIZE;
> -	md->bDescriptorType		= USB_DT_CS_INTERFACE;
> -	md->bDescriptorSubType		= UVC_VS_COLORFORMAT;
> -	md->bColorPrimaries		= 1;
> -	md->bTransferCharacteristics	= 1;
> -	md->bMatrixCoefficients		= 4;
> -
>  	/* Prepare fs control class descriptors for configfs-based gadgets */
>  	ctl_cls = opts->uvc_fs_control_cls;
>  	ctl_cls[0] = NULL;	/* assigned elsewhere by configfs */
> diff --git a/drivers/usb/gadget/function/u_uvc.h b/drivers/usb/gadget/function/u_uvc.h
> index 24b8681b0d6f..577c1c48ca4a 100644
> --- a/drivers/usb/gadget/function/u_uvc.h
> +++ b/drivers/usb/gadget/function/u_uvc.h
> @@ -52,7 +52,6 @@ struct f_uvc_opts {
>  	struct uvc_camera_terminal_descriptor		uvc_camera_terminal;
>  	struct uvc_processing_unit_descriptor		uvc_processing;
>  	struct uvc_output_terminal_descriptor		uvc_output_terminal;
> -	struct uvc_color_matching_descriptor		uvc_color_matching;
>  
>  	/*
>  	 * Control descriptors pointers arrays for full-/high-speed and

-- 
Regards,

Laurent Pinchart
