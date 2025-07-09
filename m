Return-Path: <linux-usb+bounces-25652-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20666AFF538
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jul 2025 01:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7182E581427
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 23:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F7125C6F3;
	Wed,  9 Jul 2025 23:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="om4bCVBk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1388B2561D9
	for <linux-usb@vger.kernel.org>; Wed,  9 Jul 2025 23:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752102433; cv=none; b=ShLPEOUFN5RXItF+BgNrmh9ReJe0wC/EsRtyMD0p4mLEKBD31uz60E9zO+BRFR6tX0IGxff7QhdmeU+Wa5gLbLLheE9NwKV6bA2wHqIbwEm7KVML6PB1FjbXkUDlxlfzNqOZLMgll0uKYdBBK+nswr0Pygdm6+AMMiUtoAocA+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752102433; c=relaxed/simple;
	bh=6BL3YCHKxPEwNXzudd0iH5KS9kHvqUFhPvkOrtMJqms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZRsQG0LVTYnUy78YDeVA7D/4G5Z+M5mTR1uA+TAGndp6s1BrJxN9C2BdkdBdl/0fGBYRA7+EWpbnDQCP8Z1DZfuQ4P7IFsjUDWCAQ4HUilB8Cw8uxz2t3iacHVRu9a+W/nUK2eXkReMVmEmM3kCSyTJByiQZi4KaY2np6xztZts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=om4bCVBk; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-61208b548e8so117766eaf.3
        for <linux-usb@vger.kernel.org>; Wed, 09 Jul 2025 16:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752102431; x=1752707231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmFek06lu2aHr2XTMjqjv1GEsw6/KtybX5PY6tsbIes=;
        b=om4bCVBk1j5ZG89hBizoN2zifsJrXZaAXrCKS8GlQQBam0s9gI7Wj924h7rkd8jo3U
         WsesSQrVnyNTop4MPGnfcHwrkBcQe/DSNXuuKt1ohbLOdLL/ie0Yki39B+LfgvBLADJs
         aBFEqbEWS5mMSe4W4iQWcugqedVdaUw5Zo5yo8zFvj8QoJCcWbS/oPFDZjkMKUHyudS8
         kugiZHSrLfhsytyu6IZh4EtlTNTu/zjxLgRP42XPZGvF9z/pxscaVGn+fqzKsj3Pk4rS
         xMzGxnVpiP/3xvWoBUbjhVy5vFri65tVtRsM+lVp4iCoPsRSYK/nCu+eVVfqOnAiBz+C
         /8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752102431; x=1752707231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmFek06lu2aHr2XTMjqjv1GEsw6/KtybX5PY6tsbIes=;
        b=GeeHokRuFfRM3LFDemmzWtTv1+NPD3kEyjULCRLY3caU1n4UV23uFfXZ4itRWOTVKN
         OpIuUxzz6D5aQA48DDrVDmi/+mQDVhQqxV/txP4RsjYO++VGAGzjKGf3lYA0TzCvjuPa
         oP1cjkt6a7wVk1V6GFh51EL60qB/F0hxQk2uxYw/yUkYTyvaWcP0nVbHkSCCReP/LgKG
         7IgiIA0XSKgtuJbj/CypcZo+WUpRvb72RWSHDCSY1k8Cu7fevQZMz9ufM6qe1YoLkgVr
         5+btPcXlmRyYTgbmjHlr3ZMAphIZG9iTq4uojOvb4wIZIMCS7rhWeGCaTuQouhHKl1Eo
         BMDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuYT6x/CInOXEvL/3g1wFycMu+MIaa4/qSAqfd0XTZobH2Os+qmlccwziNd2SXsCfVaxOOZCha0eI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzviB6fjdgz4f0cJl12YZO7UJ1KDoM30kqKLe/RIQsl1n+NJopz
	qJoVPHNEUwT2tdBn5BBmI+Q/ZL++++36vVnsM3DzVWlhdyx6UvW0ffs32i7i+Dy9IajwOM+wa56
	IAeK1w+ZGRA0T32DPmYkfPST1zGvQYNthwMWG8qptOClblZHVQMZr1Pn25+G5cg==
X-Gm-Gg: ASbGncsjPfypB7oEzCQZfnjhX84uJY5kurZQUfsI6rhj2tJFTsRAkujp2OeI49k1DGq
	ExRk5Wv26yl5WxrXhdC4hDqHPD4ibx9goDdrQWQWoKkD+YEgy0h/rRFqSQF049QcFtKJXqi+oz0
	EsIRxcvAfB8HpDwxjeSohkyDbaK8kKsqT+b7swyWPSapWv0sXMD2NDYUHMbRZEnnjyfSX5xcz4k
	A==
X-Google-Smtp-Source: AGHT+IE0PdZTip+FQjkl2tPhpvJ1e+5PFyrKnvi01tUOztaB4Db18JYV7O6ehbksLdAwI7wT2NdhbRq+KF7/0PWYdpk=
X-Received: by 2002:a05:6820:4c0d:b0:611:af6f:ee77 with SMTP id
 006d021491bc7-613d70c4d49mr1148867eaf.8.1752102430837; Wed, 09 Jul 2025
 16:07:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707-max77759-irq-wake-v1-0-d367f633e4bc@linaro.org> <20250707-max77759-irq-wake-v1-2-d367f633e4bc@linaro.org>
In-Reply-To: <20250707-max77759-irq-wake-v1-2-d367f633e4bc@linaro.org>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Wed, 9 Jul 2025 16:06:34 -0700
X-Gm-Features: Ac12FXyCl0EowxA-HbECTpogGzFamMYXZkfqoZMibraZJ6rz_xp3OUEaj7qMGnA
Message-ID: <CAPTae5Kk+nw-thVDEy_ASge9H3MWQU7spDvZ1tx_1DAtdZe+rA@mail.gmail.com>
Subject: Re: [PATCH 2/3] usb: typec: tcpm/tcpci_maxim: drop CONFIG_OF
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
> The general recommendation is to not use of_match_ptr() or CONFIG_OF
> ifdef.
>
> Drop them.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

> ---
>  drivers/usb/typec/tcpm/tcpci_maxim_core.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/type=
c/tcpm/tcpci_maxim_core.c
> index ff3604be79da73ca5acff7b5b2434c116ed12ef8..43b0ec2d12ba6d4c1cfccbfd3=
55af3e5d9ce1385 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> @@ -563,18 +563,16 @@ static const struct i2c_device_id max_tcpci_id[] =
=3D {
>  };
>  MODULE_DEVICE_TABLE(i2c, max_tcpci_id);
>
> -#ifdef CONFIG_OF
>  static const struct of_device_id max_tcpci_of_match[] =3D {
>         { .compatible =3D "maxim,max33359", },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, max_tcpci_of_match);
> -#endif
>
>  static struct i2c_driver max_tcpci_i2c_driver =3D {
>         .driver =3D {
>                 .name =3D "maxtcpc",
> -               .of_match_table =3D of_match_ptr(max_tcpci_of_match),
> +               .of_match_table =3D max_tcpci_of_match,
>                 .pm =3D &max_tcpci_pm_ops,
>         },
>         .probe =3D max_tcpci_probe,
>
> --
> 2.50.0.727.gbf7dc18ff4-goog
>

