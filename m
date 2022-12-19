Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B73E265099C
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 10:53:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbiLSJxl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 04:53:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiLSJxj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 04:53:39 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEFD91013
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 01:53:38 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E699825;
        Mon, 19 Dec 2022 10:53:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671443616;
        bh=GqZDSKfP46uTeYdg/DO7SjFoHmWE7sYhYjuw45I6CFk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ttVw4UFlB/WI79aZThgDWbFp0oOn1txJbexQ2QgYWBainvWxyfgV8Aks7HV/50H1r
         eKv/go9xQm9pvXiKLyGor0qXtv5nRrIUkgJhGu/WRooohcBX+vBvS9d0RqKxOb8Fa0
         HTn54+XRZs8vsnfGpgBv547HIyyg/icoiWjUG5SI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Y5+iUsdzsn+XdMMk@pendragon.ideasonboard.com>
References: <20221213083736.2284536-1-dan.scally@ideasonboard.com> <20221213083736.2284536-2-dan.scally@ideasonboard.com> <Y5+iUsdzsn+XdMMk@pendragon.ideasonboard.com>
Subject: Re: [PATCH 1/6] usb: gadget: usb: Remove "default" from color matching attributes
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de, torleiv@huddly.com
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date:   Mon, 19 Dec 2022 09:53:33 +0000
Message-ID: <167144361345.530483.4328401739357823575@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Laurent Pinchart (2022-12-18 23:29:22)
> Hi Dan,
>=20
> Thank you for the patch.
>=20
> On Tue, Dec 13, 2022 at 08:37:31AM +0000, Daniel Scally wrote:
> > Color matching attributes in the configfs for UVC are named with the
> > phrase "default". The implication of that is that they will only be
> > used _with_ the default color matching descriptor, and that will
> > shortly no longer be the case.
> >=20
> > Remove the "default" from the color matching descriptor attribute
> > variables.
> >=20
> > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Yup.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> > ---
> >  drivers/usb/gadget/function/uvc_configfs.c | 29 +++++++++++-----------
> >  1 file changed, 14 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/g=
adget/function/uvc_configfs.c
> > index 4303a3283ba0..26d092790f12 100644
> > --- a/drivers/usb/gadget/function/uvc_configfs.c
> > +++ b/drivers/usb/gadget/function/uvc_configfs.c
> > @@ -1783,8 +1783,8 @@ static const struct uvcg_config_group_type uvcg_m=
jpeg_grp_type =3D {
> >   * streaming/color_matching/default
> >   */
> > =20
> > -#define UVCG_DEFAULT_COLOR_MATCHING_ATTR(cname, aname, bits)         \
> > -static ssize_t uvcg_default_color_matching_##cname##_show(           \
> > +#define UVCG_COLOR_MATCHING_ATTR(cname, aname, bits)                 \
> > +static ssize_t uvcg_color_matching_##cname##_show(                   \
> >       struct config_item *item, char *page)                           \
> >  {                                                                    \
> >       struct config_group *group =3D to_config_group(item);            =
 \
> > @@ -1808,26 +1808,25 @@ static ssize_t uvcg_default_color_matching_##cn=
ame##_show(            \
> >       return result;                                                  \
> >  }                                                                    \
> >                                                                       \
> > -UVC_ATTR_RO(uvcg_default_color_matching_, cname, aname)
> > +UVC_ATTR_RO(uvcg_color_matching_, cname, aname)
> > =20
> > -UVCG_DEFAULT_COLOR_MATCHING_ATTR(b_color_primaries, bColorPrimaries, 8=
);
> > -UVCG_DEFAULT_COLOR_MATCHING_ATTR(b_transfer_characteristics,
> > -                              bTransferCharacteristics, 8);
> > -UVCG_DEFAULT_COLOR_MATCHING_ATTR(b_matrix_coefficients, bMatrixCoeffic=
ients, 8);
> > +UVCG_COLOR_MATCHING_ATTR(b_color_primaries, bColorPrimaries, 8);
> > +UVCG_COLOR_MATCHING_ATTR(b_transfer_characteristics, bTransferCharacte=
ristics, 8);
> > +UVCG_COLOR_MATCHING_ATTR(b_matrix_coefficients, bMatrixCoefficients, 8=
);
> > =20
> > -#undef UVCG_DEFAULT_COLOR_MATCHING_ATTR
> > +#undef UVCG_COLOR_MATCHING_ATTR
> > =20
> > -static struct configfs_attribute *uvcg_default_color_matching_attrs[] =
=3D {
> > -     &uvcg_default_color_matching_attr_b_color_primaries,
> > -     &uvcg_default_color_matching_attr_b_transfer_characteristics,
> > -     &uvcg_default_color_matching_attr_b_matrix_coefficients,
> > +static struct configfs_attribute *uvcg_color_matching_attrs[] =3D {
> > +     &uvcg_color_matching_attr_b_color_primaries,
> > +     &uvcg_color_matching_attr_b_transfer_characteristics,
> > +     &uvcg_color_matching_attr_b_matrix_coefficients,
> >       NULL,
> >  };
> > =20
> > -static const struct uvcg_config_group_type uvcg_default_color_matching=
_type =3D {
> > +static const struct uvcg_config_group_type uvcg_color_matching_type =
=3D {
> >       .type =3D {
> >               .ct_item_ops    =3D &uvcg_config_item_ops,
> > -             .ct_attrs       =3D uvcg_default_color_matching_attrs,
> > +             .ct_attrs       =3D uvcg_color_matching_attrs,
> >               .ct_owner       =3D THIS_MODULE,
> >       },
> >       .name =3D "default",
> > @@ -1844,7 +1843,7 @@ static const struct uvcg_config_group_type uvcg_c=
olor_matching_grp_type =3D {
> >       },
> >       .name =3D "color_matching",
> >       .children =3D (const struct uvcg_config_group_type*[]) {
> > -             &uvcg_default_color_matching_type,
> > +             &uvcg_color_matching_type,
> >               NULL,
> >       },
> >  };
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart
