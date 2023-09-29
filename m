Return-Path: <linux-usb+bounces-817-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC827B3B74
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 22:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 88A42283572
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 20:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC087516F1;
	Fri, 29 Sep 2023 20:44:34 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E827B849C
	for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 20:44:32 +0000 (UTC)
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63C6F1A7
	for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 13:44:31 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-57bce354d94so4214350eaf.2
        for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 13:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696020270; x=1696625070; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXgaZuLH5GhY5YWuK4dVk1ahirvrXIvxqJnkznda2HQ=;
        b=nXKiFts/gaaPAQpSwxDDsiYDQ3KwybJRWgSlJoYapliVA8tguly+m28pw+F3iL9UQm
         03TlzrFiP0PDMOQDgLW6U5QXKg2uczRPzti/vMatsj5rif2mx17KG4nhGVkaQo6ghXh+
         pj01ULjagZHYPVBkP4taKcwP2W2WTTSMUq3hUgjF1+P6O6yAxFK+oO6ufPtE33Wl6hMq
         Tf7mnxyWNSSfRHHFSUtHrHSisIrtNmFfIztNKHX/qEADBb4i5hkmbze3pLbmtF3z8LCf
         w5CDoKD/Qis6ObNgkkRXkf/0dZ+5x9E3rc+g9mVx8Ci0pYMYFiSVB7YHvbW0PO/Wlv89
         OoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696020270; x=1696625070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXgaZuLH5GhY5YWuK4dVk1ahirvrXIvxqJnkznda2HQ=;
        b=Pw9FRZStkAvlFWn0q6qXbhp0jsXrYrIvC+bRKacLYX9Ii11NpbwtZoKdAMJive3qDq
         ahqcwhTzHQo6utTLcmw9e8di4/kZnxlT/riRSNxvqlHXCJUkueMsQ8k+ECODC96xPb5C
         WkUv8QgogOqTTB5RxzfaD6nyPdcwbgtCdfOb+v/ByxN8fkn/PcEc4stfSB4A7Je8NMjb
         3Xuhb763o6zGfArM8rKYdFFFCUmKkbuxPKuiU2cAjyuf6Fx8yaW0csPYVcKHvVlc/D7b
         upsn1BdOtRMfl0ZWwHzh6MK1DZZg81jO3lKEykKnpcQnDW2V010uc58vDTf9QvPxMPhx
         xZXw==
X-Gm-Message-State: AOJu0YwkeckpYb6LcsERacKgOsKFOVp+W91j5E0lql3PpJvuUdaBw+Xw
	yck8gfCvS7wG3hqB/h9V3jEybCuQxrY3Pz5diPdzuQ==
X-Google-Smtp-Source: AGHT+IGwW+ZGTjCtnkf8EeHm+5d1gyXdI9e9XTf82f42V1QQYzuHt0f+TLPGcG+HAMgnndLYj3TS0Nkm/+GKJbn/Fus=
X-Received: by 2002:a05:6358:180f:b0:14f:3874:2746 with SMTP id
 u15-20020a056358180f00b0014f38742746mr1844462rwm.23.1696020270696; Fri, 29
 Sep 2023 13:44:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230929-pxa-gpio-v3-0-af8d5e5d1f34@skole.hr> <20230929-pxa-gpio-v3-1-af8d5e5d1f34@skole.hr>
In-Reply-To: <20230929-pxa-gpio-v3-1-af8d5e5d1f34@skole.hr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Sep 2023 22:44:18 +0200
Message-ID: <CACRpkdaSjhVhdRFxqftbEzh-f2Tc9vLz08NwsXTvSDbAaDGdTA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 1/6] ARM: pxa: Convert Spitz OHCI to GPIO descriptors
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
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Sep 29, 2023 at 3:15=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic=
@skole.hr> wrote:

> Sharp's Spitz board still uses the legacy GPIO interface for controlling
> a GPIO pin related to the USB host controller.
>
> Convert this function to use the new GPIO descriptor interface.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

