Return-Path: <linux-usb+bounces-19504-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8946A1585F
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 20:52:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5248A3A9A0B
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 19:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC75D1AA1D1;
	Fri, 17 Jan 2025 19:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbKrzdeW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38E81A7AD0;
	Fri, 17 Jan 2025 19:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737143538; cv=none; b=RbqzEX7joAS4GOly+txnCWz40cFUvEr2NjGs0HtCzVCirhouVUDGFiILNt0vh3clQPzm5uEDJG+2Lyx9ETmtjNu41G65Ry/qpZevhxE5rrGejQ9MOIHZtCYYS5JlFtNwhp8g9N0eb7bR3C9U4zyWbvHhO5SPIPe4PYXZ2srvt4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737143538; c=relaxed/simple;
	bh=6UIwvsNtfrIXWHp3YTeCspTPHoxCdCzif8AaBdMPW64=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UgjvY69Oi08olV33loNXYx9n1Mg73xD4rRiWm5M2PxXRoLcvmW28Kk3QDG8RPoN29IEZN6lNHGeFev9x2K5FgkLdj5vBy1W/QyHZZzL072x9egQsuSt8xtApVlIE0SL6WMr9ysMEPb67m9jnk3OvHa6Kq3jYGiF7Ohsc17iyxPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbKrzdeW; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385deda28b3so1528878f8f.0;
        Fri, 17 Jan 2025 11:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737143535; x=1737748335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6igyJmYx3xfgNpg04tdCq16I8O1o28+DS8FiLEGbE8=;
        b=IbKrzdeWFvg4Pq2b8tCWhUy54AbQUznCJgr8UvqZtTK6xXXCK05qkb5gRt5epu/d36
         bCmuoy4FxOd6NYrzf+X4+iqeVV2rzqnhF6fZj2MO8ARev0n3dvwGkTaENHhA3ypixZYc
         umHMcp1vqggtzEwCmZmYO7cwInLLG02wg9XPsU75GD0rcUz+OKvW0pjA3D16f2pRndEe
         uVzsex+KM2D2LUIMyknAy3tzkxhOfr2f1Qyo1wSatVtXLWipZ2RVFSbRmckCgDEXvg32
         tcVv2/N976+fkxwCLlEoLQ1pc3Z/QvgxdYmj8Fu5XzC62bdJhZ2WRlxRY2dB3+ts4+i0
         RVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737143535; x=1737748335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6igyJmYx3xfgNpg04tdCq16I8O1o28+DS8FiLEGbE8=;
        b=ghzpSFRgevdvh4MPD8dozbRG/cLnZUizlf47IRiHk7uUOXkp5BKix09dAqxpZCEPxv
         rVm2IVqqW4PE+i1/d4wGvWF3BFu1Q2wZbZQoN4RDYf4IUHV4iCFXmrLjHFVUdOKZ7Alg
         wfPDPJbETivKarH7Oy88VK7jUk5NLjrspXyksmG3DxVBO5JM3/7FwOvklOgWN+zqEIep
         2ozFvT4RgGxOLHdJ7xKbT4OO49DLJFApmB2zlEYfs7fjSv1Rb4Yd5yuFq5v+i+mKp4Yp
         GkGV4fzgUvQnCySgu94pfHLz44GfwKSgdtPgFkhd3iqDCbytuyQWotMNa/FEtUHt+2L1
         QQJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP7kX0uIt13Tc8bj4zAio0zN51/kVCAZ5PEYdnoDLW0SGY1mH5f234r+RxYl2qrjLZ9d4gPDlnGeGG@vger.kernel.org, AJvYcCXRnUVmVmKtLoKG46mwNwP++6IycJHMNb8cAHK9B4wnF/LfkX/nMpB93FlKK7AePuTkneMBksPBTMsTeTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPSUW+6LpEfBNtQUd9axCBvOivXScgO6uXMctdQm+PZzjJG2Tx
	TFVROkQ9+CwzXlXbWBg3PBW8ubH35cfYq5H4aR37eDTLl8qn3u9k
X-Gm-Gg: ASbGncvfVo6TH26HDtSEyOk81wqdg4TvuwGP0NfKK8XcBnTccGKSihTGxzfNb77PcOS
	GCwkZocYzSd1tBlWNIOk55BL02UL4kCbE37qdAfgiG+fFdms6EIh+UAsd5yirB8bU6YhYWebMhU
	YFl2BWhKRagu0v4AQn1cc+qUcmbqZqN92JSWv4+XjQdafputdA4Gxr2bvRYlYu55xIuuMmFo/ig
	bMGbisG6Wweiov8lrxUIDo3TbnjFabBvxJRSPXiAEbikpoq0FwfGluR1lLr66hOuCGfy5b1GaBS
	acPCkSYhIRzszR9IzAg=
X-Google-Smtp-Source: AGHT+IESlgaczjO4UDRZutifN1rGgD8ccX66Njbo+S3yAMyHlNPasG8lcZXSpQX3Il85Kq7+k0CINw==
X-Received: by 2002:adf:ce8e:0:b0:385:f638:c68a with SMTP id ffacd0b85a97d-38bf56745d2mr2750223f8f.30.1737143534806;
        Fri, 17 Jan 2025 11:52:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327e024sm3211018f8f.88.2025.01.17.11.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 11:52:14 -0800 (PST)
Date: Fri, 17 Jan 2025 19:52:13 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] usb: hcd: Bump local buffer size in rh_string()
Message-ID: <20250117195213.651dc338@pumpkin>
In-Reply-To: <20250116160543.216913-1-andriy.shevchenko@linux.intel.com>
References: <20250116160543.216913-1-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Jan 2025 18:05:43 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> GCC is not happy about the buffer size:
>=20
> drivers/usb/core/hcd.c:441:48: error: =E2=80=98%s=E2=80=99 directive outp=
ut may be truncated writing up to 64 bytes into a region of size between 35=
 and 99 [-Werror=3Dformat-truncation=3D]
>   441 |                 snprintf (buf, sizeof buf, "%s %s %s", init_utsna=
me()->sysname,
>       |                                                ^~
>   442 |                         init_utsname()->release, hcd->driver->des=
cription);
>       |                         ~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Bump the size to get it enough for the possible strings.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/usb/core/hcd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 0b2490347b9f..a75cf1f6d741 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -415,7 +415,7 @@ ascii2desc(char const *s, u8 *buf, unsigned len)
>  static unsigned
>  rh_string(int id, struct usb_hcd const *hcd, u8 *data, unsigned len)
>  {
> -	char buf[100];
> +	char buf[160];

Pretty pointless - look at ascii2desc() just above.
(Converts to LE i6-bit chars with a leading type+length.)
It gets truncated to 126 characters.
Indeed the entire snprintf() is pretty pointless given what happens to the
data given that it is all strings.

Is the overall truncation even right?
The outer length is bounded to 254, but there may be fewer characters in the
buffer because the buffer length itself might be smaller.
Seems a recipe for disaster.

	David=20


>  	char const *s;
>  	static char const langids[4] =3D {4, USB_DT_STRING, 0x09, 0x04};
> =20


