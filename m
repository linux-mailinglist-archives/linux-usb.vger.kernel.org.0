Return-Path: <linux-usb+bounces-23096-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2A5A8A5D3
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 19:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1283D1883040
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 17:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FABD21C160;
	Tue, 15 Apr 2025 17:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0W1/9O5G"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8769920ADD8
	for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 17:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744738758; cv=none; b=La/SKJVqjRV/lp9mIfWwLkwXztYiDDeL6a4Qp1erXvEruuCDBwsiora962WvQi9RP4RhCI2EtnnVaEi7SSb6PIbn0JG4wnJ54djG5oANNBjU053Hlvl4M8nmGd3bypDBb9N/yeB3CgpjlXhwh7gOan4Sfwfz0DYnObgX09w/mZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744738758; c=relaxed/simple;
	bh=tXoJgoB+RBXJzosL/7a9etBZs7efpGVXa/rLQQAKzHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cs7a+gNdFH+1MCNkn3/aAQotEdx1vLTkICWYGewUZ0hPtRbx3FIqqPHRgbOefS1dWvt39cZEABu/tq0ElwM8EvUBHpHCQWYJzICHlhPhG+E9dt7j5zYtdm4ALfrc/MjKkb+E2lsXjJZ6/qzx6z1T6ioZQPclYXBGdUpXlP5IH0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0W1/9O5G; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2c1c9b7bd9aso3512367fac.0
        for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 10:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744738755; x=1745343555; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXoJgoB+RBXJzosL/7a9etBZs7efpGVXa/rLQQAKzHI=;
        b=0W1/9O5GoHP7KWyhj/xSPJaVrhaWbiVvpFpOL4dQO7dvVys+ZwmQ+7X6uK+hykJpz8
         +UifNqllcU1YInaYKrj4L+G3dGRuDCliu8KPp2bMhdTWi+m8i2tIi22ecPQYOzcM1Cai
         dNfu8XPsHb87LcsZXIHCvxm2ze6R18Zx2yj2r6gg5gQHgDbHShHxoJK+OSbYVREt8PgW
         khn+qkIsvQziMQe96rHs0hBbvXvIpDXRzIn7gC9hm/RckURg3Xr1O+QmICC6wwfPWJfp
         7XDdUawzRE60LW2RpWKi3Oi7zpe5ilFf27oQyfU+F04xmh/PbS31i6svC3BK48GNJo/a
         u7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744738755; x=1745343555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXoJgoB+RBXJzosL/7a9etBZs7efpGVXa/rLQQAKzHI=;
        b=MUkQES56VUccGFya0h2I5LmVb1HiDZ6CMeshEbE2ubhX/wqdqs1a892bHvnhmw3OPc
         wTMcMiupLXxUMVKuApATb2Ud4gX5VKj6+NEXPYqY1hylBp8np01LaM7PtsvzLoJZBdGE
         5lobwaU5nNDoEPmGe+uSrStG1WcgIfv7dmSh93jlQYHcIxcpWIwDeHgXcfASA/SfaZPQ
         S8jKocsVKuuL2ON1jq22j49NfIaqGpztvfv0moq2qoiFsb1mmWdUSy7QQhKPagH3xt8Z
         SZVnMZ8i49oLUkynoBLTxT9lzdXZTklGWkYw3GFg7xEyA+yv26aGvudcEDv/bYN8cRJf
         AP9A==
X-Forwarded-Encrypted: i=1; AJvYcCXmwauuLb4J9eJyP6kMFFZw+qnriBqZbiaOt1FBxM9kJN002mH/xGaVrSnbwxZWel5xb7gEvkvqLQc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGx2fGJ91oiEuEdLsd5h860+UqZmRqnyWLk9eLak5WO9AwxTgd
	cWhAbFHDyLbV0r+TpfVp4E2qnqeSQlPyvTRTgUC0dprSEI49BxeRzZX0cL7BUXZyUtf9xejw2F0
	SrBcGccoybdDaSDz0eUwsS2lqbbzW8M/9dwhb
X-Gm-Gg: ASbGncvVDimuTbv+2k1k+f/AOPgkRvhMQYFzHE3CPBMFFbYGbFL6+iOo4CYAeHLMUx6
	Y19OEHVzTHwx4o8noIbFXcAJxeikGGIJPd8zziopocjOAwgzSYQnVCzYo++E0mXv/OC52WvSyPx
	OZmzph9tPa+GnVInKBNujSUu/5Tqv9eymdbP0vf+WyAel6jdfzX5Ihv+A=
X-Google-Smtp-Source: AGHT+IG37S5TiTt5j85RpGQMIuclgJ1hOUgamBAVXGItkh34XyzQhbNLPLJRhIF+KMlvWsa+2WxRqkNqOvVNAzKC45k=
X-Received: by 2002:a05:6871:91cb:b0:29d:c709:a76c with SMTP id
 586e51a60fabf-2d4c3a912bfmr58179fac.4.1744738755309; Tue, 15 Apr 2025
 10:39:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407133306.387576-1-heikki.krogerus@linux.intel.com> <2025041127-vicinity-slate-6b72@gregkh>
In-Reply-To: <2025041127-vicinity-slate-6b72@gregkh>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Tue, 15 Apr 2025 10:38:37 -0700
X-Gm-Features: ATxdqUGwjO_2tDDazMGLIzjNP2-788zDTK7LHdusy-b9T3JdnZS0QM-J_A5TxO8
Message-ID: <CAPTae5+fNsRHVrrZd_UBV1PSuwoYrqKO_hz-VbqfbBfePjEG9w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Assign maintainer for the port controller drivers
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Amit Sunil Dhamne <amitsd@google.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-usb@vger.kernel.org, Kyle Tso <kyletso@google.com>, 
	RD Babiera <rdbabiera@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 5:49=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Apr 07, 2025 at 04:33:06PM +0300, Heikki Krogerus wrote:
> > Especially the port manager (tcpm.c) is so major driver that
> > it should have somebody watching over it who really
> > understands it, and the port controller interface in
> > general. Assigning Badhri as the designated reviewer and
> > restoring the status to Maintained from Orphan.
> >
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Acked-by: Badhri Jagan Sridharan <badhri@google.com>

> > Cc: Badhri Jagan Sridharan <badhri@google.com>
> > ---
> > Hi,
> >
> > I'm proposing here that Badhri takes the role of the maintainer of
> > the core tcpm.c and tcpci.c. I think he would be the best person for
> > the job.
> >
> > Badhri, I hope this is okay with you.

LGTM, will also send a follow up patch proposing to maintain the below
drivers as well.
Will also add more folks to the list.

- maxim_contaminant.c
- tcpci_maxim.h
- tcpci_maxim_core.c



>
> I need an ack from Badhri before I can take this.

Done !

>
> thanks,
>
> greg k-h

Regards,
Badhri

