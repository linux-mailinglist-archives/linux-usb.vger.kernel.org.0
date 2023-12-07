Return-Path: <linux-usb+bounces-3847-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10385808768
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 13:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 846401F224B7
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 12:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0C639AED;
	Thu,  7 Dec 2023 12:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S/mftodZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CD31D7F
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 04:12:49 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5d40c728fc4so4512237b3.1
        for <linux-usb@vger.kernel.org>; Thu, 07 Dec 2023 04:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701951168; x=1702555968; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1nl7VzXYUVLpuywJ0ghnOgpBSVbJk3MSKILZ8n2HQ/Y=;
        b=S/mftodZiG4i4zFf1I5snXr76QX5fPvJ2UQLo9CYYm+rFwg+OIFKUmVvJHg0XYYTo0
         E16xkwZSgw0OdlnzXja4emaegK0lX/a8YvAj1FQp7arjpneT9Rav7GXlS7T5LETuSWS3
         5F19Hu5gxKqVYb1soc1K05uYEOF0l/4sHB6rp9AqJj4kdMk0vQuJsuIjkrevWXPqAokB
         geGYuTxwTX5RabpoUmswPvykiJgnux+tzYp79DNoRirvrbURpDrHtPD9JBqGaj5E7Bwq
         /+kg4x6Palc6uhgKGDNh8flhGikWEcEGOF1vTdpYi1DrmkCmpO/t7Gn9Eu5gRvkKGgQo
         MHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701951168; x=1702555968;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1nl7VzXYUVLpuywJ0ghnOgpBSVbJk3MSKILZ8n2HQ/Y=;
        b=wqKiMjb+unR2WpILgqyQnlb5+GbKNvbXjikK3ugIqw1Gpw1iZ/IhEf4wfLZBkMgQIl
         EbE12npahWLTZcY7SYITUR9YLsKcZnDHCZkPwQcxud452cTRyIiYmpTWBmCxkZprE0IX
         wOaGIbX+bEeqOvUqKt1kLLEIoKcupwyAJvpXwEg+QUHmuU9YWO8dHPo9tkwvrDc1jr+t
         MPKiluJRWqMP1Z1kEzLOobHHmyT2l/aBY00gJckQ/el++iiQXjRfDueuYaQpnZXjrpAr
         r/Rw5oZVrzEQeQp0LfeBR2fhOpfZL04d4IThFAf7x3/pAy84qgj4SCD8bTE9fNtLO6xL
         IUqQ==
X-Gm-Message-State: AOJu0Yy4uTldpNGLyN3RKuM/JtI8hEZXDPY+T4zMELgZk2mFnAsKHNjl
	iGe7kJyvZJU1nFe4NniX9BNrb/7zc4vuK9WYEjeDzQWxBOzcOd86
X-Google-Smtp-Source: AGHT+IGBQEt+6GpTODFbSFDlARHWKMqOvTNDHhmGHjyt06ChJHobnZLbJNE5ZT57jwuIGHkEkLgeHxLiKcSb32XnRQM=
X-Received: by 2002:a81:5293:0:b0:5d7:1940:3ef6 with SMTP id
 g141-20020a815293000000b005d719403ef6mr1945230ywb.39.1701951168367; Thu, 07
 Dec 2023 04:12:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231206123828.587065-1-arnd@kernel.org> <ZXGySCtdsxW4qCel@kuha.fi.intel.com>
 <CAA8EJprV3O24V0+MnPK1OdQZQ_7F2aMfN1Um13eH9ux4J+ucMw@mail.gmail.com>
 <ZXGzJlv9C3Z9lMeI@kuha.fi.intel.com> <c1df6dc4-ad3f-41ba-b024-1b432dac7af1@app.fastmail.com>
In-Reply-To: <c1df6dc4-ad3f-41ba-b024-1b432dac7af1@app.fastmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Dec 2023 14:12:37 +0200
Message-ID: <CAA8EJpp+ikpFZ1BL4PZJG_kK3n_u3mTTGZjd8A+=20gPm_SOyA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: nb7vpq904m: add CONFIG_OF dependency
To: Arnd Bergmann <arnd@arndb.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Arnd Bergmann <arnd@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Dec 2023 at 14:00, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Dec 7, 2023, at 12:57, Heikki Krogerus wrote:
> > On Thu, Dec 07, 2023 at 01:55:06PM +0200, Dmitry Baryshkov wrote:
>
> > Okay, so this probable should also be
> >
> >         select DRM_AUX_BRIDGE if DRM_BRIDGE and OF
> >
> > No?
>
> I think that fails if CONFIG_OF is disabled and
> CONFIG_DRM_AUX_BRIDGE, since drm_aux_bridge_register()
> will still be called from a built-in driver in that
> case but can't be linked against.

If DRM_AUX_BRIDGE is not enabled, then the stubs from
include/drm/bridge/aux-bridge will be used instead.

-- 
With best wishes
Dmitry

