Return-Path: <linux-usb+bounces-29632-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 473C6C07CF3
	for <lists+linux-usb@lfdr.de>; Fri, 24 Oct 2025 20:50:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBABD3B9103
	for <lists+linux-usb@lfdr.de>; Fri, 24 Oct 2025 18:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60B834B1A0;
	Fri, 24 Oct 2025 18:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KnMtUOx5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87BE3101B8
	for <linux-usb@vger.kernel.org>; Fri, 24 Oct 2025 18:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761331740; cv=none; b=RwrwIIWyi+6eBv79ROZFfsrSf6D9h+xOsatp/r78xxe011iw0bIuNcOMZYZUdcdIFRx6/YqGedmdTpmILn0LHw/LCvQ3WLNUhm9ffOJjqe9a5myRmz83oCfAXK/rXeiEBN1bgfh7uzI7raQYYqqaCqynO7r38bmAK5IKQtGOY/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761331740; c=relaxed/simple;
	bh=Dq3+bd5QtM+9NKxWniaxyIY7awGuNH0oNBuMiNJ9UEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iJOa6Mkl3G1KRuOi9YPrpsBTfpXABji70tnkpe6x8VSqdU/diTh78JltlwDLXijed2ehKGLeF1JSKU7D1GW9KsdyqurPWXGjcDhj3LJ4pqqCfP/u8LhdoRssMsXaKXFCD1B/nJzmmWd8MBDnnTHjiQf+mmBrwJR/tsOjitz6YvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KnMtUOx5; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b6d5b756284so449469666b.1
        for <linux-usb@vger.kernel.org>; Fri, 24 Oct 2025 11:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761331737; x=1761936537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDGmWKe4CMy1BrSRFF0EobvalMbjJFfVmgwc9opluPk=;
        b=KnMtUOx5tQOA4Pgw9OukZ8obkEwpOIkDAnE6rJUnkytkLMLkNwIivjIxbdHXX7VfaZ
         SX6Y2mjQFTq7Ck2N4y2N4oU+wNiBeivwJF4MbYVI1/QOkAemDcLkBa9WqevvyleiO7A9
         avD/Y6lHcU4/YZ2PhDSUvoCkltJAExfLuzbwRqOtjY610y6wzUorYWUBxwTYS5QWZQk6
         Trp4xAPkN0Ie9LHaI6Yag3xdBxaOWEkiv0RAdkN+eSIiCrelYPzs8LJ0A/Vm07pPoHHV
         yM5AwCJBaKldfqPfb9YjJnyvLyU40pku9zUGLKBIz7MsHl9nrAHE3KSBU2+A/XT8ymsG
         rsaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761331737; x=1761936537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDGmWKe4CMy1BrSRFF0EobvalMbjJFfVmgwc9opluPk=;
        b=NU0ymEwcBK4YgtgsuLAVdUeqwDXjaSJQry0S42vfLkobQqYKP1nSMnC5DSvJvpY3bH
         ynmb/RWIFYp9NzfqPFutrWqHw1I48nfYlu1Ok/yxylWjN5JUjYRckNzL3pFZssqlDo4s
         YtdzNUXG69gvWXGY3gv4EKEXQf7Z3Y8J9FQbEbtzyJBzPugsi+ClQchS76mPNQUSDiqC
         aoQk9hbKQTXVd7LsmSIEJ1Dooh6xlk0gCaINA8Kvzkn3J7HKS9YytCs1X0Lbf48LJ3A6
         G7GfS3hNKU4bU62parDpG08Z3GAr14clicM3vFRfW4ceU7nxh5JWK4emS28XbKRwBiNE
         MDqA==
X-Forwarded-Encrypted: i=1; AJvYcCUTjWv0qUGMk6zShNJ6Ae2qMomCm+grGI7S27lnwtbeJUT1TKzCoYCo8TL1Eobqd+XLtM/5wxEVKX4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1dwOeljR3q6Z8pBqeB08K9KtV6hcd5dTdPV5HnOPoTR1fokB3
	ysIxG4a+nhwdYBQvkS0FiHJ7q0vKqt2rZ1vx+omyHSSv1SobHxuZLRquyaZS7ao+4Tk82DilSZf
	ATQcluuOp97b5bQZ66cDluWzQxdKfkhMY/1k=
X-Gm-Gg: ASbGnctJWqYinTK3Tnwo35hCMd9HWS1/D+aoTwCmAQxwv4ccr1SKsqQj4KDSIQGeWRD
	aV+UiCm7CeRVEqqk9ilILnIl0LjJNJ/ng2jHCbdHuVqAe90KyNG4J8YKACO6TzHW939puE9Fhnx
	hbE8h5rV/RLKQA0OSHC65YvHQumZ3nQ1NSUIoU+hmdz98f54hO4K4fZo8tbwx0lpM544xykyzTQ
	VDMpP+YTXZytLtKj/PXZcUCwaj5qN/uLKHzaxnzeOCEZ7KnnibW5LmK1yhM
X-Google-Smtp-Source: AGHT+IGKrJEmJP7fsEHayhvsyePi4P3xYns6aIRNv4lpCLasf3x/9FqF2H/qDP5CMRaPuHaWiIFD+7gDYRW7WO0uUY4=
X-Received: by 2002:a17:907:a909:b0:b40:b54d:e666 with SMTP id
 a640c23a62f3a-b647235eeb8mr3803042666b.16.1761331736904; Fri, 24 Oct 2025
 11:48:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAcb1K_MJKWz+BYJmx0FDgrBOzzXm71-M7sgHDUOmBRppXWNzA@mail.gmail.com>
 <CAAcb1K_bezseTM8DrOrzVUi_W+nZoE2N0CO4k3AQWPw7=7pyjw@mail.gmail.com>
 <2025101544-galore-sculpture-b243@gregkh> <CAAcb1K85GK6m_bVUeSfX1GP4=mxzwfmHtaRX0EYD_jgGfQRk9Q@mail.gmail.com>
 <4e6d9b62-b9d0-4a05-99a9-143899547664@linux.intel.com> <CAAcb1K_a2dkj5wv__1BW-fu_Zg=z00OmQzJmekQ-GH4svYQ-GQ@mail.gmail.com>
 <f0d0f71c-bc47-4348-85a6-d728a67c982a@linux.intel.com> <CAAcb1K-o7DY3Kvqdr+=MN8OsgRZr+g43-zC6YSLG0hbNxEQUeg@mail.gmail.com>
 <8fe27842-8155-44db-b262-a148b5ce5436@linux.intel.com>
In-Reply-To: <8fe27842-8155-44db-b262-a148b5ce5436@linux.intel.com>
From: Milan Oravec <migo.oravec@gmail.com>
Date: Fri, 24 Oct 2025 20:48:45 +0200
X-Gm-Features: AS18NWBil86QXHUh61pnN0ydqZH-AM5oyGVooQnkTcvcSj1HIPyI-3La0J96FCE
Message-ID: <CAAcb1K9MDvqJgVbV29ax8tQhXoepJr5ABuh1NHoNpmFdnGxVHw@mail.gmail.com>
Subject: Re: Fwd: USB DBC hang during earlyprintk initialization
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you, should try this patch against stable 6.17.5 or 6.18 branch?
It fails with 6.17.5

migo@migoG17:~/build/linux-stable/linux$ patch -p1 < ../dbc.patch
patching file drivers/usb/early/xhci-dbc.c
Hunk #1 FAILED at 85.
Hunk #2 FAILED at 601.
Hunk #3 FAILED at 640.
3 out of 3 hunks FAILED -- saving rejects to file
drivers/usb/early/xhci-dbc.c.rej
patching file drivers/usb/early/xhci-dbc.h
Hunk #1 FAILED at 146.
1 out of 1 hunk FAILED -- saving rejects to file
drivers/usb/early/xhci-dbc.h.rej


On Fri, Oct 24, 2025 at 5:36=E2=80=AFPM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 10/20/25 09:43, Milan Oravec wrote:
> > Thank you, is there any workaround for this to get DbC working for me?
>
> I just wrote a quick hack that bluntly retries early_ioremap() with a sma=
ller
> size, and then checks if we are lucky and DbC capability in xhci mmio spa=
ce
> is withing this new range.
>
> It will still trigger the same  "WARNING: CPU: 0 PID: 0 at mm/early_iorem=
ap.c:139"
> messages, possible several, but would be interesting to see if it works.
>
> Thanks
> -Mathias

