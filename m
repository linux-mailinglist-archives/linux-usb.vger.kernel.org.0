Return-Path: <linux-usb+bounces-31900-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A107CF27EF
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 09:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65B6D30517EB
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 08:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EC12D9EFF;
	Mon,  5 Jan 2026 08:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="YlxmWa/H"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1018E1EEA55
	for <linux-usb@vger.kernel.org>; Mon,  5 Jan 2026 08:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767602353; cv=none; b=piDZVTIZbT8gAgnG8NlnS1NxZnHZIaFlwdS47eEromSlC/gdVjCjyZxrovBCUb3IfYU2OF2FIdoQZr9LO3LT3AHor/qlSqBQUXfMbZtmpuTXIAAoEENpZ4MJwShD94a4j8B8Gg3C/Df1xhC7rbek+4V+TOzI+a1N7yr6o272Xrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767602353; c=relaxed/simple;
	bh=UcLdHcEUUxspfAh1ahdBBitcr9+ZQeZG2m7rL2EVDFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nljXylVEEAMquUxuEmeq1WJlm0sFIkHF6pzlmdESQBu+l690IpQrcDZumXut/I4xpve/DTXJpGj1iJ7BoZLkOe87HWCf7oJ+DZncCcHhcs5dAFIVsobsBAnBtc1DuOZaUFgXfaCKthmHvZZugnwpgslzEAgpCUENBtFwTAMwxxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=YlxmWa/H; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b713c7096f9so2185341766b.3
        for <linux-usb@vger.kernel.org>; Mon, 05 Jan 2026 00:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767602350; x=1768207150; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8TxlOhxGTQLr4k5AxaGAg2GK3aGvHdvQdZ/a9Zb3F7g=;
        b=YlxmWa/HDQjBqk8sY1U//FX73g2DfV8YSt996HyuBUtei1A4u8xYlNR60kS1hXfHdL
         xxoqGybn2KTawGVqTj6hxoIwHAaeZrXTK4dmEpRuqfpG5t+nli6wKjavjbnEk4WopUGx
         McCvguR+wFAFJ30pkmpw5Cf2LCBcfqcj3CtrEZZgB6NoWCIYqw2WFar5985aH4qPMfYL
         XeJpFqZoS3nrQH6J97Ro8isQZCbdvevXKazb1m7ArNejw+D65Yxb1nh29fKEdNqqNPy9
         0qsS5fKPW/j2JokW0EYvbQjurcOTFHaSNdePsQ88fY+bdshaJaJQPufg9uo0RAIB2sp3
         tr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767602350; x=1768207150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TxlOhxGTQLr4k5AxaGAg2GK3aGvHdvQdZ/a9Zb3F7g=;
        b=Ky+3p9Tzt/+GdGJidhF+vgvyeBY6daHVSWl51lc8cd4fXHXZbGn5dtOJqcCJ/uQNLd
         skNpiXCAfKBmTOiooF9c4z1sFmhDNDL2ybdDW3HfnJaqQ7GWrHOZle6oIbQnadU1qDwK
         VJ+5Km6yof1PaLJzms0hucvkKraGOrWmMFjKUeSz3r3Y8ykAFpoJNdTowzTJYASyDd/W
         PljaS0pb0kJPifUOMgjkjyGlBY+237GFSRVLJ2YlOF3ng9xZG4WxxEFpGtY0pkEptTqR
         PVJt0pe2ZweVHnAN6sWUyeKNrCtLT74ppIE+wiEY1z+mR19KBogKaStTW81TGklvKNYk
         8dDw==
X-Forwarded-Encrypted: i=1; AJvYcCWISU4M5bsjVrgGgchi59JdMMxFDsHIGpX5WBL2frzgVCQHvgpmmys6Zrt1l3iJRfCzwUaA5I5FX/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL996DnJOvabAYYrzOpWM+7Fy6l7IxBslbuwMkcStVWi6VYL5N
	1MnpPapES9J7qWEyeO6+XbL0R4NTwIvmmurUWiK9CHAl9Q5NTKjKWl2iaa1sCG4QdA2ip7zvTHg
	pyIUaGeaJ3gHk6tXzS7Mj2H7BgZRlhXw=
X-Gm-Gg: AY/fxX4vdGvUai/8JQlMqip03/9xaC+dFDeckHQ96yGh7Ft+I2YqdvFlbL1uzlT5iDP
	qtY4GPoht0NrQD9oHp4X/spXHsL1JPW5D3B53CVQdRfP5yKdEzd9CtriU6H9blRBmDEJexJ6vlL
	whmkUX6TJlU/yrqdksCvheqoa8czxzlLFfClafKrsGCbUNSJkHHM/9uECG2ZPDsM1a2ektZ5h+m
	eG8sCziHcZ8Qi2hF7LW2GRRKMcH1DEQsf0HZQ7pjxQypLdrpATU/S6RE2mbYTnkO1TmLxFIGoI9
	eGsH3PhfKQdOYQnrDuWWIUgUJg==
X-Google-Smtp-Source: AGHT+IFr0JBtzxVQnXH06V4yl+WbGy32WaVnJ+AQf1gjM8b0HSOTsX4VV/HZjMLXyg9k4auxprW4Se9eOZHisZrnBhM=
X-Received: by 2002:a17:907:971e:b0:b83:288a:2bce with SMTP id
 a640c23a62f3a-b83288a314amr3001061366b.24.1767602349966; Mon, 05 Jan 2026
 00:39:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEhB=Bt13wr1+cc1rfzwPxnEEuawMgTew=RJic2FsVb=Gccm+A@mail.gmail.com>
 <2026010533-swiftness-character-1cc3@gregkh>
In-Reply-To: <2026010533-swiftness-character-1cc3@gregkh>
From: Marco Schuschnig <m.schuster91@googlemail.com>
Date: Mon, 5 Jan 2026 09:38:58 +0100
X-Gm-Features: AQt7F2p3AfV7eN60aT0PQcPOGsLSy9ojADPya5VdSReon7mtQr9GFY0EE7icRpA
Message-ID: <CAEhB=Bs6zUWx=2igGEbf3mKDWbRu47St2yJ9zjsCX7v1o_qHXA@mail.gmail.com>
Subject: Re: usbip: Kernel oops when trying to bind devices from Windows client
To: Greg KH <gregkh@linuxfoundation.org>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

thanks for the answer. Sorry, I mistyped - it's 6.*12*.47, Raspberry
Pi's latest official package which should be a Linux LTS version as
well. Recompiling the kernel with a patch should be pretty
straightforward, but I'll try if I can build, run and test with a
current stable kernel for the Pi, not sure how far Raspberry Pi and
then Debian diverge from upstream.

Kind regards
Marco

Am Mo., 5. Jan. 2026 um 09:08 Uhr schrieb Greg KH <gregkh@linuxfoundation.org>:
>
> On Mon, Jan 05, 2026 at 12:13:01AM +0100, Marco Schuschnig wrote:
> > Hello all,
> >
> > I am trying to get usbip working with a Raspberry Pi Zero 2 W
> > (Raspberry Pi OS / Debian Trixie, kernel 6.2.47) as host and a Windows
> > 10 machine as client (using usbip-win2 0.9.7.3). The device to be
> > shared is a "145f:0276 Trust GXT 165 Gaming Mouse".
>
> That is a very old, and obsolete kernel version, one of which we really
> don't know anything about anymore, sorry (there is no 6.2.47 kernel
> release).  I would contact whomever is supporting / creating that kernel
> image and ask them for help with this as even if we can point you at a
> fix, you'll have to get it updated into that tree, right?
>
> sorry,
>
> greg k-h

