Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9092964DAA7
	for <lists+linux-usb@lfdr.de>; Thu, 15 Dec 2022 12:51:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbiLOLvT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Dec 2022 06:51:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbiLOLvR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Dec 2022 06:51:17 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9130517A8D
        for <linux-usb@vger.kernel.org>; Thu, 15 Dec 2022 03:51:16 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9EC75327;
        Thu, 15 Dec 2022 12:51:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671105074;
        bh=jSrEAMw6atcrwMQeza0RFepSSzBDwEfDtaQOQ0wNuGE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=V+cPNGc4mKXAMKzL8+FKftb/4PUwtSTJ9W6UtERSsjmauGwwklhqfLWGX6ojXzRjc
         WQAevxHsUuDjdMhZeWZlBXLq7J1/thqweZiG/a/8/cSagizRQFk+gn7Ywb3AzJVVP5
         00UFFpAbWmschcdYP3f7uaI/+AjAqvDNHjC26wf4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221213083736.2284536-6-dan.scally@ideasonboard.com>
References: <20221213083736.2284536-1-dan.scally@ideasonboard.com> <20221213083736.2284536-6-dan.scally@ideasonboard.com>
Subject: Re: [PATCH 5/6] usb: gadget: uvc: Make color matching attributes read/write
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        torleiv@huddly.com, Daniel Scally <dan.scally@ideasonboard.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        linux-usb@vger.kernel.org
Date:   Thu, 15 Dec 2022 11:51:12 +0000
Message-ID: <167110507266.9133.9781573969949845356@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Daniel Scally (2022-12-13 08:37:35)
> In preparation for allowing more than the default color matching
> descriptor, make the color matching attributes writeable.
>=20
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  .../ABI/testing/configfs-usb-gadget-uvc       |  2 +-
>  drivers/usb/gadget/function/uvc_configfs.c    | 32 ++++++++++++++++++-
>  2 files changed, 32 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Document=
ation/ABI/testing/configfs-usb-gadget-uvc
> index 611b23e6488d..3512f4899fe3 100644
> --- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
> +++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
> @@ -165,7 +165,7 @@ Date:               Dec 2014
>  KernelVersion: 4.0
>  Description:   Default color matching descriptors
> =20
> -               All attributes read only:
> +               All attributes read/write:

Do we need to specify here what acceptable values can now be written at
all?

> =20
>                 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>                 bMatrixCoefficients       matrix used to compute luma and
> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gad=
get/function/uvc_configfs.c
> index 6f5932c9f09c..4fbc42d738a4 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -1845,7 +1845,37 @@ static ssize_t uvcg_color_matching_##cname##_show(=
                       \
>         return result;                                                  \
>  }                                                                      \
>                                                                         \
> -UVC_ATTR_RO(uvcg_color_matching_, cname, aname)
> +static ssize_t uvcg_color_matching_##cname##_store(                    \
> +       struct config_item *item, const char *page, size_t len)         \
> +{                                                                      \
> +       struct config_group *group =3D to_config_group(item);            =
 \
> +       struct mutex *su_mutex =3D &group->cg_subsys->su_mutex;          =
 \
> +       struct uvcg_cmd *cmd =3D to_uvcg_cmd(group);                     =
 \
> +       struct f_uvc_opts *opts;                                        \
> +       struct config_item *opts_item;                                  \
> +       int ret;                                                        \
> +       u##bits num;                                                    \
> +                                                                       \
> +       ret =3D kstrtou##bits(page, 0, &num);                            =
 \
> +       if (ret)                                                        \
> +               return ret;                                             \

I don't know how horrible it would be - or if there's any other
precendence, but I'm weary that setting '1', or '4' in here from
userspace is fairly meaningless.

Of course - the user doing so would have to know from the spec perhaps
what they are configuring - but it makes me wonder if we should support
string matching in here to also convert say "BT.709" to the appropriate
integer value (if a non-integer was set).

It may depend on how 'most' other configfs entries that would be similar
to this would expect to operate.

> +                                                                       \
> +       mutex_lock(su_mutex); /* for navigating configfs hierarchy */   \
> +                                                                       \
> +       opts_item =3D group->cg_item.ci_parent->ci_parent->ci_parent;    =
 \
> +       opts =3D to_f_uvc_opts(opts_item);                               =
 \
> +                                                                       \
> +       mutex_lock(&opts->lock);                                        \
> +                                                                       \
> +       cmd->desc.aname =3D num;                                         =
 \
> +       ret =3D len;                                                     =
 \
> +                                                                       \
> +       mutex_unlock(&opts->lock);                                      \
> +       mutex_unlock(su_mutex);                                         \
> +                                                                       \
> +       return ret;                                                     \
> +}                                                                      \
> +UVC_ATTR(uvcg_color_matching_, cname, aname)
> =20
>  UVCG_COLOR_MATCHING_ATTR(b_color_primaries, bColorPrimaries, 8);
>  UVCG_COLOR_MATCHING_ATTR(b_transfer_characteristics, bTransferCharacteri=
stics, 8);
> --=20
> 2.34.1
>
