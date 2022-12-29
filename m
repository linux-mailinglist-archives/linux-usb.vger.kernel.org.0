Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CEB165887D
	for <lists+linux-usb@lfdr.de>; Thu, 29 Dec 2022 02:56:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbiL2B4h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Dec 2022 20:56:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbiL2B4g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Dec 2022 20:56:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 252F4E38
        for <linux-usb@vger.kernel.org>; Wed, 28 Dec 2022 17:56:35 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A4CC109;
        Thu, 29 Dec 2022 02:56:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672278992;
        bh=tz/a1cQ2haWo7ZPxmlxyaAfpzxR2nIorSwi9+lUK2e4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=toGRZsagQf7kfL+LPCPiD4sPTw7LWpzUTzzGMXc8IOdGAJfAf/8epj0MLz/ZEW5c5
         0azXIL5QxV9v28qC01MuKJo9+q0mRTYP2h1dIW+TPA+yY3pwTYfTmT6qnUxLRVRB2v
         dSOvWDhnt30hg+cCJ323K/2YnQyWZ3foyR9VTqyA=
Date:   Thu, 29 Dec 2022 03:56:28 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, mgr@pengutronix.de
Subject: Re: [PATCH v2 5/9] usb: gadget: uvc: Support arbitrary string
 descriptors
Message-ID: <Y6zzzMrlN429G8G3@pendragon.ideasonboard.com>
References: <20221121092517.225242-1-dan.scally@ideasonboard.com>
 <20221121092517.225242-6-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221121092517.225242-6-dan.scally@ideasonboard.com>
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

On Mon, Nov 21, 2022 at 09:25:13AM +0000, Daniel Scally wrote:
> Currently string descriptors for the UVC function are largely hard
> coded. It's not practically possible to support string descriptors
> that describe Extension Units that way, so add a mechanism to the
> configfs tree that allows the definition of arbitrary string
> descriptors.

Hmmmm... Is this something that should be specific to the UVC gadget, or
should it be a core gadget helper ?

> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v2:
> 
> 	- New patch
> 
>  .../ABI/testing/configfs-usb-gadget-uvc       |  20 ++
>  drivers/usb/gadget/function/f_uvc.c           |   1 +
>  drivers/usb/gadget/function/u_uvc.h           |   7 +
>  drivers/usb/gadget/function/uvc_configfs.c    | 302 ++++++++++++++++++
>  drivers/usb/gadget/function/uvc_configfs.h    |  30 ++
>  5 files changed, 360 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
> index 045c57e7e245..5faa049ed759 100644
> --- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
> +++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
> @@ -10,6 +10,26 @@ Description:	UVC function directory
>  		function_name		string [32]
>  		===================	=============================
>  
> +What:		/config/usb-gadget/gadget/functions/uvc.name/strings
> +Date:		Nov 2022
> +KernelVersion:	6.1
> +Description:	String descriptors
> +
> +What:		/config/usb-gadget/gadget/functions/uvc.name/strings/langid
> +Date:		Nov 2022
> +KernelVersion:	6.1
> +Description:	String descriptors for langid (e.g. 0x409)
> +
> +What:		/config/usb-gadget/gadget/functions/uvc.name/strings/langid/name
> +Date:		Nov 2022
> +KernelVersion:	6.1
> +Description:	String descriptor
> +
> +		===================	=============================
> +		id			id of the string descriptor
> +		s			126 character string
> +		===================	=============================
> +
>  What:		/config/usb-gadget/gadget/functions/uvc.name/control
>  Date:		Dec 2014
>  KernelVersion:	4.0
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> index e0a308f1355c..1b8871a24be8 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -912,6 +912,7 @@ static struct usb_function_instance *uvc_alloc_inst(void)
>  		(const struct uvc_descriptor_header * const *)ctl_cls;
>  
>  	INIT_LIST_HEAD(&opts->extension_units);
> +	INIT_LIST_HEAD(&opts->languages);
>  
>  	opts->streaming_interval = 1;
>  	opts->streaming_maxpacket = 1024;
> diff --git a/drivers/usb/gadget/function/u_uvc.h b/drivers/usb/gadget/function/u_uvc.h
> index 5119cfe5ee4e..c1c9ea5931d3 100644
> --- a/drivers/usb/gadget/function/u_uvc.h
> +++ b/drivers/usb/gadget/function/u_uvc.h
> @@ -81,6 +81,13 @@ struct f_uvc_opts {
>  	struct uvc_descriptor_header			**uvc_hs_streaming_cls;
>  	struct uvc_descriptor_header			**uvc_ss_streaming_cls;
>  
> +	/*
> +	 * A list of languages, associated with which may be string descriptors
> +	 * for various parts of the gadget, including the IAD and XUs.
> +	 */
> +	struct list_head				languages;
> +	unsigned int					nlangs;
> +
>  	/*
>  	 * Read/write access to configfs attributes is handled by configfs.
>  	 *
> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> index 0a69eb6cf221..da2f70036993 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -13,6 +13,8 @@
>  #include "uvc_configfs.h"
>  
>  #include <linux/sort.h>
> +#include <linux/usb/gadget.h>
> +
>  
>  /* -----------------------------------------------------------------------------
>   * Global Utility Structures and Macros
> @@ -2824,6 +2826,305 @@ static const struct uvcg_config_group_type uvcg_streaming_grp_type = {
>  	},
>  };
>  
> +/* -----------------------------------------------------------------------------
> + * strings/<langid>
> + */
> +
> +static ssize_t uvcg_string_id_show(struct config_item *item, char *page)
> +{
> +	struct config_group *group = to_config_group(item->ci_parent);
> +	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
> +	struct uvcg_string *string = to_uvcg_string(item);
> +	struct config_item *opts_item;
> +	struct f_uvc_opts *opts;
> +	int ret;
> +
> +	mutex_lock(su_mutex);
> +
> +	opts_item = item->ci_parent->ci_parent->ci_parent;
> +	opts = to_f_uvc_opts(opts_item);
> +
> +	mutex_lock(&opts->lock);
> +	ret = sprintf(page, "%u\n", string->usb_string.id);
> +	mutex_unlock(&opts->lock);
> +
> +	mutex_unlock(su_mutex);
> +
> +	return ret;
> +}
> +UVC_ATTR_RO(uvcg_string_, id, id);
> +
> +static ssize_t uvcg_string_s_show(struct config_item *item, char *page)
> +{
> +	struct config_group *group = to_config_group(item->ci_parent);
> +	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
> +	struct uvcg_string *string = to_uvcg_string(item);
> +	struct config_item *opts_item;
> +	struct f_uvc_opts *opts;
> +	int ret;
> +
> +	mutex_lock(su_mutex);
> +
> +	opts_item = item->ci_parent->ci_parent->ci_parent;
> +	opts = to_f_uvc_opts(opts_item);
> +
> +	mutex_lock(&opts->lock);
> +	ret = snprintf(page, sizeof(string->string), "%s\n", string->string);
> +	mutex_unlock(&opts->lock);
> +
> +	mutex_unlock(su_mutex);
> +
> +	return ret;
> +}
> +
> +static ssize_t uvcg_string_s_store(struct config_item *item, const char *page,
> +				   size_t len)
> +{
> +	struct config_group *group = to_config_group(item->ci_parent);
> +	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
> +	struct uvcg_string *string = to_uvcg_string(item);
> +	int size = min(sizeof(string->string), len + 1);
> +	struct config_item *opts_item;
> +	struct f_uvc_opts *opts;
> +	int ret;
> +
> +	if (len > USB_MAX_STRING_LEN)
> +		return -EINVAL;
> +
> +	mutex_lock(su_mutex);
> +
> +	opts_item = item->ci_parent->ci_parent->ci_parent;
> +	opts = to_f_uvc_opts(opts_item);
> +
> +	mutex_lock(&opts->lock);
> +	ret = strscpy(string->string, page, size);
> +	mutex_unlock(&opts->lock);
> +
> +	mutex_unlock(su_mutex);
> +
> +	return len;
> +}
> +UVC_ATTR(uvcg_string_, s, s);
> +
> +static struct configfs_attribute *uvcg_string_attrs[] = {
> +	&uvcg_string_attr_id,
> +	&uvcg_string_attr_s,
> +	NULL,
> +};
> +
> +static void uvcg_string_release(struct config_item *item)
> +{
> +	struct uvcg_string *string = to_uvcg_string(item);
> +
> +	kfree(string);
> +}
> +
> +static struct configfs_item_operations uvcg_string_item_ops = {
> +	.release	= uvcg_string_release,
> +};
> +
> +static const struct config_item_type uvcg_string_type = {
> +	.ct_item_ops	= &uvcg_string_item_ops,
> +	.ct_attrs	= uvcg_string_attrs,
> +	.ct_owner	= THIS_MODULE,
> +};
> +
> +static struct config_item *uvcg_string_make(struct config_group *group,
> +					    const char *name)
> +{
> +	struct uvcg_language *language;
> +	struct config_item *opts_item;
> +	struct uvcg_string *string;
> +	struct f_uvc_opts *opts;
> +
> +	language = to_uvcg_language(group);
> +
> +	string = kzalloc(sizeof(*string), GFP_KERNEL);
> +	if (!string)
> +		return ERR_PTR(-ENOMEM);
> +
> +	opts_item = group->cg_item.ci_parent->ci_parent;
> +	opts = to_f_uvc_opts(opts_item);
> +
> +	mutex_lock(&opts->lock);
> +
> +	string->usb_string.id = language->nstrings++;
> +	string->usb_string.s = string->string;
> +	list_add_tail(&string->list, &language->strings);
> +
> +	config_item_init_type_name(&string->item, name, &uvcg_string_type);
> +
> +	mutex_unlock(&opts->lock);
> +
> +	return &string->item;
> +}
> +
> +static void uvcg_string_drop(struct config_group *group, struct config_item *item)
> +{
> +	struct uvcg_language *language;
> +	struct config_item *opts_item;
> +	struct uvcg_string *string;
> +	struct f_uvc_opts *opts;
> +	unsigned int i = 1;
> +
> +	language = to_uvcg_language(group);
> +	string = to_uvcg_string(item);
> +
> +	opts_item = group->cg_item.ci_parent->ci_parent;
> +	opts = to_f_uvc_opts(opts_item);
> +
> +	mutex_lock(&opts->lock);
> +
> +	list_del(&string->list);
> +	language->nstrings--;
> +
> +	/* Reset the ids for the language's strings to guarantee a continuous set */
> +	list_for_each_entry(string, &language->strings, list)
> +		string->usb_string.id = i++;
> +
> +	mutex_unlock(&opts->lock);
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * strings/
> + */
> +
> +static struct configfs_group_operations uvcg_language_group_ops = {
> +	.make_item	= uvcg_string_make,
> +	.drop_item	= uvcg_string_drop,
> +};
> +
> +static void uvcg_language_release(struct config_item *item)
> +{
> +	struct uvcg_language *language = to_uvcg_language(to_config_group(item));
> +
> +	kfree(language);
> +}
> +
> +static struct configfs_item_operations uvcg_language_item_ops = {
> +	.release	= uvcg_language_release,
> +};
> +
> +/*
> + * The strings attribute is really a helper for users - having defined some string
> + * descriptors for this language, actually checking what's set when they're all
> + * in separate directories would be a bit...suboptimal. This read-only attribute
> + * gives a summary at language-level.
> + */
> +static ssize_t uvcg_language_strings_show(struct config_item *item, char *page)
> +{
> +	struct config_group *group = to_config_group(item);
> +	struct uvcg_language *language = to_uvcg_language(group);
> +	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
> +	struct config_item *opts_item;
> +	struct uvcg_string *string;
> +	struct f_uvc_opts *opts;
> +	char *pg = page;
> +	int ret = 0;
> +
> +	mutex_lock(su_mutex);
> +
> +	opts_item = item->ci_parent->ci_parent;
> +	opts = to_f_uvc_opts(opts_item);
> +
> +	mutex_lock(&opts->lock);
> +
> +	list_for_each_entry(string, &language->strings, list) {
> +		ret += sprintf(pg, "%s: %s [%u]\n", string->item.ci_name,
> +			       string->usb_string.s, string->usb_string.id);
> +		pg = page + ret;
> +	}
> +
> +	mutex_unlock(&opts->lock);
> +
> +	mutex_unlock(su_mutex);
> +
> +	return ret;
> +}
> +UVC_ATTR_RO(uvcg_language_, strings, strings);
> +
> +static struct configfs_attribute *uvcg_language_attrs[] = {
> +	&uvcg_language_attr_strings,
> +	NULL
> +};
> +
> +static const struct config_item_type uvcg_language_type = {
> +	.ct_item_ops	= &uvcg_language_item_ops,
> +	.ct_group_ops	= &uvcg_language_group_ops,
> +	.ct_attrs	= uvcg_language_attrs,
> +	.ct_owner	= THIS_MODULE,
> +};
> +
> +static struct config_group *uvcg_language_make(struct config_group *group,
> +					       const char *name)
> +{
> +	struct uvcg_language *language;
> +	struct config_item *opts_item;
> +	struct f_uvc_opts *opts;
> +	int ret;
> +	u16 num;
> +
> +	ret = kstrtou16(name, 0, &num);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	if (!usb_validate_langid(num))
> +		return ERR_PTR(-EINVAL);
> +
> +	language = kzalloc(sizeof(*language), GFP_KERNEL);
> +	if (!language)
> +		return ERR_PTR(-ENOMEM);
> +
> +	opts_item = group->cg_item.ci_parent;
> +	opts = to_f_uvc_opts(opts_item);
> +
> +	mutex_lock(&opts->lock);
> +
> +	language->stringtab.language = num;
> +	list_add_tail(&language->list, &opts->languages);
> +	opts->nlangs++;
> +	INIT_LIST_HEAD(&language->strings);
> +
> +	config_group_init_type_name(&language->group, name, &uvcg_language_type);
> +
> +	mutex_unlock(&opts->lock);
> +
> +	return &language->group;
> +}
> +
> +static void uvcg_language_drop(struct config_group *group, struct config_item *item)
> +{
> +	struct uvcg_language *language;
> +	struct config_item *opts_item;
> +	struct f_uvc_opts *opts;
> +
> +	language = to_uvcg_language(to_config_group(item));
> +
> +	opts_item = group->cg_item.ci_parent;
> +	opts = to_f_uvc_opts(opts_item);
> +
> +	mutex_lock(&opts->lock);
> +
> +	list_del(&language->list);
> +	config_item_put(item);
> +
> +	mutex_unlock(&opts->lock);
> +}
> +
> +static struct configfs_group_operations uvcg_strings_grp_ops = {
> +	.make_group	= uvcg_language_make,
> +	.drop_item	= uvcg_language_drop,
> +};
> +
> +static const struct uvcg_config_group_type uvcg_strings_grp_type = {
> +	.type = {
> +		.ct_item_ops	= &uvcg_config_item_ops,
> +		.ct_group_ops	= &uvcg_strings_grp_ops,
> +		.ct_owner	= THIS_MODULE,
> +	},
> +	.name = "strings",
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * UVC function
>   */
> @@ -2951,6 +3252,7 @@ static const struct uvcg_config_group_type uvc_func_type = {
>  	.children = (const struct uvcg_config_group_type*[]) {
>  		&uvcg_control_grp_type,
>  		&uvcg_streaming_grp_type,
> +		&uvcg_strings_grp_type,
>  		NULL,
>  	},
>  };
> diff --git a/drivers/usb/gadget/function/uvc_configfs.h b/drivers/usb/gadget/function/uvc_configfs.h
> index c9a4182fb26f..a714426a174a 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.h
> +++ b/drivers/usb/gadget/function/uvc_configfs.h
> @@ -13,6 +13,7 @@
>  #define UVC_CONFIGFS_H
>  
>  #include <linux/configfs.h>
> +#include <linux/usb/gadget.h>
>  
>  #include "u_uvc.h"
>  
> @@ -132,6 +133,35 @@ static inline struct uvcg_mjpeg *to_uvcg_mjpeg(struct config_item *item)
>  	return container_of(to_uvcg_format(item), struct uvcg_mjpeg, fmt);
>  }
>  
> +/* -----------------------------------------------------------------------------
> + * strings/
> + */
> +
> +struct uvcg_language {
> +	struct config_group group;
> +	unsigned int nstrings;
> +	struct list_head list;
> +	struct list_head strings;
> +	struct usb_gadget_strings stringtab;
> +};
> +
> +#define to_uvcg_language(language) \
> +container_of(language, struct uvcg_language, group)
> +
> +/* -----------------------------------------------------------------------------
> + * strings/<LANGID>
> + */
> +
> +struct uvcg_string {
> +	struct config_item item;
> +	struct list_head list;
> +	char string[USB_MAX_STRING_LEN];
> +	struct usb_string usb_string;
> +};
> +
> +#define to_uvcg_string(str_item)\
> +container_of(str_item, struct uvcg_string, item)
> +
>  /* -----------------------------------------------------------------------------
>   * control/extensions/<NAME>
>   */

-- 
Regards,

Laurent Pinchart
