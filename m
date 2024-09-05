Return-Path: <linux-usb+bounces-14745-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2DB96E473
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 22:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 599B61C23E33
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 20:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4411A3AAB;
	Thu,  5 Sep 2024 20:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFkBTe3A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F77188915
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 20:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725569592; cv=none; b=Oe8cwuPXuYCT6Vbebh7K2lSgoOOo49DByXG2yxpmz4/N1lwSF94fGzVvNCLBzegL4hXHOr2UoNVzugNf0+7eoCPT/8+LkORDoLda9WEnGXLKwhTLfDfkpTOTnSUNY1jl72UY4Oy6lmBI3AeHlu3t+8TvcMD8tpfaItIyw7DxzmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725569592; c=relaxed/simple;
	bh=L1z5bfA3zGMtR+qUNPLEj8C5PHxpIFJXnA7FcDhCDhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PXX3ulAgYZK2FCW81yx4YsL7z0ieFXmBtW4iKtnkqD5d74omw37nYOcDq2OU2ym5juPmW3blxoBCBbO050dETAiFkV6PUTBcyeyZe9lwAHPnMqIjgsOxXeB8nS0Dav1R1QMhJTzVkR4lDzyB0MW2CrBNC1UZSiEJUkwYMkPtgnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFkBTe3A; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a867a564911so171105266b.2
        for <linux-usb@vger.kernel.org>; Thu, 05 Sep 2024 13:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725569590; x=1726174390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUO706/EmlnK9zzmGZ3gtYT/X5ZAY2oSVSW2wnjPTqA=;
        b=CFkBTe3AJHrU5uYYT7aRckBJnfrOAiHqUO2k8j4j449q5FJc5kWC0ZMEsbiZxXfZfl
         E+mBVrQiMZDKOWYzQIRenW5EzYL3SiP29/1uJXoDGAMluzMAWVwOomoIexqTuTIAlKOe
         GMrpLnhL1UCtkkkqXa95elhslW2/E+1igvDdiaVvk4piz8PLNpo5GsJAs8UZhrs8Z/7I
         GqSn0RDmawVhR/+1bvEPMLJxsrEGLzCLTJKToLjaRX/t4vwVRL1xeOVIBnxubUgwYj+d
         NIuSXDoRlu07rIPPLBZbdyhCvlmJN7sPn2u+xnCBHP80HYse0yLQg9OwerXqgKPMniRO
         MH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725569590; x=1726174390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cUO706/EmlnK9zzmGZ3gtYT/X5ZAY2oSVSW2wnjPTqA=;
        b=jE/kKagHFyTbkin/A8KKll1cXbifGxZugB07F1LjgNq1BnC5gHhMhUae9mp5AmRJw2
         lwvJVxgoMbXZiNwKs55PYwtjQiCaRN/lFrN5HbgUGJRmYtdnMh5SvXAasi4NrphU2XmF
         USCEQoBP6D2m4gi4aViXI79Mfei6355gpQnmz6glYdnMXiiu62g53M+FC7aXtqz+JMN2
         UvMaWboefSe5gIxRSxeQyfpJDrzpkgBjtHY6pz7vXepbT+J9nkHSF9lMMKlJoT6sRYUI
         Qtk8jtER/w/aCcQha2mvuuo99JR8GTha8uGnf1jMS/rtn36zbXxnldap1f6jTdYmwzGf
         KfvA==
X-Forwarded-Encrypted: i=1; AJvYcCX59nRQscXNQiWEAKQNvvH4I2LQwOpSY07e7xZQtdQm1G2GA89je3d6W9bzdHb3PAGhGkwNYY2JuQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUyBteFF8AwRfIZm2FNISdxVa3V/wWPDmStW33tbLyDPZPahmB
	TKBZnToHh07is5LnuK2VrZu+XeNz8J/ZVPJviN3KN76daNuJW1uMTKMvj+NuJ6ZpTNukg11Ci1L
	1+PeNnZMqL6rndrb0Jt6S8ofpBRE=
X-Google-Smtp-Source: AGHT+IF257Ivxs8nBBPJEFSiB2ivsonrUNRzAhprCwxNecwtZYP4XcoZ0kSZJU2cCogfpfminBS3P9l9riSzlBKaqrY=
X-Received: by 2002:a17:907:36c2:b0:a86:8832:2fb7 with SMTP id
 a640c23a62f3a-a8a885f66cdmr29696266b.20.1725569589157; Thu, 05 Sep 2024
 13:53:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905204709.556577-1-bvanassche@acm.org> <20240905204709.556577-3-bvanassche@acm.org>
In-Reply-To: <20240905204709.556577-3-bvanassche@acm.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Sep 2024 23:52:33 +0300
Message-ID: <CAHp75Vcux4-zjUMWuLHPZwiQ4=FDSvHa+Z2ohgF-=f+2xyUh7g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] locking/mutex: Introduce mutex_init_with_key()
To: Bart Van Assche <bvanassche@acm.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, Amit Sunil Dhamne <amitsd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 11:47=E2=80=AFPM Bart Van Assche <bvanassche@acm.org=
> wrote:
>
> The following pattern occurs 5 times in kernel drivers:
>
>         lockdep_register_key(key);
>         __mutex_init(mutex, name, key);
>
> In several cases the 'name' argument matches #mutex. Hence, introduce
> the mutex_init_with_key() macro. This macro derives the 'name' argument
> from the 'mutex' argument.

FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko

