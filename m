Return-Path: <linux-usb+bounces-3591-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 896778019EE
	for <lists+linux-usb@lfdr.de>; Sat,  2 Dec 2023 03:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAEB91C20CE6
	for <lists+linux-usb@lfdr.de>; Sat,  2 Dec 2023 02:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02DB53B7;
	Sat,  2 Dec 2023 02:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kznPMfOb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E90B41A4
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 18:14:43 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1cc79f73e58so39665ad.1
        for <linux-usb@vger.kernel.org>; Fri, 01 Dec 2023 18:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701483283; x=1702088083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ad+Vuli4r0v/oI1SJRzXP2ROeHQLNvp0j2+cttkMcqQ=;
        b=kznPMfOb2Z2iGZXKxGTdm13Ct4qqjGfbYF2ZO96FFzd3fT+vK8Bjztf6YqbuS7Dgfl
         x1gOrlh6CIf9SiV8SgUxNh+8bXkmmuAsaNN/JK5Xqb5pRo7hZQ7cR73/wxtWEXga7aRK
         9JBEoZGGdU01/bGiWlaQkCLIuauIvum/N2V9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701483283; x=1702088083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ad+Vuli4r0v/oI1SJRzXP2ROeHQLNvp0j2+cttkMcqQ=;
        b=f+fHXHHucOWuFrof1GTIdFsnfObNC8Ki6WbmgPf2ICgfVn11KclWaTQ6lmh/G+bj/N
         X4diS+NSRhmQPLckGF6Lu6rP+fhiZjg7fL/ROktWGXqZgU9Fccztw5v/M/gxAqByMK9u
         idjeQ2SPP/PWlr7Z26qXMNqhn81Ho9ZDMnj2PS3m4WLDZuJoAzQFIQARWhRkxLywfG/S
         rCRodhNs1SbfRCcd0tQbZ4l4DX/ZK9YCCnfP7aO6JMxuZxxXfcb7eZ7wejsVu8u0+IT9
         t2JVFn+oWOeVUfVj68O/PKqPfFBPqPfQyh4KRdgRlq9YJbi7tkBtKsd5VD4UNlCHvM6A
         XjgQ==
X-Gm-Message-State: AOJu0Ywd0NrbrJPeSKLGKxQWa8ofJ2ZWUhDWa+Ss4DUcKXFo+r6q/FxC
	mn9WW9Zb4ueacw9Mobnfb4fzfaX1Pze7Uxg/aW41JQ==
X-Google-Smtp-Source: AGHT+IEKqrjLQGf+i8EsRzjviHVepWE5Uj0zYxDLLxLkaXMlqS9mdTsc6E+b/+JqSoxPrT76bM7ZX7LyQ7abgOoFHik=
X-Received: by 2002:a17:903:25d5:b0:1c9:e48c:726d with SMTP id
 jc21-20020a17090325d500b001c9e48c726dmr371666plb.4.1701483281482; Fri, 01 Dec
 2023 18:14:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201183113.343256-1-dianders@chromium.org> <20231201102946.v2.1.I7ea0dd55ee2acdb48b0e6d28c1a704ab2c29206f@changeid>
In-Reply-To: <20231201102946.v2.1.I7ea0dd55ee2acdb48b0e6d28c1a704ab2c29206f@changeid>
From: Grant Grundler <grundler@chromium.org>
Date: Fri, 1 Dec 2023 18:14:29 -0800
Message-ID: <CANEJEGu2fe6MEFxd3cofeP1QQU=7kLW7EixxJ3CQmsrzsPjWPw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] usb: core: Don't force USB generic_subclass
 drivers to define probe()
To: Douglas Anderson <dianders@chromium.org>
Cc: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Grant Grundler <grundler@chromium.org>, Hayes Wang <hayeswang@realtek.com>, 
	Simon Horman <horms@kernel.org>, =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, 
	netdev@vger.kernel.org, Brian Geffon <bgeffon@google.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Hans de Goede <hdegoede@redhat.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 10:31=E2=80=AFAM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> There's no real reason that subclassed USB drivers _need_ to define
> probe() since they might want to subclass for some other reason. Make
> it optional to define probe() if we're a generic_subclass.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Grant Grundler <grundler@chromium.org>

Thanks for pursuing this Doug!

cheers,
grant

> ---
>
> Changes in v2:
> - ("Don't force USB generic_subclass drivers to define ...") new for v2.
>
>  drivers/usb/core/driver.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index f58a0299fb3b..1dc0c0413043 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -290,7 +290,10 @@ static int usb_probe_device(struct device *dev)
>          * specialised device drivers prior to setting the
>          * use_generic_driver bit.
>          */
> -       error =3D udriver->probe(udev);
> +       if (udriver->probe)
> +               error =3D udriver->probe(udev);
> +       else if (!udriver->generic_subclass)
> +               error =3D -EINVAL;
>         if (error =3D=3D -ENODEV && udriver !=3D &usb_generic_driver &&
>             (udriver->id_table || udriver->match)) {
>                 udev->use_generic_driver =3D 1;
> --
> 2.43.0.rc2.451.g8631bc7472-goog
>

