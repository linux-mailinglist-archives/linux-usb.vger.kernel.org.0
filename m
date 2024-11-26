Return-Path: <linux-usb+bounces-17880-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 499119D975F
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 13:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D28AA285670
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 12:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09971D4358;
	Tue, 26 Nov 2024 12:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XKhkOKt9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848F91CDFC1
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 12:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732624902; cv=none; b=sOC6IxvZZvQovJR16puiIgoNeB6DyNrjoJBwjLOgiWxQDa1cR60iXLqdpdgLhUFg5srDhOvHI6evsH61Trtc31YYWhoQXBeqmm+2kGVGFsFFSonJRD2JqNDcnVD5Ni20/X4IcZdY0o42bOtvjaZVX7SIvfOiqhZdcCo1879WOrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732624902; c=relaxed/simple;
	bh=cPTLukRRkvaGSB00X3hsgqrDjbaD+cNjKIgDNOefcOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LN4TrutpHJgC3mKKYLExxBMqTApQIe77xAJgLS44/tXNkFixhxKP2BtezAE32A8KruD1rwmR38Pv/9jsEaUFccpS9uamYfQY6b+2EZgpXCuRjFmvCRTfRyAm7bqhs68kCj+W0pMoZA2iI7Sau1ynJ7S66DF3CqC5JQt1JoEOQKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XKhkOKt9; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ee7a400647so58969117b3.1
        for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 04:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732624898; x=1733229698; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cPTLukRRkvaGSB00X3hsgqrDjbaD+cNjKIgDNOefcOk=;
        b=XKhkOKt9s0Y+ktsLJ7nOA6W8tFY9+gflqtV+KS+cspuiaN9S3hjKic5OEc5XUcud6b
         ViqsikGnTIUd27TXmq/4TDzc30czyiaQkoUom+Wganbtyg2gM4fDs3IVtjSHw4TEXIYg
         TSsV9yti2NATSuMLZlqhpZh0NQMjmurXRkoTqpnt+mch0QIS4uk6yeU3rH0bdWxUZ5Jc
         ieG5iFuXdRuyA/YFsOTp0lAPgsIrw+vcNSN7BE8gNaiLxoNgCDXeqa9WCcAsCXtmlxew
         KFMck9/sOCSWIeZyPUi3nkuZ2MWRVhNLyLzD9FrL7cu/brk0jMFpq8AZoHNopXBNVQ3p
         eNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732624898; x=1733229698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cPTLukRRkvaGSB00X3hsgqrDjbaD+cNjKIgDNOefcOk=;
        b=MKikCI1wkNeR62gju6MZQIe2xVJtnIisLDq72YcMV+3KCBrYQwY5xFPEZIyFlG2DoP
         6fNXJcp9nRr1f3M13j1O78smD41J9xou9EAZm77TojE4NuZ/qAM8tewi4XzSCp11udiY
         9PjrlPjibYbWiXDnxzpoaategzh9wQBXOjWZTqmsSMgR28CYNWXM9OWLDE0qrwlstDiC
         oTjRX9DtIwjc9Ya0pFe5HyzR8P0nRVTr0b99nfwJpeN0fgQBGeJzH3ZZgrzN7MjIf0QS
         Goqd10Q1pCMZjc7EwAGuW03740XmKAuNx3IXbgS4ekrT6W27msiHJJbjsvZjrwPekRC5
         XcGw==
X-Forwarded-Encrypted: i=1; AJvYcCUyUsbu8MY/Kt54t3roTnGTAFTFy1Lm8QhE2tnLE4IJuD3IyKsNY9dUJwBPm7GL/P5NigMMgNkOZYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVfo8qFqISGJ4J/iCzR2tGqpnfopoyGH/YSNWn8q/WaUw3ANGs
	/05sbQOlF02/Wj0urzxtJzZmk3qc8E7isI5uXJ+Jxa6w2aZbn8hNNa01xIZomzRVWPGt3i79adf
	9ZsjxPd1gXPVYeG374CgB1psB1/YgQpN7lC0QGQ==
X-Gm-Gg: ASbGnctpnZm/gfe8z6QpgELANg5TrWLYjucKnNwoZX5nrRW0TXOcvHoarpbsWKFxB15
	eGvDxvoOmlfTF4Rmyh3hNiFitUV6A1ak+cwKvBlvDcaLiCM6CP0xJWhpM4XQTPA8=
X-Google-Smtp-Source: AGHT+IF6l4+hBDV+putwVYiDk0qugPERHe+upMe++6V3UcZ5/+gbIZmfJ4RQdC8Lpth0bOqnEm38/6mER962cgmW0UQ=
X-Received: by 2002:a05:690c:2504:b0:6ea:8d6f:b1bf with SMTP id
 00721157ae682-6eee0779a6dmr182254577b3.0.1732624898603; Tue, 26 Nov 2024
 04:41:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241124124919.3338752-1-sashal@kernel.org> <20241124124919.3338752-21-sashal@kernel.org>
In-Reply-To: <20241124124919.3338752-21-sashal@kernel.org>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 26 Nov 2024 13:41:27 +0100
Message-ID: <CACMJSevZVPcHaEfromwLu1mM5kXE4sVz6f92u5HKLpM65ypbeQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.12 21/23] USB: gadget: pxa27x_udc: Avoid using GPIOF_ACTIVE_LOW
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, daniel@zonque.org, 
	haojian.zhuang@gmail.com, robert.jarzmik@free.fr, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 24 Nov 2024 at 13:50, Sasha Levin <sashal@kernel.org> wrote:
>
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> [ Upstream commit 62d2a940f29e6aa5a1d844a90820ca6240a99b34 ]
>
> Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Link: https://lore.kernel.org/r/20241104093609.156059-6-andriy.shevchenko@linux.intel.com
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---

All these GPIOF_ACTIVE_LOW patches are not fixes and should be dropped
from stable branches.

Thanks,
Bartosz

