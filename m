Return-Path: <linux-usb+bounces-19354-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93804A1133F
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 22:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE2933A6591
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 21:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3910B212FB4;
	Tue, 14 Jan 2025 21:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="C+saMi8m"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B0A2080DA;
	Tue, 14 Jan 2025 21:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736890869; cv=none; b=dttETmBeD9kcuuD/34Q73H0WleULVDbdu77UA2wUFPxsRZLvAXO9NTWhwgvepCcYijYj73lZvj1vl5jUcWTqv4MRk0lX9m0vA2h6JAjj9joHQJ/gzcLZKYo+5qLUqIqocbnTlzXSA8QZ2XmWfa7CrSfxkMXcso/1nu8iwv5xTc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736890869; c=relaxed/simple;
	bh=YURU16VSFEZeGcNi74RyunrTDqIlklIsFkRCLxz86RY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g0DQ3FWuAgTwbyNUlNTbGvk5fnWKC/d2Q39cQ8atkmXPA0amOVVCBQd8ypAiEyBB2LcmOFbzV4XC18tXyL5f16EYfSwf7DKhwOgyThSm+K/CFSgOJOo/srZWDKe8yJ7LteQLQN2jGvTgQBhKCNV2MkKK+a4+zvir18M8K2tID0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=C+saMi8m; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21670dce0a7so130397715ad.1;
        Tue, 14 Jan 2025 13:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736890867; x=1737495667; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YURU16VSFEZeGcNi74RyunrTDqIlklIsFkRCLxz86RY=;
        b=C+saMi8m672YFhan0x/6dUfZxRdlCAfQyJgWcWEMvq4zbRverFTWiVgDAggHv5USY3
         3cuTmIVOhAoiLR9ROEX0ZQ+U7q8Xc8BpNmpi8/hEIneceejd10+ht76a51jgO03RTA5A
         xFPJDYaq9yAfKzttxsRCfrbjnkltHgCteXylSpcjMnEFH7B4mwN0hUfUvzb8QOHTjJml
         0MFupL7yxAa28jVY6H04GwsP6CmZhMHDs5DzSos3kk2xYQLDMocNGeQkIJZLU0p1rPmj
         1dIpjEy7QTSMiXJ3sjuQjrkct8pOri3qs5WV1GM0es3pJvso1Gx8lGcP6tk8N0MsRCkX
         ssAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736890867; x=1737495667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YURU16VSFEZeGcNi74RyunrTDqIlklIsFkRCLxz86RY=;
        b=fWxRkVZA4lS69VUL4p1Xl//t8H1DKBaTQvE40rnC2FCkL5bXEdvm1hmmEQOXNw0r6z
         tZixUlFpJHglohDbfh2acFNcTt9ymbIxs7VnWd0le/xP0Uc5lz05SRYjF1gDL6FDED/4
         /fpSMTxLTFrgFZ+XnaASVOlkxaimPnPDKfbMzPoB2+NxVxKEdHqe2W4RejPkN17iehtb
         Ym0D+0xkcqKgDXpXMJvkJLbGNXNJ5qhzIQf9f70Pq8t+0E+UKEfbxUoRKHkAv32sJQD1
         6UcoIaUB/kPjZgLuyKDOFl7r2P6cIlmQmXabCGWb71pBrLHDDZNxaLXzecdzbT0k4cyR
         ixWA==
X-Forwarded-Encrypted: i=1; AJvYcCWc6OUf2DV1NaqMMqrUdSOnlDOOEMjzkj2vdutksfa2c2cLtT6DsBlspuKK5/05gp4AZ5nceJVrtYcY@vger.kernel.org, AJvYcCXCBwTqBa+ukerlEiGpF2nKn1f+mJTGq2f9uVUfD7rDRZsTPjKlpaywTtsECOegyW0FujqMJAi7MKk+yC8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk1h/XDM1HxW1GBFMIBsVJT68KKJqdpkLw2V1/CIMZbu2nNkQ3
	77eGxzKyvXkGHVbv4kfF1kNX2EvSDGvQyuTcYPp6COQDTlm8ThUklZh+6B4iabV7qYAEiPr3NPV
	UzzyABr8gSKT2eqO0q731k7DlKh0=
X-Gm-Gg: ASbGncs51LHZvUQWHeVlw9IGRZR69bs71ZXplYowaBbIvX8oWJeuW9Y+bV5g90bJIGq
	ZexzFb/F3vgYcWW+zZemRe1T7p6MTc5KPz+0wn2zEeD2Cjai+qvwt3YKlub/6JCVxoAmYZfE=
X-Google-Smtp-Source: AGHT+IE1iI53otkORC5W5vNYVb7xxn4u7WYJCao9XVKd0MyRxzlT5Ih2KgnCVZCbrlM0QpJD5u/CjnF9g7U2hIHHoPY=
X-Received: by 2002:a17:902:cccb:b0:216:4d1f:5c83 with SMTP id
 d9443c01a7336-21a84010cb0mr395655475ad.47.1736890867595; Tue, 14 Jan 2025
 13:41:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507131522.3546113-1-clabbe@baylibre.com> <20240507131522.3546113-2-clabbe@baylibre.com>
 <Zp5q5V_OnLAdvBrU@hovoldconsulting.com> <CAFBinCC9ftXxkyoiY=3ia6UubTeG-cHXa40ddd7WMNUhvVjr+g@mail.gmail.com>
 <Zp_WiocH4D14mEA7@hovoldconsulting.com> <CAFBinCATe+RXHz6Cy9cbo=vYL+qm_kz1qDTB8oL775xdgk=TYg@mail.gmail.com>
 <Z4aFSCnJTX2WHGY_@hovoldconsulting.com>
In-Reply-To: <Z4aFSCnJTX2WHGY_@hovoldconsulting.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 14 Jan 2025 22:40:56 +0100
X-Gm-Features: AbW1kvZxaqdfxhZ95SgadDJy_ToDUgvhtGndBU5FTJlcpQFcaA_M8wrA3s33OTU
Message-ID: <CAFBinCB4pDOoE9QCH966uyP0yaVm3CkAi3uncMqEDh19VSmbQw@mail.gmail.com>
Subject: Re: [PATCH 1/1 v7] usb: serial: add support for CH348
To: Johan Hovold <johan@kernel.org>
Cc: Corentin Labbe <clabbe@baylibre.com>, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, david@ixit.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan,

On Tue, Jan 14, 2025 at 4:39=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> Hi Martin (and Corentin),
>
> and sorry about the late reply here.
Sometimes there's more important things in life than USB to serial adapters=
.

[...]
> > > You could try increasing the buffer size to 2k and see how much is
> > > received on the other end if you submit one URB (e.g. does the hardwa=
re
> > > just drop the last 1k of data when the device fifo is full).
>
> > I have not tried this yet but if still relevant (after the info about
> > the THRE interrupt) then I can try it and share the results.
>
> It would only be to really confirm that this is how the vendor protocol
> and device works. Your call.
I can give that a try in the next few days and will report back.

[...]
> > > I understand, but the generic implementation is not a good fit here a=
s
> > > it actively tries to make sure the device buffers are always full (e.=
g.
> > > by using two URBs back-to-back).
> > >
> > > If you can't find a way to make the hardware behave properly then a
> > > custom implementation using a single URBs is preferable over trying
> > > to limit the generic implementation like you did here. Perhaps bits c=
an
> > > be reused anyway (e.g. chars_in_buffer if you use the write fifo).
>
> > I cannot find any other usb-serial driver which uses this pattern.
> > Most devices seem to be happy to take more data once they trigger the
> > write_bulk_callback but not ch348.
>
> Right. I think the io_edgeport driver maintains some kind of TxCredits.
> I guess that's related, but not sure how relevant that is here (and you
> probably shouldn't based anything on that old driver directly anyway).
>
> > If there's any other (even if it's not a usb-serial) driver that I can
> > use as a reference implementation for your suggestion?
> > I'm not sure whether to use a dedicated kthread, single threaded workqu=
eue, ...
>
> Not sure what Corentin has been preparing, but yeah, you need some kind
> of deferred mechanism to make write() non-blocking and hold off sending
> more data to the device until you're sure there's room in its buffers. I
> guess a workqueue should do fine.
We're currently testing an updated driver based on a workqueue
(work_struct) and it's working fine.
The issue that Corentin reported is unrelated to the workqueue part.
At this point we're thinking it may be a regression in linux-next, but
we're running more tests to verify this.


Best regards,
Martin

