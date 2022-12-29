Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1081658886
	for <lists+linux-usb@lfdr.de>; Thu, 29 Dec 2022 03:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232790AbiL2CIT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Dec 2022 21:08:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbiL2CIS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Dec 2022 21:08:18 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BC50B877
        for <linux-usb@vger.kernel.org>; Wed, 28 Dec 2022 18:08:17 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 670C7109;
        Thu, 29 Dec 2022 03:08:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672279695;
        bh=FYxliOABXRDqkeKAypfhOm9Iv9MEyyTIhrYwgAXFz50=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O+NglguI3Z6FusQ17Wg3HZ0ObpM7A19b5wz3oSkUex9QfhgiJM5X4ZRvIVMHU+Da4
         437SL6C3YNXjTg/xE8re3CPLcVBy9AKhOkBM7aWjjIVYnFQcCobPYohzyz9bvSyBC9
         OZtdxv0VjZLLYazsU0f6VjosfXA3iFYarWwgQtYs=
Date:   Thu, 29 Dec 2022 04:08:11 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dan Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, mgr@pengutronix.de
Subject: Re: [PATCH v2 8/9] usb: gadget: uvc: Allow linking function to
 string descs
Message-ID: <Y6z2i6ANAKzgf/x6@pendragon.ideasonboard.com>
References: <20221121092517.225242-1-dan.scally@ideasonboard.com>
 <20221121092517.225242-9-dan.scally@ideasonboard.com>
 <a350247d-396a-d732-793d-f9e07a09d032@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a350247d-396a-d732-793d-f9e07a09d032@ideasonboard.com>
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

On Mon, Nov 21, 2022 at 09:57:38AM +0000, Dan Scally wrote:
> Hi all - apologies, meant to add this discussion point before sending
> 
> On 21/11/2022 09:25, Daniel Scally wrote:
> > Currently the string descriptors for the IAD, VideoControl Interface
> > and VideoStreaming Interfaces are hardcoded into f_uvc. Now that we
> > can create arbitrary string descriptors, add a mechanism to define
> > string descriptors for the IAD, VC and VS interfaces by linking to
> > the appropriate directory at function level.
> >
> > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > ---
> > Changes in v2:
> >
> > 	- New patch
> >
> >   drivers/usb/gadget/function/u_uvc.h        |  8 +++
> >   drivers/usb/gadget/function/uvc_configfs.c | 59 ++++++++++++++++++++++
> >   2 files changed, 67 insertions(+)
> >
> > diff --git a/drivers/usb/gadget/function/u_uvc.h b/drivers/usb/gadget/function/u_uvc.h
> > index c1c9ea5931d3..331cdf5ba9c8 100644
> > --- a/drivers/usb/gadget/function/u_uvc.h
> > +++ b/drivers/usb/gadget/function/u_uvc.h
> > @@ -88,6 +88,14 @@ struct f_uvc_opts {
> >   	struct list_head				languages;
> >   	unsigned int					nlangs;
> >   
> > +	/*
> > +	 * Indexes into the function's string descriptors allowing users to set
> > +	 * custom descriptions rather than the hard-coded defaults.
> > +	 */
> > +	u8						iad_index;
> > +	u8						vs0_index;
> > +	u8						vs1_index;
> > +
> >   	/*
> >   	 * Read/write access to configfs attributes is handled by configfs.
> >   	 *
> > diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> > index 5c51862150c4..e8faa31998fa 100644
> > --- a/drivers/usb/gadget/function/uvc_configfs.c
> > +++ b/drivers/usb/gadget/function/uvc_configfs.c
> > @@ -3197,8 +3197,67 @@ static void uvc_func_item_release(struct config_item *item)
> >   	usb_put_function_instance(&opts->func_inst);
> >   }
> >   
> > +static int uvc_func_allow_link(struct config_item *src, struct config_item *tgt)
> > +{
> > +	struct mutex *su_mutex = &src->ci_group->cg_subsys->su_mutex;
> > +	struct config_item *strings;
> > +	struct uvcg_string *string;
> > +	struct f_uvc_opts *opts;
> > +	int ret = 0;
> > +
> > +	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
> > +
> > +	/* Validate that the target is an entry in strings/<langid> */
> > +	strings = config_group_find_item(to_config_group(src), "strings");
> > +	if (!strings || tgt->ci_parent->ci_parent != strings) {
> > +		ret = -EINVAL;
> > +		goto put_strings;
> > +	}
> > +
> > +	string = to_uvcg_string(tgt);
> > +
> > +	opts = to_f_uvc_opts(src);
> > +	mutex_lock(&opts->lock);
> > +
> > +	if (!strcmp(tgt->ci_name, "iad_desc"))
> > +		opts->iad_index = string->usb_string.id;
> > +	else if (!strcmp(tgt->ci_name, "vs0_desc"))
> > +		opts->vs0_index = string->usb_string.id;
> > +	else if (!strcmp(tgt->ci_name, "vs1_desc"))
> > +		opts->vs1_index = string->usb_string.id;
> > +	else
> > +		ret = -EINVAL;
> 
> Is this reliance on the name of the target to set the right internal 
> index an acceptable method? I wasn't quite sure, but it seemed like the 
> simplest way to do it.

I haven't dug in the USB gadget configfs implementation, but I think
string support is something that shouldn't be specific to the UVC
gadget. I think we should be able to create a config item of "type"
string, and have gadget helpers handle the rest.

Feedback from the USB gadget maintainers would be useful.

> > +
> > +	mutex_unlock(&opts->lock);
> > +
> > +put_strings:
> > +	config_item_put(strings);
> > +	mutex_unlock(su_mutex);
> > +
> > +	return ret;
> > +}
> > +
> > +static void uvc_func_drop_link(struct config_item *src, struct config_item *tgt)
> > +{
> > +	struct f_uvc_opts *opts;
> > +
> > +	opts = to_f_uvc_opts(src);
> > +	mutex_lock(&opts->lock);
> > +
> > +	if (!strcmp(tgt->ci_name, "iad_desc"))
> > +		opts->iad_index = 0;
> > +	else if (!strcmp(tgt->ci_name, "vs0_desc"))
> > +		opts->vs0_index = 0;
> > +	else if (!strcmp(tgt->ci_name, "vs1_desc"))
> > +		opts->vs1_index = 0;
> > +
> > +	mutex_unlock(&opts->lock);
> > +}
> > +
> >   static struct configfs_item_operations uvc_func_item_ops = {
> >   	.release	= uvc_func_item_release,
> > +	.allow_link	= uvc_func_allow_link,
> > +	.drop_link	= uvc_func_drop_link,
> >   };
> >   
> >   #define UVCG_OPTS_ATTR(cname, aname, limit)				\

-- 
Regards,

Laurent Pinchart
