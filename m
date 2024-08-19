Return-Path: <linux-usb+bounces-13604-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2194E956616
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 10:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4565B1C21864
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 08:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800BB15B561;
	Mon, 19 Aug 2024 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="hhADqs6v"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F161BDE6
	for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 08:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724057638; cv=none; b=CZ5B6qFhiHwmCFqBpDNdfKfOD+tG/YAPC9HNkH6F9PLTghdQBwSUYr9n/XVOmMjURVVGiS1zTCWBZw+HRAl5NYwkmbVbp45b32R4rLSKpWlrvVOSwB/mM/AQcySbkaMQrk5M8tsxvF0pxK/JEvNtZ2zFjNqL8ThUBdGU6UhBnc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724057638; c=relaxed/simple;
	bh=duisPaF99h1QGDc7w5KfbNowwVwLiE+CnodhKJpG2KU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NGcc52lJkryj0BspQhqaDyLHBA/ptRvp4aikFsjtYwpmg8Tu234dVWxnFP6htZRZH2ygccDNlFDQ3k0g1SN6tDNV7SFMpGF8AFZzxCxw0w4ih8l212canD8wJri+9aht6DUcktp+bTXbzXkb2hBn0Ra48g6Kx1Jvg+vCpCxLjX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=hhADqs6v; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a7b2dbd81e3so561896766b.1
        for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 01:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1724057635; x=1724662435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKZ8pSOBWlZZSsrnuVDr/6cUoiTT3d+hpV6fHxCOG0I=;
        b=hhADqs6vCVFlc71XflmSbgATodTZC0L+FpDrUvk9DWKKctxM7Glg+RpSIJux2FtWLR
         qm55FhVtBm/u0oo8Gurz1xwXXlkcjPiz5OZfUmV5tpAlQfKIZlmMQgg18qgptFg3I09l
         7JEHZUEAsVG1vkQwxLDoGyaIFNFw8kJWZYCB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724057635; x=1724662435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aKZ8pSOBWlZZSsrnuVDr/6cUoiTT3d+hpV6fHxCOG0I=;
        b=VNB4c23fDmZoQPLrIIDeP1cvQqlIQDDKguMKd9WZSpBdn8CjlrlL5ef55gyBo7bz12
         fwGDkoFfNSbahKiGOmVgsUPS4Xri0pO6gLP7dbYjEIs2sTNHu645dyXbmVIQN1j1Y51J
         w8sIwum3pTMt2jXj38cmBDXy4sRtt++ZbnKBqNMmSr6jMITzg0mD2ulS8z00hlCDBJcm
         /ENTZYPYbL8qpHTdC98ZNCWL3aRTbp96tR15d2sn/D3GJZO63YNjhkvxIWGwrxh6CCvD
         x3xm1kBowWiLw90cjfRTuDi2QmfSPO5JPCsPU1gNzj3aaaeptwCEM0vdQ9BvG4ZUn31X
         eiIg==
X-Forwarded-Encrypted: i=1; AJvYcCV9fi4+ZTJBe250hJXOQ9lLYY/i/zWd0hcq7QiVlw2B0APP84xJ4v1jBglUple4ZpDAQj8ungHmCxTCgfxM5uH1Bbwbw0VwWWIF
X-Gm-Message-State: AOJu0YyeQBpKAjE9m0Qoh98XJo5ww9NAIT9WIl0GoB2QbaEmLgOgbOdN
	H5jaE8GZbyTASPnzqP521o8N/bSXhWmW6fLSAoIKbrXEI9X7x7tNGuwqVxnW/gU4skYyG1gbvJ1
	RhnBtLITftZ/5JGKRuQ0IvZ/S/ZzWZl8VNiczjw==
X-Google-Smtp-Source: AGHT+IH5f41WTN7U3XVgASY9kyBQoORIJWx+menryiexaeWj3zUhtNU3J0xXlluQIgdHTt9JvaRUCfPMaDN111J7loc=
X-Received: by 2002:a17:907:f796:b0:a72:5470:1d6a with SMTP id
 a640c23a62f3a-a839295601emr767963666b.35.1724057634101; Mon, 19 Aug 2024
 01:53:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TYUPR06MB62177737F0054278B489962BD2812@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <2024081608-punch-coherent-d29e@gregkh> <CAOf5uwnsgcJjp1=RLa7qx9ScQY5rZvwX-Zu6BOqxBBhBCz+CFQ@mail.gmail.com>
 <TYUPR06MB62177BCD4AB43C19E38990D3D2812@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <CAOf5uwm65Cw-V+td_=6QAGUF+Uisueqcm0z=1zFaNTisAJnSFQ@mail.gmail.com>
 <TYUPR06MB6217877B31A08356241CAB38D2812@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <2024081652-unify-unlucky-28d2@gregkh> <TYUPR06MB6217D1798DBC41C7DB2A1DEDD2812@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <TYUPR06MB6217AEF9DD73C9424C7C1D07D28C2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <CAOf5uwmdf+Vxes6+BQyghbiKByVC_i1RhmTE81_iix99U7HMmA@mail.gmail.com> <TYUPR06MB62171FA07658FE6500DB855FD28C2@TYUPR06MB6217.apcprd06.prod.outlook.com>
In-Reply-To: <TYUPR06MB62171FA07658FE6500DB855FD28C2@TYUPR06MB6217.apcprd06.prod.outlook.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 19 Aug 2024 10:53:42 +0200
Message-ID: <CAOf5uwk-De+dCaL-xZMByFoMoxD7X1_KnOriq1MKAz5s+mOFiw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=E7=AD=94=E5=A4=8D=3A_=5BPATCH_v1=5D_usb=3A_gadget=3A_u=5Fserial=3A_check_?=
	=?UTF-8?Q?Null_pointer_in_EP_callback?=
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"quic_prashk@quicinc.com" <quic_prashk@quicinc.com>, 
	"quic_jjohnson@quicinc.com" <quic_jjohnson@quicinc.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"opensource.kernel" <opensource.kernel@vivo.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Aug 19, 2024 at 10:48=E2=80=AFAM =E8=83=A1=E8=BF=9E=E5=8B=A4 <hulia=
nqin@vivo.com> wrote:
>
> Hello linux community expert:
>
> >> >>I think this has been reported previously, and different patches hav=
e been proposed, have you searched the archives?
> >> > I haven't seen the patch given below before, I will read it carefull=
y.
> >> > I searched for Linux mainline commits before submitting, but I only =
compared them according to the crash stack information and did not notice t=
he following commit.
> >>  I checked the stack trace again. The problem we encountered seems dif=
ferent from the problem reported in the link below, and they are not caused=
 by the same reason.
> >>
>
> >Did you apply the patch? as suggested, is the test moving from one gadge=
t to the other?
>  We apply the patch into kernel 5.15 and ran a stress test, and the probl=
em did not recur.

It means that does not happen again?

>  Connect the phone to the PC via a USB cable and run the monkey test (run=
 an apk and click on it at will on the phone interface).
>

Yes I know but this monkey test is running a stress test moving from
usb storage, to other configfs right?

Michael

> Thanks



--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com

