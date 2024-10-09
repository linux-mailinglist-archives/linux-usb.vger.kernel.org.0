Return-Path: <linux-usb+bounces-15920-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FE09968F2
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 13:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 209631F22E28
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 11:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34EFF1922EB;
	Wed,  9 Oct 2024 11:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JXghI08I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A41B191F74
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 11:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728473799; cv=none; b=kKdj2BGiBQg+0ISuJINEG2g/I5zNsFXMH2t1yyrUcVDzRjo+SOl5VfmsEW9cekPnnFYSQDJiNOr/Kv/bT0NvezbbcWqIQlSfGC/sVXME2AK5/ioMQaDClQZO8nJncEDzGPQKo/aHxgZ0eJMiSZIzlAz7hjuD+/D3M2YiwqqEbZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728473799; c=relaxed/simple;
	bh=2UcU/0RtPhKNhvF75glrExZYJbVt3PfbtvA++YZnAZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h1p03OTowhQGVETIJM0qvpDZOn8gelgd+AzrQuI4jsN0MbUux2H5RjsZLkt+rkbCTxQS3CzivLVR9ej/tMPmqb/i92gJLdMGgRmBVkVIlnBA/co8xCR0F1InmXWVhUe/vU+ech7MrgVwDYICqIZ1bwZfTxZZA7fupLV3ClNeYcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JXghI08I; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43111d23e29so123965e9.1
        for <linux-usb@vger.kernel.org>; Wed, 09 Oct 2024 04:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728473796; x=1729078596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26JiU8VHKWoZ3njFmpEz3ylcfDTsVxNL+ck1QcmMiWk=;
        b=JXghI08IJvHzsidCaZxISnDwGe/hyiLQN/VjsGk1vH6EPPiZcim29IozovgzYqXmJD
         uirYLjl3WnXo7o20zIXgjrwV4h3D9S3MwsAgh/VXLOzCeEuGgtf1pyEuIHB0VK1Xyjan
         YxLioLWQ5GC0Dy1+0t8ApNJodxiuBUSAZ+5U14c2V1GSf3TZk7ZrN+jsOEZjPO2XEfxH
         XmTJ8LBx99dHrvVDxp2qWi4gsYupBbJ6ZUI/CXtnECncAf7fxahkxixGT6Aqq6lDpLn4
         MF6L8Y3FuvNcdQ1fhvdf8ib4dShKg6ozHJdG+MWCvLXle+67s/asR6SdG6oZIQs90B3M
         iYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728473796; x=1729078596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26JiU8VHKWoZ3njFmpEz3ylcfDTsVxNL+ck1QcmMiWk=;
        b=hLiuS3bOSKSLQetekW3H8gCGzSbVzC4BnvAbADalhE8HB15gwrYGtJRFilqhxyd0Bj
         yruhtbTOExD2n/jPMeeR0HIvq7xTupe3eb94gBDqwBZl4NzT/p+Lwcbg4OVOI78UL4Cy
         Q9LWonjtC6nKwR2OOl72KKDOSLkOdjXljELvKusUjxnV2JJV4fEUnslffEfmh77d0G06
         kZqrD6WSYWoHSEIxGm37b50HePTxEXfsrN+k7ag6Nn3yh653xOjtWkBA4R/6FFnI9v//
         8y5LbbEoZkg6lzN4Al/DiB9TM6S3PD47D1Bbe3wIC0eUAaUPNPczlgZMLWLZWVU+xvmT
         H9hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc+BlnQ+v9UQdI9/G/sCaJQ7uw4FRhRsqSSDYeqTclI6sF9i4Jez9FGrGnStQ/zNf/1NbHPYGIe3M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh7irk80FEbyQvkZPgKoYDmycZaJh2uWPvGiwX8ax4TUwjGiks
	ZUxAorv2f6YgDfLgfiKhFhzRz0qFVB9NPjEgSO6wJJTqY4I1FdMh2a8WkjT64mHMdkJhQElH56y
	VcwQNtdeZpTaD7W6IDs0+VtbK9bIdoCbvaoZB
X-Google-Smtp-Source: AGHT+IGKWLOazhBj7mWGSjUC0jjh31+NRgp4kNmDT13H0EjvYGZiGvvd2lLhjCqnoT37E/MkhleYdk7a/22l9VV0YdE=
X-Received: by 2002:a05:600c:a015:b0:42c:abae:2ed5 with SMTP id
 5b1f17b1804b1-430c3a9a4b0mr3088625e9.3.1728473796283; Wed, 09 Oct 2024
 04:36:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009054429.3970438-1-guanyulin@google.com>
 <20241009054429.3970438-4-guanyulin@google.com> <737eeb51-b5eb-4585-a9d2-f1578b21d86f@linux.intel.com>
In-Reply-To: <737eeb51-b5eb-4585-a9d2-f1578b21d86f@linux.intel.com>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Wed, 9 Oct 2024 19:36:00 +0800
Message-ID: <CAOuDEK1=X7NdWLMdbHzpO_g15p6JeU0_vb+YOs6TXc2hNfxmJQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] usb: add apis for sideband uasge tracking
To: =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, elder@kernel.org, 
	oneukum@suse.com, yajun.deng@linux.dev, dianders@chromium.org, 
	kekrby@gmail.com, perex@perex.cz, tiwai@suse.com, tj@kernel.org, 
	stanley_chang@realtek.com, andreyknvl@gmail.com, 
	christophe.jaillet@wanadoo.fr, quic_jjohnson@quicinc.com, 
	ricardo@marliere.net, grundler@chromium.org, niko.mauno@vaisala.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, badhri@google.com, albertccwang@google.com, 
	quic_wcheng@quicinc.com, pumahsu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 3:33=E2=80=AFPM Amadeusz S=C5=82awi=C5=84ski
<amadeuszx.slawinski@linux.intel.com> wrote:
>
> On 10/9/2024 7:42 AM, Guan-Yu Lin wrote:
> >
> > +void usb_sideband_get(struct usb_device *udev)
> > +{
> > +     struct usb_device *parent =3D udev;
>
> Is it really "parent" in this case? Perhaps better variable name would
> just be "device".
>
Thanks for the heads-up, will change it to "device" in the next patchset.
> > +
> > +     do {
> > +             atomic_inc(&parent->sb_usage_count);
> > +             parent =3D parent->parent;
> > +     } while (parent);
> > +}
> > +EXPORT_SYMBOL_GPL(usb_sideband_get);
> > +
>
> Similarly here.
>
> > +
> > +     do {
> > +             atomic_dec(&parent->sb_usage_count);
> > +             parent =3D parent->parent;
> > +     } while (parent);
> > +}
> > +EXPORT_SYMBOL_GPL(usb_sideband_put);
> > +

Regards,
Guan-Yu

