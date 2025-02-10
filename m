Return-Path: <linux-usb+bounces-20419-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27820A2F1F5
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 16:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8367A1886870
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 15:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A671123CF09;
	Mon, 10 Feb 2025 15:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oscium-com.20230601.gappssmtp.com header.i=@oscium-com.20230601.gappssmtp.com header.b="giS7TOBm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47ADB241109
	for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2025 15:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739202180; cv=none; b=Ogg5iCke5oOz2dUsUg4kTD+rI0MY+dx/3r0eOzquHybQ5Q4cX0U7TVkFi7vlxtFqsjAM00ilUAzib8G1IAXPhR9UXPUXfSezjx9QPtQtp4ohlRI6fa9cVXabeZejqre/oLTQdb1a8CERPWrWWGN2TGMwiONn3hH5zswGj0q5xb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739202180; c=relaxed/simple;
	bh=Nyooj2P9dYKH+qtnOTnz0ghVja6RzjygkVAJk/LLMuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jm29WPJmc1AhT/8dnX5pNycoyEfmANEyU05pylNOUwaGqD5CjUbSdwp2QozqsuWGAHtlEwOcrFEBIwFPUKiAQGfmWr8Q/4qIPDCD/UmnVPYLJSL0H5MVTlG9rKuH+ctvjtJGcLYQRpmFopX07tw3+H3UHJ7ZuI38NzEVAEVSEFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oscium.com; spf=pass smtp.mailfrom=oscium.com; dkim=pass (2048-bit key) header.d=oscium-com.20230601.gappssmtp.com header.i=@oscium-com.20230601.gappssmtp.com header.b=giS7TOBm; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oscium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oscium.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86704887709so1000346241.3
        for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2025 07:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oscium-com.20230601.gappssmtp.com; s=20230601; t=1739202177; x=1739806977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLiwY3ApPPCC7px+qsl6Afe8b+v2qYbxeA54xnF/JPo=;
        b=giS7TOBmw8Iqo/vw3MpYJM7RPC3VgW2XarIuZigPgNjiPKmiw1QqX31WwDZT1bIQvE
         EkzalmzzK+z9TZcvxXPCXj+nhgvw2nmORTfbZ5T2u/B7arkj0IDee8YioURORP+p+Nk/
         Z6gXWaagPlgNGLaERznGrD7BYZj5TZeCgneYeqiuny+5wgzdNrW8eH1Yy6QZn3X4g7/I
         QGDPSsNM7A7l8jsBfRlMlyoLS/5OwwVSSFSM7mdzw+Hxk1OSrJhCIQDnPG8FAlu3idrR
         iS8gQn1sziA64z8yAXNkG8eLjMlDFnCh1ja+iAMhitPCaLphG9GgMqqZw0PRuKm6g1UT
         IHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739202177; x=1739806977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLiwY3ApPPCC7px+qsl6Afe8b+v2qYbxeA54xnF/JPo=;
        b=vpN0HW6jTXIukOyoFQxgByDSOMvEc7akS0FEDfqGKE+fVDRgY4acb52qWdcK+J6mWb
         nCAOTHxrjbXFjLT59l1XV4W71B+kHQIrdezLLHp3wo4uaxhDp78E/ZEF3EafARbWAUOe
         CfIod1lseXANP2QjSjCgxNrsDtSVqKKFW4vIkEswM3+dLUnu/4cXySUnXDH+VH5C7Fvd
         Kg8w8Q2J2phyqK9F3JZUDzNFq0c2LuS7lc0qLs5JiA3D7fiwCczmU08XUjmedwyOaPLj
         AR/eiH3Bc4QqxG8MVVXg+SPq/iWPfH9vOgV7e/9IZkhGrgAx16ex8lU5EXrvynug/Jcj
         K6Pw==
X-Gm-Message-State: AOJu0Ywbzp2XewwIe4mQAYRWWoAvExg6BRYpkKIjIyOp/CngTz7+qPbJ
	CjlIWZJUMGMvsKxnJk58oqLNAVra+tuL+ESnJi1nASiuYQQJzXrwtICoPhh6otncjoCNOj6Uv2m
	YcgrGRNc5AtdLlt5/XpQbpfTO/tQgLKfPAdgVjWHVXp2IaCQumfs=
X-Gm-Gg: ASbGncuQO4pllUqQhnEDgmSS/q6WVqfrbOy++vOzTOCkFBJgF1v9h1e6spQF7AG9cVM
	dTvSkexKBSh9vTnxmCh+Ij8RIf9H9X3EPFqtksc0UgseTWF9ZtWfwa1Z4cKEpSt1iJ2V4aRk=
X-Google-Smtp-Source: AGHT+IGyh2neRI2ZfcbVi7tT35wL1wuaomem+yEpb650y2LsvVBDLGrTCV2h47g5xo+sD66SwBLaTACzXxOleggikpQ=
X-Received: by 2002:a05:6122:408b:b0:51f:3eee:89f2 with SMTP id
 71dfb90a1353d-51f3eee8b1emr7794663e0c.2.1739202177102; Mon, 10 Feb 2025
 07:42:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABrMTje0ijdtcO31HmuSufxXFQO2Ay2Rh0_0Qc4FFC3zgqe-pA@mail.gmail.com>
 <2025021044-conjuror-captivity-619b@gregkh>
In-Reply-To: <2025021044-conjuror-captivity-619b@gregkh>
From: Matt Lee <matt@oscium.com>
Date: Mon, 10 Feb 2025 09:42:46 -0600
X-Gm-Features: AWEUYZnSJz2d8IXSw1O0ZzZSO_IV8HeMipYiMmQnXxjxk43O3_x2iCx_aKYCpp0
Message-ID: <CABrMTjdJ6Xpwo2+oExb7i1jCuRJNb8tDJtov-xsnyiSoOxF-3w@mail.gmail.com>
Subject: Re: [PATCH 2/2] USB: max3421: Fix scheduling while atomic in max3421_remove()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The submitted patch fixes a crash we are experiencing on every shutdown.
Perhaps the better solution is to remove the spin_lock_irqsave/restore?

I tested removing the spin_lock completely and the crash issue was eliminat=
ed.
Happy to update the patch if this is the preferred method.

Kind regards,

Matt


On Mon, Feb 10, 2025 at 8:12=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, Feb 10, 2025 at 07:48:29AM -0600, Matt Lee wrote:
> > A bug in `max3421_remove()` caused a "scheduling while atomic" crash wh=
en
> > `kthread_stop()` was called while holding a spinlock.
> >
> > This patch ensures that `kthread_stop()` is called outside the spinlock=
,
> > fixing the crash and improving system stability when unloading the driv=
er.
> >
> > Signed-off-by: Matt Lee <matt@oscium.com>
> > ---
> >  drivers/usb/host/max3421-hcd.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-=
hcd.c
> > index abcdef0..1234567 100644
> > --- a/drivers/usb/host/max3421-hcd.c
> > +++ b/drivers/usb/host/max3421-hcd.c
> > @@ -1936,11 +1945,10 @@ max3421_remove(struct spi_device *spi)
> >         usb_remove_hcd(hcd);
> >
> >         spin_lock_irqsave(&max3421_hcd->lock, flags);
> > +       spin_unlock_irqrestore(&max3421_hcd->lock, flags);
> >
> >         kthread_stop(max3421_hcd->spi_thread);
> >
> > -       spin_unlock_irqrestore(&max3421_hcd->lock, flags);
> > -
>
> So now the lock does nothing?  Are you sure this change is correct?
>
> thanks,
>
> greg k-h

