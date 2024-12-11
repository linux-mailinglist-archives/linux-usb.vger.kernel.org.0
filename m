Return-Path: <linux-usb+bounces-18410-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C3D9ED844
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 22:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94BF418866B0
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 21:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA181C3038;
	Wed, 11 Dec 2024 21:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AfrK1rhH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9A11D6DD8
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 21:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733951830; cv=none; b=m88gdChvd7n+/EGDWXm3LSXrcoWZBsyHEeLlFjblpB3oY/+1jvWrZmeMb57qAtD8h5n8N4uiCdvy3ZvJ3Jm7sMdecgXE+hKgbXgPTgN3TTmJMQuq3YBidGHitUozXS3EBFgVmUt13U3x2chlcbPCtE9oz+7WXplij69pfuBSux4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733951830; c=relaxed/simple;
	bh=Gd2Z3aLtq0yk3TJ1sI0ESwqS2vGsvt4ZlCI44gpExwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d2NVIlh7L4HJQwpgU/DHLQz4IJSP2+MIWVFBvDWneICqBSDoVT0ysfb+whQLdgVOM3l4j334j2O3B+tPKH03z1R/hdLDPuX87l0BnSE4zF+ILePH0Ge9vmS8/k57s1Zs+Qzd4snpJxojWe0TCxhkB2rUQoumiG4qzMCbtIWv3ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AfrK1rhH; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6efeb120f4dso43473907b3.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 13:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733951827; x=1734556627; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vbOAZlNnNpVSTQN+1o758lLTB1uimwZrSwxfkYzKt/0=;
        b=AfrK1rhHampRbVt5OBFKyDJglBG04ofcXtMw4u8c2IQ5LB7y5bQkckYfZ7OJHsfdnS
         hIKtFbs0wS+04pea01vBGAIWmek1G/iwQhhfbi8lguOEtOOLqFnnrhYglH9y7EkOSrR2
         hTKwDVVukTXnoxplYXAf82cavuOXWw8pO4itkPkt2VQHwlxXmBe26D9O7oHk4UZ0T1Rx
         5dtEkC/2G0RD2iC8AHEQgor1KG1ixRgcsNA6GYgpMezu1K8uIrkGC4L0aAUORSd+2vmz
         MyAXbfsB+nF53S/fJLK9w36vIkuMvJeULyNZhkvejmqgRM4TOynWYIBsYb57m802szzX
         pqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733951827; x=1734556627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbOAZlNnNpVSTQN+1o758lLTB1uimwZrSwxfkYzKt/0=;
        b=YUUgDIxSeAGEEn+XK+3b87ldXaXArwxLK15PVYZunZZqDj8nT+0aEm9GeJcVzyMQHE
         /y4lBqGpz19mWPfET/qbE8cmKIVnlzwEJB2ljb+EkdsDE0gRuCO6TysYl4/vK1B6Q9qs
         xaHDiEaBi4sbr+0hUC8VCSvmYa9/ebO1F2qp8ozO7egHSKzaHiMzQvrcf2uV9q86ACMQ
         aElQg2QDHGyTIRbvjN4ROlbiNqQTHrvWlWAfBwl6RT96mGBEwgFRRebFMYq/SujkNUAI
         Dt291Zs2KVfIfG9ePZgtFu1pbAorft+5VRumYka+kQZ0ZaLd1E/Auy5cEa3IV0KUNqCd
         1y6g==
X-Forwarded-Encrypted: i=1; AJvYcCXzvKyQynfXQpjx3T8YzyFi7SiwwYXEH8SCbO8oOErZV4Zp2yVc7bmNGyO7oOcmrtx2dtMdnQlmXpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx40BcXSkL4PuUaXhGfFU1VIYV/zCp7fRnUXo0CrRY42/N0iXxb
	Z+Chp+sho2e4TpTAJSM+WYrsDhem/O2WLUy1EWh9+V4OtqSimz6zFcqqdRiUyhiJnw95enqVcJ3
	Fu0iciYs7lsNlS655P1Jbd+0XaM0jbS3PUNtwJQ==
X-Gm-Gg: ASbGnctJa69MMZ8IcFr7lzVS2KrBHBldRKz9sjms+qxYaqiyv8sQ3SLcoDXhYDurwod
	vzGzB9jo8AdM6NCMYic7tyyNZxBb9NWZz740Z
X-Google-Smtp-Source: AGHT+IFfEcADkSKdG/yxS4NVADevkh5d06VtG5D2MymFrYSLQArMJkdl7zeaP7DPQ5MsRfbOG1YaN86DJzP4pureEqE=
X-Received: by 2002:a05:690c:6f10:b0:6ee:a89e:af3b with SMTP id
 00721157ae682-6f198a3ce6amr10757187b3.9.1733951827476; Wed, 11 Dec 2024
 13:17:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <yk3xidaisbd56yndaucax7otijjauqmm7lqm6q4q633kdawlqo@qaq27lwxmvwd>
 <gstohhcdnmnkszk4l2ikd5xiewtotgo5okia62paauj6zpaw7y@4wchyvoynm2p>
 <CAE-0n50z6MNa7WOsg-NU7k8BpFeJJyYfHX3ov6DsthLWauSNpA@mail.gmail.com>
 <hqmx7jtkvrwvb27n56hw7rpefhp37lhr3a5fawz7gsl76uuj5s@h7m6wpdhibkk>
 <CAE-0n50y1O2C47zOGJPmMjKXK_m6a=jhpEAP4nW+RymZbo2xyg@mail.gmail.com>
 <5kisfv22tgqwzjpxqrbx56ywr7l4r7pny3pl2r7crv4rijqbwk@azricdasttg7>
 <CAE-0n50Bxi2GfnxOmMwe-F+k5jMSiyAVPDb6K8pYm-i6hpJTOA@mail.gmail.com>
 <cartdeijkv6z23dgm7uif4lti3lahfqmuyxcmruzqbefhsp6yk@m6ocjhncs2ko>
 <CAE-0n51-QLLje0f7T4p3xK6Q-FRk4K0NUrVVm4cxkKoevuzktw@mail.gmail.com>
 <kidsjzklpxvvamct3glvoawavoi5mjuyh3on5kbtfp6gavwxxn@eack224zuqa3> <CAE-0n52F+cvVyXm8g8idN2eMfx4bpaEpWQRchr8=AO87N7E3fg@mail.gmail.com>
In-Reply-To: <CAE-0n52F+cvVyXm8g8idN2eMfx4bpaEpWQRchr8=AO87N7E3fg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 11 Dec 2024 23:16:56 +0200
Message-ID: <CAA8EJppVgw1Qb4kGY1Y-A3-KrinKfX2zGUuwMCY_-gG96fgocA@mail.gmail.com>
Subject: Re: [PATCH v4 15/18] dt-bindings: usb: Add ports to
 google,cros-ec-typec for DP altmode
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, devicetree@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Benson Leung <bleung@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	dri-devel@lists.freedesktop.org, Guenter Roeck <groeck@chromium.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lee Jones <lee@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Prashant Malani <pmalani@chromium.org>, 
	Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Ivan Orlov <ivan.orlov0322@gmail.com>, 
	linux-acpi@vger.kernel.org, linux-usb@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Dec 2024 at 23:11, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2024-12-05 10:47:08)
> > On Tue, Dec 03, 2024 at 03:50:58PM -0800, Stephen Boyd wrote:
> > >
> > > The easiest way to imagine this is that we took the usb-c-connector and
> > > jammed an HDMI dongle in there with some glue so that it can never be
> > > removed. There isn't any USB going there either because it can't be
> > > used. I suppose we can continue to describe this with an
> > > altmodes/displayport node but then add some compatible like
> > > "usb-c-hdmi-connector" or another property to the altmodes/displayport
> > > node like "type = hdmi" that signifies this is a connector that only
> > > outputs HDMI.
> >
> > Does that DP-to-HDMI bridge talk USB-C or just pure DP? In other words,
> > will it be properly discovered and handled if we just leave it as a
> > weird usb-c-connector (maybe with an additional annotation, we have
> > USB_PORT_CONNECT_TYPE_HARD_WIRED for USB ports, we might have something
> > similar for Type-C connectors).
>
> It is pure DP. Maybe we can have a google,cros-ec-usbc-hdmi compatible
> string here because this is a weird design.

Just google,cros-ec-hdmi for the corresponding connector?

-- 
With best wishes
Dmitry

