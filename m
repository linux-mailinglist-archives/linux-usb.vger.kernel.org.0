Return-Path: <linux-usb+bounces-15711-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 816589904AA
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 15:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3641E1F22C3A
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 13:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE992101BF;
	Fri,  4 Oct 2024 13:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V4eQntAa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB0F210188
	for <linux-usb@vger.kernel.org>; Fri,  4 Oct 2024 13:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728049326; cv=none; b=UkajnsjOlTuiYXgcRYcUnQsGDLhZ/5U+47lMoKtvy8UiTwH4zadZJ34DEb7kOekkdjYHptK22Dc3LREDe/LZ6vAzK4XkKQk9JY+aiaM5kvqhT2Oh1CpiCrXEgPtt2G9EXFgjmO1fMT4VufcKeO+ADPcukjqMiqNRjt584Kueg9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728049326; c=relaxed/simple;
	bh=9GiGpatiD/2J2i2OxbJ2wKJ5F9YwjrgCv1XSXGIZuTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X5Zhm7WHc3UQo+Q/V2HK1PQ9MPHmPA6Xx0u10Uw4OxzmqDSprWZTGLeUr5+pijEl7VH807hJs3cBuq8fYcjOBZR9JLviX4zNkp3DG2zcAg2Mt+oo8zmU1o8jsEZ9aWNMJ/zUTi8Yk++i37RW6v6B6TXMu165ZSEPxBZZInOKGQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V4eQntAa; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6cb35f2aec1so17013166d6.2
        for <linux-usb@vger.kernel.org>; Fri, 04 Oct 2024 06:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728049324; x=1728654124; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lk06JKbodbBSWD6/FEKtSxepIWAjJ5ljqYQ6uKk3a5U=;
        b=V4eQntAaa8vpf2IYx/Pz5uALaCtAW9LB9iztGwNFe5JBdvuIQdU4QTec83gK04x9BO
         Ugnocyt4HihOZdX5TPJ04jzYk4/duek/vjCGVSk0WfzAgoCv6WVpjxz2Y+qdeWAwq/O5
         scwyxR4sKYemUq+96318Ho2WqQV0b3L6NxYJ00QV7MhCzSOFNqiBGVSg13+9qPVRXgp5
         m3jyGR1XUOHpaiUXdANZBGrTSfyBhV7oDCGdFQUtEjJwf4dNrwRz9fKy+ovELLcBgapo
         7capSUS9fLmJ20FPdSkzizQiYlRPncnOGPHm2t+nrLuP3JYDJ2sXrWr3O/SbHI/+49+j
         QqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728049324; x=1728654124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lk06JKbodbBSWD6/FEKtSxepIWAjJ5ljqYQ6uKk3a5U=;
        b=Pccyo63/o1p9Jnkrb5+6HQSKENZzcm7MBQWqs6Zcv0w9dMg2hplZmmfW6JGBqrivXi
         MG1QZwORp4ttPpM509YFCdMamfCVfx6p8J+KQ4RProBqIHUr9J1ilMXv18jc/HMm+RqT
         YkGUFSpMScQoUw2G3EbR1udP5WNIuNO2WiGHv/Q4j6toMJxByYGGkHwOCmUuzNvi/yG+
         A2yzE9kN+wiijgrHN+AETlXsqyS98Rb/W4X3N2taHDfoySS0GV6zvf51T23ZxdCKhMsl
         tfmXqYaj1nadXbvO2+El6VnpymJxh1w7KvuLpLkQGBd8svEbvC5jkYvox4qg12uFKiu7
         efnA==
X-Forwarded-Encrypted: i=1; AJvYcCW+RZnDKzk+gf7fYPb1Lsr407miRXIW2GOeP9KyNXnZrbmCFTVzQHPo7jFJphhUIovVqSAhuDpohLo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6gOcS5Gx2c8/Z8tdphpWaxBLZL1a82D+g2LUmEf6gnuGmlUG7
	UwgJ/pCm0ItNrMXdExNg0dreNSvWZ7rzb925wgab/iYRWYVxZ7yEmkBlTHVXqJZA30uxPqGXV5W
	a3fJXbJKkuN4v+bgLq+w7Mc77TwZv/6ZwgFO/
X-Google-Smtp-Source: AGHT+IHmiV3n3dyhLctI0mmJ4D7qtRle/kabcXXlFIKXT5PRpvnCxqseb5Dyge4IECtKP92T51WpbiYm7DbViiawKD8=
X-Received: by 2002:a05:6214:2d4a:b0:6cb:540a:c66d with SMTP id
 6a1803df08f44-6cb9a307ec5mr36037616d6.24.1728049323651; Fri, 04 Oct 2024
 06:42:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004123313.2463701-1-bemenboshra2001@gmail.com> <2024100452-echo-chokehold-f6fa@gregkh>
In-Reply-To: <2024100452-echo-chokehold-f6fa@gregkh>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 4 Oct 2024 15:41:22 +0200
Message-ID: <CAG_fn=Vmn1UotDhpHr48_ENd+d12y0G-qR5Q4m5aTODN+tH8uw@mail.gmail.com>
Subject: Re: [PATCH] usb: usbtmc: initialize memory written to device
To: Greg KH <gregkh@linuxfoundation.org>
Cc: bemenboshra2001@gmail.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com, nogikh@google.com, 
	dvyukov@google.com, elver@google.com, pimyn@google.com, 
	syzbot+8f282cce71948071c335@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 2:57=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Fri, Oct 04, 2024 at 12:33:13PM +0000, Pimyn@web.codeaurora.org wrote:

Just curious, what's up with this @web.codeaurora.org address? It
wasn't in the original patch, where did it come from? :)

> > Avoid kernel-usb-infoleak by initializing all memory written to device.
> > The buffer length uses 32bit alignment which might cause some buffer
> > data to be read without any initialization.
> >
> > Reported-by: syzbot+8f282cce71948071c335@syzkaller.appspotmail.com
> > Closes: https://lore.kernel.org/all/0000000000006f6622061eb52dba@google=
.com/T/
> > Signed-off-by: Pimyn Girgis <bemenboshra2001@gmail.com> (Google)
> > ---
> >  drivers/usb/class/usbtmc.c | 3 +++
> >  1 file changed, 3 insertions(+)
>
> The "From:" line of this commit is obviously not correct and does not
> match this signed-off-by line.

Sorry, does it mean the "(Google)" part should be present in the From:
line as well?

> Also, as you are from google, just use your google.com email address
> please.

Unfortunately Pimyn cannot send emails outside the @google.com domain.

