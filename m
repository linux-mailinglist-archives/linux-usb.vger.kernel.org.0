Return-Path: <linux-usb+bounces-3503-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 155A67FF2D4
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 15:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46FB21C2106A
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 14:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C484778A;
	Thu, 30 Nov 2023 14:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hQgGi9gq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE0EA8
	for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 06:48:40 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-da077db5145so939954276.0
        for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 06:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701355720; x=1701960520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0muDf491lrhXINQT2ZKN2LliQpFV7k/GNMdeGRlPdsU=;
        b=hQgGi9gqKRUwpt7+fo/Oe52nORnTqj9YwHKoOBhgCpMHdBbzFyb+TFfNxQJxMWbk3q
         E8hhNZVLIOtjsmMOfD+emJDs/ZcTe5y5oY63h3NnmVfb7ubc6ytnhb+tFGTA4jWtVZSY
         Wt9E8LMTxRpXI7uAoqdqCWM5d/3TtE0/7BKm+M3tA5xlRK5JMeo2bdBMRH/Qq3Ffoqqr
         jUlMcj2+6QQvONQwUBZlTHCV7aEQtNw6qELBsBngOZGoP5dSZ95Pm97zuW1E8QB8b5mC
         KyrlmhI8RBinEuNtzze4NkfQ2wk4Z1JCzmfQsXsEAvOmw//t651UgPvlbkIb0RAUCTu+
         EELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701355720; x=1701960520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0muDf491lrhXINQT2ZKN2LliQpFV7k/GNMdeGRlPdsU=;
        b=sXkNX+FHh72ulAjmiMx7P8bZemrzzL/J4Ea7ezY4MlDqV0ULOgqE1tTUL8KUjnP8JL
         mfS8v22llvJOSabHjoJ+q51yhoHWj5wLDXzg0l1mu4wPrTNVdOdiHfNwMFRRSCQboo9X
         esJ3K8MQ5SwRkevu7uXR08DwGgpR59PqHMH9i4hWVPl3pAfzX1lt1EmCXaEmZcA7txXJ
         pZMBSp/Giyn1MWxbHPG2wMFqXH23pD6b8Y5a/e6Bm0tz+xMyUEzOqDRjgz1vGWD3ST41
         v4F987Ysgf2woeP08TpMbVuI8Jod2y8g+Fxsk2gbHHw27WgdPxHD6/NhKwFYOLdEUEoo
         UovQ==
X-Gm-Message-State: AOJu0YyvwWgYKCv/MyXfvNSazqtLWfLf2PDggsmBOcw96ShjOex83L+b
	dSsaKbLnFtGvNI6e9E8rYpY4XHd4Pzhw0FiStAPaBA==
X-Google-Smtp-Source: AGHT+IFQS/1VjIkLOiYKm/oAogp0MILiq6YREH4hlSuAzTjzqwlbZ7sNF+IDm7meh5114BnsZPd04XpGqh9ajh9NxHA=
X-Received: by 2002:a25:8e0a:0:b0:da0:5ba2:6275 with SMTP id
 p10-20020a258e0a000000b00da05ba26275mr20783935ybl.34.1701355719730; Thu, 30
 Nov 2023 06:48:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130105459.3208986-1-lee@kernel.org> <20231130105459.3208986-4-lee@kernel.org>
In-Reply-To: <20231130105459.3208986-4-lee@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 30 Nov 2023 15:48:27 +0100
Message-ID: <CACRpkdbvncOsbG2W3vJJz8N4mH8XCqyf_Ny1_hsLwK4P+7x1Cw@mail.gmail.com>
Subject: Re: [PATCH 3/5] usb: fotg210-hcd: Replace snprintf() with the safer
 scnprintf() variant
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yuan-Hsin Chen <yhchen@faraday-tech.com>, 
	Feng-Hsin Chiang <john453@faraday-tech.com>, Po-Yu Chuang <ratbert.chuang@gmail.com>, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 11:55=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:

> There is a general misunderstanding amongst engineers that {v}snprintf()
> returns the length of the data *actually* encoded into the destination
> array.  However, as per the C99 standard {v}snprintf() really returns
> the length of the data that *would have been* written if there were
> enough space for it.  This misunderstanding has led to buffer-overruns
> in the past.  It's generally considered safer to use the {v}scnprintf()
> variants in their place (or even sprintf() in simple cases).  So let's
> do that.
>
> The uses in this file both seem to assume that data *has been* written!
>
> Link: https://lwn.net/Articles/69419/
> Link: https://github.com/KSPP/linux/issues/105
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Yuan-Hsin Chen <yhchen@faraday-tech.com>
> Cc: Feng-Hsin Chiang <john453@faraday-tech.com>
> Cc: Po-Yu Chuang <ratbert.chuang@gmail.com>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for doing this Lee!

And as David points out it is even a bug fix at the same time.

Yours,
Linus Walleij

