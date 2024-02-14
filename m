Return-Path: <linux-usb+bounces-6440-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E59085577C
	for <lists+linux-usb@lfdr.de>; Thu, 15 Feb 2024 00:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72D781C26620
	for <lists+linux-usb@lfdr.de>; Wed, 14 Feb 2024 23:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6858A1420C8;
	Wed, 14 Feb 2024 23:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OM9jhaoz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7562556E
	for <linux-usb@vger.kernel.org>; Wed, 14 Feb 2024 23:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707954682; cv=none; b=ANgmoVe31lVS9Y+2ctI3Zur6ZpWYfKnBbuOLJm1ODjQgeAWljnHKetXkZsxCpfREtUQgSJqls/0rQtcKwvTEfRHG83gTVJBjGGUPPWCAAyEPx3tBSFrDxzUj2dUydwMww3nG4kW3DyA/Km/y/LYl+2tNje3Ik1G3ydRUVZ7UlB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707954682; c=relaxed/simple;
	bh=gC+EHOPYgEnF4B4thgpejb8qEq5JPx1Zww7p4djo4U8=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eX/U2ih+Ln4uh21+JchetcDKxmXz57e/FPS24BjDWYYsGc6z5nRKSEJBOqddzrAYSujJd95MQFkgFlt7xOAeCP6MkmYYDItU0p/Vk9qnbL7aE6pVpAuBLsUchqkE5Gi+7OYvj9nAxc0+MlSb5V7wfuJWLQquWN6ei7J6CcjzSds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OM9jhaoz; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5116ec49365so342359e87.3
        for <linux-usb@vger.kernel.org>; Wed, 14 Feb 2024 15:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707954678; x=1708559478; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gC+EHOPYgEnF4B4thgpejb8qEq5JPx1Zww7p4djo4U8=;
        b=OM9jhaozeUM0qJdXcnYNfoZ5rOWPSyeUqfGlWFjFhhuUw+PFX71ToeEPbz3XF29S+i
         QJpWT9uDbkEJRy36Nxtcrp6Q/cpe26tKTXHvQJY3p+2enE+OIX84Afhks6re1yumjvZM
         DaVoJS0iLYfFeO9yS74w156tz+VGL/BwmeVCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707954678; x=1708559478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gC+EHOPYgEnF4B4thgpejb8qEq5JPx1Zww7p4djo4U8=;
        b=xEyY58ubSeZLjeWGXb7che6jlMI5LOn2DLzq+HOf9t1rJCgqHbZ0FAndERvln8DwlJ
         y7xtQN7AvJ/XqiManfndpMLes4kd3imWMCtQmJi+ZP3w7AW1chJjJ5rKo77E/2jy4oYV
         cOb5RGCdNiXNMNCJ0+ODpJj0O3n+gHLIcXhNTg1c+ogH+VeyS3RpZiaMOLaZDpfT08FJ
         Eg5mu2pndVd6HZjtt6bxzfWwlLwVKSJG54PurJhnQ/kDD8US+Feoz698lduFdAUR4a6+
         B9cufsPGm5lELmdq4UPPBPru8ljHMKBl6IuEU6tJtMiwE5JjOVW5gnfOgI/v563t/ImD
         5h2w==
X-Forwarded-Encrypted: i=1; AJvYcCWv27A1NP/90Q4qKk1u7iAMAKyQZlKuNJy4bvvB4TDCeLP8ZTtEs/DU42ZzM+8Z5GwELwZ28w3MMY2GwmGZduziARm0/gEzlspU
X-Gm-Message-State: AOJu0Yx23e2FPfOGrf1qoZrfPn8VeY3Lip6y4z7WqcsFQuUpgLqdblxX
	HsZ0BDpuSiDpNdiY7lDVbLemWXIBU7jQ+skLvT+8k5t/DasreeqQQL2xpMxRE0QpJTk7WUdsxyC
	M+3aNg0Gkf1fJt2UKe3WPkdJdlZeQot2w9cL/
X-Google-Smtp-Source: AGHT+IHY6HUhss7mHx1ExihADt6J1OI5zkXYcKo2xuLwjQ63JGNlMqWZ5oVvebM0eOWq56qXmv8DOgdu6dbCXc/ooo8=
X-Received: by 2002:a05:6512:3ca5:b0:511:87c6:3060 with SMTP id
 h37-20020a0565123ca500b0051187c63060mr321912lfv.12.1707954678054; Wed, 14 Feb
 2024 15:51:18 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Feb 2024 15:51:17 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAD=FV=UuunNnXJ0kAzRPVy0DX7Wv2eQOa-fMJQ-aKtaGnyQaQA@mail.gmail.com>
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-5-swboyd@chromium.org>
 <CAD=FV=UuunNnXJ0kAzRPVy0DX7Wv2eQOa-fMJQ-aKtaGnyQaQA@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 14 Feb 2024 15:51:17 -0800
Message-ID: <CAE-0n51b9=BJv6PMmsdLDT7tcgKT63qrqNknp-CQd5BOb1dhjA@mail.gmail.com>
Subject: Re: [PATCH 04/22] usb: core: Set connect_type of ports based on DT node
To: Doug Anderson <dianders@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Pin-yen Lin <treapking@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthias Kaehlcke <mka@chromium.org>, linux-usb@vger.kernel.org, 
	maciek swiech <drmasquatch@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Quoting Doug Anderson (2024-02-13 16:03:11)
> Hi,
>
> On Fri, Feb 9, 2024 at 11:09=E2=80=AFPM Stephen Boyd <swboyd@chromium.org=
> wrote:
> >
> > When a USB hub is described in DT, such as any device that matches the
> > onboard-hub driver, the connect_type is set to "unknown" or
> > USB_PORT_CONNECT_TYPE_UNKNOWN. This makes any device plugged into that
> > USB port report their 'removable' device attribute as "unknown". Improv=
e
> > the connect_type attribute for ports, and in turn the removable
> > attribute for USB devices, by looking for child devices with a reg
> > property or an OF graph when the device is described in DT.
> >
> > If the graph exists, endpoints that are connected to a remote node must
> > be something like a usb-{a,b,c}-connector compatible node, or an
> > intermediate node like a redriver, and not a hardwired USB device on th=
e
> > board. Set the connect_type to USB_PORT_CONNECT_TYPE_HOT_PLUG in this
> > case because the device is going to be plugged in. Set the connect_type
> > to USB_PORT_CONNECT_TYPE_HARD_WIRED if there's a child node for the por=
t
> > like 'device@2' for port2. Set the connect_type to USB_PORT_NOT_USED if
> > there isn't an endpoint or child node corresponding to the port number.
>
> The above sounds good, but then I look at patch #18 ("dt-bindings:
> chrome: Add binding for ChromeOS Pogo pin connector") and patch #22
> ("arm64: dts: qcom: sc7180-trogdor: Wire up USB and DP to
> usb-c-connectors") and it makes my Spidey Sense tingle.
>
> Specifically, I _think_ if a port is "hard wired" that can sometimes
> tell the system that the port is a bit more trusted. In the case of
> the "pogo" pins on detachables, though, I don't _think_ there's
> anything that prevents someone from making a "pogo to USB A port"
> adapter and then you could plug anything you wanted into the pogo
> port. If there's any extra trust given to these "internal" ports a
> nefarious attacker could presumably abuse that trust for the pogo
> pins.

The pogo pins on detachables are connected via the OF graph, so they are
only ever going to be either "not connected" or "hotplug". They can't
become "hard wired" because they're not a child node with a reg property
corresponding to the USB port.

>
> I have no idea if this is a realistic concern or not. I'm about 95%
> sure that hardwired "PCIe" ports get extra trust and get "deferred
> IOMMU flush" enabled and, in the case of PCIe, that actually is a real
> security hole. For USB, though, I think the system is more isolated by
> the USB host controller so I'm not sure that there is any extra trust
> given to "hard wired" ports. ...so maybe the answer here is to just
> ignore my rambling. ...or maybe the answer here is that everything is
> fine but patches #18 and #22 should be modified not to cause the pogo
> pins to be considered as "hard wired" since they really aren't...
>

Pogo pins should be considered hot plug with this patch series, but I
will double check that I didn't mess up that logic.

