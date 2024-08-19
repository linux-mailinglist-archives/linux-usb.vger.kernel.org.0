Return-Path: <linux-usb+bounces-13610-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7F69566A3
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 11:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DF961C21916
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 09:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADE715CD7C;
	Mon, 19 Aug 2024 09:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ktJHHSpV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC5B15CD6E
	for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 09:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724059041; cv=none; b=In4xhOUeb3uIew9LH/k7g0UKKolx3l5zOXoyDgqbUiwAT+SXGg8S5VoHMWtioN0E59Da0aMVLisPEWQwOBhMA2w0ND9kBYM4ZIczbaD4DcH5od08MOYSSg616sjnwmj0vEz5w5/Ha/rrgmh4ofgG+TWoIuovh8PIsMHkcA4Tkc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724059041; c=relaxed/simple;
	bh=2WOXquNPI9lTCv0oFnVGz9A1cxRJez8OulMExUZpWVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ols6sDNfrJog+Midcu7w9PIOWts2eWw9wq20TpnceR9YDDEQ8mg9GU33fDr96wrCYCMubPoab5SYcks+nJk11kUhlp5x+OY9PU1ISyFJ+kUhmzyaQgIIEAwX4D6yKeIJlMURwFQVU8OEwySUEshSYQWTePxIdVK2n5NsTUUifEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ktJHHSpV; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8384008482so418606666b.2
        for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 02:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1724059038; x=1724663838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALicRhMbFic729p1B+Q3KjvAzvfvgE5+pIP6YQqtG8M=;
        b=ktJHHSpVoLsxwTvKY0ZoxguVXAsJLZbyOMFiOex6kPdPhjTqzOiYgnd0GQn/wg1Vns
         W7CEwU13OtWqD2qxWqPhAb5dzcflez1m24m/DIEQFe+h7baU7TN1Md9hwpHoT4EJQbDm
         kt+0qPIVB6qqbxcf3Xdk0dtHPKu/FzHQpT268=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724059038; x=1724663838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALicRhMbFic729p1B+Q3KjvAzvfvgE5+pIP6YQqtG8M=;
        b=cuCKZ6PL0b0Xndxc5eaM5qpq0FZtumObOhJGdaYA4FErly3AULXGpfMcnNQChKgcYw
         xKLobwgvDLePQd95F1WrTgaY96CjWLMs+d902RuCVtZFwM8Mb+QrGA/BEcscyAop72p3
         e/hZowLjkAd1j1ueDAYdhHsbjDevb9dTy25lpEvaPvFBDvh6LSviy3TYSI5Z7hMfKb5x
         Fk22gkxymJXYQhQX9nv+OtMPow5eR1nZDHmQNTVEHMaI6DzzTIvL/MlkKxQAQ8Fu6DJ6
         3c3Md/w/PPbLq2d6NwUtOoVJT64zqdIKdXtHkvnLOUlneQXxbblv1gzqdctt5VYeWnUB
         1onQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHZQSpBu94ct7Aym4xf1i+FVJKQ5L/ovXjEjDLWGZf3gjcAqAajOtKbu81gH6x7Vft083DBWEhcquXTvricpYiTUmHpSdVIqmz
X-Gm-Message-State: AOJu0YyBFwSESvJRiYcvEh7KLk4zPhevwuKlnVSnC8HgNnbnNQaYZZLT
	Hv4fX+ltjggXeRsQshFp0fmqZVk/8fzrZ5oonSsCjADxHupjkN+8aPOVJDpwLFlIn5CJM36X/g9
	aiC4VGBkCyuFxVnU9qhYFNUIDND6mrIhigCZELg==
X-Google-Smtp-Source: AGHT+IHkFS7t0pMEcZTmWcFNiXZnTxP50r3dEYP+Lc+1dDkfS72kHuuFmzUBowJ9bJ1uLg6pEGqMrVdzqxN+rT+EITY=
X-Received: by 2002:a17:907:9408:b0:a7a:a892:8e07 with SMTP id
 a640c23a62f3a-a83aa01c90amr369946366b.31.1724059038094; Mon, 19 Aug 2024
 02:17:18 -0700 (PDT)
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
 <CAOf5uwmdf+Vxes6+BQyghbiKByVC_i1RhmTE81_iix99U7HMmA@mail.gmail.com>
 <TYUPR06MB62171FA07658FE6500DB855FD28C2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <CAOf5uwk-De+dCaL-xZMByFoMoxD7X1_KnOriq1MKAz5s+mOFiw@mail.gmail.com> <TYUPR06MB62175889B121F542869856E4D28C2@TYUPR06MB6217.apcprd06.prod.outlook.com>
In-Reply-To: <TYUPR06MB62175889B121F542869856E4D28C2@TYUPR06MB6217.apcprd06.prod.outlook.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 19 Aug 2024 11:17:07 +0200
Message-ID: <CAOf5uw=Cuubyh1m_biK=A43ZhdP5696s9kebXw4i9pdj-9g4dw@mail.gmail.com>
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

HI

On Mon, Aug 19, 2024 at 11:00=E2=80=AFAM =E8=83=A1=E8=BF=9E=E5=8B=A4 <hulia=
nqin@vivo.com> wrote:
>
> Hello linux community expert:
>
> >> >> >>I think this has been reported previously, and different patches =
have been proposed, have you searched the archives?
> >> >> > I haven't seen the patch given below before, I will read it caref=
ully.
> >> >> > I searched for Linux mainline commits before submitting, but I on=
ly compared them according to the crash stack information and did not notic=
e the following commit.
> >> >>  I checked the stack trace again. The problem we encountered seems =
different from the problem reported in the link below, and they are not cau=
sed by the same reason.
> >> >>
> >>
> >> >Did you apply the patch? as suggested, is the test moving from one ga=
dget to the other?
> >>  We apply the patch into kernel 5.15 and ran a stress test, and the pr=
oblem did not recur.
>
> >It means that does not happen again?
>  Yes.
>
> >>  Connect the phone to the PC via a USB cable and run the monkey test (=
run an apk and click on it at will on the phone interface).
>
> >Yes I know but this monkey test is running a stress test moving from usb=
 storage, to other configfs right?
>  From the crash information, it can be seen that the switch is from mtp m=
ode to vivo industrial mode port (adb+diag+cser_tty+gser_tty+rmnet)
>
If the patch applied fix your problem, I think you are ok. I suggest
even you have an android
kernel to try to be more close to lts version of your kernel in Android

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

