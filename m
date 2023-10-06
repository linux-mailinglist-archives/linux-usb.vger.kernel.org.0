Return-Path: <linux-usb+bounces-1210-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E967BBDAB
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 19:24:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 342352822D8
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 17:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E08D30FA4;
	Fri,  6 Oct 2023 17:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qlOELpKp"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F282AB37
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 17:24:29 +0000 (UTC)
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A331FBF
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 10:24:27 -0700 (PDT)
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-49a99c43624so922418e0c.2
        for <linux-usb@vger.kernel.org>; Fri, 06 Oct 2023 10:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696613067; x=1697217867; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MXg07Advx6F48OmXOI5LqKwE4lifCKB21IEnukLuOS4=;
        b=qlOELpKp/HAVpMRkKgqLmrXrNXEFeJcdZrPQDXPF1PQRk+o3U5KA58Qh84cDnXru9K
         Fr6HCQqqNt3zzF9hOvkttcmkStKcHdwUrjhxFpu1igNAfyWPPGMWAeEoHRfYbYw0Gklq
         GKTfPg/yjXAwJGLkqDEveut58nRGXgyFsJfFjj0ebADnprrZu9B5BR+crSzZXyyjqYUh
         EJfDGNK+3bILEsgMrdvzwaLc89zoTTSwBgCx9XHvdVZ1EFFlPlfPnNfM6z58tA/0qSzc
         AFPDw1Ck2FPgNoInMTObhMQ7GfGHpChRD5yG1iZ7eVa1bi70fPquOkab5H5vBPOFro1p
         2fFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696613067; x=1697217867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXg07Advx6F48OmXOI5LqKwE4lifCKB21IEnukLuOS4=;
        b=J3VysN9hfUUWtxngRpEyZ+hO2zgMKy6lp05+TekEFlZw+LCPRG28ajt7oQgTNtBBP5
         v3loqNaR3guE1yxSsz4ZURXULXAveqBXQnw0yvNX6j+ZOAWZeBLomrEoQxFbs61tTSoH
         7i0lt1xIXXYcx2AFvUV+GvoqQGHF/pJIeD9yFfAflRkgsEfhOft7k2Td6WCKwU+N+PTd
         8wV/u5/WnJ7MgtSFdR72ZJ3iPOjF8zkFu1Mcb4v7/fXJCU37JH4puzBtp96TV8YX1Tdf
         X7BBSyPpD7eYq3+KcDwy0JTWzUJVg9GBJHOedoP41n87En66K2lADb2rahAtzi0Hrtln
         nL/A==
X-Gm-Message-State: AOJu0YzTY19Ll07fWunay3H0xdybDHiVCbEETRY/IbrUC6Zbb4DGZjpA
	fo0ydSvgS3PPD0km6vFZTARdBGh+5Gb/ylN5oG9AsA==
X-Google-Smtp-Source: AGHT+IGfi4mWhaz+b8BorJFDpgBUjJUgMrmh9w4qb8vbAM4r9GKqJxQmeIxhjH0dns02JY2KOxOWrQmMHml9anSgJvU=
X-Received: by 2002:a1f:49c5:0:b0:49a:b7bf:5a22 with SMTP id
 w188-20020a1f49c5000000b0049ab7bf5a22mr7842989vka.14.1696613066638; Fri, 06
 Oct 2023 10:24:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231006-pxa-gpio-v6-0-981b4910d599@skole.hr> <20231006-pxa-gpio-v6-1-981b4910d599@skole.hr>
In-Reply-To: <20231006-pxa-gpio-v6-1-981b4910d599@skole.hr>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 6 Oct 2023 19:24:15 +0200
Message-ID: <CAMRc=Mf3yoMF1Q5=-UtzJf4gqONQ=Dg=p68Q=DsVANaAPgwD=w@mail.gmail.com>
Subject: Re: [PATCH RFT v6 1/6] ARM: pxa: Convert Spitz OHCI to GPIO descriptors
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
	DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Oct 6, 2023 at 3:45=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic@=
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
>  drivers/usb/host/ohci-pxa27x.c |  7 +++++++
>  2 files changed, 13 insertions(+), 7 deletions(-)
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
> index 357d9aee38a3..7f04421c80d6 100644
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
> @@ -512,6 +517,8 @@ static void ohci_hcd_pxa27x_remove(struct platform_de=
vice *pdev)
>         for (i =3D 0; i < 3; ++i)
>                 pxa27x_ohci_set_vbus_power(pxa_ohci, i, false);
>
> +       gpiod_put(pxa_ohci->usb_host);

This is now wrong. Devres APIs are managed by the driver core. You no
longer need this in your remove() callback.

Bart

> +
>         usb_put_hcd(hcd);
>  }
>
>
> --
> 2.42.0
>
>

