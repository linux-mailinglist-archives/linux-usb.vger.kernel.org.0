Return-Path: <linux-usb+bounces-30816-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF09C7CDD0
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 12:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 243B14EA3B2
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 11:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A3D82FD679;
	Sat, 22 Nov 2025 11:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eKLMUqlk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1CD2FCBF0
	for <linux-usb@vger.kernel.org>; Sat, 22 Nov 2025 11:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763809466; cv=none; b=jk8JW8lgR4I3C6hjd0q8F0uT5eWj2HpeV0T/9Pca3rDZtJ4d9E9nyD6oYTJ3cJu7WCTOrtf5pf+544JVYUDfyCTHUOIyo8m5aJFUhcrqdmvBsu4CxI/Qi8ZI2MOM71xSMs7Ge6ydVs2QJTCg+kuAlNEJrsmg6vS+B6Xp9oa3csE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763809466; c=relaxed/simple;
	bh=tsJxznhhsdWk/IcHQzDu5o2LqVbhJTIdpbjmLLnlHxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=DjQnh7Mp6tx40Y6x7IihxMmOAm3TW27+2j+Mn868VYdrRfaFBV+RMS3HXKILe2es+IxhqnooT3GMvOAV64k2FP16WeWz8HK5BXdnrICAxlF3KYbjza/OrsP8g5wKpFt0BuRN/3x5Vkz4yBoTBxlGNXTKLperDoqJF24GX0xB9sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eKLMUqlk; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b7355774747so52603666b.2
        for <linux-usb@vger.kernel.org>; Sat, 22 Nov 2025 03:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763809463; x=1764414263; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIscJlrRu/kRjOauS2L78QjFG0eah53kWGol52SXo6M=;
        b=eKLMUqlkF5/ChYZV55RAuYsn1EKD9TtpVLegMLNyzaone4N+6WfDZxcW42Bxm67UTD
         EUx1tMsmowX4hbOSIWUttEN4x/JrTM79DCMHGmC82zXtfgBHlFyXMHFHpmPUQxAKuPGB
         MkHlaAk8MI1RyJpQLpvJqcFKsDyVOQqnS+o1ciBSvYkr4fA3Qf/S4ZDEbGN0lvwIFchS
         FBWM4A04eupCNsrOhlESiIjYVbn6YLOVH/aSVrPu0R7+TlsHGnYdQdH2XrtkMxDjZS/b
         q/0DCaO6KFAONI8E5o3bV7i5Rs+KBxloYDiLIFfleYC7HWcCRnJWatiX66KUXhQxQPXF
         UWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763809463; x=1764414263;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HIscJlrRu/kRjOauS2L78QjFG0eah53kWGol52SXo6M=;
        b=P1GhM/gnNcYqHZ/xxZkZqFMgf3e5moaJrmJrChSlRvU1Onhrs6xEZ5Ih4p6zjhQ1Ej
         yLPDbKA9hO+bWp9fMkvmtsYlqdKeHj52dRN0ryO0w/eUMX3SK/zUUvNxrlJnYwGYJRxJ
         lgOkcoAkHvj+VxhXw/CWrlCVikTZNsbxZez1uPVzduhpboBnzkzowYoWo28XbGQ5qVfi
         9pwlTibQvhbmtuh3Zh3gFheUdvRGCO4iUGjUi5XryQX7LoyjwiOosdJ8YD+XYCZHYlx+
         EQVKf82+iEaIythniH8i/c33MkiDAiidN+9MWEllRr6OqedT2WlTPA8G7SRZDQ/f7xCU
         6+Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVklskPCZXFH68BYPdpTkNORLM/gKU6Z3W5t0ryA9rUu2t8a50V/G7tsiSYdYhox1JYTfIBcLqHM3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoPf64QcfXAWdzuHwOHa59y+9RIfyLVr5Hw6nm7ec4ru4gHUx/
	wcSWOkrjf1Xegoc77OLq6wgFTHw3jM8uwRB0ujWqohMYDKu6/1k5/+/2VzRgQv8/0pUnysP+Ajh
	8/Reja3hItZCNeEeyrnmV1qP/aacYBh0CGwTdPVFY7Q==
X-Gm-Gg: ASbGnct216fNs/ywPBn5Ev4WKLWQhfB1+zE4XttAYk0y+5Sj2FQA1OKbw7E0kwcBVdN
	wQdub5/whk19IvYyCTK5Vegm7PNotRaF19tcIiLh5tX89WOfFHcx8xl+q+f+KDe1UqFGWbUHbvN
	RbUx4m1JjnDJEeriTPUR4o5foV2pcWMitvb7t3UhVa0DaryUkVq+IROBrAYTu8MZWl30Tf5wQL4
	nl5JPDG5oQUC2RqotLgc6hSasAmJkNXHR2xRdY72tMlxTG10b6LIKzFmBuIgh0H7gKszuXR
X-Google-Smtp-Source: AGHT+IFwj0wIUS3W02n50SAzmbsXBONNGDPAJuVkICQXGzzp3m7faHtxTsrZQ2QDhMaOqE3Pbb4nQ2w7li+HcQCw9Ys=
X-Received: by 2002:a17:907:7247:b0:b45:a84e:8b69 with SMTP id
 a640c23a62f3a-b767185d1a7mr313034466b.5.1763809463031; Sat, 22 Nov 2025
 03:04:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121080905.2237648-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <2025112159-sermon-grooving-7eb3@gregkh> <CADYyEwQqghzWedZYmZtwk1+R5DxMYg0aMJhVAutrW1w+CTB-7w@mail.gmail.com>
 <2025112126-leverage-wrongful-85c4@gregkh>
In-Reply-To: <2025112126-leverage-wrongful-85c4@gregkh>
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Date: Sat, 22 Nov 2025 19:04:11 +0800
X-Gm-Features: AWmQ_bn4YzHtbFlEZGdhJvUsd172OUkxJmMyGUd9LA4Hg12qa0leAZEr44r3bUc
Message-ID: <CADYyEwT8XmBFwWx6KQD9Ax2-=wgKXH2njuMJMWU0_SBuyd8dXg@mail.gmail.com>
Subject: Re: [PATCH] USB: of: filter disabled device node
To: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2025=E5=B9=B411=E6=9C=8821=E6=
=97=A5=E5=91=A8=E4=BA=94 20:35=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Nov 21, 2025 at 08:24:02PM +0800, Zhengqiao Xia wrote:
>
> <snip>
>
> For some reason you sent this only to me, which is a bit rude to
> everyone else on the mailing list.  I'll be glad to respond if you
> resend it to everyone.

I am so sorry, I didn't notice this at the time.

I will send it again with my company email
>
> thanks,
>
> greg k-h

