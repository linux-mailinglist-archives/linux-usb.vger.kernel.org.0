Return-Path: <linux-usb+bounces-35135-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIROMP7nu2njpQIAu9opvQ
	(envelope-from <linux-usb+bounces-35135-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 13:11:42 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2E12CAF9B
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 13:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 31BEB3090D3F
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 12:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02E33D16FF;
	Thu, 19 Mar 2026 12:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ApcP0W9X"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30E03CF026
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 12:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921987; cv=none; b=XvCTizYLGuE2szjpME+tkFBDnVkvC7UwAKEK/y+U1pyfCkFH/hFUbLf81saTftEIDwXE4BPgq8HRER4H0Rw3z5VTEHscPbqf5Q+29FFPbGJ2Yj+bbCFNfObJaUA21Rv5/q/wR7PXRk0eB2tiXM9BmiGCXQFtZq5Orc/0naZAHlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921987; c=relaxed/simple;
	bh=evGJACCQ92qfXRJxUJBm1HcUDUM5bR60yuJe8p+XIQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AF8hlUI1t2VM1dawL95qdzOmdcB7nmhxmY8kaA7mf74i+JLVSxI/8Cs3svQdj4LYeGu2Lbx0Km09wIPyUwncIGdKi/dBFYzu71RWuGp61x82eYFFLmkbm7vcvLy7BWJuwgOrikOKHQBle9zcVLXASom7qiDYL2+7hqf768flxMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ApcP0W9X; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9813eed77eso101932766b.2
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 05:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773921984; x=1774526784; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QAg7rnrXpBm0pGKAmLADPah3EOw8ViNCZqYfAAvVAI=;
        b=ApcP0W9XBZmhSJswAC0kkjSjrlbghlqGGAFJuRqzR3V1FtHCNN5e4O73zEppnyvhbx
         bBDsaxeNiXq9OL9B07bhaDnmaT4v1gQR7S3KReQfTgp1WTKKzR4TaGxecShl8P20URbF
         c+VdwW7aC7CNM4FHP6eyUxBaw760CeyoulXWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773921984; x=1774526784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+QAg7rnrXpBm0pGKAmLADPah3EOw8ViNCZqYfAAvVAI=;
        b=D1UjRBqKe4j2Z9LW1wH7IJ6Txgv3zXpPA4s/VTW6fsfmD0qNt3EzwgH6vCHQHAu1P/
         53sVZxiFkjkbfSRl7vvFSkFRDROpFkMGO7643urOFMuAMoCVuGWDBVDSa5V4IHUGoq5R
         2KptN4Z+9IqTviYj44p4hQRTdUNot2bJ8IQc+CQyGl0H8x0wpW1QsfD06m/yS+5Fc0xA
         fsIi1InF3p6TP4qJv6kxo+Qlg490qNNbTDPb/CtnMXX4jsXDEmKNdUpUnJ8Co7fMx51D
         q3VCSAKTLUYl7eTxFuuy6yKKGFgU6oE08aWmSc+S7XCtI2GKe6luJyN/Kb4pg/38KaGN
         XNDA==
X-Forwarded-Encrypted: i=1; AJvYcCXLOCYUireWr8ZwC5qchLIc4vceCI4HqWBPNCWueFmp3GQux0G+K5A790y2qqvd24ehF4d8RFUDSfo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2cY2SaCM/LBQNSC4easM4KB78BeNMMCQtRV11uPD+CcLCEwO6
	jGZjDYyTyxJaDovNAtqGjGWSXJOtFhJDnViqle+YwZJT66U5lhrU3zR6KFvDPsC87ZZu/CckJiU
	gEcCe7pq9
X-Gm-Gg: ATEYQzzyd6q1ml2zZ1nImJMSX0bwSxScoEKgGQph5z1xWyoCITfCx15lX1JaFft525E
	nw/cwLbHbS00PJMimJXn7NOhwl+tdEXk53BBiMHNv7gjgisp1T3Ne2C4c/09FDVtAVPttiioR/V
	21K4hiPGoQLU7npof0XNqI0kjHcXDsq7/VnKn0FyULvYPKRrdJSdGXf+WDwOMOKquuLzyk99EIG
	27tDmNWT8LfWJteW03Az05gFDqM76QkSV946czTpuqr17Ry8oSpg/mw2dVRp1jKRJ8EHN12xb5u
	u0fLtPFxbxyGHDnAeDsYw3aMaNI2gG6re/SFZ+lua/NJwCRGCmIHe9Pf1RcBQ1TcR+uOzCq7vZD
	oG/b4LeoW14PMyr5ncKfLj/i/faHVvqybe6S/Pq36kANMlY51fUwmbUuTV0wM6nZtFLc2FxiOKc
	2CWhCRKZvlFvqZNAQljs06JI1+yjN0G0H7WWUFxWFRMhkn9AxAxaftVWf64zLt
X-Received: by 2002:a17:907:9602:b0:b97:b6ad:66f9 with SMTP id a640c23a62f3a-b97f485ef6fmr458229066b.12.1773921983478;
        Thu, 19 Mar 2026 05:06:23 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f1706a34sm451137766b.50.2026.03.19.05.06.22
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 05:06:22 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b97ed4ad579so140006166b.3
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 05:06:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZcMW89rMwOI9fgAFvUUkNCStgwHK3m+VgqqRDoQlnlYVd/BL92ZnSAWPawzZtIRatgtaTafl0NMg=@vger.kernel.org
X-Received: by 2002:a17:907:3cc1:b0:b97:a459:b66a with SMTP id
 a640c23a62f3a-b97f49248e8mr451884366b.25.1773921981709; Thu, 19 Mar 2026
 05:06:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
 <20260316-uvcdynctrl-v3-4-19cd4657e1f3@chromium.org> <2026031852-unplowed-ocelot-142a@gregkh>
 <CANiDSCvJnwGix2fZU7KygM8zC1sizkgrW-BVyESnMcmXhGE+zw@mail.gmail.com> <3f4d7dc75346339dd8dfc89c473587ce0f140958.camel@irl.hu>
In-Reply-To: <3f4d7dc75346339dd8dfc89c473587ce0f140958.camel@irl.hu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 19 Mar 2026 13:06:09 +0100
X-Gmail-Original-Message-ID: <CANiDSCuOseqH0RxYA-=jxq7o9pRgZNMBKNrKBY5UfUmQOarP9w@mail.gmail.com>
X-Gm-Features: AaiRm52NwdEyu_N17bsmFy6dTQI0yiaj67qnvkj987TEjYahmGItUjZAGUPR7LU
Message-ID: <CANiDSCuOseqH0RxYA-=jxq7o9pRgZNMBKNrKBY5UfUmQOarP9w@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] media: uvcvideo: RFC: Convert allow_privacy_override
 into Kconfig
To: Gergo Koteles <soyer@irl.hu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35135-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,reddit.com:url,chromium.org:dkim,linuxfoundation.org:email,irl.hu:email]
X-Rspamd-Queue-Id: 4F2E12CAF9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Gergo

On Thu, 19 Mar 2026 at 12:50, Gergo Koteles <soyer@irl.hu> wrote:
>
> Hi Ricardo,
>
> On Wed, 2026-03-18 at 15:57 +0100, Ricardo Ribalda wrote:
> > Hi Greg
> >
> > On Wed, 18 Mar 2026 at 15:17, Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Mon, Mar 16, 2026 at 01:34:47PM +0000, Ricardo Ribalda wrote:
> > > > This patch is just shared for discussion purposes! Do not land.
> > > >
> > > > In a perfect world, after a deprecation process, we will be able to
> > > > remove allow_privacy_override and block all privacy related control=
s.
> > >
> > > Why add something you are only going to remove in the future?  What h=
as
> > > changed to require this now, and will change in the future to make it
> > > not needed?
> >
> > Currently, any application with camera access can manipulate the
> > privacy LED. I believe this is a security flaw; ideally, the kernel
> > should block all such controls by default.
> >
> > However, blocking these controls immediately might be seen as a
> > regression for certain users. I added allow_privacy_override to:
> > - Prevent breaking existing workflows immediately upon a kernel update.
> > - Give users time to report why they still need manual LED control.
> >
> > The goal is to gather these use cases over the next 1=E2=80=932 years. =
Once we
> > understand the legitimate needs, we can either implement a proper
> > specialized mechanism for them or move the toggle to a Kconfig option
> > for those who explicitly need to opt-in to the old behavior or simply
> > remove the toggle altogether.
> >
> > For the record, identified use cases so far:
> > - Old hardware with red LEDs that reflect on glasses. (Likely a dying n=
iche).
>
> Older Logitech cameras, like the c920, have fairly large LEDs that can
> be reflective, and it's hard to cover them up aesthetically. Laurent
> wrote [1] that's why Logitech added this functionality a long time ago.
>
> You can find old Logitech software for Windows that still allows you to
> turn off the LEDs [2]. I tried it in a Win10 VM and it really works.

In the same link you will find that Logitech has removed that option
in newer version of the Logitech software and a "Official Logitech
Representative" says that:

```Please be informed that there is no way to disable the blue led
light on the webcam as that is the indicator that the webcam is active
and its mainly for security purpose.```

Other users say that
```I would not buy a webcam with an led that can be switched off and
that can watch me without any chance noticing it.```

This is definitely a requested feature by the users and it seems even
the vendor has realized that the security risk of a "stealth" camera
outweighs the benefit of turning off the LED.

>
> The c920 is a very popular camera, still available in stores today.
> Amazon says it sells 12k of them per month [3].
>
> 1:
> https://lore.kernel.org/all/20251119041907.GH10711@pendragon.ideasonboard=
.com/
>
> 2: https://www.reddit.com/r/logitech/comments/v641x6/comment/nr22zo7/
>
> 3: https://www.amazon.com/s?k=3Dlogitech+c920
>
> > - Using cameras as baby monitors where the LED disturbs sleep.
>
> And pet cameras and surveillance cameras don't need LEDs either.

Agree. All surveillance cameras.

All those special cases can use the allow_privacy_override parameter
until we find a good way to handle their use case.

>
> > (Arguably solvable with a piece of tape on the LED, but still a
> > reported use case).
> >
>
> Furthermore, if we filter these two Logitech XUs, we could then add the
> similar XUs of the camera modules in laptops and this could be an ever-
> growing list.

That is the goal, to have a list as comprehensive as possible.

>
> >
> Best regards,
> Gergo Koteles



--=20
Ricardo Ribalda

