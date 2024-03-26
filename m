Return-Path: <linux-usb+bounces-8374-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D2388BE02
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 10:39:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 670B81F3BDB5
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 09:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B5974C0D;
	Tue, 26 Mar 2024 09:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="axlP1/2l"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB0674414
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 09:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711445364; cv=none; b=K3go3rBfeo4Wq9Mn/jWlmNeNSkxgVRyWdnRqa+YOK5a0dfGwc8Nsaog41WDrp62Z8mPscGKuioXiKpo30U4YGpZJB9TuuUOrEJfxFMDbNE7RtD7APyYiaXj4syEU72wFb94GImP9FIIDVD8VnkakMJiuGb8WWiMZDObhQ+IhJ6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711445364; c=relaxed/simple;
	bh=kV8HoLZq3xZeAnlSV46dvi8qyyVG2pTNN2b+hSQbNkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lPbkfvwciBTmqGopZJgaQ80C9ci6Yot6Bmngoo+bFJ+sODwNjSOmZmG75ZatSjq4D6poU0PXkf/En+1I/hC5WSeRFNPhWN+4J3aPHDqkAaZ6oeOwkQ1JSbGCBFK3BZxcPmj0g7Bm/Qg7ecNdE3OPfRcLlrHkZhXMB9SE5/Z0Ovg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=axlP1/2l; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 31B683FB75
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 09:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1711445359;
	bh=kNXFMK9kJ5GFeiN81ozDsZB0arcWeBeYdZNLlh7fXT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=axlP1/2lKni0eclOodAYKdN3BHWM8N+na80Za3zPKdwfjaPop+xyqKC6erV0+Tzc3
	 se+gv9KDit+sgi3vILi3iB4qbhd1pXlCMl/9z+hxJy6wX82Cec28OGmUcEJhAA1ca+
	 cjBOWSW9tgQRzRrihO7ZgnBfdDaG6DCrwJ1SuweiRdmkuowynp1gCCSbZPDBqJazvZ
	 df4Gfe4VT3hhV4iXycCSj+64NffCuuzcChdv01GvudU0+76V7qqEh6pSvbDsN+snww
	 CLuTXVyma51k6nmuU4Zr7NyMqFP+uTAAKAch0ZzbNXk/Rksp7A4HLPX6JyEXvjQjzf
	 6jzoemNTegeaw==
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-5d8bdadc79cso4124059a12.2
        for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 02:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711445358; x=1712050158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNXFMK9kJ5GFeiN81ozDsZB0arcWeBeYdZNLlh7fXT4=;
        b=B0nhsBdaHzfrA8KR+otQyKlyoJTsn/+BK5mqLsc+A8UizQSGYEHuFwsx9siEeJeK11
         w7Q4EOqk7/aTe162O30W07NQoWGXMd5ysz+iHwErbuYfDHo4ZAOjm9w9u5r/3Wl7ATrs
         DAs+DGHvOWDjZRFra87YJxlDgbojkiFgyUDMa0AVFkIfcSiSpbJgM3avC8Dbc9thqRse
         hHSEK1iW8L17+U4w8x4DaV4RfmaHI2U5o1/ajuus/gP2oPfD9dvblKX0z9UZxYZ7zftM
         LyP7RaPpFS1TkcBTnOZCZBzct0qZ83qhXl+hXcDESZeGEgPRQrvNS8FlHJyk0cRMNcwk
         uJ4w==
X-Forwarded-Encrypted: i=1; AJvYcCU/YGHgQax6VYLMzzMHS4t3LJgTxa9ri3T6p+F8FPWQDDkfBglAUjiHNPn5Q7FSyi86iRGq8D9wBTz5fRlwoeFjlD9QwNeBdt5P
X-Gm-Message-State: AOJu0Yz54YHdh0hIMLJX8s+wmCsGEzynNFN69OqqG6rX2e+4J35EaR16
	Rj0SjtATmtMYshbVyglubHuKkcxbP0nKUHfVCZs6M6SwMQmshCQQiJ8y9SDBvaTacG05qpAzRL/
	Kk5SNlv9yQ2D3/fFsWQzezvJXDq4c1OjcPhMQRHN4Lvd52tbgdSe9wRL7VkR89L6+mDRy0v4TK3
	VxklmFgkDynCTriP/nwoTofPtrfsQKY2TmqGyp/GwOs1Yq8+SY
X-Received: by 2002:a05:6a20:3cab:b0:1a3:6c9e:1e2b with SMTP id b43-20020a056a203cab00b001a36c9e1e2bmr640701pzj.14.1711445357829;
        Tue, 26 Mar 2024 02:29:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEvCTJknh4r44MlAVgGZWg5/uJg5NxKwsEZb/ck+Kfh7NtKNocq4si6tNQfbdxOnYMDLY+aO0S8oJTX5ljBbM=
X-Received: by 2002:a05:6a20:3cab:b0:1a3:6c9e:1e2b with SMTP id
 b43-20020a056a203cab00b001a36c9e1e2bmr640684pzj.14.1711445357488; Tue, 26 Mar
 2024 02:29:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305065140.66801-1-kai.heng.feng@canonical.com>
 <CAAd53p7P_-4voZ49=WKpDCg9tx4QRV2NEG5FyqitsAc-Yzm2VA@mail.gmail.com> <2024032608-refinish-ambulance-84f7@gregkh>
In-Reply-To: <2024032608-refinish-ambulance-84f7@gregkh>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Tue, 26 Mar 2024 17:29:05 +0800
Message-ID: <CAAd53p6dSTHmLnUiFSX+7qHJXk_CpRBCvt5P4MKN-sda3qfhLA@mail.gmail.com>
Subject: Re: [PATCH] usb: Disable USB3 LPM at shutdown
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stern@rowland.harvard.edu, mathias.nyman@linux.intel.com, oneukum@suse.com, 
	Roy Luo <royluo@google.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 1:56=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, Mar 26, 2024 at 11:38:48AM +0800, Kai-Heng Feng wrote:
> > On Tue, Mar 5, 2024 at 2:52=E2=80=AFPM Kai-Heng Feng
> > <kai.heng.feng@canonical.com> wrote:
> > >
> > > SanDisks USB3 storage may disapper after system reboot:
> > >
> > > usb usb2-port3: link state change
> > > xhci_hcd 0000:00:14.0: clear port3 link state change, portsc: 0x2c0
> > > usb usb2-port3: do warm reset, port only
> > > xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping usb2 port polli=
ng
> > > xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x2b0, return 0x2b0
> > > usb usb2-port3: not warm reset yet, waiting 50ms
> > > xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x2f0, return 0x2f0
> > > usb usb2-port3: not warm reset yet, waiting 200ms
> > > ...
> > > xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x6802c0, return 0x7=
002c0
> > > usb usb2-port3: not warm reset yet, waiting 200ms
> > > xhci_hcd 0000:00:14.0: clear port3 reset change, portsc: 0x4802c0
> > > xhci_hcd 0000:00:14.0: clear port3 warm(BH) reset change, portsc: 0x4=
002c0
> > > xhci_hcd 0000:00:14.0: clear port3 link state change, portsc: 0x2c0
> > > xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x2c0, return 0x2c0
> > > usb usb2-port3: not enabled, trying warm reset again...
> > >
> > > This is due to the USB device still cause port change event after xHC=
I is
> > > shuted down:
> > >
> > > xhci_hcd 0000:38:00.0: // Setting command ring address to 0xffffe001
> > > xhci_hcd 0000:38:00.0: xhci_resume: starting usb3 port polling.
> > > xhci_hcd 0000:38:00.0: xhci_hub_status_data: stopping usb4 port polli=
ng
> > > xhci_hcd 0000:38:00.0: xhci_hub_status_data: stopping usb3 port polli=
ng
> > > xhci_hcd 0000:38:00.0: hcd_pci_runtime_resume: 0
> > > xhci_hcd 0000:38:00.0: xhci_shutdown: stopping usb3 port polling.
> > > xhci_hcd 0000:38:00.0: // Halt the HC
> > > xhci_hcd 0000:38:00.0: xhci_shutdown completed - status =3D 1
> > > xhci_hcd 0000:00:14.0: xhci_shutdown: stopping usb1 port polling.
> > > xhci_hcd 0000:00:14.0: // Halt the HC
> > > xhci_hcd 0000:00:14.0: xhci_shutdown completed - status =3D 1
> > > xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x1203, return 0x203
> > > xhci_hcd 0000:00:14.0: set port reset, actual port 2-3 status  =3D 0x=
1311
> > > xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x201203, return 0x1=
00203
> > > xhci_hcd 0000:00:14.0: clear port3 reset change, portsc: 0x1203
> > > xhci_hcd 0000:00:14.0: clear port3 warm(BH) reset change, portsc: 0x1=
203
> > > xhci_hcd 0000:00:14.0: clear port3 link state change, portsc: 0x1203
> > > xhci_hcd 0000:00:14.0: clear port3 connect change, portsc: 0x1203
> > > xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x1203, return 0x203
> > > usb 2-3: device not accepting address 2, error -108
> > > xhci_hcd 0000:00:14.0: xHCI dying or halted, can't queue_command
> > > xhci_hcd 0000:00:14.0: Set port 2-3 link state, portsc: 0x1203, write=
 0x11261
> > > xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x1263, return 0x263
> > > xhci_hcd 0000:00:14.0: set port reset, actual port 2-3 status  =3D 0x=
1271
> > > xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x12b1, return 0x2b1
> > > usb usb2-port3: not reset yet, waiting 60ms
> > > ACPI: PM: Preparing to enter system sleep state S5
> > > xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x12f1, return 0x2f1
> > > usb usb2-port3: not reset yet, waiting 200ms
> > > reboot: Restarting system
> > >
> > > The port change event is caused by LPM transition, so disabling LPM a=
t shutdown
> > > to make sure the device is in U0 for warmboot.
> > >
> > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> >
> > A gentle ping...
>
> It was the middle of the merge window, we couldn't do anything with new
> changes, right?
>
> And if you wish to see patches get merged quicker, please help review
> other patches on the list, that will reduce the workload of the
> maintainers.  Why haven't you done that while waiting?

Good suggestion. I'll start to review the patches on the list.

>
> thanks,
>
> greg k-h

