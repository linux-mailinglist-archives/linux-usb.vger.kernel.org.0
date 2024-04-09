Return-Path: <linux-usb+bounces-9189-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4C989E0A9
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 18:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B3FE1F2438F
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 16:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD10153598;
	Tue,  9 Apr 2024 16:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eWYbsfjq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B675A13DDB1
	for <linux-usb@vger.kernel.org>; Tue,  9 Apr 2024 16:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712680983; cv=none; b=RCN4ahLLlnI2LraBurr2cDH29W5BOlhylGDRDR40sNKYDLb0lqJKlfJkyTUCsRaRi4JGQDxv1JdCA32ou7gYi/pN9GepP3CJlBk8Cvz4i8fOPFCGiyw2DwdY99ZCOPh3pKMRUqwlLAvxvrcqrNLBEHkjIoOmNCwPKBQOP3FwG1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712680983; c=relaxed/simple;
	bh=0a8GFmlFDrP2qZGUYBXjIAA37zI8J6F9L2EQlfe/B50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UGCLo/+KYUWd4nq9QjhgK4tg0ypMtFDweZqhbM0APUSGjKN9P3tw7+8RVpUDILvzhduRpHQxiPbwWBMXo58BV/SIQr90oi/yjVcv4d1Bvv5q6YFj792y/9eN6ON7MzlplaXbe3+hMctHdnWNiQke1YmcgtJrN0X02wqjWxmf6+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eWYbsfjq; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a51c6e91793so469821666b.0
        for <linux-usb@vger.kernel.org>; Tue, 09 Apr 2024 09:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712680979; x=1713285779; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnTqlWbdyt+TuRAaYpRi/f7MpcKj9Cbb2bnd4lfqWzI=;
        b=eWYbsfjq5WmEWpU7GNpCh/YO3NnimCd4eK8JZAleHjYccDZ4RXZ831mw3grjdNfag1
         MteT8ZJ+GgTmu34TfcUw/ZIEn4kyPN41Ph51LTXr7A8iaV1245+GoiSpN85PmEdEnqxG
         Euj13N23ay1Zs2oCDkS7Md/hwJXhoFcl/jl4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712680979; x=1713285779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FnTqlWbdyt+TuRAaYpRi/f7MpcKj9Cbb2bnd4lfqWzI=;
        b=ZPNMGR0BwIjKJXe0oQhQ218+J4KO1mv3f6/Yrz/DnLXaLf+tuo0KaqOQBh0qfrZ870
         rfh4oCRBjXqsaFqzDzXab5I6VqDe/AR/+e5pIlJ/wSh6J5ySHBN7qeFhlk8jkcqX6sOo
         ybU2eBF0+CtYADKQWP95xMIadWGGtV8ch/6s05wdT0oHnCvFpjlrkUjSzKUX5PU+PZbL
         uGm7dsOSQG9mKC7Mq7zVDrBU0EbI9TZIHsMRWkwtFsYz2ZD+Q5JjjDGccqf7PY85tkVo
         /AyfePYm7Ji0wxHziPTwWeo8CbPmrGW/lsCJmrXnTc3aZfhAg3mkEYcW5wwNVSYTIQ0i
         3WIw==
X-Forwarded-Encrypted: i=1; AJvYcCWLn9fnjASogu0kIPxEJMhdWsomKkmjqq5HY4sb4mPMHZax9i13qQSD0ZNMOHppJniy2IRINZW4CcrV31UkKipTPoNpbV5ssxU/
X-Gm-Message-State: AOJu0YxVKsvx4DYmgAsixmVeJsF9jaE+cGuL+/Byvvr8tsELHKxy3url
	9k6mXPOy75iXC/IopCkMEQtgqCAbO4zO+Nt+xhOqw/GzVA1Vq1cJ+URx7shmIhV6dJlrzZAP92o
	=
X-Google-Smtp-Source: AGHT+IGlNF93zyxnSH2Rk28IOOxjipXZyk0N9cKs2Znqfd5O/ppOwm4kQ+WN5y8oi8bmJ9Fb2HPEog==
X-Received: by 2002:a17:906:4ad2:b0:a51:9d48:d16a with SMTP id u18-20020a1709064ad200b00a519d48d16amr172918ejt.22.1712680979626;
        Tue, 09 Apr 2024 09:42:59 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id w5-20020a170906480500b00a51f7d93e32sm1012898ejq.141.2024.04.09.09.42.58
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 09:42:59 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-416a8ec0239so5123345e9.0
        for <linux-usb@vger.kernel.org>; Tue, 09 Apr 2024 09:42:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWReMW3M93tizyXF8/ebLEd11AYyXSMQ5tGu4DhZNuVVtgBWmXbNKODkJ97xc5NVsRj/LqG7QRK1An8Mvz8Af8Ch/zV3Jc2OxDe
X-Received: by 2002:a05:600c:4fcb:b0:416:6adf:fe44 with SMTP id
 o11-20020a05600c4fcb00b004166adffe44mr2880442wmq.17.1712680978184; Tue, 09
 Apr 2024 09:42:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240408151700.1761009-1-festevam@gmail.com> <2024040940-resume-polygraph-5800@gregkh>
In-Reply-To: <2024040940-resume-polygraph-5800@gregkh>
From: Matthias Kaehlcke <mka@chromium.org>
Date: Tue, 9 Apr 2024 09:42:43 -0700
X-Gmail-Original-Message-ID: <CAKZ8rEMg8SamD_R46LpA9LAh4WUhH=6zsqjkXS0ABVdPAK9Czw@mail.gmail.com>
Message-ID: <CAKZ8rEMg8SamD_R46LpA9LAh4WUhH=6zsqjkXS0ABVdPAK9Czw@mail.gmail.com>
Subject: Re: [PATCH] usb: misc: onboard_usb_hub: Disable the USB hub clock on failure
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Fabio Estevam <festevam@gmail.com>, frieder.schrempf@kontron.de, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 8:29=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Mon, Apr 08, 2024 at 12:17:00PM -0300, Fabio Estevam wrote:
> > From: Fabio Estevam <festevam@denx.de>
> >
> > In case regulator_bulk_enable() fails, the previously enabled USB hub
> > clock should be disabled.
> >
> > Fix it accordingly.
> >
> > Fixes: 65e62b8a955a ("usb: misc: onboard_usb_hub: Add support for clock=
 input")
> > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > ---
> >  drivers/usb/misc/onboard_usb_dev.c | 6 +++++-
>
> This file is not in the tree for 6.9-rc2, can you please fix this up and
> resend?

The driver has been renamed in usb-next. Shouldn't this patch be based
on usb-next and the backports to stable kernels account for the name
change? v6.9 sits a bit in between, since there is no stable branch
yet. The fix doesn't seem super-critical, I guess it would be ok to
leave v6.9 as is for now and add the fix once there is a stable branch
for it.

