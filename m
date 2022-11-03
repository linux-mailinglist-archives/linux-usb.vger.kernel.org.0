Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCCF6617AAA
	for <lists+linux-usb@lfdr.de>; Thu,  3 Nov 2022 11:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbiKCKO5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Nov 2022 06:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiKCKO4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Nov 2022 06:14:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB971C1
        for <linux-usb@vger.kernel.org>; Thu,  3 Nov 2022 03:14:55 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5069105;
        Thu,  3 Nov 2022 11:14:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667470493;
        bh=Z5fdJcnPGyFZ8B6Y6upQjiu8ML61gT7rOjOe95brZ10=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=eFChJdIBD7Fjr3XgVY663m7as+mrUZ7HHvRnBdnYHJmDzWtbF9QxhFGrHUlswjB2l
         1uE9jmZP5qEbGPNqNM2Y8rrnF39XxLcPkCMa9JKeJ+35Vx24nbOpPzfaFC0IrLsB9Y
         LJSPen0lwk/jWbOKA4owoDHWjJr/fqQ57wXGppHs=
Message-ID: <1295a40d-1ba1-3eaf-b91e-7a7466b6cf8f@ideasonboard.com>
Date:   Thu, 3 Nov 2022 10:14:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, mgr@pengutronix.de
References: <20221102151755.1022841-1-dan.scally@ideasonboard.com>
 <20221102151755.1022841-4-dan.scally@ideasonboard.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH 3/4] usb: gadget: uvc: Allow definition of XUs in configfs
In-Reply-To: <20221102151755.1022841-4-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Morning all

On 02/11/2022 15:17, Daniel Scally wrote:
> +
> +static struct configfs_attribute *uvcg_extension_attrs[] = {
> +	&uvcg_extension_attr_b_length,
> +	&uvcg_extension_attr_b_unit_id,
> +	&uvcg_extension_attr_b_num_controls,
> +	&uvcg_extension_attr_b_nr_in_pins,
> +	&uvcg_extension_attr_b_control_size,
> +	&uvcg_extension_attr_guid_extension_code,
> +	&uvcg_extension_attr_ba_source_id,
> +	&uvcg_extension_attr_bm_controls,
> +	NULL,
> +};
> +
> +static const struct config_item_type uvcg_extension_type = {
> +	.ct_item_ops	= &uvcg_config_item_ops,
> +	.ct_attrs	= uvcg_extension_attrs,
> +	.ct_owner	= THIS_MODULE,
> +};
> +
> +static void uvcg_extension_drop(struct config_group *group, struct config_item *item)
> +{
> +	struct uvcg_extension *xu = container_of(item, struct uvcg_extension, item);
> +	struct config_item *opts_item;
> +	struct f_uvc_opts *opts;
> +
> +	opts_item = group->cg_item.ci_parent->ci_parent;
> +	opts = to_f_uvc_opts(opts_item);
> +
> +	mutex_lock(&opts->lock);
> +
> +	config_item_put(item);
> +	list_del(&xu->list);
> +	kfree(xu->desc.baSourceID);
> +	kfree(xu->desc.bmControls);
> +	kfree(xu);


This should actually have gone in the .release() callback for the item - 
I'll fix that in v2.

> +
> +	mutex_unlock(&opts->lock);
> +}
> +
> +static struct config_item *uvcg_extension_make(struct config_group *group, const char *name)
> +{
> +	struct config_item *opts_item;
> +	struct uvcg_extension *xu;
> +	struct f_uvc_opts *opts;
> +
> +	opts_item = group->cg_item.ci_parent->ci_parent;
> +	opts = to_f_uvc_opts(opts_item);
> +
> +	mutex_lock(&opts->lock);
> +
> +	xu = kzalloc(sizeof(*xu), GFP_KERNEL);
> +	if (!xu)
> +		return ERR_PTR(-ENOMEM);
> +
> +	xu->desc.bLength = UVC_DT_EXTENSION_UNIT_SIZE(0, 0);
> +	xu->desc.bDescriptorType = USB_DT_CS_INTERFACE;
> +	xu->desc.bDescriptorSubType = UVC_VC_EXTENSION_UNIT;
> +	xu->desc.bUnitID = ++opts->last_unit_id;
> +	xu->desc.bNumControls = 0;
> +	xu->desc.bNrInPins = 0;
> +	xu->desc.baSourceID = NULL;
> +	xu->desc.bControlSize = 0;
> +	xu->desc.bmControls = NULL;
> +
> +	config_item_init_type_name(&xu->item, name, &uvcg_extension_type);
> +	list_add_tail(&xu->list, &opts->extension_units);
> +
> +	mutex_unlock(&opts->lock);
> +
> +	return &xu->item;
> +}
> +
> +static struct configfs_group_operations uvcg_extensions_grp_ops = {
> +	.make_item	= uvcg_extension_make,
> +	.drop_item	= uvcg_extension_drop,
> +};
> +
> +static const struct uvcg_config_group_type uvcg_extensions_grp_type = {
> +	.type = {
> +		.ct_item_ops	= &uvcg_config_item_ops,
> +		.ct_group_ops	= &uvcg_extensions_grp_ops,
> +		.ct_owner	= THIS_MODULE,
> +	},
> +	.name = "extensions",
> +};
> +
>   /* -----------------------------------------------------------------------------
>    * control/class/{fs|ss}
>    */
> @@ -844,6 +1255,7 @@ static const struct uvcg_config_group_type uvcg_control_grp_type = {
>   		&uvcg_processing_grp_type,
>   		&uvcg_terminal_grp_type,
>   		&uvcg_control_class_grp_type,
> +		&uvcg_extensions_grp_type,
>   		NULL,
>   	},
>   };
> diff --git a/drivers/usb/gadget/function/uvc_configfs.h b/drivers/usb/gadget/function/uvc_configfs.h
> index ad2ec8c4c78c..c9a4182fb26f 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.h
> +++ b/drivers/usb/gadget/function/uvc_configfs.h
> @@ -132,6 +132,35 @@ static inline struct uvcg_mjpeg *to_uvcg_mjpeg(struct config_item *item)
>   	return container_of(to_uvcg_format(item), struct uvcg_mjpeg, fmt);
>   }
>   
> +/* -----------------------------------------------------------------------------
> + * control/extensions/<NAME>
> + */
> +
> +struct uvcg_extension_unit_descriptor {
> +	u8 bLength;
> +	u8 bDescriptorType;
> +	u8 bDescriptorSubType;
> +	u8 bUnitID;
> +	u8 guidExtensionCode[16];
> +	u8 bNumControls;
> +	u8 bNrInPins;
> +	u8 *baSourceID;
> +	u8 bControlSize;
> +	u8 *bmControls;
> +	u8 iExtension;
> +} __packed;
> +
> +struct uvcg_extension {
> +	struct config_item item;
> +	struct list_head list;
> +	struct uvcg_extension_unit_descriptor desc;
> +};
> +
> +static inline struct uvcg_extension *to_uvcg_extension(struct config_item *item)
> +{
> +	return container_of(item, struct uvcg_extension, item);
> +}
> +
>   int uvcg_attach_configfs(struct f_uvc_opts *opts);
>   
>   #endif /* UVC_CONFIGFS_H */
