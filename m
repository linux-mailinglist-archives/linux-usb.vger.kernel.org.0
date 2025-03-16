Return-Path: <linux-usb+bounces-21800-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0318FA635C6
	for <lists+linux-usb@lfdr.de>; Sun, 16 Mar 2025 14:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DB0916DB87
	for <lists+linux-usb@lfdr.de>; Sun, 16 Mar 2025 13:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941121A5B9B;
	Sun, 16 Mar 2025 13:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bargC5lQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2E41991BB
	for <linux-usb@vger.kernel.org>; Sun, 16 Mar 2025 13:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742131252; cv=none; b=n4+pUE4IRRMGjB2lSdAKd1A3xz4mq9w/ptvVaMLH4iTcxLk4DdGt7XaxN3Z15Y4OCXGbDhJLodp3Vj8ckR8nqiMgN5uzXHpeDafslJdNGaZn3QIDK/dy4YrIrcOvj11BJsp+NEyIsm+k/w6RL37ih9O59+yZvsSLvxtA4atS2yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742131252; c=relaxed/simple;
	bh=Jk+iGH4z14UjaR5OXr0yNZw2fQoKL+kdiGR3YrJzWw0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KprMkwPAN4cY/Kv9b8osRueonMkV/fzGa85kP0cWWyFREWwxeW1Y2ZO72EcFdUw1swllrW4W2/AIamClo+s3XGyTVnalHDUFIeg1LgzznDt0TqCr0qMIsjuySizI+rtkZQjwwS+XNgYjJGBQcGwHQV0siBTjpnTWwiY8JOBe07o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bargC5lQ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43948021a45so12846165e9.1
        for <linux-usb@vger.kernel.org>; Sun, 16 Mar 2025 06:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742131249; x=1742736049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvbnxucIm/qQ3dm6A8FXIh9qeMe6gUdOsKuW68b/UwA=;
        b=bargC5lQ9OOpbkM0zt9ZcFz2QpAUWlaxm956UKIJeJR07yVPiEjJnTbThMHyfkzSpU
         2yDGbc/LXw7pgXJqtpd25QQY0YTqoOp55GU8XbDO7tsSx4+QJzspR4sRRNVutzgevJjB
         CHiVNhgY0KJzBCfsnZwWPXNaxy56eNqBPy0pDTRo7Pk8qsSh/YNFyYC9HIMmd/6rqer2
         ppE6RMiDt3YR9gBaNs9a1PiZpHe+NiSC5+TwiycPmt1eEELiPUwjjWhVfyCyn8f6IEgD
         0cdHAbJa6ay22UTYJwbkodRVsq+C8S4uWx5u5t8AXHumf87OvQvhLBS1j+CUot63+Kf3
         8YUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742131249; x=1742736049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvbnxucIm/qQ3dm6A8FXIh9qeMe6gUdOsKuW68b/UwA=;
        b=pp/axeelA/KA73ubl7taNZuWP9+5IYuX1U2MBGRgaJnedTdLKc7s9I0O4aY5szScGn
         EOu/TI09/MVtNXs1oQvqgJpESMUVLoG6KfOKWmvkSUFx9MNbbKk40bKRF0StuYzSSbwS
         bw5LZt//KJTsQsuhsABqyX0pKEF4xGD7vHFjangBNVICOskjKPbJKxz0VIiN9FZWhAzj
         cTzwm1hNJDqxU3S9iVqeE6RLCZChlxDsdSOWQNpG12wmw8SoRDo3NhIdAFoT6XGIJ+Tg
         6IX3C7TOh62r+DlV09bbzcet6JH1xLGzqt0JteKMAwa+mbhbRS0RL2nvA1Mo0NYgIR+G
         tmuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXycBGwCG4ZyqEg8SvQbnqM1fnz5PTu3NEoBK49VGb4U8MWEfaDDQU7c6rzGSP1KUt8uWAfiqpAiBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCKkkoDn0tbVp5QzV88yXfMUu/G10I166fhrrzgQAlrDfs1n3O
	N4AKretjFB/HZ9jq9aJgqXSSWeMouVuG9GfESBExWHcsnj4NwswU
X-Gm-Gg: ASbGnct6B7xDEk4p84uZm/W1qgJ4ic1lxLFucAmDbukP4imIy7tjaRPjzSwScM2pvAL
	H104kHOaVqsoZkOVgi6aaTpwf5ULpp2LjrRMbub0OaSY0opOek9qfacgOjZcpzh0Mx+WZiBgLxo
	5e8WdZOO5H5x15XUeIFCljWaoO4dDKlKqWDRdgzWCohkxOwZCAelRiXVNrrQXHKwaoQzo3ffAbu
	n82uCeQrJbZdN0shYPBtEfq/vfocKZ/o2dmCqglAV6wUCbMoCdQ765s1s6fsR4m+qxrc2UOmCCK
	BEPooaPYakOimCJuSq58vWu2rsOPc7FQVDLBnZr7mBx0voU7mZfvbmJsJQDj3IcjxaQUERqafF/
	zZA55+3A=
X-Google-Smtp-Source: AGHT+IFHqjqwJ1Pit3qMqXkAljSE2vX1/DNcHXOTc3PxU8eetPXPJzXrB07JwZu8828KcAJ202mz/w==
X-Received: by 2002:a05:600c:4446:b0:43d:ac5:11e8 with SMTP id 5b1f17b1804b1-43d1ecc3729mr87342245e9.21.1742131248452;
        Sun, 16 Mar 2025 06:20:48 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d2010e0bfsm76643965e9.36.2025.03.16.06.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 06:20:47 -0700 (PDT)
Date: Sun, 16 Mar 2025 13:20:46 +0000
From: David Laight <david.laight.linux@gmail.com>
To: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
Subject: Re: My transfer ring grew to 740 segments
Message-ID: <20250316132046.60f785d7@pumpkin>
In-Reply-To: <20250316112744.4cf579e7@foxbook>
References: <20250311234139.0e73e138@foxbook>
	<20250314191536.6c35c777@pumpkin>
	<20250316112744.4cf579e7@foxbook>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 16 Mar 2025 11:27:44 +0100
Micha=C5=82 Pecio <michal.pecio@gmail.com> wrote:

> On Fri, 14 Mar 2025 19:15:36 +0000, David Laight wrote:
> > Several years ago I found a bug in one of the asmedia chips that it
> > only processed one entry from the command ring each time the doorbell
> > was rung (the normal transfers were fine).
> > It would get 'out of step' so every time you sent a new command an
> > old one got executed instead - very confusing. =20
>=20
>=20
> Interesting, but it doesn't seem to reproduce here.
> I tried Promontory, ASM3142, ASM1142, ASM1042.

So it isn't what you are hitting.

>=20
...
> Was it supposed to happen every time, or only randomly?

It happened whenever two commands got queued.
So the usb-net initialisation hit it.

> > I don't remember seeing the bug 'worked around' while I was actively
> > looking at the changes - so it may still be present.
> > So setting up the ethernet interface I was using only worked most of
> > the time. Reproducible by adding two commands but only ringing the
> > bell once. I fixed it by ringing the doorbell again in the completion
> > interrupt path. =20
>=20
> I don't see any evidence of such workaround today.

The machine that failed is 'no longer with us'.
Was an AMD piledriver (or similar vintage) with (IIRC) an asmedia USB3
controller.

The project I was working on got canned - so I stopped persuing fixes.

	David

>=20
> Regards,
> Michal


