Return-Path: <linux-usb+bounces-612-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9D67AF50D
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 22:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 77800282403
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 20:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DEE04A535;
	Tue, 26 Sep 2023 20:27:10 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F919374CE
	for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 20:27:08 +0000 (UTC)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCAA0121
	for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 13:27:07 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-59f1dff5298so109406367b3.3
        for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 13:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695760027; x=1696364827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgr0elKj9lSA9DaoOQmGSleBXdUJYBk6OqVSBI3fCoo=;
        b=aawmHcirD8DsgSzYr46dSgc4RX94o0O2lew5iksT9aga1rcSVvJ/hnXDM8V6FitWsq
         Zcuv2+/iFeZwd7H4RNkuMTTpIR7BroGfS/2DmW90GH6GPs8eNY4csyymim1Z/hfPwRYh
         FBN9QAUERNuKBknhnJK4B/6aOMTy8eiCqnEiskfVtEG/mouwUm0iTHhHxDXF6JfMpAan
         zZDGphm7arpqIv4aBe8pwh1VQMAy/v9ootmIrttgW/l/3e09PoEHA+oB5vxEvacZ9F/9
         wxwwF4mWGcVCcNgVyNlNC11xRoei6//gAW5jqnQNvIPKxlGJTTqGOGAbGcY3Zt/50qT0
         +wNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695760027; x=1696364827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgr0elKj9lSA9DaoOQmGSleBXdUJYBk6OqVSBI3fCoo=;
        b=blMD1db6oh9Gf506Rkqwx2J0hZBvpYLBmqDQ7krvsaklKSiuUMxUG4BowL932jTUar
         E2yOJBPU7Y4WhRfjjXJR82891bzSvuJ4Be4pA//vFoAQzzkvVL6Z6nHRuKECICnZuDbj
         MwR0DzSVjEb0L5Qhc30aED7ydn5I7xXoP+JZS3I85vDQeI3l9lAz08L/K0AQnBnGIMPm
         4ZtJ6+HkxvyuZpl5aGWuWuyAx5VJyPfaHWPDcb+f+fMmuaBZDOZXCLch8AAAPU5waJ+H
         3UWxkGEXst7i4rTlZz/RbUiK9fsv0ZBCVV8NXBQyi/xGHeGEQbUv5d4p/glRIjRKe+Kr
         71Zw==
X-Gm-Message-State: AOJu0Ywj/vkfsMeXkzy3K+cCI7JGW+kdrAo4Kob27qsYGNaKilSDFXZ/
	38K3c2zeNgpaCZZcCDIi86kW9TNWv+JnecZJZl2ycQ==
X-Google-Smtp-Source: AGHT+IE9ToDynTpmGcT5P/uZKHvPeXXQc+bPT+qu/G4gEmvRth4jAWXdjvJ1oG4ktxEO98GYZKAnKHIrOYHNrw3dF/A=
X-Received: by 2002:a0d:e442:0:b0:59f:4f56:59bc with SMTP id
 n63-20020a0de442000000b0059f4f5659bcmr59412ywe.42.1695760026911; Tue, 26 Sep
 2023 13:27:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230926-pxa-gpio-v2-0-984464d165dd@skole.hr> <20230926-pxa-gpio-v2-3-984464d165dd@skole.hr>
In-Reply-To: <20230926-pxa-gpio-v2-3-984464d165dd@skole.hr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 26 Sep 2023 22:26:56 +0200
Message-ID: <CACRpkdb8SwC=W6=Tiz0Uxk1MeQq2gBmDYQYyeKbWFzvaGA2mGQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/6] ARM: pxa: Convert Spitz CF power control to
 GPIO descriptors
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

On Tue, Sep 26, 2023 at 5:46=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic=
@skole.hr> wrote:

> Sharp's Spitz board still uses the legacy GPIO interface for controlling
> the power supply to its CF and SD card slots.
>
> Convert it to use the GPIO descriptor interface.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

