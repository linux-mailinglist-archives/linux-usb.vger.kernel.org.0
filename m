Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCD2F650F66
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 16:54:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231981AbiLSPyi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 10:54:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231952AbiLSPxq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 10:53:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F04D92
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 07:53:05 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29DFA825;
        Mon, 19 Dec 2022 16:53:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671465183;
        bh=giyte80D1oAF0e/DYoe9Y+32wy424MzBkSS1HfMpJA0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KxXK8Osl3J6sQQx6w8v6kbbZyepzZwWgPWbg/gBQQREiAuvfJQl1KiJ/80jTAHLlz
         7ygt37MPpXe99V8T2dy7IgTwm2AO7TNYa+cFrNjJAEYvgYuGzGPf57bnzsxrUh+cjd
         AHDbkqq8k2wCikFeKwnbhghON25wxdsZoabSJad8=
Date:   Mon, 19 Dec 2022 17:52:58 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dan Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com
Subject: Re: [PATCH 3/6] usb: gadget: uvc: Copy color matching descriptor for
 each frame
Message-ID: <Y6CI2hrbhdxBw5j5@pendragon.ideasonboard.com>
References: <20221213083736.2284536-1-dan.scally@ideasonboard.com>
 <20221213083736.2284536-4-dan.scally@ideasonboard.com>
 <Y5+iCEl34mMeAOOc@pendragon.ideasonboard.com>
 <a172fc2d-10b5-4498-644e-2e8a72a9ac99@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a172fc2d-10b5-4498-644e-2e8a72a9ac99@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Dan,

On Mon, Dec 19, 2022 at 10:33:39AM +0000, Dan Scally wrote:
> On 18/12/2022 23:28, Laurent Pinchart wrote:
> > On Tue, Dec 13, 2022 at 08:37:33AM +0000, Daniel Scally wrote:
> >> As currently implemented the default color matching descriptor is
> >> appended after _all_ the formats and frames that the gadget is
> >> configured with. According to the UVC specifications however this
> >> is supposed to be on a per-format basis (section 3.9.2.6):
> >>
> >> "Only one instance is allowed for a given format and if present,
> >> the Color Matching descriptor shall be placed following the Video
> >> and Still Image Frame descriptors for that format."
> >>
> >> Associate the default color matching descriptor with struct
> >> uvcg_format and copy it once-per-format instead of once only.
> >>
> >> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> >> ---
> >>   drivers/usb/gadget/function/uvc_configfs.c | 60 ++++++++++++++++++++--
> >>   drivers/usb/gadget/function/uvc_configfs.h |  1 +
> >>   2 files changed, 58 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> >> index 9918e7b6a023..6f5932c9f09c 100644
> >> --- a/drivers/usb/gadget/function/uvc_configfs.c
> >> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> >> @@ -747,6 +747,28 @@ static const char * const uvcg_format_names[] = {
> >>   	"mjpeg",
> >>   };
> >>   
> >> +static struct uvcg_cmd *uvcg_format_get_default_cmd(struct config_item *streaming)
> >> +{
> >> +	struct config_item *color_matching, *cm_default;
> >> +	struct uvcg_cmd *cmd;
> >> +
> >> +	color_matching = config_group_find_item(to_config_group(streaming),
> >> +						"color_matching");
> >> +	if (!color_matching)
> >> +		return NULL;
> >> +
> >> +	cm_default = config_group_find_item(to_config_group(color_matching),
> >> +					    "default");
> >> +	config_item_put(color_matching);
> >> +	if (!cm_default)
> >> +		return NULL;
> >> +
> >> +	cmd = to_uvcg_cmd(to_config_group(cm_default));
> >> +	config_item_put(cm_default);
> >> +
> >> +	return cmd;
> >> +}
> >> +
> >>   static ssize_t uvcg_format_bma_controls_show(struct uvcg_format *f, char *page)
> >>   {
> >>   	struct f_uvc_opts *opts;
> >> @@ -1560,7 +1582,14 @@ static struct config_group *uvcg_uncompressed_make(struct config_group *group,
> >>   		'Y',  'U',  'Y',  '2', 0x00, 0x00, 0x10, 0x00,
> >>   		 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71
> >>   	};
> >> +	struct config_item *streaming;
> >>   	struct uvcg_uncompressed *h;
> >> +	struct uvcg_cmd *cmd;
> >> +
> >> +	streaming = group->cg_item.ci_parent;
> >> +	cmd = uvcg_format_get_default_cmd(streaming);
> >> +	if (!cmd)
> >> +		return ERR_PTR(-EINVAL);
> >>   
> >>   	h = kzalloc(sizeof(*h), GFP_KERNEL);
> >>   	if (!h)
> >> @@ -1579,6 +1608,7 @@ static struct config_group *uvcg_uncompressed_make(struct config_group *group,
> >>   
> >>   	INIT_LIST_HEAD(&h->fmt.frames);
> >>   	h->fmt.type = UVCG_UNCOMPRESSED;
> >> +	h->fmt.color_matching = cmd;
> >
> > Is there any need to reference-count cmd to make sure it doesn't get
> > deleted ? I don't expect that to be an issue for the default, but for
> > the user-defined color matching descriptors. This may be better
> > discussed in the context of other patches further in the series.
> 
> configfs_symlink() holds references to the targets, so you can't remove 
> the color matching descriptors without first removing the symlink to them.
> 
> >>   	config_group_init_type_name(&h->fmt.group, name,
> >>   				    &uvcg_uncompressed_type);
> >>   
> >> @@ -1743,7 +1773,14 @@ static const struct config_item_type uvcg_mjpeg_type = {
> >>   static struct config_group *uvcg_mjpeg_make(struct config_group *group,
> >>   						   const char *name)
> >>   {
> >> +	struct config_item *streaming;
> >>   	struct uvcg_mjpeg *h;
> >> +	struct uvcg_cmd *cmd;
> >> +
> >> +	streaming = group->cg_item.ci_parent;
> >> +	cmd = uvcg_format_get_default_cmd(streaming);
> >> +	if (!cmd)
> >> +		return ERR_PTR(-EINVAL);
> >>   
> >>   	h = kzalloc(sizeof(*h), GFP_KERNEL);
> >>   	if (!h)
> >> @@ -1760,6 +1797,7 @@ static struct config_group *uvcg_mjpeg_make(struct config_group *group,
> >>   
> >>   	INIT_LIST_HEAD(&h->fmt.frames);
> >>   	h->fmt.type = UVCG_MJPEG;
> >> +	h->fmt.color_matching = cmd;
> >>   	config_group_init_type_name(&h->fmt.group, name,
> >>   				    &uvcg_mjpeg_type);
> >>   
> >> @@ -1906,7 +1944,8 @@ static inline struct uvc_descriptor_header
> >>   enum uvcg_strm_type {
> >>   	UVCG_HEADER = 0,
> >>   	UVCG_FORMAT,
> >> -	UVCG_FRAME
> >> +	UVCG_FRAME,
> >> +	UVCG_CMD,
> >>   };
> >>   
> >>   /*
> >> @@ -1956,6 +1995,10 @@ static int __uvcg_iter_strm_cls(struct uvcg_streaming_header *h,
> >>   			if (ret)
> >>   				return ret;
> >>   		}
> >> +
> >> +		ret = fun(f->fmt->color_matching, priv2, priv3, 0, UVCG_CMD);
> >> +		if (ret)
> >> +			return ret;
> >>   	}
> >>   
> >>   	return ret;
> >> @@ -2011,6 +2054,11 @@ static int __uvcg_cnt_strm(void *priv1, void *priv2, void *priv3, int n,
> >>   		*size += frm->frame.b_frame_interval_type * sz;
> >>   	}
> >>   	break;
> >> +	case UVCG_CMD: {
> >> +		struct uvcg_cmd *cmd = priv1;
> >
> > Missing blank line. Same below.
> 
> Sorry; where below?

Nowhere, my bad :-)

> >> +		*size += sizeof(cmd->desc);
> >> +	}
> >> +	break;
> >>   	}
> >>   
> >>   	++*count;
> >> @@ -2096,6 +2144,13 @@ static int __uvcg_fill_strm(void *priv1, void *priv2, void *priv3, int n,
> >>   				frm->frame.b_frame_interval_type);
> >>   	}
> >>   	break;
> >> +	case UVCG_CMD: {
> >> +		struct uvcg_cmd *cmd = priv1;
> >> +
> >> +		memcpy(*dest, &cmd->desc, sizeof(cmd->desc));
> >> +		*dest += sizeof(cmd->desc);
> >> +	}
> >> +	break;
> >>   	}
> >>   
> >>   	return 0;
> >> @@ -2135,7 +2190,7 @@ static int uvcg_streaming_class_allow_link(struct config_item *src,
> >>   	if (ret)
> >>   		goto unlock;
> >>   
> >> -	count += 2; /* color_matching, NULL */
> >> +	count += 1; /* NULL */
> >>   	*class_array = kcalloc(count, sizeof(void *), GFP_KERNEL);
> >>   	if (!*class_array) {
> >>   		ret = -ENOMEM;
> >> @@ -2162,7 +2217,6 @@ static int uvcg_streaming_class_allow_link(struct config_item *src,
> >>   		kfree(data_save);
> >>   		goto unlock;
> >>   	}
> >> -	*cl_arr = (struct uvc_descriptor_header *)&opts->uvc_color_matching;
> >>   
> >>   	++target_hdr->linked;
> >>   	ret = 0;
> >> diff --git a/drivers/usb/gadget/function/uvc_configfs.h b/drivers/usb/gadget/function/uvc_configfs.h
> >> index f990739838d5..6582d6c7b6f6 100644
> >> --- a/drivers/usb/gadget/function/uvc_configfs.h
> >> +++ b/drivers/usb/gadget/function/uvc_configfs.h
> >> @@ -57,6 +57,7 @@ struct uvcg_format {
> >>   	struct list_head	frames;
> >>   	unsigned		num_frames;
> >>   	__u8			bmaControls[UVCG_STREAMING_CONTROL_SIZE];
> >> +	struct uvcg_cmd		*color_matching;
> >>   };
> >>   
> >>   struct uvcg_format_ptr {

-- 
Regards,

Laurent Pinchart
