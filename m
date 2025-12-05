Return-Path: <linux-usb+bounces-31201-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AE7CA65C5
	for <lists+linux-usb@lfdr.de>; Fri, 05 Dec 2025 08:19:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E71030281BC
	for <lists+linux-usb@lfdr.de>; Fri,  5 Dec 2025 07:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5EC2FABEE;
	Fri,  5 Dec 2025 07:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EiCc+cBs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980F12EA743
	for <linux-usb@vger.kernel.org>; Fri,  5 Dec 2025 07:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764918922; cv=none; b=YxLICvPC5asyCKnsKPST5dTvF7ieBBA46F0Vrr/NPY562LsRSTeSVyEB9OxyzTi/tljjRgP77KSwery2eaqfgHszr3V6sixrWYZW4GWb5+Cxm7aubbna+HuXJPERccqmokMRWfhFBb+2Q/A5s04s1POQDLJ3AxFoi1CQBQGm+0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764918922; c=relaxed/simple;
	bh=Y87s2aEVnLW/6Tev1yAD8aRSx5zYQtZ+xk/cGnKy0GM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qye2z5mR6Sv3J8NzxVsjmHOzi4zFlhd36KgGDZNfB38JtMCxjYxdXJuVE7MtLoQSm/5BrU+My6sa5df1TlkDE39cc+mm0/uZ5Y6LasoJd7eJcu9KPPMOpTyApf67RIJn2/SQ/aecZLpNAExACb7B9BmTHqtYl1D9R4bFbkL1wx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EiCc+cBs; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-bd1b0e2c1eeso1435455a12.0
        for <linux-usb@vger.kernel.org>; Thu, 04 Dec 2025 23:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764918917; x=1765523717; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wtL3yYldnmdNDWFJpGyyGoQVux0laNIvubZCakEWnc=;
        b=EiCc+cBseyNCaA96GV8FVIVg5+Ae7rKXe5LDG3ULZw4/RkIOpuQWg2RLNGjjzXGwKI
         jzwYXG4zcNP/vC1nPVBhi6awu7HTa8GA6rwKMdisam2O5Od5u3DAVnurAqpSTOGp+KdW
         n+O5xEwAU/Klnvap5nHTwbiy2Gu3exUpEYqEzELe77E7WBJ+BJ+4jL8XTY3yEyd2bsrM
         MsbH3tozOpEeI2E3Laa6LmuVlqcMU3gFxInrWr4pWYYlu+CPpwOv+S24AThmEHp5hsIL
         crTLDp2meHNbiLBx/T5Eb0WfmbjJdFMfOPZCS0EeQikV3fMfhLU70VXCe+z0Gjf5jbZY
         WuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764918917; x=1765523717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1wtL3yYldnmdNDWFJpGyyGoQVux0laNIvubZCakEWnc=;
        b=Tsjdg+EfwQiOAD+xNdMeaLu9tfZ3DKTH2STdnoYUu3530nJxSILBNFjNMvHNkhd8Wa
         QGR4vhhPeZNw04KhT9dDYzAKmQMawWmv2aR7vL2CJnk7yeAjfkLNXEAIrZl2tSzak7ph
         0mbthSbHecE9I4kj4EfuIZkuyFsl2oliHWZ8sR8AoxFNz/D8jZZOZsXjBwT5nSCWj6NZ
         YoDKLxjJSBb8CLl8ygHvaMEF422ftWklMIly2yG8NUpBXFtyTD2KhbKTHMxIIIzVjIWq
         UDjm0trPZmdyqgvlU0UmZGyuMb+MyQ5j9lCO2CvmQrwtaEBVnPSLOnKBNv8nWg5CH7B0
         VkYw==
X-Forwarded-Encrypted: i=1; AJvYcCV6mif7cMoySYLCG5dIGMk+Wv+D86UQukRw0sw6yT7BGmFFucFnlG2Nm+vWldftyI4+HTDbc0Q7COs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy07+zo+WyxHot6r8Arn+DEvjtKgwXLiHp+9MFcqSReV9FuXO1M
	z6l969gfb+QYdXI0t1xmuKv0k6sv4DjnQPftJv5N7uYjPrRMzWTI2dDJFH8xRx3hwF5IhG/B/7y
	JU4RsjJ+88qxyuGUqvo0rCr0CTg1ovQ0fraSLJ31v
X-Gm-Gg: ASbGncunVo10AXbgs8ZpJJabkHlWTOcWNfdZ0PlbmXbDj2bJgsHVKGr66XFVNdVwJDj
	BtyTCUdilZwG6K0hb/wjaFSQgKd2B/j0qXelA47lZP4ZxAMPG0ZfyKHTAbYe0g22Mtz5fyr1NON
	EZWxV//6OaHr4PfvS3uPVHki7BZ8dIlv/DhvtHwvzc1XJkN6WzNK4MJVwWXJw3J3/rcjNJ9WX1F
	x6QmB3T5PvChOJ5cDFSrRWciUh1Q68daBLTwioCgRM8KAZW22j8/k1xKSr2hSCwpGYG3E3O44hs
	XC4FTM93w/PpsQz5+iFCa6zmeNs=
X-Google-Smtp-Source: AGHT+IGT6K0BHHyK+7ApfhiR4AaLaZPBjcT+DuZDOJN2iRJE4JKw2dSIgc9ERTNi77a15Duy+EoIn1JYySe0GVV8zUc=
X-Received: by 2002:a05:7300:5a0d:b0:2a4:3593:c7df with SMTP id
 5a478bee46e88-2ab92ee610bmr5224431eec.31.1764918916332; Thu, 04 Dec 2025
 23:15:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205-controller-v9-0-9f158b18f979@google.com>
 <20251205-controller-v9-2-9f158b18f979@google.com> <2025120553-suffrage-divisive-5890@gregkh>
In-Reply-To: <2025120553-suffrage-divisive-5890@gregkh>
From: Roy Luo <royluo@google.com>
Date: Thu, 4 Dec 2025 23:14:39 -0800
X-Gm-Features: AWmQ_bkT_bQr6GsRLXiYEii_iEy6B48Me29L8TfZAdXfRwHS8tmUgcF8diylx2U
Message-ID: <CA+zupgzL7v5MZDpxKDQQCqAZaqTdHbiG9-xTr+8RnigMFZJ_7Q@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Badhri Jagan Sridharan <badhri@google.com>, 
	Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 10:05=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Dec 05, 2025 at 02:26:38AM +0000, Roy Luo wrote:
> > +config USB_DWC3_GOOGLE
> > +     tristate "Google Platform"
> > +     depends on ARCH_GOOGLE || COMPILE_TEST
>
> There is no ARCH_GOOGLE in the tree now, so how is this supposed to
> work?  Shouldn't tools that check for "invalid config options" trigger
> on this?
>
> thanks,
>
> greg k-h

Hi Greg,

The menuconfig looks like the following and it doesn't complain:
| Symbol: ARCH_GOOGLE [=3DARCH_GOOGLE]
| Type  : unknown
|
| Symbol: PHY_GOOGLE_USB [=3Dy]
| Type  : tristate
| Defined at drivers/phy/Kconfig:104
|     Prompt: Google Tensor SoC USB PHY driver
|     Depends on: ARCH_GOOGLE || COMPILE_TEST [=3Dy]

According to Kconfig documentation [1], the unknown symbol
would simply be evaluated as an "n", which is what we want.
"Convert the symbol into an expression. Boolean and tristate
symbols are simply converted into the respective expression
values. All other symbol types result in =E2=80=98n=E2=80=99."

In a different Kconfig documentation, an environment variable
"KCONFIG_WARN_UNKNOWN_SYMBOLS" is there to detect
undefined symbols in the "config input", but I can't find one that
catches undefined symbols in the Kconfig tree itself.

That is, the tool seems to allow this.
However, if this turns out to be a major problem. I think we
can either:
- Remove ARCH_GOOGLE and leave COMPILE_TEST as
  the only dependency. Then add ARCH_GOOGLE back
  later once it's in the tree.
- Defer the whole patch series until ARCH_GOOGLE is
  present (I hope not).

[1] https://docs.kernel.org/kbuild/kconfig-language.html#menu-dependencies
[2] https://www.kernel.org/doc/Documentation/kbuild/kconfig.rst

Regards,
Roy Luo

