Return-Path: <linux-usb+bounces-31757-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA64CDC762
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 15:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5BF0301B80F
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 14:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B049F350D5B;
	Wed, 24 Dec 2025 14:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="OwOktS97"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A662B346AD6
	for <linux-usb@vger.kernel.org>; Wed, 24 Dec 2025 14:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766584888; cv=none; b=a52SB18GE+2dpciLajaHA5wiZX2thktloznxIqiW1qLy7EKgso9eAiSaGY0QUr8o9FeYxp98eB0LNxIXXEKVOjk1Zh7ZqaQdMcZrSj5bU3qVu2G5T/C9Z5eOXtGtuXYedfpeJTj+Ds4B2AY1G4EfUaOCBhktWAR5fPM74kkGJ/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766584888; c=relaxed/simple;
	bh=I7+JGBFRKWqyrnVXzLUaDYsKdcEDRxDNeUF16RxUnpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rro0LrI96CtmXjOPEw60MI8aoVTaAVbmUrKMi07l+Wwf1wf0QnxY6Y1d/L15njAYd4qs5+PZ0YAMPaBzupd103Wa+G4aPrVps9nrxvaGgfz504RW7kIo9oXM2bUYAt0OUAzhWqejnLVYq+QPcqFd4SeQy3UKueNWBi2Z6v3Xy20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=OwOktS97; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64b921d9e67so7761697a12.3
        for <linux-usb@vger.kernel.org>; Wed, 24 Dec 2025 06:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766584884; x=1767189684; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7+JGBFRKWqyrnVXzLUaDYsKdcEDRxDNeUF16RxUnpo=;
        b=OwOktS970iZyjTToJrv3vpFIp+TVfoApn5xuvs/UTEwPPJRn+MEeHzVu/i5cdpLGVT
         c0Qd3a6PUuoevDp7TY7TY2CybeAVSC7N8/jEA5T/5hFTwdqieiluHy54dP4zknESaAGB
         bNizDukwvsJqgYnyjKPfBCH5tc6upXcXTkq41BQxwzaYcJAi6GMbJAHalK3kUHPjUC6H
         RPJtAND8ymrvcy8Nq2bqkNF6MRBftJGGzwdXE15I5yysfQ8A66e79CCa10L9imyAbH/P
         V4ZeStIKcTcR1gknTPgWu9Lclta6kc8pRDXW8YZMteJrXRcw5mrBiaS3bHY8ZvKq8k3r
         7TAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766584884; x=1767189684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I7+JGBFRKWqyrnVXzLUaDYsKdcEDRxDNeUF16RxUnpo=;
        b=vWqp9LhxVSnKpK8SFVAr1VxfaSxiubMkH3IXN4LGSCoUofFeR9DY28/p5IU2DfsfEo
         ECXkxinVi70aFNgqIir9g97+gKN4WtWwU4joJL6GvLfQbx72j24UwZHpJ1X3UHxkl1+D
         q4ehVGsbQbG6emD7CC3B+Ot9+EWsNM7beccMOed7xwqXwTkq3+n5Np8Xs2yPlKGe6Jpi
         L0Gbbpyt4okj9bwE+rA5r8R+08W52nfHtFciUv80yZMKa/VUHh0/Lpr6HooHQ0ZU0SOw
         tmH4y9VZtRyRRRpL7If5MpClL58dE5vPQXZa5Sk/792dpQYCrMijaC0sOLG+Wa9KmdnK
         mq6g==
X-Forwarded-Encrypted: i=1; AJvYcCXUbFu2/AykI8C0GYntWmvDb/MosBX/n/Wik3nkjuxoFWkwe+ijPbTtVo3oDoReg4mXqBfSeRMcHi8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM/6gSXPxGQP8jmfNkYfFS/3X5iL01zd/P93NqVZwdPkq9Mn8P
	zbsQXYMqr935WcB0mycH+B7DMC1l81MkTstF4A2iurD/vwM96QlZ+iLgvIMwUwD81dppdOu1FP4
	Fe6eaVObM2MbplaNOwk3DqirkfkmsVfR9RYcfY4/1+Q==
X-Gm-Gg: AY/fxX4NXULU82mNm8FlN01Yo5NBifq44pIF8y0Y1YRw/8GqnVadlli3qjm0dEOb9d+
	rPvshIpBsJo1117yyQOZv5lpFgj7tL30ol+mMkC/oIpy5a0iiPI06CDID2ZULdD8sdnmsDeHeB6
	cjXd5eHoiJzQVqNRyF4PHXS08xVFej6gqd7TRRWGRkyXrot90ZKZGqxrs3XnazD0FhI7k3wdDIM
	Yn9u9Lxqym6ImXqm5rBTaRTome3G3l87KB79Q7rmJbC1qH+XqdJsY9ZYHzj0GXfZ/3+h4+S63UA
	lipVIfQGWEz4NsQzf5HhXEiaUmuZq3TGIwxdHeNlVZPCje+hyg==
X-Google-Smtp-Source: AGHT+IHCXMeYFxQVcU8rJRtC/cDnDm53nQPvIw0Xbx77plqQqDjE4I50qoqJy3GeuDjgR14U8tTAxFKyl0h6HDv3chw=
X-Received: by 2002:a17:907:6e91:b0:b73:8639:334a with SMTP id
 a640c23a62f3a-b8036ebd999mr1821689366b.13.1766584883876; Wed, 24 Dec 2025
 06:01:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
 <20251223201921.1332786-2-robert.marko@sartura.hr> <20251224-berserk-mackerel-of-snow-4cae54@quoll>
 <CA+HBbNGym6Q9b166n-P=h_JssOHm0yfyL73JZ+G9P81muK=g4A@mail.gmail.com> <78bf252c-fd5e-4a36-b1a3-ca8ed26fde7a@kernel.org>
In-Reply-To: <78bf252c-fd5e-4a36-b1a3-ca8ed26fde7a@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 24 Dec 2025 15:01:13 +0100
X-Gm-Features: AQt7F2owdEGYn8vQgdJCyQRcW10NeJzDUOJWapd16DEqGEP6zPqPRLNSqy5Q0Bc
Message-ID: <CA+HBbNG+ZVD6grGDp32Ninx7H1AyEbGvP0nwc0zUv94tOV8hYg@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] include: dt-bindings: add LAN969x clock bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au, davem@davemloft.net, 
	vkoul@kernel.org, andi.shyti@kernel.org, lee@kernel.org, 
	andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, olivia@selenic.com, 
	radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, lars.povlsen@microchip.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org, netdev@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-clk@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 24, 2025 at 2:05=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 24/12/2025 11:30, Robert Marko wrote:
> > On Wed, Dec 24, 2025 at 11:21=E2=80=AFAM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>
> >> On Tue, Dec 23, 2025 at 09:16:12PM +0100, Robert Marko wrote:
> >>> Add the required LAN969x clock bindings.
> >>
> >> I do not see clock bindings actually here. Where is the actual binding=
?
> >> Commit msg does not help me at all to understand why you are doing thi=
s
> >> without actual required bindings.
> >
> > I guess it is a bit confusing, there is no schema here, these are the
> > clock indexes that
> > reside in dt-bindings and are used by the SoC DTSI.
>
> I understand as not used by drivers? Then no ABI and there is no point
> in putting them into bindings.

It is not included by the driver directly, but it requires these exact
indexes to be passed
so its effectively ABI.
LAN966x does the same, but they differ in number of clocks and their indexe=
s.

Regards,
Robert

>
> Best regards,
> Krzysztof



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

