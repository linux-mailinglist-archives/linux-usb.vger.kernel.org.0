Return-Path: <linux-usb+bounces-3592-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20124801B02
	for <lists+linux-usb@lfdr.de>; Sat,  2 Dec 2023 07:28:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A21081F21193
	for <lists+linux-usb@lfdr.de>; Sat,  2 Dec 2023 06:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5AA5BE60;
	Sat,  2 Dec 2023 06:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YglY1EA2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 683CAFC
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 22:28:23 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1cfd9ce0745so54115ad.1
        for <linux-usb@vger.kernel.org>; Fri, 01 Dec 2023 22:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701498503; x=1702103303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbZ3baswrVIXCpv17EXNLNQ6fCKKgX8I1X1ug4sHQRo=;
        b=YglY1EA2yEd6/FYjxTbHAGTkC+hloqwMvNU+aEl1QJDbjtmggqyyOocdeuetVZMn3K
         zZLhB7p6QPVWXs0YLKpFo/ckvmV9FMJM0hSfC1yX7DFKtCWDcf6SDDaCeivY2FbPvo63
         YJWqdfh6l3bWs0kAV3IJ9pgm1qPCBIwHkkiz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701498503; x=1702103303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbZ3baswrVIXCpv17EXNLNQ6fCKKgX8I1X1ug4sHQRo=;
        b=FnvZD70O/XTov1qnRVFOq9Se6HuWcWGg5apcMoNiSXIQpBK1huvLBP7UgYMuCrul0e
         heyNDjvL446Xu3UAeX4ckdYEV3/dhgMN1hhzKSyraG45bpIqN5JdTb1c+V2Wr6p1aDjh
         3k4sOKRF0bGPTmViwWNHmfX/tLO6O4KFh8v7WPZ5p5pgrshNERPVK3jquJBygO1Ymhxe
         wXUW+ZBcoaPPp2hOSJLlFsyzbkHY3Qvb4fvMp8o4p7dItYlrHQs3CGD455RULe7ljt9y
         wB+i3MH5VSzBuavlKlPqnOv84iAMhJt/OX4xjJ0Kd885ZIbUR/EWXkqp1E4X+hSMVU+h
         E2LQ==
X-Gm-Message-State: AOJu0Ywn0VIt8dZupXjmjmhaMgQxLIWmDlRgjA5HzPfxEiJMXuVuYjyB
	gMq/FZNeHZtzqGW51rUSMQw4XKwow83e7tb6TaBL/Q==
X-Google-Smtp-Source: AGHT+IHHapKzN4HswkxJ9mFZ0Q1mejXuz2mhlzv5W1guU8/mRZQUxRLkyyjIUWIFM++nAIZTEtK2Lat2HMN5Lss2eXw=
X-Received: by 2002:a17:903:428a:b0:1cf:acbf:d0b5 with SMTP id
 ju10-20020a170903428a00b001cfacbfd0b5mr333159plb.1.1701498502612; Fri, 01 Dec
 2023 22:28:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201183113.343256-1-dianders@chromium.org> <20231201102946.v2.3.Ie00e07f07f87149c9ce0b27ae4e26991d307e14b@changeid>
In-Reply-To: <20231201102946.v2.3.Ie00e07f07f87149c9ce0b27ae4e26991d307e14b@changeid>
From: Grant Grundler <grundler@chromium.org>
Date: Fri, 1 Dec 2023 22:28:11 -0800
Message-ID: <CANEJEGvVSrRnZNt_i637CW6ajY_AY+1YDRabhBpb62S9UK1xdA@mail.gmail.com>
Subject: Re: [PATCH net v2 3/3] r8152: Choose our USB config with
 choose_configuration() rather than probe()
To: Douglas Anderson <dianders@chromium.org>
Cc: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Grant Grundler <grundler@chromium.org>, Hayes Wang <hayeswang@realtek.com>, 
	Simon Horman <horms@kernel.org>, =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, 
	netdev@vger.kernel.org, Brian Geffon <bgeffon@google.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 10:31=E2=80=AFAM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> If you deauthorize the r8152 device (by writing 0 to the "authorized"
> field in sysfs) and then reauthorize it (by writing a 1) then it no
> longer works. This is because when you do the above we lose the
> special configuration that we set in rtl8152_cfgselector_probe().
> Deauthorizing causes the config to be set to -1 and then reauthorizing
> runs the default logic for choosing the best config.
>
> I made an attempt to fix it so that the config is kept across
> deauthorizing / reauthorizing [1] but it was a bit ugly.
>
> Let's instead use the new USB core feature to override
> choose_configuration().
>
> This patch relies upon the patches ("usb: core: Don't force USB
> generic_subclass drivers to define probe()") and ("usb: core: Allow
> subclassed USB drivers to override usb_choose_configuration()")
>
> [1] https://lore.kernel.org/r/20231130154337.1.Ie00e07f07f87149c9ce0b27ae=
4e26991d307e14b@changeid
>
> Fixes: ec51fbd1b8a2 ("r8152: add USB device driver for config selection")
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Grant Grundler <grundler@chromium.org>

> ---
>
> Changes in v2:
> - ("Choose our USB config with choose_configuration()...) new for v2.
>
>  drivers/net/usb/r8152.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 2c5c1e91ded6..0da723d11326 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -10053,7 +10053,7 @@ static struct usb_driver rtl8152_driver =3D {
>         .disable_hub_initiated_lpm =3D 1,
>  };
>
> -static int rtl8152_cfgselector_probe(struct usb_device *udev)
> +static int rtl8152_cfgselector_choose_configuration(struct usb_device *u=
dev)
>  {
>         struct usb_host_config *c;
>         int i, num_configs;
> @@ -10080,19 +10080,13 @@ static int rtl8152_cfgselector_probe(struct usb=
_device *udev)
>         if (i =3D=3D num_configs)
>                 return -ENODEV;
>
> -       if (usb_set_configuration(udev, c->desc.bConfigurationValue)) {
> -               dev_err(&udev->dev, "Failed to set configuration %d\n",
> -                       c->desc.bConfigurationValue);
> -               return -ENODEV;
> -       }
> -
> -       return 0;
> +       return c->desc.bConfigurationValue;
>  }
>
>  static struct usb_device_driver rtl8152_cfgselector_driver =3D {
> -       .name =3D         MODULENAME "-cfgselector",
> -       .probe =3D        rtl8152_cfgselector_probe,
> -       .id_table =3D     rtl8152_table,
> +       .name =3D MODULENAME "-cfgselector",
> +       .choose_configuration =3D rtl8152_cfgselector_choose_configuratio=
n,
> +       .id_table =3D rtl8152_table,
>         .generic_subclass =3D 1,
>         .supports_autosuspend =3D 1,
>  };
> --
> 2.43.0.rc2.451.g8631bc7472-goog
>

