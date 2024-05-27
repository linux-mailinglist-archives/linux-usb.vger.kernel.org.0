Return-Path: <linux-usb+bounces-10591-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EBA8D0126
	for <lists+linux-usb@lfdr.de>; Mon, 27 May 2024 15:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 784F91C20DF6
	for <lists+linux-usb@lfdr.de>; Mon, 27 May 2024 13:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B703115ECFF;
	Mon, 27 May 2024 13:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tyPfJ8mH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D664EB55
	for <linux-usb@vger.kernel.org>; Mon, 27 May 2024 13:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716815921; cv=none; b=pS0pGDu2YKd5NxsPpITArKtiUv1h9d0XxLUt/1mR0r7nuSvM/zwSvQLJmVZBDIJoMrv/teDNcdo6VKCmEInwUBIWiotoPk+pSVJslAxUidY7UppLxpl6vOXYMb6O0C5wffCvyre+ypZh5LGWMpML3iNpyXWjZ1AlamOVrsyx4IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716815921; c=relaxed/simple;
	bh=HHPtZewEdArswaj9i7nFE9lFFfBh+aXtFZT3WxjsDNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cVwklssI3kKFZ/H9eiT55uqSAhvFKodo7gtH8bSsGuFoOsVyFvnbT1lZDK80q1oNrMiDeNA0ItALgSaagWgbIZDqU3DXl2WAKDjQBmhxPel2VCiQaLxat0xKeML+9uhI0I8XDW8LIrOkzPO8mO7ZNAf1EYYMbtLWc0tErJD3D08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tyPfJ8mH; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-df771fa2b8bso3133991276.2
        for <linux-usb@vger.kernel.org>; Mon, 27 May 2024 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716815919; x=1717420719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHPtZewEdArswaj9i7nFE9lFFfBh+aXtFZT3WxjsDNE=;
        b=tyPfJ8mHUUolwLE4p8wFCRTN5seiD+QfuBxWSEqffSbmJXpA1AlvlyXe6mezOVnD9i
         LDPzsMc9ldRUXSWwshyI8kT61A4n33U8yFDbyAsifS62M95cyiKv9pUlScC891GuZqKX
         sYysuD1J5eXYkOQ6Ax4PLY/jNl5U4t9yPyPmjm6dcTrS21p7f+Da9aVwhLPhvZO9zjUz
         EZSEeGltXt1DA8/qj0+e4f4wtOwCisHxO53rpy78QF3ztY4DuXb/KE6VDbicgIyQaDum
         pyvHMpKT6ykyn3wQmsgP3IWH8UXosqepQpr0X1lzu5bcwJfLwZGZC2GZ9rqf38FqjpVY
         JmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716815919; x=1717420719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHPtZewEdArswaj9i7nFE9lFFfBh+aXtFZT3WxjsDNE=;
        b=cb+getqvlgyVmWzcCGMpoEyc5xZGUc8yWoZkHF1WzCuGLelwW9c2Al0t4KLSj+OSdD
         N3OzBv2Qsl0BFpjTTUELEkZMPJ7iAEpF6iSz51LxMMagZGBk4gnYf7QnMWHwNggwzjCz
         s9AIEF/zMU/377uxFi+Oarln3y4GcUrc/A8zRVyvT09/ckCGoD29FmGMeLZZBC7JwLqZ
         /kc2f2QrHV+yrue6zeXgcSnwspeRj4QmdtMY2KdqYa8aS+2KuS6QDckq5grvJaho4zyd
         dmUfCPjDHykLlf+Qm639uMB1xfGZw72ohcii/XiDcPqiXOv3FHKrALxiQjBid/ogpLhc
         OIeA==
X-Gm-Message-State: AOJu0YzkuXF3qpjvGOqAJSgzBYGs+XYSDPZn0/v/3vShk8IexlqXSh6f
	YSOeu+dKBFoSdWWuE16FfZTcCHWI2uNprej6eNrLwdGtxS8eibGQbABJaxC/xOS+Bu3aE5x9P4v
	ImsqBGugFBJ4VynJZExYrRQYFC9SdQLS/NizbNA==
X-Google-Smtp-Source: AGHT+IEWBm9xDu/Cz3b9NCuTVLp6qM1g8Y7CxSoghLcfStpWinN4h04/tXY/Cqdm0kMUWihSrCsNEnUUmBfStRasc5M=
X-Received: by 2002:a25:ac14:0:b0:dee:61ce:3b62 with SMTP id
 3f1490d57ef6-df7722327damr9321143276.53.1716815918928; Mon, 27 May 2024
 06:18:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240508150406.1378672-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240508150406.1378672-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 15:18:28 +0200
Message-ID: <CACRpkdZsLYPEBL-Lk25r3WU-b-7x+qT+ELQ+ZHbUu40_zSkqOQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] usb: fotg210: Use *-y instead of *-objs in Makefile
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2024 at 5:04=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> *-objs suffix is reserved rather for (user-space) host programs while
> usually *-y suffix is used for kernel drivers (although *-objs works
> for that purpose for now).
>
> Let's correct the old usages of *-objs in Makefiles.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I haven't examined the claim in detail but I trust you so:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

