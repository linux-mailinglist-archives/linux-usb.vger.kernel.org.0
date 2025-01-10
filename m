Return-Path: <linux-usb+bounces-19192-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E4FA09245
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 14:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD9667A3514
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 13:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1BA020E32A;
	Fri, 10 Jan 2025 13:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cIeWd18B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6544E20E309
	for <linux-usb@vger.kernel.org>; Fri, 10 Jan 2025 13:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516488; cv=none; b=ZUl6V2EdCzZYsbO8XDoZChOPZihZwuhmXgAl697jqlCjHcasABAOXWV1rvAQtOURM/H/EkU3IlANrsWjoqzymMw6dPrzo0lKt6UAxOi5oUYOn6tSwWs2BxwR1wft1w2ObPj8g1TIkIDJhl8ynq5KPvrphI0k7l0OmgVbAm08ifA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516488; c=relaxed/simple;
	bh=rLsiBDuRzSI91oH3ewkZdOirHVSzZJV5sTLfQ1MLkhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QIuEs3MhLnTVPw3P1qpCwvdlSmcKyMNzl/xzeyMWiCwYyHBm3V9fb5lg3VIGsqN0RJ6wuv3ZbOK/rdnYt93m1cWp6MUPIeBAfTtK8hwmJuP/w1XTZS7a7G+uH9c4YOVqrXHajQDq6jyNcJKftcP2ky45GXk+dgk5fgvThYMXih4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cIeWd18B; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso23093221fa.0
        for <linux-usb@vger.kernel.org>; Fri, 10 Jan 2025 05:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736516484; x=1737121284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21nrw+DQl8aAfRbmhSjgM5wqQRD/uXyhfMT9bpCfuRk=;
        b=cIeWd18B3tHWSIRG7n3mzgXfK6XCYewxTZ/jJ+WjOmgEZ72RsshtlTowtXk9omIyul
         kciIXeKqCbjlII83sdc9YW264COzfRzEzSQXAyc7dPa/I7D3KR1tLVAkPiudf4WMOzS7
         FmBqRH6HQXFPAIROwGsSULOzl2vCy9TwouMS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736516484; x=1737121284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21nrw+DQl8aAfRbmhSjgM5wqQRD/uXyhfMT9bpCfuRk=;
        b=ZyY1J+UJnHmVnamFOw8u38FqfoE0ztKniCQbyAEIHkMgne5bp+770Z3AkOXm/SaiH3
         3VRK8P54UVCLZe9Tn13Merj6wX8KDYsdfj51zgxNIgFcvPo0FQBNFDDu3QQHLFie3QDu
         Veqn4QddJDM0hLl60mcoo5HyAPnBOZReKSbIYmepmPAZA6vNbHOhmuNagBq7o5+rlQJD
         ULOyMZUzcwCYk1CzA8Npon3FQ0gAXM0VlfC9r8TTi0OYCPeZl8iCY8L+mqgVZ6LHqayH
         JeqQJWjapGNdXQWx7rNP3YfZ8lw6rwGh4q1glRkxaVu6Z75ZnkUEAOzwDudL8wb8Fiha
         R6iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkBhi5ZwrGYXY7CxagvBrJwlpR6xyYYWe0Hg9Cx+0nzd57SOwdgbdaj2ZhRLREsjS9yhmo70hPWjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEYdE02MiUBGuOS+BNeGbRF05Uc0UsRYbIcMGsBBAitiMn6nzG
	Hlt+e7HyONshY778twxvJycrS8aU21GueKPJ4a7TQbMQh6OBDGRlJlqaJlJbTDX8FTjFYpcXGQA
	EHrXbNfFYMyzTupAgdD99Mx27OSIjZJL+o/8=
X-Gm-Gg: ASbGncvy4jT0DNuBffVKqr6hMUvYdJ1XI6bVkXd8gl3pRU0f6YJMhIHh1oU7NKJAeOy
	GYz9ezWJfVrQHg3P365ooO3l4X00L4p0IW5Fe66HToGINzlV2jtsI4S7opYsBSRrBVQ==
X-Google-Smtp-Source: AGHT+IExmAvDVNgiPCh8+Gdl+mF1fMk2hcafEPAx+QDPMF5Z/s/Q2OBiZQ5NjdYC7wlrpxHXAnLaq0Oc+LOavuCTY1s=
X-Received: by 2002:a2e:be10:0:b0:302:52a8:243 with SMTP id
 38308e7fff4ca-305f45db514mr37175651fa.30.1736516484579; Fri, 10 Jan 2025
 05:41:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109220655.1677506-1-swboyd@chromium.org> <20250109220655.1677506-2-swboyd@chromium.org>
In-Reply-To: <20250109220655.1677506-2-swboyd@chromium.org>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Fri, 10 Jan 2025 14:41:13 +0100
X-Gm-Features: AbW1kvZJL9DPsrHuI32MQGP34PpUUJQSdf9ZEERbLFrN_fDbCSlIpTkraROCRvg
Message-ID: <CALwA+NbpD1cJMna6qLzkGsVvHuvTsGoFDrx=BPdzPXfQEO8jpA@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: typec: cros-ec-ucsi: Add newlines to printk messages
To: Stephen Boyd <swboyd@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Benson Leung <bleung@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org, 
	Pavan Holla <pholla@chromium.org>, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 11:06=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> These printks need newlines. Add them and convert to dev_err_probe() in
> cros_ucsi_probe() to simplify code.
>
> Cc: Pavan Holla <pholla@chromium.org>
> Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Cc: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>

> ---
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 28 ++++++++++++---------------
>  1 file changed, 12 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/uc=
si/cros_ec_ucsi.c
> index db8324b71ee9..75646a8d55be 100644
> --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> @@ -58,14 +58,14 @@ static int cros_ucsi_read(struct ucsi *ucsi, unsigned=
 int offset, void *val,
>         int ret;
>
>         if (val_len > MAX_EC_DATA_SIZE) {
> -               dev_err(udata->dev, "Can't read %zu bytes. Too big.", val=
_len);
> +               dev_err(udata->dev, "Can't read %zu bytes. Too big.\n", v=
al_len);
>                 return -EINVAL;
>         }
>
>         ret =3D cros_ec_cmd(udata->ec, 0, EC_CMD_UCSI_PPM_GET,
>                           &req, sizeof(req), val, val_len);
>         if (ret < 0) {
> -               dev_warn(udata->dev, "Failed to send EC message UCSI_PPM_=
GET: error=3D%d", ret);
> +               dev_warn(udata->dev, "Failed to send EC message UCSI_PPM_=
GET: error=3D%d\n", ret);
>                 return ret;
>         }
>         return 0;
> @@ -99,7 +99,7 @@ static int cros_ucsi_async_control(struct ucsi *ucsi, u=
64 cmd)
>         ret =3D cros_ec_cmd(udata->ec, 0, EC_CMD_UCSI_PPM_SET,
>                           req, sizeof(ec_buf), NULL, 0);
>         if (ret < 0) {
> -               dev_warn(udata->dev, "Failed to send EC message UCSI_PPM_=
SET: error=3D%d", ret);
> +               dev_warn(udata->dev, "Failed to send EC message UCSI_PPM_=
SET: error=3D%d\n", ret);
>                 return ret;
>         }
>         return 0;
> @@ -161,7 +161,7 @@ static void cros_ucsi_write_timeout(struct work_struc=
t *work)
>
>         if (cros_ucsi_read(udata->ucsi, UCSI_CCI, &cci, sizeof(cci))) {
>                 dev_err(udata->dev,
> -                       "Reading CCI failed; no write timeout recovery po=
ssible.");
> +                       "Reading CCI failed; no write timeout recovery po=
ssible.\n");
>                 return;
>         }
>
> @@ -173,7 +173,7 @@ static void cros_ucsi_write_timeout(struct work_struc=
t *work)
>                                               msecs_to_jiffies(WRITE_TMO_=
MS));
>                 else
>                         dev_err(udata->dev,
> -                               "PPM unresponsive - too many write timeou=
ts.");
> +                               "PPM unresponsive - too many write timeou=
ts.\n");
>
>                 return;
>         }
> @@ -208,7 +208,7 @@ static int cros_ucsi_event(struct notifier_block *nb,
>         if (!(host_event & PD_EVENT_PPM))
>                 return NOTIFY_OK;
>
> -       dev_dbg(udata->dev, "UCSI notification received");
> +       dev_dbg(udata->dev, "UCSI notification received\n");
>         flush_work(&udata->work);
>         schedule_work(&udata->work);
>
> @@ -237,10 +237,8 @@ static int cros_ucsi_probe(struct platform_device *p=
dev)
>         udata->dev =3D dev;
>
>         udata->ec =3D ec_data->ec_dev;
> -       if (!udata->ec) {
> -               dev_err(dev, "couldn't find parent EC device");
> -               return -ENODEV;
> -       }
> +       if (!udata->ec)
> +               return dev_err_probe(dev, -ENODEV, "couldn't find parent =
EC device\n");
>
>         platform_set_drvdata(pdev, udata);
>
> @@ -249,24 +247,22 @@ static int cros_ucsi_probe(struct platform_device *=
pdev)
>         init_completion(&udata->complete);
>
>         udata->ucsi =3D ucsi_create(dev, &cros_ucsi_ops);
> -       if (IS_ERR(udata->ucsi)) {
> -               dev_err(dev, "failed to allocate UCSI instance");
> -               return PTR_ERR(udata->ucsi);
> -       }
> +       if (IS_ERR(udata->ucsi))
> +               return dev_err_probe(dev, PTR_ERR(udata->ucsi), "failed t=
o allocate UCSI instance\n");
>
>         ucsi_set_drvdata(udata->ucsi, udata);
>
>         udata->nb.notifier_call =3D cros_ucsi_event;
>         ret =3D cros_usbpd_register_notify(&udata->nb);
>         if (ret) {
> -               dev_err(dev, "failed to register notifier: error=3D%d", r=
et);
> +               dev_err_probe(dev, ret, "failed to register notifier\n");
>                 ucsi_destroy(udata->ucsi);
>                 return ret;
>         }
>
>         ret =3D ucsi_register(udata->ucsi);
>         if (ret) {
> -               dev_err(dev, "failed to register UCSI: error=3D%d", ret);
> +               dev_err_probe(dev, ret, "failed to register UCSI\n");
>                 cros_ucsi_destroy(udata);
>                 return ret;
>         }
> --
> https://chromeos.dev
>

