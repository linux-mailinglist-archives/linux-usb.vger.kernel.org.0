Return-Path: <linux-usb+bounces-27877-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5917BB51842
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 15:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 610581C8315F
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 13:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803211FCCF8;
	Wed, 10 Sep 2025 13:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zIG72wR/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919DD200C2
	for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 13:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757512082; cv=none; b=hvA8GS4MCXSxJGLG5AuyHLpx09cR/RRKqTEL3rehxBN9VFma+FwmQFuWLZo2m9r1EtV/Q5AUlHoVb0sx7BdXmbk8reUIQZmul9bPMriSs90hD2mebpYEmoR3pfndClkCBz2q0zzjiBm//9bpomoBGTXiDgg8eWuG7Te42j9majw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757512082; c=relaxed/simple;
	bh=l55399HEZ0pWmrMTNzqhq7DwL05q2q97V6qIgu2UtHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lq3MgzYlfFas8IyzoO+XzaEZupXNSMEL9DN/0zuhtrOf9c0ZMDHsKKMUd/hIQWFnqEJNhkAB+jQVH7ZDyjyT5xe3RY0A48ipwdFnSGFHtFahHGuVpZNnGxaRogVx9DVXnqRiDwfNgvoaD+N0NeoSOs3J/Y9WzYwaK3s8D27xBLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zIG72wR/; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55f716e25d9so6523088e87.1
        for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 06:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757512079; x=1758116879; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9MHA3P5jjP24S5sHQDLlju8DZEkh4L3krlDwItz8Tg=;
        b=zIG72wR/3mWRxEy9jgPxfAolM5E97l4VzZ6maGPsY9RFmGwXAvrOOUVO0PT6avueXe
         IcsMJh4u6xXEgpS0TNzMSWDic0bakBX/VQ55Q2Q0l30r0EvaCnROJN3W6EL5t64lctkT
         pDNz54cmHMvOlg2FTAJZD0tVJDBqASFCYRTP9fhERBE/KuDRWf8JdrLFsH4L+/IcxWxL
         Nc7jyGQmZ1CYcGu2VXOBN1fXpJFecaNJrz3/PeRbw13l76Qj8UEaeDJ5qgCL18okCpKd
         HwtHVq5JwcjKSB009Qu0ay7szh2cojh8E/aOHFUBk7KLcb/WF2518SmXokMEjuFt8ZcG
         taXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757512079; x=1758116879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9MHA3P5jjP24S5sHQDLlju8DZEkh4L3krlDwItz8Tg=;
        b=PKzOOJ1pBzsTHl9jeE8uHO/3uzAnO8ulnK9w0AQLL3yeYkDY0/7vfieM4M7BD9FTwB
         r+EYtTvJSh0kqvLBqZ7/G6c1qUtS7R0AnI2I85Ud5qpeyV+Cbk6/eTZhmRFPdQW+L8fg
         zITBTqiHN992O/nkouMGyxZMspTkJKqlO7NmK69k65lQe4m9L2nDZXJG930cmoteiwBB
         Z+wEsjAokaNhYTJ5QURR0T/JjDRR78j+w4GYoRLJHssN2hXXe/xjnl+z8vavwTWKS0WK
         6vEXKoA70GZzudclMcFoCePgClZ5Mz8QlFGi57Amp6cEJ7fgJ+PybajmsU6FC2qOjYQ8
         36Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWkSRqLke0aEaysfiZqV/UvXQNX0qTgFDLJFlDV7gz6GQVN1cRCJiVDp1pV/hp27ak2m+HordrC17w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN4IpP38eTMmbddA5xYbaNompDZeCu4Ddv1NF8LQRPjUgpmVkF
	sgjxbtPItJq62wS2KBCgk1mL0kXjruTopB8emGTsiwQU1IWK/ebPoTFJ+x8hhbREZVryosd2h3O
	8lKo26F2QI0bGi3GrUpIxJQiWbKRuomNWu11Tlf1VnA==
X-Gm-Gg: ASbGncvSiEinnuCU6qFkX25k0Dpi6k9/gqvZ4nXyIsLM1zxNqAroApxFsqAgYWUjDH4
	68BP7F+XdOPj0B9Fzvzf8OQL0cHSuw70h3lm5KlgJMnHl9223ABNwIEPFjS/l9S58mcmtb3HPN+
	OJT5t6p6jv+erHZKEjAa1609ev8aJCxBz7GqVNcEUnPSmwJCWqfkLkdUsJfWzKvnbvx66gm9xzE
	i+qPtAzvZO8eSHQLtOPsouwhCpt9O6reOhrZX0=
X-Google-Smtp-Source: AGHT+IGobD71S4ulCfD7e099VapcYFvbZsSmJDdU8F6yEcLyA+pm2IA/CLsryqO4uF3A4RoTmMglsvNaQdWvJAY/0Zo=
X-Received: by 2002:a05:6512:b29:b0:55f:63af:90d4 with SMTP id
 2adb3069b0e04-5625f90edf9mr5390873e87.16.1757512078692; Wed, 10 Sep 2025
 06:47:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250907175056.47314-1-hansg@kernel.org> <2025091045-expel-fiction-299f@gregkh>
 <dbfe2464-394e-46fd-9e4d-7e41b62069e8@kernel.org>
In-Reply-To: <dbfe2464-394e-46fd-9e4d-7e41b62069e8@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 15:47:45 +0200
X-Gm-Features: Ac12FXwix3xWY2q_d3-WDM1fWOM-m28yns7dwXzZUlsWXTVu7yqIrJa81bRdhvQ
Message-ID: <CAMRc=MfnrTvphETXvLLoeFb_o4FuT3kY2a75JQ0XDXFtt2VHDw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] usb/gpio/i2c: Add Intel USBIO USB IO-expander drivers
To: Hans de Goede <hansg@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 3:36=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> Hi Greg,
>
> On 10-Sep-25 3:25 PM, Greg Kroah-Hartman wrote:
> > On Sun, Sep 07, 2025 at 07:50:53PM +0200, Hans de Goede wrote:
> >> Hi All,
> >>
> >> Here is v2 of the patch series to add support for the Intel USBIO USB
> >> IO-expander used by the MIPI cameras on various new (Meteor Lake and l=
ater)
> >> Intel laptops.
> >>
> >> Changes in v2:
> >> - Split usbio-bridge mutex into ctrl_mutex and bulk_mutex
> >> - Drop SPI support since this is not used on devices in the field
> >> - Rework disconnect handling to be more robust
> >> - Several different revisions need special casing add a quirks mechani=
sm
> >>   for this
> >> - Stop using stdint.h (uintX_t) types
> >> - Use __le16, __le32 type + cpu_to_le16() and friends for on wire word=
s
> >> - Properly check auxiliary_device_add() return value
> >> - Add a mutex to the GPIO driver to protect usbio_gpio_update_config()
> >>   calls, which read-modify-write banks[x].config, racing with each oth=
er
> >> - Adjust usbio_gpio_get() to have an int return value and propagate th=
e
> >>   usbio_control_msg() return value
> >> - Various (small) style fixes from Sakari's review of all 3 patches
> >>
> >> The first patch adds an USB bridge driver which registers auxbus child=
ren
> >> for the GPIO and I2C functions of the USBIO chip.
> >>
> >> The second and third patch add a GPIO resp. an I2C driver for the
> >> auxbus children using the IO functions exported by the USB bridge driv=
er.
> >>
> >> The second and third patch depend on the IO functions exported by
> >> the first patch. So to merge this we will need either an immutable tag=
 on
> >> the USB tree, or all 3 patches can be merged through the USB tree with
> >> acks from the GPIO and I2C subsystem maintainers.
> >
> > Either is fine with me, patch 1 looks good enough for me to queue it up
> > now.
>
> That is good news.
>
> > Let me know what you want me to do.
>
> I've done a v3 of just the GPIO patch since Bart had some review-comments
> there. Bart still had 2 more small remarks on the v3 GPIO patch. So I'm
> about to send out a v4 series (with just changes to the GPIO driver
> compared to this v2).
>
> I hope Bart will be happy with v4, so then Bart can let you know if
> he prefers an immutable tag, or wants you to merge the GPIO driver
> into usb-next.
>

Yes, an immutable branch with patch 1 would be the best approach.

Bart

> Once it is clear how to proceed with the GPIO driver I suggest that
> we get both of them merged and then wait for feedback on the I2C driver.
>
> Regards,
>
> Hans
>
>

