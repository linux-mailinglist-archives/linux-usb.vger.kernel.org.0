Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8165602762
	for <lists+linux-usb@lfdr.de>; Tue, 18 Oct 2022 10:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbiJRIpe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Oct 2022 04:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbiJRIpb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Oct 2022 04:45:31 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8CE42B3;
        Tue, 18 Oct 2022 01:45:29 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id g27so19415584edf.11;
        Tue, 18 Oct 2022 01:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0/8NmRmqGedxeycJ3OB7oM9G22Yz7F5BIQQt6w2lrLI=;
        b=ZiKrKi0V1pV6ESxIjFxlS0xnTj7mg0J+NYoLpR6OSRtJCxVpqlzGTfplN9sgliOIkj
         No5dEcD2TvtjurquM6dAVveFJd6wJbTI6liKvD4S0TZpMvuQUZytqqN2tuSLmn8ybrAv
         L8CP8L2lAY5LDFEkddBLQXNcpSQ/d3ZCCmsMG9sNZiD4GlVjvjY6nb64w3So7SrAVOdR
         mZmXvvmexVMprLKl+PU1ob029c7ZMdTKWFU4ObH8ApKwqTPqYZp9/dGEwJpw+gy2kJTg
         lxw/q6KmdJjaClZoV1fPlb/pKvCsXc2QIw2uQLmFMjXdsLusmXuzhc0nNP8bmQHQXQX4
         uXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/8NmRmqGedxeycJ3OB7oM9G22Yz7F5BIQQt6w2lrLI=;
        b=LmaKLrYe1+k58q7d6a5e7powym82V+wuzRSMG4Oa+Y4w24SgaVn6niU8lMFkOuvdnB
         +a5X2SBRLp3JguhtysY7KUCmantLhE9993qTmjxtIYAcm10QIoH9tp3c+ZU7iUcHAlBB
         juCZmiFWQgMJcZBXqlcOhFzOxUw2kNngl/n9vhVN2V23EulW2wGhGFncXzI2RubWhxv4
         YFv3pww+XhtGskVRLef8wkiVWZe6fu026u0TKUSGRUAAGjjqbJkdw7AxbCy7qMjQcDF/
         ycH+n2Lmt3WOpcZkfdKTApjcqseZ13DyFgjv3nwbtVItg6MM1UcaV2sxmxXMWDT5CYyN
         UoDw==
X-Gm-Message-State: ACrzQf0hrxhGY0AP/OMpg/nWNKWA1wnj0WX/G3Ugwz+vjkVK9+14tvnI
        d6718U+IaimD0tpmMWTKhXz25XmVkwL0pqDGWBk=
X-Google-Smtp-Source: AMsMyM78Ns5tyMZ7MerCWFuAKME6j6Him7zNR2GHM/CujzZLWMxEH7QwV2tFGWZNKPpCMMGt+lRiCdHcq6N0IfL4zpw=
X-Received: by 2002:a05:6402:42c6:b0:45c:fc58:bd0f with SMTP id
 i6-20020a05640242c600b0045cfc58bd0fmr1647683edc.19.1666082728449; Tue, 18 Oct
 2022 01:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221011082924.884123-1-s.hauer@pengutronix.de> <20221011082924.884123-2-s.hauer@pengutronix.de>
In-Reply-To: <20221011082924.884123-2-s.hauer@pengutronix.de>
From:   Xu Yang <xu.yang.nxp@gmail.com>
Date:   Tue, 18 Oct 2022 16:45:16 +0800
Message-ID: <CAE+6oSyK-Z6_zhYA+yyJnX58LVAQ6Rc_+kaa1mxALSXf2YNBKg@mail.gmail.com>
Subject: Re: [PATCH 1/6] usb: chipidea: usbmisc_imx: Fix i.MX53 clock sel masks
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

On Tue, Oct 11, 2022 at 4:50 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>
> According to the reference manual the masks for the
> MX53_USB_CTRL_1_H*_XCVR_CLK_SEL bits are 0x3, not 0x11 (which were
> probably meant as 0b11).
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by: Xu Yang <xu.yang_2@nxp.com>

Thanks,
Xu Yang

> ---
>  drivers/usb/chipidea/usbmisc_imx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index bac0f5458cab9..8f805aa9c383c 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -42,9 +42,9 @@
>  #define MX53_USB_OTG_PHY_CTRL_0_OFFSET 0x08
>  #define MX53_USB_OTG_PHY_CTRL_1_OFFSET 0x0c
>  #define MX53_USB_CTRL_1_OFFSET         0x10
> -#define MX53_USB_CTRL_1_H2_XCVR_CLK_SEL_MASK (0x11 << 2)
> +#define MX53_USB_CTRL_1_H2_XCVR_CLK_SEL_MASK (0x3 << 2)
>  #define MX53_USB_CTRL_1_H2_XCVR_CLK_SEL_ULPI BIT(2)
> -#define MX53_USB_CTRL_1_H3_XCVR_CLK_SEL_MASK (0x11 << 6)
> +#define MX53_USB_CTRL_1_H3_XCVR_CLK_SEL_MASK (0x3 << 6)
>  #define MX53_USB_CTRL_1_H3_XCVR_CLK_SEL_ULPI BIT(6)
>  #define MX53_USB_UH2_CTRL_OFFSET       0x14
>  #define MX53_USB_UH3_CTRL_OFFSET       0x18
> --
> 2.30.2
>
