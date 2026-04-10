Return-Path: <linux-usb+bounces-36130-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNDpCBDK2GmkiAgAu9opvQ
	(envelope-from <linux-usb+bounces-36130-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 11:59:44 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9EA3D553B
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 11:59:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5EC1F30071EC
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 09:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2503C3ACEFD;
	Fri, 10 Apr 2026 09:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rErJRG4Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF47378831
	for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 09:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775815175; cv=pass; b=WerBP0SuwElgLIEdDPO5GUuhe1pFyitNLLESaiT4fizV5G27bW0bbI3nyU4IAv3BccPi9FhzrcqlppHCbUtpvFi8avQdAZmdkh6MeKwLpwMucXm62MB1ThlGZpXtk0G1McNfzCeP/lhnAh5bLu+me75pONddpGRNCo7ACwji9cA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775815175; c=relaxed/simple;
	bh=N2Ytf4PmH2myigvUKMqYUbjaDrOTgHCXnYH7NNPpZ9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+Xnu9SBFwS5xUJ4smqvjGKWUfHUCGisUg9tK4cl6iCPfPjsqseEVEmsg0+7P3mBm5oNull7p2ugO3can+5Mg4k2d3inq0o4ulh8AYrV3C9T7l+2yO+dNAahAAfdZ0vZFlVUf0a/DSWlf3ObMlgH6OWy0maRfsOyTPDFNcpBElY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rErJRG4Z; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7947cf097c1so17286167b3.2
        for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 02:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775815173; cv=none;
        d=google.com; s=arc-20240605;
        b=cH6UpRpdAynCpBrfg0KrBX4O674Zld5NGrv2VNe7iXCE3LKjnDdU4yUNJ+snisGu62
         aYysXOAbC7RIlKgdTWMWMERf3567CUM3Gq3S7SXiKLK8M+eYXzVjCZaYi1oDf4pKgDXq
         5R1h8JcdWn6B4KrlECaZ31DffgHUKuPDMU3b2smDNjHnzZhl7uFNHxlf4OwB9Bcjn7Fk
         07CY+IbJsY+juzed61H5Dvec5jWFMONLlFcN4Ys5EY0NCeM9mHMG85hj6wgxbgSiWE+f
         7xz+lMSVkGphTmzpYy+VayfuMfD6lMC2ouNTXDR533F6xz+pLsVha0hSt1IumXp7z9DT
         GtyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N2Ytf4PmH2myigvUKMqYUbjaDrOTgHCXnYH7NNPpZ9Q=;
        fh=PrYt/GdysUZPD+JcoO5cmveIWb49/p3NQsiJ3oDtLvs=;
        b=HUKfHCoqy8nP5NwxJekM59m5wu/7C8ESPNFJwT5c3Aub6sTTr2wZVmzJ4polewTG1J
         lz1eecTF/gSji+zYO/0ML9lxboQ/cGlMGuss4t91KDc5pOrvlfpv1QJ7xcP4DO0dQzd7
         xqtfBDEnoh/Czvw9og/xScmNvUuZyGBkx4x+EvfGvHW1Bb5qWEVlAaMCcxoyT58iRiuC
         3jOn7uWzAsNIXUbvOQV0XIoddiLCrvGc2c7vn+VVKfcWa6WxA0Fh2nFN24qlkqrLag+Q
         OiJzLamm80/5+iDHU2uVK57LQAS4B4WdLFm5j6fB4LHcN+THGiEQcO3mKs/Xb355eQkV
         4iNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775815173; x=1776419973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2Ytf4PmH2myigvUKMqYUbjaDrOTgHCXnYH7NNPpZ9Q=;
        b=rErJRG4ZXVbUQMFbRFnmhepxOtcXBpodg5RLaOgBH+BoRSymMMJ7ImR40QJedCzbyW
         tMf1Kw0G48yG1WZj+bNeo4MywgSjIiHC6+mdUiWs/1trlCFn5wz1/AAEssiw7iJpV45I
         HfNU8cXmReN8Nsez829lTb/TBvUrr77OsqHawEgFSQ6vY1oOAVLWJ0U/Z4+fMTe/VFCg
         IR23/Yp54EUoq9dhxidWHZuyoQIaTlIzdzfge5/sD4+zoIksk5Yd0vqptdZ4fGSwlDMf
         y/S/uZCe8K9ouwDdws1zrrxjoze6PKxwMOQ8PgDitKmFK8vgUphQisVdc+pg/trHdpwt
         wTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775815173; x=1776419973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N2Ytf4PmH2myigvUKMqYUbjaDrOTgHCXnYH7NNPpZ9Q=;
        b=d0luVIizpfUZaZaD68oaa7+17imur8HFGJHPdRu0EorTxEirPeOdKczEg4deBMOxVo
         ip+uYat0E4GgO976bEjUgQUgTa4m1FfImgMnY8UfzzuX1jcZ7awlHyS4FszUlBDlFcnG
         JQoACxGW/H9nk5wlY9wCqmtPqIYNjMBOgLpKUj610L2wrykNY6YIpZiGIOvr6zn648SG
         Gew8bIJhurReBgWDyUceAMmQrOfdzByPLk3jvjF6qYU9a8+P8e7HRCw01zFLuDOj09OR
         kveAE6v60jx2rC8SDD6NbjCVxIGZAxUm0VV3/f9EBacZWtatfskTWRhtJlv6eTqUVq/t
         9f3A==
X-Forwarded-Encrypted: i=1; AJvYcCWI5mnc94wACNke4mNXcQbWRTuVRMilxj9joIjuEKvWKn4mWmQNbPAyuUh6ms0OW7yvr2sqzupT7b4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDm2FROiYwroJ+/2RJddK9rEjHPOsfsL2JPUL1nE4FcMius8Pt
	Dgyosis8erYdg++To6KIxEjtXY9mN+RRWEPFWqEI4bvC8ooXkMzNcB/HMNChZoly+AqmxWVyM7P
	8jj4JX7c6bktlUgaj5r0nz38WxssvN64=
X-Gm-Gg: AeBDieuidmd2Tbz24Npqjn4zpnDhduoYX8aCVcKWOkPKRH1xonVwOevEP3hxabgwyue
	F5/brCpb4seymQscBU4G3uj7XYAKrB5eFTOAq+Iok+yAflVqDEjg5eVSV5ElgkIDlGcFfATlyxq
	SCLD9f1PFaYuFUdlMYgNMI+i9erjf7gDr/G6MPiKSguDxTK4lXdnN0kJRKzK2LNESAHAN6keS4m
	c3XDdaH6Ml9Fb4y827CXoCJfYGPGN3n3rq6TQ+Sf0wv6boQEcufEnKN8vJfCfZdmUD+8etHAMwA
	YKhOlid/f9/ryHwV/ATUGtstoP1hYWyfcU8SoxkPWQ==
X-Received: by 2002:a05:690c:83:b0:79f:3715:1980 with SMTP id
 00721157ae682-7af6f907f77mr24281587b3.12.1775815173216; Fri, 10 Apr 2026
 02:59:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408053037.1867092-1-a0282524688@gmail.com>
 <20260408053037.1867092-2-a0282524688@gmail.com> <CAMRc=MeJL_po8HuBa4btVowR-e0i2FyzbDgNVo2u54iPKyuvWw@mail.gmail.com>
In-Reply-To: <CAMRc=MeJL_po8HuBa4btVowR-e0i2FyzbDgNVo2u54iPKyuvWw@mail.gmail.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 10 Apr 2026 17:59:22 +0800
X-Gm-Features: AQROBzChhaENjKRgm1eiXEkKC5Ek3HBghHXiZXP2Ngye9h9-wWZ61ho7Hz-V2Tw
Message-ID: <CAOoeyxXqUbdd3Y0VorzVVOARVpoEkx033sYrv5Hs4tRfst2tOA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mfd: nct6694: Switch to devm_mfd_add_devices() and
 drop IDA
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: tmyu0@nuvoton.com, linusw@kernel.org, linux@roeck-us.net, 
	andi.shyti@kernel.org, lee@kernel.org, mkl@pengutronix.de, mailhol@kernel.org, 
	alexandre.belloni@bootlin.com, wim@linux-watchdog.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36130-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0282524688@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 0B9EA3D553B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bart, all,

Thanks for the review.

Bartosz Golaszewski <brgl@kernel.org> =E6=96=BC 2026=E5=B9=B44=E6=9C=888=E6=
=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=883:25=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, Apr 8, 2026 at 7:31=E2=80=AFAM <a0282524688@gmail.com> wrote:
> >
> > From: Ming Yu <a0282524688@gmail.com>
> >
> > Currently, the nct6694 core driver uses mfd_add_hotplug_devices()
> > and an IDA to manage subdevice IDs.
> >
> > Switch the core implementation to use the managed
> > devm_mfd_add_devices() API, which simplifies the error handling and
> > device lifecycle management. Concurrently, drop the custom IDA
> > implementation and transition to using pdev->id.
> >
> > Signed-off-by: Ming Yu <a0282524688@gmail.com>
> > ---
>
> This does result in a nice code shrink but I'd split this commit into
> two: one switching to using MFD_CELL_BASIC() with hard-coded devices
> IDs and one completing the transition to devres.
>


You are right that this change is trying to do too much at once, and
splitting it as you suggested would make the series much cleaner.

After looking more closely at the ID handling and hotplug
implications, I realized that switching to devm_mfd_add_devices() and
dropping the IDA is not a good fit for this driver. The current
mfd_add_hotplug_devices() path uses PLATFORM_DEVID_AUTO, which gives
globally unique device IDs and avoids sysfs name collisions. If we
switch to devm_mfd_add_devices() with fixed IDs, multiple identical
NCT6694 devices can end up registering subdevices with the same
platform device names, which would break hotplug support when more
than one device is present.

So I think it is better not to pursue this direction further.

For the next revision, I will drop this part of the change and keep
the existing MFD core logic, including the IDA usage. The series will
focus on adding the nct6694-hif MFD driver only, and I will add the
IDA initialization there as needed.

Thanks again for the suggestion and review.


Best regards,
Ming

