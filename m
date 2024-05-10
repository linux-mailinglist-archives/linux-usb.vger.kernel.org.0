Return-Path: <linux-usb+bounces-10208-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 874FA8C28E1
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 18:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DCBA1F26E3D
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 16:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82BEF175AB;
	Fri, 10 May 2024 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jVatEdLl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AEC134CC
	for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 16:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715359415; cv=none; b=XxSBxVIc2jKblD9Un5XOnOeg5kHTGe6XY7XqummUpTaMks13htFCx6NFcZEoyN2+VFngHDMMiOl21WsBJo4OA2DSr9KWIOmEMD3f+dJjQiMzBugVgMma4eZKvOE/gO46p3/S4hOliT49926Va4fdl5UGyuN3e0HWmZQcxWEaAsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715359415; c=relaxed/simple;
	bh=/0igybbvqaKZbT87LgJHpcr7AdAJdE6x4GrhdvG3OVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=czfBN5i6EjLgG+K8IoWrEwJOwRyzy6quKWvRxyxB0TAMGirUOX9x9tFRHojRvXT+PtYoXo+rMkK/uP70yTdS5wWyiAIeFdiyoOMJFiS7GXXz5cl6WEhLodB2h+yEPL5gZt6UyuzA9+t2XF9orUh+/Qtt9HfXkr3Wc6UL/OyEVZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jVatEdLl; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-de60d05adafso2200533276.2
        for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 09:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715359412; x=1715964212; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fV4xwRfH6Q44lAhoQwtLiOzzg7OoedjeQNAHkTSN4sk=;
        b=jVatEdLlSH0aCvyl9UTEog28oZU6WPmzZs8ifWH3nlxQ8Pj5RKVmzFWL9rUgKnzxC8
         NCboj0YXcu7VlATUvyU78F/10UegxfzwZHhNloro3E3ClAgqpELZZ4TFj8Fl8QRnZPdm
         RvZaeWa1dgYJarJDrHLsSx7Q0QAxJOH20pmzt8Gs1Y4UYLfwf4dTSROz601K1k1/gLBb
         I6QRFVk/enSyr/icYR4YixXdR2Zh/xZCuKPran2aOccDnJiaMe7QfOjvY4SpKPAE17bq
         FvIMYjvojnP90Z8Myk6Vf/MQeqAN6aSydqd8v1EwGtg5ZhZhYdvYWdLK3BPbADWRVw7K
         /Cag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715359412; x=1715964212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fV4xwRfH6Q44lAhoQwtLiOzzg7OoedjeQNAHkTSN4sk=;
        b=IdM6I+5XeM/kc7b/Bv3myvSBy4p/INr92+/uPVWk1GK32Brfl9yUwT9NqGM2Boj6IU
         oZvhpm8JdoBfD3ueurlBsJSRB7A4xS6WQuFftYlLOUwNEiavITPgrtnVKGyU5+iRNsfL
         CRguWVs2uvZdonZpZr/T1WNlDDfYT1OAfhs75Pl8o8aUyRRAcr4AHnqEmcaSBPhpPAgH
         GylSDQsO/iDel1uz+l/MNkZSkR1kVSwtbas/3rH4FGUXwayvNeR5x0PUCCuN+IXofTGk
         1One/pfAQOufIxUo3nB9ogeh8ncvVDHDDMfHe32oupzD1cbCsmEPJUX6hdmSfPUtWY5+
         TPxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLHZg3RJnvT143jfiTJcnGAOrsv09JuAScvr+ltdu7AkL/NHlEaNJ0ivBYFmB+9PT+TFpmrFkHlYfu8zj8RyVRsgaohj1/P5XV
X-Gm-Message-State: AOJu0YyxcBAdblVw7c5KUdYsbAsNlLIO0quzgqvIPO0GIjXTn1Cue3KS
	KnMyT/GyUCzzuDkrcKyzDK1p3QooE+QYKKg8fekS2taJ9CyAnmYt8ZGRf0gYCLa0GI1o0MQabwB
	w1K238sOCoZA2oklFNsTv+pDWL49dsVJGzai33w==
X-Google-Smtp-Source: AGHT+IHz+tr9fUvPcGFdrdDni+MtqeYQCFk2Ebm1uXhnb7ZxmEPMNQwNj5AVU/i6HGXgqBJpfKpmjc2gmUOQ+Vu0X3k=
X-Received: by 2002:a25:9183:0:b0:de5:5919:c9e5 with SMTP id
 3f1490d57ef6-dee4f4b98f7mr3069205276.43.1715359412355; Fri, 10 May 2024
 09:43:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240510152641.2421298-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240510152641.2421298-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 10 May 2024 18:43:20 +0200
Message-ID: <CACRpkdbGn1vZn24LmqW6tKXmFf15cbu3OP1H-jYs1pe=C7f7gg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] usb: fotg210: Add missing kernel doc description
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 5:26=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> kernel-doc validator is not happy:
>
>   warning: Function parameter or struct member 'fotg' not described in 'f=
otg210_vbus'
>
> Add missing description.
>
> Fixes: 3e679bde529e ("usb: fotg210-udc: Implement VBUS session")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: fixed typo (LKP, Greg)

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

