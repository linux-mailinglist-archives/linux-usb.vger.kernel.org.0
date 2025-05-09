Return-Path: <linux-usb+bounces-23828-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3528BAB1ABB
	for <lists+linux-usb@lfdr.de>; Fri,  9 May 2025 18:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B7754C2CD9
	for <lists+linux-usb@lfdr.de>; Fri,  9 May 2025 16:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24EDB236A6D;
	Fri,  9 May 2025 16:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jakerice-dev.20230601.gappssmtp.com header.i=@jakerice-dev.20230601.gappssmtp.com header.b="uI51Jk74"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDAE235BE2
	for <linux-usb@vger.kernel.org>; Fri,  9 May 2025 16:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808828; cv=none; b=uE2vnGh0MFuNlS8jNXXfXhxaKWmXBbgKwIU1zCLWrIzGXackpZWXX+QADtPaTzKbc9HKd4bKO+gSWf7aDt1U04ScE0RUwRpDmyOCWewKREZjlvg6IkvPaSnZ/0T6Ylgl+6sLIITUiZ4k5nRXFBOngqwpD7SgZfscIsFmAillGlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808828; c=relaxed/simple;
	bh=ZaydmkJ7eUryQN41xZ/nR0x6nuwulT7i+Qm7Ml1xIEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nhFuUDgytp0EmghNC463h68aBnaayD79Et4WrXCvEh45Umu01OEKMl7roJmOd4BqbdudIabpkLyHWBj1tE/rkGoakxIOELRCXFcwovTSVo+J7xaNO5RZX7MLCvFatg+bzUjIr8K6A6yPLI2tATdjHS6B7pDWpaFSFP6njcuNV1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jakerice.dev; spf=pass smtp.mailfrom=jakerice.dev; dkim=pass (2048-bit key) header.d=jakerice-dev.20230601.gappssmtp.com header.i=@jakerice-dev.20230601.gappssmtp.com header.b=uI51Jk74; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jakerice.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jakerice.dev
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad1e8e2ad6bso462534266b.0
        for <linux-usb@vger.kernel.org>; Fri, 09 May 2025 09:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jakerice-dev.20230601.gappssmtp.com; s=20230601; t=1746808824; x=1747413624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezkh/c9YOiEB4YMEXS/lI8snDUy5hokGtG1LLPTxPBk=;
        b=uI51Jk74pPlUmJ5NVoQiWj/ik3Y922O7/eRxx/s11vB/sOPtLoG4W7P3e5VYeD6iax
         YS21ykUCkCh6geqoc2cr51R6DkGUg7MhiW27lyov/zgvwk+B2GJG+JOoU9JnnZdHeb+A
         +7Xn7FH+fjuvr3SGnDCd4IVRthXKbYGIjZZ7BYKNEKyoW71g6I/JEE0YE3Og+CP4r0Oz
         NiaH6Up4J5JH47NFcmy6CUkxd9bfVe0IpOlbvBUHLkUG7ZjxLJ46PpA+/zxGMC6GLgDl
         nOt6rShOhCh/PLzh1FKbLtPrN0HIuLEYYjHXEbwOQhOMrKnWpwNjf2iF9Xu2S8dtAAh5
         dxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746808824; x=1747413624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezkh/c9YOiEB4YMEXS/lI8snDUy5hokGtG1LLPTxPBk=;
        b=QJC+8B8B8nJr1ngZSkhaiUr50/DdHUSIwNu24doQixW6JhSvUbWj7rX+utRRFiT2sq
         EVUaSOGDJDlXXH3To7wdYttdgYO7q1b5MfpIYdO3pt4inZr3FVVLewsW9wBAtrvQNEtM
         3oPpaFnT3p3SOnzoqlGsXCW3sp24cHs9a+5wRioZspcr8LRuFJLETpQ/goX87MnzuF/d
         VjefRaHVky/mr7r8FNm6UG+iRTQiX/n6RhghqTh28SkzFHlLjCS8xca0AdAfIGAeEa6Y
         g09cpFf8fz/9E3shmPEbi8/67A3W8LfPUEExeN3x84VfHEtQEHwwj6DOEEI+nzG6bSOs
         oEwg==
X-Gm-Message-State: AOJu0Yz+Ds+3b8hucuVE++1CM6bXE11Lp/qtjZyJYtx8lA7065CML/6z
	O8QKggUFLJbJPSXRhWFgCPOJH4s1+ojyNZengYQ0xdWG+pDxe6AMNxgWtkdTEzHylS8oeybMn/U
	BKTd3QegnRY0Y6CUyBKQXbVphGnyD7zrXIeOn94qt+a1ZKvRRYxs=
X-Gm-Gg: ASbGncvGFUheoIzndNucoRdUbJ7D9RaXwyL6eKg0v/ee/c+vZltZOoBIt5lE50UimKj
	2MDuJgbut8InKqxxAmoeYmWrfvVGeQp257b8nLKdVtnlLydxWDPvKp27paJQ8s8Zxk8nfa2WNLT
	8+hQ9fmdRUOLzeBZivd+aGGQ==
X-Google-Smtp-Source: AGHT+IELHOq+p1zsugnV+VNzt/Afocg2GfsLFr0ysmipqQxyw3r6Btx8j/xS4gE6FCiiWPehP3G6zP+mSkQ6SxfrKOM=
X-Received: by 2002:a17:907:6a13:b0:ac7:81b0:62c8 with SMTP id
 a640c23a62f3a-ad218f8b0b6mr473399366b.31.1746808824446; Fri, 09 May 2025
 09:40:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506191531.3326-1-jake@jakerice.dev> <2025050927-bring-gusty-e850@gregkh>
In-Reply-To: <2025050927-bring-gusty-e850@gregkh>
From: Jake Rice <jake@jakerice.dev>
Date: Fri, 9 May 2025 12:40:13 -0400
X-Gm-Features: ATxdqUEOyTvQSEbd8Zcyxyv61W3TtwQMih5pSG6mXb-VTjDsGPOoVYP3FimSY2w
Message-ID: <CAFd_ZdCmqfj_Y80ZJih5G5Zn1nW0pE-R+gRFBMWRULjN7SNCkA@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: storage: Add blockbuffer ptr to info struct of
 sddr09 driver
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 10:45=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, May 06, 2025 at 03:15:31PM -0400, Jake Rice wrote:
> > Hi all,
> >
> > This patch updates the sddr09 driver to allocate a reusable block
> > buffer. Unfortunately, I don't have access to the SDDR-00 hardware
> > (which I know is pretty ancient), so I'm requesting testing from anyone=
 who does.
> > Please let me now if the patch causes any issues or improves performanc=
e.
> >
> > Best,
> > Jake
> >
> > ---
> > Currently, upon every write the block buffer is allocated and freed whi=
ch is
> > computationally expensive. With this implementation, a buffer pointer
> > is added as a member to the info struct and allocated when the card
> > information is read. The buffer is freed during desconstruction if
> > necessary.
>
> As Alan said, this is really slow hardware so I doubt allocating/free
> the buffer will even be noticeable.  Why make this change at all if you
> don't have access to the hardware to test it?
>
> thanks,
>
> greg k-h
Alan and Greg,

I apologize, I was learning about the usb subsystem/usb drivers and
saw the TODO for this and figured it was a quick implementation. I
should have waited until I got the hardware before submitting the
change. It won't happen again.

In any case, thank you, I appreciate the feedback. I ordered the
device to test this. If I find a significant performance improvement,
I will re-submit.

Best,
Jake

