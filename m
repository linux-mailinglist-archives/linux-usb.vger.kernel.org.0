Return-Path: <linux-usb+bounces-22506-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 536ECA7A284
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 14:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C148C1718A9
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 12:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56EB924C669;
	Thu,  3 Apr 2025 12:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n+uQ4Vyz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A54C24BBF6
	for <linux-usb@vger.kernel.org>; Thu,  3 Apr 2025 12:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743682183; cv=none; b=lE7l+iRQtQbPZzu9t3RK/pJ9JZ9fAUY0Kr7cm9wLdTovcUws9pBMq05h7BzHG/Pnw1DlywkK8l5wjY6Bj2D41WuUeZBYxIuSgVwuMRmoSdGbTnbHAPp56ZUiISmdECw5nTwueEQyioXSCtkqT2Ja3x9ozI740GXiubNaQ41WRMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743682183; c=relaxed/simple;
	bh=HRJ4VQHLu0emwrcajIwG7AaCaM8Yazy63e2Lxo4bPDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CTaJhvxYAgr7uPsweEynHYQ/+dJASLpv+v25xkkQS4IhtL+LG8Ka6ttu6wvH5RzpxZ0HaQnqNwUB2TGnJ6pXw2H9qdESsK1R2laNZidDYvwwGDbpIAiVExjFaCteijVONzhm2AK7HgT3zRqJ4NU9zD6y5PY5+6xzPa+zIXFamP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n+uQ4Vyz; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5f09f2b3959so4186a12.0
        for <linux-usb@vger.kernel.org>; Thu, 03 Apr 2025 05:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743682180; x=1744286980; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHjvfBRxISPEMnu3DVDSD/KoNUJ6WfjbGHHT/RUHDuI=;
        b=n+uQ4VyzrbFwk7D+5cEjWsPwho378vg1YTg+0pTW6LG+RAahSorbkc/sA/pAQ/ICfw
         HxtnbJjIFVuGgtiL59MwfmE7545MuT40yyN2wSs7BygTzEi5yViov1wK0Q+txqjxuJk7
         5kwNacelWx8BJ8nQ6Dp3WevXwxVK49t5Ea2CEb6b0JkO+XHhtIV7raEKxOyxa1XvvCu8
         K03X46UhQNJ7mDNhnK6jZvC675NhYVDf/MPTMGGcqm3AcO1fbHuLLVfpA4XN5WJvx9Fx
         Hi+k42S4NddSVQmj+uGFSUE7+49bjKTa9M5kj4y1Nm1HvA/1Kslcod05opMhf6GFbfF8
         OqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743682180; x=1744286980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHjvfBRxISPEMnu3DVDSD/KoNUJ6WfjbGHHT/RUHDuI=;
        b=oCxrfUOMXxwNtPd0KuU4Y5J/Nw0cC+P0r4pNL37lfNKayyyB09gOUrXiXiATHckt86
         FQcStDqIeTNUiPYg/0uVlJMnBYvkLpTHiOsj6Pkte+FCrWLF1vAXAuREzTMdhZBeiOf6
         RdvRYsojQXVRp9H+RrQi9bOxKB8QITm/LkkRdZdR1HgInG9T3jFBgMqG7ZK394+CgHNh
         q0CVr/O7GdXvEXLCHpz2jdxCqLAZgUST0uqxns0eWDkmklLGzbMkfRwecqLDDFKEtJ0i
         WRHuGGMpWmidi5I9U7OLUj2BKJFWU9pZ9JzO5mwZHkVyAPkXCVtsUCkErC/zA70puPTp
         bOxA==
X-Gm-Message-State: AOJu0YytOIYWsuz4ikx5PRJgnTQs3znLf0Qw8eKGvmSPaGmS6kxTUhCc
	fY7CjYdaToB4/ZJmNJJWv6MLYH22OogO9U/N9yXEjzCxsWthCR6CJUR+X428NB4K5G8We/2SkWD
	Buri4TR7ySLqx+eMNN9ja6i6Gj290iy1HwZgua9joKRwflmng9hj6
X-Gm-Gg: ASbGncsxnA//bpk9LJyUqS6FW2jnLqIdAcL2PJ+wKNnbRcoBCRVmfK+xtm19IZYak3f
	GgihD3IY4mzzyHmlPO4uc2LESum9II13RaaGL0xuHgBDMAhHW7GFF+QKv+yAgMt7hRhl5ODyUp3
	jgLK7j3L9zzufFht39vOZT+DvFczg=
X-Google-Smtp-Source: AGHT+IE07gRQRiskFLWSI7nqZgD1+d/QJ7v5JtEeOOxjpUkFcaNnav4/Un5DxB7tCpsftQmgPIxogkZ1py/kK1Y2DAs=
X-Received: by 2002:a50:9542:0:b0:5ec:13d0:4505 with SMTP id
 4fb4d7f45d1cf-5f09fc0f94emr45236a12.5.1743682179665; Thu, 03 Apr 2025
 05:09:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401062951.3180871-1-guanyulin@google.com>
 <20250401062951.3180871-5-guanyulin@google.com> <cc96ceae-304e-4113-86f8-06b6037ffd4b@rowland.harvard.edu>
In-Reply-To: <cc96ceae-304e-4113-86f8-06b6037ffd4b@rowland.harvard.edu>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Thu, 3 Apr 2025 20:09:27 +0800
X-Gm-Features: AQ5f1JpC5SFJlq2upMGrYiudiKyO2nC6Iuklu8PC2J7Zcy9fVZLYUPNyuuaeWKM
Message-ID: <CAOuDEK19FeZsR_0-4t02kszcAVH2JMiZ1D-z-sd9yK1beMfG_g@mail.gmail.com>
Subject: Re: [PATCH v10 4/4] usb: host: enable USB offload during system sleep
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 10:28=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Tue, Apr 01, 2025 at 06:22:42AM +0000, Guan-Yu Lin wrote:
>
> >       /* Suspend all the interfaces and then udev itself */
> >       if (udev->actconfig) {
> >               n =3D udev->actconfig->desc.bNumInterfaces;
> >               for (i =3D n - 1; i >=3D 0; --i) {
> >                       intf =3D udev->actconfig->interface[i];
> > +                     if (udev->offload_at_suspend && intf->needs_remot=
e_wakeup) {
>
> Why is intf->needs_remote_wakeup part of this test?  There should be a
> comment explaining this.
>

I think it's still required for remote wakeup supported interfaces to
skip suspend as the suspend procedure. The reason is as the commit
message suggested: "skip usb_suspend_interface() and
usb_hcd_flush_endpoint() on associated USB interfaces. This reserves a
pending interrupt urb during system suspend for handling the interrupt
transfer, which is necessary since remote wakeup doesn't apply in the
offloaded USB devices when controller is still active."
I plan to add the following comment to explain the situation:
/* Don't suspend interfaces with remote wakeup while the controller is acti=
ve.
 * This preserves pending interrupt urbs, allowing interrupt events to be
 * handled during system suspend.
 */

> >       /* Resume the interfaces */
> >       if (status =3D=3D 0 && udev->actconfig) {
> >               for (i =3D 0; i < udev->actconfig->desc.bNumInterfaces; i=
++) {
> >                       intf =3D udev->actconfig->interface[i];
> > +                     if (udev->offload_at_suspend) {
> > +                             dev_dbg(&intf->dev, "active interface on =
offloaded devices\n");
> > +                             continue;
>
> If intf->needs_remote_wakeup wasn't set above then the interface was
> suspended.  But here you're not going to resume it.  That can't be
> right.
>

Thanks for identifying this, I'll check for needs_remote_wakeup as
well in the next version.

