Return-Path: <linux-usb+bounces-4288-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5968A81612E
	for <lists+linux-usb@lfdr.de>; Sun, 17 Dec 2023 18:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7101B1C2203A
	for <lists+linux-usb@lfdr.de>; Sun, 17 Dec 2023 17:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C98646453;
	Sun, 17 Dec 2023 17:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBg5njtX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2025D46444
	for <linux-usb@vger.kernel.org>; Sun, 17 Dec 2023 17:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55193d5e8cdso2607471a12.1
        for <linux-usb@vger.kernel.org>; Sun, 17 Dec 2023 09:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702833871; x=1703438671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ft2ROdFNsheNlXU1BYn+RTgCP/noNGpKRLr2GghUTCo=;
        b=OBg5njtXYAYvabq+4AqWu7Nlc9tKSxs80rmE7e7Ks4b2ZbsW6O01uV7YkkI5aZbHAm
         H5rdH/CA9k+3tsNg6n6xcnioVKy2U5fjfwqjXlk5AFult2F/r/59CBdMroxNuBj+jcHq
         ookNZtGot5/68XwzsIxF9dy1ZfoeD8/pg44FRRpD+doiCiGveTNwwF0WGflZJp21UV0N
         aaKVk03Dxmm2jEM24oP4kYW2OjXaI7A/2gyQI9od5NyFOfz9KeXwyi7AEi2WGvdsdDOY
         ORKWrfJiBNeTkIogn5JToTSxEeUZ5xk5GDCNRPs43/7AgNcte7P73nfPMsY/DQ61s+7q
         Fw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702833871; x=1703438671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ft2ROdFNsheNlXU1BYn+RTgCP/noNGpKRLr2GghUTCo=;
        b=MaeT1+m8Ylre883e0IgRfAOa/Wlr1I+/xdgYi8SCFtstvrCB/Y7k6ob/aS3b1aiIU8
         nUJ5iq3PKklOZBSwRXJtIe8Bet3Zhx31twtUrKF8FHzDEkcKifa6F6RCx/G+eoSHkXgl
         JzNmURM0NE1Jyo7A+RJQ6/xiZXT5v5TNOu67udbDfX2HZQXCAY4dKkfE02zngYufDwEZ
         G/k58VE3NanuuHzNplnf7TCVAo6KMOHX8p9p9EjnycKI1f4dr70tfnrZs22LK267YIXe
         I9cqpv+e/hPAqTAN3+YKyncVAPGWPwUN5CDb7rN8uyAUTboLzLA5jPK/VfwC23KhLjT6
         NDRA==
X-Gm-Message-State: AOJu0YxFZu5CdMMzTetQm4fMwjFwJEPl/xVariWDnzk81MJylc8nRBAX
	B4hNlIjoV5JauBtRuyT3QMQGGLSrH48qKds16NQ=
X-Google-Smtp-Source: AGHT+IHLlXfl5eO22SNrKsKboULkd6/IZ3PNQ50va4e/b3MZAAougpGzML9gBUc6LIoWNB9IWjVAzjz5znV6li9JReU=
X-Received: by 2002:a50:d09c:0:b0:553:522d:aac5 with SMTP id
 v28-20020a50d09c000000b00553522daac5mr85209edd.53.1702833871245; Sun, 17 Dec
 2023 09:24:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADS+iDWFVZp81Ck48wQjzh--n_7Z-bV2u0SR4Z6-OZOMBLeMKw@mail.gmail.com>
 <520bd89d-b6e4-4654-adcd-8bb884802f56@interlog.com>
In-Reply-To: <520bd89d-b6e4-4654-adcd-8bb884802f56@interlog.com>
From: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Date: Sun, 17 Dec 2023 18:24:20 +0100
Message-ID: <CADS+iDVhNzAHfbW+Nks_29rgJXwFTCsTU93XHQpCYBCW6cvxzQ@mail.gmail.com>
Subject: Re: type-c subsystem is empty on Thinkpad T14 Gen 4 AMD
To: dgilbert@interlog.com
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=81, 17 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 18:08, Dou=
glas Gilbert <dgilbert@interlog.com>:
>
> On 12/17/23 11:21, Yaroslav Isakov wrote:
> > Hello! I recently bought Thinkpad T14 Gen 4 AMD laptop, and I
> > installed Gentoo on it, with kernel 6.6.4.
> >
> > Even though type-c ports seems to be working (I checked usb3 flash
> > stick, lenovo charger, Jabra headset, Yubikey), I cannot see any
> > devices in /sys/class/(typec,typec_mux,usb_power_delivery).
> >
> > There are no messages in dmesg at all, mentioning typec. I can see
> > that modules typec_ucsi, ucsi_acpi, thunderbolt are loaded. I can see
> > that device TYPEC000 is present on acpi bus, there are files in
> > /sys/bus/acpi/devices/USBC000:00, but, there is no driver linked in
> > it.
> >
> > I tried to recompile module ucsi_acpi, with adding { "USBC000", 0 }
> > to ucsi_acpi_match, but it did not change anything (except that in
> > modinfo of this module, USBC000 is now seen.
> >
> > I tried to decompile SSDT1 table, which has definition of USBC, but
> > there is nothing in it, which is supicious.
> >
> > What else can I check, to understand, why can't I see anything in
> > typec/PD subsystems?
> >
>
> I have a X13 Gen 3 [i5-1240P] which is about 18 months old. Everything yo=
u
> mention is present plus the typec ports and the associated pd objects:
>
> $ lsucpd
>   port0 [pd0]  <<=3D=3D=3D=3D  partner [pd2]
>   port1 [pd1]  <

I guess, it makes no sense to install lsucpd, if it checks /sys/class/typec=
 etc?

>
> A power adapter is connected to port0. Here are the modules loaded:
>
> $ lsmod | grep typec
> typec_ucsi             57344  1 ucsi_acpi
> roles                  16384  1 typec_ucsi
> typec                 114688  1 typec_ucsi
> usb_common             20480  4 xhci_hcd,usbcore,uvcvideo,typec_ucsi
> $ lsmod | grep ucsi
> ucsi_acpi              12288  0
> typec_ucsi             57344  1 ucsi_acpi
> roles                  16384  1 typec_ucsi
> typec                 114688  1 typec_ucsi
> usb_common             20480  4 xhci_hcd,usbcore,uvcvideo,typec_ucsi
>
I have exact same modules.

> $ ls /sys/bus/acpi/devices/USBC000:00
> device:ac  device:ad  hid  modalias  path  physical_node  power  status
> subsystem  uevent  uid  wakeup
Under /sys/bus/acpi/devices/USBC000:00 I have the similar files:
adr  device:48  device:49  hid  modalias  path  physical_node  power
status  subsystem  uevent  uid
As you don't have driver symlink there, too, then it's a red herring,
that lack of driver file is symptom of this issue.

>
> Strange that the Thunderbolt module is loaded since I thought only the In=
tel
> variants supported Thunderbolt.
thundebolt module is now shared with USB4 subsystem, and T14 started
to have USB4 from Gen 3, for AMD variant.
>
> The only thing that I can think of is some BIOS setting. When I poked aro=
und
> in the X13 BIOS I don't remember any setting that would cause what you ar=
e
> seeing.]
I checked BIOS settings, but I cannot find anything related

Could you please show, what drivers are used for device:ac and
device:ad, under /sys/bus/acpi/devices/USBC000:00? It seems that if I
have such entries in my /sys/bus/acpi/devices/USBC000:00, at least
ucsi_acpi works properly.

In my /sys/bus/acpi/devices/USBC000:00/device:(48,49), there are only
adr, path and uevent files, and power and subsytem folders. Subsystem
links to bus/acpi, and path has \_SB_.UBTC.CR01, \_SB_.UBTC.CR02

P.S. I tried latest live Fedora, just to see if I forgot to compile
some drivers for custom-built Gentoo kernel, but same issue on Fedora

>
> Doug Gilbert

