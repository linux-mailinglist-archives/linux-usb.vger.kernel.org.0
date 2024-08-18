Return-Path: <linux-usb+bounces-13588-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 699BF956041
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 02:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFE23B21917
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 00:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62B3155A3C;
	Sun, 18 Aug 2024 23:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TSsUL4D2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818651553A7
	for <linux-usb@vger.kernel.org>; Sun, 18 Aug 2024 23:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724025596; cv=none; b=qfThdxh0vQjZXTRXLuPk/fxiZMj7fpvL4T2KHiT8XkI20hKbSgE/rqMswweYLiSQKWPyilItIQDmkgGTlWe8hEFSSmL3oFeUUsPs+VHU9w7D2ukfVXVNzc7na/sfBMrOyN9mYPu0ZlXgJcfmj98ri5nrTKXT8wGpUmBCXmbtBDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724025596; c=relaxed/simple;
	bh=z0N9D5XVcpqZxaEd+pl+vnTOxVAd7SFe08bbHxXIYoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NVCsldF2ti4LARg8ojPWNJga6PozyZsOmEi710IMfZpDiQnyXGMi20fD/6CxNusXA+1Yoy69Dl0Og/YCdFyew/2WN2oIqJcUM3qJ1c6nzu+Q7nrlTSrA23CZnkqgsz+509Da4ho9g0T0fJy9JMFhh5TrUNrdlMes5EM/vS4v2tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TSsUL4D2; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-699ac6dbf24so34517327b3.3
        for <linux-usb@vger.kernel.org>; Sun, 18 Aug 2024 16:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724025593; x=1724630393; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vru0rFkfffDO8ul33I8RsutWh6laSAqURHQ9zkd+WAc=;
        b=TSsUL4D2CVOU0i7JcKAxkU7ybXRf0gdM4Ocp2kb1gDCvfVoFFyJRpc34ZvoanH4i6c
         GYrl8o36nI1u17U4LUsxkQobjrWvjgQZg7iAz7bWQx2rZYGptGrLtHx4JQ8YA+k8qdqw
         r7FOxkDLWl/jww169mMJLb0Y7UxpqI/8yNScI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724025593; x=1724630393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vru0rFkfffDO8ul33I8RsutWh6laSAqURHQ9zkd+WAc=;
        b=MwTrfJfTYwr+/4rFcicjdnyq6fp0cEZtCYry7yzHz/OGiaSdkd1dpXdv9z7LWVsaZO
         oo2U14wGoXdpR2/lbjh6pMobxHbG08hQQ3L1S6afpH/Qhsp5RpIuy11RBmCQljkzsH5c
         Zl14cL5QcwSW39/Dc/mFH6cXEx1an+DzAN7cc17UOBFCpUCxEDFywSpQCjDE6SvSXiFX
         uV9a0fhkOkAd3vn8rqutlm140BXQrsa3AMQ/e9E3P2KRLZL5BuIeGYAHV2/zYoUmKSbu
         MhqTSxUQPihQ+THQhrIhnke0uODz9v9U+VItmmc1z1xg8zucFgsa421jjmN469d3vr+k
         RnkA==
X-Forwarded-Encrypted: i=1; AJvYcCUiL9yqtFbw5pzDKG2kby8ubzpx4QGOpqTLa/dewei9VGRohayvLYrw8SqDKxBo1KjQtXySA15MqYRNIW2LdyZyB9W735oH7Iru
X-Gm-Message-State: AOJu0Yx3lPwgBNledE0P2ay37CugOy+/8QC0OZCcECsMMIEi0olxxrit
	EXKGhKIoRo8TY9LO1dokSrhiMV7GSEBl+KtKxvHT5Db0cIHmUQk0iXF13Vr6CatUQQKfCsbMnaS
	1av/evFIXBolBp+3dh2c6zMzt2RpSLacU4LKK
X-Google-Smtp-Source: AGHT+IGWQlgWDM+Xaq8uKWLgfnDHLY8ANB7Lkh0ThVi5FVwKD0wOiiRmcw60OrBVx49c9fHnwzmh2XUDTslr5z4WYtc=
X-Received: by 2002:a05:690c:408a:b0:6ae:bb6f:2f29 with SMTP id
 00721157ae682-6b1bc01e044mr74859247b3.44.1724025593457; Sun, 18 Aug 2024
 16:59:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240816135859.3499351-1-heikki.krogerus@linux.intel.com> <20240816135859.3499351-3-heikki.krogerus@linux.intel.com>
In-Reply-To: <20240816135859.3499351-3-heikki.krogerus@linux.intel.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Sun, 18 Aug 2024 16:59:41 -0700
Message-ID: <CANFp7mWnBXy-_9KDEGuOJo0nPoVw6L4Lig_97zW0stbhjetjWw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] usb: typec: ucsi: Don't truncate the reads
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
> That may silently corrupt the data. Instead, failing attempts
> to read more than the interface can handle.
>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 8 ++------
>  drivers/usb/typec/ucsi/ucsi.h | 2 ++
>  2 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.=
c
> index 4039851551c1..96ef099a6f84 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -99,12 +99,8 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 com=
mand, u32 *cci,
>
>         *cci =3D 0;
>
> -       /*
> -        * Below UCSI 2.0, MESSAGE_IN was limited to 16 bytes. Truncate t=
he
> -        * reads here.
> -        */
> -       if (ucsi->version <=3D UCSI_VERSION_1_2)
> -               size =3D clamp(size, 0, 16);
> +       if (size > UCSI_MAX_DATA_LENGTH(ucsi))
> +               return -EINVAL;
>
>         ret =3D ucsi->ops->sync_control(ucsi, command);
>         if (ret)
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.=
h
> index 7bc132b59027..5e3c6cb822c8 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -412,6 +412,8 @@ struct ucsi {
>  #define UCSI_DELAY_DEVICE_PDOS BIT(1)  /* Reading PDOs fails until the p=
arter is in PD mode */
>  };
>
> +#define UCSI_MAX_DATA_LENGTH(u) (((u)->version < UCSI_VERSION_2_0) ? 0x1=
0 : 0xff)
> +
>  #define UCSI_MAX_SVID          5
>  #define UCSI_MAX_ALTMODES      (UCSI_MAX_SVID * 6)
>
> --
> 2.43.0
>
>

Looking through the list of commands that changed between UCSI1.2 and
UCSI2+, only GET_CONNECTOR_STATUS seems to have a size that exceeds 16
bytes (128 bits). As long as we treat that structure specially, this
change should be fine.

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

