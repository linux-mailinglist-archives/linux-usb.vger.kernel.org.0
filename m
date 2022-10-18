Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0816960276B
	for <lists+linux-usb@lfdr.de>; Tue, 18 Oct 2022 10:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbiJRIq1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Oct 2022 04:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbiJRIqW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Oct 2022 04:46:22 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03D742BB2B;
        Tue, 18 Oct 2022 01:46:21 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id y14so30459602ejd.9;
        Tue, 18 Oct 2022 01:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cBEpAZ8u+cLxnVIWQwh63bAL8hSlpMw5zsCsErqnMis=;
        b=d4EH9EjOR3M7I85mmc7OfHIEffLhnHcCH2+lV5fq1JPytxo9dLK/Xpg748WSPgf9y1
         2F70P9dAbw1RJMd0e3CuIzOEBZSiGFwDpwiiG4pXbbxJYRDRxgLQsyUxwrhioL5IpG1B
         /dVStnPQ4j4Yo6+Y6LNqXaQROmTRoU+X9ZwuVrIKBjmJNvzWDfBBhE6KBI74JSnizaD7
         7YS1BGOA9NMQxWTO/jifMxHdeu4aLoaTYeO3V5Dud75pA/xOcoFcJLVlbz8ni9HlTwvE
         HvyRTx1/Zx7MW/agHuYNTnnW1zq5/YeFzRnaiINVxng2KoNXOS4G5OfLJoA2MIAJDDvn
         KK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cBEpAZ8u+cLxnVIWQwh63bAL8hSlpMw5zsCsErqnMis=;
        b=YXGUYuhEQE6VfkgXtIQZ4SaCPfJKAb+F/Rx1vInxxXnm8SEkF7y2rSOJU9BftCdrmu
         IHM1euQs8rVL/IAodGiySlEeDlYl59/COP4P3MeAbJ+5wVyPaZReJT9s4u9VQCnlf0vi
         RwijAltMYhQ7viKriBhBQt61w4LLNT51+NNh34Le/kF6suLeAQSWRfOBtsz6hhHHtwn/
         RxY9CiNq2ozoveAVO3a1K+KahP9s6ULD8NnS9VckcMrEbcq7j0u3bZrwh6UpknUS8qhm
         6btMveNdsG6w7ZcDF0PKr8BtVku+x6CAFHkxGLfvRHZsFtT2jvpqEw6ud8T1DxQ6Bgwx
         9Tvg==
X-Gm-Message-State: ACrzQf1gCKSiSmKmqyerpjrrOyxmFtGpbfRiDBnayhBOnzVylPO8kMxb
        Dr7yF2/J0Ofpr8ZzFcTTmSeHc4onxLcxKFlsylA=
X-Google-Smtp-Source: AMsMyM6iTKY1+yk6/XfXi1s8MNvmVBbncsDEwpYDehiBavJGwb4vgWqA7UHxCgKR5NgY18H/Upzi4G3Zvt/Tqy4m60w=
X-Received: by 2002:a17:907:980e:b0:78d:b6ea:25b3 with SMTP id
 ji14-20020a170907980e00b0078db6ea25b3mr1543486ejc.98.1666082778757; Tue, 18
 Oct 2022 01:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221011082924.884123-1-s.hauer@pengutronix.de> <20221011082924.884123-3-s.hauer@pengutronix.de>
In-Reply-To: <20221011082924.884123-3-s.hauer@pengutronix.de>
From:   Xu Yang <xu.yang.nxp@gmail.com>
Date:   Tue, 18 Oct 2022 16:46:07 +0800
Message-ID: <CAE+6oSwcSgom3_gdhy9QERf7TOjnJbCwMyiz58sSWTVvOh4diA@mail.gmail.com>
Subject: Re: [PATCH 2/6] usb: chipidea: usbmisc_imx: Fix setting i.MX6SX
 wakeup source
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Peter Chen <peter.chen@kernel.org>,
        Peng Fan <peng.fan@oss.nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        devicetree@vger.kernel.org, jun.li@nxp.com,
        Xu Yang <xu.yang_2@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 11, 2022 at 4:41 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>
> MX6SX_USB_VBUS_WAKEUP_SOURCE are two bits containing an enum value,
> so when read/modify/write that we have to clear both bits bits before
> setting the desired bits. The clearing of the bits was forgotten, add
> it.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by: Xu Yang <xu.yang_2@nxp.com>

Thanks,
Xu Yang

> ---
>  drivers/usb/chipidea/usbmisc_imx.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index 8f805aa9c383c..e1b4b7f9b3f31 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -551,6 +551,7 @@ static int usbmisc_imx6sx_init(struct imx_usbmisc_data *data)
>                 spin_lock_irqsave(&usbmisc->lock, flags);
>                 /* Set vbus wakeup source as bvalid */
>                 val = readl(reg);
> +               val &= ~MX6SX_USB_VBUS_WAKEUP_SOURCE(3);
>                 writel(val | MX6SX_USB_VBUS_WAKEUP_SOURCE_BVALID, reg);
>                 /*
>                  * Disable dp/dm wakeup in device mode when vbus is
> --
> 2.30.2
>
