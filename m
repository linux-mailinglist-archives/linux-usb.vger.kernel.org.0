Return-Path: <linux-usb+bounces-23974-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C3CAB8417
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 12:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D15C47A184C
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 10:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F9CE297B9D;
	Thu, 15 May 2025 10:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q4ZUFp8z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A50522540A
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 10:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747305444; cv=none; b=ex+h5g25NMfgkeayxl20E7O6k2O02LXJZZRKm4vDK5kNXBDr9h64kft7W3IAe+IPzAR2zBvNG/aq1wOUfogsUaeC1trLnnnDhomBdVajG1L7Mph8zBetIBka8Fxhnzl7OjPuw3gMKUUynq0oHkm5OURMl5nFwc99GNqcFGXdU1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747305444; c=relaxed/simple;
	bh=+wjRAScXSzgvB19BpIhCdyPPtsTxpd4gXe6wpMfeGZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mXC+8ajCsLYEpfRRYYp2LV6jHNrgHA7BanQIHv46FxSBROLBvJETES/5+Qe4+lUb7LlJ1EcwuW8iDc+QebE770Hr3VlJBNHUBZIjMXRJuHoNV5+LpS/JwUkqrkfmlqAAYZSMxphMZddh6gX4fFMy8+IDyx5/S48jRmYfX6bUUs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q4ZUFp8z; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso6074a12.1
        for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 03:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747305441; x=1747910241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOyEGIZY14Q0QON40JEaClFOg/37Fd68MqO4E+e/KNU=;
        b=q4ZUFp8ztm8y5JOckHCbYP+jgLfbXAsfCq1Pdt5HTNSn7su8+ngIM9v17vwqjs+8rz
         lj7CVn+Krh5nnn2KMPlTgerDXzuQRML3gauzsp2Jgn0GeSuibcwO3nzblgr2ZKzmbgey
         ybJurzhZ9EIPF7SIPcPB7+KUHDiULmfhHYOg7fOy2Zs/3Lsf0NJvP9yV/I6unlGLAjXn
         TU0OLGYAz75n6XJflUNRveWidFSdHqvF83xrcDEETmJFpNG8pl2pB1A2fw+Ma/ACw5rf
         qYuhl5kGC+5eQe2UlaqjHfBjTsQHA0QAavexLEQbpS86q06bOSXk06IGB/RzNdNnXUyQ
         8cfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747305441; x=1747910241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IOyEGIZY14Q0QON40JEaClFOg/37Fd68MqO4E+e/KNU=;
        b=ppF1JfZMLmZHyhP7HHpJYEMS9y9E6MmBHi8BwWjNb70a1HeffDZDccyJpzvMLZETTU
         OyJSATDESFhwCazLI3QfuMnlqHCpmQ5ftrkpgOx/xy9nQL8FD5/sNC5gmVvbS8DvI4Ur
         M3QTfjV7GchpSSrUF4jBZHvZmq3AOcaopryw1UKrohHdNYpEo204pc0JJ/ZOqmUWUyCI
         b2MS1JSYaV5iPCmYtj7GJUo6+Ad67+7NMB8dH8ma6GG6mX7D47Rk9BZGhlvkTgW/IorB
         ncTIcqvXSHTNpG6LHrs+NOpNX2YdURvhutIpgTLGmHdqcJ9ON0AMJd3xsCWDHVzHzL4A
         x/sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpZiFLXDQwmTk2uCgB0SKQM2cQ+SnV7vDDvDso2cP3c/7G2U63hpboc48qDy6+sipvFXLZUCj2NTc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkxUvPkHI/t3grHNqcuQu5LdZX4sd03FE4SDJuNMdvq4ZBT9K9
	F6oQwwD3s8OBSYPOcPswvhzuBJdKOMkeDKxb9km8cnolgqXgtAeZhcfx+6fYwH006555LrAqv6g
	oDwrys2iHgzz78ZHiZFzFbFd2i0cONH3zAIr1yrA3
X-Gm-Gg: ASbGncsCxwZ+2CiJgGdzc6HmY7UQWMoDepO1xUdrxAMe/bUkkoZ+BKfKMiBxt6EYF6P
	6I+B3Gw+MTZcR4BIF2MeE3UJR8hqFxzm+eURC/OUnd/M96izZAXt1KvxHGXOXYnVVwBPnvp1r8s
	hCCOxirE4L2qfvRoiwLvZVmr2nLNekm/2sfTU+1tZaeBCoV3dNRny40q9g9b+F
X-Google-Smtp-Source: AGHT+IHVZ9dwdfOWvJnGOjqhvJ7yNFKAbT/ygs03kjgwko1r6U4Op4G9H/hFpPY6KpGZsbCOfJUupejsk4TIyVbQ+L0=
X-Received: by 2002:a50:fa8e:0:b0:600:77b:5a5a with SMTP id
 4fb4d7f45d1cf-600077b6b0dmr17921a12.1.1747305441255; Thu, 15 May 2025
 03:37:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416144917.16822-1-guanyulin@google.com> <20250416144917.16822-5-guanyulin@google.com>
 <2025042543-unfocused-whiff-fa7d@gregkh>
In-Reply-To: <2025042543-unfocused-whiff-fa7d@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Thu, 15 May 2025 18:37:00 +0800
X-Gm-Features: AX0GCFs_IH7rNznpdcjmKTqpZlpH9xy3qHAYXHdNiVTjH3SSwW9wTPjVkKFUNKI
Message-ID: <CAOuDEK1uRyxHo90TUTyyVVV3W+ubkmyGvehxTdZ6NRg8LWbXbA@mail.gmail.com>
Subject: Re: [PATCH v12 4/4] usb: host: enable USB offload during system sleep
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, stern@rowland.harvard.edu, sumit.garg@kernel.org, 
	gargaditya08@live.com, kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, 
	quic_zijuhu@quicinc.com, andriy.shevchenko@linux.intel.com, 
	ben@decadent.org.uk, broonie@kernel.org, quic_wcheng@quicinc.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 7:15=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Apr 16, 2025 at 02:43:04PM +0000, Guan-Yu Lin wrote:
> > @@ -724,6 +725,8 @@ struct usb_device {
> >       unsigned do_remote_wakeup:1;
> >       unsigned reset_resume:1;
> >       unsigned port_is_suspended:1;
> > +     unsigned offload_at_suspend:1;
> > +     int offload_usage;
>
> Why is this moved now?  Why isn't it in the proper place from the
> beginning?
>
> thanks,
>
> greg k-h

Thanks for spotting this. Let me address it in the next patch.

Regards,
Guan-Yu

