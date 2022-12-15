Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF5164DAA1
	for <lists+linux-usb@lfdr.de>; Thu, 15 Dec 2022 12:48:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiLOLsL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Dec 2022 06:48:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiLOLsJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Dec 2022 06:48:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE6F62C677
        for <linux-usb@vger.kernel.org>; Thu, 15 Dec 2022 03:48:08 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D1F0F327;
        Thu, 15 Dec 2022 12:48:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671104886;
        bh=dPrO7b2Ct2l1a/TLWOch0m9KNfJnOxD6w/b5U2cWK7g=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uvm9/aaB7xRUsgSprx3wKMnfGxnH2swhSlhQqzbskVfW1Y/WHDT/Wd4HAqjDjIuC6
         B9OswdWILRG6fl4k5KsACnyeKW8g6iS8Sjm1+Bh2sWtfAhCNsOvyhR5tXOHergzx+U
         WYtUux7BO6RJ8quVo/7vmJmkppfKamAQn82IQkF8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221213083736.2284536-5-dan.scally@ideasonboard.com>
References: <20221213083736.2284536-1-dan.scally@ideasonboard.com> <20221213083736.2284536-5-dan.scally@ideasonboard.com>
Subject: Re: [PATCH 4/6] usb: gadget: uvc: Remove the hardcoded default color matching
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        torleiv@huddly.com, Daniel Scally <dan.scally@ideasonboard.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        linux-usb@vger.kernel.org
Date:   Thu, 15 Dec 2022 11:48:04 +0000
Message-ID: <167110488489.9133.920745374027359778@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Daniel Scally (2022-12-13 08:37:34)
> A hardcoded default color matching descriptor is embedded in struct
> f_uvc_opts but no longer has any use - remove it.

Does this affect the legacy g_webcam, or is this part independent ?

> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  drivers/usb/gadget/function/f_uvc.c | 9 ---------
>  drivers/usb/gadget/function/u_uvc.h | 1 -
>  2 files changed, 10 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/fun=
ction/f_uvc.c
> index 6e196e06181e..46bdea73cdeb 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -793,7 +793,6 @@ static struct usb_function_instance *uvc_alloc_inst(v=
oid)
>         struct uvc_camera_terminal_descriptor *cd;
>         struct uvc_processing_unit_descriptor *pd;
>         struct uvc_output_terminal_descriptor *od;
> -       struct uvc_color_matching_descriptor *md;
>         struct uvc_descriptor_header **ctl_cls;
>         int ret;
> =20
> @@ -842,14 +841,6 @@ static struct usb_function_instance *uvc_alloc_inst(=
void)
>         od->bSourceID                   =3D 2;
>         od->iTerminal                   =3D 0;
> =20
> -       md =3D &opts->uvc_color_matching;
> -       md->bLength                     =3D UVC_DT_COLOR_MATCHING_SIZE;
> -       md->bDescriptorType             =3D USB_DT_CS_INTERFACE;
> -       md->bDescriptorSubType          =3D UVC_VS_COLORFORMAT;
> -       md->bColorPrimaries             =3D 1;
> -       md->bTransferCharacteristics    =3D 1;
> -       md->bMatrixCoefficients         =3D 4;
> -
>         /* Prepare fs control class descriptors for configfs-based gadget=
s */
>         ctl_cls =3D opts->uvc_fs_control_cls;
>         ctl_cls[0] =3D NULL;      /* assigned elsewhere by configfs */
> diff --git a/drivers/usb/gadget/function/u_uvc.h b/drivers/usb/gadget/fun=
ction/u_uvc.h
> index 24b8681b0d6f..577c1c48ca4a 100644
> --- a/drivers/usb/gadget/function/u_uvc.h
> +++ b/drivers/usb/gadget/function/u_uvc.h
> @@ -52,7 +52,6 @@ struct f_uvc_opts {
>         struct uvc_camera_terminal_descriptor           uvc_camera_termin=
al;
>         struct uvc_processing_unit_descriptor           uvc_processing;
>         struct uvc_output_terminal_descriptor           uvc_output_termin=
al;
> -       struct uvc_color_matching_descriptor            uvc_color_matchin=
g;
> =20
>         /*
>          * Control descriptors pointers arrays for full-/high-speed and
> --=20
> 2.34.1
>
