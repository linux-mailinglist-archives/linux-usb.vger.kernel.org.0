Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6461BD42A
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 07:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgD2FqN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 01:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbgD2FqM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Apr 2020 01:46:12 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 969C8C03C1AC
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2020 22:46:12 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id o135so867366qke.6
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2020 22:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=z6P3Px4RUsQGpCsP0tLcahroG5Q7PAYgk++UN9Efoaw=;
        b=QKBgOWhXO0CGqmIPgmrY/waFwwJCD1tMEsHj/0+i4Yksqe4nRqI9ez82ompbl4Znkt
         R75KhHsT+uL4Mb/QXMcentByrET3RCOnXsUuIyfA0S0Q6cTjIqlSXYv+4O+StaNST7Sr
         ByBO3ho9QnYrSomRn0ge+mt3rNN9oM5M5WREw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=z6P3Px4RUsQGpCsP0tLcahroG5Q7PAYgk++UN9Efoaw=;
        b=CWtlbFDYTwfZl7DD5KhfHfoyc8zZUUP8UC0+DjfpR99Yi3LtGjiOieH83Eaj23JMlQ
         SfCJ+rSPV18PNmer2KKI0z4StupTNXDNrYPRE8FHUGkCcQPErorwk6ahFnD+bD6kyOut
         1TP90umi8vHO3kqhqkE6gSCzAP/s1h026Kfkm6giE4f0Tjy8Fwq0kvCCT9XdC5FIlqhI
         NZUcxgaVjWNHfFfDZYbktuoCPsjZ7KOjBVx5tk/y7x0efxF0al1Rn2qUl6dvoTIpW30k
         y0xz/XFSZCpRu3QxPAl2G8adlZe+GL0y9NGADREQ73l0kEACRuO44iMzm3wFw8cLyCDY
         zgjQ==
X-Gm-Message-State: AGi0PuZnsrr2WV/RYzuJj9FNRTzeBdK8hZa1ZnD7pSMTf8qxx3lvd45J
        z6eOj8vdlhj4rgFdITYd5Aoe4KDGhkF5dE69dyBOWw==
X-Google-Smtp-Source: APiQypK60pdEJh5Y5blGk+UcYQ0UpsJDO7M+MfFFuZSKu+VULMZ67IsZJHyhKEZjZ8OnqsEQng7a6fxdrUIP3BnEcjU=
X-Received: by 2002:a05:620a:7f6:: with SMTP id k22mr19884854qkk.180.1588139171615;
 Tue, 28 Apr 2020 22:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200429053319.113508-1-pmalani@chromium.org>
In-Reply-To: <20200429053319.113508-1-pmalani@chromium.org>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Tue, 28 Apr 2020 22:45:59 -0700
Message-ID: <CACeCKaesd4tbHEfM+dX=cjRMAkWEwYtqF-d7D2vvjOsECfsb1w@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: mux: intel: Handle alt mode HPD_LVL
To:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Benson Leung <bleung@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Sorry, didn't compose the Commit message quite right, have sent out v2.

Thanks,

On Tue, Apr 28, 2020 at 10:34 PM Prashant Malani <pmalani@chromium.org> wro=
te:
>
> According to the PMC Type C Subsystem (TCSS) Mux programming guide rev
> 0.6, when a device is transitioning to DP Alternate Mode state, if the
> HPD_LVL in the status update command VDO is set, the HPD_HIGH field in
> the Alternate Mode request =E2=80=9Cmode_data=E2=80=9D field (bit 14) sho=
uld also be
> set. Ensure the bit is correctly handled while issuing the Alternate
> Mode request.
>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> Fixes: 6701adfa9693 ("usb: typec: driver for Intel PMC mux control")
> ---
>  drivers/usb/typec/mux/intel_pmc_mux.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mu=
x/intel_pmc_mux.c
> index f5c5e0aef66f..c599112559e7 100644
> --- a/drivers/usb/typec/mux/intel_pmc_mux.c
> +++ b/drivers/usb/typec/mux/intel_pmc_mux.c
> @@ -157,6 +157,10 @@ pmc_usb_mux_dp(struct pmc_usb_port *port, struct typ=
ec_mux_state *state)
>         req.mode_data |=3D (state->mode - TYPEC_STATE_MODAL) <<
>                          PMC_USB_ALTMODE_DP_MODE_SHIFT;
>
> +       if (data->status & DP_STATUS_HPD_STATE)
> +               req.mode_data |=3D PMC_USB_DP_HPD_LVL <<
> +                                PMC_USB_ALTMODE_DP_MODE_SHIFT;
> +
>         return pmc_usb_command(port, (void *)&req, sizeof(req));
>  }
>
> --
> 2.26.2.303.gf8c07b1a785-goog
>
