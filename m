Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90462432F06
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 09:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234432AbhJSHNu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 03:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234434AbhJSHNs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Oct 2021 03:13:48 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5294C06161C
        for <linux-usb@vger.kernel.org>; Tue, 19 Oct 2021 00:11:35 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id g8so4339322ljn.4
        for <linux-usb@vger.kernel.org>; Tue, 19 Oct 2021 00:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J85JL+/VSW+nK4uNwNqj4OCNT7753VwCkAIsTngPh24=;
        b=N9MLowMG2TNYj6G4HUfpSrOIJCEgTWw6DRQoepsheqXkZNg30p0Pgr5C07Qj0452kh
         fhapkXOWHltP804R68KRd3JneXBysctfGMrCrwrS3Tw47CHbHrd406b83y/kU2OX70dK
         dp5x51C/GoE00yf4b/E/7gKn8oUJ45khWB2tSj6Jx0Id4vvYBf1X6LsngL8XGIuJS9RL
         nqxDi1JEgwtDii9w6nASRoex5PdqGU6HJKKrVdU11N4eLXIGfQQb2mvEuCERPJdzmDrz
         +dL0Q6gmvt+FMHzxu1w3zwwnrepzMzyDRFfKp+3u2xQdQOPsnarKblXCg6lLqAIOjNhw
         30Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J85JL+/VSW+nK4uNwNqj4OCNT7753VwCkAIsTngPh24=;
        b=QXDQ+1SBV+/jwDG3GPjp6fmlqNY1McvB2amf1XGttnaTRhGJlYMOnIz1VZO8pIxtwQ
         OH4m+Jkys8ZQoR4BuEIYQyu1MWgKy/h5YuFSb6dSc0ZU68PSp6b5y/wwTIvBWt+SVLW1
         u8aU5GU1QrdneB2y6ivkdkSRk2fpLeSGrzpN+j8QrnzQzwNjiZSsvST9A6rj2NugA9W3
         Av3a/e+6zt/NjFmIHLbwovufV69Aiu81m7cCJ+U1rjZj5wbIee9ALo6XiQrE7is9yTum
         /ay3lWpPNdixfSUt8U1Q3ssh8TrRavrswzv7SVL/19aTskskhyfr/MmxovwvUh3I9H3b
         dgwA==
X-Gm-Message-State: AOAM5304DIoSPPrxDa5h+Oo4pEIWijNDPNJBDP3iivIvXK7jHGFxgUan
        N0a5oKK4fKwHF8MiBIkA4x/2WgqNH7Dqtibn6Q==
X-Google-Smtp-Source: ABdhPJzR4ybVprwe9DSid6limi9BrI+hJg86nKlWxNwvaZs7WSG8NppoInnb1ndw6/NlB6h2t6u8JkQyEcqTh6OU5YY=
X-Received: by 2002:a2e:bd86:: with SMTP id o6mr5033663ljq.221.1634627494001;
 Tue, 19 Oct 2021 00:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211018183930.8448-1-s.shtylyov@omp.ru> <20211018183930.8448-4-s.shtylyov@omp.ru>
In-Reply-To: <20211018183930.8448-4-s.shtylyov@omp.ru>
From:   Avi Fishman <avifishman70@gmail.com>
Date:   Tue, 19 Oct 2021 10:11:23 +0300
Message-ID: <CAKKbWA4=ddbFpqoPw_pKNUs_jZKgttVQkTGQgzj4ThbMc5BQAg@mail.gmail.com>
Subject: Re: [PATCH 03/22] usb: host: ehci-npcm7xx: deny IRQ0
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 18, 2021 at 9:39 PM Sergey Shtylyov <s.shtylyov@omp.ru> wrote:
>
> If platform_get_irq() returns IRQ0 (considered invalid according to Linus)
> the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no IRQ
> at all. Deny IRQ0 right away, returning -EINVAL from the probe() method...
>
> Fixes: df44831ee2dd ("USB host: Add USB ehci support for nuvoton npcm7xx platform")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> ---
>  drivers/usb/host/ehci-npcm7xx.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/usb/host/ehci-npcm7xx.c b/drivers/usb/host/ehci-npcm7xx.c
> index 6b5a7a873e01..aff3d906ced5 100644
> --- a/drivers/usb/host/ehci-npcm7xx.c
> +++ b/drivers/usb/host/ehci-npcm7xx.c
> @@ -114,6 +114,10 @@ static int npcm7xx_ehci_hcd_drv_probe(struct platform_device *pdev)
>                 retval = irq;
>                 goto fail;
>         }
> +       if (!irq) {
> +               retval = -EINVAL;
> +               goto fail;
> +       }
>
>         /*
>          * Right now device-tree probed devices don't get dma_mask set.
> --
> 2.26.3
>
Reviewed-by: Avi Fishman <avifishman70@gmail.com>

--
Regards,
Avi
