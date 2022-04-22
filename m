Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAFC250B318
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 10:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1445584AbiDVImU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 04:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244977AbiDVImS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 04:42:18 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 666C3532D0
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 01:39:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id C76DFCE27DD
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 08:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE49DC385A4;
        Fri, 22 Apr 2022 08:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650616762;
        bh=LDsZyWyqUqlT0aNimucY0ZVwgfe7ycq700yhrU71l9A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hEh+XVVn1IDmnWdzNgtPPkA9JP6C1YcuGqzKGokQ5Ewj/65hQKSHNAR7Zjq8koO8A
         99ZiKkSqCPGKNgXckIRw7zIcvvCUjInRvlYcl9GL9nY2++LcufTrqT5Z2YMwk2Kgne
         Vp3zP1kVIyk9GmLcMJIgba25uv1lzvUjMMJv/nq8=
Date:   Fri, 22 Apr 2022 10:39:19 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH v6 3/5] usb: gadget: add trace event of configfs group
 operation
Message-ID: <YmJpt7S8okYgcXY1@kroah.com>
References: <1649294865-4388-1-git-send-email-quic_linyyuan@quicinc.com>
 <1649294865-4388-4-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649294865-4388-4-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 07, 2022 at 09:27:43AM +0800, Linyu Yuan wrote:
> Add API trace_usb_configfs_make_group() and trace_usb_configfs_drop_group()
> to trace user create groups like gadget/function/configuration,
> it also trace group create in a specific function.

I'm sorry, but I do not understand what you are really adding here or
why.  Can you expand on this please?

> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>

But you are not using the functions you added in patch 2/5 here, right?
Or did I miss that?

> ---
> v2: no change
> v3: add API in trace.c
> v4: fix memory leak
> v5: change return value which report by kernel test robot <lkp@intel.com> and
>     Dan Carpenter <dan.carpenter@oracle.com>
> v6: fix checkpatch warning to add one space after while keyworkd
> 
>  drivers/usb/gadget/configfs.c                | 11 ++++
>  drivers/usb/gadget/function/f_mass_storage.c |  4 ++
>  drivers/usb/gadget/function/uvc_configfs.c   | 12 ++++
>  drivers/usb/gadget/trace.c                   | 84 ++++++++++++++++++++++++++++
>  include/linux/usb/composite.h                |  9 +++
>  include/linux/usb/gadget_configfs.h          |  2 +
>  6 files changed, 122 insertions(+)
> 
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index b2beeda..a0599fb 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -621,6 +621,8 @@ static struct config_group *function_make(
>  
>  	gi = container_of(group, struct gadget_info, functions_group);
>  
> +	trace_usb_configfs_make_group(&group->cg_item, &fi->group.cg_item);
> +
>  	mutex_lock(&gi->lock);
>  	list_add_tail(&fi->cfs_list, &gi->available_func);
>  	mutex_unlock(&gi->lock);
> @@ -634,6 +636,8 @@ static void function_drop(
>  	struct usb_function_instance *fi = to_usb_function_instance(item);
>  	struct gadget_info *gi;
>  
> +	trace_usb_configfs_drop_group(&group->cg_item, item);
> +
>  	gi = container_of(group, struct gadget_info, functions_group);
>  
>  	mutex_lock(&gi->lock);
> @@ -729,6 +733,7 @@ static struct config_group *config_desc_make(
>  	if (ret)
>  		goto err;
>  
> +	trace_usb_configfs_make_group(&group->cg_item, &cfg->group.cg_item);
>  	return &cfg->group;
>  err:
>  	kfree(cfg->c.label);
> @@ -740,6 +745,7 @@ static void config_desc_drop(
>  		struct config_group *group,
>  		struct config_item *item)
>  {
> +	trace_usb_configfs_drop_group(&group->cg_item, item);
>  	config_item_put(item);
>  }
>  
> @@ -1083,6 +1089,7 @@ static struct config_item *ext_prop_make(
>  	ext_prop_type->ct_owner = desc->owner;
>  
>  	config_item_init_type_name(&ext_prop->item, name, ext_prop_type);
> +	trace_usb_configfs_make_group(&group->cg_item, &ext_prop->item);
>  
>  	ext_prop->name = kstrdup(name, GFP_KERNEL);
>  	if (!ext_prop->name) {
> @@ -1107,6 +1114,8 @@ static void ext_prop_drop(struct config_group *group, struct config_item *item)
>  	struct usb_os_desc_ext_prop *ext_prop = to_usb_os_desc_ext_prop(item);
>  	struct usb_os_desc *desc = to_usb_os_desc(&group->cg_item);
>  
> +	trace_usb_configfs_drop_group(&group->cg_item, item);
> +
>  	if (desc->opts_mutex)
>  		mutex_lock(desc->opts_mutex);
>  	list_del(&ext_prop->entry);
> @@ -1626,6 +1635,7 @@ static struct config_group *gadgets_make(
>  	if (!gi->composite.gadget_driver.function)
>  		goto err;
>  
> +	trace_usb_configfs_make_group(&group->cg_item, &gi->group.cg_item);
>  	return &gi->group;
>  err:
>  	kfree(gi);
> @@ -1634,6 +1644,7 @@ static struct config_group *gadgets_make(
>  
>  static void gadgets_drop(struct config_group *group, struct config_item *item)
>  {
> +	trace_usb_configfs_drop_group(&group->cg_item, item);
>  	config_item_put(item);
>  }
>  
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index 3a77bca..a96eca9 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -3289,6 +3289,8 @@ static struct config_group *fsg_lun_make(struct config_group *group,
>  
>  	config_group_init_type_name(&opts->group, name, &fsg_lun_type);
>  
> +	trace_usb_configfs_make_group(&group->cg_item, &opts->group.cg_item);
> +
>  	return &opts->group;
>  out:
>  	mutex_unlock(&fsg_opts->lock);
> @@ -3300,6 +3302,8 @@ static void fsg_lun_drop(struct config_group *group, struct config_item *item)
>  	struct fsg_lun_opts *lun_opts;
>  	struct fsg_opts *fsg_opts;
>  
> +	trace_usb_configfs_drop_group(&group->cg_item, item);
> +
>  	lun_opts = to_fsg_lun_opts(item);
>  	fsg_opts = to_fsg_opts(&group->cg_item);
>  
> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> index 77d6403..cc0f2eb 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -236,6 +236,8 @@ static struct config_item *uvcg_control_header_make(struct config_group *group,
>  
>  	config_item_init_type_name(&h->item, name, &uvcg_control_header_type);
>  
> +	trace_usb_configfs_make_group(&group->cg_item, &h->item);
> +
>  	return &h->item;
>  }
>  
> @@ -1039,6 +1041,8 @@ static struct config_item
>  
>  	config_item_init_type_name(&h->item, name, &uvcg_streaming_header_type);
>  
> +	trace_usb_configfs_make_group(&group->cg_item, &h->item);
> +
>  	return &h->item;
>  }
>  
> @@ -1380,6 +1384,8 @@ static struct config_item *uvcg_frame_make(struct config_group *group,
>  
>  	config_item_init_type_name(&h->item, name, &uvcg_frame_type);
>  
> +	trace_usb_configfs_make_group(&group->cg_item, &h->item);
> +
>  	return &h->item;
>  }
>  
> @@ -1389,6 +1395,8 @@ static void uvcg_frame_drop(struct config_group *group, struct config_item *item
>  	struct f_uvc_opts *opts;
>  	struct config_item *opts_item;
>  
> +	trace_usb_configfs_drop_group(&group->cg_item, item);
> +
>  	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;
>  	opts = to_f_uvc_opts(opts_item);
>  
> @@ -1649,6 +1657,8 @@ static struct config_group *uvcg_uncompressed_make(struct config_group *group,
>  	config_group_init_type_name(&h->fmt.group, name,
>  				    &uvcg_uncompressed_type);
>  
> +	trace_usb_configfs_make_group(&group->cg_item, &h->fmt.group.cg_item);
> +
>  	return &h->fmt.group;
>  }
>  
> @@ -1835,6 +1845,8 @@ static struct config_group *uvcg_mjpeg_make(struct config_group *group,
>  	config_group_init_type_name(&h->fmt.group, name,
>  				    &uvcg_mjpeg_type);
>  
> +	trace_usb_configfs_make_group(&group->cg_item, &h->fmt.group.cg_item);
> +
>  	return &h->fmt.group;
>  }
>  
> diff --git a/drivers/usb/gadget/trace.c b/drivers/usb/gadget/trace.c
> index 108c1c8..65b328f 100644
> --- a/drivers/usb/gadget/trace.c
> +++ b/drivers/usb/gadget/trace.c
> @@ -5,3 +5,87 @@
>  
>  #define CREATE_TRACE_POINTS
>  #include "trace.h"
> +
> +#include <linux/configfs.h>
> +#include <linux/usb/composite.h>
> +
> +extern const struct config_item_type gadgets_type;

That should not be in a .c file.

> +
> +#ifdef CONFIG_TRACEPOINTS
> +#define GROUP_LEN	128

What is this the length of?

> +static int gadget_configfs_group(char *group, struct config_item *item)

I do not understand what this function does, sorry.

> +{
> +	struct config_item *parent;
> +	char *tmpgroup;
> +
> +	if (!item)
> +		return -EINVAL;
> +
> +	tmpgroup = kzalloc(GROUP_LEN, GFP_KERNEL);
> +	if (!tmpgroup)
> +		return -ENOMEM;
> +
> +	for (parent = item->ci_parent; parent;
> +			item = parent, parent = item->ci_parent) {
> +		if (item->ci_type == &gadgets_type) {
> +			kfree(tmpgroup);
> +			return 0;
> +		}
> +
> +		if (tmpgroup[0] == '\0')
> +			snprintf(group, GROUP_LEN, "%s",

How do you know that group is GROUP_LEN long?  Shouldn't you have a size
parameter instead?

> +					config_item_name(item));
> +		else
> +			snprintf(group, GROUP_LEN, "%s/%s",
> +					config_item_name(item), tmpgroup);

Why 2 different ways to create this string?

> +
> +		strcpy(tmpgroup, group);
> +	}
> +
> +	kfree(tmpgroup);
> +	return -EINVAL;
> +}
> +
> +static void trace_usb_configfs_make_drop_group(struct config_item *parent,
> +		struct config_item *item, char *make_drop)
> +{
> +	char *group, *parent_group;
> +	int ret;
> +
> +	group = kzalloc(2 * GROUP_LEN, GFP_KERNEL);

Why 2 *?

> +	if (!group)
> +		return;
> +
> +	parent_group = group + GROUP_LEN;
> +	ret = gadget_configfs_group(parent_group, parent);
> +	if (ret) {
> +		kfree(group);
> +		return;
> +	}
> +
> +	if (parent_group[0] == '\0')
> +		snprintf(group, GROUP_LEN, "%s %s", make_drop,
> +				config_item_name(item));
> +	else
> +		snprintf(group, GROUP_LEN, "%s %s/%s", make_drop, parent_group,
> +				config_item_name(item));
> +
> +	trace_gadget_configfs(group);
> +
> +	kfree(group);
> +}
> +
> +void trace_usb_configfs_make_group(struct config_item *parent,
> +		struct config_item *item)
> +{
> +	trace_usb_configfs_make_drop_group(parent, item, "mkdir");

Why?

> +}
> +EXPORT_SYMBOL(trace_usb_configfs_make_group);

EXPORT_SYMBOL_GPL() please.

And this is a gadget thing, not a usb_configfs thing.

> +
> +void trace_usb_configfs_drop_group(struct config_item *parent,
> +		struct config_item *item)
> +{
> +	trace_usb_configfs_make_drop_group(parent, item, "rmdir");
> +}
> +EXPORT_SYMBOL(trace_usb_configfs_drop_group);

_GPL please.  And same on the name.


> +#endif
> diff --git a/include/linux/usb/composite.h b/include/linux/usb/composite.h
> index 9d27622..7bf6574 100644
> --- a/include/linux/usb/composite.h
> +++ b/include/linux/usb/composite.h
> @@ -603,6 +603,15 @@ void usb_put_function_instance(struct usb_function_instance *fi);
>  void usb_put_function(struct usb_function *f);
>  struct usb_function_instance *usb_get_function_instance(const char *name);
>  struct usb_function *usb_get_function(struct usb_function_instance *fi);
> +#ifdef CONFIG_TRACEPOINTS
> +void trace_usb_configfs_make_group(struct config_item *parent,
> +		struct config_item *item);
> +void trace_usb_configfs_drop_group(struct config_item *parent,
> +		struct config_item *item);
> +#else
> +#define trace_usb_configfs_make_group(parent, item) do {} while (0)
> +#define trace_usb_configfs_drop_group(parent, item) do {} while (0)

Make these inline functions so that if someone uses them wrong, the
build will complain properly.

> +#endif
>  
>  struct usb_configuration *usb_get_config(struct usb_composite_dev *cdev,
>  		int val);
> diff --git a/include/linux/usb/gadget_configfs.h b/include/linux/usb/gadget_configfs.h
> index d61aebd..a89f177 100644
> --- a/include/linux/usb/gadget_configfs.h
> +++ b/include/linux/usb/gadget_configfs.h
> @@ -63,6 +63,7 @@ static struct config_item_type struct_in##_langid_type = {		\
>  		goto err;						\
>  	config_group_init_type_name(&new->group, name,			\
>  			&struct_in##_langid_type);			\
> +	trace_usb_configfs_make_group(&group->cg_item, &new->group.cg_item); \

What is this showing you?

>  									\
>  	gi = container_of(group, struct struct_member, strings_group);	\
>  	ret = -EEXIST;							\
> @@ -86,6 +87,7 @@ static void struct_in##_strings_drop(					\
>  		struct config_group *group,				\
>  		struct config_item *item)				\
>  {									\
> +	trace_usb_configfs_drop_group(&group->cg_item, item);		\

Why do you need to know this?

thanks,

greg k-h
