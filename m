Return-Path: <linux-usb+bounces-1178-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 230067BB1FF
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 09:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D13F928207D
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 07:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4F463C6;
	Fri,  6 Oct 2023 07:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DVbrAv/O"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FF5EBB
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 07:10:32 +0000 (UTC)
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 029E2E9
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 00:10:30 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-7ab9ad973e6so679249241.1
        for <linux-usb@vger.kernel.org>; Fri, 06 Oct 2023 00:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696576230; x=1697181030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4Pz6V+l7g1fDRYkyErgWlYbtoLKmeqMrzbk272HU6I=;
        b=DVbrAv/OhKHORSxdsS3e5euO2Z1vQWa+xc8b/wOAkbX9s1Q4i0rbCXanOzgWcML8tF
         FwPobV/Yskf0wQz793l01oRnLguLoGd/nKmTZy1TkSmqGvUnIbooAJlctrjzf8h3DadK
         cT0gRMAWzlzNQ3trpjrvVQ7wl89AlIftknFL9iksHDdNki+XFrAKNFiBYBjcbb5QOaCz
         66nHlqTjK0egyeIvdBBSnhUxPPSkRaFfJihI3wrX3CVaGkyC1LNOGGyXG5d2e+qmzzcw
         mD3+mbax2JJ5pfiQOKvL+l9DgJUdzqMXCcJZa0PYKua7vlRCNrHzJ3+mDIpGIPkou/6z
         hrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696576230; x=1697181030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4Pz6V+l7g1fDRYkyErgWlYbtoLKmeqMrzbk272HU6I=;
        b=KwLxG6QQyWVS4ksvs2JEXdI2WHZ1xCPDIh0kGE03B+aso+jkGAkVOiiP+NjXx1Q2K2
         Pdh8ntOGKti5fIcegEHttWJ5aSGnHXxlbK6LYbKSq6Eq5v7H+oMqCJPQY9IFEK/MxnHT
         PLCU0R8bjLF0s3BUq0p9pPbj62I58sGM1pBy4clU7GCDew69NI3RjFCcN9VsTMesLqtK
         FcWtuPFZ1UYOAXYmRBgNHr8ilTIpnax0C3IB2s7MBGi3fl9jC8+1ewSTNkC5CFMcM+T5
         umb9STf/4DPxijL/Y6JaKg9BwpQ0ji1rF3Seo1q68qpUkWb6eC59d3RwVMl+EuVstz49
         Lr8Q==
X-Gm-Message-State: AOJu0Yz3bfh0XYDRRgjMwlw8xUnXUjoH92Ad+FkHIzNgUzlfT4tNblQ7
	aE2zH6chqfSwKuXMcGlbnoOlK40YoCuTYA15ibCtRA==
X-Google-Smtp-Source: AGHT+IElekYbONyUWUDSEziCQbS03+r3xAaUoSu1bVKXQLUSAIno+7zsmOgB0alZ0ADMgfjFwh9TNpN3RIIBLTKJWkY=
X-Received: by 2002:a1f:e246:0:b0:48f:8533:3cda with SMTP id
 z67-20020a1fe246000000b0048f85333cdamr6331515vkg.11.1696576229965; Fri, 06
 Oct 2023 00:10:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231004-pxa-gpio-v5-0-d99ae6fceea8@skole.hr> <20231004-pxa-gpio-v5-5-d99ae6fceea8@skole.hr>
In-Reply-To: <20231004-pxa-gpio-v5-5-d99ae6fceea8@skole.hr>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 6 Oct 2023 09:10:19 +0200
Message-ID: <CAMRc=Mf47F7GgLyp+DkRQp2H7+JiqjczVHSQwZoYJg8455n_bA@mail.gmail.com>
Subject: Re: [PATCH RFC v5 5/6] ARM: pxa: Convert gumstix Bluetooth to GPIO descriptors
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
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Oct 4, 2023 at 4:56=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic@=
skole.hr> wrote:
>
> Gumstix still uses the legacy GPIO interface for resetting the Bluetooth
> device.
>
> Convert it to use the GPIO descriptor interface.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

