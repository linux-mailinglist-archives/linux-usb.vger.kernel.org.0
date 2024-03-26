Return-Path: <linux-usb+bounces-8440-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 346CB88D2D8
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 00:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D44D91F3EE6A
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 23:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AF513E047;
	Tue, 26 Mar 2024 23:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LCt7wlNS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D810313D8A1
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 23:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711496097; cv=none; b=QV5Bc1H2raAzU+fLNJrpZmwq2qjSkTKTwmhSxpUpO2Nb+3Rn5WA8FuWs6sQF2eSVNMPtLD/BEX1VvqU+wGaMER5jCU7xS6h0bMmBJ6F/7bTo2bjEw82E4uhCctS8UJc7xFgHuM0/t0xL37jEcCvzVGi+RlzJiB73p9SBJsF1Q2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711496097; c=relaxed/simple;
	bh=EwMlcl8PIzr8RhdfN5ZZNNfvQw7deC+B3FnxlLEVjfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I/Wap0kgBbslv59M2tt2YOereHfMzgfVMV3YgdAaPz4BLgro8sTgWwRpwb6eXjOpASdDMcS8g3+IzQcIFh+8JYIbjBoflKxPLL92DjGYzviBMgauH/e8iQpTbmlCzckk9FG+mWSjWcf1plE683wh+AF/GXAAyMREbiTd2oFmaqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LCt7wlNS; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-7e0425e5aa8so2605621241.3
        for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 16:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711496095; x=1712100895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYmdJQpGAyKoO561dC+ojA6XOTgi5Uts09PCMGhkelE=;
        b=LCt7wlNSOzFOXmkyYZmXHFTn4zUtiQyDgCI0wHIF/7tiHLja0NtA4n3bib2Aqv6Dbt
         9Sg0ziXuGxWgjpYIjzgT965+2rbjLPeHDcA9scB+WtXg3H1DyeTKd4njse7UNMgjUYFy
         M06DALQ141QmnxHetfMalV2kBcv+FCZen3Jdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711496095; x=1712100895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYmdJQpGAyKoO561dC+ojA6XOTgi5Uts09PCMGhkelE=;
        b=egwEcDqSwVwSsCh8qN9I5WqrEVCDUyI5zYuOA9qIn4I4d45tK/SzjF6kl7S9RcIa/y
         XdQlj0sbM5jfksgivXxQoeDR4UmK9FlZrcGD+O9zmbZth9V4HyFz0JsdOCajsgvX8Pwm
         6WtvdAhB0TquPA3xxWgLBYNNAoGwHTJHO6258tcjE12yRgv87cRtdvvm8ZpSxAqThV9n
         9qpKbrYlYjtlTlYIJT5X24ZoojKV2jthnL/EImwLfZAXsdz+i8eCiyhZ7VZ4QOQWxBiU
         lZ5ez2N5asbW9KmamPUR3O7OT81IoxACQkueBLQxGgOs/8MJ64esSZ5S9KSQIlXVqw0/
         Qshg==
X-Gm-Message-State: AOJu0YwTLOwm9n3HKfPWFPNe3vEytlNhe9KpipCr1tY3IUIz2dn4Gryk
	QNCz+Qi/ejxZe9AnRyCBA5ixG1XZvc0Z8PHuoWxRjphyilYL+3fr6RNKNwFmqE13zkZamDU4cnP
	ltXrss8K/BV/TjctCN3yZi9fcR78pMrr4vFrk
X-Google-Smtp-Source: AGHT+IGYjBc3zq6N8dmZwkyInQNpMvNhTO0c5xOyM/NeGeB0s1vCmPFyPTk3a/bFYwoBzpSUv1XpLGY9L5izz4Bk1kk=
X-Received: by 2002:a67:e246:0:b0:476:cf52:e1b7 with SMTP id
 w6-20020a67e246000000b00476cf52e1b7mr2432676vse.28.1711496094788; Tue, 26 Mar
 2024 16:34:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325-ucsi-reset-delay-v1-1-d9e183e0f1e6@chromium.org> <2024032624-subtitle-crisped-f4f1@gregkh>
In-Reply-To: <2024032624-subtitle-crisped-f4f1@gregkh>
From: Pavan Holla <pholla@chromium.org>
Date: Tue, 26 Mar 2024 16:34:44 -0700
Message-ID: <CAB2FV=4Z1W1HSba50KaB3rR4=Ussb5RWPwUArr0_=3pFwxpAhA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: ucsi: Wait 20ms before retrying reset
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 1:29=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Mar 25, 2024 at 09:19:43PM +0000, Pavan Holla wrote:
> > The PPM might take time to process reset. Allow 20ms for the reset to
> > complete before issuing another reset.
> What commit id does this fix?  Does it need to go to older kernels?

This does not fix any commit. However, the time taken by a CCI read is
insufficient for a ChromeOS EC and PDC to perform a reset.

> > There is a 20ms delay for a reset retry to complete. However, the first
> > reset attempt is expected to complete immediately after an async write
> > of the reset command. This patch adds 20ms between the async write and
> > the CCI read that expects the reset to be complete. The additional dela=
y
> > also allows the PPM to settle after the first reset, which seems to be
> > the intention behind the original 20ms delay ( kernel v4.14 has a comme=
nt
> > regarding the same )
>
> Why was the comment removed in newer kernels?

The comment was removed when the old UCSI API was removed in
2ede55468ca8cc236da66579359c2c406d4c1cba

> Where does the magic 20ms number come from?  What about systems that do
> not need that time delay, did things just slow down for them?

I am not sure how 20ms was decided upon. However, UCSI v1.2 has
MIN_TIME_TO_RESPOND_WITH_BUSY=3D10ms. So, we need to provide at least
10ms for the PPM to respond with CCI busy. Indeed, this patch slows down ot=
her
implementations by 20ms. UCSIv3 also defines a 200ms timeout for PPM_RESET.

Hi Heikki,

Do you think the right thing to do here is:
1) poll CCI ( poll duration TBD) for 20ms until busy is set or reset
is complete.
2) poll CCI ( poll duration TBD) for 180ms until reset is complete if
busy was set.
3) If either 1) or 2) timeout, retry the reset.

If you agree with the approach, please advise a poll duration as well ( 20m=
s? )

Thanks,
Pavan

