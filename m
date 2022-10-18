Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9492D60277B
	for <lists+linux-usb@lfdr.de>; Tue, 18 Oct 2022 10:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbiJRIth (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Oct 2022 04:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiJRItf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Oct 2022 04:49:35 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A014DA2AB8;
        Tue, 18 Oct 2022 01:49:14 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id u21so19430375edi.9;
        Tue, 18 Oct 2022 01:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JD5xKRIjt+c5qwYIekfRX8D7OYCIbultW28a7WBo4YE=;
        b=K9xLw6aMPOF2LazZJvee4GHTgrL6kyR+bRPcF+HU7s+tgIw6GYi3kYEqm5UJ5z6XCl
         Dw4Fgs1U/jrTfqF9B94r1QJXJet9H8EgtS2H4Ca4XrEI1Kr5bpd3FFGTWEEIIVo1P42R
         kfMv6YgODqc1YHyGsEW5a+IjXfO6OSQ63Ld5L5momgiS+IOOAUWP+r89NnoYpSrM+Z7H
         3NIWw7Eke8k+CZrunqn6j3eKzyyx5IeaaLrCOl3zfJdaDCH2E+thIlOzYDEHzPp1apgz
         ucMXVA6zyxLsVICufpIT6n48vRDnH6Wx2TgZq6Ts/PdsiD82P73AHCaymHqgc3VYjp5D
         uNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JD5xKRIjt+c5qwYIekfRX8D7OYCIbultW28a7WBo4YE=;
        b=jyi0EQJ5fsDNLqU/WKJN0fcN0bUM7qQGJFZE3vp5YUeCgfKM/0VCsCnrGguCg9LIMx
         +bJGyAzM3gnBj5QUcZcOJtUpteMnju9G6u4kXZrj0A8Hf0ap/suu3cZ4ZmFoOHQ4/R6j
         ICHKtWgrXt5uNkrqOy7zXFoIcVV97J6XrVC8krlWHgOwgvjfjM6ThKBN6tTAcsnkE+E6
         cSZCVlko8TJPla3OxlfUJzaglmwOpFC4TjKIdRftyYPPhnGVQqpDtglMeR0h+5hhPOAz
         r/wp5CIIKTSdmM3cSUZRClBzCnKqL5IHVbfbl+gcfah0IY+Y9p72cqUs8cYTKvVWCFUM
         M6EQ==
X-Gm-Message-State: ACrzQf2hUKL9x2+zPIIkOgIyp7c6czad6BdgPdQZ4kPuAn4mWOOtYNld
        ipLfSvxFhLd1Akf39Zi54MTPoeR6N7G6yVYeClCNXYemuAg=
X-Google-Smtp-Source: AMsMyM5AgzBWzp6+KMrgyfE6rCCKqvOUScIRGvXv7jI4Fc6XIpQwbrzdxp+zdLu7QDZWROXPqgazcSiMm3uPTSEQ8oQ=
X-Received: by 2002:a05:6402:22ef:b0:458:bfe5:31a3 with SMTP id
 dn15-20020a05640222ef00b00458bfe531a3mr1628614edb.6.1666082952053; Tue, 18
 Oct 2022 01:49:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221011082924.884123-1-s.hauer@pengutronix.de> <20221011082924.884123-5-s.hauer@pengutronix.de>
In-Reply-To: <20221011082924.884123-5-s.hauer@pengutronix.de>
From:   Xu Yang <xu.yang.nxp@gmail.com>
Date:   Tue, 18 Oct 2022 16:49:00 +0800
Message-ID: <CAE+6oSxo9Putacb5bV5L3Z4vtYLqsqcomf_h6Ogodo1esjpaiA@mail.gmail.com>
Subject: Re: [PATCH 4/6] usb: chipidea: usbmisc_imx: Add prefix to register defines
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
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 11, 2022 at 4:49 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>
> The driver is used for a broad range of i.MX SoCs and most of the
> register defines have a SoC/regname specific prefix to make clear
> in which context they should be used. Add such a prefix to the
> MX7D_USB_OTG_PHY_CFG1 defines as well.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by: Xu Yang <xu.yang_2@nxp.com>

Thanks,
Xu Yang

> ---
>  drivers/usb/chipidea/usbmisc_imx.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index 95f2ba01c0df1..63de7d6fea427 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -126,8 +126,8 @@
>  #define MX7D_USB_OTG_PHY_STATUS_CHRGDET                BIT(29)
>
>  #define MX7D_USB_OTG_PHY_CFG1          0x30
> -#define TXPREEMPAMPTUNE0               GENMASK(29, 28)
> -#define TXVREFTUNE0                    GENMASK(23, 20)
> +#define MX7D_USB_OTG_PHY_CFG1_TXPREEMPAMPTUNE0 GENMASK(29, 28)
> +#define MX7D_USB_OTG_PHY_CFG1_TXVREFTUNE0      GENMASK(23, 20)
>
>  #define MX6_USB_OTG_WAKEUP_BITS (MX6_BM_WAKEUP_ENABLE | MX6_BM_VBUS_WAKEUP | \
>                                  MX6_BM_ID_WAKEUP)
> @@ -659,15 +659,19 @@ static int usbmisc_imx7d_init(struct imx_usbmisc_data *data)
>                 /* PHY tuning for signal quality */
>                 reg = readl(usbmisc->base + MX7D_USB_OTG_PHY_CFG1);
>                 if (data->emp_curr_control &&
> -                   FIELD_FIT(TXPREEMPAMPTUNE0, data->emp_curr_control)) {
> -                       reg &= ~TXPREEMPAMPTUNE0;
> -                       reg |= FIELD_PREP(TXPREEMPAMPTUNE0, data->emp_curr_control);
> +                   FIELD_FIT(MX7D_USB_OTG_PHY_CFG1_TXPREEMPAMPTUNE0,
> +                             data->emp_curr_control)) {
> +                       reg &= ~MX7D_USB_OTG_PHY_CFG1_TXPREEMPAMPTUNE0;
> +                       reg |= FIELD_PREP(MX7D_USB_OTG_PHY_CFG1_TXPREEMPAMPTUNE0,
> +                                         data->emp_curr_control);
>                 }
>
>                 if (data->dc_vol_level_adjust &&
> -                   FIELD_FIT(TXVREFTUNE0, data->dc_vol_level_adjust)) {
> -                       reg &= ~TXVREFTUNE0;
> -                       reg |= FIELD_PREP(TXVREFTUNE0, data->dc_vol_level_adjust);
> +                   FIELD_FIT(MX7D_USB_OTG_PHY_CFG1_TXVREFTUNE0,
> +                             data->dc_vol_level_adjust)) {
> +                       reg &= ~MX7D_USB_OTG_PHY_CFG1_TXVREFTUNE0;
> +                       reg |= FIELD_PREP(MX7D_USB_OTG_PHY_CFG1_TXVREFTUNE0,
> +                                         data->dc_vol_level_adjust);
>                 }
>
>                 writel(reg, usbmisc->base + MX7D_USB_OTG_PHY_CFG1);
> --
> 2.30.2
>
