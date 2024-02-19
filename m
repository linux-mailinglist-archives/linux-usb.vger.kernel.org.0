Return-Path: <linux-usb+bounces-6733-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 996F2859E69
	for <lists+linux-usb@lfdr.de>; Mon, 19 Feb 2024 09:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCB181C21F08
	for <lists+linux-usb@lfdr.de>; Mon, 19 Feb 2024 08:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95594210FD;
	Mon, 19 Feb 2024 08:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YdDr/1Oz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7123221357
	for <linux-usb@vger.kernel.org>; Mon, 19 Feb 2024 08:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708331777; cv=none; b=RdvV/4Olct6me0I9gggiHk3riBQT8AG2DWVBonapGceBdG9erSV6BrazGTu5hP+6cT774nTY3Xfoay3XsEd/23/w8pP6tem25MqW/li6c6LPCX2b57teROzq7mTUA7b4v+lm3/6CNBP6TL+uWXVSSzLHvEnTPnaTSbM+wI5+sfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708331777; c=relaxed/simple;
	bh=Rx9ZJKs/bR/usyBx3lVmlWkCDToMSZHSILyEGGUJ6aI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Izmuxfvu3dBYp7GCv7c6J3FLTKwl68Nrx05fWqQ1EVKrQFGOgL1u0bUlwY9q8OIKhNGiVg/doUi59sBfbsybKPGksNn4T2UU+BYYHyZRunNOYxF/IXrgv0lYkZdmV+J8d3/cTgAs+XLTv2rygNmiDcxQFOe8O1/JhUwYyuIYBkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YdDr/1Oz; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-563dd5bd382so10699a12.1
        for <linux-usb@vger.kernel.org>; Mon, 19 Feb 2024 00:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708331774; x=1708936574; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8QoRFayjt/6bleBBpTu5vM12K7hqxhYDmZf5s1lnAg=;
        b=YdDr/1Oz8JYDQ2flZsPaGpxoiBdsL8C8Zev9YL3hR0wsj5LRUUqQAnIuSSFVIFfk5m
         COjJKQ2uYf5INL02sVySv+0ec2YckJFvrqS8c11Dix9oEPwywPZ3Q7b7cWqvnCNpJgPo
         QeeGAOzgLfkMirb4ZOzryiy1M/r9MKyy2dvGbsozNr7VqjGi9XdG1eBel4GqD8P1eWJJ
         WQqbJ6bGiRGv2EzA0n3z5vBL6XRpFX6OH14eActBy/anKnfvM/2p4NerlVeQamyyKxtw
         iMghrU/KvzlvUBGj1ROGm3SFV0ScgVzsHSwrF7XmxOL3PVk4h5DUkoXss1455ObA3LBG
         pj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708331774; x=1708936574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8QoRFayjt/6bleBBpTu5vM12K7hqxhYDmZf5s1lnAg=;
        b=Vv6/N6W2w7+R/CtyBJumILXfBV4KbgRG/aw9VXyq0P0HnvnyPoTYDrsNKC9WEs2V66
         N/wUHXSJUtuKazVbgHL5rz2FiBUR/bucrvfkuqjFHUyOtL2DuLOvXLKKm2BFbDiE3cJP
         jj7Gve6TNPJe20NpEtLmu/qoaR5Tiy1AkqksSzgrEPLJYxWNxr5/bT2XNmHpozKxJb9p
         F/UPpNz6Ol1vpO6L3GwwmRiuAkIZGW5NOc2pJ1L5GEfvPnYVRKaKX5adT3Xh0ASuem5q
         1u+Mb5kz+wdXVCJqalRKJwqj76cXx+J2gWoW9IplsgeZ6pFC1HCfvUFCP7CTEREDsl1w
         dsIg==
X-Forwarded-Encrypted: i=1; AJvYcCU9qg1+D0gypjM9U3ITCExpHPNuxXSEg6yo6As38auV1h4QBNW6XHVlq0/MCVWpy93GxSBAX+ft6BVDlwlEVQOrv4TkiUJd1Iil
X-Gm-Message-State: AOJu0Yz7kIdGLBAobwD2yoGdzE6cNvHVzPRoxb8oQnnKFzpDTcZaWO/l
	pozYnL2azxWWkTZ1kjDXZlHIJWr2BixYh5jh1a91S6ncB/9ZIPZeO/pJ87stURzqzvZf1PlQO39
	7Q6Pm3wQCBIWk+ab4DbL2Rc4zmlK/RhQkSuVH
X-Google-Smtp-Source: AGHT+IHY6CT7bVLUITQoLpctqBSsq7nAekyPp9XNaT4BIubHaz9rpg4bjl/zXDzr3cCzpfHEsPfJO1FNnKV5xNnneeU=
X-Received: by 2002:a50:9555:0:b0:563:c0e0:667c with SMTP id
 v21-20020a509555000000b00563c0e0667cmr221141eda.0.1708331773467; Mon, 19 Feb
 2024 00:36:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240219061008.1761102-1-pumahsu@google.com> <20240219061008.1761102-4-pumahsu@google.com>
 <2024021951-coping-ferment-2023@gregkh>
In-Reply-To: <2024021951-coping-ferment-2023@gregkh>
From: Puma Hsu <pumahsu@google.com>
Date: Mon, 19 Feb 2024 16:35:36 +0800
Message-ID: <CAGCq0LasRTLQA59g+kPekWb5ZKzeHSX9c4C8LCsHwFNfT0JHTw@mail.gmail.com>
Subject: Re: [PATCH 3/3] MAINTAINERS: Add maintainer for Google USB XHCI driver
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, Thinh.Nguyen@synopsys.com, badhri@google.com, 
	royluo@google.com, howardyen@google.com, albertccwang@google.com, 
	raychi@google.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 2:31=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, Feb 19, 2024 at 02:10:08PM +0800, Puma Hsu wrote:
> > Add Google USB XHCI driver and maintainer.
> >
> > Signed-off-by: Puma Hsu <pumahsu@google.com>
> > ---
> >  MAINTAINERS | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 960512bec428..dc0e32a3c250 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -9081,6 +9081,12 @@ F:     arch/arm64/boot/dts/exynos/google/
> >  F:   drivers/clk/samsung/clk-gs101.c
> >  F:   include/dt-bindings/clock/google,gs101.h
> >
> > +GOOGLE USB XHCI DRIVER
> > +M:   Puma Hsu <pumahsu@google.com>
> > +L:   linux-usb@vger.kernel.org
> > +S:   Maintained
> > +F:   drivers/usb/host/xhci-goog.c
>
> You are not paid to look after this?  That sounds odd, can you work with
> your managers to do this, otherwise this is going to be tough to do over
> time, right?
>
> thanks,
>
> greg k-h

I misunderstand the definitions between Supported and Maintained,
will update to Supported in next revision. Thanks for advising.

