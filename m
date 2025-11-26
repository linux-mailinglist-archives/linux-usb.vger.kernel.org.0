Return-Path: <linux-usb+bounces-30970-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D471C8A260
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 15:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CAC544E4069
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 14:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D816323D7C7;
	Wed, 26 Nov 2025 14:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G5cL7W+L"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8A7226D18
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 14:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764165966; cv=none; b=mHmb+a7I6omaohWORAy1weKSj2a6EjIbGrAtmLSwE8Q1kI6hzY0kIBlhXG0jZJV7XRp7Xfju9wkzfT8bl5PJaURozPcmepXlxfwB4MmnljgN26zODpVTrWN2ceirlBL/dSLdak2lfiBRaVh46idrMCoDemBb67qEPSxVuz3ek4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764165966; c=relaxed/simple;
	bh=LOPP0jN0raeA0cNuNP9CiY9ZdgKRZ3/TKIFQBfKuoMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tgnKCytScTzIkUgRoqiMDy8scSxu/FIBiyA7kdAWXzNe9utEspxwhR+fTWz6XNEQOYrosHXArsBci2i1GAGqeE2yP56XdZGWvEvwSezoYBGeLpfA62eEJ5ZdHJzqOXCGVL6mGaT6vTtuBIn9lJU7dLN55LM6QB+cG9+W7AebAzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G5cL7W+L; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37b96cbd875so48882811fa.3
        for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 06:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764165963; x=1764770763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Icdt+xSq3fuhLRfNFrh2ce5db1rM70RXRNdVGsikJM=;
        b=G5cL7W+LUjXY1mmw3TCsQqK/ZqMd2NFoQ3U0b7ycHxWXmPpPMgG7gxaKa7WpVLBZ2X
         zEaE6GLykZwii/we2An9KGwNz8jQxkJ7VuRen6huVA4V1CPdP1BBhO/1Rc+qg27cEOX3
         liDzvJUg72LSkcAs5Gs8tps5MXS8yp+6a8+fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764165963; x=1764770763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Icdt+xSq3fuhLRfNFrh2ce5db1rM70RXRNdVGsikJM=;
        b=MnZSlNqjXyPrG0eom33X53cuzgEYWic8ET20lXj1Qan+VogicGXlxFuxk1uInIFZO/
         lATY3pteH+rW2ALEk1BIIcdKBtfO8KyIlCtQuijadMEoa9qV0kreYnS9xsXekeHywwda
         FoDdqZv/r1K2dWmcAW5mY7ZHD5h1fBBaS3QSkqL6SoOaiTg08knd0xLoPRwIJ1XeZ4/7
         VuHWLp4EzglsJ8DBuXjev17wGGGEhGB/Q0dq8ZopeszJBjpfI6VxBGRVYPB1IOLzpI4q
         b8LMdDYqN6f9ovHpv72Ov3n8KPjJZH5NDw2sJjHew+mGzKNJOgNbuOjJWQwuXKV/d8Cn
         XkRg==
X-Forwarded-Encrypted: i=1; AJvYcCWVtlMdc02Z5YlT4vBS9nqQ6yx4ZZg4WWJkuIMLXAd1yxc8HGf1iRTfGqYTc2xbWnT2a6ut6PCluso=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7jZOOnZqWJYYTh8Nr+X2x8BBhLzEtDnz3Ns1HBoL06vkXj4zg
	wIgTX/Qb5+1DW971w+jnB5wzCNyMapvUNW/1SHcyIf63tNQ7mN1vhr5cb7fJsf9IS6I9k52ODlH
	1WFnPFb8FNq0wzHY8MTeDniaexEapmtq2sXMwSg4=
X-Gm-Gg: ASbGnctXYzrjaWo5t5Uw9x2BSm304LzUwPq3sR7NFqkhp8r5nyTOBBrY6WEFwjsu/Q0
	/BWQhqBmR0Kcq2p5imPUwF0zc4R8JoGsTNz6ZGm8OhhPBCbWVx3iX0aFMvSPMU2YRfOY8wO13H+
	mtMLrffdC1+TTDyh4CIw7qmROT663HB6C0+lF/zxG7kr82tqHMxGWJcfmW09qjytnyKMRAUsQHd
	nyntaUJbzMvWy4ilnOIAnnUjJpdhvCdlHrIw9isXglgAPZ2Ghg+XbFE5617tKLPvK1/uLKKSFND
	rMaR9W+vpVO7pupg0CMfQw==
X-Google-Smtp-Source: AGHT+IGbkDZ6Xp5l2muaIqOLgOY5UNGJWQcnSXij9znCd0J2ETs722PBq78BKtyPpBg7jbh11wKQH4GWi/g6/pMX2aI=
X-Received: by 2002:a2e:a26e:0:b0:37b:bcbc:58c6 with SMTP id
 38308e7fff4ca-37cd9243b13mr48274801fa.32.1764165962509; Wed, 26 Nov 2025
 06:06:02 -0800 (PST)
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
In-Reply-To: <CALwA+NY5o9yBetMYN78KK=mujuDY3_jtkc6rwDHohO6OO=t2og@mail.gmail.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Wed, 26 Nov 2025 15:05:50 +0100
X-Gm-Features: AWmQ_bkwNBj9Hie00df90RutKtM2wIHdXStTfwsQMQl0D7kN9dfcjzXw4Ghr60Y
Message-ID: <CALwA+NYzwP-wi7-MuwXw4hei+Zbg3-4bN8+pikLzEzB8UXjxmQ@mail.gmail.com>
Subject: Re: [PATCH] xhci: dbgtty: fix device unregister: fixup typo
To: Jiri Slaby <jirislaby@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 1:26=E2=80=AFPM =C5=81ukasz Bartosik <ukaszb@chromi=
um.org> wrote:
>
> On Wed, Nov 26, 2025 at 10:56=E2=80=AFAM Jiri Slaby <jirislaby@kernel.org=
> wrote:
> >
> > On 26. 11. 25, 10:50, =C5=81ukasz Bartosik wrote:
> > >> I still think we need a fixup patch for the missing null check
> > >>
> > >> -       tty_vhangup(port->port.tty);
> > >> +       if (port->port.tty)
> > >> +               tty_vhangup(port->port.tty);
> > >>
> > >> or just use tty_port_tty_vhangup()
> > >>
> > >
> > > IMHO it looks good because tty_vhangup calls two functions inside:
> > > 1) tty_debug_hangup - which handles the case when tty is null
> > > 2) __tty_hangup - which also checks tty for null
> >
> > Is it still good when someone closes the TTY right after the "if (!tty)=
"
> > checks?
> >
>
> Hi Jiri,
>
> Will putting tty_vhangup around get and put reference as follows suffice:
> tty =3D tty_port_tty_get(port);
> if (tty) {
>     tty_vhangup(tty);
>     tty_kref_put(tty);
> }
>

Ah I missed what already Mathias pointed out to me in the comment
https://lore.kernel.org/all/6171754f-1b84-47e0-a4da-0d045ea7546e@linux.inte=
l.com/
that there is a helper tty_port_tty_vhangup which takes care of the
locking as well.

I will send a fixup which switches tty_vhangup -> tty_port_tty_vhangup.

Thanks,
=C5=81ukasz

> Thanks,
> =C5=81ukasz
>
> > thanks,
> > --
> > js
> > suse labs

