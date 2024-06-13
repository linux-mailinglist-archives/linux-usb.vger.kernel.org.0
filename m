Return-Path: <linux-usb+bounces-11264-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 923659066AF
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 10:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12A1C1F21910
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 08:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F333813D8B4;
	Thu, 13 Jun 2024 08:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DGyjKQdt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7399713DB83
	for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2024 08:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718267211; cv=none; b=O1fvgnjTQBjklCcb+kNvFjSCJmi/wdWi1mYbsTrWvphqRVjeJWjFJXnysYl6JCwtN304VEazt9eoFO+sdx4EKDpuZb2CRDnJRZy41ZhOOHEpDeT/DUZe4EFyBYICXPS2G+avUudEr43AfBcRLOlm/YQHVXFylzvMlERnbIF5bTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718267211; c=relaxed/simple;
	bh=+/Cd54M7taimSwzXrHgDVYRSG+71hfapAIJPbLSt9Hs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZxaThjhzjyKJo4RwuQ7aJuL1tSzZeG+q4crEp2uyEMb/IXXS6CkRqGLJuky5lj7AVNftyZvwGdGBHG6pjsMuvS3olAzEgSn06UNz2MGSdRionLpQIMaUduJZQd3XgA3xU2gykDtuk8fS6n2IkP8ZwyJ10XhQnS3OfQrKLfIrIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DGyjKQdt; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-630640c1e14so10479587b3.1
        for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2024 01:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718267208; x=1718872008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2Im9dGKZIt0RrtNSRiS+mo63+EnUh986UQ1mB7bgEE=;
        b=DGyjKQdtRPt725gon6zKX0CDMb/4SvXXbz+a8ucF6xToOi9oHXx0jfJB0kLzln8ZHy
         foujg175BB+uqQqzck0FOaofgxOmwiFmLBpsBsHilK9lAjLAqxGA/wlOIfbc68OAmzry
         XzntPyUrT66JoS8Sgm6mn0BJsFE9OiqBxqgDwam76TR0IYX5biAJbXBf/F3EudhUJ3jV
         jwZk9eiJFBPjMxd7eBpS4abwutKnug+p8yyDXDIyBVWaeigeej/uv97fjGx+xgCEkt/O
         UODESD3/L4nVVUFpu1J1AQCIq+ZGa/VBIlHUVhr3xD742PvMvp1w1BNCmWuODGAhchgU
         lC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718267208; x=1718872008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2Im9dGKZIt0RrtNSRiS+mo63+EnUh986UQ1mB7bgEE=;
        b=UOSTaFFpUbpl8oKrzy056J7IBFphbDs+CFbFB54pcJ9ANxOnyYRW8hY3GiRrRgXy3H
         cd4EWWIvy+fsEDcv2GuiMAu3ySYJKh57sg/UR0RbxzV2ObgcxGnRHiGCNJIM87EgyHwj
         sPB8T9PDDZLB06NAyesXdSvZhaBJg844Jxbn1wCtHPN//xPpedtPbrzAJ+v5ngDhb866
         XpiOsE6Mv/PFlPg4qLxuAy4KlcZP3p7LtUkJvrs8eH3oxd68MGsEoTRpqEXtXkDTp2jo
         K8kzUtp+JnZT189woGlXZYcBI59Z7yjlWkcuWwJcOsoJf4XJJNPlMP/Lc8vLkQ2RkFAU
         TOVw==
X-Forwarded-Encrypted: i=1; AJvYcCUiHukaLStFm0t1GHh1DqSdz+dWUalq15n1Wl0SgG6dSvmufz2bazz2LtZ/Ryu7PQ+9Zpj1IEG+DS+KZxfAHz7ZX6cX3OPximXK
X-Gm-Message-State: AOJu0YxhFklKreSfyBDuxSvjsUsFrIu5U+i9RGY+j4QmGvBEyVe57rya
	ck0TpAWqmTXR/Hu3nQzhFRog6T4g2F70nF5kwur/nLjwPKHqgZ2CpsXUwtF3l5ZmdC93ZMym/Ax
	43Df6d7/DyM1cPFABzX2MzTkeGRwuBD4ryRD0oA==
X-Google-Smtp-Source: AGHT+IHynYXydLpvtfOmPpRsO5mf9ev0xqivYqbFIR+VnCUnBShW3FDhzEU1UZGYrqeqwOfV4ZIl0+6KVHd1YV43qv8=
X-Received: by 2002:a0d:e6cf:0:b0:62c:e62d:561d with SMTP id
 00721157ae682-62fbb7f5e6fmr40080067b3.1.1718267208393; Thu, 13 Jun 2024
 01:26:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612-yoga-ec-driver-v6-0-8e76ba060439@linaro.org>
 <20240612-yoga-ec-driver-v6-3-8e76ba060439@linaro.org> <c8c81617-4391-2c4c-1009-4a8a667a14dc@linux.intel.com>
In-Reply-To: <c8c81617-4391-2c4c-1009-4a8a667a14dc@linux.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 11:26:37 +0300
Message-ID: <CAA8EJpqONpegTa-svxhF-2YW8eabCBoiQo5aKEzBC-SxPxSEEQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] usb: typec: ucsi: add Lenovo Yoga C630 glue driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Nikita Travkin <nikita@trvn.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Jun 2024 at 10:30, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Wed, 12 Jun 2024, Dmitry Baryshkov wrote:
>
> > The Lenovo Yoga C630 WOS laptop provides implements UCSI interface in
> > the onboard EC. Add glue driver to interface the platform's UCSI
> > implementation.
> >
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> > +static int yoga_c630_ucsi_read(struct ucsi *ucsi, unsigned int offset,
> > +                            void *val, size_t val_len)
> > +{
> > +     struct yoga_c630_ucsi *uec =3D ucsi_get_drvdata(ucsi);
> > +     u8 buf[YOGA_C630_UCSI_READ_SIZE];
> > +     int ret;
> > +
> > +     ret =3D yoga_c630_ec_ucsi_read(uec->ec, buf);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (offset =3D=3D UCSI_VERSION) {
> > +             memcpy(val, &uec->version, min(val_len, sizeof(uec->versi=
on)));
> > +             return 0;
> > +     }
> > +
> > +     if (offset =3D=3D UCSI_CCI)
> > +             memcpy(val, buf, min(val_len, YOGA_C630_UCSI_CCI_SIZE));
> > +     else if (offset =3D=3D UCSI_MESSAGE_IN)
> > +             memcpy(val, buf + YOGA_C630_UCSI_CCI_SIZE,
> > +                    min(val_len, YOGA_C630_UCSI_DATA_SIZE));
> > +     else
> > +             return -EINVAL;
> > +
> > +     return 0;
>
> Hmm, the inconsistency when to do return 0 is a bit odd. Also, using
> switch (offset) would probably be better here anyway to replace all the
> ifs.

I'll see if I can improve this bit.

>
> > +}
> > +
> > +static int yoga_c630_ucsi_async_write(struct ucsi *ucsi, unsigned int =
offset,
> > +                                   const void *val, size_t val_len)
> > +{
> > +     struct yoga_c630_ucsi *uec =3D ucsi_get_drvdata(ucsi);
> > +
> > +     if (offset !=3D UCSI_CONTROL ||
> > +         val_len !=3D YOGA_C630_UCSI_WRITE_SIZE)
> > +             return -EINVAL;
> > +
> > +     return yoga_c630_ec_ucsi_write(uec->ec, val);
> > +}
> > +
> > +static int yoga_c630_ucsi_sync_write(struct ucsi *ucsi, unsigned int o=
ffset,
> > +                                  const void *val, size_t val_len)
> > +{
> > +     struct yoga_c630_ucsi *uec =3D ucsi_get_drvdata(ucsi);
> > +     bool ack =3D UCSI_COMMAND(*(u64 *)val) =3D=3D UCSI_ACK_CC_CI;
> > +     int ret;
> > +
> > +     if (ack)
> > +             set_bit(UCSI_C630_ACK_PENDING, &uec->flags);
> > +     else
> > +             set_bit(UCSI_C630_COMMAND_PENDING, &uec->flags);
> > +
> > +     reinit_completion(&uec->complete);
> > +
> > +     ret =3D yoga_c630_ucsi_async_write(ucsi, offset, val, val_len);
> > +     if (ret)
> > +             goto out_clear_bit;
> > +
> > +     if (!wait_for_completion_timeout(&uec->complete, 5 * HZ))
> > +             ret =3D -ETIMEDOUT;
> > +
> > +out_clear_bit:
> > +     if (ack)
> > +             clear_bit(UCSI_C630_ACK_PENDING, &uec->flags);
> > +     else
> > +             clear_bit(UCSI_C630_COMMAND_PENDING, &uec->flags);
> > +
> > +     return ret;
> > +}
> > +
> > +const struct ucsi_operations yoga_c630_ucsi_ops =3D {
> > +     .read =3D yoga_c630_ucsi_read,
> > +     .sync_write =3D yoga_c630_ucsi_sync_write,
> > +     .async_write =3D yoga_c630_ucsi_async_write,
> > +};
> > +
> > +static void yoga_c630_ucsi_notify_ucsi(struct yoga_c630_ucsi *uec, u32=
 cci)
> > +{
> > +     if (UCSI_CCI_CONNECTOR(cci))
> > +             ucsi_connector_change(uec->ucsi, UCSI_CCI_CONNECTOR(cci))=
;
> > +
> > +     if (cci & UCSI_CCI_ACK_COMPLETE &&
> > +         test_bit(UCSI_C630_ACK_PENDING, &uec->flags))
> > +             complete(&uec->complete);
> > +
> > +     if (cci & UCSI_CCI_COMMAND_COMPLETE &&
> > +         test_bit(UCSI_C630_COMMAND_PENDING, &uec->flags))
> > +             complete(&uec->complete);
>
> Is this racy? Can another command start after an ACK in between these two
> ifs and complete() is called prematurely for the new command? (Or will
> different value in cci protect against that?)

No, there is no race. The UCSI is locked for the duration of the command.

>
> > +}
> > +
> > +static int yoga_c630_ucsi_notify(struct notifier_block *nb,
> > +                              unsigned long action, void *data)
> > +{
> > +     struct yoga_c630_ucsi *uec =3D container_of(nb, struct yoga_c630_=
ucsi, nb);
> > +     u32 cci;
> > +     int ret;
> > +
> > +     switch (action) {
> > +     case LENOVO_EC_EVENT_USB:
> > +     case LENOVO_EC_EVENT_HPD:
> > +             ucsi_connector_change(uec->ucsi, 1);
> > +             return NOTIFY_OK;
> > +
> > +     case LENOVO_EC_EVENT_UCSI:
> > +             ret =3D uec->ucsi->ops->read(uec->ucsi, UCSI_CCI, &cci, s=
izeof(cci));
> > +             if (ret)
> > +                     return NOTIFY_DONE;
> > +
> > +             yoga_c630_ucsi_notify_ucsi(uec, cci);
> > +
> > +             return NOTIFY_OK;
> > +
> > +     default:
> > +             return NOTIFY_DONE;
> > +     }
> > +}
> > +
> > +static int yoga_c630_ucsi_probe(struct auxiliary_device *adev,
> > +                             const struct auxiliary_device_id *id)
> > +{
> > +     struct yoga_c630_ec *ec =3D adev->dev.platform_data;
> > +     struct yoga_c630_ucsi *uec;
> > +     int ret;
> > +
> > +     uec =3D devm_kzalloc(&adev->dev, sizeof(*uec), GFP_KERNEL);
> > +     if (!uec)
> > +             return -ENOMEM;
> > +
> > +     uec->ec =3D ec;
> > +     init_completion(&uec->complete);
> > +     uec->nb.notifier_call =3D yoga_c630_ucsi_notify;
> > +
> > +     uec->ucsi =3D ucsi_create(&adev->dev, &yoga_c630_ucsi_ops);
> > +     if (IS_ERR(uec->ucsi))
> > +             return PTR_ERR(uec->ucsi);
> > +
> > +     ucsi_set_drvdata(uec->ucsi, uec);
> > +
> > +     uec->version =3D yoga_c630_ec_ucsi_get_version(uec->ec);
> > +
> > +     auxiliary_set_drvdata(adev, uec);
> > +
> > +     ret =3D yoga_c630_ec_register_notify(ec, &uec->nb);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return ucsi_register(uec->ucsi);
> > +}
> > +
> > +static void yoga_c630_ucsi_remove(struct auxiliary_device *adev)
> > +{
> > +     struct yoga_c630_ucsi *uec =3D auxiliary_get_drvdata(adev);
> > +
> > +     yoga_c630_ec_unregister_notify(uec->ec, &uec->nb);
> > +     ucsi_unregister(uec->ucsi);
>
> Usually, the remove should tear down in reverse order than the probe side=
.
> Is the divergence from that here intentional?

Yes, it's intentional, so that the driver doesn't get a notification
while UCSI is being torn down. Consider it to be paired with
ucsi_create().

--=20
With best wishes
Dmitry

