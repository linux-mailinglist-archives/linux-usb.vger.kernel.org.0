Return-Path: <linux-usb+bounces-610-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EF67AF506
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 22:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id 6ACF1B20BB2
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 20:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FEDD4A531;
	Tue, 26 Sep 2023 20:26:22 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B9B2AB55
	for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 20:26:20 +0000 (UTC)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A6E11D
	for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 13:26:19 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-59e88a28b98so137189877b3.1
        for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 13:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695759979; x=1696364779; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnOB3K0f9cHrRSnWRtiGjYWm00LiPVSnOp8cSSqH8vE=;
        b=NDf8wt6wIW6mR92yXBWOcWttW9JlSekUhXY+ts4dssjO40IUACXiOJP3uoqA9jQuLa
         vvYaPm/dY7U5daYT6T4Kbw8fUncqil+YSgM5se0D3M6/74j42DmoUm307qcX0zAiuTnj
         84UmmGZxduYPE0KT/0QFWSxMBd+OzG73UTat77DfwxXqRgfVe60C9gTMiRYU21/5RA9r
         2F2WovoOwSP35PlhABE9zksifvUQadRgI93139kYq7jC0QQ8L+WNySTyOcZOe0qfC+4K
         53arKDRg/oDwZoNXNUk1Zx4oJUDKIm1FOSP1g5rUuqCE/VgZNHIvoeYBR3qRibVHCUpf
         8Tmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695759979; x=1696364779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnOB3K0f9cHrRSnWRtiGjYWm00LiPVSnOp8cSSqH8vE=;
        b=q1pctiQh02RRUSZ/SUKHLPNxscc/bBLfyfxrRKaqs3RDIWiLECbTW/nSTqJEdc/0BU
         c/IeRN3Ks9APoE4iGLVUs2oqS5sMEfB9+9nTvqWHCRB7lplAGNsjJNXauCZkOZYV+RTs
         Z8YO0i4m/Vt5tp8bUQCFnC5eZDF1pVFxfj7LdBDL2qzGFIfgHeneCBqyDI2OguJMZtgz
         YY/BvYeC7sPznm0grG+SKFUcyctjOoqzY+D3dUqSK1WvfrIyLhozHOUoFvj//eQy+2en
         FYGit1cShydSbYtEyGcCplhdYHTZ+SN9rvKRvX3CzV6pcg2N9rlFKIpur4TTfh2+Q83t
         qFMg==
X-Gm-Message-State: AOJu0YzYDziOaphnskXU/o/40OPw3o6L5W55esKcA3SU8+osGTVbXpNE
	eLSC4AjRATD2DcfU7Q30hy0Boc2oY0bC5QCJ3sxtsQ==
X-Google-Smtp-Source: AGHT+IEsy9t1hEO7v3SM1pskJBN73FuS5Gt7wFM4+MbPWOZJmWyf3z12DHn89mtRK2+gK+rYueOD1oY9YmBhF80eK3M=
X-Received: by 2002:a81:9c46:0:b0:56c:e480:2b2b with SMTP id
 n6-20020a819c46000000b0056ce4802b2bmr3123056ywa.12.1695759979036; Tue, 26 Sep
 2023 13:26:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230926-pxa-gpio-v2-0-984464d165dd@skole.hr> <20230926-pxa-gpio-v2-4-984464d165dd@skole.hr>
In-Reply-To: <20230926-pxa-gpio-v2-4-984464d165dd@skole.hr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 26 Sep 2023 22:26:07 +0200
Message-ID: <CACRpkdbQD4mdWcGz7LcZdetZQUWHJvZK0ieHLzZYkVHicKGvYw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 4/6] ARM: pxa: Convert reset driver to GPIO descriptors
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Sep 26, 2023 at 5:46=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic=
@skole.hr> wrote:

> The PXA reset driver still uses the legacy GPIO interface for
> configuring and asserting the reset pin.
>
> Convert it to use the GPIO descriptor interface.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

Looks OK to me, there are details I would do differently,
but hey: I'm just happy this gets done.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

