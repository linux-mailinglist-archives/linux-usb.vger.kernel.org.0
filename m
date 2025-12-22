Return-Path: <linux-usb+bounces-31690-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F200BCD72C5
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 22:04:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77697302E167
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 21:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902E632A3FD;
	Mon, 22 Dec 2025 21:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVgISnRg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A87A27B4FA
	for <linux-usb@vger.kernel.org>; Mon, 22 Dec 2025 21:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766437438; cv=none; b=tD60JG1dauWiMDS3lMW7+Xulrt/iF02IwM2bNy6GMOVCEueJ9F6+HnhnGqXYO7Op3Up9QPescODE3zJDe1MdtZo2nO/sGAVeaxbHafGexFzqlMWCFeZ0ksfCMD0k7eH+f4PbrN56vJUy8gQK59T5rNM+jh4fNizEKdFaEW/rF0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766437438; c=relaxed/simple;
	bh=ynD3arwby6V/KqV7hrOczp4BwDvjE//j21Lgcvm7R4I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jXWtJcA+s7adWeBnldFg4XlkgBqIiv0ieF1G+WTlsODACHDhLMJEEH0wZAwZO1kTEYIwt/ZKBVifRxkGYA4zxo2LqsPf2H6FVDTPNE7+LFusGvQAEyMlfBJ2SfV7aFQlJX/s/vuVLJo0TF4ZswP10vb9iXkwno/QJ/by00lycuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVgISnRg; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b713c7096f9so717079866b.3
        for <linux-usb@vger.kernel.org>; Mon, 22 Dec 2025 13:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766437435; x=1767042235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqrZhz5hNHuUJVwMsRd92pz7dsqODXSfwgpNROedcTU=;
        b=nVgISnRgN9b/3Sv9PkOAcZv6n0UalbM5KMjrM+3Q/AnZhJGfJwPPxjJotkvd2Hyqv8
         pyaP/rlwpila1KO+/H4OWCnEIer0mDNCmLFJVxFVI9HhEcoo1/sN1KSsAtt6led2HYw5
         JHQ7rThWPeoR/qai98l9vS/rA51PSleQhORBDAKZxhWzZz/j/SIdd0d2PAbAror1BPs3
         rLeg94Tm+Z7j2/uuEO8H0W0Hfxy4rQOF9bue4mXdp7bJ8QxXpEhg3En8Apb2wZd7tIWy
         UrKJVe7i6Er2kMfJwm1ej59GFYYZdLxILFL5m3o9EKdXH+WHPnIcN8EMtKogpqnSoEeV
         FBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766437435; x=1767042235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RqrZhz5hNHuUJVwMsRd92pz7dsqODXSfwgpNROedcTU=;
        b=K2UVwmyMYvViwBSHL/Lhg+S7FHzFsr7EYn7BgdYuXsUosZhy7jipGjVR9LNh4BAKDv
         Cano3e29bgC9UZfpPofhU2FT9P/Bd7uIzzyoT/gQQEJRoTz1i0DusJOGDX+qGwls7lGB
         HoiU5TnR2Tox9wAFeYvvnTOMa2n3q4/2FMZqQUQNHDcxE5tDPVjjNGnMvU5Iq4Cd/lHN
         yTwOAuMli6NhXGZkbQYpwpaHwP7krMcR9nyolsfx+jWYjszyr6xcKgC9AfayGbIoPpj7
         7Vl0XU5x0r6w/paEDk6lbBmUY4sIpXLEWCa1YElfm9/tzw7z+Gb0iEWT+d6cvkyw7db+
         T6nA==
X-Forwarded-Encrypted: i=1; AJvYcCUX4ILBnbPBja69qUPwOzDCiRqfh3I/3zkB/u9/Z4OrQpL98KMAfAOyYqgS74V7sZdc+4Y9lvd2W70=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzin1dQbmVmUgyHY3Unr9W7jRd8AAJ2xnUieHimqW09ZyH091z+
	dGHLVW0OaiToeAnWqXE/oXFhQlXf7AmQri4KwYwh0gV+jOm54fHBpONg
X-Gm-Gg: AY/fxX6NeIfG6q5G1jpp/qLtA04ap4bV5TmjulMyR05Ixy4IBAQOTfEa/8p1xkFnTwy
	vyP346W1aqdSo/lNhZIKRTYEN9rhYsxtu+JC83OMcue3drzsKBLHdX2VSMEpKKmuoVFu4z3YUtU
	fbhOMl7GFjXMMT5Lu/VFDJzy3Y6056MftNAQSnbJlD9W87LvP6s5ziq0smOLtCAupqRA7OKUGUX
	qFLT7G53UeJbADeOwqdYg6IEblR3vOVLDJEVOkfBXzM6kuF5TMPChXagH1D37GYa1oGTXXcsYEa
	pksvGiGbNHi2PVDw1STA2JstN+rM7xoCiZT/ZeMSkROaNEVuxmHPvxUY87ydw6cOYs7xWvOZPen
	RRBb2pORdf6aYspC/Pb+sL8kSUShRx3goP+UOVaiEC4UV4hZXLMkN+ALyiil4Vp4sZ0fAxjthhl
	IkePUutzvcTauFkBHsrR18aSM=
X-Google-Smtp-Source: AGHT+IFlKlJMROFShWbrbuI31GpPfSCzU+aaDYmWnKkz/wmMSUjnoBOc/p0pmuc4IdWv02MlaTuUSg==
X-Received: by 2002:a17:907:3e1c:b0:b70:af93:b32d with SMTP id a640c23a62f3a-b80371db10fmr1277984866b.53.1766437434508;
        Mon, 22 Dec 2025 13:03:54 -0800 (PST)
Received: from foxbook (bfd193.neoplus.adsl.tpnet.pl. [83.28.41.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de1421sm1198821166b.41.2025.12.22.13.03.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 22 Dec 2025 13:03:54 -0800 (PST)
Date: Mon, 22 Dec 2025 22:03:49 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, Mathias Nyman
 <mathias.nyman@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>,
 Sarah Sharp <sarah.a.sharp@linux.intel.com>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: xhci: check Null pointer in segment alloc
Message-ID: <20251222220349.2d6c1a43.michal.pecio@gmail.com>
In-Reply-To: <38822950-6d69-4ad6-be28-fb8f328c8ae5@rowland.harvard.edu>
References: <TYUPR06MB6217F5AA7DA1E43A567CBA04D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<4935bdf5-4d36-45c3-9bcd-9d14606dd54e@linux.intel.com>
	<TYUPR06MB6217AC2CE5431DC9B3956FE7D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<20251220141510.1bc1ef19.michal.pecio@gmail.com>
	<20251222064252.GA1196800@google.com>
	<2025122253-stopper-tweed-6e68@gregkh>
	<20251222085543.4d7430d5.michal.pecio@gmail.com>
	<TYUPR06MB6217CB438F21763401A93E6ED2B4A@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<eb5715b5-613a-4610-9852-1a6ae67b4153@rowland.harvard.edu>
	<20251222174934.4c9b62d2.michal.pecio@gmail.com>
	<38822950-6d69-4ad6-be28-fb8f328c8ae5@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 22 Dec 2025 12:03:45 -0500, Alan Stern wrote:
> There's not supposed to be an inappropriate time for doing an 
> autoresume.

> By the time the sound device's resume routine runs, the HC should be 
> fully resumed.

OK, if "should" means "supposed to" then somebody needs to check it.
Is this the HCD_FLAG_HW_ACCESSIBLE flag by any chance?

I see that devices recursively call bus_resume() before resuming, and
this fails with -ESHUTDOWN if the flag is unset, which seems to prevent
device resume from progressing further and crashing. Is this what is
meant to happen in such case?

So I guess it's not happening because xhci_resume() sets this flag
right away and then it may drop the lock and start deallocating memory
to reset everything. So we can "successfully" complete bus_resume()
and allow USB devices to resume while HC resume is still in progress.

Looks dodgy and I suspect this is the bug.

