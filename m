Return-Path: <linux-usb+bounces-6951-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEF3860F7E
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 11:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84CF6B25D8B
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 10:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A693463111;
	Fri, 23 Feb 2024 10:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fQNsh2OK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41823EA6C
	for <linux-usb@vger.kernel.org>; Fri, 23 Feb 2024 10:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708684605; cv=none; b=H8JvfTh17SIPAgLdDCwt8hBDSKMBbsceaaCXWJUxGGOwqgEJ0aPZ2VoCOG5URMbuQeY/hYErDbohIvUvE15t5xjcYN8uf67ZrAuarcjWmjZ5GzdnbtN0lopUS49gZIVrZsGW1FRnbkSsp5cl+INyuZtFplw73PjEzUfLHue6r5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708684605; c=relaxed/simple;
	bh=oGa9d8hXuiijz2WQcWWqfhlvaB3jirIqqRv0WuyyLd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cg2Y11WXy3zVfbEikqiXab/9cO1Rv6K4XbRCh0mt4tWLdYd9ZLBgf4KJG3Xt1d9R1GZM+tYqSzNrafMTvLFtkHGbfOVN1yBlzRu/V7ishVLCj4LRqREdNR2cu+IVSfjAC/Vi7GC1WlYDrLumZaZEQCtwJudI9S9jBlWAhAOyMwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fQNsh2OK; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so800110a12.1
        for <linux-usb@vger.kernel.org>; Fri, 23 Feb 2024 02:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708684602; x=1709289402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGa9d8hXuiijz2WQcWWqfhlvaB3jirIqqRv0WuyyLd8=;
        b=fQNsh2OKUBgnb5FP0MIFgb3d/zuraki6pSWU1EC+QQzscEskxBX3+AG1e1a1QPvd0B
         hr/r6dLshp+BvzTAYA2Zau6LG+yrD8YznsM50ToHcnWOfQcNaY9/0pQ+1sOsQ9hIPIb3
         cI5ElA0W+w2DcgFUWmUZCfLsut0jK5w/aP4hZReuZfHZxjdoA6SheufDCCIZed/IBOW7
         hNoFAXmZeNUx3BBXomv2gsuXv/zaL0sbxRvAKc31q97AlDRCy7ZA0tMDcHoAxCB6t3HZ
         4cJKO8Huez7q3DtnQADWBGxNp4krR7xcO7/qs4/Vl2/mvjr9hUj4qmz6g3yZ4dGESN0b
         1trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708684602; x=1709289402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGa9d8hXuiijz2WQcWWqfhlvaB3jirIqqRv0WuyyLd8=;
        b=e10DwiwijQgYYkc8wbXtZHUeiXlNtjR7H5Oa0+cV/3wPFqNt6pRIMg8mnI7rAJ1tEZ
         EPmEqUx8Hl/Uo5y2URz1Dbv467w1nso9zgzvsEScedeRIHcgV/tgS1H4NfPnFzMe6Exm
         ku/sKRIoG0nfYIQvWaSrMx2kVCSHQf6xBY+iiUA8t6Z5XuAQRYdyGyeA37Li+KePezbN
         WoZuvJQw/9lUTxQkbVtU/y5vpUNbYlrKNnhPsgMmjfMnARs4f0uIm1X4PeJG/q5AUSyE
         lIncsc9Bh9SLhd6wjHlEeYWEoRLALaBuU6JB0kUG6DlnmM5eDVK7g9t+AfdKqJxUQyno
         E8Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVIotR+xnAi0y3Rf53SAy2VU9AQPSLKBKRtcKMZ2KAbBpkotQqpmKJHDjpFaxhcmSWMUydkXyKlJSZIa5rF0GFywJkxW9yJ4Pud
X-Gm-Message-State: AOJu0YyPZnj4T5dpJUx8UYoMxGlNaWfsd6Q9D1y+1LvXP/TKWr7ZSx6g
	5cy/WS5rg+rLAPCff2T4k/+DtQCq+IFOWfqiqQzCcY9u/vPPD6zguZmhG98ZHD8VCGf8ZwowuTw
	y8Bi+/Kk8hLqiG8dgEqHoLJc6p9QZKac+cbq6
X-Google-Smtp-Source: AGHT+IHUav3spNKZz8TuROOuLqr44AG4XeF8yBOYDiOk8XKBPI8yc/QGOy9I7fCdiFaLDT3fTvD/WiTk7Gr2b1xnDxE=
X-Received: by 2002:aa7:d50a:0:b0:565:6424:6ad1 with SMTP id
 y10-20020aa7d50a000000b0056564246ad1mr843919edq.14.1708684601764; Fri, 23 Feb
 2024 02:36:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220081205.135063-1-raychi@google.com> <2024022024-trout-kennel-6d14@gregkh>
 <4d62d4d0-3f28-486b-8132-4cc571b6f721@quicinc.com> <CAPBYUsD=3ux8RXgRcroVsmpqNs0D+2NeLhqPHh3TBB_oq=ziXA@mail.gmail.com>
 <2024022033-broom-anime-6dd5@gregkh>
In-Reply-To: <2024022033-broom-anime-6dd5@gregkh>
From: Ray Chi <raychi@google.com>
Date: Fri, 23 Feb 2024 18:36:04 +0800
Message-ID: <CAPBYUsAapQin9ioDggDk_ZE2dGxBRFwSUcf8JGt4eRqrYd9m6w@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: gadget: remove warning during kernel boot
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>, Thinh.Nguyen@synopsys.com, 
	quic_uaggarwa@quicinc.com, albertccwang@google.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 9:56=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, Feb 20, 2024 at 05:42:56PM +0800, Ray Chi wrote:
> > Hi Krishna,
> >
> > I verified the Thinh's patch and the warning could be
> > fixed. Thanks for the information.
>
> Can you provide a tested-by for that one?

Since the solution has been merged, do I still need to provide tested-by?
If tested-by is required, should I reply to the email thread for the
merged patch or the reported patch?

> And please do not top post :(

Thanks for the tips and your patience.

Regards,
Ray

