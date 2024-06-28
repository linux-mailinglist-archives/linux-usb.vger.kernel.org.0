Return-Path: <linux-usb+bounces-11780-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4668891C2C4
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 17:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C40B4B211A9
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 15:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704461C688A;
	Fri, 28 Jun 2024 15:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZOgCTSh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA701DFFB
	for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2024 15:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719589200; cv=none; b=r/a+8acHlZjRObNgfH/oS7Xm1qjnquaWuqv3DA7B2f0trf76d+krnxZWoGX0ZafgpHQFlbtxDrOFzH0xAUldE37teKnYTdDnAI2M53M5Uggi2xZcc6ka3D4pBTsOQt/KAyTUj2+PlW0fVAu5hDUOpcl0jOcZcGzj/IK4VpNmNjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719589200; c=relaxed/simple;
	bh=W8xTh+SD4YRaIeEhONA/PVIhSG1kSzsyRzYnA31kxVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r38A01dliwF+H6f3DIWhSrsTAZDHEmxYOnb9+Qd4DFIDGGLpistgP7SHOTBrmFvj5HkW5ZKreuQiA7HXKmYHJ0fR4/uZ4nrM6DXBGz80/CZFGFGaQ1yrPErJaSYWf8BzyxeGMHnNQpWMy54bvqDkbXpyJ9OvbUNJ/ypHfHYvqew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZOgCTSh; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52caebc6137so788177e87.0
        for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2024 08:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719589197; x=1720193997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8xTh+SD4YRaIeEhONA/PVIhSG1kSzsyRzYnA31kxVw=;
        b=JZOgCTShQUMxhTn6tS4eO/Z0DKv0Ssw1PFE7ZZyQsYChOM7479MhPRLZuOfOp3c+eX
         TvQ3yE9c/JBb11IAIDjHmgWvSGDtrlX9I7AZkbXBGa6Iu+nTDiVsHM3kTnNPio06o6na
         PALyaY8jqwNpp/Fa1ac1Om8D537yt9uOPb2MwL6qQ3t+qYD901pPAcKDjp0fcy3xdJfd
         AXkxapudtxy3zIHoB9MOjyY0k80jXIrBG+pon2i6hgcIjfKZZaovsnKj1nAsD41RNPSj
         eBsViaswIbyDVCEF3wUwTZfGY1LUYES4QIrE8ZFn2FTO1gVoVyHidDrTTlc5LEKyTHQM
         uthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719589197; x=1720193997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8xTh+SD4YRaIeEhONA/PVIhSG1kSzsyRzYnA31kxVw=;
        b=CuW53dVAKClGGfFUt3amoyAjyhGWxhPUxQBrcP3kvUJ7h+YBQly+enifZxkciZEeKo
         QNV5v/Lm3nP5vKr40e7E+9v3l5ediYF26MCSXlkqxuKNRZ1Uex8zt0mEq7daaX+7geq0
         0yPoM/Wi53HK5BZEUtmagAZKB8fiet24Epvd99eqJL/gQ/a09k1SdorZ3pVev03gIzZu
         E+A9kEd+cOMXrsYGmSvzWJiYMR80Y34HRVEQs77N4yICGkaj0iewv3jl0cIE1cUjwn/v
         AUxsupLt1t+MqhJjfIPhQr2PuolsLD5JX9K6IN8Sr91tg73JhywOudmActe6l4autlkY
         GWkg==
X-Forwarded-Encrypted: i=1; AJvYcCVb4vkTvGm/mTR/Ot1OZvvZ4XC1nRjp/dMbR+BmD2GbS6zGYQhnqvtaGvAewrDjf9JCVK4iiwpvJnLjBQLs/oIPvHA5vEevFk4k
X-Gm-Message-State: AOJu0YwuWp2Sd5eTOJ1twwNSF1Xpm9JVuk7ZxTCATbtA/ST610De3aAy
	w9djnb5z4QO7GTa2DNk1lNAHIgN9QHOINlNe1OjHNFuNAUDRL6gxLTo01Vusd1DUX2SH4BShjrb
	FJDv4Y9/tfFGDYmGLTEoTB5Mu/XE=
X-Google-Smtp-Source: AGHT+IGzo7VlZM2A0SVwBMwjDFW3TvoZffvVh/F0uBb39XEK9cF/t6OoFswGsgKztd5v6Jx65ja+eUkPSmGKEYX/+HY=
X-Received: by 2002:a05:6512:4884:b0:52c:d657:8322 with SMTP id
 2adb3069b0e04-52ce1834ff8mr9943525e87.23.1719589196349; Fri, 28 Jun 2024
 08:39:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a306a653-b6cf-41e4-875f-6c520569b1fdn@googlegroups.com>
In-Reply-To: <a306a653-b6cf-41e4-875f-6c520569b1fdn@googlegroups.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 28 Jun 2024 17:39:45 +0200
Message-ID: <CA+fCnZdZ96yW5tRfm-c1qXWfmNrVg9J1Yb779Ryht6M9v9FQbQ@mail.gmail.com>
Subject: Remote wake up in gadget drivers
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Darrion Ramos <darrionramos@gmail.com>, USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(syzkaller to bcc)

Hi Alan,

I hope you could you clarify some things wrt the remote wake up
support in gadget drivers.

Please see the Darrion's message first:

On Fri, Jun 28, 2024 at 5:34=E2=80=AFAM Darrion Ramos <darrionramos@gmail.c=
om> wrote:
>
> Additionally, we have been looking into the raw_gadget and have noticed t=
hat the keyboard example (both a physical instance on a raspberry pi and th=
e virtual instance) do not wakeup the host device from suspend. It seems th=
at the emulated device does not communicate to the host that it is a wakeup=
 capable device. The /sys/bus/devices/.../power directory for the respectiv=
e udc is missing the wakeup files that would enable this. From my research =
on this I only found that the usb_gadget struct for the device needs to hav=
e the wakeup_capable flag set for the host to recognize the device as a rem=
ote wakeup source. I have printed the value during the gadget_bind and it s=
eems to be set so I am not sure what else could be causing the host to not =
have the device recognized for remote wakeup. If anybody has any ideas on w=
hat needs to be modified in the raw_gadget or any resources for looking int=
o it more it would be greatly appreciated, thanks!

I assume that to take advantage of remote wake up, the device needs to
first of all set the USB_DEVICE_REMOTE_WAKEUP bit in bmAttributes.

But then, is the wake up supposed to be initiated through the gadget
driver or through the UDC sysfs files as the ones that Darrion
mentioned?

For the former case, I assume that adding a new ioctl to Raw Gadget
that calls usb_gadget_wakeup() would be a way to support this?

AFAICS, only the g_zero gadget driver calls usb_gadget_wakeup(). Do
the other gadget drivers just have no support for remote wake up?

Thank you!

