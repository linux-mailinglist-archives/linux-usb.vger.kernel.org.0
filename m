Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E39D62823B7
	for <lists+linux-usb@lfdr.de>; Sat,  3 Oct 2020 12:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgJCK5W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 3 Oct 2020 06:57:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:43102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725767AbgJCK5V (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 3 Oct 2020 06:57:21 -0400
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 184F2208A9;
        Sat,  3 Oct 2020 10:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601722641;
        bh=C/cuUPZIyzy7WtbuHvTfb7Y59oEpz+zrePo7LMdpri0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WNJMWnoUIl5UIOmpK2udK2e4/7oZbAjMBZgAL0WMViecYu7xWvEUcBenwQBqYL9Eb
         drXoVF1Ug0TP5LZOIh1dtPHRuk7aRfrvfMCiem1e1cXy/VnFXe1nBN+HpZevMWCLwO
         mFtAdEQimf+CHhJQ581jfjUhW1c4vsOoNaEVw0ew=
Received: by mail-ed1-f54.google.com with SMTP id 33so4502083edq.13;
        Sat, 03 Oct 2020 03:57:21 -0700 (PDT)
X-Gm-Message-State: AOAM533rzGqnpt9uRnmXvoAnZ7t1Rd/2ZbO3X6hMuK9ax9VPnOoJk3Ii
        eKO1nWanzLWjjtkhgZivIRPrSdJ/04TCullLdoM=
X-Google-Smtp-Source: ABdhPJwnTLcP1Kd0m2CUZbe9H/1DV7Gd+YsTVZojRCaENerEwu4Ft5a91UT30YK1qbyxTRWUA5zyJcHcb5NvE9kns1s=
X-Received: by 2002:a50:d0d0:: with SMTP id g16mr1956430edf.18.1601722639642;
 Sat, 03 Oct 2020 03:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <1601656238-22232-1-git-send-email-jun.li@nxp.com> <1601656238-22232-2-git-send-email-jun.li@nxp.com>
In-Reply-To: <1601656238-22232-2-git-send-email-jun.li@nxp.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Sat, 3 Oct 2020 12:57:08 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcoCR7FKe234bDeVvGUpwwOdBv=mb42_NbEXtUc1MLpHA@mail.gmail.com>
Message-ID: <CAJKOXPcoCR7FKe234bDeVvGUpwwOdBv=mb42_NbEXtUc1MLpHA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: usb: dwc3-imx8mp: add imx8mp dwc3
 glue bindings
To:     Li Jun <jun.li@nxp.com>
Cc:     robh+dt@kernel.org, shawnguo@kernel.org, balbi@kernel.org,
        mathias.nyman@intel.com, gregkh@linuxfoundation.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, Anson.Huang@nxp.com, aisheng.dong@nxp.com,
        peng.fan@nxp.com, fugang.duan@nxp.com, horia.geanta@nxp.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2 Oct 2020 at 18:35, Li Jun <jun.li@nxp.com> wrote:
>
> NXP imx8mp integrates 2 dwc3 3.30b IP and add some wakeup logic
> to support low power mode, the glue layer is for this wakeup
> functionality, which has a separated interrupt, can support
> wakeup from U3 and connect events for host, and vbus wakeup for
> device.
>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   | 106 +++++++++++++++++++++
>  1 file changed, 106 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
> new file mode 100644
> index 0000000..c16c94c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
> @@ -0,0 +1,106 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2020 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/fsl,imx8mp-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP iMX8MP Soc USB Controller
> +
> +maintainers:
> +  - Li Jun <jun.li@nxp.com>
> +
> +properties:
> +  compatible:
> +    items:
> +    - const: fsl,imx8mp-dwc3

The same comment as for v3.

Best regards,
Krzysztof
