Return-Path: <linux-usb+bounces-29489-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 147F0BF7051
	for <lists+linux-usb@lfdr.de>; Tue, 21 Oct 2025 16:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C78B519A4582
	for <lists+linux-usb@lfdr.de>; Tue, 21 Oct 2025 14:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505652D6E67;
	Tue, 21 Oct 2025 14:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UE91G58O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B301EDA1E
	for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 14:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761056367; cv=none; b=u3Hw1WhjmsrmRFgSGfzIRsZUgeCFyn+5LGQ1de3T9SnRjBgnAnpYrL6f/df//hIh0hdbu2LsztXjxpPcUiJ6qTCb75CkAJzQmhyseFi+GGr7zV9ehhgL5sbxVDYdrreKc23PG+YYNZzOccrSQAcXRBrR8h8K0/Dm2t3gBCFSzQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761056367; c=relaxed/simple;
	bh=L2kPsqPKw1JgCCFXpbyfRvm/7VjWm7EVFxxOo1tNXMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f4ZYXyynCJVRUt/16i0OaCnTp8lgQ6r4G/LWBkvYqrjRju+KwUM36SmkQHNxmpsWQdB6RZb28bmpKY/fMes9CuE6+oBHIiaf+jvSZfKfQY+/VQFIRTkXIPHGZWQybQOCTr9eO2CDkly8s2ftqTMu0gaJg7js6RfAmoXeN58qZ5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UE91G58O; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4711f156326so43477195e9.1
        for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 07:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761056364; x=1761661164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJsoERq+lbtNyBXS9BXRJIRxk8+1s/ACK0Sp04sYLmo=;
        b=UE91G58O3po8+pUM55mgcQ7DjQ2f/C/x5sb3gffPcGZzdf808apvNVF/ztXs235D46
         wR+U//YtOgMR9uJKr6C28XbuM0RRFdZKOiuax9o9cTE7eo6PXTSAnMLfcG45fbtf7hNK
         udDSvo9byi0AGSM59iCQZ8/jnpUe7qWHqEnu87yqbP403Esagx00r8vSBg74bgSP5ZBs
         osH9F4gRfjd736JqCo6KzO5kw3Yj92FG+16fZ+YdW8oTbLY4EJ8iZB/Ft35Pcxd8qoJA
         lRdBbAauW2eV/1gHYcRSOR36/wzOeXyUYpVD02C7Oo2TSi+/JDxTfNw1xkubUPue3oNp
         Wpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761056364; x=1761661164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJsoERq+lbtNyBXS9BXRJIRxk8+1s/ACK0Sp04sYLmo=;
        b=GE4UnBiUQVnAC1FSkY63X0km8tAGxWro6AU1aIZNX6JjHe6DaEiYSHTY3d7cG1O34y
         4jbPKikHPVgEHOMnv3Mi/8lXLbHjsaB3Qge3cxQpobZeCHlkK+ry3HAWPFsDLNoQd+Iq
         QmTND7x6hzGQO+agmO6sv4LbAxvh+c8NuAvLbxG4seGdIjdXefkMtsjC2oyd0iKn2tXt
         jssDBqa3sJs5kAbtkLv3C+DZHNUYDsMLV9uHneczjo9kYFTCLXJg9KQ3mV2RFU31oNe1
         GRd9KDlBTXSRk8hI8PoprsKrmodGX3cUvLqdceYwEHFAaWuD4mf0CheayfOmXhKKMh0z
         uXow==
X-Forwarded-Encrypted: i=1; AJvYcCVhYxwRU3pY6M7NLpZc3b4/1BQeKP3rN87gm8vDjGPRtc8WdsQjDg65ZKVT8iDIaejNcGynZ1VFg/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaClDG4L7rkhgHu16vV7TBKkJf4KVXHzKuVRpnGqxklr19Si50
	yPp6HZU+Xnryn7baULvxMZKlXArBKObmCSCsWI289bqlkYWCanIwjTDBfDNoeQy4sdkscOJ8mQI
	Q8y+pARNekEe5zzDt8nwfRJCRKts8+BcgZA==
X-Gm-Gg: ASbGncv9tOel2qt4ByYvFEfq7nnCX4MRXegSrjSIzCVssXqZI7SfalbIl6rO7K7lz46
	BJOZoWKLGORw+Rf85li4Vx1Z/qRbvPT1DBrZIpGb+xi/aj7yVVY6KgxT+1LI2VH3SGmBiNoKuby
	W1/SYBmM6JbnC2cqQ+g2cN7FMv1mkGEdvfiNyAwhiTMDRHLhkW/kLsRqC9Sif4Yp7waKdtmFwlA
	m5Fse5wTf4REKmPqwKt3bzob1sNzp8QjooKeYBwG9uZEhy+jUXG/YstOo1xJ/qGkbN5dz8DfCyG
	fCY95zPP216coGj2vvs=
X-Google-Smtp-Source: AGHT+IF90bxjz8ix40Ll9PxzTcZHjhnAQi9gB+R9Z+uHtbgPIaVOQudoZ+vcDoGIlUSSnwqhVwARNc6fqY+obGVADgc=
X-Received: by 2002:a5d:5c89:0:b0:3e8:ee5d:f31e with SMTP id
 ffacd0b85a97d-42704d7eb32mr13379995f8f.25.1761056364261; Tue, 21 Oct 2025
 07:19:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a6024e8eab679043e9b8a5defdb41c4bda62f02b.1757016152.git.andreyknvl@gmail.com>
 <CA+fCnZdG+X48_W_bSKYpziKohjp1QVgDzUzfYK_KOk42j58_ZA@mail.gmail.com>
In-Reply-To: <CA+fCnZdG+X48_W_bSKYpziKohjp1QVgDzUzfYK_KOk42j58_ZA@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 21 Oct 2025 16:19:13 +0200
X-Gm-Features: AS18NWCPMHLTced0Dmr8zTG585fd-t61s0ttRFUl_G7jBr-X0tGHFlvGwKtayRE
Message-ID: <CA+fCnZdHJtHgZuD9tiDGD8svXTEdP=GK8HSo71y_UfKgZcaUxg@mail.gmail.com>
Subject: Re: [PATCH] usb: raw-gadget: do not limit transfer length
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	andrey.konovalov@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 4:18=E2=80=AFPM Andrey Konovalov <andreyknvl@gmail.=
com> wrote:
>
> On Thu, Sep 4, 2025 at 10:08=E2=80=AFPM <andrey.konovalov@linux.dev> wrot=
e:
> >
> > From: Andrey Konovalov <andreyknvl@gmail.com>
> >
> > Drop the check on the maximum transfer length in Raw Gadget for both
> > control and non-control transfers.
> >
> > Limiting the transfer length causes a problem with emulating USB device=
s
> > whose full configuration descriptor exceeds PAGE_SIZE in length.
> >
> > Overall, there does not appear to be any reason to enforce any kind of
> > transfer length limit on the Raw Gadget side for either control or
> > non-control transfers, so let's just drop the related check.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
> > Signed-off-by: Andrey Konovalov <andreyknvl@gmail.com>
> > ---
> >  drivers/usb/gadget/legacy/raw_gadget.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadge=
t/legacy/raw_gadget.c
> > index 20165e1582d9..b71680c58de6 100644
> > --- a/drivers/usb/gadget/legacy/raw_gadget.c
> > +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> > @@ -667,8 +667,6 @@ static void *raw_alloc_io_data(struct usb_raw_ep_io=
 *io, void __user *ptr,
> >                 return ERR_PTR(-EINVAL);
> >         if (!usb_raw_io_flags_valid(io->flags))
> >                 return ERR_PTR(-EINVAL);
> > -       if (io->length > PAGE_SIZE)
> > -               return ERR_PTR(-EINVAL);
> >         if (get_from_user)
> >                 data =3D memdup_user(ptr + sizeof(*io), io->length);
> >         else {
> > --
> > 2.43.0
> >
>
> Hi Greg,
>
> Could you pick up this patch?
>
> Thank you!

(Greg to To:)

