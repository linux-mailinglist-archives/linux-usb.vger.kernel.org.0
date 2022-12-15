Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D279564DACA
	for <lists+linux-usb@lfdr.de>; Thu, 15 Dec 2022 13:00:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbiLOMAu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Dec 2022 07:00:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbiLOMAo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Dec 2022 07:00:44 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB1A25D9
        for <linux-usb@vger.kernel.org>; Thu, 15 Dec 2022 04:00:42 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B3C18B;
        Thu, 15 Dec 2022 13:00:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671105640;
        bh=d6uazOkSzMHKcuOtFkNoVEzZa+S/j4LGjzKkrsmc/u4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ITfxV6TU+GUf0BZ9bRhkOvvXKhj0EBAb8n6cj2FtuDwn4xrTFneYtteZHb9ew60bH
         bDAhHCTundQiLEe2nnRdLkit7jHVXV/Lb/zQzFoy3FQUk5Qh7ZWt29k2PYLZi5cfmR
         SZMmIOe9zllFCuN4/a5oWy+k1penJbeMGzG3Dzmc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221213083736.2284536-7-dan.scally@ideasonboard.com>
References: <20221213083736.2284536-1-dan.scally@ideasonboard.com> <20221213083736.2284536-7-dan.scally@ideasonboard.com>
Subject: Re: [PATCH 6/6] usb: gadget: uvc: Allow creating new color matching descriptors
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        torleiv@huddly.com, Daniel Scally <dan.scally@ideasonboard.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        linux-usb@vger.kernel.org
Date:   Thu, 15 Dec 2022 12:00:36 +0000
Message-ID: <167110563688.9133.15927668222226418339@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Daniel Scally (2022-12-13 08:37:36)
> Allow users to create new color matching descriptors in addition to
> the default one. These must be associated with a UVC format in order
> to be transmitted to the host, which is achieved by symlinking from
> the format to the newly created color matching descriptor - extend
> the uncompressed and mjpeg formats to support that linking operation.
>=20
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  .../ABI/testing/configfs-usb-gadget-uvc       |  4 +-
>  drivers/usb/gadget/function/uvc_configfs.c    | 79 ++++++++++++++++++-
>  2 files changed, 79 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Document=
ation/ABI/testing/configfs-usb-gadget-uvc
> index 3512f4899fe3..ce629f0880a9 100644
> --- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
> +++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
> @@ -160,10 +160,10 @@ Date:             Dec 2014
>  KernelVersion: 4.0
>  Description:   Color matching descriptors
> =20
> -What:          /config/usb-gadget/gadget/functions/uvc.name/streaming/co=
lor_matching/default
> +What:          /config/usb-gadget/gadget/functions/uvc.name/streaming/co=
lor_matching/name

Hrm... do we need to keep 'default' (and keep it available in patch
1/6?) so that the default is still kept accesible?

That would mean others are added as siblings to the default, and then
the one that gets linked is the one that is used perhaps?

Feels like that would overcomplicate 'the default case' maybe ... but
I'm weary that this is 'removing' the default from ABI...?

>  Date:          Dec 2014
>  KernelVersion: 4.0

Hrm ... and this would leave the documentation stating that you could
provide custom color matching descriptors from v4.0 onwards, which would
be inaccurate ?

So I'm not sure we can just rename this documentation segment eitherway.


> -Description:   Default color matching descriptors
> +Description:   color matching descriptors
> =20
>                 All attributes read/write:
> =20
> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gad=
get/function/uvc_configfs.c
> index 4fbc42d738a4..82c10f0dab71 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -769,6 +769,58 @@ static struct uvcg_cmd *uvcg_format_get_default_cmd(=
struct config_item *streamin
>         return cmd;
>  }
> =20
> +static int uvcg_format_allow_link(struct config_item *src, struct config=
_item *tgt)
> +{
> +       struct mutex *su_mutex =3D &src->ci_group->cg_subsys->su_mutex;
> +       struct config_item *streaming, *color_matching;
> +       struct uvcg_cmd *color_matching_desc;
> +       struct uvcg_format *fmt;
> +       int ret =3D 0;
> +
> +       mutex_lock(su_mutex);
> +
> +       streaming =3D src->ci_parent->ci_parent;
> +       color_matching =3D config_group_find_item(to_config_group(streami=
ng), "color_matching");
> +       if (!color_matching || color_matching !=3D tgt->ci_parent) {
> +               ret =3D -EINVAL;
> +               goto out_put_cm;
> +       }
> +
> +       color_matching_desc =3D to_uvcg_cmd(to_config_group(tgt));
> +       fmt =3D to_uvcg_format(src);
> +       fmt->color_matching =3D color_matching_desc;
> +
> +out_put_cm:
> +       config_item_put(color_matching);
> +       mutex_unlock(su_mutex);
> +
> +       return ret;
> +}
> +
> +static void uvcg_format_drop_link(struct config_item *src, struct config=
_item *tgt)
> +{
> +       struct config_item *streaming;
> +       struct mutex *su_mutex =3D &src->ci_group->cg_subsys->su_mutex;
> +       struct uvcg_format *fmt;
> +       struct uvcg_cmd *cmd;
> +
> +       mutex_lock(su_mutex);
> +
> +       streaming =3D src->ci_parent->ci_parent;
> +       cmd =3D uvcg_format_get_default_cmd(streaming);
> +
> +       fmt =3D to_uvcg_format(src);
> +       fmt->color_matching =3D cmd;
> +
> +       mutex_unlock(su_mutex);
> +}
> +
> +static struct configfs_item_operations uvcg_format_item_operations =3D {
> +       .release        =3D uvcg_config_item_release,
> +       .allow_link     =3D uvcg_format_allow_link,
> +       .drop_link      =3D uvcg_format_drop_link,
> +};
> +
>  static ssize_t uvcg_format_bma_controls_show(struct uvcg_format *f, char=
 *page)
>  {
>         struct f_uvc_opts *opts;
> @@ -1569,7 +1621,7 @@ static struct configfs_attribute *uvcg_uncompressed=
_attrs[] =3D {
>  };
> =20
>  static const struct config_item_type uvcg_uncompressed_type =3D {
> -       .ct_item_ops    =3D &uvcg_config_item_ops,
> +       .ct_item_ops    =3D &uvcg_format_item_operations,
>         .ct_group_ops   =3D &uvcg_uncompressed_group_ops,
>         .ct_attrs       =3D uvcg_uncompressed_attrs,
>         .ct_owner       =3D THIS_MODULE,
> @@ -1764,7 +1816,7 @@ static struct configfs_attribute *uvcg_mjpeg_attrs[=
] =3D {
>  };
> =20
>  static const struct config_item_type uvcg_mjpeg_type =3D {
> -       .ct_item_ops    =3D &uvcg_config_item_ops,
> +       .ct_item_ops    =3D &uvcg_format_item_operations,
>         .ct_group_ops   =3D &uvcg_mjpeg_group_ops,
>         .ct_attrs       =3D uvcg_mjpeg_attrs,
>         .ct_owner       =3D THIS_MODULE,
> @@ -1912,6 +1964,28 @@ static const struct config_item_type uvcg_color_ma=
tching_type =3D {
>   * streaming/color_matching
>   */
> =20
> +static struct config_group *uvcg_color_matching_make(struct config_group=
 *group,
> +                                                    const char *name)
> +{
> +       struct uvcg_cmd *cmd;
> +
> +       cmd =3D kzalloc(sizeof(*cmd), GFP_KERNEL);
> +       if (!cmd)
> +               return ERR_PTR(-ENOMEM);
> +
> +       cmd->desc.bLength =3D UVC_DT_COLOR_MATCHING_SIZE;
> +       cmd->desc.bDescriptorType =3D USB_DT_CS_INTERFACE;
> +       cmd->desc.bDescriptorSubType =3D UVC_VS_COLORFORMAT;
> +
> +       config_group_init_type_name(&cmd->group, name, &uvcg_color_matchi=
ng_type);
> +
> +       return &cmd->group;
> +}
> +
> +static struct configfs_group_operations uvcg_color_matching_grp_group_op=
s =3D {
> +       .make_group     =3D uvcg_color_matching_make,
> +};
> +
>  static int uvcg_color_matching_create_children(struct config_group *pare=
nt)
>  {
>         struct uvcg_cmd *cmd;
> @@ -1937,6 +2011,7 @@ static int uvcg_color_matching_create_children(stru=
ct config_group *parent)
>  static const struct uvcg_config_group_type uvcg_color_matching_grp_type =
=3D {
>         .type =3D {
>                 .ct_item_ops    =3D &uvcg_config_item_ops,
> +               .ct_group_ops   =3D &uvcg_color_matching_grp_group_ops,
>                 .ct_owner       =3D THIS_MODULE,
>         },
>         .name =3D "color_matching",
> --=20
> 2.34.1
>
