Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5151650575
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 00:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbiLRXEW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 18 Dec 2022 18:04:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiLRXEV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 18 Dec 2022 18:04:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10690B7FC
        for <linux-usb@vger.kernel.org>; Sun, 18 Dec 2022 15:04:20 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65B4556D;
        Mon, 19 Dec 2022 00:04:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671404657;
        bh=4jB46bn2Hs7Nsti8DnQuoo4aCDqoAZ7zW9BHm+cO228=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e0rDuKGB7pZWasUQyZp+xLKvDLF8RwradhWBHV2qzmh0oEn6ZOHQuAtp7/7Iiz44z
         PmIZf1cgMbPldH37fATPWIS2QrcIYW0TKJfqk3O4nXbXyzJE+ZlwJai+E45tLOwrnS
         zLRtcpmae7Nk9fKf15+1u+53hEhWA/SAGjMfNtPI=
Date:   Mon, 19 Dec 2022 01:04:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dan Scally <dan.scally@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de, torleiv@huddly.com
Subject: Re: [PATCH 5/6] usb: gadget: uvc: Make color matching attributes
 read/write
Message-ID: <Y5+cbZPU3ZJ0KsCe@pendragon.ideasonboard.com>
References: <20221213083736.2284536-1-dan.scally@ideasonboard.com>
 <20221213083736.2284536-6-dan.scally@ideasonboard.com>
 <167110507266.9133.9781573969949845356@Monstersaurus>
 <699fe3cf-ecda-4301-cae7-49eb165aa10e@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <699fe3cf-ecda-4301-cae7-49eb165aa10e@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 16, 2022 at 03:53:05PM +0000, Dan Scally wrote:
> On 15/12/2022 11:51, Kieran Bingham wrote:
> > Quoting Daniel Scally (2022-12-13 08:37:35)
> >> In preparation for allowing more than the default color matching
> >> descriptor, make the color matching attributes writeable.
> >>
> >> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> >> ---
> >>   .../ABI/testing/configfs-usb-gadget-uvc       |  2 +-
> >>   drivers/usb/gadget/function/uvc_configfs.c    | 32 ++++++++++++++++++-
> >>   2 files changed, 32 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
> >> index 611b23e6488d..3512f4899fe3 100644
> >> --- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
> >> +++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
> >> @@ -165,7 +165,7 @@ Date:               Dec 2014
> >>   KernelVersion: 4.0
> >>   Description:   Default color matching descriptors
> >>   
> >> -               All attributes read only:
> >> +               All attributes read/write:
> >
> > Do we need to specify here what acceptable values can now be written at
> > all?
> 
> Yes I guess so...we probably need better documentation for this 
> somewhere. I don't think this file is the right place to describe it 
> fully, it's more of an enumeration. We probably need something like 
> Documentation/usb/gadget_serial.rst

That would make sense. I think you can also heavily quote or reference
the USB video class documentation.

> >>                  ========================  ======================================
> >>                  bMatrixCoefficients       matrix used to compute luma and
> >> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> >> index 6f5932c9f09c..4fbc42d738a4 100644
> >> --- a/drivers/usb/gadget/function/uvc_configfs.c
> >> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> >> @@ -1845,7 +1845,37 @@ static ssize_t uvcg_color_matching_##cname##_show(                       \
> >>          return result;                                                  \
> >>   }                                                                      \
> >>                                                                          \
> >> -UVC_ATTR_RO(uvcg_color_matching_, cname, aname)
> >> +static ssize_t uvcg_color_matching_##cname##_store(                    \
> >> +       struct config_item *item, const char *page, size_t len)         \
> >> +{                                                                      \
> >> +       struct config_group *group = to_config_group(item);             \
> >> +       struct mutex *su_mutex = &group->cg_subsys->su_mutex;           \
> >> +       struct uvcg_cmd *cmd = to_uvcg_cmd(group);                      \
> >> +       struct f_uvc_opts *opts;                                        \
> >> +       struct config_item *opts_item;                                  \
> >> +       int ret;                                                        \

I'd make this one last.

> >> +       u##bits num;                                                    \

In other places we use

	typeof(cmd->desc.aname) num;

Up to you.

> >> +                                                                       \
> >> +       ret = kstrtou##bits(page, 0, &num);                             \
> >> +       if (ret)                                                        \
> >> +               return ret;                                             \
> >
> > I don't know how horrible it would be - or if there's any other
> > precendence, but I'm weary that setting '1', or '4' in here from
> > userspace is fairly meaningless.
> >
> > Of course - the user doing so would have to know from the spec perhaps
> > what they are configuring - but it makes me wonder if we should support
> > string matching in here to also convert say "BT.709" to the appropriate
> > integer value (if a non-integer was set).
> >
> > It may depend on how 'most' other configfs entries that would be similar
> > to this would expect to operate.
> 
> This might be abusing configfs slightly, though I did something similar 
> for the custom string descriptors (see [1] and ctrl-f for 
> "uvcg_language_strings_show") and I think it's a worthwhile thing. What 
> about an "enumerate options" attribute that's read only and simply 
> enumerates the settings with their corresponding descriptions? The 
> problem with string parsing is you've still got to know the exact string 
> to pass (and googling "BT.709" tells me it can also be called "Rec.709", 
> "Rec. 709" and "ITU 709" for example) so you'd have to look it up 
> anyway. I'm thinking something like:
> 
> $ cat enumerate_options
> bColorPrimaries - This defines the color primaries and the reference white
> value       desc
> 0           Unspecified (Image characteristics unknown)
> 1           BT.709 (sRGB)
> 2           BT.470-2 (M)
> 3           BT.470 (B, G)
> 4           SMPTE 170M
> 5           SMPTE 240M
> 6-255       Reserved
> 
> bTransferCharacteristics - This field defines the opto-electronic transfer
>                                                  characteristics of the 
> source picture, also
>                                                  called the gamma function
> value       desc
> 0           Unspecified (Image characteristics unknown)
> 1           BT.7-0
> 2           BT.470-2 M
> ...          ...
> 
> 
> ... and so on. What do you think?

I think it's overkill. The userspace side of the UVC gadget is expected
to have good knowledge of UVC. This isn't an interface meant for users.

> [1] https://lore.kernel.org/linux-usb/20221121092517.225242-6-dan.scally@ideasonboard.com/
> 
> >> +                                                                       \
> >> +       mutex_lock(su_mutex); /* for navigating configfs hierarchy */   \
> >> +                                                                       \
> >> +       opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;     \
> >> +       opts = to_f_uvc_opts(opts_item);                                \
> >> +                                                                       \
> >> +       mutex_lock(&opts->lock);                                        \

Don't you need a similar linked check as in uvcg_frame_##cname##_store()
?

> >> +                                                                       \
> >> +       cmd->desc.aname = num;                                          \
> >> +       ret = len;                                                      \
> >> +                                                                       \
> >> +       mutex_unlock(&opts->lock);                                      \
> >> +       mutex_unlock(su_mutex);                                         \
> >> +                                                                       \
> >> +       return ret;                                                     \
> >> +}                                                                      \
> >> +UVC_ATTR(uvcg_color_matching_, cname, aname)
> >>   
> >>   UVCG_COLOR_MATCHING_ATTR(b_color_primaries, bColorPrimaries, 8);
> >>   UVCG_COLOR_MATCHING_ATTR(b_transfer_characteristics, bTransferCharacteristics, 8);

-- 
Regards,

Laurent Pinchart
