Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11A62602728
	for <lists+linux-usb@lfdr.de>; Tue, 18 Oct 2022 10:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbiJRIj1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Oct 2022 04:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbiJRIj0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Oct 2022 04:39:26 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 388A4318;
        Tue, 18 Oct 2022 01:39:20 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id t16so180284edd.2;
        Tue, 18 Oct 2022 01:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fHP+hUABoqbczkdkQv954GoLTJ0unGS3AyUuTj12qFk=;
        b=XAfL97bsm88PgYE3c5WlusQw9WaO6D2RdA1/i6tfhuRvoWajOqbLhZ/uniR9fDzexv
         lUpzALBmJrCMt2DF202p3y2VtmpqK25b+s3aGsJEJzCZrmMNDa6U80PUcVIdKRSDNn4G
         ONysjVvVTZ3PbnE4XlPbOKWoksl/ATmYrGftK3Q34iPtQ72ebnfWzgiqGgKBErch1K2A
         j1eKjW7M1HnOrkYDEPNxfTWA9s+owPawRLROzfeUYcSCMIbXzMSYHANwxinpyUa1geMt
         uCdVJOzfVfqAasq81F29pzjzUYQvoCO1QZqx+2orVmI1l0aVssEm32+eUb9vZmiZFXih
         DmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fHP+hUABoqbczkdkQv954GoLTJ0unGS3AyUuTj12qFk=;
        b=VGV57ynW9c9aE3g/u67oV2OnkUOaEyQbm+ESKbTOIkhjKapEf4PR87MhsZrXYf16Zt
         ABUDPCAqpigCB4+TMy0wpebairFJdyllDaWVCsGFBTEP4IX5Acx8LLS7LKGeMlNAo2Db
         rUWH/Xr8eV/TAgYEXkvF7oZjgt/et4kIAgtdn8f+9g37riYqkk9f9X7MPoPx/Ad4l9IK
         RKwKEdQ7XhrT/tZXiJeE4i9HrP9+paz5f6sUOoRQWjNZSPzgz3LG3p3VSPYLerAuTXy/
         ZBUtD8097EK1ug0dPKil8+cOen24RmDLKV0fEBaoe6/8ahT2XEY+5FC881xqTrYitULy
         k1Rw==
X-Gm-Message-State: ACrzQf2hYUPM+VRIxOWfFfSe8F5bHjxaGNywIRbSTKqiYWrhtGC1krMb
        dIP3n6/7MN6a+KiTbJ1/i3yreKiCbkmyNlBOpEE=
X-Google-Smtp-Source: AMsMyM43QxSxq/immmcMfLPfwQNuPSod3/StyOuHNcrMMdysZopRYU4PBWDqDvZrpYDri9BkHezMEkIWmyZr0vkCF3Y=
X-Received: by 2002:a05:6402:148a:b0:459:2eab:9b0a with SMTP id
 e10-20020a056402148a00b004592eab9b0amr1581965edv.139.1666082358695; Tue, 18
 Oct 2022 01:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221011082924.884123-1-s.hauer@pengutronix.de> <20221011082924.884123-4-s.hauer@pengutronix.de>
In-Reply-To: <20221011082924.884123-4-s.hauer@pengutronix.de>
From:   xu yang <xu.yang.nxp@gmail.com>
Date:   Tue, 18 Oct 2022 16:39:07 +0800
Message-ID: <CAE+6oSw-JFWijVy14POJhV7oxuni7g7qSSdNCPCBP5fA8sPRBg@mail.gmail.com>
Subject: Re: [PATCH 3/6] usb: chipidea: usbmisc_imx: Use GENMASK/FIELD_PREP
 for bitfields
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Peter Chen <peter.chen@kernel.org>,
        Peng Fan <peng.fan@oss.nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        devicetree@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>,
        jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Sascha,

On Tue, Oct 11, 2022 at 4:55 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>
> GENMASK and FIELD_PREP offer a convenient unified way to manipulate
> bitfields in registers without having to define mask and shift
> separately. Broaden the use of this mechanism by converting usbmisc_imx
> over to it. No functional change intended.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/usb/chipidea/usbmisc_imx.c | 116 +++++++++++++++--------------
>  1 file changed, 59 insertions(+), 57 deletions(-)
>
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index e1b4b7f9b3f31..95f2ba01c0df1 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -9,24 +9,23 @@
>  #include <linux/io.h>
>  #include <linux/delay.h>
>  #include <linux/usb/otg.h>
> +#include <linux/bits.h>
> +#include <linux/bitfield.h>
>
>  #include "ci_hdrc_imx.h"
>
>  #define MX25_USB_PHY_CTRL_OFFSET       0x08
>  #define MX25_BM_EXTERNAL_VBUS_DIVIDER  BIT(23)
>
> -#define MX25_EHCI_INTERFACE_SINGLE_UNI (2 << 0)
> -#define MX25_EHCI_INTERFACE_DIFF_UNI   (0 << 0)
> -#define MX25_EHCI_INTERFACE_MASK       (0xf)
> +#define MX25_EHCI_INTERFACE_SINGLE_UNI 2
> +#define MX25_EHCI_INTERFACE_DIFF_UNI   0
>
> -#define MX25_OTG_SIC_SHIFT             29
> -#define MX25_OTG_SIC_MASK              (0x3 << MX25_OTG_SIC_SHIFT)
> +#define MX25_OTG_SIC                   GENMASK(30, 29)
>  #define MX25_OTG_PM_BIT                        BIT(24)
>  #define MX25_OTG_PP_BIT                        BIT(11)
>  #define MX25_OTG_OCPOL_BIT             BIT(3)
>
> -#define MX25_H1_SIC_SHIFT              21
> -#define MX25_H1_SIC_MASK               (0x3 << MX25_H1_SIC_SHIFT)
> +#define MX25_H1_SIC                    GENMASK(22, 21)
>  #define MX25_H1_PP_BIT                 BIT(18)
>  #define MX25_H1_PM_BIT                 BIT(16)
>  #define MX25_H1_IPPUE_UP_BIT           BIT(7)
> @@ -42,10 +41,10 @@
>  #define MX53_USB_OTG_PHY_CTRL_0_OFFSET 0x08
>  #define MX53_USB_OTG_PHY_CTRL_1_OFFSET 0x0c
>  #define MX53_USB_CTRL_1_OFFSET         0x10
> -#define MX53_USB_CTRL_1_H2_XCVR_CLK_SEL_MASK (0x3 << 2)
> -#define MX53_USB_CTRL_1_H2_XCVR_CLK_SEL_ULPI BIT(2)
> -#define MX53_USB_CTRL_1_H3_XCVR_CLK_SEL_MASK (0x3 << 6)
> -#define MX53_USB_CTRL_1_H3_XCVR_CLK_SEL_ULPI BIT(6)
> +#define MX53_USB_CTRL_1_H2_XCVR_CLK_SEL        GENMASK(3, 2)
> +#define MX53_USB_CTRL_1_H2_XCVR_CLK_SEL_ULPI 1
> +#define MX53_USB_CTRL_1_H3_XCVR_CLK_SEL        GENMASK(5, 4)

Should be GENMASK(7, 6)

Thanks,
Xu Yang

> +#define MX53_USB_CTRL_1_H3_XCVR_CLK_SEL_ULPI 1
>  #define MX53_USB_UH2_CTRL_OFFSET       0x14
>  #define MX53_USB_UH3_CTRL_OFFSET       0x18
>  #define MX53_USB_CLKONOFF_CTRL_OFFSET  0x24
> @@ -85,26 +84,24 @@
>  #define MX6_USB_OTG1_PHY_CTRL          0x18
>  /* For imx6dql, it is host-only controller, for later imx6, it is otg's */
>  #define MX6_USB_OTG2_PHY_CTRL          0x1c
> -#define MX6SX_USB_VBUS_WAKEUP_SOURCE(v)        (v << 8)
> -#define MX6SX_USB_VBUS_WAKEUP_SOURCE_VBUS      MX6SX_USB_VBUS_WAKEUP_SOURCE(0)
> -#define MX6SX_USB_VBUS_WAKEUP_SOURCE_AVALID    MX6SX_USB_VBUS_WAKEUP_SOURCE(1)
> -#define MX6SX_USB_VBUS_WAKEUP_SOURCE_BVALID    MX6SX_USB_VBUS_WAKEUP_SOURCE(2)
> -#define MX6SX_USB_VBUS_WAKEUP_SOURCE_SESS_END  MX6SX_USB_VBUS_WAKEUP_SOURCE(3)
> +#define MX6SX_USB_VBUS_WAKEUP_SOURCE           GENMASK(9, 8)
> +#define MX6SX_USB_VBUS_WAKEUP_SOURCE_VBUS      0
> +#define MX6SX_USB_VBUS_WAKEUP_SOURCE_AVALID    1
> +#define MX6SX_USB_VBUS_WAKEUP_SOURCE_BVALID    2
> +#define MX6SX_USB_VBUS_WAKEUP_SOURCE_SESS_END  3
>
>  #define VF610_OVER_CUR_DIS             BIT(7)
>
>  #define MX7D_USBNC_USB_CTRL2           0x4
> -#define MX7D_USB_VBUS_WAKEUP_SOURCE_MASK       0x3
> -#define MX7D_USB_VBUS_WAKEUP_SOURCE(v)         (v << 0)
> -#define MX7D_USB_VBUS_WAKEUP_SOURCE_VBUS       MX7D_USB_VBUS_WAKEUP_SOURCE(0)
> -#define MX7D_USB_VBUS_WAKEUP_SOURCE_AVALID     MX7D_USB_VBUS_WAKEUP_SOURCE(1)
> -#define MX7D_USB_VBUS_WAKEUP_SOURCE_BVALID     MX7D_USB_VBUS_WAKEUP_SOURCE(2)
> -#define MX7D_USB_VBUS_WAKEUP_SOURCE_SESS_END   MX7D_USB_VBUS_WAKEUP_SOURCE(3)
> +#define MX7D_USB_VBUS_WAKEUP_SOURCE            GENMASK(1, 0)
> +#define MX7D_USB_VBUS_WAKEUP_SOURCE_VBUS       0
> +#define MX7D_USB_VBUS_WAKEUP_SOURCE_AVALID     1
> +#define MX7D_USB_VBUS_WAKEUP_SOURCE_BVALID     2
> +#define MX7D_USB_VBUS_WAKEUP_SOURCE_SESS_END   3
>  #define MX7D_USBNC_AUTO_RESUME                         BIT(2)
>  /* The default DM/DP value is pull-down */
> -#define MX7D_USBNC_USB_CTRL2_OPMODE(v)                 (v << 6)
> -#define MX7D_USBNC_USB_CTRL2_OPMODE_NON_DRIVING        MX7D_USBNC_USB_CTRL2_OPMODE(1)
> -#define MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_MASK      (BIT(7) | BIT(6))
> +#define MX7D_USBNC_USB_CTRL2_OPMODE            GENMASK(7, 6)
> +#define MX7D_USBNC_USB_CTRL2_OPMODE_NON_DRIVING        1
>  #define MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_EN                BIT(8)
>  #define MX7D_USBNC_USB_CTRL2_DP_OVERRIDE_VAL           BIT(12)
>  #define MX7D_USBNC_USB_CTRL2_DP_OVERRIDE_EN            BIT(13)
> @@ -129,10 +126,8 @@
>  #define MX7D_USB_OTG_PHY_STATUS_CHRGDET                BIT(29)
>
>  #define MX7D_USB_OTG_PHY_CFG1          0x30
> -#define TXPREEMPAMPTUNE0_BIT           28
> -#define TXPREEMPAMPTUNE0_MASK          (3 << 28)
> -#define TXVREFTUNE0_BIT                        20
> -#define TXVREFTUNE0_MASK               (0xf << 20)
> +#define TXPREEMPAMPTUNE0               GENMASK(29, 28)
> +#define TXVREFTUNE0                    GENMASK(23, 20)
>
>  #define MX6_USB_OTG_WAKEUP_BITS (MX6_BM_WAKEUP_ENABLE | MX6_BM_VBUS_WAKEUP | \
>                                  MX6_BM_ID_WAKEUP)
> @@ -173,8 +168,8 @@ static int usbmisc_imx25_init(struct imx_usbmisc_data *data)
>         switch (data->index) {
>         case 0:
>                 val = readl(usbmisc->base);
> -               val &= ~(MX25_OTG_SIC_MASK | MX25_OTG_PP_BIT);
> -               val |= (MX25_EHCI_INTERFACE_DIFF_UNI & MX25_EHCI_INTERFACE_MASK) << MX25_OTG_SIC_SHIFT;
> +               val &= ~(MX25_OTG_SIC | MX25_OTG_PP_BIT);
> +               val |= FIELD_PREP(MX25_OTG_SIC, MX25_EHCI_INTERFACE_DIFF_UNI);
>                 val |= (MX25_OTG_PM_BIT | MX25_OTG_OCPOL_BIT);
>
>                 /*
> @@ -188,8 +183,8 @@ static int usbmisc_imx25_init(struct imx_usbmisc_data *data)
>                 break;
>         case 1:
>                 val = readl(usbmisc->base);
> -               val &= ~(MX25_H1_SIC_MASK | MX25_H1_PP_BIT |  MX25_H1_IPPUE_UP_BIT);
> -               val |= (MX25_EHCI_INTERFACE_SINGLE_UNI & MX25_EHCI_INTERFACE_MASK) << MX25_H1_SIC_SHIFT;
> +               val &= ~(MX25_H1_SIC | MX25_H1_PP_BIT |  MX25_H1_IPPUE_UP_BIT);
> +               val |= FIELD_PREP(MX25_H1_SIC, MX25_EHCI_INTERFACE_SINGLE_UNI);
>                 val |= (MX25_H1_PM_BIT | MX25_H1_OCPOL_BIT | MX25_H1_TLL_BIT |
>                         MX25_H1_USBTE_BIT | MX25_H1_IPPUE_DOWN_BIT);
>
> @@ -308,8 +303,9 @@ static int usbmisc_imx53_init(struct imx_usbmisc_data *data)
>                         reg = usbmisc->base + MX53_USB_CTRL_1_OFFSET;
>                         val = readl(reg) | MX53_USB_CTRL_1_UH2_ULPI_EN;
>                         /* select ULPI clock */
> -                       val &= ~MX53_USB_CTRL_1_H2_XCVR_CLK_SEL_MASK;
> -                       val |= MX53_USB_CTRL_1_H2_XCVR_CLK_SEL_ULPI;
> +                       val &= ~MX53_USB_CTRL_1_H2_XCVR_CLK_SEL;
> +                       val |= FIELD_PREP(MX53_USB_CTRL_1_H2_XCVR_CLK_SEL,
> +                                         MX53_USB_CTRL_1_H2_XCVR_CLK_SEL_ULPI);
>                         writel(val, reg);
>                         /* Set interrupt wake up enable */
>                         reg = usbmisc->base + MX53_USB_UH2_CTRL_OFFSET;
> @@ -338,8 +334,9 @@ static int usbmisc_imx53_init(struct imx_usbmisc_data *data)
>                         reg = usbmisc->base + MX53_USB_CTRL_1_OFFSET;
>                         val = readl(reg) | MX53_USB_CTRL_1_UH3_ULPI_EN;
>                         /* select ULPI clock */
> -                       val &= ~MX53_USB_CTRL_1_H3_XCVR_CLK_SEL_MASK;
> -                       val |= MX53_USB_CTRL_1_H3_XCVR_CLK_SEL_ULPI;
> +                       val &= ~MX53_USB_CTRL_1_H3_XCVR_CLK_SEL;
> +                       val |= FIELD_PREP(MX53_USB_CTRL_1_H3_XCVR_CLK_SEL,
> +                                         MX53_USB_CTRL_1_H3_XCVR_CLK_SEL_ULPI);
>                         writel(val, reg);
>                         /* Set interrupt wake up enable */
>                         reg = usbmisc->base + MX53_USB_UH3_CTRL_OFFSET;
> @@ -551,8 +548,10 @@ static int usbmisc_imx6sx_init(struct imx_usbmisc_data *data)
>                 spin_lock_irqsave(&usbmisc->lock, flags);
>                 /* Set vbus wakeup source as bvalid */
>                 val = readl(reg);
> -               val &= ~MX6SX_USB_VBUS_WAKEUP_SOURCE(3);
> -               writel(val | MX6SX_USB_VBUS_WAKEUP_SOURCE_BVALID, reg);
> +               val &= ~MX6SX_USB_VBUS_WAKEUP_SOURCE;
> +               val |= FIELD_PREP(MX6SX_USB_VBUS_WAKEUP_SOURCE,
> +                                 MX6SX_USB_VBUS_WAKEUP_SOURCE_BVALID);
> +               writel(val, reg);
>                 /*
>                  * Disable dp/dm wakeup in device mode when vbus is
>                  * not there.
> @@ -652,22 +651,23 @@ static int usbmisc_imx7d_init(struct imx_usbmisc_data *data)
>
>         if (!data->hsic) {
>                 reg = readl(usbmisc->base + MX7D_USBNC_USB_CTRL2);
> -               reg &= ~MX7D_USB_VBUS_WAKEUP_SOURCE_MASK;
> -               writel(reg | MX7D_USB_VBUS_WAKEUP_SOURCE_BVALID
> -                       | MX7D_USBNC_AUTO_RESUME,
> -                       usbmisc->base + MX7D_USBNC_USB_CTRL2);
> +               reg &= ~MX7D_USB_VBUS_WAKEUP_SOURCE;
> +               reg |= FIELD_PREP(MX7D_USB_VBUS_WAKEUP_SOURCE,
> +                                 MX7D_USB_VBUS_WAKEUP_SOURCE_BVALID);
> +               reg |= MX7D_USBNC_AUTO_RESUME;
> +               writel(reg, usbmisc->base + MX7D_USBNC_USB_CTRL2);
>                 /* PHY tuning for signal quality */
>                 reg = readl(usbmisc->base + MX7D_USB_OTG_PHY_CFG1);
> -               if (data->emp_curr_control && data->emp_curr_control <=
> -                       (TXPREEMPAMPTUNE0_MASK >> TXPREEMPAMPTUNE0_BIT)) {
> -                       reg &= ~TXPREEMPAMPTUNE0_MASK;
> -                       reg |= (data->emp_curr_control << TXPREEMPAMPTUNE0_BIT);
> +               if (data->emp_curr_control &&
> +                   FIELD_FIT(TXPREEMPAMPTUNE0, data->emp_curr_control)) {
> +                       reg &= ~TXPREEMPAMPTUNE0;
> +                       reg |= FIELD_PREP(TXPREEMPAMPTUNE0, data->emp_curr_control);
>                 }
>
> -               if (data->dc_vol_level_adjust && data->dc_vol_level_adjust <=
> -                       (TXVREFTUNE0_MASK >> TXVREFTUNE0_BIT)) {
> -                       reg &= ~TXVREFTUNE0_MASK;
> -                       reg |= (data->dc_vol_level_adjust << TXVREFTUNE0_BIT);
> +               if (data->dc_vol_level_adjust &&
> +                   FIELD_FIT(TXVREFTUNE0, data->dc_vol_level_adjust)) {
> +                       reg &= ~TXVREFTUNE0;
> +                       reg |= FIELD_PREP(TXVREFTUNE0, data->dc_vol_level_adjust);
>                 }
>
>                 writel(reg, usbmisc->base + MX7D_USB_OTG_PHY_CFG1);
> @@ -742,7 +742,7 @@ static void imx7_disable_charger_detector(struct imx_usbmisc_data *data)
>
>         /* Set OPMODE to be 2'b00 and disable its override */
>         val = readl(usbmisc->base + MX7D_USBNC_USB_CTRL2);
> -       val &= ~MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_MASK;
> +       val &= ~MX7D_USBNC_USB_CTRL2_OPMODE;
>         writel(val, usbmisc->base + MX7D_USBNC_USB_CTRL2);
>
>         val = readl(usbmisc->base + MX7D_USBNC_USB_CTRL2);
> @@ -852,8 +852,9 @@ static int imx7d_charger_detection(struct imx_usbmisc_data *data)
>          */
>         spin_lock_irqsave(&usbmisc->lock, flags);
>         val = readl(usbmisc->base + MX7D_USBNC_USB_CTRL2);
> -       val &= ~MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_MASK;
> -       val |= MX7D_USBNC_USB_CTRL2_OPMODE_NON_DRIVING;
> +       val &= ~MX7D_USBNC_USB_CTRL2_OPMODE;
> +       val |= FIELD_PREP(MX7D_USBNC_USB_CTRL2_OPMODE,
> +                         MX7D_USBNC_USB_CTRL2_OPMODE_NON_DRIVING);
>         writel(val, usbmisc->base + MX7D_USBNC_USB_CTRL2);
>
>         val = readl(usbmisc->base + MX7D_USBNC_USB_CTRL2);
> @@ -926,9 +927,10 @@ static int usbmisc_imx7ulp_init(struct imx_usbmisc_data *data)
>                         usbmisc->base + MX7D_USBNC_USB_CTRL2);
>         } else {
>                 reg = readl(usbmisc->base + MX7D_USBNC_USB_CTRL2);
> -               reg &= ~MX7D_USB_VBUS_WAKEUP_SOURCE_MASK;
> -               writel(reg | MX7D_USB_VBUS_WAKEUP_SOURCE_BVALID,
> -                        usbmisc->base + MX7D_USBNC_USB_CTRL2);
> +               reg &= ~MX7D_USB_VBUS_WAKEUP_SOURCE;
> +               reg |= FIELD_PREP(MX7D_USB_VBUS_WAKEUP_SOURCE,
> +                                 MX7D_USB_VBUS_WAKEUP_SOURCE_BVALID);
> +               writel(reg, usbmisc->base + MX7D_USBNC_USB_CTRL2);
>         }
>
>         spin_unlock_irqrestore(&usbmisc->lock, flags);
> --
> 2.30.2
>
