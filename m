Return-Path: <linux-usb+bounces-15249-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3440E97CD77
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 20:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 570E81C224D0
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 18:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0981C6B5;
	Thu, 19 Sep 2024 18:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PRMw0wRT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC1A1802E
	for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 18:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726769460; cv=none; b=i/cTNO5Oc/CIzdoxIt6XhzBal/9IzCvohTQ5wuHx5mPUMTgGzkvFMvfJCh4EYuaAGeQfx+LTDgUWdA1htnRIwFtDWYogqJsUj6HzJ16e1T2myJGBVkG2H3EmSI7J66Hd4AKcP5kPYjukLuCaxRA+BqRNuq52N7QIElbpsrczVec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726769460; c=relaxed/simple;
	bh=l2MLzMX5iXvCMR0lUpuNHiki4c0+puCef2Bk6SNuv7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OLHWV/vWw5L/RR2VIQKn5v0VT7qAyPJCaZ94Arbb+Cs5W1PatBIZq1TZtTu5FYDXVxyxhx3Zmyb88enhmdZLf8pDBvLUKns8zeUVSuFYs7tFBMt4AWjjoZDlgRFiRcI6nkhFY5+xGp3rTAepAqmlhn+psy7L34zKJe+MId1EYig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PRMw0wRT; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5356bb55224so1671347e87.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 11:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726769457; x=1727374257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2MLzMX5iXvCMR0lUpuNHiki4c0+puCef2Bk6SNuv7c=;
        b=PRMw0wRTEGBq+i4EUjrZextIip8DeNVK+o5TtICIVGj4XuGJaW256jM01DVmpGgrKS
         KsPZJ7uCrwg5LIGMqKNjH2MjAHBhAFAED5RVE9SBS9X/JVJyZab6dKozXnif3GvSxx8a
         I6XDnApjNkMtq2OtGm8NR6aateSBzeiHV6GvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726769457; x=1727374257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2MLzMX5iXvCMR0lUpuNHiki4c0+puCef2Bk6SNuv7c=;
        b=lfJTYvpwll0wRpCXVIq9lf7RGjc8zEUl8j9sRxYyviQGauuSf/KiVt9D376GSivftI
         sfYQQq2Lda/I38lhroPDcz1F3cJ8YTCFLzFzelPYwV8iV8jkz7tOEBiQGbF3TFumSUJi
         6NXtcA4YnF7M0CWJt5c2irAr8oQExa+OIsyEBtbC8EUlhG3Pf/zdDCVMP70CoRtD3d1K
         PWpipEntU0aUEPBTUpmCdXZYxnJV1bsLjWNDb2AZ203vpMgW4QUer7XiJkx8EIfAWICI
         cPnuXUNeWYdwKsapuOhnUfFx4mEfj5Lba/f0RwVWHB5SuXtpdTDUdaKEWWB1zEgIo3SH
         muCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7fSOrsTJexvsLlwHe4fq7LfGDocSBTsHzMywwISBkFmtL/JfAS5GQcuXSpdQiSOu8BVweNadlsSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC0ZGzheAl7QOzUjPDqZ9Mv6moQg3SN9Eba8AA+YMqbCvyF4Il
	JgC4JfOEh8ejh+jxx12w2oaRC3E8XbH4GlN57WletU5PB7bHRKKUpnoZyAMhKzFY860HB65Gv4Q
	XVAXxVabVxTwwIprJK5Tbk3mNHppqQX6IA3g=
X-Google-Smtp-Source: AGHT+IEFIdoPQ2a5NgJf0CRGmYSPP7BrB3wIZtvRgaI4UwTPy7YaDopHcBZl/oNbmDkXg9DZFPtF/KioLV/DrJ2l2Ts=
X-Received: by 2002:a05:6512:308c:b0:536:53fc:e8fc with SMTP id
 2adb3069b0e04-536ac2e59damr120162e87.16.1726769456693; Thu, 19 Sep 2024
 11:10:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910101527.603452-1-ukaszb@chromium.org> <20240910101527.603452-6-ukaszb@chromium.org>
 <ZuGcw9y0hIiuIXvK@kuha.fi.intel.com> <CALwA+NbY1qbV_01NcOSN=C=9hiE3UV3aYvrKzaGKm95Q2EQ8EA@mail.gmail.com>
 <ZuweqBOt_53n3HPA@kuha.fi.intel.com>
In-Reply-To: <ZuweqBOt_53n3HPA@kuha.fi.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Thu, 19 Sep 2024 20:10:45 +0200
Message-ID: <CALwA+NYbm05y0BF1nayC+1gpoEKcvCUb05oHC50XQhdVFL5pzg@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] usb: typec: cros_ec_ucsi: Add trace events
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Pavan Holla <pholla@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2024 at 2:53=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi =C5=81ukasz,
>
> > > This does not look cros_ec specific. Could you check if this could be
> > > made part of the ucsi core tracepoints?
> > >
> >
> > Good point. I will look into it.
> >
> > > I can also look into this more carefully, and throw ideas if you like=
.
> > > Let me know.
> > >
> >
> > I would definitely like to hear your ideas on the topic :).
>
> This information is more or less the same that you would like to get
> from that netlink interface, right? If that's the case, then is there
> some reason why you want to get the same information from two
> different interfaces? Sorry if I'm missing something obvious.
>

I find both trace events and netlink useful. I elaborated on the cases
for which netlink seems more appropriate in my other reply.

Thanks,
Lukasz

> thanks,
>
> --
> heikki

