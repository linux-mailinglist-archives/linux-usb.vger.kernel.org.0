Return-Path: <linux-usb+bounces-905-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 914AB7B4E3B
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 10:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 413692821BE
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 08:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625AF7493;
	Mon,  2 Oct 2023 08:55:03 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3566E63C2
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 08:55:00 +0000 (UTC)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 394AF2D42
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 01:54:28 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5a24b03e22eso26290937b3.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Oct 2023 01:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696236867; x=1696841667; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAHGe0Dh0hTiu77ede4jd3f5FD+aqZVWssvCBucRdDw=;
        b=x+rCB5P0HkIE4YZ0A0EF23AnFJ6/bHqPz17K2I0HhU69pCtY8vnw4nVu1mN7jOqZOk
         uRKEAfz5IWwj82uwdBNh9BtZWmgWfL31yejXEm2cwIRCaux7vs3/yRrayCuQ/jsDHzDi
         +abzVezajzIhLbUYC0CKP3tjl4q9Lv3MN0juTymENW4u6j19RSBK+9Ku6EhnlCjLsbmT
         3E9qgIrCtATJsFWiUbmgn4ZAMoaRMxumE1tDlIZzeiWfa6Q1opTQ0DE5QhW994Nt0oVD
         4P+f3LTFuubQ6eOGoTR4UrBuwTiDHxSIrPKNvlqxITWR9/dRdaGZtyufKhlwv3a6ql9w
         k+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696236867; x=1696841667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SAHGe0Dh0hTiu77ede4jd3f5FD+aqZVWssvCBucRdDw=;
        b=cvRK3fTTvZhA642FLYxJfeF3NIl6epz+mafn2hoGVqnBtlwBXd4oxrShPeQVCcAALt
         hCkNe5QZ/Bg9kUJ73y62XwcYxOTk8MoPf67ZBVRTcrljxPbPL+ivIfN98uDFOWeDS9M6
         AI9seJFQ4PS0YUs6QEXr3OWYBU/lDH17ZV1rdr2C9Z2pIJWKGMdxSlfVDoK1AeHPfD2B
         DFGoPovuN4LUtPzLmQSz4yhdIOA6pKnFcwojvqS4myRtdfUsoWjlukG10APO4JVYn8md
         lQ0vP4JUOn1TmwtHBCsRH608pMMVBwwgAMbgt2Ylb+10b4ZD7zAxNLAwtx/kU8Ccr7+l
         U5OA==
X-Gm-Message-State: AOJu0Yx7Fj2cbWaru6KIYYXgrZojbUX6PoBE6y4kOsrC4ovdM0DHEYLz
	AnbiPvOeDp9MrDEz0QflXzk/UmFurfgOTm/4TUyBpQ==
X-Google-Smtp-Source: AGHT+IH3xhl+OqZLFGjc/FIIZK7vVneZIRUfkgmVwUJ1Lbcx2j8iWEa2u1r3zv87HGXUt/qD+sekTdSLdXL30TNvBos=
X-Received: by 2002:a0d:dc01:0:b0:599:b59f:5280 with SMTP id
 f1-20020a0ddc01000000b00599b59f5280mr10777800ywe.28.1696236866969; Mon, 02
 Oct 2023 01:54:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231001-pxa-gpio-v4-0-0f3b975e6ed5@skole.hr> <20231001-pxa-gpio-v4-2-0f3b975e6ed5@skole.hr>
In-Reply-To: <20231001-pxa-gpio-v4-2-0f3b975e6ed5@skole.hr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Oct 2023 10:54:15 +0200
Message-ID: <CACRpkdbi9fcna_giYR9HubWYoR-ZfrxZK7dPOJR9vX1n5A8Vtg@mail.gmail.com>
Subject: Re: [PATCH RFC v4 2/6] ARM: pxa: Convert Spitz LEDs to GPIO descriptors
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mark Brown <broonie@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Oct 1, 2023 at 4:13=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic@=
skole.hr> wrote:

> Sharp's Spitz board still uses the legacy GPIO interface for configuring
> its two onboard LEDs.
>
> Convert them to use the GPIO descriptor interface.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

LGTM:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

