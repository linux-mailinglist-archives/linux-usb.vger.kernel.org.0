Return-Path: <linux-usb+bounces-8376-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 095D588BE08
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 10:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DD2C1C3B5C6
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 09:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF177641D;
	Tue, 26 Mar 2024 09:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Fklj+XeU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7328E7640C
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 09:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711445460; cv=none; b=aSq9Vt56YyG2fhNMvpxEPxoXx5FzITlxpdqlsdzSKcnovSX7kqvM5V2hkYRYYdj8Ts3FSWX++Ka37PHbEseqx7IOL8+MxZnMFq4nooqTCxgUMxetcVuyD6Hs2Dj/I9APQgxF+Ga7VJEiaJ/CFyCIZIIyCqSDOn6l0HKwNPYMQ3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711445460; c=relaxed/simple;
	bh=S4+gW4z5ozUxwf2ZKgNcRoO5QVOsdM9wRa9uJleJ34k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ThCrVOWqPHIgfEXeN3/q4AdMKqsnotbuR7mYv45pqz47NQxu5IgZ5qXDhXA13egwL48jNaGuOCrGvLlw3+e1cRVctDjqrAi31ve5EQyQMzTfxuro52XJZW1hs/MNAFFQKGgsRG4wGhjIP37LRi6qalzxQ9AXSyX3TlpvDbhvmME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Fklj+XeU; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D3F9D3F74E
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 09:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1711445456;
	bh=qYVo77i1NAMpVunO5cEv5+yfLA/Xuyv8wUvi1lNPDVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Fklj+XeUqs+W8250L/0umJCh7KHj3WXKfXbISq3tkYC2WfV11UXPpsqdQhkytSzHa
	 jZEamFbHQI7BGWubEZcYDKnsMeqxPbJ37ggn84tbmEJ67Z+NAsxysVxt+LqxmoQmmI
	 s/wSZbgWQCoFqRYmyjzyRKqnDWZzH3yPV6n1/GhsKi3L2emzTbnDVWly8r3VTctwsE
	 lj2Gpnu26O5wc/MD8AJ3uEvJgg/Eppt1jpm5J2S8GTchd2gGlQl3xfb0Y2utwEPI7q
	 X8XAoSlFbNhfdt8ImoxLYayp8Qnk9A6PIVJYadriC6NUgPmJWdMu14vNsz/UVKmEgT
	 hdM15MUGk+Ktw==
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-29bf071cc04so4822197a91.0
        for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 02:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711445455; x=1712050255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYVo77i1NAMpVunO5cEv5+yfLA/Xuyv8wUvi1lNPDVo=;
        b=W94/qdKyT/3Npw/o9y4pHj9sJ7teEGu8y2P4lL05FeIyr3ITfMkwy8KXBq8gMseD2E
         Piauk+/G4dcO882n0PdWxIu3KKBlhmGnN7L4GywIkJ+jrW+wlU4BglruVcrM7qbo8v5D
         w+xfuv9JrEQdAhq2pmtUJevfn4ykqeGsDVhaLOYLiRJaZgArH4DNV3oN6h+mtxVcrjnw
         21sU9NxS8WEIPtAY4/bR7Lbf14m7ZPKQJBye5uNEMgKeiNx6S40OVKoNdKSXh8Rw+kng
         6lPtHa71+dgNK6fQ3JNhkcECHoTWZ94E3QX6+TQAjvzLyunATdqOdN77YImlQI6I3Y96
         iVFA==
X-Forwarded-Encrypted: i=1; AJvYcCVVtDIhaK0J98eC00gZyvSacU3CHETq56TJS4ceM+Of67OOe/s8Je3UTxH8ipQF5nCGb211WO1d897QfECUo6KC8J72APScwTl2
X-Gm-Message-State: AOJu0YxtDuYXXsdzQ0dkdDgzuJhQu2jDdVGdTJc29g98qObi+RFsVWXN
	Ag78L7t/Bt1N6qsoPDOeeKhfBpwh1z+t6VK0MgJuqYUL5umOu9a9FufjOnhmahImYGODK9RL7hU
	iczfB+qbLnA56yNE9O5cBQZ+GbVKELnHQpSpdqTnCTEDsi/rNrKVkpbHo9eZyvH5P7ySiAWSQVZ
	6uEvHa8TBfNfA8Iuap/2mFkENpf6MCI4sYXut1jj63DrwQgnnL
X-Received: by 2002:a17:90a:a009:b0:29f:7672:7fee with SMTP id q9-20020a17090aa00900b0029f76727feemr615842pjp.31.1711445455475;
        Tue, 26 Mar 2024 02:30:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC6qRi/bt6DmfsvdzxS/GpY3gQsk/O6fArTyLNol//E4YdfvAvy/ITBxfno5YIc+ZpwyuTCjazvK94sdKRKcQ=
X-Received: by 2002:a17:90a:a009:b0:29f:7672:7fee with SMTP id
 q9-20020a17090aa00900b0029f76727feemr615833pjp.31.1711445455202; Tue, 26 Mar
 2024 02:30:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305065140.66801-1-kai.heng.feng@canonical.com> <2024032639-deny-boggle-276e@gregkh>
In-Reply-To: <2024032639-deny-boggle-276e@gregkh>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Tue, 26 Mar 2024 17:30:43 +0800
Message-ID: <CAAd53p6Umov9d+Kby0j6bxmcP4hmOKA_zs5fD4k1K_rQjz9TrQ@mail.gmail.com>
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
> On Tue, Mar 05, 2024 at 02:51:38PM +0800, Kai-Heng Feng wrote:
> > SanDisks USB3 storage may disapper after system reboot:
> >
> > usb usb2-port3: link state change
> > xhci_hcd 0000:00:14.0: clear port3 link state change, portsc: 0x2c0
> > usb usb2-port3: do warm reset, port only
> > xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping usb2 port polling
> > xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x2b0, return 0x2b0
> > usb usb2-port3: not warm reset yet, waiting 50ms
> > xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x2f0, return 0x2f0
> > usb usb2-port3: not warm reset yet, waiting 200ms
> > ...
> > xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x6802c0, return 0x700=
2c0
> > usb usb2-port3: not warm reset yet, waiting 200ms
> > xhci_hcd 0000:00:14.0: clear port3 reset change, portsc: 0x4802c0
> > xhci_hcd 0000:00:14.0: clear port3 warm(BH) reset change, portsc: 0x400=
2c0
> > xhci_hcd 0000:00:14.0: clear port3 link state change, portsc: 0x2c0
> > xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x2c0, return 0x2c0
> > usb usb2-port3: not enabled, trying warm reset again...
> >
> > This is due to the USB device still cause port change event after xHCI =
is
> > shuted down:
> >
> > xhci_hcd 0000:38:00.0: // Setting command ring address to 0xffffe001
> > xhci_hcd 0000:38:00.0: xhci_resume: starting usb3 port polling.
> > xhci_hcd 0000:38:00.0: xhci_hub_status_data: stopping usb4 port polling
> > xhci_hcd 0000:38:00.0: xhci_hub_status_data: stopping usb3 port polling
> > xhci_hcd 0000:38:00.0: hcd_pci_runtime_resume: 0
> > xhci_hcd 0000:38:00.0: xhci_shutdown: stopping usb3 port polling.
> > xhci_hcd 0000:38:00.0: // Halt the HC
> > xhci_hcd 0000:38:00.0: xhci_shutdown completed - status =3D 1
> > xhci_hcd 0000:00:14.0: xhci_shutdown: stopping usb1 port polling.
> > xhci_hcd 0000:00:14.0: // Halt the HC
> > xhci_hcd 0000:00:14.0: xhci_shutdown completed - status =3D 1
> > xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x1203, return 0x203
> > xhci_hcd 0000:00:14.0: set port reset, actual port 2-3 status  =3D 0x13=
11
> > xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x201203, return 0x100=
203
> > xhci_hcd 0000:00:14.0: clear port3 reset change, portsc: 0x1203
> > xhci_hcd 0000:00:14.0: clear port3 warm(BH) reset change, portsc: 0x120=
3
> > xhci_hcd 0000:00:14.0: clear port3 link state change, portsc: 0x1203
> > xhci_hcd 0000:00:14.0: clear port3 connect change, portsc: 0x1203
> > xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x1203, return 0x203
> > usb 2-3: device not accepting address 2, error -108
> > xhci_hcd 0000:00:14.0: xHCI dying or halted, can't queue_command
> > xhci_hcd 0000:00:14.0: Set port 2-3 link state, portsc: 0x1203, write 0=
x11261
> > xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x1263, return 0x263
> > xhci_hcd 0000:00:14.0: set port reset, actual port 2-3 status  =3D 0x12=
71
> > xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x12b1, return 0x2b1
> > usb usb2-port3: not reset yet, waiting 60ms
> > ACPI: PM: Preparing to enter system sleep state S5
> > xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x12f1, return 0x2f1
> > usb usb2-port3: not reset yet, waiting 200ms
> > reboot: Restarting system
> >
> > The port change event is caused by LPM transition, so disabling LPM at =
shutdown
> > to make sure the device is in U0 for warmboot.
> >
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
> >  drivers/usb/core/port.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
>
> What commit id does this fix?

This isn't a regression, so if this question is for stable kernel, I
think all supported kernel should get the fix.

Kai-Heng

