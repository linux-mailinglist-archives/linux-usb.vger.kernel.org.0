Return-Path: <linux-usb+bounces-3948-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A69F80BCC5
	for <lists+linux-usb@lfdr.de>; Sun, 10 Dec 2023 20:46:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35A2C280AC0
	for <lists+linux-usb@lfdr.de>; Sun, 10 Dec 2023 19:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF4F61CA88;
	Sun, 10 Dec 2023 19:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mk/pk7j2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA02DEB
	for <linux-usb@vger.kernel.org>; Sun, 10 Dec 2023 11:46:46 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5d3d5b10197so30665817b3.2
        for <linux-usb@vger.kernel.org>; Sun, 10 Dec 2023 11:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702237606; x=1702842406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfL3WzEuDXRtc2Yx9DpKvEpshQljhBnqTFJily+P2J4=;
        b=mk/pk7j2XNoWRptCydmxvtQoifeIfk5lXV8i3x87X7XPcTt2Zv629mUAWoA4hCow0L
         ZmpXSeKsB9jLwcg/cHVVVxmZv1XoolzR3ga6ZWdhX313iIsDB4GlFqEH5Ou8sH2oZGGz
         lFbNvdlf3NuTL2Lt9Xdo0GdYQcv4AAcGYg6NHPiWm/l6aXUSifM/N++7Px6yAG8KcnZd
         IUzc0O4VGJd1OhHxrSDXqzNGhhBelmRY3L+kmepjvh6Oi3sq4uPpqX+gwKBV3oqpRpBD
         c34uogyu1H/Gshum5NDM58PhgY9Ns7EVvtYDquF+fiVdq+P26vIoQFAhtIE11z7LeeP+
         Qr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702237606; x=1702842406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfL3WzEuDXRtc2Yx9DpKvEpshQljhBnqTFJily+P2J4=;
        b=eNKL6Fi9U5As3DID+/ZmxYaQcaAyjqtXvxoBQY0uoY/7V1WwXnb3IuMsrcRbVE8W/a
         iMuZJgQunal9/acKAUbgGsJvelD9j+4OdrFOb7c/FO5pPdPCgjVvVHFij8IowE/esnou
         cxGKoL4T9p9ahEUT+C18FGDlMxgG3hvXA8x8lrX1giZ2T5B49JjOHs1KJ6RxXWxsOItV
         wE3hqQFPl74q3eyGjUBxR3A68ZZbNEio2DkOqL3HtENfirKOJ1Z/HX7+ZkYQWzd8QOoS
         9TgRQ/KOI3qCNv7LIiNILKD18s0Jx3ufL18kdogiiHwJmmvcMC9eDz20IDdSpM7akkV3
         Deyw==
X-Gm-Message-State: AOJu0YxnYg7Fd0k4u5B8ONzQGGOBQ6P3Cs13Qhw7QyA1WAmHPjLv+sVa
	yrqZJn/G9NpvUSAghyOQWpprX1CZzf58G4zO9uy0FA==
X-Google-Smtp-Source: AGHT+IGkSafvzKSd9XrQiQnLAXp/AYZlAzkqTQNLQinImuLSVyYAumPVpSBhPCumrQMH+fplSJPGlMdPFGDW4+HPe5g=
X-Received: by 2002:a81:4fc7:0:b0:5d7:1941:abb with SMTP id
 d190-20020a814fc7000000b005d719410abbmr2574429ywb.86.1702237605793; Sun, 10
 Dec 2023 11:46:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87dfa523-1882-417d-97b5-f606ff0099f9@moroto.mountain>
In-Reply-To: <87dfa523-1882-417d-97b5-f606ff0099f9@moroto.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 10 Dec 2023 20:46:34 +0100
Message-ID: <CACRpkdbu=pkACc+gmBa_nCrYOwhXi77FzHwwUfd8A0sREPaM9w@mail.gmail.com>
Subject: Re: [PATCH] usb: fotg210-hcd: delete an incorrect bounds test
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

thanks for your patch!

On Fri, Dec 8, 2023 at 10:23=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> Here "temp" is the number of characters that we have written and "size"
> is the size of the buffer.  The intent was clearly to say that if we have
> written to the end of the buffer then stop.
>
> However, for that to work the comparison should have been done on the
> original "size" value instead of the "size -=3D temp" value.  Not only
> will that not trigger when we want to, but there is a small chance that
> it will trigger incorrectly before we want it to and we break from the
> loop slightly earlier than intended.
>
> This code was recently changed from using snprintf() to scnprintf().  Wit=
h
> snprintf() we likely would have continued looping and passed a negative
> size parameter to snprintf().  This would have triggered an annoying
> WARN().  Now that we have converted to scnprintf() "size" will never
> drop below 1 and there is no real need for this test.  We could change
> the condition to "if (temp <=3D 1) goto done;" but just deleting the test
> is cleanest.

This is a great fix! Thanks for going the extra mile and fix this
when looking at the code.

> Fixes: 1dd33a9f1b95 ("usb: fotg210: Collect pieces of dual mode controlle=
r")

That's the wrong commit.
This commit just brings stuff together from old code...

I believe it should be:
Fixes: 7d50195f6c50 ("usb: host: Faraday fotg210-hcd driver")

It won't backport cleanly but it's the right commit.

> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

With the right Fixes:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

