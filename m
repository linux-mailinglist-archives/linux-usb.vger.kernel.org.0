Return-Path: <linux-usb+bounces-820-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A447B3C19
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 23:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id E3EFC282FEF
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 21:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B44E67293;
	Fri, 29 Sep 2023 21:48:51 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BFB6669B
	for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 21:48:49 +0000 (UTC)
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 261C1E6
	for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 14:48:47 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-59f6e6b206fso126553017b3.3
        for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 14:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696024126; x=1696628926; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9Y2fSCkcD6jdRglS8aGJ3vVQKyE2EnbQ1TAFzAJFA4=;
        b=QnVibiDBsePGVHKmKJEmFcVrX/9y/tY775zcYtJVRPdepP4npvAhk9nyjVsoZFOHB9
         ms/5hacbxBgLjc/ajo9RRG/CcfC/O0riso3DthdwM2/DNT2yETDnO+g0HFbrM7Gk/jY/
         P3ncwe7r8OLzE/tCDhZmK6hUDcD3iF869OXuMe4ACXres0sbPf2Vok7gNMFvR48qdNBm
         ta7r3HOoP1q9qkraK9x90kEuEltcFD96g0wa73mqlk2n1pLPEVckLovIfEI5Y2B8LmVD
         zn3IoHXr+ftuYmRCu5zENLBSBuJVAZxJ2srJw7DC4qliaoQxkmxZZOu2Ceu5d6LuoY7o
         ok8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696024126; x=1696628926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9Y2fSCkcD6jdRglS8aGJ3vVQKyE2EnbQ1TAFzAJFA4=;
        b=Eh9tGqYHjyIbBGmy76SfmgjwknVmOcY3nZiwrc5orOirq49aBV7H8C9LbkL8DN2le0
         zz+VYji+e1oIzvDq62hSS6l5PpJAsSqOm+o+M5rIUyQsRWW+xmmdp5LM/cNcQlKzwbkM
         wUYbDqvwwgCefNOXkjsKyvGp+omdICLwFtWABpIHKdMBxtNXGFCNM/mJnCmEBCMkVfPw
         J5nHGHUu9LNO5f2rzuL5RxMbLn/NPV6Mx7IMOoDZjKMmfQ2+VgQ+SgzIxFrO2NgbmyXT
         riLIKKdQDFN9TAyXGweTpdrs6AqLVFiPwdeoD/sbwTO6UblBXdjbi0jCTHbhNLZYKRWe
         w7Nw==
X-Gm-Message-State: AOJu0Yw06pIuiz6nbGZcfw1vXOMHs/c0gCb5KipYxDrL9oKZwCDtsTgb
	1zWWErX3MJRdxgoFb2Bg/mLzK3s0RBHC51mQbzKY5Q==
X-Google-Smtp-Source: AGHT+IGMuUapNs4yNU9a9tvc0M51D2PY6cv7TMVefM3fJUMhtTVk+rSQKUmHIfeHIdVCBINeGTuJAZ2WcPIL4LztSNU=
X-Received: by 2002:a0d:eacb:0:b0:586:b686:8234 with SMTP id
 t194-20020a0deacb000000b00586b6868234mr5805526ywe.8.1696024126383; Fri, 29
 Sep 2023 14:48:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230929-pxa-gpio-v3-0-af8d5e5d1f34@skole.hr> <20230929-pxa-gpio-v3-6-af8d5e5d1f34@skole.hr>
In-Reply-To: <20230929-pxa-gpio-v3-6-af8d5e5d1f34@skole.hr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Sep 2023 23:48:34 +0200
Message-ID: <CACRpkdZr4aRm6ru5FXa-s5Q0HbinTNU+HZd2ach-sUzNDQdyOg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 6/6] ARM: pxa: Convert gumstix Bluetooth to GPIO descriptors
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Sep 29, 2023 at 3:15=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic=
@skole.hr> wrote:

> Gumstix still uses the legacy GPIO interface for resetting the Bluetooth
> device.
>
> Convert it to use the GPIO descriptor interface.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

As far as I can tell the BT UART is registered before the
gpios are added and retrieved, and that should work so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

