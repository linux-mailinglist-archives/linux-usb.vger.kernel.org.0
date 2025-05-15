Return-Path: <linux-usb+bounces-24011-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F4FAB8F83
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 20:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C5B6500E49
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 18:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A985E28B414;
	Thu, 15 May 2025 18:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BrWqlxq1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CBB28C841
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 18:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747335460; cv=none; b=rpDwlTXBbmb3HsGl/Qq8UcKhgonAps+gzXfnOu0GhnC4XyyIS86HUWx4Juyb7JbLqHEzuVgZF0oKmW5UES1wgFdpzFxupzgFNrPINJzu2sbKTmqMwickat7p2uuW9z6RsgdvK5j2JRo/hUq/PkFWguwi6H/eWGJZkDuNjCoHEv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747335460; c=relaxed/simple;
	bh=piavZKKVRRRXRJ3oD+/qvHhZf5oizYKW6Z2MeaDahMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qIOT3XSJh6sWrHhmVtMfTS47Ay7gjIHue16M7ZpeJljCUeYe38eZ9fsa351OuVGdNjBvjCIg0wNZ6LToPlxekoII9w7wrkp1T9mBit3KagNfCZvY0WwFqYRLdwT5OI/e3x9DVJ7jln6I/zJM3AkNVHNuoiNhJHQbFnyzv7z8P/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BrWqlxq1; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f54079e54bso11814546d6.1
        for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 11:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747335457; x=1747940257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/R8law/8/813zo72mA7DI8YflQe+Z614jj/lyvxtZk=;
        b=BrWqlxq1TRl0pPe9dbtZYkhECCcPMoQNYxQ7NPUHFCDi1aRaBZWtz4zAHY2yNiuYwE
         WV99L3q/MGWl9HUzmPHR1tQmmMuc+XLa2qQVH1+QqTYxGG2h9Fn+CfpxVTFyIPUvhE9H
         D+BBQPsC0l2/7cmF3/TeX34ILssISdkgbEPBZ4U2fkpQi/jNeqAEka9USwngwINahX0K
         ZS5pSjZtw0RQ59FMalKCDJQEUycs8fE7p8Y0j8L8WqHj0HLywUy4GWUCCPti0OHd44kE
         kv7aA5vqKt7ghFeDSBALpnMovZlOGCC62D266kmpmuLtd68q2yeER5QrcPc0NIOt+I2t
         a06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747335457; x=1747940257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/R8law/8/813zo72mA7DI8YflQe+Z614jj/lyvxtZk=;
        b=PsmuLof7tx8VtDviDpdbrz5YAvorWj06iC4nlLARg83eSmkWvQmR6z15MHgFi+92CF
         1Xy9mmv7rHPKCrfXnN92rjvua8lp/H8kjTHpcKNC6TqC1OFqvYYBjaTP5+r78yIkBdb/
         shaGQkGgmnB2JRGNWw2oxDcKxXjMRCt8aW6PJvhxLnpcEt1pKe3fajxBhzcTeZ2VSXFP
         hqj+npyiCEntKAiSXqRRdcTSjzMunYYG3n9sWbHHt0Vjriy2yCcFdBeciHYbQz17yO9l
         K62OImAtiIu22gNnSUVEIsSzdE4f/WvQc+9flJQufL1KOOCWMBgCMdR/beXxJEqO092g
         hWVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAvPHUY0S+ga4aVuAHRXLKgMlCEWg7uAiZY5wynV6LlZYbbBI2gb0UHBEl/GLnOT7t8eGmRpBadKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcZAvIhlsmMxuHzkvNBqhkkgGOIqL1qSCbj7Iq/G7XuO4QQtSc
	bmWs5omtUsSa3w9Uqni0Yfljsp0R7jM8JH+NDKCKwW2mZrYx49kO1lPXDDpM8ay26HHPIUZj0P/
	GnJWZPv6HqUBIYP41zykxGKVDUtlF8Za6TXruL/HJ
X-Gm-Gg: ASbGncslglF56D5OnF9AepW4RJIHxowPxP1PuqY0Oe8IrRaNDAOa3/nMBgP1u+R1Cku
	r8bbgjgTHBalwvAYOlXTBnD1zSY1hK6hdXTHO8Md/0LB0xu7lkQLh6u2zYJfLBEDJr6wY1cGf/z
	FEgPktyjidzTymOvA/szWXgzRb8JdH7tG0OPYkGkEAVQ==
X-Google-Smtp-Source: AGHT+IGVpeq3eTEggXlc3vf0T5zsSry8bVGdR5Y1sfB50aV8rXY4FCCFvw2rE9KucAvSWLEzhPVFTL50u15lCBvuHqg=
X-Received: by 2002:ad4:5941:0:b0:6f0:e2d4:51fe with SMTP id
 6a1803df08f44-6f8b086e55bmr12999776d6.26.1747335457076; Thu, 15 May 2025
 11:57:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515040259.1254356-1-royluo@google.com> <2025051557-dismantle-exclude-c437@gregkh>
In-Reply-To: <2025051557-dismantle-exclude-c437@gregkh>
From: Roy Luo <royluo@google.com>
Date: Thu, 15 May 2025 11:57:00 -0700
X-Gm-Features: AX0GCFsBuB9-8JhivPkgRd6RL7eyeHPtkdtsutaRykFSoVwx59LH0yf2ovmPnfU
Message-ID: <CA+zupgwRNNsZumGduPf-s0eCSGzaFvTGVuuzWY1aXOBa3OxRFQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] usb: dwc3: Force full reset on xhci removal
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 12:34=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Thu, May 15, 2025 at 04:02:59AM +0000, Roy Luo wrote:
> > During an xhci host controller reset (via `USBCMD.HCRST`), reading DWC3
> > registers can return zero instead of their actual values. This applies
> > not only to registers within the xhci memory space but also those in
> > the broader DWC3 IP block.
> >
> > By default, the xhci driver doesn't wait for the reset handshake to
> > complete during teardown. This can cause problems when the DWC3 control=
ler
> > is operating as a dual role device and is switching from host to device
> > mode, the invalid register read caused by ongoing HCRST could lead to
> > gadget mode startup failures and unintended register overwrites.
> >
> > To mitigate this, enable xhci-full-reset-on-remove-quirk to ensure that
> > xhci_reset() completes its full reset handshake during xhci removal.
> >
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  drivers/usb/dwc3/host.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
>
> What commit id does this fix?  Should it also go to stable kernels?  If
> so, how far back?
>
> thanks,
>
> greg k-h

Added Fixes tag and cc stable in v2.

Thanks,
Roy

