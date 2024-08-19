Return-Path: <linux-usb+bounces-13590-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D8495604A
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 02:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E52D11F21E7B
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 00:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672E510E0;
	Mon, 19 Aug 2024 00:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZdIiR2/v"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76418A92F
	for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 00:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724025858; cv=none; b=XCtiV6ZtcLmAo1hMO8KJEDZG7Zj307POMQ2tLSaOylNKcRjP0igAVU8jDPuaFLIqbtZANvdDarqEmjQ7LDvGIxcpcQcAO8v9ZVnft+QYUB5y3/mveYHsmmAFQgFbYrLWneOKOAfdI9sgTHGMMJIR1cEiYnYZdGjefoqLIaWsu24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724025858; c=relaxed/simple;
	bh=9vaS7/c+B2EFURTQIFfA5i5n+dRJTOwBio+D0EsUzV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mzDITJwbHI+xttbGLadL86K1PkTGEDxW3TtWOGJFuvGR7R57pjVya9J2t3I01/gw2tGnyLI3uv/5xv9y/k6oAQZ+omZIuZc42+fwEYsdt/LKW5TQFMiNA7TBisdQUIt0wY7Sh3cSNL1cPV2WCof3xxpO5Hr4RRpw9NTx6OkI3d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZdIiR2/v; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-690af536546so37184907b3.3
        for <linux-usb@vger.kernel.org>; Sun, 18 Aug 2024 17:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724025855; x=1724630655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtAas8rPZm/jCwIbeQeGl7G2l9FzQDOzcAA0rH1OTAk=;
        b=ZdIiR2/vu46CYJK9pYDvy7MgFozRJyrSSbZY8XBqDK5b167v1TNIlxdscPncXe32nc
         QtSFBJdmJ8mgsNlcbHycD0S14olCLtJG5xIxHlpCILYDZltGfUezFbhnsGk9Rr7aj99s
         imFSDZ8wtcb85Lb7Gowp8Gx3dWmXCpFzJefzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724025855; x=1724630655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CtAas8rPZm/jCwIbeQeGl7G2l9FzQDOzcAA0rH1OTAk=;
        b=m6YVts5CCTWHfwaDhIJf6bqFbLqyuuWb95N1nEFBvhzULQ/fmFu6ySR4N4lVrl3vND
         9Ss8Yhwkx/to0JKY+B9HtKWps2RdfcTTvPo/0xozbINCHJCDkUHzRtzDHOUrLtZFkkc9
         L3DPqykvgkovFdmpwcQbXOCln2u1Snrr+ccm7A52aBmtmCZD8yDioWI3X0l6gpcNeGKL
         igDmuiDX2+oo8QE63CziXxoZmOYqRbmqAwZw1jAov8uuVfes7ClONwU22VcxupP/KZIe
         SKKMCrs1Xnms/c2pQCqOFr+Y3tczsDvXeRb9JiI0APuJE3qM6khVW4NbOZn6QDorbLi0
         1XYg==
X-Forwarded-Encrypted: i=1; AJvYcCU/rODuiXpLDgbsdbmBRdRZ7Sjml3Mac8umdWdRxP2zE14YkJp8fegctr2RgYE/QCQTpB6rAroacCbb6Yl7SweEWbEp3AuINIXc
X-Gm-Message-State: AOJu0YzNzDpiTjFAM9LxV5LUb6lqIjfZZkTQS6arw+gH2wPEZtykSGzY
	YRcNqEPxvfCu69k+sHFU42iZ9MmGayVK/KLnngGIygyR4iERNASd4UmJQ1vjF8KxqAwZNOOq/XW
	MSZXb3FKLe7rqK4b86uXyxI/Ts+lhpcDVnNtmgZPHy5Gx5rA=
X-Google-Smtp-Source: AGHT+IHVya+rs5fHz0Fh1OR7of8r1iVxIFAZEWnFZXiK9wAxZF8n+BuX5Wwi6AIrLi3jdyC0E1ymE/pdCjpauoBR/Y0=
X-Received: by 2002:a05:690c:4a92:b0:6b0:70fc:f6e4 with SMTP id
 00721157ae682-6b44f7623famr52786807b3.15.1724025855481; Sun, 18 Aug 2024
 17:04:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240816135859.3499351-1-heikki.krogerus@linux.intel.com> <20240816135859.3499351-4-heikki.krogerus@linux.intel.com>
In-Reply-To: <20240816135859.3499351-4-heikki.krogerus@linux.intel.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Sun, 18 Aug 2024 17:04:04 -0700
Message-ID: <CANFp7mWSaTmpS_7jjx5-tnun_786L_nvky6rcvFRyX++AUjANw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] usb: typec: ucsi: Only assign the identity
 structure if the PPM supports it
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jameson Thies <jthies@google.com>, 
	Benson Leung <bleung@chromium.org>, Prashant Malani <pmalani@chromium.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-usb@vger.kernel.org, 
	"Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>, 
	Abhishek Pandit-Subedi <abhishekpandit@google.com>, Bartosz Szpila <bszpila@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 6:59=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> This will make sure that the identity sysfs attribute files
> are kept hidden if the UCSI interface doesn't support
> reading the USB Power Delivery messages.
>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.=
c
> index 96ef099a6f84..1f6e3f0d25c1 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -979,7 +979,8 @@ static int ucsi_register_cable(struct ucsi_connector =
*con)
>                 break;
>         }
>
> -       desc.identity =3D &con->cable_identity;
> +       if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
> +               desc.identity =3D &con->cable_identity;
>         desc.active =3D !!(UCSI_CABLE_PROP_FLAG_ACTIVE_CABLE &
>                          con->cable_prop.flags);
>         desc.pd_revision =3D UCSI_CABLE_PROP_FLAG_PD_MAJOR_REV_AS_BCD(
> @@ -1058,7 +1059,8 @@ static int ucsi_register_partner(struct ucsi_connec=
tor *con)
>         if (pwr_opmode =3D=3D UCSI_CONSTAT_PWR_OPMODE_PD)
>                 ucsi_register_device_pdos(con);
>
> -       desc.identity =3D &con->partner_identity;
> +       if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
> +               desc.identity =3D &con->partner_identity;
>         desc.usb_pd =3D pwr_opmode =3D=3D UCSI_CONSTAT_PWR_OPMODE_PD;
>         desc.pd_revision =3D UCSI_CONCAP_FLAG_PARTNER_PD_MAJOR_REV_AS_BCD=
(con->cap.flags);
>
> --
> 2.43.0
>
>

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

