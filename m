Return-Path: <linux-usb+bounces-31981-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 933B4CFD122
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 11:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E78E3074F46
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 10:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E55532E732;
	Wed,  7 Jan 2026 09:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WswTie/n"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A0432E72B
	for <linux-usb@vger.kernel.org>; Wed,  7 Jan 2026 09:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767779576; cv=none; b=M58gj83yI9QcxRKcm9TXyPfW1dwW+wh0t8grQ5aLj58qjVaInzDyp+aG3qEdQhBIzsrXo4teWDO6pJecPpSSyFV96gVsO9pSf1ZHleW8wFBzwEsjbU4aw9WDNA5mKXcq4WEdfobuXDCxQJlKeWpgpvbMUUvrmliUOBq/ZDwW3I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767779576; c=relaxed/simple;
	bh=rvvOv0vv9H8q++Ltdf0WVIDOuGmNQfGsyInkVBB65VM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TYLJh43yuwFXxhKBEzPmHG31Ko+TdrWAopPhEQ724v1I455lGJPV3Ma5jphWp4G/htX3rDfg0ts0kIwE7hGsrjKM+BxGZdGpEQP15GQfHkij3f8vcIew8XOosU0Hua8tjTkwmkMdQG4xGCmkgX5yo9U9zxA0aljgd13bjIRZMwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WswTie/n; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2abf5900cd5so1342890eec.1
        for <linux-usb@vger.kernel.org>; Wed, 07 Jan 2026 01:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767779570; x=1768384370; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rvvOv0vv9H8q++Ltdf0WVIDOuGmNQfGsyInkVBB65VM=;
        b=WswTie/n5RBFA0VsXfSj6Grz4pfH3N8bWz7h4XXYcQYM0vqU1QkjNe/l6SWrgFNX/H
         HqaQjv483NMUVuzWVxSwKLhasfeaF/eGNqEYH8mals3YX3Lj5fj8ubvcmykAx6hrRBlt
         sHSFw+yWhOdxMFDrtIvtpoUZc/tNO5+5jywWByOvTuEHuragievh59iIFtlwvtBuYZiY
         b7qJt16EnXBtugx8VgH+fb47WuJV7S1nATJ7Y3yua5IHepk1GkzvLEA/haDx7wMdCWZD
         E8j2hykGCKTWHFzHqpOzqTIF8ruDCe5I6xJMj+NP0f3xOEUVKnTIIOuilctYWHdJig7Y
         sANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779570; x=1768384370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvvOv0vv9H8q++Ltdf0WVIDOuGmNQfGsyInkVBB65VM=;
        b=ozG2Hdb2Nnp8q8iRqVZRhyzW4PKz7jRQZ9dtFZy+Iy9f8LdNDchT9ZRvAd/4sA7isk
         PnDWIDNVwG0AIq680Q1EkDh6BORSK51YWWOImT4hStKBZMWs/EK2U/4x8OYbCxJgAooz
         jfRQO/+bc9sNXR6QQdcCMVC4C/bhazMD70zjSmatN/m3HCuLIZJ6ubBztup8PZQZrck3
         raUkgRYsZM6kLTSj0Bht3JT4+m2sq5qD8ClledeT49fR0ECSPgjSSkgaZkoFNiNWdr02
         CPHGJCt0fbyb/cEPzuEybQg13DT+w7201SfiR+8s4nsqsOWKhnMmyTt4IOYvJ3pE1Nf1
         7psQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAy5GG5FMtjkD3LhbsnwjbBKpncQQyBf+ZPoJNTIbohDt0tXE4AhiYMmMni9n3HSLKJBHZbyEoJxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMD2QrOpoA045Tmmd+cKvGQ+jlzFvAXMroO9lwI0XJ4oEHGQv0
	DIZmWmJJnUFLfIf6/ORNjKd7VxG3FNOb1t8yVQ5an1ti6dytt5+TM9CwF4sFX3tDakrlxHe3Kn2
	XVS5/DAwrZhrmLbN4yr+cf8V1zo56N/hyw3OyzgY=
X-Gm-Gg: AY/fxX6NBuOKvIuzE/cblAYVikra6oairIwPnh8HEUMIbxTBuIKggjuFnIWI04RXltI
	xNKj66Y+DbS+QPjQ9oeoeHK/H9pn9RLS2ssgFjabXsoSX1rc9EISfJucKLJVHZwa/m7jB7SDGXG
	7Fgir6/dw+W/ZxaYngdM8aHvdqO36Yll6n8ojRyRJw9Tgn9P13dFxDNvmVt22iLeXjB6VZxn7Q9
	01XWzA3dmU2PwPgzhCzGXbalwD5YakHkYCHGNZG/Hf6IfYJmNQrW1m5ayx872gzPOdwrfA=
X-Google-Smtp-Source: AGHT+IEsT6AYnql0T7zlCNvOahx8BTYyJ+IW0sH1UvnJzbYCCmPWp7Cct2vMxCYT86QC+/C8HxYvBejoGMBDAF+WblE=
X-Received: by 2002:a05:7300:5781:b0:2ae:5e6b:dc41 with SMTP id
 5a478bee46e88-2b17d21b748mr1497359eec.14.1767779570503; Wed, 07 Jan 2026
 01:52:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260103083232.9510-1-linux.amoon@gmail.com> <20260103083232.9510-4-linux.amoon@gmail.com>
 <6f30a01c-8fc4-4368-88ef-7c513c505515@kernel.org>
In-Reply-To: <6f30a01c-8fc4-4368-88ef-7c513c505515@kernel.org>
From: =?UTF-8?B?5byg5rC45rOi?= <giraffesnn123@gmail.com>
Date: Wed, 7 Jan 2026 17:52:38 +0800
X-Gm-Features: AQt7F2p0-kEhpv052gHNNvlDi9s6r7fu21_si4nAOG3q3nXtXMATV47Jwa2xpS8
Message-ID: <CACpCAL0GLMV-2p1tKAXe6R+N2c4YadH9vpEG3GdPoHTNTQSuow@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] usb: typec: fusb302: Switch to threaded interrupt handler
To: Hans de Goede <hansg@kernel.org>
Cc: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, FUKAUMI Naoki <naoki@radxa.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> Still ideally we would solve this in another way then
> switching to a threaded IRQ handler.
>
> As the commit message of the mei-vsc fix mentions
> the root cause of these errors is typically an interrupt
> chip driver which uses IRQF_NO_THREAD disabling the auto
> threading of all interrupt handlers in RT mode.
>
> So the first question here would be to see if that flag is
> used in the interrupt chip and if yes, is that flag really
> necessary ?
This is very similar to the issue addressed in commit 24b176d8827d
("drm/msm/dsi: Remove spurious IRQF_ONESHOT flag").
The IRQF_ONESHOT flag is preventing forced threading here.

In irq_setup_forced_threading(), the conversion to threaded interrupts
is explicitly skipped if any of the IRQF_NO_THREAD, IRQF_PERCPU,
or IRQF_ONESHOT flags are present. In this case, IRQF_ONESHOT
appears to be the reason.

Regards,
giraffesnn

