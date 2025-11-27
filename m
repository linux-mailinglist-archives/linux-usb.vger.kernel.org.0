Return-Path: <linux-usb+bounces-31011-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DC55DC8EBBB
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 15:19:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 86EFE344DE1
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 14:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E8C24291E;
	Thu, 27 Nov 2025 14:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U2Zl1iOB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3372417D1
	for <linux-usb@vger.kernel.org>; Thu, 27 Nov 2025 14:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764253167; cv=none; b=loYgmg6heLBKmgMq3ie9QOGQLzsrFNenUvINxtIzVgfCMpmkMVkTOZrxUWhUc/nvuFsDG/cqABfa4Da4O9roicbdYSSNjAbkv3jsSz/6FifLJNKqQ9Z+6YXCCf11qw5QeO0CT0f0LXlu/bO+C8eE8H9AyhykOGvcit8YaIz4noA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764253167; c=relaxed/simple;
	bh=FsTzZbSox+MIcYQgdkcUEqy7BQiyhxSRw47PHFaa0JI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SptuMxriuZ1JoJ2whagVZlz6X5V/+u0t3jzYHFg3qN9QcU1rl7JEa+wYZDbyfVVEMZN1FoKR1jQ+ymaxqkXe8t1j6Z3VgWZn0R2egla2i/wv9QrGQu6Djvats2bX5Bvl7RpLM2CyTLv2w019afh9bEekZ8pgrckq1gixvZpysE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U2Zl1iOB; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5957ac0efc2so1034303e87.1
        for <linux-usb@vger.kernel.org>; Thu, 27 Nov 2025 06:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764253164; x=1764857964; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fAoPiHX2azaZCwvSn5iABghVtOYIP2kRs/QNOxkjDk0=;
        b=U2Zl1iOB3HV8HwQwNq/its+3p5AnSOn+e7DHOujfLqMjKuj6NHSMsNNOpEA+O8H4Tl
         FqueSlLrputM2W7iNZO9x1BlnKfe3K4Fj5bwC8oWCHjPWGzKW2dse1Me7kAqHrIIy5p9
         xj7BpF+2sKAU+GHmPOrNwEWYy+SB9rrAbC0F8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764253164; x=1764857964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fAoPiHX2azaZCwvSn5iABghVtOYIP2kRs/QNOxkjDk0=;
        b=eFIxuDASdGrr62Apc8WzL+wpP8dxrfBXTtpJAEtFpl6wD3MSaXMzj2xzkxS75/hI+k
         D2VcIEw11qB9rGZX0iZTQucnRwqqWsOZ3kJctHEEAO6rP+w1xBc3SeZemjeZNA5W466d
         5cUiwxGXnP/Zosq+dBSBJMcQXpQGkW8M2GGnzLORxmJZqcIWBiAU5wQhSgx+re/7MjpU
         xpS4UAUCoApPuLpDPFjqu3eoPkBBgnJn29mwPevU6IrlV98F09qdqtNgM7U2uJxTlSfk
         1j4w532eitE7bTPtGUBbUOPKSD3RlhjfQiKIS4OxgSqRexdFPUt678yB1/bOzFSwZ4X0
         uRyw==
X-Forwarded-Encrypted: i=1; AJvYcCXaXRxM6jcDQTywiGofUjbN2CrXsDro8W26/WkxJotDuEFsCd7MIQ8x0del30w0acIIfvfIEcWlqls=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUDLwv8HHbrkkrfcpT4YqmnPpgqurg/wY6Qx1cOiS+ZkJ+idCK
	mLJu6fbXzTtK4Clpjxonrf2o0j+4YE0RD8mNi8VNpSsMJ0doRMlLGwg9ZwVxD3gsiZQLR5+6f0x
	o9sl/BlbSsYl1ieWlZJgvkAIRTgrBVKBvIRQpX8o=
X-Gm-Gg: ASbGncu2CN6cZ+MFyTHU3fGs40eOhEzVRP/tFDIAGo8CzMa5alRkwXFMwnxBONCZt3v
	1QPz7xJf2jGG507O+odWiIo0TcwImemNzUefbNFajN+NqpR7ashBGnm9x1P/DnZdhZovvx7lTxF
	VpxPwMrQtPRMaXdi04aZZMci/2meZcsC93icJv/coX6bkUjzcjUDaeKau2/UwJ+7GHLIMmBkK7i
	vfZr0NPpLJ29Y6HG26DJbq3RaRGvfZXUSz2sbpssyIScshK8GXbESJo/34woaOI0OgUl+s3zQUS
	umABseABjmQDCR3dX2N9SgE=
X-Google-Smtp-Source: AGHT+IEaOCuNz5qGg7lSMnBP6ggEaEGy3TgYmXlgYVsqFlUujKIZowgTEigDD8exRODHIglOniaYCvCx38EwCxT2rFc=
X-Received: by 2002:a05:6512:68e:b0:594:33fc:d52b with SMTP id
 2adb3069b0e04-596a3edbc7cmr8836686e87.36.1764253163765; Thu, 27 Nov 2025
 06:19:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125142532.2550612-1-ukaszb@google.com> <2025112616-gestate-disperser-c055@gregkh>
 <CALwA+NYBSH01FVcggf9nNbW83sRp0GH-4jKL0ByYNTM7vz-pHg@mail.gmail.com>
 <e7e984f4-4aa7-4428-8da4-b48d55f32098@linux.intel.com> <CALwA+NaXYDn1k-tVmM+-UQNJZQEZGiB4QmBfv1E6OeWyMicUig@mail.gmail.com>
 <fb7dc13b-d572-4537-89dd-427bbf43567b@kernel.org> <CALwA+NY5o9yBetMYN78KK=mujuDY3_jtkc6rwDHohO6OO=t2og@mail.gmail.com>
 <CALwA+NYzwP-wi7-MuwXw4hei+Zbg3-4bN8+pikLzEzB8UXjxmQ@mail.gmail.com>
In-Reply-To: <CALwA+NYzwP-wi7-MuwXw4hei+Zbg3-4bN8+pikLzEzB8UXjxmQ@mail.gmail.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Thu, 27 Nov 2025 15:19:12 +0100
X-Gm-Features: AWmQ_bkhTU24jpNNp8j69tSNk1UUe5oz_UeU-J6Rca3XCiSZOBrapQJ2fP4ubpM
Message-ID: <CALwA+NZtCvpHYE2S-qnuecOnitV_22zPEUC3VtRJaxcoTKUntA@mail.gmail.com>
Subject: Re: [PATCH] xhci: dbgtty: fix device unregister: fixup typo
To: Jiri Slaby <jirislaby@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 3:05=E2=80=AFPM =C5=81ukasz Bartosik <ukaszb@chromi=
um.org> wrote:
>
> On Wed, Nov 26, 2025 at 1:26=E2=80=AFPM =C5=81ukasz Bartosik <ukaszb@chro=
mium.org> wrote:
> >
> > On Wed, Nov 26, 2025 at 10:56=E2=80=AFAM Jiri Slaby <jirislaby@kernel.o=
rg> wrote:
> > >
> > > On 26. 11. 25, 10:50, =C5=81ukasz Bartosik wrote:
> > > >> I still think we need a fixup patch for the missing null check
> > > >>
> > > >> -       tty_vhangup(port->port.tty);
> > > >> +       if (port->port.tty)
> > > >> +               tty_vhangup(port->port.tty);
> > > >>
> > > >> or just use tty_port_tty_vhangup()
> > > >>
> > > >
> > > > IMHO it looks good because tty_vhangup calls two functions inside:
> > > > 1) tty_debug_hangup - which handles the case when tty is null
> > > > 2) __tty_hangup - which also checks tty for null
> > >
> > > Is it still good when someone closes the TTY right after the "if (!tt=
y)"
> > > checks?
> > >
> >
> > Hi Jiri,
> >
> > Will putting tty_vhangup around get and put reference as follows suffic=
e:
> > tty =3D tty_port_tty_get(port);
> > if (tty) {
> >     tty_vhangup(tty);
> >     tty_kref_put(tty);
> > }
> >
>
> Ah I missed what already Mathias pointed out to me in the comment
> https://lore.kernel.org/all/6171754f-1b84-47e0-a4da-0d045ea7546e@linux.in=
tel.com/
> that there is a helper tty_port_tty_vhangup which takes care of the
> locking as well.
>
> I will send a fixup which switches tty_vhangup -> tty_port_tty_vhangup.
>

I sent the fixup
https://lore.kernel.org/linux-usb/20251127111644.3161386-1-ukaszb@google.co=
m/T/

Thank you,
=C5=81ukasz

> Thanks,
> =C5=81ukasz
>
> > Thanks,
> > =C5=81ukasz
> >
> > > thanks,
> > > --
> > > js
> > > suse labs

