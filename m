Return-Path: <linux-usb+bounces-1176-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA2F7BB1DC
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 08:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD0651C209ED
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 06:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850DA5689;
	Fri,  6 Oct 2023 06:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="g4hHlfjR"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795D24414
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 06:59:52 +0000 (UTC)
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B3E9F0
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 23:59:50 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-4526c6579afso1227631137.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Oct 2023 23:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696575589; x=1697180389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYvSHxBG2dgNXVlRR25mBsYFXb3dSQ0zb3U7unZUfqw=;
        b=g4hHlfjRXYHesQJbBjTFAv9bKftD7PeNg9WUEZH2FwwgjbyaEPwoJzwidKDRWQW1qO
         WDn7vV1XDeK2XietdXcWuFLDg+u5vJu/BmtILeWHDGO1k42eCl1KbtjtOnaDQ78K+W4R
         RaeAN09GlD7/Tozj6+VIO5dSOZ7p8nRFIleo2Iqus5c9mYMAz79IJfu5RbM5h8WXjRU7
         rhyncxEMDpitlvT15/xgNmNE6T075UG0xpksVWNgob1VA3MuAzHZZnDeEToSxjmyAQVB
         dE9jYlLSFoThywxfzIYLwPcZYe6tfpIp8Sy13bH90xgqHqaoWNuKTOWOTcgyhgsoIxJa
         MC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696575589; x=1697180389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BYvSHxBG2dgNXVlRR25mBsYFXb3dSQ0zb3U7unZUfqw=;
        b=NNwl12lA4FHezx6jTIVzQXh9E0Dc2KkN0U7OBx8r+h4BM+dWgnu7mVIkPK3/9/bkNH
         GujRkn2wR7u8rI0S+uncpcU1fJZA8Wivax0cDzKHU0/bO+3ZbT8Bn0Z9cnC3AEqql8qz
         EIs7kuxm4ANjkXt1sBjydM08tKOQqxtalhEujV3IxC7Uj0LZl5WxaWZeN+f92yF8qMdF
         JKEMeLQOQiVmh3rjEFkXevz3wBs11LaLADyWshZaSBRNcknDa3VKn8N1ymf//PqyvF2S
         ScdPLWqWvYLywVO9QrlxqdM+d2E1ce9oblszRZPZg0KgZievZGxOHjfxSBZw6U8BOOwI
         dlKw==
X-Gm-Message-State: AOJu0Yyhc9Td4m0qeEzikQGgd7sAwzutecNCMtvgKro8PNKek162W166
	wJgXgT72zDdreJm5/zeKEf9iiwVrrm6A+xIaLj0zCA==
X-Google-Smtp-Source: AGHT+IEFQXqpGHLnM1FoYxvyZhgGdxF+IAsWxgHanS/EWlcNwUGbusUbSG2isF3zOwbEIeEijyGpNXRzW8TZusWDy4M=
X-Received: by 2002:a05:6102:41a2:b0:452:7341:a098 with SMTP id
 cd34-20020a05610241a200b004527341a098mr2236364vsb.0.1696575589168; Thu, 05
 Oct 2023 23:59:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231004-pxa-gpio-v5-0-d99ae6fceea8@skole.hr> <20231004-pxa-gpio-v5-3-d99ae6fceea8@skole.hr>
In-Reply-To: <20231004-pxa-gpio-v5-3-d99ae6fceea8@skole.hr>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 6 Oct 2023 08:59:38 +0200
Message-ID: <CAMRc=Md5A5Ki-TKTYbv=nLcgLtwxxUAQaU99ijkatoomMgS31w@mail.gmail.com>
Subject: Re: [PATCH RFC v5 3/6] ARM: pxa: Convert Spitz CF power control to
 GPIO descriptors
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

On Wed, Oct 4, 2023 at 4:56=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic@=
skole.hr> wrote:
>
> Sharp's Spitz board still uses the legacy GPIO interface for controlling
> the power supply to its CF and SD card slots.
>
> Convert it to use the GPIO descriptor interface.
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

