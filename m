Return-Path: <linux-usb+bounces-11791-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA3991C6BE
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 21:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F1DB286E00
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 19:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1AF07581A;
	Fri, 28 Jun 2024 19:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJ6pIifi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDEE76025
	for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2024 19:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719603565; cv=none; b=Krc84jk5/L/sqSEcLd1wHTp0lh4AEZNwFHUBQWuiw4XZBX9UKO3/hb5lxKAwt2QFGrbztgJkGsLeNaLf9v/67UIqFbWc7Rmjzs1x9GS1C9wBPNXODWwC0F6fBFHkwZIPFHasrK+LDcn74vHz9dIyl6wIQoDtHG8YDIHjGZ49PyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719603565; c=relaxed/simple;
	bh=Xye77VOd1znNREt3OmklJU+PPhRAHECKuvNdJMw5xYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e6Sq4PoNQi/TA3boVdjHV3egUcIHno4QpIwF9u39slE0bY5e8qdLecZ3QQ2xzA309uGFXEU3lSks8amTbNn3aMjh2lYxaaw/8jVKEBlgv/+6QXOGEtL8pirmAcmKVenTrJHJgKaVQV3Cpcsb2IOri1XxTCk7r2zikWXJglTkQCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJ6pIifi; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-424ad289949so7204845e9.2
        for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2024 12:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719603562; x=1720208362; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fH+6/nNlGWcw4qDFxJWKgzoORk4G0JVgEzpOUHP3fdk=;
        b=cJ6pIifi+4q9SDQpEYSxeBT16OJn6+HJSyjBX8U6zgKhdYy2U/PMs3xbZ1SpqaMGz+
         v6wt2e8EvjWpMUaqbRwaSzU+RbGObYRtLt9EeCQCwCJ1GVcnNzVoxSaYJ6jgaj9EceEz
         FpZSvpiuAC9+rNDZNxIBpQNrbwVgBn/afbQQH6In6d/LCT3n3Cx/AUSlyp66++usqAPe
         LpurNZE7ts/mydfWZ2ck8uBnRhbqjM6HLIo+NPlrVQU/oxyD1KdYJqUKzyZTP4NJWIqx
         2mL/F0hzfECwCJqr5/aV8iB38AzkyLdk4VyniU5yJgSs6W6XxISbJcg8SJ5yE2Pg7rs2
         /aaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719603562; x=1720208362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fH+6/nNlGWcw4qDFxJWKgzoORk4G0JVgEzpOUHP3fdk=;
        b=OzJ56B8Bdu940MkKD9Cbq4LcqNWuC504SfYrWbb7TKAtbqxRly/pjW4okuXU2f0V3n
         9QMP319LabQebPhQJkeQpfLk5+tnZzBrb7/wfW0OJ/xvEk9bVI3Ugkk05aQ2bqu1HpFH
         Oo3nYdZNE+WwLTDXGlSAfLwlnGhVF1C0zxsI3Ho4WPe37NL0rmKaGWdkTMboiyqFaeSj
         r7dG+DUsuIChOYPii1t7Wj1TR95As3gWxvXIxHMWyjEYiaNRdzC0jnp9snRhmnyTxCtj
         LZUwbSdtmGVO1KrtWXenZjXGYfC+diA/8HblJ1lxf3ysvg1/kMWBbwK9vAbTBE3DFXMf
         Q6Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXDj4CjGvIIsJAjWAeXqqh5EBwRGXpb9wVcC0oCsjZMUfqJXucRoAoC0tC1MgNLKjiEFBytj/W76gDksXT7yLc/J1tz7V+PpL50
X-Gm-Message-State: AOJu0YzYRK6uDPq7ph9GL73nRgqk3UqiBt7E/vwhZDBGN74xo0BcuseM
	A8qGCAA42/rHbwDpw8yvM4NQZiRWvlrMFA47aRkoqU8uWO0NoezNyrgxSqCmuL3nTlfJ6vFJTs8
	Bj3A/Cr79/s00gCGVy7kcFgp8SXg=
X-Google-Smtp-Source: AGHT+IG5C+p1+1Ibo/r3mLLXO45D1GAvzyHZVMyspE5Ezy1h6QWx+Geomh/6gBk4RusAJ06UTEUJbHL9VmNiNqGw8tc=
X-Received: by 2002:a05:600c:3b87:b0:425:6f3a:651d with SMTP id
 5b1f17b1804b1-4256f3a66bbmr16074255e9.27.1719603561767; Fri, 28 Jun 2024
 12:39:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a306a653-b6cf-41e4-875f-6c520569b1fdn@googlegroups.com>
 <CA+fCnZdZ96yW5tRfm-c1qXWfmNrVg9J1Yb779Ryht6M9v9FQbQ@mail.gmail.com>
 <612f3eee-35fb-4888-b5d9-c17c223d40df@rowland.harvard.edu>
 <CA+fCnZcrn1sr-sMbwk6i5RDMMh3q9TpBgkGAN+4cg4RaCo9S+g@mail.gmail.com> <28b478e2-4b17-483a-9584-0e6342677ef0@rowland.harvard.edu>
In-Reply-To: <28b478e2-4b17-483a-9584-0e6342677ef0@rowland.harvard.edu>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 28 Jun 2024 21:39:10 +0200
Message-ID: <CA+fCnZegQV87=h13tbk=2c=RxuJi1njHTBO9nr64L-dfVtHsMQ@mail.gmail.com>
Subject: Re: Remote wake up in gadget drivers
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Darrion Ramos <darrionramos@gmail.com>, USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 8:33=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> While the wakeup_capable and wakeup_armed bitflags are defined in
> linux/usb/gadget.h, it doesn't look like any of the UDC drivers
> implement them.  So it may not be possible to see whether the UDC
> supports remote wakeup (but it appears that most of them do).

Ack, another thing to the UDC clean-up laundry list :)

Filed https://github.com/xairy/raw-gadget/issues/73.

> Checking whether the device is suspended is subject to races.  The
> result would not be fully reliable.

I see.

I assume doing a wake-up-if-suspended procedure within a single ioctl
would not be race free as well?

But overall, I don't view the userspace <-> Raw Gadget <-> Gadget core
<-> UDC driver <-> UDC approach to be very robust in general. My
understanding is that you need to be very close to the hardware to
implement decent USB emulation. So perhaps, we could just add the
ioctl and document it as being racy.

Thank you!

