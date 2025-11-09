Return-Path: <linux-usb+bounces-30237-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0376BC448E5
	for <lists+linux-usb@lfdr.de>; Sun, 09 Nov 2025 23:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C20A118824A1
	for <lists+linux-usb@lfdr.de>; Sun,  9 Nov 2025 22:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8D82594B9;
	Sun,  9 Nov 2025 22:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JA6qkxFT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF2E1C84DE
	for <linux-usb@vger.kernel.org>; Sun,  9 Nov 2025 22:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762726670; cv=none; b=tauSkHl+MTEzXa5iC3yu5+YhXk2vJQ+LHApgEYNKniWc84dWWCGudbkpJaR5T7AjYzdJVu135vZKZaClwIL+Sq5y0e+d0NYvxD1N3bhoqUZvO30abTP0eJ6tbmWwuQyy3nQd3WFGJJUcllpQ9I5eBws2fj6WeOTyPsuD2VZG3eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762726670; c=relaxed/simple;
	bh=cog+plnLAc1OzupY6f7DUiCDKJQxXb3pUQncn/D3jNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SzLNsAG76xP29Y89HnnF2KIql7Ev/CrAlkehB9x3/q/miLpfnBPaskJA9Hoplv2oDjKdMTiTIY2puCd9AWDQ3YXaj2NFQeOFlux+Ej43gQ8JZieHHIjxhL9Hx2myikFtvkN6ip55GZtn+sxWWDkL3S2Fs2wLmsDKRI7hYYoWfRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JA6qkxFT; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so349037f8f.1
        for <linux-usb@vger.kernel.org>; Sun, 09 Nov 2025 14:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762726667; x=1763331467; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=odAzrvgJlxit7MCRr+1N+P/+/Kr1jd9GT/R71SeFP8A=;
        b=JA6qkxFTKXY2l9jvjH7oGa9fNKX+AuMvZWTm5QAEJYjsNwygBBmWjhMy4mgYcSo3tQ
         9Gr9CyWtzjFKvKy5RFxXz2Xp1Kt3PDPi38Ezm/YOPs2l3ibLyFki7Cf1boi6yEOolzDZ
         HVOX+qZUpuK0jBt4ZYv6/txfmXlE/O+M8YNHSMG9CoFy96/wi7zl3jdLQxCIP7MVdOuK
         YqKfU5Sph8/YJybS/GEWoLYnxOxNsHdPTu+4oUReeEJliZKajoPA64FfLaQx8KUKBpIE
         vJKV9uimQP1Xfe9Yw5YWJU5eKpTwjiDNNeFeM3dPKl1MBDgNU1Z1vSFv51Rx3tKnqtxw
         CWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762726667; x=1763331467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odAzrvgJlxit7MCRr+1N+P/+/Kr1jd9GT/R71SeFP8A=;
        b=alg4h/Lw6eOJKbx61/huqCKi5AM7dov6fRHApG+HkFvP+agtybXiQxjJ4oSwaOedHK
         8Bxd9Bz611l/pChsQbAZyHdeTW+iO19SvcPjLrBzeYlxmWtp1mhlHeqDJoXT/aDav/RI
         oXkam374J1tL6rj2TBu5zaM/Eo+c+/1GSFoTbalM1HuGhHl6R+U28AauyFRgDmpZMeQZ
         uFSa6q8CtvpwzAsHYigtPlB9uF1ZcICpv/4491zg2iQAQDz+BGnUOM7hApUojvPBWn3O
         wUeFK5iPXF5h0JiE9WlH0RMKh3xEL2jAOa93asIQRKReiSGesno4M9oPcq2jMo8s8KxU
         FLVg==
X-Forwarded-Encrypted: i=1; AJvYcCVfuF5RbArUQRxlthqeSfN8dS6Bzo01HPSZf8Bbh6pzz0gkrZ4lP3CX92CtF3c05uGj/zFv7UxXo1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmiFm/pzcaNfJZhAlbr9YtD87bSI7oL+v6J9+KXc4IwYl0aA8f
	nslYHLuVf7M+50+pcVtY7Bi0D5nQziwPy6M+vCRY/pDSBeUY6frTXbOqBEWC7M2tkuNoKEohKjF
	EEARidwzJehtFVhGDrf6Hj5GMA20l89k=
X-Gm-Gg: ASbGncvPYdHjqLQ6Gvq+jF6EGOGZTwbXXJTcJjsps81D5Ndow8UPvFINYMBxo717r3y
	bEqUUklHzPgUtnIMV67nmaJNoXWuThX7XFkAGFjse4ia9ds51X1hUJfiJGxyu1MWKPfgWaSG//M
	xK380nQgpzXy/XesCrLXh0Bks9bEcQHKBev9kqXWmITf2CHv7WZzONLJd+Bn+R6F5LMaOsZe8Mw
	dYF0r4V4UIN/HAuKn00eSqk2uMk1q5P8/1eE5cOC8X0cXVQryuWDmCVTon1UhzBK5rUBhMJ5aAa
	NAmwEtdWarOj+ZJHwl0piRACoqrwvFQsRwrjip6ezAJIMTBJ2XkSeDFO3ZOBuQ0z
X-Google-Smtp-Source: AGHT+IHyEi6krK8bsOLMIpGHI6feBuhQOSb0Sqa/68tmtoo0rcCiycgH9KXbJpuoDZwqm09I4Au0xtJ+hhJRMzuWnUE=
X-Received: by 2002:a5d:5c89:0:b0:426:f9d3:2feb with SMTP id
 ffacd0b85a97d-42b2c67f15dmr6041693f8f.23.1762726666711; Sun, 09 Nov 2025
 14:17:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3eb2564d-5008-434e-9698-99b0cbe4d1cc@cosmicgizmosystems.com>
 <CALvgqECkMdntW2He8C7EcvOtCL-PpiXM9xNXWHzGtgimDxezHA@mail.gmail.com>
 <d7e888a6-6a65-40c1-84af-058b97ca0178@rowland.harvard.edu>
 <CALvgqED=rBkNYGkFdOXjUi1g_vbLac5Z38Z9xCRfpF-Vmy4Mww@mail.gmail.com>
 <c5c863f0-1c68-4d49-ba9b-b55c0f71d30c@rowland.harvard.edu>
 <CALvgqEAo8-MhE3ievoDkq4AOxRZ2E52kcko+GxYyf+WZE2H0=g@mail.gmail.com>
 <20251109092450.693bcbe5.michal.pecio@gmail.com> <CALvgqEC1EpJy58LhppgLYkCyaZL+qv34b8PmvTvJV8DYfp=gzA@mail.gmail.com>
 <25f2419a-ee91-41eb-9446-87d238b4c7c4@rowland.harvard.edu>
 <CALvgqEBu_RzQYRSJnbu58XZt5wHX6PRD8i-J7Tovh7+KuhOyag@mail.gmail.com> <6999b5b2-a242-432e-8100-5d8ee58bcae8@rowland.harvard.edu>
In-Reply-To: <6999b5b2-a242-432e-8100-5d8ee58bcae8@rowland.harvard.edu>
From: The-Luga <lugathe2@gmail.com>
Date: Sun, 9 Nov 2025 19:17:35 -0300
X-Gm-Features: AWmQ_bnoCAcGYMyEFT_HKZbAfykjsQXfJKjI_EDQoCmKIA1vpCjgpOJj_zVf88E
Message-ID: <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Michal Pecio <michal.pecio@gmail.com>, Terry Junge <linuxsound@cosmicgizmosystems.com>, 
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> But never mind that.  Try using the usbhid-dump program instead of
> lsusb.  usbhid-dump does not require you to unbind anything or change
> bConfigurationValue, so it's easier to use anyway.

>sudo usbhid-dump -d 2d99:a101
003:002:003:DESCRIPTOR         1762723663.045959
06 13 FF 09 01 A1 01 15 00 26 FF 00 85 06 09 00
75 08 95 3D 91 02 85 07 09 00 75 08 95 3D 81 02
C0 06 14 FF 09 01 A1 01 15 00 26 FF 00 85 2E 09
00 75 08 95 3F 91 02 85 2F 09 00 75 08 95 3F 81
02 C0

003:002:002:DESCRIPTOR         1762723663.048968
05 0C 09 01 A1 01 15 00 25 01 09 E9 09 EA 09 E2
09 CD 09 B5 09 B6 09 B3 09 B7 75 01 95 08 81 42
C0

