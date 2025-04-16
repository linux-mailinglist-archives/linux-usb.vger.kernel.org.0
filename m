Return-Path: <linux-usb+bounces-23154-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45923A90801
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 17:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0F951899A8A
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 15:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC7B207E13;
	Wed, 16 Apr 2025 15:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFK6h8R8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F8AA50
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 15:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744818580; cv=none; b=CbXXpwaaAqAsyCcEJt1+UExSp40YcT2WO8NNHp5NTSU5UPSHg+nWf8CPRaQ4dhMvZZLfmiGUR5IPpB/s0G75vLUqhc3q3lWkCJuBu0QroWI8fDUmj4GlQ3+FW9a5oKRD4xITkALQ8nOZZZzHSpQHlpSCu84R1Bc+5f7+puYnuGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744818580; c=relaxed/simple;
	bh=PwjEyf9kp0kUUMF+0Jbj3mGIWSEE3M6T7jg25CGQLmU=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Subject:To:Cc:
	 References:In-Reply-To; b=CvooOiImVkK7tsKQNweEBaRYDGevbjANJ0DKYCQ8GZ5FDOX7Av5rynIB3mh6yfgySzN+bwEBLXlv/pcJSk0Sg81a1oMyL+1I39oot7Qr0c6qXVsIWM1O5ucQFevd+ivO/9WKLwrF4/RsZwx8GxivQ/wQYZgX56zIu4rjp2wuesQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFK6h8R8; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38f2f391864so4208625f8f.3
        for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 08:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744818577; x=1745423377; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:subject:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VywEuq2PMChR8O1a7SxJ7KchJEKay5WFwnAKi8Fp9eI=;
        b=KFK6h8R8TKx4q17NmI1l5ZB5vqXC6dmNZMcbpkvQRUWgFKa9ES2ZRe3radTHB645fF
         kDVXhzE8OhphHalyYUMo4fuyYGu3At2+QLre6pxDDJJcH9XypiCvJIxON7Yb7o0WhK1o
         cBoYbKS6zIJdSZCVdG8Mb87/zNTb8YiqlFlMPE1WtqQyqKCwyB+exvnPDJLjNn1UXfJ+
         WMY6l6LycGk0Lqw2y6Sxv6nSU3SnNo4IrWZz57Wboigr4znyjSbSJI/Vm2z3QBf/sZCN
         1cICK+RlcfHhNzomGUmIVWwNNC9Sp4w0lIh/h+rONNqe3V7rjJOkQr9AGHHsmoRVdqTW
         +otw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744818577; x=1745423377;
        h=in-reply-to:references:cc:to:subject:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VywEuq2PMChR8O1a7SxJ7KchJEKay5WFwnAKi8Fp9eI=;
        b=i3wle5DhG3bJ0ohxIPwITlv8w4ij7A47CVMjSMpgRAbjlLZgEfwILCdlRfFzSOOHMv
         BmhjctZjvQUbxz6QYqaC2kJkEVQ1RXSQoltXaotZKkdQn++xmQ1OD42c/2+XnICS1UmB
         xESi/v/H2T96CoGfhM2umCfDNpdVWuZSFEn9SkHaD4TwD5L50aoQf7WhsMDr8nId7bt6
         WAZZ7U44XXrr31RWyNeKbi8OTDQoMlbG9D0KYGZNVtBWDeocWkniRUv5juZSI2kMUzWx
         5NGb72HnbwtykwrdvJze05r3PWvgzSPOygZlPfg5zGkAo8mQkXWJldEpZAMFfZhT9E7d
         aUEA==
X-Forwarded-Encrypted: i=1; AJvYcCV1fmjZhGrxDX9Ow8Bz6Y4oH7AZS5Jj/Rs0QYZsIqpOe5RMpeauY8YRtXt/dicovGrj4EsUOSgbuyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEiSLY7QJRPIByVlQvxqIJDNoQt2rTGCFkm+0KE2l8a/+Yfuie
	8YPoLWX2yAvgvjbr9xZagCXxsMWbZ9Y5yDHsX6jjQOKaO4orW0DS
X-Gm-Gg: ASbGnct1OkkyyEbRwtXBkDFIpfWDb4sLpx67PtrwjVrRh7x6ySgdbFWbtN/MLBQdiBx
	NvtzLNB9Ml4v2q6w5jasxiepx3Vqrebi6jyjl3h650MYCJtZgZs42wDmAye6N+Zdez4l9fwllES
	HOHZcNv2Ya59YCJu8VytxeL6zrhNNLMIkzU4vB0A+m0N6yxzY6GfRILQxFGgwlh3kJ6TnBktJAY
	5P1bEMxuaPvSyRCoFiNBMvvHSx3ReuVh29jm0erYrkxE21eU9lP/gXshWG/AmT28er2o1k/SxIT
	3pL2FkEHxxzD9i2rDD3yHv2L0K+1TdYRUgoOKoNWIA171uAaRZwTrbf+IqiXewE9NcSky12prvM
	c
X-Google-Smtp-Source: AGHT+IEZW0JCe96dHyLrAjH6Q4871GzqGlTxe0ci0mIspDf+vL+IQH/hDW3ilekWbGqePFl8pq3b8w==
X-Received: by 2002:a5d:5c84:0:b0:39c:1257:dbab with SMTP id ffacd0b85a97d-39ee5baf33dmr2079218f8f.59.1744818576579;
        Wed, 16 Apr 2025 08:49:36 -0700 (PDT)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae96c614sm17689800f8f.27.2025.04.16.08.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 08:49:35 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Apr 2025 16:49:34 +0100
Message-Id: <D986KBO6PQ7H.1AF20ZSJLZ2DH@linaro.com>
Subject: Re: [PATCH] usb: isp1760: avoid return of uninitialized values
To: "Alexey V. Vissarionov" <gremlin@altlinux.org>, "Rui Miguel Silva"
 <rui.silva@linaro.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-usb@vger.kernel.org>, <lvc-project@linuxtesting.org>
References: <20250415154646.GA6814@altlinux.org>
In-Reply-To: <20250415154646.GA6814@altlinux.org>

Thanks for the patch
On Tue Apr 15, 2025 at 4:46 PM WEST, Alexey V. Vissarionov wrote:

> Whether regmap_raw_read() or regmap_field_read() would fail,
> functions isp1760_udc_read_raw(), isp1760_udc_read_raw16()
> and isp1760_field_read() may return the uninitialized value.
> Add explicit initialization to avoid that.
>
> Fixes: 1da9e1c06873 ("usb: isp1760: move to regmap for register access")
> Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>

Acked-by: Rui Miguel Silva <rui.silva@linaro.org>
I think this need a more in depth change, with ret values checks and
maybe open code all this. but that can be done in the future.

Cheers,
   Rui

> ---
>  drivers/usb/isp1760/isp1760-core.h | 2 +-
>  drivers/usb/isp1760/isp1760-udc.c  | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/usb/isp1760/isp1760-core.h b/drivers/usb/isp1760/isp=
1760-core.h
> index 91e0ee3992a75fb6..d5822454eb4b6112 100644
> --- a/drivers/usb/isp1760/isp1760-core.h
> +++ b/drivers/usb/isp1760/isp1760-core.h
> @@ -58,7 +58,7 @@ void isp1760_set_pullup(struct isp1760_device *isp, boo=
l enable);
> =20
>  static inline u32 isp1760_field_read(struct regmap_field **fields, u32 f=
ield)
>  {
> -	unsigned int val;
> +	unsigned int val =3D 0;
> =20
>  	regmap_field_read(fields[field], &val);
> =20
> diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp1=
760-udc.c
> index 2af89ee28baac04b..dc9e630a576da76a 100644
> --- a/drivers/usb/isp1760/isp1760-udc.c
> +++ b/drivers/usb/isp1760/isp1760-udc.c
> @@ -59,7 +59,7 @@ static void isp1760_udc_write(struct isp1760_udc *udc, =
u16 field, u32 val)
> =20
>  static u32 isp1760_udc_read_raw(struct isp1760_udc *udc, u16 reg)
>  {
> -	__le32 val;
> +	__le32 val =3D 0;
> =20
>  	regmap_raw_read(udc->regs, reg, &val, 4);
> =20
> @@ -68,7 +68,7 @@ static u32 isp1760_udc_read_raw(struct isp1760_udc *udc=
, u16 reg)
> =20
>  static u16 isp1760_udc_read_raw16(struct isp1760_udc *udc, u16 reg)
>  {
> -	__le16 val;
> +	__le16 val =3D 0;
> =20
>  	regmap_raw_read(udc->regs, reg, &val, 2);
> =20
>
> --=20
> Alexey V. Vissarionov
> gremlin =D0=9F=D0=A0=D0=98 altlinux =D0=A2=D0=A7=D0=9A org; +vii-cmiii-cc=
xxix-lxxix-xlii
> GPG: 0D92F19E1C0DC36E27F61A29CD17E2B43D879005 @ hkp://keys.gnupg.net




