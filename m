Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEDEA658817
	for <lists+linux-usb@lfdr.de>; Thu, 29 Dec 2022 01:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbiL2AbB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Dec 2022 19:31:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbiL2AbA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Dec 2022 19:31:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01631E77
        for <linux-usb@vger.kernel.org>; Wed, 28 Dec 2022 16:30:59 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77494109;
        Thu, 29 Dec 2022 01:30:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672273857;
        bh=9Fs/yOzNS6rQUT+cBxkZLRfgX7bec/ccdyxHH0DAOr8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oWFxb66SwfPHZhssxSb5R6+yyzb4fr1SnzC0WI/Zjp5RApVgXKhi8SkTqMdYS6a6O
         VDAcSNJXCuGbYwS6lJWGcClXET22aHo5qtS3gWy4XpDLjfepI5QFeBbQIZCQVyHZpm
         KkCxkuW5PSx673x+RTf33sEEojUOJbFj35vv8JSo=
Date:   Thu, 29 Dec 2022 02:30:53 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, mgr@pengutronix.de
Subject: Re: [PATCH v2 1/9] usb: gadget: uvc: Make bSourceID read/write
Message-ID: <Y6zfvXakE9stRqXw@pendragon.ideasonboard.com>
References: <20221121092517.225242-1-dan.scally@ideasonboard.com>
 <20221121092517.225242-2-dan.scally@ideasonboard.com>
 <Y6zfiiCjcGTHeYd9@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y6zfiiCjcGTHeYd9@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 29, 2022 at 02:30:04AM +0200, Laurent Pinchart wrote:
> Hi Dan,
> 
> Thank you for the patch.
> 
> On Mon, Nov 21, 2022 at 09:25:09AM +0000, Daniel Scally wrote:
> > At the moment, the UVC function graph is hardcoded IT -> PU -> OT.
> > To add XU support we need the ability to insert the XU descriptors
> > into the chain. To facilitate that, make the output terminal's
> > bSourceID attribute writeable so that we can configure its source.
> > 
> > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > ---
> > Changes in v2:
> > 
> > 	- Updated the ABI Documentation to reflect the change.
> > 
> >  .../ABI/testing/configfs-usb-gadget-uvc       |  2 +-
> >  drivers/usb/gadget/function/uvc_configfs.c    | 57 ++++++++++++++++++-
> >  2 files changed, 57 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
> > index 611b23e6488d..feb3f2cc0c16 100644
> > --- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
> > +++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
> > @@ -52,7 +52,7 @@ Date:		Dec 2014
> >  KernelVersion:	4.0
> >  Description:	Default output terminal descriptors
> >  
> > -		All attributes read only:
> > +		All attributes read only except bSourceID:
> >  
> >  		==============	=============================================
> >  		iTerminal	index of string descriptor
> > diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> > index 4303a3283ba0..af4258120f9a 100644
> > --- a/drivers/usb/gadget/function/uvc_configfs.c
> > +++ b/drivers/usb/gadget/function/uvc_configfs.c
> > @@ -483,11 +483,66 @@ UVC_ATTR_RO(uvcg_default_output_, cname, aname)
> >  UVCG_DEFAULT_OUTPUT_ATTR(b_terminal_id, bTerminalID, 8);
> >  UVCG_DEFAULT_OUTPUT_ATTR(w_terminal_type, wTerminalType, 16);
> >  UVCG_DEFAULT_OUTPUT_ATTR(b_assoc_terminal, bAssocTerminal, 8);
> > -UVCG_DEFAULT_OUTPUT_ATTR(b_source_id, bSourceID, 8);
> >  UVCG_DEFAULT_OUTPUT_ATTR(i_terminal, iTerminal, 8);
> >  
> >  #undef UVCG_DEFAULT_OUTPUT_ATTR
> >  
> > +static ssize_t uvcg_default_output_b_source_id_show(struct config_item *item,
> > +						    char *page)
> > +{
> > +	struct config_group *group = to_config_group(item);
> > +	struct f_uvc_opts *opts;
> > +	struct config_item *opts_item;
> > +	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
> > +	struct uvc_output_terminal_descriptor *cd;
> > +	int result;
> > +
> > +	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
> > +
> > +	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent->ci_parent;
> > +	opts = to_f_uvc_opts(opts_item);
> > +	cd = &opts->uvc_output_terminal;
> > +
> > +	mutex_lock(&opts->lock);
> > +	result = sprintf(page, "%u\n", le8_to_cpu(cd->bSourceID));
> > +	mutex_unlock(&opts->lock);
> > +
> > +	mutex_unlock(su_mutex);
> > +
> > +	return result;
> > +}
> > +
> > +static ssize_t uvcg_default_output_b_source_id_store(struct config_item *item,
> > +						     const char *page, size_t len)
> > +{
> > +	struct config_group *group = to_config_group(item);
> > +	struct f_uvc_opts *opts;
> > +	struct config_item *opts_item;
> > +	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
> > +	struct uvc_output_terminal_descriptor *cd;
> > +	int result;
> > +	u8 num;
> > +
> > +	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
> > +
> > +	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent->ci_parent;
> > +	opts = to_f_uvc_opts(opts_item);
> > +	cd = &opts->uvc_output_terminal;
> > +
> > +	result = kstrtou8(page, 0, &num);
> > +	if (result)
> > +		return result;
> > +
> > +	mutex_lock(&opts->lock);
> > +	cd->bSourceID = num;
> > +	mutex_unlock(&opts->lock);
> > +
> > +	mutex_unlock(su_mutex);
> > +
> > +	return len;
> > +}
> > +UVC_ATTR(uvcg_default_output_, b_source_id, bSourceID);
> 
> Feel free to shoot this idea down if it's a bad one: given that the
> bSourceID attributes serve to create a pipeline by linking entities,
> would it make sense to model these links with symlinks ?

I forgot to mention that this would handle the bSourceID attribute
automatically, avoiding mistakes. But maybe we're over-engineering all
this...

> > +
> >  static struct configfs_attribute *uvcg_default_output_attrs[] = {
> >  	&uvcg_default_output_attr_b_terminal_id,
> >  	&uvcg_default_output_attr_w_terminal_type,

-- 
Regards,

Laurent Pinchart
