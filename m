Return-Path: <linux-usb+bounces-28913-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B402BBEDC4
	for <lists+linux-usb@lfdr.de>; Mon, 06 Oct 2025 19:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36E0A3AD461
	for <lists+linux-usb@lfdr.de>; Mon,  6 Oct 2025 17:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E5B2D130C;
	Mon,  6 Oct 2025 17:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/QrT76T"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF562765D2
	for <linux-usb@vger.kernel.org>; Mon,  6 Oct 2025 17:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759773334; cv=none; b=fmVt9JIL0LvxRhDbanXAIBN5K7WiHP+po3v5Gv2yq84btuZ30uBAaQydzgidEN6vmCy77mQsmFUZ9ff4fEO4xZSDbMnuGT9JjmgbEYyHJjUZ8lia1LU2lZX8m5uThSWa5DO43mAnUQA8e1j07m5FLNvYMTA6F5fRRW3I+0o/xK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759773334; c=relaxed/simple;
	bh=GHjC0ZDFv6Yr8oyAI/yfkHsqZVcSi60mbO6eviVgQuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzN1JDGAxwFNhA0mqkvExlp5F3KmZsGkfPUmxUurjh2ksi8pT9VOdHcbsEeSOhMGThCzM2W9vH6MZaZowGkQtxZnfZVSTUkYWTEvz4BYmgvTRzs+eOGyhR8LvhHf9yEUcO3MUhabV0ER3j/dtyoE5EdCISDrBYxjMv2PljJMZ7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/QrT76T; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3c2db014easo673013066b.0
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 10:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759773331; x=1760378131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHjC0ZDFv6Yr8oyAI/yfkHsqZVcSi60mbO6eviVgQuc=;
        b=N/QrT76TIAdC2Xf8e/7sGmoF71bdpSxLxTI+lbSUcml+PR6Dp0jwxBT4C6AE0r4o8o
         T1qM+WVOZF7QrXXCL+syQMicKzxu9UyklrkNB8MA/Zu4ALwPkQcYjWzsNxPj/APNJe7T
         tGukpanFcOG3zUToZpW7/q6uwTMCrsrqQ0xyxpiBFMmzvTlbjRHniXDmaFTEJDbOwUl8
         4fbHcYWvHnUXbBymjdpBJrqhEvTRZ3mBgsktKxuS+f5c7zBVUToKqAZ+AKsWLKA2hwsB
         IefDx2SQCHTF+XfHABhi7+tKGlW/noDg0tg1TP67ELmziV3DLwyfM82apXcsxR42ayBi
         QEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759773331; x=1760378131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHjC0ZDFv6Yr8oyAI/yfkHsqZVcSi60mbO6eviVgQuc=;
        b=KFaB+TYo/3aLiqVFy7DYXsz0IvZwFWPZs+eiNACFYP7p398Bq95r42M9VNRY6t8D+Q
         AE2diYZKV6Y0pFOoG1+FDA2PfFkb86qKti+3Dnb4oLcO6fJ+DYSFr6FJIesN6nbqm0BA
         oo5EdYbkZSy1XK1XFGwp9mxE7Uqrd5gtygQxNz2Bl3hTE8xojEAC5msDMMIEd0G/4MKv
         KqE0nPkvfpDUZDwip+hBBuhrnS/w7tmkjlaK8wBsMFSOTSiMTyN7YrZwa228xuDAi/qK
         VtNI23BPs0xo0VKn4IJAVFF3OvSVrVnWPimpyseZAhkjo9kkXC3eFf6fFEx0PCsD6Bng
         y4WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHBSx07ZTddEvTskZ0upFk8pP2VgRCpVMYnTUmXxWaRZoqEvG1PNFMHRfQufSR9dt+IQ1TF6ysFeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9ClprVOmQoIH7dcXDD75RrwxJ+NjUNR7lri1KX+KHvrVgdyq/
	439Gf5umadvsEh7zgyujTU6mXeVTHB2wY3GzIl8w6cx49d5P4YbTaNzFkKjt2HtCnlUkfFF9vQf
	TF7vbKMPgEsKJ8fedXV9cCS92RTATY3A=
X-Gm-Gg: ASbGncvN2DG6bLNK8v7d+l2ZPqx2dZYKoWKNNcAmVcwYQTo0qRtEqJijZRHwVlO3BhW
	2odiLyiAAM7OW+vYhDMwiW2nSg0YapIlc8ZuYZD50wTfgriwoCVIJ/+4W6+qcG3f16dYvqhlcG4
	O6zLUGtuNjdUA84nC+vveot6+0UZgeS2nTbkFtSKKj0ER7NzYA8p74TB9xd5JBHJPs9htSmRbBp
	vtejYL2c+qJsmq5JeGjqPJeP+5/GLXhbUrO/jvKI+HnN2nntELbQRtnmBQorh7g
X-Google-Smtp-Source: AGHT+IF6Lji4cfL4NWxn3OG8grf7sXZzXO96Xa1ApY9O9MXdGCSzyo+0gGxA9MRKx5Bp/KFgOH15DtuzKOh+kShvfYQ=
X-Received: by 2002:a17:907:3f9d:b0:b2b:3481:93c8 with SMTP id
 a640c23a62f3a-b49c08981c4mr1708644866b.19.1759773331112; Mon, 06 Oct 2025
 10:55:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251004080123.98285-1-vivekyadav1207731111@gmail.com> <aOOyTtruyDVrzuCe@hovoldconsulting.com>
In-Reply-To: <aOOyTtruyDVrzuCe@hovoldconsulting.com>
From: vivek yadav <vivekyadav1207731111@gmail.com>
Date: Mon, 6 Oct 2025 23:25:19 +0530
X-Gm-Features: AS18NWAG5RtFmRVVuhL6BMEzmjYiCX_hw7o3O3M15qlv2CpXbiPWh2lU4nJxUoY
Message-ID: <CABPSWR7s3o+36gvXb5QQyHYn3LJiDP3vLoVXijU2r9Qi6fA4uw@mail.gmail.com>
Subject: Re: [PATCH] usb: serial: fix: trainling statements `break` should be
 on next line
To: Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan,
Thanks for giving time for the review of my patch.
I understand your point and will avoid such kind of practice.


~~Vivek

On Mon, Oct 6, 2025 at 5:43=E2=80=AFPM Johan Hovold <johan@kernel.org> wrot=
e:
>
> On Sat, Oct 04, 2025 at 01:31:23PM +0530, vivekyadav1207731111@gmail.com =
wrote:
> > From: Vivek Yadav <vivekyadav1207731111@gmail.com>
> >
> > Run `checkpatch.pl` script on path `drivers/usb/serial/*`
>
> Same here, don't do that.
>
> Johan

