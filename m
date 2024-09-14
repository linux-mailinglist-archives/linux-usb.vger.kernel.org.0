Return-Path: <linux-usb+bounces-15118-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EBA9793B3
	for <lists+linux-usb@lfdr.de>; Sun, 15 Sep 2024 00:51:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64F491C2105F
	for <lists+linux-usb@lfdr.de>; Sat, 14 Sep 2024 22:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544CE13D2BB;
	Sat, 14 Sep 2024 22:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PqR5tIJp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25764138490
	for <linux-usb@vger.kernel.org>; Sat, 14 Sep 2024 22:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726354256; cv=none; b=Nrg34jMx7Mu3eHEFPCaU77/UCeGkIB/uFJGbByEgfoTfUow4dP9JIgXslDhKVHg0fYz7WYFQcz1Ztwuz7VxCOoVsCeFyvVnoLHvN+pxj5acPzQR6XcNtA58hDa1M0mwHaCxYUZwkij7ZFuhTvzIcOMfxnfpQpCstFmYfG1RjvgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726354256; c=relaxed/simple;
	bh=S9HU9A3lPtzTNeq4ddVzQze48B6GFWPbaPeZIHmXB7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=izjrlhjhV3j0821lgqXn2drGYyI4q3XCh5CLdahFppIWxjT/m5YSgOj/8axJxtKtV157imHkZ4n8jPiwDQipQRnpyZc/XZMEi/NANYvRRePeOkGo8Tdhw5ALYoMFVhauEAayTl0uDzjwbYWhbx5al8k/NU5foFPtrU/2wumDEns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PqR5tIJp; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5365392cfafso2042408e87.0
        for <linux-usb@vger.kernel.org>; Sat, 14 Sep 2024 15:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726354252; x=1726959052; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62inOTway/l0D+2heaR3dRkFm4XqFBMQDZkBsi6BCHk=;
        b=PqR5tIJppRTZh8ogcqcbZZ+7iwEghRWbanzaKcj2sWF7GLN7w8wi318rNi+32Rzm5K
         lLwLF+khq4AXYoGA/RbriCWY+cNSLtIOpVV7hfuYN6P67AxxWADGkfAQFnfKSnnC+XPF
         +LXlQQGniEwx9uYVVRJCG3kEWgnvyKuh4DwqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726354252; x=1726959052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=62inOTway/l0D+2heaR3dRkFm4XqFBMQDZkBsi6BCHk=;
        b=dr8Knnde6XEMYiIKmnAe6vztzCEE76khkAh9SFQQd6reEm9XWLZzFWijK76JVEpVGA
         4HQpiDj+fnX8QfUwI2kY6/NHALpZF29KuNTofz8WuWsr+JOiHS0BRgQpajuOhD+1eI6d
         elY3OieXJ32vrU1sTHh2QwK1SnVpzaiBRUKrWazpurHGzizaRMoboQB45e5lyITf7adc
         BAVSCfIIzx/lD3s81xJHnus1viBs0Wnnrz5PcUEEsWBPQbqxtJ4rsmtlZT6SHSL4urVq
         ww7GuUZwq9gne1gSwpGjZqS3FIY7xhgp/Vt5fWswoK53c6uUF4WmpJwTDFba3HAe2vOI
         2rOg==
X-Forwarded-Encrypted: i=1; AJvYcCWRKZKX1NgdzQqIPtW92/ateMTuODL/2VnKxzORdFKYLyziVaL6hDavr2kZ+cuy7pMm/HlB8n8LOoA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNE8mNjHIJ5UfKdAjTpkmpE9feOBFTzeU2rPIdecqQ/xqpAwIY
	7evJpjTch38cah08jDXbQPaf2yRGjrOtEQzJ1KI5ePNcvf9ebcRmbuPDaUmWpcwlOf8J8PiMOcq
	ghlrnDkXwQVl3B+bywwv8IPjELLqk+q2KHNY=
X-Google-Smtp-Source: AGHT+IEc4RdKBXOCSqDC8u5a2JxIpm+YVo48e3SZAmCsKbKsH4DKCR21dvHv7YXXSfvjxJOkFstGQ5S8nAUNXnuJVnE=
X-Received: by 2002:a05:6512:a8d:b0:530:e323:b1d0 with SMTP id
 2adb3069b0e04-5367feba0a6mr3570682e87.9.1726354251818; Sat, 14 Sep 2024
 15:50:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910101527.603452-1-ukaszb@chromium.org> <20240910101527.603452-4-ukaszb@chromium.org>
 <lqs2y5gvsaij5rg4o4krruseuijinqgzky6kiorjegham4aumq@fx2doq5j7wkq>
In-Reply-To: <lqs2y5gvsaij5rg4o4krruseuijinqgzky6kiorjegham4aumq@fx2doq5j7wkq>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Sun, 15 Sep 2024 00:50:40 +0200
Message-ID: <CALwA+NYC82pJHGmZXnOsWJvg0yJb3aKjLi7V32Kgb9QPtZQTyg@mail.gmail.com>
Subject: Re: [PATCH v6 3/8] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Pavan Holla <pholla@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 2:58=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, Sep 10, 2024 at 10:15:22AM GMT, =C5=81ukasz Bartosik wrote:
> > From: Pavan Holla <pholla@chromium.org>
> >
> > Implementation of a UCSI transport driver for ChromeOS.
> > This driver will be loaded if the ChromeOS EC implements a PPM.
> >
> > Signed-off-by: Pavan Holla <pholla@chromium.org>
> > Co-developed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > ---
> >  MAINTAINERS                           |   7 +
> >  drivers/usb/typec/ucsi/Kconfig        |  13 ++
> >  drivers/usb/typec/ucsi/Makefile       |   1 +
> >  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 273 ++++++++++++++++++++++++++
> >  4 files changed, 294 insertions(+)
> >  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c
> >
>
> [...]
>
> > +
> > +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
> > +{
> > +     struct cros_ucsi_data *udata =3D ucsi_get_drvdata(ucsi);
> > +     bool ack =3D UCSI_COMMAND(cmd) =3D=3D UCSI_ACK_CC_CI;
> > +     int ret;
> > +
> > +     if (ack)
> > +             set_bit(ACK_PENDING, &udata->flags);
> > +     else
> > +             set_bit(COMMAND_PENDING, &udata->flags);
> > +
> > +     ret =3D cros_ucsi_async_control(ucsi, cmd);
> > +     if (ret)
> > +             goto out;
> > +
> > +     if (!wait_for_completion_timeout(&udata->complete, WRITE_TMO_MS))
> > +             ret =3D -ETIMEDOUT;
> > +
> > +out:
> > +     if (ack)
> > +             clear_bit(ACK_PENDING, &udata->flags);
> > +     else
> > +             clear_bit(COMMAND_PENDING, &udata->flags);
> > +     return ret;
> > +}
> > +
> > +struct ucsi_operations cros_ucsi_ops =3D {
> > +     .read_version =3D cros_ucsi_read_version,
> > +     .read_cci =3D cros_ucsi_read_cci,
> > +     .read_message_in =3D cros_ucsi_read_message_in,
> > +     .async_control =3D cros_ucsi_async_control,
> > +     .sync_control =3D cros_ucsi_sync_control,
>
> Please use ucsi_sync_control_common instead.
>

I will use ucsi_sync_control_common. Thanks for pointing it out.

> > +};
> > +
> > +static void cros_ucsi_work(struct work_struct *work)
> > +{
> > +     struct cros_ucsi_data *udata =3D container_of(work, struct cros_u=
csi_data, work);
> > +     u32 cci;
> > +
> > +     if (cros_ucsi_read_cci(udata->ucsi, &cci))
> > +             return;
> > +
> > +     if (UCSI_CCI_CONNECTOR(cci))
> > +             ucsi_connector_change(udata->ucsi, UCSI_CCI_CONNECTOR(cci=
));
> > +
> > +     if (cci & UCSI_CCI_ACK_COMPLETE &&
> > +         test_and_clear_bit(ACK_PENDING, &udata->flags))
> > +             complete(&udata->complete);
> > +     if (cci & UCSI_CCI_COMMAND_COMPLETE &&
> > +         test_and_clear_bit(COMMAND_PENDING, &udata->flags))
> > +             complete(&udata->complete);
>
> ucsi_notify_common(). Why are you ignoring these functions?
>

I have missed these common functions mainly because our baseline is on
the v6.6 kernel. I will use ucsi_notify_common() however I noticed one
major difference. The ucsi_notify_common() uses test_bit while above
we use test_and_clear_bit. I will send a separate commit to change
test_bit->test_and_clear_bit in the ucsi_notify_common() because usage
of test_and_clear_bit fixes possible race condition.

Thanks,
Lukasz

> --
> With best wishes
> Dmitry

