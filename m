Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCD364DA9E
	for <lists+linux-usb@lfdr.de>; Thu, 15 Dec 2022 12:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbiLOLp5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Dec 2022 06:45:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbiLOLpu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Dec 2022 06:45:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3BF315837
        for <linux-usb@vger.kernel.org>; Thu, 15 Dec 2022 03:45:48 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30716327;
        Thu, 15 Dec 2022 12:45:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671104746;
        bh=Tip7BwDtwnrlx4k+298gayVj77BRWSbAe8buJxp1soc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=h2SOq3ESI3uUUOpJufMMlUaLHwo6RTRb1fLVMkstZB7gMLVkckzMiKmYVdXqEJGtj
         A2ltfC018lNEiAlY8mcNe6JFXqaUKqOwmBk6ADSc+Y+UpAPbLv3N+oawoN5feI30xS
         4gUlw28Oen/DpSxu7DEjXGib3UHjph+i3jXKXmqc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221213083736.2284536-3-dan.scally@ideasonboard.com>
References: <20221213083736.2284536-1-dan.scally@ideasonboard.com> <20221213083736.2284536-3-dan.scally@ideasonboard.com>
Subject: Re: [PATCH 2/6] usb: gadget: uvc: Add struct for color matching in configs
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        torleiv@huddly.com, Daniel Scally <dan.scally@ideasonboard.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        linux-usb@vger.kernel.org
Date:   Thu, 15 Dec 2022 11:45:43 +0000
Message-ID: <167110474312.9133.3611120701301365792@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Daniel Scally (2022-12-13 08:37:32)
> Color matching descriptors are meant to be a per-format piece of data
> and we need to be able to support different descriptors for different
> formats. As a preliminary step towards that goal, switch the default
> color matching configfs functionality to point to an instance of a
> new struct uvcg_cmd (for "color matching descriptor"). Use the same

Hrm .. I can't see 'cmd' and not think 'command' ... but longer names
are longer ...



> default values for its attributes as the currently hard-coded ones so
> that the interface to userspace is consistent.
>=20
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  drivers/usb/gadget/function/uvc_configfs.c | 55 ++++++++++++++++------
>  drivers/usb/gadget/function/uvc_configfs.h |  8 ++++
>  2 files changed, 49 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gad=
get/function/uvc_configfs.c
> index 26d092790f12..9918e7b6a023 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -1788,20 +1788,19 @@ static ssize_t uvcg_color_matching_##cname##_show=
(                      \
>         struct config_item *item, char *page)                           \
>  {                                                                      \
>         struct config_group *group =3D to_config_group(item);            =
 \
> +       struct uvcg_cmd *cmd =3D to_uvcg_cmd(group);                     =
 \
>         struct f_uvc_opts *opts;                                        \
>         struct config_item *opts_item;                                  \
>         struct mutex *su_mutex =3D &group->cg_subsys->su_mutex;          =
 \
> -       struct uvc_color_matching_descriptor *cd;                       \
>         int result;                                                     \
>                                                                         \
>         mutex_lock(su_mutex); /* for navigating configfs hierarchy */   \
>                                                                         \
>         opts_item =3D group->cg_item.ci_parent->ci_parent->ci_parent;    =
 \
>         opts =3D to_f_uvc_opts(opts_item);                               =
 \
> -       cd =3D &opts->uvc_color_matching;                                =
 \
>                                                                         \
>         mutex_lock(&opts->lock);                                        \
> -       result =3D sprintf(page, "%u\n", le##bits##_to_cpu(cd->aname));  =
 \
> +       result =3D sprintf(page, "%u\n", le##bits##_to_cpu(cmd->desc.anam=
e));\
>         mutex_unlock(&opts->lock);                                      \
>                                                                         \
>         mutex_unlock(su_mutex);                                         \
> @@ -1823,29 +1822,57 @@ static struct configfs_attribute *uvcg_color_matc=
hing_attrs[] =3D {
>         NULL,
>  };
> =20
> -static const struct uvcg_config_group_type uvcg_color_matching_type =3D {
> -       .type =3D {
> -               .ct_item_ops    =3D &uvcg_config_item_ops,
> -               .ct_attrs       =3D uvcg_color_matching_attrs,
> -               .ct_owner       =3D THIS_MODULE,
> -       },
> -       .name =3D "default",
> +static void uvcg_color_matching_release(struct config_item *item)
> +{
> +       struct uvcg_cmd *cmd;
> +
> +       cmd =3D to_uvcg_cmd(to_config_group(item));
> +       kfree(cmd);
> +}
> +
> +static struct configfs_item_operations uvcg_color_matching_item_ops =3D {
> +       .release        =3D uvcg_color_matching_release,
> +};
> +
> +static const struct config_item_type uvcg_color_matching_type =3D {
> +       .ct_item_ops    =3D &uvcg_color_matching_item_ops,
> +       .ct_attrs       =3D uvcg_color_matching_attrs,
> +       .ct_owner       =3D THIS_MODULE,
>  };
> =20
>  /* ---------------------------------------------------------------------=
--------
>   * streaming/color_matching
>   */
> =20
> +static int uvcg_color_matching_create_children(struct config_group *pare=
nt)
> +{
> +       struct uvcg_cmd *cmd;
> +
> +       cmd =3D kzalloc(sizeof(*cmd), GFP_KERNEL);
> +       if (!cmd)
> +               return -ENOMEM;
> +
> +       cmd->desc.bLength =3D UVC_DT_COLOR_MATCHING_SIZE;
> +       cmd->desc.bDescriptorType =3D USB_DT_CS_INTERFACE;
> +       cmd->desc.bDescriptorSubType =3D UVC_VS_COLORFORMAT;
> +       cmd->desc.bColorPrimaries =3D 1;
> +       cmd->desc.bTransferCharacteristics =3D 1;
> +       cmd->desc.bMatrixCoefficients =3D 4;

I realise these values were taken directly as existing code, but
particularly in regards to how these values will be set from userspace -
is it easy enough to have some common definitions in a preceeding patch
that state the supported values here from the spec, to avoid 'magic
values' here ...

A header with defines or an enum isn't going to be usable from a bash
script configuring configfs, but at least a compiled program could use
the definitions.


> +
> +       config_group_init_type_name(&cmd->group, "default",
> +                                   &uvcg_color_matching_type);
> +       configfs_add_default_group(&cmd->group, parent);
> +
> +       return 0;
> +}
> +
>  static const struct uvcg_config_group_type uvcg_color_matching_grp_type =
=3D {
>         .type =3D {
>                 .ct_item_ops    =3D &uvcg_config_item_ops,
>                 .ct_owner       =3D THIS_MODULE,
>         },
>         .name =3D "color_matching",
> -       .children =3D (const struct uvcg_config_group_type*[]) {
> -               &uvcg_color_matching_type,
> -               NULL,
> -       },
> +       .create_children =3D uvcg_color_matching_create_children,
>  };
> =20
>  /* ---------------------------------------------------------------------=
--------
> diff --git a/drivers/usb/gadget/function/uvc_configfs.h b/drivers/usb/gad=
get/function/uvc_configfs.h
> index ad2ec8c4c78c..f990739838d5 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.h
> +++ b/drivers/usb/gadget/function/uvc_configfs.h
> @@ -37,6 +37,14 @@ static inline struct uvcg_control_header *to_uvcg_cont=
rol_header(struct config_i
>         return container_of(item, struct uvcg_control_header, item);
>  }
> =20
> +struct uvcg_cmd {
> +       struct config_group group;
> +       struct uvc_color_matching_descriptor desc;
> +};
> +
> +#define to_uvcg_cmd(group_ptr) \
> +container_of(group_ptr, struct uvcg_cmd, group)
> +
>  enum uvcg_format_type {
>         UVCG_UNCOMPRESSED =3D 0,
>         UVCG_MJPEG,
> --=20
> 2.34.1
>
