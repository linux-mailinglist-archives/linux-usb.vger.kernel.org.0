Return-Path: <linux-usb+bounces-31962-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF677CFB24D
	for <lists+linux-usb@lfdr.de>; Tue, 06 Jan 2026 22:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D8BE305577B
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jan 2026 21:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A0F36C589;
	Tue,  6 Jan 2026 17:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Im296Mr4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E41936C0C9
	for <linux-usb@vger.kernel.org>; Tue,  6 Jan 2026 17:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767722291; cv=none; b=VfG2PJUbYro7nB2xRt2zwNgW9V5bpGBaluAQUPv6rhK8147pmII3ENJkhl3RKKY1LTWaPX7hFHT4J/iEHQ+7zOm6Hyh6S+hE+oIg00IK9JQdTmiyJxgF7iAXBRLco5nrV3f9kne/LAw4mu1C3QA28sfZxYZ+EZjjk1b0lWfao8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767722291; c=relaxed/simple;
	bh=sYjSxYCu/aeFF2uzL2zupbJaVXhaE7oFYU0EcRvUgUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VNUUD8leTjvhrH1yW3yLEbVUtdO5LCRBj8POxB+TUtBYpw+DwWVFPPJVPvs8oXvu+0hmLv6AeFZ0jVSx0/Bc7oOeXIcpfvyjzQMqSN98Jb2gPnFFUfzp9g4bEu2j+fU4hTXDP07SNBbHA/D4oi12jGOaJCY7y18v33enU8qLvP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Im296Mr4; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34ccbf37205so941408a91.2
        for <linux-usb@vger.kernel.org>; Tue, 06 Jan 2026 09:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767722287; x=1768327087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjJbFOSftvMLvvpKm9dE/503wIskizyk1YJT+an01s0=;
        b=Im296Mr4ZQ5IqPSUA+4cdh1Bh6h15XolCaQpFxyVYfsdZxM+Gg/2d/ffCYSWyg3SQu
         jk3Pci9J253bUBCxHmklN7gdTlqbhljtKwHUiyyh8zC0F6CfI8+I8Xd5Srcx+f6OEYyA
         1MCDdulJu2CQzKrpymO5g69s6sMtuM1ZEYLYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767722287; x=1768327087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OjJbFOSftvMLvvpKm9dE/503wIskizyk1YJT+an01s0=;
        b=iNt2v+M1KupuaQPGRTv8It8nVFXX45kqBpU2zAz7qfIwKon8MznxBy4zNDy7CCi4hE
         y1wjlScCWJFLsX7ZB5dHysFsI4fk0dKTB3HXyiJK7niw3P5ZzIfbCMZbpKcvjUh5mgd2
         6d5BhuqCsNvZQBlz1kny0uaaSq48aVx9S4Q/ugnKgbTroprqsXBCubR7jTEZ1GbtblUc
         VS34D2p6GZBjCxp7tqv+cJ5BATgkN5gt80pbmJJ5+Tz5MofBh7UoHN8eC8XVr6RmWTxY
         81wadVT+V01n3m6mDe+dv78oEB9XTwIPVczZYOmg0xY/R/ynHVb9XHw0/Hgh4rC6pULu
         mdFA==
X-Forwarded-Encrypted: i=1; AJvYcCUsDfszQXpWJ1pXNS+Z7B8e6OZmKQ2JBfpjz0wGUTepYhJZwscQcI3+uMdP3Zk1bBg+VSYIYhsdhYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ1L0K48eoxrEDTutgHeELWE4S4HULuJ3QgydBibQ55cnh8RKQ
	+16CFED8X0+fsCQAsr8dwpLxfUhHc+4Y2dwhDGNt9SQnwHp5MehoClD+AQGQ+iYgZSiUlcxDtc0
	ngszfFz9yfdWl4tpvhU6PDWoLm1bNRD/VIri7nisM
X-Gm-Gg: AY/fxX5YktQ4Vqn2pMiodkQ6bp6og2R6js4sQ2NIebtSHo4lkXxr9RQs+v8cYxOq6Fz
	T7bkjVj1FnVEYLJRN5LUJ+stO7hPo8Qg25lR7DAMwJHBB+/8EY/rgv79v7kPV999Ng9a36lQf2G
	A2bkDMjVRLK+rbEco+obhpo5cDgx0mix91GxSRO7eNDRbPnk349IpT6bGTTyNttKDr960v4dBla
	DK0gzJBhjsnaOrN2gJ7Xb1GyDCHp1fYkXpOE2qMKEciUy/gqTeuwitw+PI+FrzbYNGm
X-Google-Smtp-Source: AGHT+IFIRJEgsmx5/rj5msO3wTpsUJJNojrdfIWUaCiIVAUq5JqhBwR7TOyl0agmyCarDW4gDk6TOTeJbwUjnfRJVSc=
X-Received: by 2002:a17:90b:58e7:b0:33f:ebc2:643 with SMTP id
 98e67ed59e1d1-34f5f2fb22dmr2880609a91.23.1767722287398; Tue, 06 Jan 2026
 09:58:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251228190604.2484082-1-rdunlap@infradead.org>
In-Reply-To: <20251228190604.2484082-1-rdunlap@infradead.org>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Tue, 6 Jan 2026 09:57:54 -0800
X-Gm-Features: AQt7F2rM3emWWcI2zAAG5vVznCBFxFT_-35xECx7gmaseEheD-WAj_O_CriXAJM
Message-ID: <CANFp7mUKoyhL1Qv6tSucsmy_sd90BXC6QeLDmjdpAnYSZ1nfHA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: ucsi: drop an unused Kconfig symbol
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Pavan Holla <pholla@chromium.org>, 
	=?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jameson Thies <jthies@google.com>, 
	Andrei Kuchynski <akuchynski@chromium.org>, chrome-platform@lists.linux.dev, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 28, 2025 at 11:06=E2=80=AFAM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
> EXTCON_TCSS_CROS_EC isn't used anywhere else in the kernel tree,
> so drop it from this Kconfig file.
>
> (unless it should be EXTCON_USBC_CROS_EC ?)

Yes, it should have been EXTCON_USBC_CROS_EC. This was eventually
deprecated in favor of using the Type-C connector class and the power
supply class.

Devices that support UCSI will not support the extcon driver (i.e. in
firmware) so removing this entirely for this driver is likely a safe
change.

>
> Fixes: f1a2241778d9 ("usb: typec: ucsi: Implement ChromeOS UCSI driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Pavan Holla <pholla@chromium.org>
> Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Cc: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jameson Thies <jthies@google.com>
> Cc: Andrei Kuchynski <akuchynski@chromium.org>
> Cc: chrome-platform@lists.linux.dev
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: linux-usb@vger.kernel.org
>
>  drivers/usb/typec/ucsi/Kconfig |    1 -
>  1 file changed, 1 deletion(-)
>
> --- linux-next-20251219.orig/drivers/usb/typec/ucsi/Kconfig
> +++ linux-next-20251219/drivers/usb/typec/ucsi/Kconfig
> @@ -73,7 +73,6 @@ config CROS_EC_UCSI
>         tristate "UCSI Driver for ChromeOS EC"
>         depends on MFD_CROS_EC_DEV
>         depends on CROS_USBPD_NOTIFY
> -       depends on !EXTCON_TCSS_CROS_EC
>         default MFD_CROS_EC_DEV
>         help
>           This driver enables UCSI support for a ChromeOS EC. The EC is

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

