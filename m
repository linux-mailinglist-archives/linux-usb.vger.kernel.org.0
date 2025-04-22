Return-Path: <linux-usb+bounces-23306-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7E8A96AA3
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 14:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29FAB7A3630
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 12:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F8C27D783;
	Tue, 22 Apr 2025 12:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fWmZqBKf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468A227CCF2
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 12:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745325904; cv=none; b=Gkv6Ynh4RedSCeuGYLpecvbYcBYRSSfr0I6s7yMa9pq7+Pg+Gki0SV7eFcHcoLk43NIamXHc2Z8WnASqjd4bw2Qp1F5WIoZUdnt7fN3nXTJ+bKReY61i9+31227fwU4LI8505uDYFO396yLYz5cEyOMwueiCqb8zOgvmcq2KRLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745325904; c=relaxed/simple;
	bh=lvVUs2e8qcPQTdzhT6lkVZyLMX8afuB3KeEklSE+EdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HjdZOBq3L5ZYeMgiVWTMY1wHJW6ZdX2Ux1HuDcboq9dbmtsVkN/UySyZQyhta5xwFldLZt+cIEj9M1b/1Sfkqw29JGV02UiFynJuRtO79WOHSZFvu52nScA3pEnfcprhsc1ZLVBsGjsGKZajjAXqCaSPe67dCvpCVSGN5GwG15U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fWmZqBKf; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b074d908e56so3468314a12.2
        for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 05:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745325902; x=1745930702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmv/eppcSNS/FFA0D45HtnI0orFklOBEuu+IeQXnzag=;
        b=fWmZqBKfcVm9Zp/MwvaHYhnjmMUouOb8b5QDbOFiozNH+mQhQ4y4BETQeLOhDm7r0E
         8JtBR3nouN+YzHSlPTm8oieEOqQPmz4rlC9747rrPqviTxNHW3tU1sHepxysWshSxpef
         h9oz+YKITS0SAxIKKAP+mfn3wckbMuYRZZDEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745325902; x=1745930702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmv/eppcSNS/FFA0D45HtnI0orFklOBEuu+IeQXnzag=;
        b=KTuqZYGtebTnXI1UywkaFIzsj27pfMu+7WXHBPYh2vUcCEyYpPS2dY0+7eqBJc5kVZ
         nfZvVzDWGeB3N8PqTFYJkkMUQR0rp4DK9fkMRA9IGeAOA3DmQeXE6FfKZ3H4gyolVbEu
         L6a2tU+HKGd53pkbrRk29bXKNnfLJCh0txv0PJuHCO5MzNfy0bkz+9CRms0w5RKvJcqF
         S/uIfJ0tBtGgF4arTYGXJhonyr7UAhtY4mTIMaKxeIg7iLsoIqCmatZXpaI8MFjSN6En
         4m6Ij/Xt26cX8LD3CTpnkfZB4jH7qHvbGhah04Vb93APGUbYRADKghTlzTByq5gExDTf
         LFFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWti2tdXQsgpdGVqmUNQW1ri/h05AJutJITkH6NIsZMPCAz8kG6M5BF4YXdDxdKO5CP9K+cinbzzzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8/W852WKJWkTZqrYKKMgeYV+xtZTULz6s21zdShObLz81lUQ/
	ZqV5yOSQkV6F3tOf9i4pLTplXMcQMHtf9CtTrE5dL5jhf8mC7a+lj0FE041KmMGMeGEB+xHA8/P
	1GgKMo9vk/GC0wINbpZgdz4nAWVdU8oHgUIVw
X-Gm-Gg: ASbGncttQEa1x1XSUw2U/dzME8eDIAsRQ+Yi0yQKZrvQxD3yBCKkK4KQ6J33ROTVWxu
	ewlH/i0feV01Mv9tzJfTWaOjfQYOYty6upjz12Q1Y1aWGsfa0ULjNvRGRQ+DMgSWWH/8/TotlBc
	wy6xZVWpjlusjWdDNMwrZUeHzmcpd2V4w59VRy9MU3De6zrVy9
X-Google-Smtp-Source: AGHT+IHdTmSx9iS8EFu6hmVr5iQxagekadUQmWy2iPg8Fc4WAFCXivKqI/RbGAfgFTHhUvSFDjFlF3H8NSEt9mNdC88=
X-Received: by 2002:a17:90b:57e6:b0:301:1bce:c252 with SMTP id
 98e67ed59e1d1-3087bbbccb6mr20807109a91.27.1745325902515; Tue, 22 Apr 2025
 05:45:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z_44tOtmml89wQcM@stanley.mountain>
In-Reply-To: <Z_44tOtmml89wQcM@stanley.mountain>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Tue, 22 Apr 2025 14:44:51 +0200
X-Gm-Features: ATxdqUHpL8I3vcFgpkU4A33HaV238Xv7lz1t0Ca9ja9K4i3LKe-c37qpW_-DVJY
Message-ID: <CAMMMRMf0DtXaG4-qkUfAUNEB8sM-oV2Qg5E_3cPr=yjL3fLo4w@mail.gmail.com>
Subject: Re: [PATCH next] usb: typec: class: Unlocked on error in typec_register_partner()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 12:45=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
> We recently added some locking to this function but this error path
> was accidentally missed.  Unlock before returning.
>
> Fixes: ec27386de23a ("usb: typec: class: Fix NULL pointer access")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Andrei Kuchynski <akuchynski@chromium.org>
> ---
>  drivers/usb/typec/class.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 3df3e3736916..67a533e35150 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -1056,6 +1056,7 @@ struct typec_partner *typec_register_partner(struct=
 typec_port *port,
>         ret =3D device_register(&partner->dev);
>         if (ret) {
>                 dev_err(&port->dev, "failed to register partner (%d)\n", =
ret);
> +               mutex_unlock(&port->partner_link_lock);
>                 put_device(&partner->dev);
>                 return ERR_PTR(ret);
>         }
> --
> 2.47.2
>

