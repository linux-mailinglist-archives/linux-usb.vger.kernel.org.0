Return-Path: <linux-usb+bounces-1354-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B71D7BF950
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 13:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36446282276
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 11:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483F91865E;
	Tue, 10 Oct 2023 11:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="C5u5QACx"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A60B182BE
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 11:10:02 +0000 (UTC)
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF8AFBA
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 04:10:00 -0700 (PDT)
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-7b5f28da928so332440241.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 04:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696936200; x=1697541000; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCYF5qT9Gs8IkTnnIfRUFKntaORMi6z87ONR0oJTVDQ=;
        b=C5u5QACxDqFmgS22h975qnPRhVJRK0lqoBbCBcPuMAuI9javRqL+IJfPQ3T7DO2nbM
         dIm6Lyq4E8+J0uFZXy/DlTUkBKcSJB3o+1KtJOELKtsX0ZShVJJkguQoVtGds8Dz1yMY
         B4JDSn771MggeNzu/Bcxnqj+jTf2QpdGqTIyYncQOVdXKBYOLfepiKncbPRRo/H7aRsR
         gvac1+HMy8GmQM19Vrvpx0lRB9MzLt+IsK4Y/EYQ1GV7TbKiywxY8q7GCKRZawiw/+a4
         a0QHV6Dz3YU7AF6tpwhONklWChnl42CB8nc4msmAHJf7ZLiXp4wsG4TwPRJTRBoJmq/n
         /xMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696936200; x=1697541000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCYF5qT9Gs8IkTnnIfRUFKntaORMi6z87ONR0oJTVDQ=;
        b=IXZ3nJeoQ8anjjd6+F09OvnYehNx0b2wqLKNVlYNY/E4079czw6bCN8xdwQq7ZshXE
         +gJBZJKRM3ASw9jM95QtKvnMLCjWjfbDijJ8tjYkHVr98ys2dLZ5HnGhDPuxyUN2qR0l
         IScSBOxCqnaQaDuzSbxl4+JAptDZSxbjRBHeIflOp9J5j6fqyGkITbCGCQbhI+ff73li
         YGuJtwPA4mdq2FdnRJsfech2bUPQEmcsuFj6NEAKVF8x+25ByL0Ue1p4ljFUb8sSxPz9
         Bm1FTbuwndjmDFpvEkWI4MzfYhEH9uzV57Bg1y2GOAC6yWqyhbtR+XSwouDewTosPLel
         K4Dg==
X-Gm-Message-State: AOJu0YxEYwvi72RvgX9906QqYpNeHZ+LakgSmTEW25cUO/SSjXp+3pOv
	mqx9wb47DnQptf1JZWjfGFFADjs0JDj6srajwFR7uA==
X-Google-Smtp-Source: AGHT+IG8EjKGLHcnRs66KBlvSVDW7XewFvqtnC+gvRCdLGJTRcz5KkRFMmp9YsubRZ0+HFgXMzlZdGl+PFDx9vN6yg8=
X-Received: by 2002:a05:6122:2641:b0:496:a6cc:7ffe with SMTP id
 dr1-20020a056122264100b00496a6cc7ffemr11008131vkb.13.1696936199801; Tue, 10
 Oct 2023 04:09:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009-pxa-gpio-v7-0-c8f5f403e856@skole.hr> <20231009-pxa-gpio-v7-1-c8f5f403e856@skole.hr>
In-Reply-To: <20231009-pxa-gpio-v7-1-c8f5f403e856@skole.hr>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Oct 2023 13:09:48 +0200
Message-ID: <CAMRc=Mcb5WpTyGyb20Kd_ycOGKPywhuGc9wFoxCcjtZ_oHC46A@mail.gmail.com>
Subject: Re: [PATCH RFT v7 1/6] ARM: pxa: Convert Spitz OHCI to GPIO descriptors
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mark Brown <broonie@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 9, 2023 at 8:34=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic@=
skole.hr> wrote:
>
> Sharp's Spitz board still uses the legacy GPIO interface for controlling
> a GPIO pin related to the USB host controller.
>
> Convert this function to use the new GPIO descriptor interface.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---
>  arch/arm/mach-pxa/spitz.c      | 13 ++++++-------
>  drivers/usb/host/ohci-pxa27x.c |  5 +++++
>  2 files changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
> index cc691b199429..535e2b2e997b 100644
> --- a/arch/arm/mach-pxa/spitz.c
> +++ b/arch/arm/mach-pxa/spitz.c
> @@ -649,23 +649,22 @@ static inline void spitz_mmc_init(void) {}
>   * USB Host
>   ***********************************************************************=
*******/
>  #if defined(CONFIG_USB_OHCI_HCD) || defined(CONFIG_USB_OHCI_HCD_MODULE)
> +GPIO_LOOKUP_SINGLE(spitz_usb_host_gpio_table, "pxa27x-ohci", "gpio-pxa",
> +               SPITZ_GPIO_USB_HOST, "usb-host", GPIO_ACTIVE_LOW);
> +
>  static int spitz_ohci_init(struct device *dev)
>  {
> -       int err;
> -
> -       err =3D gpio_request(SPITZ_GPIO_USB_HOST, "USB_HOST");
> -       if (err)
> -               return err;
> +       gpiod_add_lookup_table(&spitz_usb_host_gpio_table);
>
>         /* Only Port 2 is connected, setup USB Port 2 Output Control Regi=
ster */
>         UP2OCR =3D UP2OCR_HXS | UP2OCR_HXOE | UP2OCR_DPPDE | UP2OCR_DMPDE=
;
>
> -       return gpio_direction_output(SPITZ_GPIO_USB_HOST, 1);
> +       return 0;
>  }
>
>  static void spitz_ohci_exit(struct device *dev)
>  {
> -       gpio_free(SPITZ_GPIO_USB_HOST);
> +       gpiod_remove_lookup_table(&spitz_usb_host_gpio_table);
>  }
>
>  static struct pxaohci_platform_data spitz_ohci_platform_data =3D {
> diff --git a/drivers/usb/host/ohci-pxa27x.c b/drivers/usb/host/ohci-pxa27=
x.c
> index 357d9aee38a3..a809ba0bb25e 100644
> --- a/drivers/usb/host/ohci-pxa27x.c
> +++ b/drivers/usb/host/ohci-pxa27x.c
> @@ -121,6 +121,7 @@ struct pxa27x_ohci {
>         void __iomem    *mmio_base;
>         struct regulator *vbus[3];
>         bool            vbus_enabled[3];
> +       struct gpio_desc *usb_host;
>  };
>
>  #define to_pxa27x_ohci(hcd)    (struct pxa27x_ohci *)(hcd_to_ohci(hcd)->=
priv)
> @@ -447,6 +448,10 @@ static int ohci_hcd_pxa27x_probe(struct platform_dev=
ice *pdev)
>         pxa_ohci =3D to_pxa27x_ohci(hcd);
>         pxa_ohci->clk =3D usb_clk;
>         pxa_ohci->mmio_base =3D (void __iomem *)hcd->regs;
> +       pxa_ohci->usb_host =3D devm_gpiod_get_optional(&pdev->dev, "usb-h=
ost", GPIOD_OUT_LOW);
> +       if (IS_ERR(pxa_ohci->usb_host))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(pxa_ohci->usb_ho=
st),
> +                               "failed to get USB host GPIO\n");
>
>         for (i =3D 0; i < 3; ++i) {
>                 char name[6];
>
> --
> 2.42.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

