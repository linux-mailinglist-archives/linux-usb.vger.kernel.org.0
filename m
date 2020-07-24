Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE6022BE0C
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 08:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgGXGZJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 02:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgGXGZJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 02:25:09 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5CCBC0619D3
        for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2020 23:25:07 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id i138so459628ild.9
        for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2020 23:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8ZmnNsZGGuAd2/k6md6so4WM+fbeibAXvBq/Ysx+2xQ=;
        b=ofkCUVpTuWisy4m4bIbi5nkw0XB61gAf8LozYjTJq7qAYL4SWR103VvkGbDx58SuU7
         0TFz8EZnNMJXs8+pbZBpVThnWVgRrXdNXVwBzhwE1SvPE4dEzDAs5Q0r3y9ma2yLRo/F
         IKe9l/kn69XSDfpZAprmJF+Ffp7Ilfn3I3YrsewqReBBOng8Z7d980fxHQgehxZIWOLM
         tFL76PSv3kNP7Rx05yy2Kp4Bb5UuvsuRZ9RGv6111ueMY1qTXxXhSYKA2eI2jx3NHhfY
         ovQirWvy1PZMyxubxiqDO/Ysn2mlguRnmuBcrKo22HrwsrsDEXhkuEimMj07IqVY19eP
         CLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8ZmnNsZGGuAd2/k6md6so4WM+fbeibAXvBq/Ysx+2xQ=;
        b=ApZuqnG5b2ZYQ+5IU3O8IVVlIxnNcO6gef4jZDjGbRTfmO7AyZ/V3cSFucfJ+Nfjr6
         YJO6HAOfBtnrkHxTJVYimwC/Rk2qk9Xt4sYBVw89xqHuoIiSkgSJJkvDSGPzXrpSm/di
         //L0tXYFsK0GO29rRUja6npgJTia/46v/c8sPvYCt5VYL1DF8ibBFWvJwLb/EiT67n3O
         2RKV2zJczIslQ2BKtkHvxMNfLJW6NCqlN/Lob2EmylPTSoBuvLUb1CeWeNpOzsmQjn9O
         pbr2b+C4tKUXpFj15ts+M8g8nekM9HQj8oVvgNyZ7BnvTdn5ECvZ9PO0TxdE090tV4SQ
         qlCg==
X-Gm-Message-State: AOAM533pqb5kOYBcmV37FaXqrw697826MsVEld0K9HakQTyZUgB2UCiw
        mATtW5MXiSbMsiDQqXqdIYKmL2ChLpMU34pbqRA=
X-Google-Smtp-Source: ABdhPJwJrNtebQxnDVVpbqKluW3RuKMCxCI6Dc2bLdMT4E/MvQOc8ae/VIT8eL2EDI2eE2PBIZj8WR7okQ9k476Qu20=
X-Received: by 2002:a92:290a:: with SMTP id l10mr9190670ilg.204.1595571907079;
 Thu, 23 Jul 2020 23:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200707074941.28078-1-peter.chen@nxp.com> <20200707074941.28078-8-peter.chen@nxp.com>
In-Reply-To: <20200707074941.28078-8-peter.chen@nxp.com>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Fri, 24 Jul 2020 14:24:55 +0800
Message-ID: <CAL411-o=LVJijn3_26tCfVXppaQQncZxf__4AGPjdqdK_A=1kw@mail.gmail.com>
Subject: Re: [PATCH v5 7/9] usb: host: xhci-plat: add priv quirk for skip PHY initialization
To:     Peter Chen <peter.chen@nxp.com>, mathias.nyman@intel.com
Cc:     balbi@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>, linux-imx@nxp.com,
        pawell@cadence.com, rogerq@ti.com, jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 7, 2020 at 3:52 PM Peter Chen <peter.chen@nxp.com> wrote:
>
> Some DRD controllers (eg, dwc3 & cdns3) have PHY management at
> their own driver to cover both device and host mode, so add one
> priv quirk for such users to skip PHY management from HCD core.
>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>

Hi Mathias,

Ping...

Other xhci patches in this series are acked by you.

Peter
> ---
>  drivers/usb/host/xhci-plat.c | 8 ++++++--
>  drivers/usb/host/xhci.h      | 1 +
>  2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 03d6bbe51919..cebe24ec80a5 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -183,6 +183,8 @@ static int xhci_plat_probe(struct platform_device *pdev)
>         struct usb_hcd          *hcd;
>         int                     ret;
>         int                     irq;
> +       struct xhci_plat_priv   *priv = NULL;
> +
>
>         if (usb_disabled())
>                 return -ENODEV;
> @@ -280,8 +282,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
>                 priv_match = dev_get_platdata(&pdev->dev);
>
>         if (priv_match) {
> -               struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
> -
> +               priv = hcd_to_xhci_priv(hcd);
>                 /* Just copy data for now */
>                 *priv = *priv_match;
>         }
> @@ -329,6 +330,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
>
>         hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
>         xhci->shared_hcd->tpl_support = hcd->tpl_support;
> +       if (priv && (priv->quirks & XHCI_SKIP_PHY_INIT))
> +               hcd->skip_phy_initialization = 1;
> +
>         ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
>         if (ret)
>                 goto disable_usb_phy;
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index c295e8a7f5ae..07d71fec18d5 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1874,6 +1874,7 @@ struct xhci_hcd {
>  #define XHCI_RESET_PLL_ON_DISCONNECT   BIT_ULL(34)
>  #define XHCI_SNPS_BROKEN_SUSPEND    BIT_ULL(35)
>  #define XHCI_RENESAS_FW_QUIRK  BIT_ULL(36)
> +#define XHCI_SKIP_PHY_INIT     BIT_ULL(37)
>
>         unsigned int            num_active_eps;
>         unsigned int            limit_active_eps;
> --
> 2.17.1
>
