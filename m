Return-Path: <linux-usb+bounces-25388-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BCEAF09B7
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 06:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0370F175E81
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 04:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79B31E1A33;
	Wed,  2 Jul 2025 04:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zrl6l6Km"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DE31CFBC
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 04:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751430792; cv=none; b=K05B47n7aHvRTQE4jhkMBktTNi6E7Qxi8eP5pC2sPtCmbY+t0K6zTkcPLG0KqfX3qPcNNjezVLhkaguJxYaFBkK4FkqEgMCpG46iQ/WacPAtLP0I9oQ34+UntWPQBmih/NB79DsJf3zkjS73AcaK84hZEtqBKW54bPH8ATOGySQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751430792; c=relaxed/simple;
	bh=V+yKMN52ursvZcOAwRHO3lkom4QQNqnBRvji1e+HM7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uHUMqzNMHAEEVDoBtPLwwPDfTTdFcdlBUwdhKj0/5sc3bLGvt48k8SJDEuFBB/evUaQh9iXxykNI6BiqHRUzvTM4Aj3M12hWKDEUVqoWVvxNwoedwBf7+8Oj10GTJgBr2K6wt8QQhhPtUeyattnvjc9Ix6PvFRxDAarvTKjMLUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zrl6l6Km; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3de210e6076so225945ab.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Jul 2025 21:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751430790; x=1752035590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6ibeF7iQFN6MXFCKTT12fPtzRdzmMgmVRdt8ogRjrw=;
        b=zrl6l6Km3g65R5OKwYJQJSYXd6ojUkHfKNvGCJmZ3otCsrizo43EUjcXgHQ0KdWTbF
         TNV2D2ylMcCIlH1apXtQvmbEONGhCIgFsZdxdUOU6hYpcst636vLnig78diSDyJt3R0g
         GbLkMJS5n3nZVFlLalzgJ2a3DGDnDhC1odXmRL3EPCsglIyFWrLuRdUyopc+m4y6AUR0
         pN5okWl2Urqwja4SoFKB7W7/ih9lu9+hKOIuu1IOnGtEacRr1ssROuTxZwI2WTOFV+Cm
         krbuPyXQo/llgP/mdpTnICxRVGOd53e2nxIK/nKxW59fA7FyAgjeZz/nQPJ5YfpBPS+m
         3EaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751430790; x=1752035590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6ibeF7iQFN6MXFCKTT12fPtzRdzmMgmVRdt8ogRjrw=;
        b=rxMZGWKB0LZ9L+Dk1Q0Rk14bydsfhBalRLCS62JqhZemGuiQ/4kMBc5QkIEFZi7AhS
         dNcE6Yt11EjNx5DeB5jzmcBmeCssa89apHJvMM0iBiFAAY7j+2EIXhl+bZglaMPXM5D2
         iTLfz32R3g3DN2cBNShtgPbwUedeJgMmo7e3SVg0L/Hq/keUEj7SIsTundHI1FlFg+nN
         I7Mj4s1UdVYOSYLBr36kn1yunM2UfdnNJpdo04ywYIrLzma37vPjv63OEPOrZcA5rNGM
         DtkAld4mrk5gQ6tVr+ath9BmoBPSdyqy37JM4UGtE4xAJQu08an5p2tO7r4Pz7d2g4Ft
         7CRQ==
X-Gm-Message-State: AOJu0YzEhfy7QIPLjcDW/Yp4JuKuTM9csDpDte9APpR10ka7MQD66aUU
	lQsW3xPinhlrW8um47UOhTPLuyno/8c5CbiCPsbyL1pgCYYYe2bPC2edaUJ7xjqPVMecv4RjD1a
	uDaOUSf6wYHL/Zj9gtsQFy9tHj3o+ebJ3QnTEg42g66Ky4n+0DvghsFWBvss=
X-Gm-Gg: ASbGnctlNFcIouM8+JzEIyQ+C50VHsg6QLHc9hA146Bq0WLVx9d6p+OAkBEdR1K2g50
	aynZe3ajIgX5itZDvWHitHksDXWeJhhIvVWvDr0ER01hipr58OlTH4n9BRu9xl36sOh9WNA4hLL
	gG7poWR6zjDfaPtjY1HSadVgF11l4Y2KB2REEaZ1r4PHiiW/OoQx6M3Hwx4xQjD7Mk3EzAUcOfo
	A==
X-Google-Smtp-Source: AGHT+IFhAG7FmsUNvWegEmSDkXGcLC7QCKJe8X1+A6cDiTAh0Ppff/d4janmsYhEacLJkqjEiLzvlo+uvuAA7hdxFV0=
X-Received: by 2002:a05:6e02:148d:b0:3dd:c9c2:820e with SMTP id
 e9e14a558f8ab-3e04a07a123mr5428215ab.23.1751430789780; Tue, 01 Jul 2025
 21:33:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604082449.2029156-1-guanyulin@google.com>
 <2025060407-geologic-excuse-9ca5@gregkh> <CAOuDEK1471toXVEiNySQtmrRTSPwzo840Q2d5pw9M4fCOfsgTg@mail.gmail.com>
 <2025061957-daylong-legal-fed1@gregkh> <CAOuDEK1mY7++0NxRYR_+fhQB5+74KB-=MHhk4Dx3cpD6XrG93A@mail.gmail.com>
In-Reply-To: <CAOuDEK1mY7++0NxRYR_+fhQB5+74KB-=MHhk4Dx3cpD6XrG93A@mail.gmail.com>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Wed, 2 Jul 2025 12:33:00 +0800
X-Gm-Features: Ac12FXy2XrB-PQl8vwk3j9enF8UMK7euznjxv9NYAA8UCnZfd5AtSLx-n3WC5Pc
Message-ID: <CAOuDEK3+=FVj2zrajjqsWamqCEx5-0v+dSS=gRLYyO_8YdEy1Q@mail.gmail.com>
Subject: Re: [PATCH v14 0/4] Support system sleep with offloaded usb transfers
To: Greg KH <gregkh@linuxfoundation.org>, dh10.jung@samsung.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 11:05=E2=80=AFPM Guan-Yu Lin <guanyulin@google.com> =
wrote:
>
> On Thu, Jun 19, 2025 at 5:27=E2=80=AFPM Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
> >
> > On Wed, Jun 04, 2025 at 08:32:00PM +0800, Guan-Yu Lin wrote:
> > > On Wed, Jun 4, 2025 at 6:56=E2=80=AFPM Greg KH <gregkh@linuxfoundatio=
n.org> wrote:
> > > >
> > > > On Wed, Jun 04, 2025 at 08:23:06AM +0000, Guan-Yu Lin wrote:
> > > >
> > > > Is there a reason you aren't cc:ing the developers from a "big andr=
oid
> > > > device company" that is currently testing and finding problems with=
 this
> > > > patchset in their device testing?  I will require their signed-off-=
by or
> > > > tested-by in order to even consider accepting this patch series bas=
ed on
> > > > the issues they seem to be finding with it in an
> > > > internal-company-bug-reporting-platform that I seem to be also copi=
ed
> > > > on.
> > > >
> > > > thanks,
> > > >
> > > > greg k-h
> > >
> > > I'm not sure if the company wants to reveal its testing right now
> > > since the company raised the problem with the internal system. Hence,
> > > we still use the internal system to communicate with them. We
> > > understand that "signed-off-by"/"tested-by" tags are required to merg=
e
> > > the code, so we'll keep working closely with multiple companies to
> > > achieve this.
> >
> > Great, please do so for the next version you post.
> >
> > thanks,
> >
> > greg k-h
>
> Hi Wesley,
>
> Right now the system sleep with offloaded usb transfers feature is
> pretty much settled. I was wondering if you could test the patch on
> your platform? Thanks!
>
> Regards,
> Guan-Yu

Hi Jung,

I noticed that you've adapted the latest sideband design for audio
offload in your system. I was wondering if you could adapt this
patchset as well to further enable offloaded usb transfers during
system suspend? Thanks!

Regards,
Guan-Yu

