Return-Path: <linux-usb+bounces-14608-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D633996AC42
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 00:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06EF01C24599
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 22:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE99A1D58AF;
	Tue,  3 Sep 2024 22:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lm1jVuAH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41CB186E30
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 22:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725402947; cv=none; b=kZwRM9nAfBO2/09ob6FgKDoHriFy5Jl7Ai1cfFFG1+iuww5etY6ZvF6TUWfTHR9jhbTdZ6D9IYEApJRruz3sUVgsa6pqdJ16FidJGm9s+KpJlsohhVsOIKioK9jEWIRu0o9CIcvqCugP0JKKcLJz8C2hgS/nIjwct3HQ19JWbCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725402947; c=relaxed/simple;
	bh=Np+Q0wHOCgirMFjVPl8Z6i7/K3O+RkvC3vKi9xQ+BOA=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gyd2Fh4n9et1bnYaDx6DMT2c6S6BOrCEuvCbd2DvyYH7nX1IEsqkg3KACP8gc2aDGc/HtdV7JMy33J7EoMnr4VUJvE2E3aKecDxluUKxlBias2EBf2GjF8wL+WtHZJMlsTHXIiVAIby142QmC0tEIJvWs2HrGK06fOD5642HsAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lm1jVuAH; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7a8125458e4so299596785a.3
        for <linux-usb@vger.kernel.org>; Tue, 03 Sep 2024 15:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725402944; x=1726007744; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Np+Q0wHOCgirMFjVPl8Z6i7/K3O+RkvC3vKi9xQ+BOA=;
        b=lm1jVuAH2pFMPzHxtGzV+WNdlwFrpY5gjA/JLR95yM3WWoKr/HkJvVpdhDMOr2UWUt
         Cy2dqItUtK2a+DuFQMqvmArShpAQO3aqWp7sbWN7kjm2tCABSIOadrLNsoPb2cHostjR
         Law3Q1kIib6qsOl/qn5WpjVr+h8IHVgHTxk8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725402944; x=1726007744;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Np+Q0wHOCgirMFjVPl8Z6i7/K3O+RkvC3vKi9xQ+BOA=;
        b=hccIYcy7Un8RN1cu5MMXIv44zRLua9hYCWoPMDKfNzKSR784K8wH9PuSH9t12EAUOJ
         qqWW5ruoA/Z/BXbDRkqj4p3llV7GL4BWQQ0sxG1hVw1naRWDbrJLjgT6rpq+mAOmxA8H
         ghpekz+siRZOTF3h/K9d7rLH9bu4fN0xvFm+fj2lsSHmKNCVDXRY6G40eEva5aAVxeBG
         2i/xVKSvQ1DBH+VJamqbsKqCMQNUg2BFKX2LkVB9u4zZ1//8YkqyV/O1UuuJFheokYRv
         vGo/iU2j4Ta7DKCnsqeMPu01MqATwKdEkdZF9QfpMOxwSMX8FdPMfyolvwzg+uefuJ4s
         m2yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHSLc6gZHDFrYxi4HopqaCdy+fUyL8xOj886ooy2vNo7e5CDSSRzGfuyD1udftY77QsiBYW8gyr+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrLg0lHEayy5/SdE4E25COpaOWkpvZzw3AWMMHK/ROv36XgkKF
	ZFBiS5sahIjZDF/fBl8Q/v3TCXeVA629rXcMmkYZYXZ8+ptA4bh4UJ49oMkFL7Weli4/gzDWxhX
	KxUYVjibt/BfyytLKP0UxxFv92VH+d2IVrvIA
X-Google-Smtp-Source: AGHT+IHROkfnEqJwyKjhAgQRGsJgxkFB29+Yc6u1MFfoALprduJBtTl2Q7hk3LAUymLuEO32wO/aAKlH5269r5m9+pM=
X-Received: by 2002:a05:620a:28c8:b0:7a6:6fd6:9d6a with SMTP id
 af79cd13be357-7a8f6b767cemr1583962985a.5.1725402944498; Tue, 03 Sep 2024
 15:35:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 Sep 2024 15:35:44 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZtWeuFUEgnF9e2S4@smile.fi.intel.com>
References: <20240901040658.157425-1-swboyd@chromium.org> <20240901040658.157425-11-swboyd@chromium.org>
 <ZtWeuFUEgnF9e2S4@smile.fi.intel.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 3 Sep 2024 15:35:44 -0700
Message-ID: <CAE-0n51nLCNJxhxMr3EmqoWz=3dLU-ckfSwgEUtrhBRZchLu_w@mail.gmail.com>
Subject: Re: [PATCH v4 10/18] devcon property: Document devcon_match_fn_t
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

Quoting Andy Shevchenko (2024-09-02 04:17:12)
> On Sat, Aug 31, 2024 at 09:06:48PM -0700, Stephen Boyd wrote:
> > The usage of this match function is hard to understand at a glance.
> > Document the arguments and the return value so it is clear how to
> > implement the function.
>
> Thank you for the patch!
>
> ...
>
> I believe we still use "device property:" in the subject for this header file changes.
> $ git log --oneline --no-merges -- include/linux/property.h
>

Ok.

>
> > +/**
> > + * devcon_match_fn_t - device connection match function
> > + * @fwnode: Remote connection's device node
> > + * @con_id: Identifier for the connection
> > + * @data: Match function caller specific data
> > + *
> > + * Implement a callback with this function signature to search a fwnode's
> > + * connections for a match with a function like device_connection_find_match().
> > + * This function will be called possibly multiple times, once for each
> > + * connection. The match function should inspect the @fwnode to look for a
> > + * match. The @con_id and @data provided are the same as the @con_id and @data
> > + * arguments passed to the functions that take a devcon_match_fn_t argument.
>
> > + * Note: This function can be called multiple times.
>
> As noted in the next patch, this would be nice to elaborate (at least to me
> this sounds like declaration of idempotency which is unlikely what is
> meant, or am I mistaken?).

I based this on something that I've already forgotten! :)

It's saying that the function you implement shouldn't have side-effects
because it will be called many times. I actually wrote above that it
will be called "possibly multiple times, once for each connection". Let
me try to remove "multiple times".

