Return-Path: <linux-usb+bounces-17602-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A419C9540
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2024 23:38:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8EDBB25BF6
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2024 22:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D4D1B393C;
	Thu, 14 Nov 2024 22:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jhsaKCC7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46A61B3933
	for <linux-usb@vger.kernel.org>; Thu, 14 Nov 2024 22:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731623850; cv=none; b=bI+pgtE7+/9S634PuGrvxnDrhZwCUmwO8IV+k2kbDXVIpEkMFpA6c+TEDnx0WiNKTh69o/u3FXWo4FIuaHNNSdxD6ufUDHUhwqwMPpXH/rBe6biVM9ctWhk10CoyDAZ8T7eTmb3yPJDC5zwUwW8h2V8dD/cXO/EbMsajeNTpqZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731623850; c=relaxed/simple;
	bh=wcwB8H31/Y1Daym2S10HotSqx/5KUs2/bNntNKGXxx8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IEuHeKmcz4aM6SF7lu7/ZurYqW68AcnnT0vLdGQV3b8+YCoKkU4cHTjA8WmEkcV0m6uwEW+xDHyJc96IrmmZKdcSVG/A8VKVw2tptWtzDKtdc8lplC6oyIR3fnM10eoA+OCvT6td2nX2U+9UdC1MPi4sz2H4y0zaFV8dCowznOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jhsaKCC7; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539e8607c2aso1229045e87.3
        for <linux-usb@vger.kernel.org>; Thu, 14 Nov 2024 14:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731623844; x=1732228644; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzzfTf4nLHjn2xQf4QA2C8+y3a5abfetAHXsvMWTvNs=;
        b=jhsaKCC7M6SVoDXZC9wwPJjce/w220ra2lQ8DSiud9edKW+vEWLARWzTX5K2TOSliW
         YpVPSzk1+vRZ/4FOSnBAj2EXaCUfOD5GDPjAjwKLPmltEwxGMfWQoa8B12we+ll56Bay
         UYwleW+CPOkP9v24BhDnh8O1kChPtZueMyjJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731623844; x=1732228644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nzzfTf4nLHjn2xQf4QA2C8+y3a5abfetAHXsvMWTvNs=;
        b=fV0TGn/wmytGb17OtuyqV+QId755OM4wzm6AjVznFE1BVuDgO0GFsGIWwNOD8EdOSX
         /Kk3BztUrR2npC5llWipc2Y3zCdLLywHmt4uQhd2Il+2HJ1plzsdHS6Z1FNr+LW/4mB0
         BexEBiaamQLW93HzuAXDYS8/kRwt+B4ZXfv8ncl1NdVJkXg2TmqZUCFDH9dTfP1Qi7Cy
         c3j4CzRVsVEnDeEKGwcAhOixrtSAAbsFpkHu8yj4WEOVYqDDFWs8ydqczDo7t8nPfDC1
         ezvkAGhVo1ld/wQOH5ZKrk5R0nM7qMi7giVzvlTOZ34Je7pTXx2/I+Qm9tCkCQpA9hwJ
         +7zw==
X-Gm-Message-State: AOJu0Ywr4b8TW9DTeX9uo2RffksSnP0yje784WXepJvbVKqq9kq8hjjG
	qzuc+U7CmK/O8BmTXT+lCX5e7/feBbJvrRTOoWad16huhhSnDePVRq3dkB3AEwG40HOTjz6lF4J
	cSQ==
X-Google-Smtp-Source: AGHT+IFFo295oW2DkCp17FR8EWslR/6iZt+bUokCQfmJ3GruaXPyxVvTGPtLsEX7UXly5ILkpoJ38g==
X-Received: by 2002:ac2:4c4e:0:b0:53b:1526:3a4c with SMTP id 2adb3069b0e04-53dab2a6cc2mr171753e87.26.1731623844288;
        Thu, 14 Nov 2024 14:37:24 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da86a5ff7sm276468e87.29.2024.11.14.14.37.22
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 14:37:23 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539f1292a9bso1328665e87.2
        for <linux-usb@vger.kernel.org>; Thu, 14 Nov 2024 14:37:22 -0800 (PST)
X-Received: by 2002:ac2:568b:0:b0:53d:a273:7da6 with SMTP id
 2adb3069b0e04-53dab3bc148mr167790e87.57.1731623842435; Thu, 14 Nov 2024
 14:37:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2024111322-kindly-finalist-d247@gregkh>
In-Reply-To: <2024111322-kindly-finalist-d247@gregkh>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Nov 2024 14:37:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XGBfkLQ2N3dr3smhMDb+ze-XpbHjd7EChAByGNwJOnOw@mail.gmail.com>
Message-ID: <CAD=FV=XGBfkLQ2N3dr3smhMDb+ze-XpbHjd7EChAByGNwJOnOw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] USB: make single lock for all usb dynamic id lists
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Grant Grundler <grundler@chromium.org>, Oliver Neukum <oneukum@suse.com>, 
	Yajun Deng <yajun.deng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 12, 2024 at 10:49=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> There are a number of places where we accidentally pass in a constant
> structure to later cast it off to a dynamic one, and then attempt to
> grab a lock on it, which is not a good idea.  To help resolve this, move
> the dynamic id lock out of the dynamic id structure for the driver and
> into one single lock for all USB dynamic ids.  As this lock should never
> have any real contention (it's only every accessed when a device is

nit: s/every/ever/


> added or removed, which is always serialized) there should not be any
> difference except for some memory savings.
>
> Note, this just converts the existing use of the dynamic id lock to the
> new static lock, there is one place that is accessing the dynamic id
> list without grabbing the lock, that will be fixed up in a follow-on
> change.
>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Herve Codina <herve.codina@bootlin.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Grant Grundler <grundler@chromium.org>
> Cc: Oliver Neukum <oneukum@suse.com>
> Cc: Yajun Deng <yajun.deng@linux.dev>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> v2: - change to a mutex
>     - strip out of larger series
>
>  drivers/usb/common/common.c     |  3 +++
>  drivers/usb/core/driver.c       | 15 +++++----------
>  drivers/usb/serial/bus.c        |  4 +---
>  drivers/usb/serial/usb-serial.c |  4 +---
>  include/linux/usb.h             |  2 +-
>  5 files changed, 11 insertions(+), 17 deletions(-)

I'm not familiar enough with the code to confirm with 100% certainty
your assertions that there won't be any contention problems with this
lock. However, your argument sounds reasonable to me and, since you
are much more familiar with the subsystem, I'll believe you. :-)

I would have a slight concern that you are changing a "spin_lock" to a
"mutex", which doesn't seem to be talked about in the patch
description. This is likely to be fine given that all of the users are
"spin_lock" and not "spin_lock_irq" or "spin_lock_irqsave", but it
still makes me worried that there's some random bit of code somewhere
that calls one of these functions while sleeping is disabled. I guess
that's not likely.

In any case, this seems OK to me assuming it tests well.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

