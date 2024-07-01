Return-Path: <linux-usb+bounces-11815-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0EA91D68C
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jul 2024 05:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB56A1F216BE
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jul 2024 03:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F2CC8E0;
	Mon,  1 Jul 2024 03:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJ1UMC5C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D65D22066
	for <linux-usb@vger.kernel.org>; Mon,  1 Jul 2024 03:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719804146; cv=none; b=nLZASmaY2P1QG/vXHZ5NCff9fqD1Wv6wZcXnGoOhxUeEAOpBnAejxc+LunK3jfgGdzEPfzv1G9pJtroL3ScHtvoRfq3RNupZPfxh38ronxXjxMFl9bZ7SgEa1BdJ310i88sVIXnuetzhe40EJQ8/nYY0C5IBvVsWmWqV6LwfM0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719804146; c=relaxed/simple;
	bh=huG6ZZyBPp8dInjsyFwi3RywIoHkD5O84S5Kttgm1hY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OLYIzfaRZysaUWOMQ9vvlwBTPKefnpBAtTQ6BDyjwOj471UQTrNwrZ+OSH1J0GhShwLKaBpj9bsZJltDyN7fFlSJDvSk0wNsCAWF/d4IRdgspR5w7GI6gumqEo+WbdiVLj+1xBvQJ7lqgUmVCug5P10E/62OgVBNTVE4/iS35H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJ1UMC5C; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5c21ef72be3so1418584eaf.2
        for <linux-usb@vger.kernel.org>; Sun, 30 Jun 2024 20:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719804144; x=1720408944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mj0L5drdkuynopgLCqt3rf6WS6U+Tt0wMp2fHmu/loc=;
        b=dJ1UMC5C/05lqAfWIc5c6fDAgblxX9gkciRfnOxu/V7I8+3KcpNa+aSSeqQ5eaconi
         o1bKCXMk1PP3/gi/0oXwlFEkuHrG3c3o+uVVraS5c+mlR1mVyGZCZz0XbahPUf0KgatB
         605vcjoHSL/OtkElWhQH7SexW1VFln+Cb/3hawkWOwISA/QmdHl4nak1uMBpabtypO9N
         azTP50bTtC+N4ZTL5uoKFcLL4AnCaLONxyjHxEPUEu0irVfvFgr6hIAMFdSvSHj74jrZ
         pFbNkKQvEqZgqU5DNia5uLFjnMvemaR5htrTToPpn20HHJjRoOzKZm6P6x/lpXqzkpcm
         xoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719804144; x=1720408944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mj0L5drdkuynopgLCqt3rf6WS6U+Tt0wMp2fHmu/loc=;
        b=mXhXU+mxrLdY7Szyg4hMi+BY86paIS+yZ8ge1lEZLz013ArGPtazX08mblkXIxWiUe
         fAOq+CxhulAUaXLnEgR+eAANkBSw0LmqoGS6hiFN8wj4jeBwHxhkE10J9H5ynTDR6tdN
         5AU9EasigcnGsgjgeYC+mDdFNmT/we7RXrO8nYQhNv6GDiC8lBXDSWCKYqrxY+5bxkeV
         LsHw4H+R2d9QyzKPCOgG8d9QO0UZ3IQE6VHTE3vHftZYNjaUee69vUNaFj1RV2KLpDIJ
         DqrbIxLLKvlSdSE53+vTdDylAhPLBp7l7eTDP0bvkzYEVSATY+jYujqNuSY4nHgiT3tM
         Yq6A==
X-Forwarded-Encrypted: i=1; AJvYcCWnlV8oonke8Lt/bxziOWiQmhblbGyiuOQkCat8DT/8t1KCwbFdS51MsFsNuoXwwVyhvL9LsSQISBFkWk1QkAMUkHoOoHHW3KYM
X-Gm-Message-State: AOJu0YyQoMd2zqorlA/NEAVjY2vhDEvPuQg6VfmQGyfMhRAiVeo1CtNt
	AfnenUWuXeqgpcvT0dGO0lu36a2LKlXtf1H7irRqRkMJ1+lc632Jx+qH9GhY4ju2WoE7WAlZ7nq
	QZh8m5QIPA3+F/96XcRAWL5b7bxM=
X-Google-Smtp-Source: AGHT+IF+n97k3dBOuUFC6kwEsqa0NrwZ5yMLityGqHRSpwqXjvsdIBck95NTxABwp71FJ9HUOgw5CExAaS9sB0fBVRI=
X-Received: by 2002:a05:6358:7f0d:b0:1a1:fe6f:be71 with SMTP id
 e5c5f4694b2df-1a6acbd73c8mr520071155d.3.1719804144582; Sun, 30 Jun 2024
 20:22:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a306a653-b6cf-41e4-875f-6c520569b1fdn@googlegroups.com>
 <CA+fCnZdZ96yW5tRfm-c1qXWfmNrVg9J1Yb779Ryht6M9v9FQbQ@mail.gmail.com>
 <612f3eee-35fb-4888-b5d9-c17c223d40df@rowland.harvard.edu>
 <CA+fCnZcrn1sr-sMbwk6i5RDMMh3q9TpBgkGAN+4cg4RaCo9S+g@mail.gmail.com>
 <28b478e2-4b17-483a-9584-0e6342677ef0@rowland.harvard.edu>
 <20240628211140.va5ghcr65dl6g323@synopsys.com> <4539c3c5-61bf-4b4d-9391-a041a2a08b57@rowland.harvard.edu>
In-Reply-To: <4539c3c5-61bf-4b4d-9391-a041a2a08b57@rowland.harvard.edu>
From: Darrion Ramos <darrionramos@gmail.com>
Date: Sun, 30 Jun 2024 23:22:12 -0400
Message-ID: <CAE=33HWobLgdhx3nWrQGqcsVxPBK5zDxO4pL8YAOaPW1wTs09A@mail.gmail.com>
Subject: Re: Remote wake up in gadget drivers
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(resending in plain text) Hello all, thank you for all your
information. It has been very helpful. I was able to implement the
usb_gadget_wakeup() call and set the USB_CONFIG_ATT_WAKEUP bit.
Setting the bit did create the  /sys/bus/usb/devices/.../power wakeup
files that I noticed were missing. Unfortunately usb_gadget_wakeup()
calls gadget->ops functions to send the signal and these need to be
implemented as well. From my understanding I need to translate the
__dwc3_gadget_wakeup() function in linux/drivers/usb/dwc3/gadget.c
into raw_gadget.c. I have not been able to properly look through the
__dwc3_gadget_wakeup() function yet, Andrey is it feasible to write
that function in the raw_gadget currently or is there something else I
am missing where I do not need that ops function in raw_gadget?


On Fri, Jun 28, 2024 at 9:19=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Fri, Jun 28, 2024 at 09:11:39PM +0000, Thinh Nguyen wrote:
> > Hi Alan,
> >
> > On Fri, Jun 28, 2024, Alan Stern wrote:
> > >
> > > While the wakeup_capable and wakeup_armed bitflags are defined in
> > > linux/usb/gadget.h, it doesn't look like any of the UDC drivers
> > > implement them.  So it may not be possible to see whether the UDC
> > > supports remote wakeup (but it appears that most of them do).
> > >
> >
> > The dwc3 driver handles those bitflags.
>
> I stand corrected; I should have said that none of the UDC drivers in
> drivers/usb/gadget/udc implements the flags.
>
> Alan Stern



--=20
-Thanks, Darrion

