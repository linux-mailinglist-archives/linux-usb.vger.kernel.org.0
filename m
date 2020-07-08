Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B98312187E9
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 14:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729222AbgGHMpH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 08:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729087AbgGHMpF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jul 2020 08:45:05 -0400
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C15FBC08C5DC
        for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2020 05:45:04 -0700 (PDT)
Received: by mail-vk1-xa35.google.com with SMTP id c11so5128390vkn.11
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2020 05:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=P79CCaCLZJnLhJaobZbV2L+upp7+SNoXZ8EKZzxhSd8=;
        b=BKaFK/+H3px5nJua7MvGMgidV5JYZnDiCLqHb65OQih6StPBeH5iBePW5MY4glDh8m
         ksGx/Zyt2ENl0IaVcc2mPDJvA/OO5sTp3UagNFlHORQTPCCpGBaRiNKn7nWASARvVjeU
         J66+dBYn7IoEvWAe7kuOw2OTKxglpTUOytjzO4aQLY/eUsEcy9OY+Xs9oKh1H2rww0Ka
         DUnOez/rI/Nmn+BvigOTkUxI1pPhSnCDMwUC9cAmnUsDIjIBAqIzUbj+y3hnAwI6msGM
         icpUbrRQ50OseOe1IHKkxrDeusLuD1thhkn1Rh8FFaR4/pVyJwq466T9HYoNGZ3STt+X
         7tpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=P79CCaCLZJnLhJaobZbV2L+upp7+SNoXZ8EKZzxhSd8=;
        b=bhGvHVXJHBCZDhDel3bYO8vFZJfZDa6Uw6DxioQB4n06opC+BIl7H3gdT0LE1g0LK0
         77BRosB8KhBHTNw8Km6vxIbfLHAHJ/4hDJso6FzpkCFA2hg5Cy5D73z7JrAfdWyzFPjQ
         cEGkJ1a6Zf6VKrHWqI717GAJ5V39NxsAdtKRP9D/RM+YxGtVUof2+gSLFNkA/IW5zHJF
         1e8qYa1clk8Paof8v+fSCw3C/in+3vRRx4or0V1APIH3bB3VycKbu0wKqJa4f4WPOq/L
         7om9xrp1u0ruTp2fNjgrgWdY70PGCJK1NJwq+l806iFOJNl2HBaaUH01iezVic1F7c/4
         A5gA==
X-Gm-Message-State: AOAM533/kwkGcycNVQs1w/ENRNVP0V36SHT0ERnU7r5xDSDJOCDJ5VO3
        2rOkq4+rQ25x/6ZxLPoScxR7ahIoeBvGyotDlqk=
X-Google-Smtp-Source: ABdhPJzBQr4cCrV9FYymrKziIWFZGf5dUDO7l6xqeJLsbmrvu8IBcW8mfvvLOQUJJ08+QHFvbvhPviqYi/2FfG2wmnU=
X-Received: by 2002:ac5:c76e:: with SMTP id c14mr43659241vkn.60.1594212303874;
 Wed, 08 Jul 2020 05:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <f3a4c488-a5bb-8698-dddb-7ab9cfc0f304@amd.com>
In-Reply-To: <f3a4c488-a5bb-8698-dddb-7ab9cfc0f304@amd.com>
From:   Jun Li <lijun.kernel@gmail.com>
Date:   Wed, 8 Jul 2020 20:44:52 +0800
Message-ID: <CAKgpwJW6PwLAHUjas6_g-PLPL1upXK-+BKVfxwfAqiQCzRRVuw@mail.gmail.com>
Subject: Re: Role Switch Driver on DWC3
To:     "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Shah, Nehal-bakulchandra <nehal-bakulchandra.shah@amd.com>
=E4=BA=8E2020=E5=B9=B47=E6=9C=888=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=
=8D=887:44=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> As per my understanding, role switch interface for DWC3 controller will b=
e called in dwc3_drd_init.
>
> However, dwc3_drd_init is called only if mode is USB_DR_MODE_OTG. However=
 for USB3 V3.3 and above the following code exists.
>
> /*
>          * DWC_usb31 and DWC_usb3 v3.30a and higher do not support OTG
>          * mode. If the controller supports DRD but the dr_mode is not
>          * specified or set to OTG, then set the mode to peripheral.
>          */
>         if (mode =3D=3D USB_DR_MODE_OTG &&
>             dwc->revision >=3D DWC3_REVISION_330A)
>             mode =3D USB_DR_MODE_PERIPHERAL;
>     }
>
> Hence, in this case role switch interface will never will be called.
>
>
> Please clear my understanding, and in such case how can i use the role sw=
itch driver?

This has been changed by below commit:

commit 8bb14308a86970a2321ac7d0e28ea0f1f1e744b0
Author: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Date:   Sun Mar 29 17:10:05 2020 -0700

    usb: dwc3: core: Use role-switch default dr_mode

    If the driver is configured to use DRD role-switch, let the drd code
    path decide the default dr_mode.

    Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
    Signed-off-by: Felipe Balbi <balbi@kernel.org>

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 7046c68..ab6323b 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -85,6 +85,8 @@ static int dwc3_get_dr_mode(struct dwc3 *dwc)
                 * specified or set to OTG, then set the mode to peripheral=
.
                 */
                if (mode =3D=3D USB_DR_MODE_OTG &&
+                   (!IS_ENABLED(CONFIG_USB_ROLE_SWITCH) ||
+                    !device_property_read_bool(dwc->dev, "usb-role-switch"=
)) &&
                    dwc->revision >=3D DWC3_REVISION_330A)
                        mode =3D USB_DR_MODE_PERIPHERAL;
        }

>
>
> Regards
>
> Nehal Shah
>
>
