Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4C593A22D4
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 05:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbhFJDfi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Jun 2021 23:35:38 -0400
Received: from mail-pf1-f172.google.com ([209.85.210.172]:43808 "EHLO
        mail-pf1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbhFJDfh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Jun 2021 23:35:37 -0400
Received: by mail-pf1-f172.google.com with SMTP id m7so432190pfa.10
        for <linux-usb@vger.kernel.org>; Wed, 09 Jun 2021 20:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xUW1QYivvyjjAgnt50OixHHdXR+qpa5RaoXkpg+0Z1M=;
        b=Ckk34yOiLznSSdYmHluvlvw2OSugkHIAcSI40L06ddrl1WVeu9lXyJKAySZr7I/6lx
         L836XZ32h5BAbCgwQE46EsuxXnQxKGyeSqwD00a0X8Jl9oP+RTO3Mi8P+NnpJGUSpbSN
         7UB4hKaHAkMX/VHG9tiyztZzgqJ5TWFOxM0D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xUW1QYivvyjjAgnt50OixHHdXR+qpa5RaoXkpg+0Z1M=;
        b=kXMOJ/oeU3ehsKhpyl3TE9K2uU2HS3PvGhRjn9FRQRIDWtf3GYeTReM/csEiwEz7nB
         q8XvmuWPKAYqVkh197p80B1BvERforcSVJaMqcmt7x7oBs+tIj2sspyCqybGZXUFKP02
         9Z/iyddYFIz9ypCeq2+qhVQPMLi2lmGI1yMUhetHfRrFzrlhs/lKisAe9CQm7vw0eHBe
         ccY/rA1sE7ApN6emgMeVFpNGWTD79qQ6AIj08idfPaD5XUNaIq6mieFlNBwkAPmwC0bj
         lRUknxrymFIzH5/dcCveNTXWFh8WZE7L97+osWonw8nk9xjbb50DFfLn/CU+YTMJ5gJT
         v40Q==
X-Gm-Message-State: AOAM533XQ5GKaertg/kEPMlq/lI0B8lTV4yBz7ldkTkKWQR+L02NIx2r
        Y9Lxo/TATguXru9l/yWVB/4PCVc1CU0pJpUMy7uIkQ==
X-Google-Smtp-Source: ABdhPJwe3SJDAt53Ax1wi7DIEJ7gvGIkAxJ9U/9K0Mhis4k/681JzWIKUxqMMmr9kGyLMHjJbzCsDbc5afgxvWOYbpg=
X-Received: by 2002:a63:5d19:: with SMTP id r25mr2802205pgb.317.1623295948478;
 Wed, 09 Jun 2021 20:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210507021127.54717-1-chunfeng.yun@mediatek.com> <20210507021127.54717-2-chunfeng.yun@mediatek.com>
In-Reply-To: <20210507021127.54717-2-chunfeng.yun@mediatek.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Thu, 10 Jun 2021 11:32:17 +0800
Message-ID: <CAATdQgAr=wwbuJ=0nKKmO6Rb7qcW2BobFAb30DUsMA2s6EOxhA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] usb: xhci-mtk: remove unnecessary setting of has_ippc
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-usb@vger.kernel.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Eddie Hung <eddie.hung@mediatek.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 7, 2021 at 10:11 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> Due to @has_ippc's default value is 0, no need set it again if fail
> to get ippc base address
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-and-Tested-by: Ikjoon Jang <ikjn@chromium.org>

> ---
> v3: new patch suggested by Greg
>     fix typo suggested by Sergei
> ---
>  drivers/usb/host/xhci-mtk.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index b2058b3bc834..2548976bcf05 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -495,8 +495,6 @@ static int xhci_mtk_probe(struct platform_device *pdev)
>                         goto put_usb2_hcd;
>                 }
>                 mtk->has_ippc = true;
> -       } else {
> -               mtk->has_ippc = false;
>         }
>
>         device_init_wakeup(dev, true);
> --
> 2.18.0
>
