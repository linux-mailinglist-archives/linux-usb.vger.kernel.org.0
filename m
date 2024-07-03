Return-Path: <linux-usb+bounces-11959-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDA5925ED6
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2024 13:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93E7E296002
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2024 11:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FF616DECF;
	Wed,  3 Jul 2024 11:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OV4gZuIz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068E5171648
	for <linux-usb@vger.kernel.org>; Wed,  3 Jul 2024 11:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720006449; cv=none; b=RDoYYSBelwdf8fb7N7Q7nTYZgDKlTgBLhFDfNsOQBNP2QsckVADSpx021iWjVbmElH5kXe/aaxeeYozIKz1jEapx1NPDwpYBU0ay+MPViJsdCDUiYx+Y9em0kKYUsbfMEu57Xx2z9aoHE8VVkeT3ufA7mV2xw4rBL96zp7PyuNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720006449; c=relaxed/simple;
	bh=FZENwCduhzMR7HNXX0tAbKbkTMhnOf9iriLhVyWT2uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CoF5gC1LWVmJEnsjyPFhD5yKHAR/8hcLv1MSTu6cxChncyIAgsjtxKp8Xyx3vhKnd/i4iT7+K6ZiP9KAJCck5X1Mi+fz4WUlRvU3v9wTlHfNQB35Q2qvU7WU6p9GXzpeZxHc0Fb50RZJN6QkgP46pg1P+LPiYOzhHHxjpm1vQ6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OV4gZuIz; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ebec2f11b7so59814651fa.2
        for <linux-usb@vger.kernel.org>; Wed, 03 Jul 2024 04:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720006444; x=1720611244; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGjQIIef8f4D8V2nNTqkl2FTePoqDGpILu519rNKT2M=;
        b=OV4gZuIzBO4jNQCcCUAkjWPfq8DbpHiadVs7Ug8Lmsv+kTCM4OXFKoq7KluptmDUQo
         9aGehEpdQPeaHrljMWxc2Z9+i46u+8RbWDiJvOrSX7C3G8SV2Da7g+5ZBEI0ufnaxIjH
         kJ+9mdSZKvmHIaKXyAUwIjGj9rh2kf6NKRxl6xy2eOraBeleRSrLV14kHaAJaSh7lx52
         ZLs3YvEgsKJcQgoC62HsecFXE/opvlchPr0fjZVJkN4z+I1bvkaYoEy5mz9iNH4/2UPo
         0rQHCBL3RAXnzMhA+GLp4ZYSbh+0/0CN2ftt1e8RBYATFDVc+zMN/cLi8XGH6YxpO69Q
         E6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720006444; x=1720611244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGjQIIef8f4D8V2nNTqkl2FTePoqDGpILu519rNKT2M=;
        b=Wxh7oU81CMIMvEJBwr6PRBwA92e9SPBEdRK9jbVxIpHFiH3C8u48TAeZST76AzOtHG
         daKU80UxD6tuuh2TQleTlDX2chm92BtY7gB48U2CjG3PuoEbhktde0+UFKscEHN04fA7
         M4G2CsNlglLW2yXCBSzTq2YwsfPexvYv4zQp3TAaNXLN4bQGJvA5o0C1XGwoh0NurEgX
         XKiNtF8Yz9yFYmqEwd4yYuqm6V8FsBBJ/wSgrBTyDK1+Z4XLXJpoc07kjaiEfvAcEvle
         eX+9KrDB1q4y3c3qUVUSRnrVEafTUC0kA94eObZbS8ZF76NPONcGUxZclG7/qfnnwpdb
         HUFA==
X-Forwarded-Encrypted: i=1; AJvYcCUM/sAsw6bq2lJZNrrVGuI+BPZ/MjZdZlqA5c5AzPsJFkMTiUTsag3t0pdYgLQLKTV7Q5t0wHXSh2FAW610WdiuVAv26SJEO7qI
X-Gm-Message-State: AOJu0YwPSLwk1ABn4QtraTCKks9wUyWd2JTzYW40f5I+T26/YpmdkSPj
	LD4/YHWyzaLEcLHd/HI+MchAezdc5BmjefmoqQpOH3Rl9AmbWc6b19M/qDFyDl1ZKtpy3giUR3o
	GfFYbPn9mpnF2ALIizvHyaJqshoD8O+E0HVGr3w==
X-Google-Smtp-Source: AGHT+IHvYQvlnz9xSSjxxA0C9+ARDlWBymS0Nc+4OcDhYKcJABqlW19CRkZVdGMg0Rc503nQzevZwF7mryFVzLHp4+k=
X-Received: by 2002:ac2:4e09:0:b0:52c:d8e9:5d8b with SMTP id
 2adb3069b0e04-52e826678a3mr7597242e87.25.1720006444010; Wed, 03 Jul 2024
 04:34:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com> <20240703-of_property_for_each_u32-v1-9-42c1fc0b82aa@bootlin.com>
In-Reply-To: <20240703-of_property_for_each_u32-v1-9-42c1fc0b82aa@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Jul 2024 13:33:52 +0200
Message-ID: <CAMRc=MfjdCxbQfthWXcgz2tC+2_owfx73DBq9LqN_4wFvWwgqA@mail.gmail.com>
Subject: Re: [PATCH 09/20] gpio: brcmstb: convert to of_property_for_each_u32_new()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Bjorn Andersson <andersson@kernel.org>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Richard Leitner <richard.leitner@linux.dev>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Damien Le Moal <dlemoal@kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 12:38=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Simplify code using of_property_for_each_u32_new() as the two additional
> parameters in of_property_for_each_u32() are not used here.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpio/gpio-brcmstb.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
> index 8dce78ea7139..77557bc596cd 100644
> --- a/drivers/gpio/gpio-brcmstb.c
> +++ b/drivers/gpio/gpio-brcmstb.c
> @@ -591,8 +591,6 @@ static int brcmstb_gpio_probe(struct platform_device =
*pdev)
>         void __iomem *reg_base;
>         struct brcmstb_gpio_priv *priv;
>         struct resource *res;
> -       struct property *prop;
> -       const __be32 *p;
>         u32 bank_width;
>         int num_banks =3D 0;
>         int num_gpios =3D 0;
> @@ -636,8 +634,7 @@ static int brcmstb_gpio_probe(struct platform_device =
*pdev)
>         flags =3D BGPIOF_BIG_ENDIAN_BYTE_ORDER;
>  #endif
>
> -       of_property_for_each_u32(np, "brcm,gpio-bank-widths", prop, p,
> -                       bank_width) {
> +       of_property_for_each_u32_new(np, "brcm,gpio-bank-widths", bank_wi=
dth) {
>                 struct brcmstb_gpio_bank *bank;
>                 struct gpio_chip *gc;
>
>
> --
> 2.34.1
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

