Return-Path: <linux-usb+bounces-13602-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 521F89565CD
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 10:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09516285071
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 08:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2374B15C13D;
	Mon, 19 Aug 2024 08:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="KhqXKRzo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0CF15B968
	for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 08:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724056905; cv=none; b=tgRRDxh7iXpGvzp9Km59SdarImUVRsfXvSbm6AVDsLa3LmP333OGv8yW4CaLDV5NXxuGyMiDPce3RthiwzB1LlQu+vuN1EtBzC0ZUTyUx/PoKGKoXc1CRXZfXXQNqxgmldQgcrBTiFMzbPW1dKMPr/idNA+NwwNSYkHs7Z/+M8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724056905; c=relaxed/simple;
	bh=UNjp+9lOGZEGtwFuIBJcKxlJee+gCs5bPutE3MKq1Mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1wzoWkVH3ym/mf/3+RqNmCU1Md5icEkLrK7XRevjXwsNI600FMPM8EWvub+8PUmuSPd5EWgSTkpBNWg8r0KS6Wd2eEvShKiGtx+vMy+vSJmeQguQkA2x9ZAkg6E5SSdIaFDXIt35L41GYbLkvU4OSN5WXA0Bc/3IBsqOl1zuVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=KhqXKRzo; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-530e2548dfdso4575758e87.1
        for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 01:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1724056902; x=1724661702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEirQhICxGMvfojW7DrVQ28Q7V59+ixyBUh8UIAbPM0=;
        b=KhqXKRzoG00xRoUNLjWmj19yhr2g+sXStR/qV8o+3yiOhDLIdMruKfveZ2OO0tdamq
         6CXEAC9kztA4vp9Goo/5skd4tjXpVwgT9X+VI8Q9qeKhyQuSuBO7GqEvWc0TH2HV/udT
         y26k2CZqM+CC9sIOveJTOopojHmBQr3IileS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724056902; x=1724661702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CEirQhICxGMvfojW7DrVQ28Q7V59+ixyBUh8UIAbPM0=;
        b=J6zU777hgDl6EdJrv/QVWhDD0LLxIIV8cf/+zIG4Jjp8TsuYEBDgskXPFti/lv5ozV
         Pusv7TWH5MqdTReVOP0JBSoFcbBLv16PGKXBQUm0AN4kEY6FQD+XEQxXaF2FWQOU1ii8
         YIlHsURvsVAnzabXd4M/oQwx6KuwXQ7j/ooJM6Ips27XjZkoR+y2U9acd9KYkNlo+xRF
         JxYkcAohF3a2Qz/vGNEtyHfkjJXFgthbucrm4fJoWea9LXwADznjsl/INXiAu59/gBVS
         8GNeWQpsX/szkD1rB1CZa17TSRNJxD78y8bgrAtEOKl/4Y7bjLvcXJ8ly3kASyEWC3Ay
         WNzw==
X-Forwarded-Encrypted: i=1; AJvYcCWixtq1bx72vy0/jY9LowUwhusLC9KM6efXtktMMh6eXWx3A99Dj3VinR+vN2M+U7WIMtDrnEkg2gP4K31K5qzYQAxUsriGYWfG
X-Gm-Message-State: AOJu0YzhKd2JrIl9zKzkyt3DfAOZ6NfsQLqeqcElGGKUhLFi2cUwiYhh
	1R1Ird6nCekXrwzD7DG2NwjxaV7+87VM7R/QpJDmlYVWgy9QlmKjWbk8hUtdvvX4lZOsR9zqazJ
	E0ydWuFYalH9E1BSg8Nlsd+Vwq+Ly7WByCTgjDA==
X-Google-Smtp-Source: AGHT+IEwfTOO/2MlTaAwNhTintjuHDB3MF5UseOJNgiAYqgi//7fVjLazwGoaEv6tn+tT+nJWKwD1yiJfMtuWo6bkOk=
X-Received: by 2002:a05:6512:b20:b0:52f:c833:861a with SMTP id
 2adb3069b0e04-5332e07fba3mr3853950e87.51.1724056901096; Mon, 19 Aug 2024
 01:41:41 -0700 (PDT)
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
In-Reply-To: <TYUPR06MB6217AEF9DD73C9424C7C1D07D28C2@TYUPR06MB6217.apcprd06.prod.outlook.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 19 Aug 2024 10:41:30 +0200
Message-ID: <CAOf5uwmdf+Vxes6+BQyghbiKByVC_i1RhmTE81_iix99U7HMmA@mail.gmail.com>
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

On Mon, Aug 19, 2024 at 10:26=E2=80=AFAM =E8=83=A1=E8=BF=9E=E5=8B=A4 <hulia=
nqin@vivo.com> wrote:
>
> Hello linux community expert:
>
> >>I think this has been reported previously, and different patches have b=
een proposed, have you searched the archives?
> > I haven't seen the patch given below before, I will read it carefully.
> > I searched for Linux mainline commits before submitting, but I only com=
pared them according to the crash stack information and did not notice the =
following commit.
>  I checked the stack trace again. The problem we encountered seems differ=
ent from the problem reported in the link below, and they are not caused by=
 the same reason.
>

Did you apply the patch? as suggested, is the test moving from one
gadget to the other?

Michael


> >>Specifically, take a look at:
> >>https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e.
> >>kernel.org%2Fr%2F20240116141801.396398-1-khtsai%40google.com&data=3D05%=
7C
> >>02%7Chulianqin%40vivo.com%7Ca4b06e9db7bb43ab1bfc08dcbe01a836%7C923e42dc
> >>48d54cbeb5821a797a6412ed%7C0%7C0%7C638594161566475032%7CUnknown%7CTWFpb
> >>GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%
> >>3D%7C0%7C%7C%7C&sdata=3Dpdb%2B1b1qB1q2%2BZN096D9jxNytfN7%2Fo50DPt6pq5m1=
RU
> >>%3D&reserved=3D0
>
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

