Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBBC76505AC
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 00:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbiLRX2t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 18 Dec 2022 18:28:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbiLRX2q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 18 Dec 2022 18:28:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B34F624A
        for <linux-usb@vger.kernel.org>; Sun, 18 Dec 2022 15:28:45 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 417BC825;
        Mon, 19 Dec 2022 00:28:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671406124;
        bh=0HwULb9xHwizfqRg/YUdtZcOveRypGzB4Xe9wOnV+d0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NSfI0W8VoOaUFugHtMUhXGvnJ/1IMuVhNucOfq1RnpcADD8HLs6Tzk7iO4tQ2mgQn
         qdxL0QrqyirakVM+fadt/ItfnPCuA0YCAmPWvzjBFrOxJKQ2xUemRTFiEGOnx7xyg1
         p2f1anJA/rfgzJVkzGnmEKNtRUJG901kUPz963m8=
Date:   Mon, 19 Dec 2022 01:28:39 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dan Scally <dan.scally@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de, torleiv@huddly.com
Subject: Re: [PATCH 2/6] usb: gadget: uvc: Add struct for color matching in
 configs
Message-ID: <Y5+iJ9Cxaowc1mgH@pendragon.ideasonboard.com>
References: <20221213083736.2284536-1-dan.scally@ideasonboard.com>
 <20221213083736.2284536-3-dan.scally@ideasonboard.com>
 <167110474312.9133.3611120701301365792@Monstersaurus>
 <1420546b-b6ff-dfa0-d421-431972ec45c8@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1420546b-b6ff-dfa0-d421-431972ec45c8@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

On Fri, Dec 16, 2022 at 02:06:48PM +0000, Dan Scally wrote:
> On 15/12/2022 11:45, Kieran Bingham wrote:
> > Quoting Daniel Scally (2022-12-13 08:37:32)
> >> Color matching descriptors are meant to be a per-format piece of data
> >> and we need to be able to support different descriptors for different
> >> formats. As a preliminary step towards that goal, switch the default
> >> color matching configfs functionality to point to an instance of a
> >> new struct uvcg_cmd (for "color matching descriptor"). Use the same
> >
> > Hrm .. I can't see 'cmd' and not think 'command' ... but longer names
> > are longer ...
> 
> Yeah. Naming things was never my strong suit...I couldn't think of a 
> name of intermediate length that wasn't rubbish so it was either this or 
> "uvcg_color_matching_descriptor" which is loooong.

I agree with Kieran, uvcg_cmd isn't good. uvcg_color_matching ?

> >> default values for its attributes as the currently hard-coded ones so
> >> that the interface to userspace is consistent.
> >>
> >> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> >> ---
> >>   drivers/usb/gadget/function/uvc_configfs.c | 55 ++++++++++++++++------
> >>   drivers/usb/gadget/function/uvc_configfs.h |  8 ++++
> >>   2 files changed, 49 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> >> index 26d092790f12..9918e7b6a023 100644
> >> --- a/drivers/usb/gadget/function/uvc_configfs.c
> >> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> >> @@ -1788,20 +1788,19 @@ static ssize_t uvcg_color_matching_##cname##_show(                      \
> >>          struct config_item *item, char *page)                           \
> >>   {                                                                      \
> >>          struct config_group *group = to_config_group(item);             \
> >> +       struct uvcg_cmd *cmd = to_uvcg_cmd(group);                      \

And you could name the variable color_match.

> >>          struct f_uvc_opts *opts;                                        \
> >>          struct config_item *opts_item;                                  \
> >>          struct mutex *su_mutex = &group->cg_subsys->su_mutex;           \
> >> -       struct uvc_color_matching_descriptor *cd;                       \
> >>          int result;                                                     \
> >>                                                                          \
> >>          mutex_lock(su_mutex); /* for navigating configfs hierarchy */   \
> >>                                                                          \
> >>          opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;     \
> >>          opts = to_f_uvc_opts(opts_item);                                \
> >> -       cd = &opts->uvc_color_matching;                                 \
> >>                                                                          \
> >>          mutex_lock(&opts->lock);                                        \
> >> -       result = sprintf(page, "%u\n", le##bits##_to_cpu(cd->aname));   \
> >> +       result = sprintf(page, "%u\n", le##bits##_to_cpu(cmd->desc.aname));\
> >>          mutex_unlock(&opts->lock);                                      \
> >>                                                                          \
> >>          mutex_unlock(su_mutex);                                         \
> >> @@ -1823,29 +1822,57 @@ static struct configfs_attribute *uvcg_color_matching_attrs[] = {
> >>          NULL,
> >>   };
> >>   
> >> -static const struct uvcg_config_group_type uvcg_color_matching_type = {
> >> -       .type = {
> >> -               .ct_item_ops    = &uvcg_config_item_ops,
> >> -               .ct_attrs       = uvcg_color_matching_attrs,
> >> -               .ct_owner       = THIS_MODULE,
> >> -       },
> >> -       .name = "default",
> >> +static void uvcg_color_matching_release(struct config_item *item)
> >> +{
> >> +       struct uvcg_cmd *cmd;
> >> +
> >> +       cmd = to_uvcg_cmd(to_config_group(item));

You can write

	struct uvcg_cmd *cmd = to_uvcg_cmd(to_config_group(item));

although it would need to become

	struct uvcg_color_matching *color_match =
		to_uvcg_color_matching(to_config_group(item));

> >> +       kfree(cmd);
> >> +}
> >> +
> >> +static struct configfs_item_operations uvcg_color_matching_item_ops = {
> >> +       .release        = uvcg_color_matching_release,
> >> +};
> >> +
> >> +static const struct config_item_type uvcg_color_matching_type = {
> >> +       .ct_item_ops    = &uvcg_color_matching_item_ops,
> >> +       .ct_attrs       = uvcg_color_matching_attrs,
> >> +       .ct_owner       = THIS_MODULE,
> >>   };
> >>   
> >>   /* -----------------------------------------------------------------------------
> >>    * streaming/color_matching
> >>    */
> >>   
> >> +static int uvcg_color_matching_create_children(struct config_group *parent)
> >> +{
> >> +       struct uvcg_cmd *cmd;
> >> +
> >> +       cmd = kzalloc(sizeof(*cmd), GFP_KERNEL);
> >> +       if (!cmd)
> >> +               return -ENOMEM;
> >> +
> >> +       cmd->desc.bLength = UVC_DT_COLOR_MATCHING_SIZE;
> >> +       cmd->desc.bDescriptorType = USB_DT_CS_INTERFACE;
> >> +       cmd->desc.bDescriptorSubType = UVC_VS_COLORFORMAT;
> >> +       cmd->desc.bColorPrimaries = 1;
> >> +       cmd->desc.bTransferCharacteristics = 1;
> >> +       cmd->desc.bMatrixCoefficients = 4;
> >
> > I realise these values were taken directly as existing code, but
> > particularly in regards to how these values will be set from userspace -
> > is it easy enough to have some common definitions in a preceeding patch
> > that state the supported values here from the spec, to avoid 'magic
> > values' here ...
> >
> > A header with defines or an enum isn't going to be usable from a bash
> > script configuring configfs, but at least a compiled program could use
> > the definitions.
> 
> Yes, I think probably it's a candidate for 
> include/uapi/linux/usb/video.h...unless anyone thinks it's better elsewhere

Sounds good to me.

> >> +
> >> +       config_group_init_type_name(&cmd->group, "default",
> >> +                                   &uvcg_color_matching_type);
> >> +       configfs_add_default_group(&cmd->group, parent);
> >> +
> >> +       return 0;
> >> +}
> >> +
> >>   static const struct uvcg_config_group_type uvcg_color_matching_grp_type = {
> >>          .type = {
> >>                  .ct_item_ops    = &uvcg_config_item_ops,
> >>                  .ct_owner       = THIS_MODULE,
> >>          },
> >>          .name = "color_matching",
> >> -       .children = (const struct uvcg_config_group_type*[]) {
> >> -               &uvcg_color_matching_type,
> >> -               NULL,
> >> -       },
> >> +       .create_children = uvcg_color_matching_create_children,
> >>   };
> >>   
> >>   /* -----------------------------------------------------------------------------
> >> diff --git a/drivers/usb/gadget/function/uvc_configfs.h b/drivers/usb/gadget/function/uvc_configfs.h
> >> index ad2ec8c4c78c..f990739838d5 100644
> >> --- a/drivers/usb/gadget/function/uvc_configfs.h
> >> +++ b/drivers/usb/gadget/function/uvc_configfs.h
> >> @@ -37,6 +37,14 @@ static inline struct uvcg_control_header *to_uvcg_control_header(struct config_i
> >>          return container_of(item, struct uvcg_control_header, item);
> >>   }
> >>   
> >> +struct uvcg_cmd {
> >> +       struct config_group group;
> >> +       struct uvc_color_matching_descriptor desc;
> >> +};
> >> +
> >> +#define to_uvcg_cmd(group_ptr) \
> >> +container_of(group_ptr, struct uvcg_cmd, group)
> >> +
> >>   enum uvcg_format_type {
> >>          UVCG_UNCOMPRESSED = 0,
> >>          UVCG_MJPEG,

-- 
Regards,

Laurent Pinchart
