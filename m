Return-Path: <linux-usb+bounces-21781-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C27A61A34
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 20:15:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3111A463741
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 19:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE94203707;
	Fri, 14 Mar 2025 19:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBDi7oup"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1663D530
	for <linux-usb@vger.kernel.org>; Fri, 14 Mar 2025 19:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741979741; cv=none; b=ug1xB+7QY1sfpjwdF1OYRzbuTRsqRXwPBzCvqX8HUk5/arfTHZxettKE/Sfz+fNuUNznTcgH0jJkHIN5HUt5CJHJTymk1NFbYljF7ZOyVtuvYRMlCi/9+lLifrIzLgq9Jw5FO/bXwJv/HW3XMIlK2quw6zfyOfnkW2qUaq3gMuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741979741; c=relaxed/simple;
	bh=QRVBYsFgEtgkAHZo89UkyHKbuU3iFu3xnQWsKlPZV/M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ElaC3rTY7NS/HrQ7lNqDiFmJ+x/Bpd1T4bvFhCiwK+VsmBQHO6MZ84GVFIrQ70HShLb9TY2doK0tJl1gGvzzpuz82i2ow/hYTcgCPkr6f3XqQEhxkvullmmJBggCOuRGwB7ctLfNjuPJCeDX6qnBpI5HFWvASs7itHkFvuCgX50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBDi7oup; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf680d351so405425e9.0
        for <linux-usb@vger.kernel.org>; Fri, 14 Mar 2025 12:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741979738; x=1742584538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7cpv51moTCRp1bNOzm4L7Yz+PF7al93ofkypjr5mSw=;
        b=QBDi7oup+jFDhZv0AAP4F0dx2ploojcxBgFaboDRdcYt7eC3AVFMUfDfBs1QrmbctX
         l6ZmCo9moaO0u1XIMFx2nahijnLLZJtVbWumjLZZzsjP6xM32BPCQyaWZlWHy/0wZCof
         MS9JTuAeFx0tbHdaHpxwDDPVaJo+KBdDM283ywjx8SV2WqJXY09iKWYU5QU1b1bG7tse
         jKInFPrk7OrLPtJPzjPX/91EOHA05fyc1CDo8l+smvsVMvP25Cp8+RwslnrwlGJAGWbW
         OmdxtWteWIy+1Pup5e4uxTzicXh8B+pnM7uHrc1fJBjTVgxs5VFmFiYz9zRIS96f/WZB
         ar8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741979738; x=1742584538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7cpv51moTCRp1bNOzm4L7Yz+PF7al93ofkypjr5mSw=;
        b=rDKsH1FQ3VTOcSfpB7ANBRdF9O/kVrq1bzlUkxOti5C/bQOHrq0b2ziSXvqh8z5DnX
         JJ0FMW6dPbY3bOa5j7LHXL3zr4qH7oOZ1A9OrejiJ2iPcUhJ4MPCyiC9mrIeg7dqLhjD
         d1XVdOh5IhxKDRapF6Z23t8ly/fRPKDQGXVNAcT80vRC8C0NO5cfJniw15CANEeeTQcN
         3C1SWDQ9HzN0obx+AbDnMRHmvymDGWmnOMHqAf2WSEsCSFgz/AO9Evyw3JD4K2h2B6p5
         8CT0DOFtHI8Iq1/rtUjZmZ/+AICOsPYdZNtOeCBbGWv5C9EtfiDkoqRXl8qiRVSZSOOl
         a/Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXnZuO5zdnp3xHREOHeuIz/uUI0/HSbZ0wYfr2D7HQuBgEfDXDG4rjfKYrIyQb0h9pH4R9rTVWc01g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjHPgBLmD1LZQGSjlDWTD4Nw2bBNHakAGopVTnwJKSVI4HNIGY
	OJc2fB/c+qUoRuGKw5Jy9jy6CpXewL2i3p/nytAeG3YZtRmke/n4bjbcmA==
X-Gm-Gg: ASbGncs1B4R6cy0H6E0u+996gIfJQKOqWTZgYke2Gzs3G5Z8WgJMgb0ymwchdkmqK62
	/apCHgqfVUnMYZulLOXT0sO15Rodd+ULnG2Hur4diGjuXkTceVK/hGVgKRULTCGRWAT7mkkmXwv
	/1hoUOp4cLN50w7D7F19Huizrg2DRsRNbIN12r88X43r2wbU5l9vgvZwCafXZI8cTdVysoYmIDD
	CP0pWBdY1fCpVlR9MdGeAi/isuaix3oMaIDtqEcmTd0RS9fl/1KTLZXZs4u7xLIhi23xHW6AyZ5
	VR5Yk334aCnxDjZO+OioIRuyELuAjZ0flQjB/Tiq8jqKQX5aYTvTNTbVNJZaXRWTNj2T5a4y4gZ
	nE85xSYQ=
X-Google-Smtp-Source: AGHT+IF1doDwvpw1rZXw1K4aiGbfkaTzcqnEu966kq2UkQV/f5Esw65LtyA6m4FcZosozCmS7ehyhA==
X-Received: by 2002:a05:6000:4008:b0:391:3207:2e68 with SMTP id ffacd0b85a97d-395b758f749mr7736215f8f.9.1741979737772;
        Fri, 14 Mar 2025 12:15:37 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df3512sm6756757f8f.12.2025.03.14.12.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 12:15:37 -0700 (PDT)
Date: Fri, 14 Mar 2025 19:15:36 +0000
From: David Laight <david.laight.linux@gmail.com>
To: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
Subject: Re: My transfer ring grew to 740 segments
Message-ID: <20250314191536.6c35c777@pumpkin>
In-Reply-To: <20250311234139.0e73e138@foxbook>
References: <20250311234139.0e73e138@foxbook>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 11 Mar 2025 23:41:39 +0100
Micha=C5=82 Pecio <michal.pecio@gmail.com> wrote:

> Hi,
>=20
> This happened under a simple test meant to check if AMD "Promontory"
> chipset (from ASMedia) has the delayed restart bug (it does, rarely).

Several years ago I found a bug in one of the asmedia chips that it
only processed one entry from the command ring each time the doorbell
was rung (the normal transfers were fine).
It would get 'out of step' so every time you sent a new command an old one
got executed instead - very confusing.
I don't remember seeing the bug 'worked around' while I was actively looking
at the changes - so it may still be present.
So setting up the ethernet interface I was using only worked most of the ti=
me.
Reproducible by adding two commands but only ringing the bell once.
I fixed it by ringing the doorbell again in the completion interrupt path.

	David

