Return-Path: <linux-usb+bounces-13741-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA61958CAB
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 19:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 004D2B2353E
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 17:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C191BBBE8;
	Tue, 20 Aug 2024 17:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lkoYVUoW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC11C194ADB
	for <linux-usb@vger.kernel.org>; Tue, 20 Aug 2024 17:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724173271; cv=none; b=GrczPIntinOajhXojycmKis4N2GMaeDCM1Q0MfndyvoFLv0G83Rfpm4od9HLO2wrZtU5syOvQTj9gvbZzzaWbopYaLpAm0nfHPDs2QaodthY2pU1kBSj9iZgQ3vFFUWGLmauslaBHNpBl3fvMyNJYWzqZo0/0pJ5dgRJCB7kCHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724173271; c=relaxed/simple;
	bh=La7oWIUhSUge3ERKvxgz51d9R1GNWxKb2F4RDC0zKH4=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nGtuz2FBreJ33XiMAkAnyeogy8+X0cXnQj3fOhI2BjUlMRTmr5sDLOiMFVi7lNPb5XR4erZ69WsQNnmRle8Zd47I1/MQdpD3AR9m0u78CVydVatOwKiiGMd3VYJZBfiPUd/hCc6ohv2g6uwR8ITFmky0grjiPxAbhaJQ8M5tXTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lkoYVUoW; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7a1d3e93cceso635288985a.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Aug 2024 10:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724173269; x=1724778069; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JCcO6kIoHTHBJk3fFwoj4wvVEMn4emufplXdO/fW0XM=;
        b=lkoYVUoWkiGZYr9SquzbnoxkjOdRsf5I7kqbzgibDW1Ouo6ffuZQoZzRIEdpR7zJvj
         BU1BUhrq97VK3fnN9cUyg7UWKShBDV5S9qKXyQUa249TOsQqGYce4gprYYxMbczd2QPM
         PXrrZMGC1i1jYgf707fRwmQEWYDOfqf8S6JV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724173269; x=1724778069;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCcO6kIoHTHBJk3fFwoj4wvVEMn4emufplXdO/fW0XM=;
        b=TwBLa2Kf7VpkZwNoxgnG41/LQ/DRXW0H5iLuZLnGNnzyUYQPnyGfSvhmqIUyaekh4k
         Bz9nUHVFxmfA27yhvsvQS2bkcNAqaNidialhPzFKr+Ud3dwmCIntMtI1D0lDcCMEcu3E
         Fio+0ZEgsZIBfEhQ1AdItDpQoTBBz1SQ958nxw00ECCAGUBI8AijDj9AfxfM6vXEn6CQ
         7OCJLKQf6eQCIAgo6ikKAGFhqCC8gkkSakGq/JUoHWE67+FQxxvcuDZNMJaaYLx/sl3o
         BGwF1I3rO0GJD6/eBlgcS0ZrlKFbV5A5I8vD27DLAmOeFr4htRAIr4rqFbjLOR8rcwsE
         hOgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2UaqmWnlygHzfJ6XnuTVeg+5EbTCNXdJIWyzWI5qehlO0fn9njmE7zPQmp1jpZM+3pWRhoOPq/3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyBYMWWSKHB/uKn+GUohlb6wZVT+9hMzMJfN/oNGVU9mrVoWF3
	CY6dF+sZP89KUq06gi/PNXGtB2cEnFuGOV/i4DhN10OsuKrLtq+phX7BOZMMEtAsRZW4yuo9IA5
	GNvGNipitRyg8zOoLQCzuTJizcAOpbx+NjNy/
X-Google-Smtp-Source: AGHT+IExsG5zHtAEYfaM6InbVgUuGomzcusJF6tz1OfpCX6Xn6bckfcEN/xUs+8krdfm3hDwFaOzE5atXUvwN9QFkzg=
X-Received: by 2002:a05:620a:3942:b0:7a5:1e9:7ff6 with SMTP id
 af79cd13be357-7a667c53799mr601135385a.34.1724173268451; Tue, 20 Aug 2024
 10:01:08 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Aug 2024 10:01:07 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZsRs6d6uOMb4DqQQ@smile.fi.intel.com>
References: <20240819223834.2049862-1-swboyd@chromium.org> <20240819223834.2049862-6-swboyd@chromium.org>
 <ZsRs6d6uOMb4DqQQ@smile.fi.intel.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 20 Aug 2024 10:01:07 -0700
Message-ID: <CAE-0n52O01UgrDT2=-JJpZj39BOJNyyQC4w_pgDUmKDmcN=8Yw@mail.gmail.com>
Subject: Re: [PATCH v3 05/17] usb: typec: Add device managed typec_switch_register()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
	Thomas Zimmermann <tzimmermann@suse.de>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Scally <djrscally@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Ivan Orlov <ivan.orlov0322@gmail.com>, 
	linux-acpi@vger.kernel.org, linux-usb@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Andy Shevchenko (2024-08-20 03:16:09)
> On Mon, Aug 19, 2024 at 03:38:19PM -0700, Stephen Boyd wrote:
> > +     ptr = devres_alloc(devm_typec_switch_unregister, sizeof(*ptr), GFP_KERNEL);
> > +     if (!ptr)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     switch_dev = typec_switch_register(parent ,desc);
> > +     if (!IS_ERR(switch_dev)) {
> > +             *ptr = switch_dev;
> > +             devres_add(parent, ptr);
> > +     } else {
> > +             devres_free(ptr);
> > +     }
>
> devm_add_action_or_reset() ?
>

No. We don't want to call the 'action' devm_typec_switch_unregister()
when it fails because that would unregister a switch that has never been
registered.

