Return-Path: <linux-usb+bounces-3849-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF20C808789
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 13:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B35A1C21CB9
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 12:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD83839AFD;
	Thu,  7 Dec 2023 12:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tNefz4OL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8CB81FE1
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 04:20:57 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5cece20f006so6470737b3.3
        for <linux-usb@vger.kernel.org>; Thu, 07 Dec 2023 04:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701951656; x=1702556456; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vxesrth8s8TsUil/IZI30r3j8BETP24ApfVOZLfa+WY=;
        b=tNefz4OLJrUyiP5nJd/lfLwW4L9O+58Q8DYnqM6cafic/Bdt0D+sh/QyS54kosE6jP
         pblp0ZlnpH1fpjXvxabo8wNOEpmXzo/HitdkCNacZrA6Z8LZS6aynTfyqSRqXu0gX0EW
         WxDq8dPWJ0vSFHoQimXtN0kRXdLKeBYjxE+6XFlSHzTQnag+hH4KVxZZdWxLRECfZflq
         lyu/pIgsUTp9cilge8kPmxOIJn3q9XF8HG6SNL5w+Qh0YXBH4rBidBmpYFxAGrj4U/7M
         kty1WAgQsYQCsEHPA1OKY+zn4bXledlmVyWRT9ysYupfO9xleSPhRr0bdOU2xfDGD3DO
         GrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701951656; x=1702556456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vxesrth8s8TsUil/IZI30r3j8BETP24ApfVOZLfa+WY=;
        b=b6WKbxMQwJ35ZNtM5RfBhdbMmvKw4mUy7ebmf+E38KruqX3fnp5p3MC+rOJYdteszN
         FW3mP7SnIBZBr4fV2XvyxCpgFmDWADG/k45T0LY+a0/Vz1YO/flwR105G078NW1iMGvX
         dwcFTQ4S/joZN+FGQiWAgIDmoDLXxMbVS5mdSKQyrkXHGMirLIefWD9Eg9yQYaQ692t+
         I1kTSQs9a0dX2Wqqjy7RBwCkVN9cXkGaTiJUZzkQjIasd3Xwe8Wk5V70PExHHtOjLkAK
         WFv7XN+HO5DPBQwlyZuV4GekmdcFRlO50jF4fQDUXmDw0yl6MuHSS7k42AE0K5zpQCwQ
         l9dw==
X-Gm-Message-State: AOJu0YxF761s6Dx0VjoGF26QNATyaTZVwbMq6jV2yaH0dwmDvgIGsji1
	m6nIc+8gYyXz/5suhqnLH+CDvJWPru1MR6OEtwzCzg==
X-Google-Smtp-Source: AGHT+IFSH8O9li6V3TJLdm5dV/ZcvmVepEH/GR3IkQOy57yY2as3FaTPwqRlHm+Jr3s69hHIwWn4V4W2okIkzgzXBdE=
X-Received: by 2002:a05:690c:988:b0:5d7:1940:f3f2 with SMTP id
 ce8-20020a05690c098800b005d71940f3f2mr1874505ywb.90.1701951656381; Thu, 07
 Dec 2023 04:20:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231206123828.587065-1-arnd@kernel.org> <ZXGySCtdsxW4qCel@kuha.fi.intel.com>
 <CAA8EJprV3O24V0+MnPK1OdQZQ_7F2aMfN1Um13eH9ux4J+ucMw@mail.gmail.com>
 <ZXGzJlv9C3Z9lMeI@kuha.fi.intel.com> <c1df6dc4-ad3f-41ba-b024-1b432dac7af1@app.fastmail.com>
 <CAA8EJpp+ikpFZ1BL4PZJG_kK3n_u3mTTGZjd8A+=20gPm_SOyA@mail.gmail.com> <a6232a15-a7e6-47fd-ad4b-07319932a6f8@app.fastmail.com>
In-Reply-To: <a6232a15-a7e6-47fd-ad4b-07319932a6f8@app.fastmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Dec 2023 14:20:45 +0200
Message-ID: <CAA8EJpqo7Ty-kyFs-94ddUNWNoDe6efghAfHbVYjQoYAP-PPxw@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: nb7vpq904m: add CONFIG_OF dependency
To: Arnd Bergmann <arnd@arndb.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Arnd Bergmann <arnd@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Dec 2023 at 14:17, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Dec 7, 2023, at 13:12, Dmitry Baryshkov wrote:
> > On Thu, 7 Dec 2023 at 14:00, Arnd Bergmann <arnd@arndb.de> wrote:
> >>
> >> On Thu, Dec 7, 2023, at 12:57, Heikki Krogerus wrote:
> >> > On Thu, Dec 07, 2023 at 01:55:06PM +0200, Dmitry Baryshkov wrote:
> >>
> >> > Okay, so this probable should also be
> >> >
> >> >         select DRM_AUX_BRIDGE if DRM_BRIDGE and OF
> >> >
> >> > No?
> >>
> >> I think that fails if CONFIG_OF is disabled and
> >> CONFIG_DRM_AUX_BRIDGE, since drm_aux_bridge_register()
> >> will still be called from a built-in driver in that
> >> case but can't be linked against.
> >
> > If DRM_AUX_BRIDGE is not enabled, then the stubs from
> > include/drm/bridge/aux-bridge will be used instead.
>
> Sorry, I meant to write CONFIG_DRM_AUX_BRIDGE=m here.

Like having NB7VPQ904M=y, OF=n and DRM_AUX_BRIDGE=m? And the select
will not work, since the condition is not fulfilled. Good question.

-- 
With best wishes
Dmitry

