Return-Path: <linux-usb+bounces-14030-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A810595D808
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 22:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBF9B1C22FAA
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 20:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56271BA296;
	Fri, 23 Aug 2024 20:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F+uS055S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BCF1953B0
	for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2024 20:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724446078; cv=none; b=A55GotsnYu22Ea10YVdnCQk+5BDBdRer7ei/l9Rr3/rhC14SkveUEoOHXUgjjLjxGLUFJZibRq/XmiYadAeYsYd3hpJj0TN4WRQmEPJXu+PX1IUsd1Yy0OX8xQm73zHaAuubJ38/0j/Etze4K8IuwnH8b+GOoDYtxtigSNx8IK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724446078; c=relaxed/simple;
	bh=id4PXH6g6b5ygcEfz+3/ImyFmiTcss8b3qGEx/u76XI=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S9GHDgj6lmhF5JxoO/a4yvniZCEkbci9x6PIagAavgNCvjvE48EecGJFcLm/Qk1Bf9kx9asxAGyp/Z/lGKjNmRMWuvXPajAzO4S1OzNIONBMhqRwdrplhOPSSV7aBvnuWI8B4vQzpSe4bQp24frpthKFH6+KMXRXj1d0HUzzww8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F+uS055S; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-26ff21d82e4so1706207fac.2
        for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2024 13:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724446076; x=1725050876; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=id4PXH6g6b5ygcEfz+3/ImyFmiTcss8b3qGEx/u76XI=;
        b=F+uS055S12NP2Kony/nPVKKoKjsOH7ZsvBgTNRKb3qx0X6Mbb477oFFq7h0FEu6pKP
         19IJcjZCqQzwVJT0SdLP1++QJaYh1H1bn+5Xq6yAil4qwvepDnJ+cRETGtLfGkBLrIJL
         uCu5GGrwvKMclN8sv54029VYY29imxExd3hf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724446076; x=1725050876;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=id4PXH6g6b5ygcEfz+3/ImyFmiTcss8b3qGEx/u76XI=;
        b=eb73FuYUu6IQzFA1NQnXYqMXxvd47AbtsSryA8/xxs1G4p0BL3KJrX+U7oanlo1GNI
         MtIDeSVsR5vnpR+HVSfsiTAE/dmcYvMYfYPmyFUnScL1NzL5JwSUVwyt3PP7CEZGBx4O
         lQbjb89KJElXcYxKwhMmiwwdCfPNV+JsWpiGIXCweT4nGY7NbZfP2/cFkiBAjW6mBO4O
         joAwMmQSrNGME+qsCJl0wL2ukA1LYhfIZ35MPetuTOxH2R0F5BoSY62oNzXwav+Og7FW
         x1fNPU8vgucVADjpqO0JutZu2eVQM89L8+lGdg1ZuIAHtPxOjMaPy7iqtN/OEd1S6F8u
         +/bw==
X-Forwarded-Encrypted: i=1; AJvYcCWmpjy0zgcoOZpnJwhBy4DaTFQedChcxRDSzqahUZKioLHlMQSHyvi5E85Vqk0IJ6V/TtD0f7YYZyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHkaZ8RkjSpchQuQuKOEDdyHUj54ozhSzGwiQhV2J6pFeyvbMR
	0z15yD/nsZW/AWMl/6sgut2KqyGDxcpGH6FLuTNhUT3qH2xLhgv8cOXpJXePe/ZPtadDiqFcTZM
	IaGxFs40d2l2LEPlx7TvE+BoaywbOgTgqYVpI
X-Google-Smtp-Source: AGHT+IFTlK1vgqPsQn2j9voF5J39I5gTTTzWpu4wouRlEDJLxZNqlw4ZgBfIqTn3IqcZNBM8n7tlqF0zt3kueWkW4Ac=
X-Received: by 2002:a05:687c:2be9:b0:265:b32b:c45f with SMTP id
 586e51a60fabf-273e60835d0mr3142337fac.0.1724446075865; Fri, 23 Aug 2024
 13:47:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 Aug 2024 13:47:55 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZsdMd7Ywa2b-GDT6@tzungbi-laptop>
References: <20240819223834.2049862-1-swboyd@chromium.org> <20240819223834.2049862-14-swboyd@chromium.org>
 <ZsdMd7Ywa2b-GDT6@tzungbi-laptop>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 23 Aug 2024 13:47:55 -0700
Message-ID: <CAE-0n53zPV8QHf7DxSDO8E4-kvsP=unFvevjo7i1ZjE1v6UgAA@mail.gmail.com>
Subject: Re: [PATCH v3 13/17] dt-bindings: Move google,cros-ec-typec binding
 to usb
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, devicetree@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Benson Leung <bleung@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org, 
	Guenter Roeck <groeck@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lee Jones <lee@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Prashant Malani <pmalani@chromium.org>, 
	Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Ivan Orlov <ivan.orlov0322@gmail.com>, 
	linux-acpi@vger.kernel.org, linux-usb@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Tzung-Bi Shih (2024-08-22 07:34:31)
> On Mon, Aug 19, 2024 at 03:38:27PM -0700, Stephen Boyd wrote:
> > -title: Google Chrome OS EC(Embedded Controller) Type C port driver.
> > +title: Google Chrome OS Embedded Controller (EC) USB type-c port driver
>
> Given that it gets chance to modify, how about s/Chrome OS/ChromeOS/?

Sure!

