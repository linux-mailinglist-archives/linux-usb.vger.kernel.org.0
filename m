Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F43B65721C
	for <lists+linux-usb@lfdr.de>; Wed, 28 Dec 2022 03:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbiL1Cfz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Dec 2022 21:35:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiL1Cfy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Dec 2022 21:35:54 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 212E4289
        for <linux-usb@vger.kernel.org>; Tue, 27 Dec 2022 18:35:53 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C57325B;
        Wed, 28 Dec 2022 03:35:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672194951;
        bh=WTtYPKmGteDa4+ECM4u3SSjtpkHDJOL/wmJGOizcmUs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N2bhuBrx8snY4h77t7B5j1wnQWkLDutQjyB4wh+rlGqkhN34M3dJzzM6tkpwDue6g
         SCg0BsXoQFzdYCBm3Ai2IY1z6lY/mxUw3UxCuriZRCUmdlsFB8+79IWRdr8JXhnGdR
         IfLjf9dEt6mJBJiAeWcKyfT6UQFHw8MknxOEkuPo=
Date:   Wed, 28 Dec 2022 04:35:47 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com
Subject: Re: [PATCH v2 6/7] usb: gadget: uvc: Make color matching attributes
 read/write
Message-ID: <Y6urgyXlUYQ0VVJG@pendragon.ideasonboard.com>
References: <20221219144316.757680-1-dan.scally@ideasonboard.com>
 <20221219144316.757680-7-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221219144316.757680-7-dan.scally@ideasonboard.com>
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

On Mon, Dec 19, 2022 at 02:43:15PM +0000, Daniel Scally wrote:
> In preparation for allowing more than the default color matching
> descriptor, make the color matching attributes writeable.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v2:
> 
> 	- Check refcnt before allowing the change in .store()
> 	- Renamed uvcg_cmd to uvcg_color_matching
> 
>  .../ABI/testing/configfs-usb-gadget-uvc       |  2 +-
>  drivers/usb/gadget/function/uvc_configfs.c    | 36 ++++++++++++++++++-
>  2 files changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
> index f00cff6d8c5c..53258b7c6f2d 100644
> --- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
> +++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
> @@ -165,7 +165,7 @@ Date:		Dec 2014
>  KernelVersion:	4.0
>  Description:	Default color matching descriptors
>  
> -		All attributes read only:
> +		All attributes read/write:
>  
>  		========================  ======================================
>  		bMatrixCoefficients	  matrix used to compute luma and
> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> index 6fb7ac8366fe..ef5d75942f24 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -1851,7 +1851,41 @@ static ssize_t uvcg_color_matching_##cname##_show(			\
>  	return result;							\
>  }									\
>  									\
> -UVC_ATTR_RO(uvcg_color_matching_, cname, aname)
> +static ssize_t uvcg_color_matching_##cname##_store(			\
> +	struct config_item *item, const char *page, size_t len)		\
> +{									\
> +	struct config_group *group = to_config_group(item);		\
> +	struct mutex *su_mutex = &group->cg_subsys->su_mutex;		\
> +	struct uvcg_color_matching *color_match =			\
> +		to_uvcg_color_matching(group);				\
> +	struct f_uvc_opts *opts;					\
> +	struct config_item *opts_item;					\
> +	int ret;							\
> +	u##bits num;							\
> +									\
> +	if (color_match->refcnt)					\

Shouldn't this be protected by the same lock that you use to modify
refcnt in 7/7 ?

> +		return -EBUSY;						\
> +									\
> +	ret = kstrtou##bits(page, 0, &num);				\
> +	if (ret)							\
> +		return ret;						\
> +									\
> +	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
> +									\
> +	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;	\
> +	opts = to_f_uvc_opts(opts_item);				\
> +									\
> +	mutex_lock(&opts->lock);					\
> +									\
> +	color_match->desc.aname = num;					\
> +	ret = len;							\
> +									\
> +	mutex_unlock(&opts->lock);					\
> +	mutex_unlock(su_mutex);						\
> +									\
> +	return ret;							\
> +}									\
> +UVC_ATTR(uvcg_color_matching_, cname, aname)
>  
>  UVCG_COLOR_MATCHING_ATTR(b_color_primaries, bColorPrimaries, 8);
>  UVCG_COLOR_MATCHING_ATTR(b_transfer_characteristics, bTransferCharacteristics, 8);

-- 
Regards,

Laurent Pinchart
