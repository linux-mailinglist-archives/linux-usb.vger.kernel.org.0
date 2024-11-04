Return-Path: <linux-usb+bounces-17001-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 075879BAD95
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 09:03:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFC1B281EEB
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 08:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBDA199FD3;
	Mon,  4 Nov 2024 08:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHo5OcNW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D7817C234
	for <linux-usb@vger.kernel.org>; Mon,  4 Nov 2024 08:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730707425; cv=none; b=Rfxz3w9IsVfGf/jny8v5mLx8hIQ8QSJxgXUlIU3e8+bfQbHxpHuTdR2WBsD6H6Lc3a3tEdO4KIcUZKI14+6lJ+HbOPWNw4yiO/lvekNrjbpycpNQ13H+eNjrnsVnIqnu/u9h4QCZN0nABNW3Y6qjfCe/xWdYDOf6ukfWAoyWh1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730707425; c=relaxed/simple;
	bh=HIxNNvr52FxTnzbRQw5NR71SxPTZBvRnH/ViR1JXEYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a9IxsI62gj9sg7ZIBMEdlWC0OndoV6MNAQgktYgcR1xczdCR5XE3ozR+TIZR+qt5Hnz/IfUuPZ6QWuZS+xCrxMLUBS3DViw18r/lzKcNgY69oeI25rICZWCOJ6DcQGpdrhGpjGgEfmb+ijJ0/jIPj/I+4oIi9E7qt3i0XuLOJ/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHo5OcNW; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-720d01caa66so2148427b3a.2
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2024 00:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730707423; x=1731312223; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYM7dUD+Lu0xKZzzzkAuJPvDANk+JsuNprqSPffeDC8=;
        b=KHo5OcNWpKx4/UaeF9IRZog/Jc9EmLScOSHmVfFTMRJXzdacy3A89Bp8o6s5MgHJ8o
         3cdTRHTg045Xu0hIW5a/bTOONG6sAFxsOsv5fpsvNA/qsHjCf5xB1ROx7BQLwcQSefFr
         vSUH/lS2cumhufFUa2rhwYLxqE1aqRFXAbA5j4zidGAGPTgWSW1aDpuGZ5iGmXAaxD7/
         rDAwrvzdUphMbqDObcrhVXZy0lxgkbjChMFxdHUjkBXHHwL3R0bAQSLXSqn+820lJQ89
         WREpqHaosKVfXGAeprlNiZ9f4zJwOq6a4UeSuTVx7fvaI+YHKV2fjr9gyOnJxz7Uzeu7
         xTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730707423; x=1731312223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYM7dUD+Lu0xKZzzzkAuJPvDANk+JsuNprqSPffeDC8=;
        b=JlhrLujFq4Eo15vt5uiTwIeEF2NeeGlpnm3q6AMMrrddruFKQgVjS4JxeBz8vLdJ0v
         DH3BgEqRLBeC1M94muBlkt/3GywvNN/Y38Ad3bZSXptcU5SH+XyMUiLZTja+IkIORdG3
         8jtfZPWTPUR02qfksRCkX+qzvoEvC9yVg7XOibMzMx2HmlyBvylLfgbLUHzwOcmP59Tn
         nRTcunvnxVh2yTW/R5CYTO29RlF5sEB7JreqqD27kQgjwQVpjgQ5LgdrA7CCr70EvI/u
         HLsuiilZkm63HeNvrJfE5damvdQUInpV5H2qn5VQXjMN2M+OGgIg6sRSRlE/KbS07InM
         FcUw==
X-Forwarded-Encrypted: i=1; AJvYcCUFe+/j800XE2mchtr2BXegWXDeuzbvy2fndrvXBsz1/yWWQsCW/AOPeuSjfq0NVy/Gf6X91Hc7p7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRQMpFxkhsYgvpMRzg1Ez1hM+46TA95RqNuU1N5Ody0Vg6+UVK
	aa+tLh74PYyUoyk7/ve/rFwr4VhSozGhr1VqmLWn9gL+28VBaIveRzg31lOkJhsliQUjFJHxC3r
	yxj9RGyoR/H65ORO/YSjlRxSPUoOmDpzK
X-Google-Smtp-Source: AGHT+IFCi3xZ8RsGclV7LA9x2EPmYLrMZ5b6abNrBA8p+4Ncytn0p+XowVbCRS+FrPQgx08xaAR/48IAouuE9hMBpMQ=
X-Received: by 2002:a05:6a20:2451:b0:1db:e328:dd13 with SMTP id
 adf61e73a8af0-1dbe328de0bmr1714110637.11.1730707423271; Mon, 04 Nov 2024
 00:03:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOLjEn56gcrBLYqmtAPY49wpZCUzuKAGSt+L2ADBpAEELoQ1TQ@mail.gmail.com>
 <6daafbf9-5999-463b-9198-cd699deb6721@rowland.harvard.edu>
 <CAOLjEn41agaq4J99BFfekPLvnBBKfvBnj24pXLzpkn21_K4ouA@mail.gmail.com>
 <467b1da8-325f-473d-bf46-96947993c626@rowland.harvard.edu>
 <CAOLjEn4vJuxmRGUpUqMS6C7P82d18TkgURhd71UkXNTm5waYtw@mail.gmail.com>
 <f5ab7ad5-9a9c-475a-9a1e-3f9de8d1a2a9@rowland.harvard.edu>
 <20241029002209.5eqrdsvpxrh3ycxl@synopsys.com> <c6ce3f52-cd27-425f-ab3a-beb56e76a247@rowland.harvard.edu>
In-Reply-To: <c6ce3f52-cd27-425f-ab3a-beb56e76a247@rowland.harvard.edu>
From: Bart Van Severen <bart.v.severen@gmail.com>
Date: Mon, 4 Nov 2024 09:03:26 +0100
Message-ID: <CAOLjEn4kCYYcsde2SJv3sBZw5WEZ7RiYKoZNDTv_fSz=GAk4VA@mail.gmail.com>
Subject: Re: usb: gadget: automatic remote wakeup on hid write
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 6:26=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Tue, Oct 29, 2024 at 12:22:10AM +0000, Thinh Nguyen wrote:
> > On Mon, Oct 28, 2024, Alan Stern wrote:
> > > And either way, it looks like there is a potential for races.  What i=
f
> > > the host puts the link into U3 just after an hid write occurs but bef=
ore
> >
> > Regarding the potential race condition you mentioned, the f_hid can
> > track when the ->suspend() and ->resume() callbacks are called to handl=
e
> > these corner cases. How it should handle that is up to the f_hid.
> >
> > > f_hid has had a chance to queue a packet informing the host?  Maybe w=
e
> > > need to add a flag to the usb_request structure, to let the UDC drive=
r
> > > know that it should issue a wakeup signal if the request is queued wh=
ile
> > > the link is suspended.
> > >
> >
> > The host will sync with the gadget via SetFeature(remote_wakeup) contro=
l
> > request before entering U3/L2 to enable remote wakeup, and it should
> > disable remote wakeup after resume. We have the flag
> > gadget->wakeup_armed to track that. The dwc3_gadget_wakeup() will not
> > trigger remote wakeup if wakeup_armed is disabled.
> >
> > > This part of the Gadget API has never been tested very much...
> > >
> > > Alan Stern
> > >
> >
> > The f_hid just need to properly implement the handling of remote wakeup
> > as Alan noted.
>
> Bart, it sounds like f_hid needs to do two things:
>
>         Use a private spinlock to protect all the places where a request
>         is submitted, if the request might cause a wakeup to occur.
>         Also take the spinlock within the suspend and resume callbacks,
>         to keep accurate track of whether the function is suspended.
>
>         When a suspend occurs, check to see if there are any pending
>         requests still queued that should cause a wakeup, and call
>         usb_gadget_wakeup() if there are.  And likewise if such a
>         request is submitted while the function is suspended.
>
> Alan Stern

Hi Alan and Thinh,

Apologies for this late answer.
Thanks for your valued inputs, I have a better view now on how to implement
remote wakeup in a better way.
I'll try to find some time to implement it, but it'll probably take
some time given high workload.

Best regards,

Bart Van Severen

