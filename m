Return-Path: <linux-usb+bounces-4007-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D811580E3C4
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 06:24:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89CEB1F21E16
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 05:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DDCF12E74;
	Tue, 12 Dec 2023 05:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwKTFize"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DE65F7
	for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 21:24:28 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2ca2573d132so66352651fa.0
        for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 21:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702358666; x=1702963466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bu4anfsOosjHw3688CnaLOA4rzebiaMSUpYCvNwoGAI=;
        b=HwKTFizeDx/QB+joNVbVpFwHo34rZ6Nx0wiiPGUYtp2grkh6WvK5SFaxPmgpCJsRbh
         v7zmtnjDgiSYB/1YbAjlJwhnzHRpJugvqr3+8sUP5lR0UzpS49o7oQxBbLlPOxA88b1W
         Tf1fxPR9Ye3qpfnudLQnerdiFB9QRgWFJCn+bO9qWYz8er0pDl/kZBgq0yvARFMmpayl
         Rld2wUcoamfJC6mFFd/QGA1h/C4sMZ8eFyWIRS/JUR/0ENRXGjA1YE3DSbhOh3fN4V6t
         FCbQGCyqtdZC03pOhcxRdD27COjliyBHG9FKW0OV89wDR8TXUkrpqZJnSYscXCeaZets
         ZVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702358666; x=1702963466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bu4anfsOosjHw3688CnaLOA4rzebiaMSUpYCvNwoGAI=;
        b=qtoSNMDEd8jiX457zrHgEUZJEW5QLgNwpuIaOqDyd4m4PIWFHY2heurhe1niufrKyL
         Wpka/cqjg2jYyrtDM9HDYj2fikBr1D6dKuaJGNBcTeZge6NfEZrgmzfMWgoXX1gm+GNt
         NLfMw3z9S862nEb/bjCWiP5IvChWAvIyEDE6KaBPa7tCck79bzbgHHM3/ZUEZr6JX05f
         lHaMf9M+cieksEdxbIAUJUw69TY1lh9TERgLlmX+PsIdAZ+7QKcED1StAuas0fCPB3tt
         NsssNKlWEyGkZasxwZ0QPdQMrEjF0MVZV7sipKUmPAC6yX5MMY+b2WfUla4JC6dcJ5ez
         kU7g==
X-Gm-Message-State: AOJu0YzNcXoPZ2C44guwF8VQwHq3O+vBpvlhbETKXYBNt+lZLISNP1db
	karCDR4pRloKLFgDnOfdviZt+eC5kcnpyUTN0neMwEwln/0=
X-Google-Smtp-Source: AGHT+IFSxS0LbvNUrAl/3nvW15gg23U/owlqRw0to1FfXZXunuCELfj7CuLLiGNuU03d79C6Dn1plhR3Y8To+5AwQOw=
X-Received: by 2002:a05:6512:220a:b0:50d:fd45:b48e with SMTP id
 h10-20020a056512220a00b0050dfd45b48emr1621197lfu.135.1702358666127; Mon, 11
 Dec 2023 21:24:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7ac2c860-3ee4-4431-b52b-904cafd7f213@molgen.mpg.de>
 <ZVy3wnSc0i4jGYh2@kuha.fi.intel.com> <d5eb3cd6-763e-4dce-bbb6-3af0e96077db@molgen.mpg.de>
In-Reply-To: <d5eb3cd6-763e-4dce-bbb6-3af0e96077db@molgen.mpg.de>
From: Rajaram R <rajaram.officemail@gmail.com>
Date: Tue, 12 Dec 2023 10:54:14 +0530
Message-ID: <CAOiXha+pofkzjaEEFf7=mSENaoFokG_apAfMDi+v4bPugWRE-w@mail.gmail.com>
Subject: Re: Test USB Type-C port?
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 10:03=E2=80=AFAM Paul Menzel <pmenzel@molgen.mpg.de=
> wrote:
>
> Dear Heikki,
>
>
> Thank you for your reply.
>
> Am 21.11.23 um 14:59 schrieb Heikki Krogerus:
>
> > On Tue, Nov 21, 2023 at 12:30:34AM +0100, Paul Menzel wrote:
> >> To test a USB Type-C port for conformance to the specification, is it
> >> possible to connect two Linux devices using a USB Type-C cable, and ru=
n some
> >> programs on each?US
> >>
> >> (I started using a Dell XPS 13 9360 from 2016, and sometimes experienc=
e
> >> troubles with USB Type-C adapters/port replicators and want to verify =
that
> >> the USB Type-C port works according to the specification.)
> >
> > Unfortunately USB Type-C is handled in firmware on those computers. We
> > can only query the status of some basic things using an interface
> > called UCSI, but most details are completely hidden from the
> > operating system.
>
> Interesting. Although now not necessary Linux kernel related, there
> should be such test frameworks to test such a port =E2=80=9Cfor complianc=
e=E2=80=9D. Can
> you recommend the one you or Intel are using?
>

You could use this debugfs infra to test PD Controller flows between
two systems: https://www.spinics.net/lists/linux-usb/msg244979.html
We also have a wrapper for this debugfs here :
https://github.com/Rajaram-Regupathy/libtypec/commit/ac3e1d07e3bae338fdb73e=
2bfd3151f5a9a09a57



> > There have been a lot of problems with the UCSI interface on older XPS
> > 13 and Latitude systems. Some of those problems have a workaround in
> > the driver, but not everything.
>
> Do you know, how Microsoft Windows handles these problems? Also with quir=
ks?


>
>
> Kind regards,
>
> Paul
>

