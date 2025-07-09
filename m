Return-Path: <linux-usb+bounces-25651-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B71AFF4FD
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jul 2025 00:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25D1C1C830CA
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 22:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64AEA229B18;
	Wed,  9 Jul 2025 22:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VDGu/qpf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FA3801
	for <linux-usb@vger.kernel.org>; Wed,  9 Jul 2025 22:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752101552; cv=none; b=a2bkrOYTFdNsb5so+/ogjtsK75LGjMeg84rJ5vC4xSY1qjtjrz4W7OfDCKvE1MZfP8wZxC+Ka/OAa25bey1Ix3Wk4uAc9JUJhMHOngZWi9mfRnphVsZdXuuX3K89l8Sg5rpNG+4nosSAg6DSR/ZguMkZoV7cflczEke0JAhpdM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752101552; c=relaxed/simple;
	bh=u1Fj+kkUjVSJsYaXWgjdpqZKkvw6JkpafoVrzmBXZQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=loQIgW27j9RIIJ19g8MJflRivfhBPwWHXm/x+gubQWZuJ/3owsnZA4FLOamwjV/66Ryu77HZaNror7zt8URcy/8E8O3pNOPf+HO3xupcphcik/wat6QDzCOg6cZw7rsK1D92GJCBseBv931buwLR599NwXwH3xIyIW8k+2EauaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VDGu/qpf; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2ea65f5a0easo313273fac.1
        for <linux-usb@vger.kernel.org>; Wed, 09 Jul 2025 15:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752101550; x=1752706350; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZ/jO6E9mFWmSJKCA/T8EW+3CyqgJCpMb+i+FDIme34=;
        b=VDGu/qpfST39YGT6Id67iJXvAhlFWnYLHAiVCxMzBNMY5Zg0iq2WnXL1ugzzYpzpdS
         8BV5y2qGclzxRSGhGV131n9eeF+GK+JPw/3ZztTpFpk5Aa523jms7L2MekFUiBGJWeGR
         McAA76SQJ7+QIYIuqsWU3zCjp3a6L8jL1rYD71TRChQFuNpekFLoKThHpX358DPNiwiK
         H+FUkLr9jqo81XU1p6/QZkLDl1aICExT/6l7XeMJ69qWsvjmIuYCcUA2v0oVpDJk91wk
         3+sCFcGYvhQxapElAKUqD4XcekqHv9IBwrCg2TeA88e9mSNyn3qdnPqHGtAnG14QeGH3
         p62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752101550; x=1752706350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZ/jO6E9mFWmSJKCA/T8EW+3CyqgJCpMb+i+FDIme34=;
        b=n32yg0l6v+8dTXVJa3HAIdC/xyNKhiDjRLPk23npHDkd/0hamqyRECda7/0oliq/YV
         XKNVbaZR1o2OgusC5n772LVOKW/M3qGPqwqhOad/mUmXlXWVO0cPqSINynsSVoHQfg5B
         XnHPfI6uKvJ2gdXs0aCH/x8dbOUbkIQtSZv634jOIE85mbGVrFPUcNSa26q9OAnS0aoH
         VMogFlg8qqkvhFJ4vQcOWbMWRXj/DIpcyQXefYvtBsDgKK/K5KHC+J57xgT2yaVgIRL2
         ruFgCBcnBhJiVtFN9W835ItPIZRWQ9ZBhDEMPG7iCxxz1btxic2lt3IhTnexjDAK8zpI
         21Gg==
X-Forwarded-Encrypted: i=1; AJvYcCU8GeK+lZ3SdRVke3k4pasdHHtPSJJHn7dZ4NWXKWGdxDBsuzt6oMJQfcXGYRtjvSdO6EJIa+TFO2E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyz+P0QegDAg2abcvbru3j7yXUYv0ZmFyh+H7PukuNEJCsxgDO
	UoXktofeH7idu3g6S/AvZTuw+3AwNWaytAmZH8XsQtDgizac1rxbDkVgudzOgnYvWGZKSdXqN9A
	U9Ss6d0tCsu+4/6Z7gmogyGQShL7TW0vQlm8ifd5U
X-Gm-Gg: ASbGnctfMzY5f8aE4GMhMmhAiJxdLnLM4UY4wdkpHWKBPrECoPzK0KHTVGXAMYtJW+V
	gHenxZsrJuST7rv9R9T7lD2MFiI/H3/hMu9EGWsv7HTQXvu9m3zrniD7816VOEcaAwhVF+gd47G
	YoG88RosORR0yZ/SUUJJYeIJHTIoFtTQisip24RpRabq1U9KC6WfwP80JvExJSIwjQ525jggbPu
	A==
X-Google-Smtp-Source: AGHT+IHIV/3z6PdLLPSDIyl3VRl88VX2aPY1onB8eflF+EcitN+UIHC9L9hxZeVemwR3ytTx4eUIzfgYk8t9xXNN99w=
X-Received: by 2002:a05:6870:a508:b0:2b8:b76f:1196 with SMTP id
 586e51a60fabf-2ff0c8629ecmr956460fac.19.1752101550160; Wed, 09 Jul 2025
 15:52:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707-max77759-irq-wake-v1-0-d367f633e4bc@linaro.org> <20250707-max77759-irq-wake-v1-1-d367f633e4bc@linaro.org>
In-Reply-To: <20250707-max77759-irq-wake-v1-1-d367f633e4bc@linaro.org>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Wed, 9 Jul 2025 15:51:54 -0700
X-Gm-Features: Ac12FXwBCWPW8EZwuDpf54UTDanwxs202yidYGWWROmZV5BpUoEW98OitzLt1EQ
Message-ID: <CAPTae5KKK4pYo_BdK90=9u+5C0TeRHXnWKrHM3qzMpZ2yzWK5Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] usb: typec: tcpm/tcpci_maxim: fix irq wake usage
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Amit Sunil Dhamne <amitsd@google.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 3:50=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@li=
naro.org> wrote:
>
> This driver calls enable_irq_wake() during probe() unconditionally, and
> never issues the required corresponding disable_irq_wake() to disable
> hardware interrupt wakeup signals.
>
> Additionally, whether or not a device should wake-up the system is
> meant to be a policy decision based on sysfs (.../power/wakeup) in the
> first place.
>
> Update the driver to use the standard approach to enable/disable IRQ
> wake during the suspend/resume callbacks. This solves both issues
> described above.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

> ---
>  drivers/usb/typec/tcpm/tcpci_maxim_core.c | 46 ++++++++++++++++++++-----=
------
>  1 file changed, 30 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/type=
c/tcpm/tcpci_maxim_core.c
> index b5a5ed40faea9cfcceef5550263968148646eb44..ff3604be79da73ca5acff7b5b=
2434c116ed12ef8 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> @@ -421,21 +421,6 @@ static irqreturn_t max_tcpci_isr(int irq, void *dev_=
id)
>         return IRQ_WAKE_THREAD;
>  }
>
> -static int max_tcpci_init_alert(struct max_tcpci_chip *chip, struct i2c_=
client *client)
> -{
> -       int ret;
> -
> -       ret =3D devm_request_threaded_irq(chip->dev, client->irq, max_tcp=
ci_isr, max_tcpci_irq,
> -                                       (IRQF_TRIGGER_LOW | IRQF_ONESHOT)=
, dev_name(chip->dev),
> -                                       chip);
> -
> -       if (ret < 0)
> -               return ret;
> -
> -       enable_irq_wake(client->irq);
> -       return 0;
> -}
> -
>  static int max_tcpci_start_toggling(struct tcpci *tcpci, struct tcpci_da=
ta *tdata,
>                                     enum typec_cc_status cc)
>  {
> @@ -532,7 +517,9 @@ static int max_tcpci_probe(struct i2c_client *client)
>
>         chip->port =3D tcpci_get_tcpm_port(chip->tcpci);
>
> -       ret =3D max_tcpci_init_alert(chip, client);
> +       ret =3D devm_request_threaded_irq(&client->dev, client->irq, max_=
tcpci_isr, max_tcpci_irq,
> +                                       (IRQF_TRIGGER_LOW | IRQF_ONESHOT)=
, dev_name(chip->dev),
> +                                       chip);
>         if (ret < 0)
>                 return dev_err_probe(&client->dev, ret,
>                                      "IRQ initialization failed\n");
> @@ -544,6 +531,32 @@ static int max_tcpci_probe(struct i2c_client *client=
)
>         return 0;
>  }
>
> +#ifdef CONFIG_PM_SLEEP
> +static int max_tcpci_resume(struct device *dev)
> +{
> +       struct i2c_client *client =3D to_i2c_client(dev);
> +       int ret =3D 0;
> +
> +       if (client->irq && device_may_wakeup(dev))
> +               ret =3D disable_irq_wake(client->irq);
> +
> +       return ret;
> +}
> +
> +static int max_tcpci_suspend(struct device *dev)
> +{
> +       struct i2c_client *client =3D to_i2c_client(dev);
> +       int ret =3D 0;
> +
> +       if (client->irq && device_may_wakeup(dev))
> +               ret =3D enable_irq_wake(client->irq);
> +
> +       return ret;
> +}
> +#endif /* CONFIG_PM_SLEEP */
> +
> +static SIMPLE_DEV_PM_OPS(max_tcpci_pm_ops, max_tcpci_suspend, max_tcpci_=
resume);
> +
>  static const struct i2c_device_id max_tcpci_id[] =3D {
>         { "maxtcpc" },
>         { }
> @@ -562,6 +575,7 @@ static struct i2c_driver max_tcpci_i2c_driver =3D {
>         .driver =3D {
>                 .name =3D "maxtcpc",
>                 .of_match_table =3D of_match_ptr(max_tcpci_of_match),
> +               .pm =3D &max_tcpci_pm_ops,
>         },
>         .probe =3D max_tcpci_probe,
>         .id_table =3D max_tcpci_id,
>
> --
> 2.50.0.727.gbf7dc18ff4-goog
>

