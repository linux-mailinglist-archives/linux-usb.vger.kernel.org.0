Return-Path: <linux-usb+bounces-19947-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C0DA24C47
	for <lists+linux-usb@lfdr.de>; Sun,  2 Feb 2025 01:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0F5D163520
	for <lists+linux-usb@lfdr.de>; Sun,  2 Feb 2025 00:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6699C8488;
	Sun,  2 Feb 2025 00:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nZG4Rw/A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3144635
	for <linux-usb@vger.kernel.org>; Sun,  2 Feb 2025 00:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738455609; cv=none; b=F62kf2rD88cZ7dT0bAKMZSAMQEyzHZFGKOS13hBb/YQrNs0POvnPqisxOAe+gcmyl0OgywMfApERs2QShvw4SRnGIfxyw3UNSoin9vSbpHjE16RawPZww3XCYdX39jqmFB34pZ1oL5HbOdnehhf0Ir89HX9gNOmJderziqV5lZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738455609; c=relaxed/simple;
	bh=DP7cghnH1C2A4K8GJ1C5kjKrY7hyGur/FSCRbkoGRBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m4eGzvf7q9Y/K41QMVRYiqb75F/lxTFpQg3U0kMkjafrqXBgU9xw9BU77WYUGZPaZOqVemcvElujOBvjB/N1mpw7urp/GRghQpgGqWPSrtktxrTJoKHfLGlzwSXMkF4QWn0apVihQUxLFwbGXyLB+gjDwTlI5a6nt9p7sHfoWoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nZG4Rw/A; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30737db1ab1so26354931fa.1
        for <linux-usb@vger.kernel.org>; Sat, 01 Feb 2025 16:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738455605; x=1739060405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWcYjIKdgdV0j4aO+eRsKYofdEiGJj4k32izuxISQpA=;
        b=nZG4Rw/AjpUVIzonGvbxEHMdL3Z/UDZ6xiRi4HwN0us7i/Jut8f4QXP4LS09aiB4M3
         c/n6to5eolbja/6ETs5crOhSWMyfVMaE2yqukWIKOWMN5ueeSxHxNKZSMur9KeP8W3l5
         1Bd/Y5NRnpxbJ/uzGfVgLzo1VFWMJM8Dd5mpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738455605; x=1739060405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWcYjIKdgdV0j4aO+eRsKYofdEiGJj4k32izuxISQpA=;
        b=cVeTQe3QZP65DOhKT8ZsXxXrbuwbMMsgJcw0H8aFi8bkId/TY4dqU16TOfHoySpwtY
         og177La8cfwrEqxXfRRAUcoqfW3APEJLYPGOC8Z9MNB9way6VemPpzn5uA/DJXtBFUQc
         5cqYQ5DgHcsNWkU9gEKKl/hJ0JM9sl/hH9ZYvk5+h6LZNNXuAWNXRyiP0MDn99K5bPxj
         uTMgDtIbKaLWF1cEBa1KsVGT63sr31pxHmk4wxDw0LUrVdW1UDQm7XeF3KeoJZktcEs6
         bplLwSbrCmObPr/PRMbAKQvoE1on2JtWxOeIcWFwGlE7Z+jvG+Bj1F63CPruIpvZEGVt
         G3fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW2QHxwUnobd5nFe6rf92lB2CWOhWnWwdAvRrENMVYuMyjlPwcKyiamPxEmz0iIKzY+EokI2RzNj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPj8OdLi22oUiUkzVFUR1kPu6EfLvLS6VXfEgIZc+uoMSXCDTC
	Fm+Yo4SdlLy4b5QIRf1xofEWQkze6QceTySA4w/qbBXZb7TbENKOTD1tdH78n7EEaYNW+jYMRCl
	N075rb9AC3+Mj1p7JHMkjfg0iRKpNi3DVwEI=
X-Gm-Gg: ASbGncvOaVjMNDPEtWyYTMXFZaQoO9L+IWESackqrEBgj32q63vDaUfRYhkMnMhvQ6r
	Gma4RJJtYqFWz5WaRf7Q064uWOL0y3NIU54o3sYb7JL00S3LyheBhvV4rGnesYiSrlA0sGQ==
X-Google-Smtp-Source: AGHT+IEl/IzYjyZfZe3WKkdg4S3HYhJBEinaXfDe8K3fWiA2udoAGpu01o6D+FF6ENBD6RZzDE6JIfGi2GqU+tzecis=
X-Received: by 2002:a2e:a906:0:b0:300:7f87:a4f with SMTP id
 38308e7fff4ca-30796854fbdmr62953791fa.19.1738455604642; Sat, 01 Feb 2025
 16:20:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120-ucsi-merge-commands-v2-0-462a1ec22ecc@linaro.org> <20250120-ucsi-merge-commands-v2-1-462a1ec22ecc@linaro.org>
In-Reply-To: <20250120-ucsi-merge-commands-v2-1-462a1ec22ecc@linaro.org>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Sun, 2 Feb 2025 01:19:53 +0100
X-Gm-Features: AWEUYZlZJi7MHbWPlVcfNkZ51Iliqr4kSOcA85GPxSWNfo7TYHuTV1KqVdmtOtg
Message-ID: <CALwA+NYkkSy+gzfdjzFrEJzXby=MgtUvzfma2P2XejREZH3OsA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] usb: typec: ucsi: return CCI and message from
 sync_control callback
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 10:16=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Some of the drivers emulate or handle some of the commands in the
> platform-specific way. The code ends up being split between several
> callbacks, which complicates emulation.
>
> In preparation to reworking such drivers, move read_cci() and
> read_message_in() calls into ucsi_sync_control_common().
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c |  5 +++--

Reviewed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>

Thanks,
=C5=81ukasz

>  drivers/usb/typec/ucsi/ucsi.c         | 19 +++++++++++--------
>  drivers/usb/typec/ucsi/ucsi.h         |  6 ++++--
>  drivers/usb/typec/ucsi/ucsi_acpi.c    |  5 +++--
>  drivers/usb/typec/ucsi/ucsi_ccg.c     |  5 +++--
>  5 files changed, 24 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/uc=
si/cros_ec_ucsi.c
> index c605c8616726874434d5812731420fbc6f12790e..744f0709a40eddeed17f23e98=
6f60e9f985381fd 100644
> --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> @@ -105,12 +105,13 @@ static int cros_ucsi_async_control(struct ucsi *ucs=
i, u64 cmd)
>         return 0;
>  }
>
> -static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
> +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd, u32 *cci,
> +                                 void *data, size_t size)
>  {
>         struct cros_ucsi_data *udata =3D ucsi_get_drvdata(ucsi);
>         int ret;
>
> -       ret =3D ucsi_sync_control_common(ucsi, cmd);
> +       ret =3D ucsi_sync_control_common(ucsi, cmd, cci, data, size);
>         switch (ret) {
>         case -EBUSY:
>                 /* EC may return -EBUSY if CCI.busy is set.
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.=
c
> index fcf499cc9458c0d12015a7e36e5f1ac448c3a431..559390a07a4e427c9b520dffa=
ac905277d071638 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -55,7 +55,8 @@ void ucsi_notify_common(struct ucsi *ucsi, u32 cci)
>  }
>  EXPORT_SYMBOL_GPL(ucsi_notify_common);
>
> -int ucsi_sync_control_common(struct ucsi *ucsi, u64 command)
> +int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
> +                            void *data, size_t size)
>  {
>         bool ack =3D UCSI_COMMAND(command) =3D=3D UCSI_ACK_CC_CI;
>         int ret;
> @@ -80,6 +81,13 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 co=
mmand)
>         else
>                 clear_bit(COMMAND_PENDING, &ucsi->flags);
>
> +       if (!ret && cci)
> +               ret =3D ucsi->ops->read_cci(ucsi, cci);
> +
> +       if (!ret && data &&
> +           (*cci & UCSI_CCI_COMMAND_COMPLETE))
> +               ret =3D ucsi->ops->read_message_in(ucsi, data, size);
> +
>         return ret;
>  }
>  EXPORT_SYMBOL_GPL(ucsi_sync_control_common);
> @@ -95,7 +103,7 @@ static int ucsi_acknowledge(struct ucsi *ucsi, bool co=
nn_ack)
>                 ctrl |=3D UCSI_ACK_CONNECTOR_CHANGE;
>         }
>
> -       return ucsi->ops->sync_control(ucsi, ctrl);
> +       return ucsi->ops->sync_control(ucsi, ctrl, NULL, NULL, 0);
>  }
>
>  static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
> @@ -108,9 +116,7 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 co=
mmand, u32 *cci,
>         if (size > UCSI_MAX_DATA_LENGTH(ucsi))
>                 return -EINVAL;
>
> -       ret =3D ucsi->ops->sync_control(ucsi, command);
> -       if (ucsi->ops->read_cci(ucsi, cci))
> -               return -EIO;
> +       ret =3D ucsi->ops->sync_control(ucsi, command, cci, data, size);
>
>         if (*cci & UCSI_CCI_BUSY)
>                 return ucsi_run_command(ucsi, UCSI_CANCEL, cci, NULL, 0, =
false) ?: -EBUSY;
> @@ -127,9 +133,6 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 co=
mmand, u32 *cci,
>         else
>                 err =3D 0;
>
> -       if (!err && data && UCSI_CCI_LENGTH(*cci))
> -               err =3D ucsi->ops->read_message_in(ucsi, data, size);
> -
>         /*
>          * Don't ACK connection change if there was an error.
>          */
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.=
h
> index 5ff369c24a2fc445e8559201d563c31d83b2c876..9ffc8debd7d77d118db042f27=
49cf429a848f8df 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -76,7 +76,8 @@ struct ucsi_operations {
>         int (*read_version)(struct ucsi *ucsi, u16 *version);
>         int (*read_cci)(struct ucsi *ucsi, u32 *cci);
>         int (*read_message_in)(struct ucsi *ucsi, void *val, size_t val_l=
en);
> -       int (*sync_control)(struct ucsi *ucsi, u64 command);
> +       int (*sync_control)(struct ucsi *ucsi, u64 command, u32 *cci,
> +                           void *data, size_t size);
>         int (*async_control)(struct ucsi *ucsi, u64 command);
>         bool (*update_altmodes)(struct ucsi *ucsi, struct ucsi_altmode *o=
rig,
>                                 struct ucsi_altmode *updated);
> @@ -528,7 +529,8 @@ void ucsi_altmode_update_active(struct ucsi_connector=
 *con);
>  int ucsi_resume(struct ucsi *ucsi);
>
>  void ucsi_notify_common(struct ucsi *ucsi, u32 cci);
> -int ucsi_sync_control_common(struct ucsi *ucsi, u64 command);
> +int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
> +                            void *data, size_t size);
>
>  #if IS_ENABLED(CONFIG_POWER_SUPPLY)
>  int ucsi_register_port_psy(struct ucsi_connector *con);
> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/=
ucsi_acpi.c
> index 5c55155519634d95b6e544632f869c2867093617..8b02082201ec5b85031472563=
b8b8d1eea6134de 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -122,12 +122,13 @@ static int ucsi_gram_read_message_in(struct ucsi *u=
csi, void *val, size_t val_le
>         return ret;
>  }
>
> -static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command)
> +static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command, u32 *c=
ci,
> +                                 void *data, size_t size)
>  {
>         struct ucsi_acpi *ua =3D ucsi_get_drvdata(ucsi);
>         int ret;
>
> -       ret =3D ucsi_sync_control_common(ucsi, command);
> +       ret =3D ucsi_sync_control_common(ucsi, command, cci, data, size);
>         if (ret < 0)
>                 return ret;
>
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/u=
csi_ccg.c
> index 740171f24ef9fae9abdb52d7995abe692e0a7623..02ac04a52239327475a359073=
4b77f3ac74bb589 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -628,7 +628,8 @@ static int ucsi_ccg_async_control(struct ucsi *ucsi, =
u64 command)
>         return ccg_write(uc, reg, (u8 *)&command, sizeof(command));
>  }
>
> -static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command)
> +static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cc=
i,
> +                                void *data, size_t size)
>  {
>         struct ucsi_ccg *uc =3D ucsi_get_drvdata(ucsi);
>         struct ucsi_connector *con;
> @@ -652,7 +653,7 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u=
64 command)
>                 ucsi_ccg_update_set_new_cam_cmd(uc, con, &command);
>         }
>
> -       ret =3D ucsi_sync_control_common(ucsi, command);
> +       ret =3D ucsi_sync_control_common(ucsi, command, cci, data, size);
>
>  err_put:
>         pm_runtime_put_sync(uc->dev);
>
> --
> 2.39.5
>

