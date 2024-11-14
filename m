Return-Path: <linux-usb+bounces-17603-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEDD9C9545
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2024 23:38:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73863B257DD
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2024 22:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815F31B2198;
	Thu, 14 Nov 2024 22:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D0PqCBqv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281621B4F1A
	for <linux-usb@vger.kernel.org>; Thu, 14 Nov 2024 22:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731623856; cv=none; b=bohnU2rD9ziXzcQKfdtUm2iTGTCCODIuxzn36mu/uMiPu40tx6ThUCiXRMJgsJg9wgBSe1hTv7mdiGkdV4WZJbF5uyliuL31h9s+0N9oPa63oEPHXWCEm6PW94rYxeMh38zXy18/xxDvrX8oFx1NoGqUv/028p0FwrXgfw+3k30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731623856; c=relaxed/simple;
	bh=5mWLFYI478bNp1POrIyNj/oiYZL8O4x/nC2FuTe8uEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZaPQ6zXnYFA9IbXwSD53RoC2vC3lkbk+xk/UJDACdTs14mV98qooKNrkt7kSgwJn36bNoBkjmn/2cy5ZWIWChodLRuIEFqOUOdN0xeayYrBt4fvsXh/EXAgoCvJQN86KSbvCTjQhYEsCILpOgFEeGXvrhTjK1ywTuP1AaSTdL+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D0PqCBqv; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53da5a27771so1281126e87.2
        for <linux-usb@vger.kernel.org>; Thu, 14 Nov 2024 14:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731623851; x=1732228651; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zrADbJtEOFmA5PPe2GqiGzYRsqhWbiQIwK7iBvvP7Y=;
        b=D0PqCBqviBeNk2xbjL6LtwtTw4/IUyTysEQ/HeQZ/6WnoGK7x54aTzfBYOOc5MM8fZ
         UZO1Fy40HpqYdFIRks0bI0nn8RnE10oQifi9804e7Qrgnri+UDTlP2O+e5B3faKciJnv
         7OOBHFDpPnTFy44TOBC95BaZ1x05M0eKrSIV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731623851; x=1732228651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2zrADbJtEOFmA5PPe2GqiGzYRsqhWbiQIwK7iBvvP7Y=;
        b=dtspJbWdRYxND8fF06s92UpLzGhQvbGe8+aG+geXB30GWRuefOL0MkMmqs9hGPejEb
         pl0s84JiFx840H04rOoFJSAY0QAyPRw6YErlhin8Vjie7o79vrBStsgfhGH0fw9k7//1
         tEczELcvyn1rqJeOo1YsKkonIUh6I++0QBiPmO+LlFVH4xPVXDK2gMIy7T9sUgINeFAA
         qj2weQQ41Up7YPRC6JNSq2tHS9fEk6SVjsBTr33hFDtpbeEMpwGeNk1Y27D7OrFAc78k
         YDt80EiCIvQT/m8W2RCiBEEduIv2s+Rc+0ZerqSFDg4tVydQ+6UjTOCPcl8B/3h4GJxG
         uEjg==
X-Gm-Message-State: AOJu0YzDCWpWRJjKuC3R8mnUMBrv624/4ViNlWcslX00tYbyyjlb65XF
	4z/Aw4u2G9eWhfjqm6oNW9mkn2LDKuWxjCRJgObLyQ401PtUIRQS5AThAz2CA6ihUHJXYpv8Kza
	ksQ==
X-Google-Smtp-Source: AGHT+IFFAlo/4WiYgbmBaUGUwOAdZcVXgNYGBarLzfdDw4Q1W67ioGlx+qcXpXzgXkz7dY+JBpBlAA==
X-Received: by 2002:a05:6512:2356:b0:535:6cde:5c4d with SMTP id 2adb3069b0e04-53dab289f42mr204743e87.3.1731623850669;
        Thu, 14 Nov 2024 14:37:30 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da6548bc6sm332921e87.252.2024.11.14.14.37.29
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 14:37:29 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53da5a27771so1281099e87.2
        for <linux-usb@vger.kernel.org>; Thu, 14 Nov 2024 14:37:29 -0800 (PST)
X-Received: by 2002:a05:6512:3d90:b0:539:d10b:e38b with SMTP id
 2adb3069b0e04-53dab2b4229mr156166e87.39.1731623849023; Thu, 14 Nov 2024
 14:37:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2024111339-shaky-goldsmith-b233@gregkh> <2024111342-lagoon-reapprove-5e49@gregkh>
In-Reply-To: <2024111342-lagoon-reapprove-5e49@gregkh>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Nov 2024 14:37:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XjK_vYnNiWfXXMBJq8Nkt-4e5bHN6NCu23S0EumAAdbw@mail.gmail.com>
Message-ID: <CAD=FV=XjK_vYnNiWfXXMBJq8Nkt-4e5bHN6NCu23S0EumAAdbw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] USB: make to_usb_device_driver() use container_of_const()
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
> to_usb_device_driver() but were not catching this.  Change the macro to
> properly propagate the const-ness of the pointer so that we will notice
> when we try to write to memory that we shouldn't be writing to.
>
> This requires fixing up the usb_driver_applicable() function as well,
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
>  drivers/usb/core/usb.h    | 2 +-
>  include/linux/usb.h       | 3 +--
>  3 files changed, 4 insertions(+), 5 deletions(-)

This looks reasonable to me. Assuming that there are no compiler
errors reported:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

