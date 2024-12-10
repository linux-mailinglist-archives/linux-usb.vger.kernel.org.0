Return-Path: <linux-usb+bounces-18313-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 306A79EB818
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2024 18:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2BA9282726
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2024 17:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F5323ED69;
	Tue, 10 Dec 2024 17:18:34 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2713B23ED59
	for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2024 17:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733851114; cv=none; b=nY4+A4Yb7Tmw9rjFr3C0sq6pVbZ3KGEuGBBtjlK8TkJndQ5nQLiY4ObbjeIz7hwL9Ygdc3QfR8NaGPV9m8j+82Eo4fir5TQKpd8p//+lmfyYvj61DVS7irrwVqgG5oIFHzbaQvdD5MXM5lEvQW9WoYl6s0XaJlmcapxjMxvx0rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733851114; c=relaxed/simple;
	bh=ES8PXM0LUbmm9wGb9zppk+2HxQE9nCLGnoNQX0MU5q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=URUc6beGwwFf/S68i1G1/kmCdrHOTb0gu3ntcBRb7Q0bdKT4AZphpBAEKMdmqzbdN+lOxtGO1CzVNrm5DMy7XZtmcKUSQaYe7VJtI8tQm6OOg4DvVCrmJzm/q3406TjK6JGSzGIS5bDncN0/sl62Zoc/UTxscYlvp2pUvbmrElk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plauener.de; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plauener.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e3989d27ba3so4496298276.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2024 09:18:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733851110; x=1734455910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ES8PXM0LUbmm9wGb9zppk+2HxQE9nCLGnoNQX0MU5q8=;
        b=SpbPwFqUqoEb1xc19gEAfvR8YEO5gQqr9rYMN6sWY/Ftd6B3gdOxUp9FC6wIBqobMJ
         pnTYDeF0kAXCFcjlsYfqXP/bfkAFNgmHVO4x0MozqT3snVbEOEBF3/cniuiqQEX2Dvj6
         e8eJsKR6Q61W2A2Sn2MSBcr+ErVhbBPrk0RQZeLG8l3asaJpHM/oaZnmTg89sfsv35Sz
         iiQ2OBuldG179CBsypnUfyoCWXXCQQXPGGQH34ULrjlrUWR/5TQ5svIhKLEQW7GZ6HIy
         E3fEZaxIXmnFSmaurpxgzWvNqFcPI3A39uNv7nPOBEMZ1xsYoreDW4bslT47h1IejNnW
         9DTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFDFDtrEHvzV2XmnwmF3u4Z2mC5WEdR1/YJeS3mIPMQztuQExTt6225Dkw27sxTqFWbpvphoc5TIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDwkSJFLPnT0+OBy65Nf/uXjni8ZHyCbHJkJ/lYW73slRj+eNc
	jjiAZDF4c4dGtYakTaaWS53gfBNyx5gtRnw0AyzLRIfEwDuzsRvv/0IjGLKvXl6AqiNBswNmrtu
	Gr8HjxZJsI/8VmdXu/ckecYNqcbY=
X-Gm-Gg: ASbGncuHMoz2EwkrOfc0d52beQfNwhLxINRfN6fjRLg9h+vQWhgHFP2PSdBNkps5PGt
	8ccsptZ71DNDGpD5r3jSSUBhRJj5mRsh2NK98OIXFfhoL0WGkK81OmLBsM91PLdlKLRj0
X-Google-Smtp-Source: AGHT+IE8MOniJa9Ei6hzyb8Cp+9zamPUiqRGKStRsjYBwO5OT2eLWpE5g1ZnRIXb0HCiZNgnQGcHAssHi4hsG3Kci6w=
X-Received: by 2002:a05:690c:63c8:b0:6ef:9017:3cc4 with SMTP id
 00721157ae682-6efe3c837cfmr172564197b3.26.1733851110019; Tue, 10 Dec 2024
 09:18:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJugSwwpWKFbniGkdDCcGtKAbeYhoCsP=rMdmfaWGdFiFGEB0g@mail.gmail.com>
 <20241209230325.5a683364@foxbook>
In-Reply-To: <20241209230325.5a683364@foxbook>
From: Christian Krause <chkr@plauener.de>
Date: Tue, 10 Dec 2024 18:18:18 +0100
Message-ID: <CAJugSwzYjWYEy7WTu73BQPODcNaYFXn5nHpTNPPkprF6LGQ20Q@mail.gmail.com>
Subject: Re: Different speed of USB control transfers for HS USB devices
 depending on used USB port
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: chkr@plauener.de, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Mon, Dec 9, 2024 at 11:03=E2=80=AFPM Micha=C5=82 Pecio <michal.pecio@gma=
il.com> wrote:
> I see obvious pattern that the bad ports are bus 001 and the good port
> is bus 003, and they are two different chips.
>
> Do you see similar correlation with chip types on other motherboards?

Yes. Here's the result of my test:

HCs which show the problem:
Advanced Micro Devices, Inc. [AMD] 400 Series Chipset USB 3.1 xHCI
Compliant Host Controller [1022:43d5] (rev 01)
Advanced Micro Devices, Inc. [AMD] 500 Series Chipset USB 3.1 XHCI
Controller [1022:43ee]
Advanced Micro Devices, Inc. [AMD] 600 Series Chipset USB 3.2
Controller [1022:43f7] (rev 01)

HCs which don't show the problem:
Advanced Micro Devices, Inc. [AMD] Device [1022:15b6]
Advanced Micro Devices, Inc. [AMD] Device [1022:15b7]
Advanced Micro Devices, Inc. [AMD] Device [1022:15b8]
Advanced Micro Devices, Inc. [AMD] Matisse USB 3.0 Host Controller [1022:14=
9c]
Intel Corporation Cannon Lake PCH USB 3.1 xHCI Host Controller
[8086:a36d] (rev 10)

The tests were done without any external hubs.

> Generally, with xHCI it's on the controller to packetize and schedule
> such transfers, so this is likey a hardware problem.

Sounds plausible. On one of the systems I also booted Windows and I
observed exactly the same issue.

Since most USB devices use control requests mainly for the enumeration
with quite small data sizes, the problem is typically not visible.

I stumbled over the issue when using DFU (Device Firmware Upgrade).
DFU does all data transfer via control requests and so any larger data
transfer with the problematic HCs is about 50 times slower.

I'm open for any suggestions on how to proceed from here.

Best regards,
Christian

