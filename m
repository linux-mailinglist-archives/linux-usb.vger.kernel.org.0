Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA59D25EC
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2019 11:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733249AbfJJJIL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Oct 2019 05:08:11 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:34472 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733119AbfJJJIL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Oct 2019 05:08:11 -0400
Received: by mail-qk1-f196.google.com with SMTP id q203so4931799qke.1
        for <linux-usb@vger.kernel.org>; Thu, 10 Oct 2019 02:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xx/5ivC8+wB4MKu4yR0Ppryr6BtLEmc7x2YuwNcfbiU=;
        b=aXFXLXf9WNQKvFcjlU5MlohqPWQ9c1GEapMUp8kn9Ji0Nf0Y2DalUZ21YIV5w9Yoek
         jS5WJkBJ73QscZEwUM1J3bb+pqYpmN6gNG+8hziyOILEc/Cv2klTVlREuWhXT94Mgm7+
         7xvF6ObloyQdvyA9Vj0umU7uNASrYs6sHJAp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xx/5ivC8+wB4MKu4yR0Ppryr6BtLEmc7x2YuwNcfbiU=;
        b=Buqx8tyMSwms/DLi6tcuiyRBAZ5eVEUiOpAU/VKtq/PqXup2CwlRuRGfNshZb+Supd
         vMjRuBRTugtDcbvY9MA9QnxzbabB9T3/981T4CbarXmvioW26lW2u6viruiN5GUw9bG4
         1E9sQmzXnqBwnWBRrzs+6OjpJB5piWPBFgw74siCOrZjL1VjYwYLtqLL7dMoyTp1FS9f
         cvD1FFEuXvY9XcaFD1tFAO8ncK1hwI3Ks/XPFkrb636xs4F9gwohie48TUk5kTw6rOLd
         icK6fS2v9u6H1kz2UYa6Eofm5EtbrT5tb886C/QZ8tn9LgaPnk3LmBPhXyb2RhzuMW3d
         RBeg==
X-Gm-Message-State: APjAAAUyjG0y5w/RYcYA2x8u0VhnEKO/xMiZ1hMr1DN9qnXP5hpEHZuc
        u0BftwvJSZU5JfVYX5CeoWzHvBrD4GG2AAa8ZwG9gQ==
X-Google-Smtp-Source: APXvYqzwoJTTh6/AyzHZ9HDk0OjkJqyS/iSBZyH2/vPu+Dl7wuQU45eTBfY0lkl/AHWiFgvhaZ9+YLGWn+ZXBdZQ++A=
X-Received: by 2002:a37:342:: with SMTP id 63mr8915746qkd.144.1570698489815;
 Thu, 10 Oct 2019 02:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191010075004.192818-1-tfiga@chromium.org>
In-Reply-To: <20191010075004.192818-1-tfiga@chromium.org>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Thu, 10 Oct 2019 17:07:58 +0800
Message-ID: <CANMq1KAA+nqcOqiE_g=vA8DC=_t=FqSRtR5kk=1XqSsgZGj+_A@mail.gmail.com>
Subject: Re: [PATCH] usb: mtk-xhci: Set the XHCI_NO_64BIT_SUPPORT quirk
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Changqi Hu <Changqi.Hu@mediatek.com>,
        Shik Chen <shik@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 10, 2019 at 3:50 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> MediaTek XHCI host controller does not support 64-bit addressing despite
> the AC64 bit of HCCPARAMS1 register being set. The platform-specific
> glue sets the DMA mask to 32 bits on its own, but it has no effect,
> because xhci_gen_setup() overrides it according to hardware
> capabilities.
>
> Use the XHCI_NO_64BIT_SUPPORT quirk to tell the XHCI core to force
> 32-bit DMA mask instead.
>
> Signed-off-by: Tomasz Figa <tfiga@chromium.org>

Can we add a Fixes: tag for stable backports?
(after addressing the other comments of course)


> ---
>  drivers/usb/host/xhci-mtk.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index b18a6baef204a..4d101d52cc11b 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -395,6 +395,11 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
>         xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
>         if (mtk->lpm_support)
>                 xhci->quirks |= XHCI_LPM_SUPPORT;
> +       /*
> +        * MTK host controller does not support 64-bit addressing, despite
> +        * having the AC64 bit of the HCCPARAMS1 register set.
> +        */
> +       xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
>  }
>
>  /* called during probe() after chip reset completes */
> @@ -488,11 +493,6 @@ static int xhci_mtk_probe(struct platform_device *pdev)
>                 goto disable_clk;
>         }
>
> -       /* Initialize dma_mask and coherent_dma_mask to 32-bits */
> -       ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> -       if (ret)
> -               goto disable_clk;
> -
>         hcd = usb_create_hcd(driver, dev, dev_name(dev));
>         if (!hcd) {
>                 ret = -ENOMEM;
> --
> 2.23.0.581.g78d2f28ef7-goog
>
