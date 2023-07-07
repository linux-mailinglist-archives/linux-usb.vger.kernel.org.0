Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01B8E74B702
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jul 2023 21:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232956AbjGGTXI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jul 2023 15:23:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbjGGTXI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jul 2023 15:23:08 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C7419A5
        for <linux-usb@vger.kernel.org>; Fri,  7 Jul 2023 12:23:07 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-635de022557so14582406d6.0
        for <linux-usb@vger.kernel.org>; Fri, 07 Jul 2023 12:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688757786; x=1691349786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jc8MxfBFrqlxL1JRDuemqx+BlSeG0AElWZoXGUcoH4=;
        b=O+qvecf043fcQ8KFHKE5jWGIuEq0Pzl6mJyowjQhwz2ugwfGyTTUSar3bTPgidns0T
         0f3NBNLx1U7b0c6pVLHFw0RukdjxJY0vYpXaOv5fgbkCQ3tGocIWntcggEJ2uSAiwegz
         TP0kXLbnRS99uOCECr67/reJRzh8OcWVQMRQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688757786; x=1691349786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jc8MxfBFrqlxL1JRDuemqx+BlSeG0AElWZoXGUcoH4=;
        b=C0lsuPHjIgrP7js9bU0IvrHDW8YI4aEtia5BV7r/+POXjlVJrOYzzRfpriK+upicYP
         lOedXK17ui0hfiliriXFIL9kKCmAtUQas03bCrELCMt2YRcIbLup1i9pd0tqMKBGFF/P
         gE8tcAca8klNEIF0Un6N2eRoenrDtW9lmRzQLYx+DdFgLT8J/FBFXFkhXClpVC80bsGQ
         JcBOgXTE1IZTn5Gaab3DufQiAp8E1SVgUthemLrYdFK+pUz3Y6CXiCvS419jaT4k5c04
         zGvHVmD2DYOv1+yKcnxpcHaIbpoi86W9i4um8R+oSyRgV6AOtnDzRU/7v6hBqAC7kZa1
         Z+jw==
X-Gm-Message-State: ABy/qLa9ChTz0Hvfl0Vdl2g+vTcuYBBjbtXuuAnK+g+PLYgBTl6aQ+n4
        gCpQ+MfljOmUe9AtbtvPG9ZOuybNYthh69KuR3Cw7Q==
X-Google-Smtp-Source: APBJJlEswutdWPX1UcnVWzbKzZRmKGnwy8FAhHjdqFruBu+dTBQdo/DucAGkKmgqmjWbYEGiO+Is5YMvpdgYkNijJCU=
X-Received: by 2002:a0c:9d45:0:b0:636:39ed:4dce with SMTP id
 n5-20020a0c9d45000000b0063639ed4dcemr5230055qvf.20.1688757786150; Fri, 07 Jul
 2023 12:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230707065318.18681-1-utkarsh.h.patel@intel.com> <20230707065318.18681-2-utkarsh.h.patel@intel.com>
In-Reply-To: <20230707065318.18681-2-utkarsh.h.patel@intel.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Fri, 7 Jul 2023 12:22:54 -0700
Message-ID: <CACeCKae0Vq2g9jq+69RodmJyDo7+tUEunp3JXS7vw1y7YVhzhw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] platform/chrome: cros_ec_typec: Configure Retimer
 cable type
To:     Utkarsh Patel <utkarsh.h.patel@intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        heikki.krogerus@linux.intel.com, bleung@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Utkarsh,

On Thu, Jul 6, 2023 at 11:51=E2=80=AFPM Utkarsh Patel <utkarsh.h.patel@inte=
l.com> wrote:
>
> Connector class driver only configure cable type active or passive.
> Configure if the cable type is retimer or redriver with this change.
> This detail will be provided as a part of cable discover mode VDO.
>
> Signed-off-by: Utkarsh Patel <utkarsh.h.patel@intel.com>
> ---
> Changes in v2:
> - Implemented use of cable discover mode vdo.
> - Removed adittional changes to host command.
>
> Changes in v3:
> - Changed the return method in cros_typec_get_cable_vdo.
> - Changed passed parameters in cros_typec_get_cable_vdo.
> - Corrected definition for unsigned integers as kerenl standard.
> - Assigning cable_vdo values directly in to cable_mode.
> - Removed unncessary checks for Retimer cable type.
> ---
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 26 ++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index 25f9767c28e8..0ea085fec55a 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -406,6 +406,20 @@ static int cros_typec_usb_safe_state(struct cros_typ=
ec_port *port)
>         return ret;
>  }
>
> +static int cros_typec_get_cable_vdo(struct cros_typec_port *port, u16 sv=
id)
Return type should be u32.
Also, since you're not using common return patterns (-ve return value), ple=
ase
add a kernel doc comment specifying what the return value holds ("0 if VDO
is not found" etc.)

> +{
> +       struct list_head *head =3D &port->plug_mode_list;
> +       struct cros_typec_altmode_node *node;
> +       int ret =3D 0;
> +
> +       list_for_each_entry(node, head, list) {
> +               if (node->amode->svid =3D=3D svid)
> +                       return node->amode->vdo;
> +       }
> +
> +       return ret;
> +}
> +
>  /*
>   * Spoof the VDOs that were likely communicated by the partner for TBT a=
lt
>   * mode.
> @@ -416,6 +430,7 @@ static int cros_typec_enable_tbt(struct cros_typec_da=
ta *typec,
>  {
>         struct cros_typec_port *port =3D typec->ports[port_num];
>         struct typec_thunderbolt_data data;
> +       u32 cable_vdo;
If we're using this in only 1 place, we can just inline it completely:
          data.cable_mode |=3D cros_typec_get_cable_vdo(port, USB_TYPEC_TBT=
_SID);

>         int ret;
>
>         if (typec->pd_ctrl_ver < 2) {
> @@ -432,6 +447,10 @@ static int cros_typec_enable_tbt(struct cros_typec_d=
ata *typec,
>
>         /* Cable Discover Mode VDO */
>         data.cable_mode =3D TBT_MODE;
> +
> +       cable_vdo =3D cros_typec_get_cable_vdo(port, USB_TYPEC_TBT_SID);
> +       data.cable_mode |=3D cable_vdo;
> +
>         data.cable_mode |=3D TBT_SET_CABLE_SPEED(pd_ctrl->cable_speed);
>
>         if (pd_ctrl->control_flags & USB_PD_CTRL_OPTICAL_CABLE)
> @@ -513,17 +532,22 @@ static int cros_typec_enable_usb4(struct cros_typec=
_data *typec,
>  {
>         struct cros_typec_port *port =3D typec->ports[port_num];
>         struct enter_usb_data data;
> +       u32 cable_vdo;
>
>         data.eudo =3D EUDO_USB_MODE_USB4 << EUDO_USB_MODE_SHIFT;
>
> +       cable_vdo =3D cros_typec_get_cable_vdo(port, USB_TYPEC_TBT_SID);

Same deal here, if we're only using this variable in one place, just
inline the call
inside the else if() statement.

> +
>         /* Cable Speed */
>         data.eudo |=3D pd_ctrl->cable_speed << EUDO_CABLE_SPEED_SHIFT;
>
>         /* Cable Type */
>         if (pd_ctrl->control_flags & USB_PD_CTRL_OPTICAL_CABLE)
>                 data.eudo |=3D EUDO_CABLE_TYPE_OPTICAL << EUDO_CABLE_TYPE=
_SHIFT;
> -       else if (pd_ctrl->control_flags & USB_PD_CTRL_ACTIVE_CABLE)
> +       else if (cable_vdo & TBT_CABLE_RETIMER)
>                 data.eudo |=3D EUDO_CABLE_TYPE_RE_TIMER << EUDO_CABLE_TYP=
E_SHIFT;
> +       else if (pd_ctrl->control_flags & USB_PD_CTRL_ACTIVE_CABLE)
> +               data.eudo |=3D EUDO_CABLE_TYPE_RE_DRIVER << EUDO_CABLE_TY=
PE_SHIFT;
>
>         data.active_link_training =3D !!(pd_ctrl->control_flags &
>                                        USB_PD_CTRL_ACTIVE_LINK_UNIDIR);
> --
> 2.25.1
>
