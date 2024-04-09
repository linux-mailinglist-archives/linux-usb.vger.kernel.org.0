Return-Path: <linux-usb+bounces-9104-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AA63989D07A
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 04:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B242B245F4
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 02:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD195466E;
	Tue,  9 Apr 2024 02:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dBLY5eHZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C2554645
	for <linux-usb@vger.kernel.org>; Tue,  9 Apr 2024 02:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712630894; cv=none; b=OiqTCoEVGA5CRG2HlPBOVOPKUnwRtq3d1Dlwo+TYbXi+HfGKgGEAHVfM1q4RNkjP9iUZX9dkkdIFVgwf/81paD5hTF6yL3PdVmDhahkdUwB3d5kuYpiGIbvTaZXjeidhgI3harh3PJe4D4FnOapbQGy2C4pi9rJltEU2VBm96OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712630894; c=relaxed/simple;
	bh=W4VPnTaME3YXfp3NpzQHHD041XAWthswcv7tncBwfu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E6Cj85treBqO9vPmZiKthq1c7Vtvk7q11vfw6f8bVB3AvB23ujck7JOOPgkAebPUnmoudHM0wYsEXNd8FPZ8+JmGXVNG3Rs5cJw8QZcuIUKm/VUBEBFDylq3nuYI6Of8T1N+u6g+sj2bzan+H8NpmOVYOaLttlvvH3DhMHa1kG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dBLY5eHZ; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4daaa559464so1411737e0c.2
        for <linux-usb@vger.kernel.org>; Mon, 08 Apr 2024 19:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712630892; x=1713235692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dBIuA8MJb7TXY6gP2nJKpF5Bnu0yGdIwXcvJf/sg8k=;
        b=dBLY5eHZFJ12aIoqTRXhZDF/xQ8m3L2hwgknOYODFpiR3u/j9LCUCU6wWpWwX+EJuS
         Ok0bGnS1YOKhcwyBYP8d1G1df79Lx22QFjSOgLD1pdNVgYMpi1bFPpRteqCOa2qkpKE2
         UxdVNUdRIii+bhONfxQYZ+R373TODSdaMpuP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712630892; x=1713235692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1dBIuA8MJb7TXY6gP2nJKpF5Bnu0yGdIwXcvJf/sg8k=;
        b=bo4oH74lO64wlEyKf0BBMuLUPf7oFRsXC1KffxJlBz7QhSjrQ0jAM4dhRgpuZ24/qO
         xJ5WScoOvqsMXYikC9wieqCpeoALI7bvwpr/2xSUU2MyVNZfpF+1WCdiU26AB+JUlVJb
         zMFjSlTrOoWz1DqxWb9vvw8kmtK3wCp3K+tmzYQknQtW2VbiXoptdS/ehFro6rzHu9eR
         LOvUwZHuVKLKWgJYIpA+Jh2Wq4/aVk+pPX9OszCUD2YV/nfAOCBVcpM8fmq2qzesBMlU
         RwrA28qrbogFQ3gaSFhsYPjDk0y3KF3CwxSYpjechUz97JmV7h3vlNaDuF8SYnJCW4mS
         b3yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrxGhOzqp4e/+nGUSMuD6h60n7+RpJ7xyeMNNin0IsWLYMjTY7eALib9bL2vuCzPpKST6tYKKPqMzHd7Hugl0lsXRdP89Kf3jQ
X-Gm-Message-State: AOJu0Ywf1hbUHqI+p0FXEE2o4jwnbTDd/hdWp2bsOeEQhcon+A3TwGO9
	63ogUKxkh0myP++fjGwvl2WxnOSqaL8r063XEE8ueu3BEj540RBDxHaghcgxaseT9vOB99d57+T
	C5qYO42aL46omYoWFXGo07qa2Ahvyvbj1kBc4
X-Google-Smtp-Source: AGHT+IFIXf0vpiEQ1qCQSCaNGZ8MV+ukl2NhARckU0H0zff/FgyaI+tYw3clXwkn/jgzLFQ8h12wgcpIe0KLPUaDmtg=
X-Received: by 2002:ac5:cdd1:0:b0:4ca:4a07:9006 with SMTP id
 u17-20020ac5cdd1000000b004ca4a079006mr6531323vkn.0.1712630891756; Mon, 08 Apr
 2024 19:48:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403-public-ucsi-h-v3-0-f848e18c8ed2@chromium.org>
 <20240403-public-ucsi-h-v3-2-f848e18c8ed2@chromium.org> <ZhOnKWcNllls6gdA@google.com>
In-Reply-To: <ZhOnKWcNllls6gdA@google.com>
From: Pavan Holla <pholla@chromium.org>
Date: Mon, 8 Apr 2024 19:47:35 -0700
Message-ID: <CAB2FV=4_TYP=uBHjJLDwKOdnyfdurX5k5LqqtOPpX4er1fKiZg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've uploaded v4. PTAL.

On Mon, Apr 8, 2024 at 1:13=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> How this driver get probed?  From drivers/mfd/cros_ec_dev.c?  If so, ther=
e is
> no "cros-ec-ucsi" in the MFD driver yet.

Yes, this should get probed from drivers/mfd/cros_ec_dev.c. However, the
corresponding change in the EC is still under review. I was planning to sen=
d
it out once the EC change lands. Please let me know if you think that this
review should wait until then.

>
> > diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/=
ucsi/cros_ec_ucsi.c
> > [...]
> > +static int cros_ucsi_async_write(struct ucsi *ucsi, unsigned int offse=
t,
> > +                              const void *val, size_t val_len)
> > +{
> > +     struct cros_ucsi_data *udata =3D ucsi_get_drvdata(ucsi);
> > +     uint8_t ec_buffer[MAX_EC_DATA_SIZE + sizeof(struct ec_params_ucsi=
_ppm_set)];
> > +     struct ec_params_ucsi_ppm_set *req =3D (struct ec_params_ucsi_ppm=
_set *)ec_buffer;
> > +     int ret =3D 0;
>
> The initialization is redundant.  `ret` will be overridden soon.

Removed.

>
> > +     if (val_len > MAX_EC_DATA_SIZE) {
> > +             dev_err(udata->dev, "Can't write %zu bytes. Too big.", va=
l_len);
> > +             return -EINVAL;
> > +     }
> > +
> > +     memset(req, 0, sizeof(ec_buffer));
>
> The `memset` is redundant.

Removed.

>
> > +     req->offset =3D offset;
> > +     memcpy(req->data, val, val_len);
> > +     ret =3D cros_ec_cmd(udata->ec, 0, EC_CMD_UCSI_PPM_SET,
> > +                       req, sizeof(struct ec_params_ucsi_ppm_set) + va=
l_len, NULL, 0);
>
> `sizeof(*req)`.

Done.

>
> > +static int cros_ucsi_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > [...]
> > +     udata->ucsi =3D ucsi_create(udata->dev, &cros_ucsi_ops);
>
> `dev`.
>
> > [...]
> > +static const struct platform_device_id cros_ec_ucsi_id[] =3D {
>
> To be consistent with other symbols, consider either:
> - s/cros_ec_/cros_/ for the symbol.
> or
> - s/cros_ucsi_/cros_ec_ucsi_/g for echoing the file name.

Replaced cros_ec_ucsi_id with cros_ucsi_id.

> > +     { "cros-ec-ucsi"},
>
> The driver has declared DRV_NAME, use it.  `{ DRV_NAME, 0 },`.
>

Used DRV_NAME.

> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(platform, cros_ec_ucsi_id);
>
> Ditto.

Replaced cros_ec_ucsi_id with cros_ucsi_id.

> > +static struct platform_driver cros_ucsi_driver =3D {
> > +     .driver =3D {
> > +             .name =3D DRV_NAME,
> > +             .pm =3D &cros_ucsi_pm_ops,
> > +     },
> > +     .id_table =3D cros_ec_ucsi_id,
>
> Ditto.

Replaced cros_ec_ucsi_id with cros_ucsi_id.

Thanks,
Pavan

