Return-Path: <linux-usb+bounces-1179-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DECB7BB205
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 09:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DF841C20A0F
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 07:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1E363CC;
	Fri,  6 Oct 2023 07:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uoti3CP1"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350B615C2
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 07:12:02 +0000 (UTC)
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D96DEB
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 00:12:00 -0700 (PDT)
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-48feedb90d2so655988e0c.1
        for <linux-usb@vger.kernel.org>; Fri, 06 Oct 2023 00:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696576319; x=1697181119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHzPDIF0nHvJ4MjZXtd+1YcUGWWggbQugVNz0aoRvm4=;
        b=uoti3CP1UVIV4y6Az3AEUllKS7h0StIL6Gn5M0VSwN5J2LjQDgx/3fM6a5KHKfRPin
         WPJNTf9VKGtmJj57NXv/hF+GqyJpGR5OY8LmTZ8SLDIUCPBLaqBe6iW2aHR5vk2Z94hu
         tKw7liJchp9+hKSiGjzbKY1V7XhBAzjEUALg1ZWBP236ZkoRuQEhdtyFNljlW2JVKpcJ
         l55foz2jy+6FfXFxVUbS7GMm8y7EDbLEM0b3qKhCAUP28otIEsYwBQd5rlBVXZtF/zLe
         aopFz0015uSyrxJUwX1vvY+bqLTqk9EEfe98wwLMnp4AG9p4IL3WLHiT3bLdcukYkSbF
         dnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696576319; x=1697181119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHzPDIF0nHvJ4MjZXtd+1YcUGWWggbQugVNz0aoRvm4=;
        b=e3U7U4JSAVGMqKpKAfBLph/CFQok1gahoJjhS7/Ambshecvyshrmpwzxg8b8MFugCJ
         12pUVNW0ZwN6CRD4Msr4tp0/M8Bpfaqu/xq0fiz1PMqjGpwtXPi+x4gVedVGG3cLz/Lj
         jJek3fWyevILHYuhl/BDj2VKPrH0Ww90GAU0ryKzYv1ls3h6YkaOhVVKD5sZ/Jlgv1nU
         d1Iz7r+u7O043LDCNTM+qjhlmjykY98m7JISewQbPEQ77GMHlnyRsIex4trDZwYldoGG
         k7llkb+HeV6JAG0n0JjLHTpit8vzK/hsb/g49m2b5hcjK6qXwKaNv3Zg5G0E3MlbyoeI
         EEbg==
X-Gm-Message-State: AOJu0YzUIMcbT8scMzfK2H89BmhQsmu9tLKhaEBs0ZHTOyG/xRlbbFwN
	QoE/lTWssd3ygXLtTiDgPYWyrJgCKovfZngfpZNTNw==
X-Google-Smtp-Source: AGHT+IHiUqGjKQHUfgrIcgITqHkmD2z1HCMXkK+vuDHKcerGKLDJ+4ufx0fc/UxlguWUqe3soL3/3nEQ/msf2e3kc/I=
X-Received: by 2002:a1f:a9d0:0:b0:49d:92e0:9cd1 with SMTP id
 s199-20020a1fa9d0000000b0049d92e09cd1mr7100923vke.11.1696576319479; Fri, 06
 Oct 2023 00:11:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231004-pxa-gpio-v5-0-d99ae6fceea8@skole.hr> <20231004-pxa-gpio-v5-6-d99ae6fceea8@skole.hr>
In-Reply-To: <20231004-pxa-gpio-v5-6-d99ae6fceea8@skole.hr>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 6 Oct 2023 09:11:48 +0200
Message-ID: <CAMRc=MeGvqnsn63o1sH66AwTFCPd5kqj+7V=B08afrwUZdZCvQ@mail.gmail.com>
Subject: Re: [PATCH RFC v5 6/6] input: ads7846: Move wait_for_sync() logic to driver
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
> If this code is left in the board file, the sync GPIO would have to be
> separated into another lookup table during conversion to the GPIO
> descriptor API (which is also done in this patch).
>
> The only user of this code (Sharp Spitz) is also converted in this
> patch.
>
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

