Return-Path: <linux-usb+bounces-17604-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A779C9548
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2024 23:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3962A2831DC
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2024 22:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD831B6CF4;
	Thu, 14 Nov 2024 22:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ahryUIYz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ABC1B6CE4
	for <linux-usb@vger.kernel.org>; Thu, 14 Nov 2024 22:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731623860; cv=none; b=kFmY2Apv26Y56tbpp1KCFx1ApfQOJmmDMV9CkiOddDLYIMaHbzpNShzYUn0hVhVree5yEn1qF9wS6cBjY/Ty90ekGblEb4lFwt3WKjq5Str2yRBg/u35Zl+z8av05eFcMPjzvYNjT93+V3PCdFFDWGrzgQQf1pnZVazD3PwKeg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731623860; c=relaxed/simple;
	bh=85ztcJGPwsa1N1byGv10pM/FRhozd8pTWNDn+7bp634=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L0kG2q2cB4VTBGHngOCV+ew+E1/BD5iy0LDL7zpQcMEsAKcA/PRk3NDafVxz6DOAlRO+U5YWmQhvi7x29M78AOZWQeitSDexQpJgkHunL4sINbXUKC+53pYArVWmh6iifzI9AqjNMaPr35RybhYpDddnpYFEJnEtuLj51Bifvlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ahryUIYz; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so1851651e87.2
        for <linux-usb@vger.kernel.org>; Thu, 14 Nov 2024 14:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731623855; x=1732228655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RX6oh5hFqtJwErEUNmAu9JijbwwkjoSkmYP7pKJeT2U=;
        b=ahryUIYz47T480+nxg089cHszpSn7WNpXyng0Xx9lFY6bMxHFXFk1GvFfdrzO3uS3b
         MskgmG6iXFEacimvdyGK2D8aHj7N5oe0Di0OarEsi8sZcIcTh8oV7YS6nsPRRWd5h0i1
         25sav6Bg9UP5twI7sBsaJzQast35v5XI5Gxk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731623855; x=1732228655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RX6oh5hFqtJwErEUNmAu9JijbwwkjoSkmYP7pKJeT2U=;
        b=jPQOjiXZDe90uZPD6zNS0JSCSOxHGmpotHWoMkko6a+cMGoLaeDgyR7Bss0rlph0Ta
         +VB93j4FaAEAW6FvoEsKBiqSaJRbYhmnAmSkvTns52VV165Qfy+uZ7m79XOkiLNSukSV
         wzayqd1qgM3dmc0YfU4l2M5V3NE9cJLOv60GceIfT2G38+7WGb7QrD/7kVVdYyCJc+BP
         IcV/89wWzPplkQlXyn11XBZwWLUYF4ivAd0lbdJY9bMOdJ/bFpxDKUqUqIU2lL8xUWvx
         tDrfLhNEYr1iMu7JbQ/4WY5jx1EoL6wB0Il5/WOUABlESDh6z2pUijvT/m+3bWLe0rsE
         N9Dw==
X-Gm-Message-State: AOJu0Yydhq3ZdyVxB2pHIK1SYfnfLG5bqEz8ywRu5ZUH7pXXU1FMHsZP
	7/4pchJPFB5GSLci2SsCJ2wpNFljzhkVqlR5jDa1BmYDtGmjCYrZci++fg/16vWpLdVadbFJ2v+
	z8A==
X-Google-Smtp-Source: AGHT+IF4Ba1RnijcHzISqmRTk8+r1LV4aBTmPmwjd+8PdurhhPuQdlNI1IuoiN9yzYT2Sp13J1uoQg==
X-Received: by 2002:a05:6512:b03:b0:53d:a866:9c42 with SMTP id 2adb3069b0e04-53dab2a93e7mr284261e87.30.1731623855205;
        Thu, 14 Nov 2024 14:37:35 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da653e258sm330793e87.179.2024.11.14.14.37.34
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 14:37:34 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2feeb1e8edfso16987531fa.1
        for <linux-usb@vger.kernel.org>; Thu, 14 Nov 2024 14:37:34 -0800 (PST)
X-Received: by 2002:a05:651c:160d:b0:2ff:59dd:9242 with SMTP id
 38308e7fff4ca-2ff606fa75dmr5641741fa.35.1731623853616; Thu, 14 Nov 2024
 14:37:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2024111339-shaky-goldsmith-b233@gregkh>
In-Reply-To: <2024111339-shaky-goldsmith-b233@gregkh>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Nov 2024 14:37:22 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VUCH-6JKVciJ+wQKv1_4=xrgeqBm3QAmBB3fBktVP4eA@mail.gmail.com>
Message-ID: <CAD=FV=VUCH-6JKVciJ+wQKv1_4=xrgeqBm3QAmBB3fBktVP4eA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] USB: make to_usb_driver() use container_of_const()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Grant Grundler <grundler@chromium.org>, Yajun Deng <yajun.deng@linux.dev>, 
	Oliver Neukum <oneukum@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 13, 2024 at 6:04=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> Turns out that we have some const pointers being passed to
> to_usb_driver() but were not catching this.  Change the macro to
> properly propagate the const-ness of the pointer so that we will notice
> when we try to write to memory that we shouldn't be writing to.
>
> This requires fixing up the usb_match_dynamic_id() function as well,
> because it can handle a const * to struct usb_driver.
>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Grant Grundler <grundler@chromium.org>
> Cc: Yajun Deng <yajun.deng@linux.dev>
> Cc: Oliver Neukum <oneukum@suse.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> v2: reordered patches, goes on top of series submitted at https://lore.ke=
rnel.org/r/2024111322-kindly-finalist-d247@gregkh
>
>  drivers/usb/core/driver.c | 4 ++--
>  include/linux/usb.h       | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

This looks reasonable to me. Assuming that there are no compiler
errors reported:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

