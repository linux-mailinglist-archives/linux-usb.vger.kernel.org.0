Return-Path: <linux-usb+bounces-31601-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE49CCC970
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 16:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C780D3022BF1
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 15:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53F134F48C;
	Thu, 18 Dec 2025 15:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BggJZifg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A08B34E774
	for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 15:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766072868; cv=none; b=FqXxVRNc9ExGAVLDKxB9VEiBhV2QbaJJ2x2Ykh9CwFF6TGe3rrjj1NgRO4IAXeRmIJCh7wOVHOZCFX/Ql3ep8k8vaoCfURnZQ7j33IScWW+61aXhYoKWQ86XARdvnUf3+LYn7ZVElvG+lSIn9slnAM5bxYZW03i4eyGtLylGMno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766072868; c=relaxed/simple;
	bh=LzxNzF7MpItYcU3pEGmTXATHal65pD7N5vjHukp5bDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ed3eCqK9icYyHmJrv+ct2Z+91tSwv/i+UzeOlLtt66pmXwOlXzfgiHYt21TUD+D+u7+Uugj++AFgvaA+4YX+DnhGspttFqxHtLR/tubxm8FHyLwk+rzwDizMsGP6nUlqWWc4OXDc4dDJJZk6F+3GgV4+HJ5zo/6B+McUBftzx2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BggJZifg; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59431f57bf6so840383e87.3
        for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 07:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766072864; x=1766677664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzxNzF7MpItYcU3pEGmTXATHal65pD7N5vjHukp5bDE=;
        b=BggJZifgjvx24PLzSYnjQCRW8lcVGi8OQ3JZYKH1fJf+W1Yphj6PpOXaY/v+7/K3Wq
         svn7fUsuVdAD8JmSROt9ZGzmbTXjYttt2FcrmgoL0MMQc5OGRIf2ubxQfS9ZRLXP1poC
         ljDz/txTjHP5Sg82DWwHJHrkU8aPNTpnkAsintYGBGw1KwwG74ZAxbJ5/21OQAjIrT9g
         Zg4M2Xk8tsIh9wGMDbpVgX6TqPuZb1kmeYVaoYa7NNhxa5eKwL3ZW+KBSNKNbsam59hC
         Tf9/JyaokJRpw5kT9rU1gJaIl4QPPQaWLx56+SBJPNIZl8SkOVFdUvA3EUTrqZkJn6e6
         QQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766072864; x=1766677664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LzxNzF7MpItYcU3pEGmTXATHal65pD7N5vjHukp5bDE=;
        b=f3ul57zCkryjEnWxrsgjat8BJFnXpgq69+v88TAIxgrkNFAcvquD2WJVjZYuMzxI3J
         5ftPumbUKHdgTeyWOklUkzf5cO3hSS7t4fiiIOkoOV8OiFWPhky9M+dAprTnzAbT7yil
         avXXTbu3ySQkV4qSq96QVnnQ7eT7Itm9eMgdpYEk7+Fw0BiRY1zPW4Fix00jEIAMCFj9
         t/s8c0lqfw4JvGCC+4rK9JKeJbRGXqKoX/rg3FvG7MYya4/ZaoK1C25UqtT/CzzPOvVe
         L6Mpo+eL8Ec5MPSwuTzIFOOjxzZvSxTYKBvqxyULuEl8ly8pl7hUK5QfhZc9/13LspoT
         CtOw==
X-Forwarded-Encrypted: i=1; AJvYcCX/D3Eu1RyG6tMgUaxqG4+gobKhV3xCfR9XYORic1cf35HvtaCWohXi7GZ+Z7SequLxYb9gjD8B884=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxBv0kpY0PQH47nVFXngaf62ov59NnW44vzzgpUgBu78N1CTGs
	Iscp/tFSaY1tjGmh3V6xODsfwSC1rRWT3/v4bWaM/bTizDqVN2Z8Yxb7yFywYy+q4nP4Up30WS1
	qMjhAbMyQqcZYyeXV8u1HHg++DZzy6rg=
X-Gm-Gg: AY/fxX526ZNLwU2jNc19oAhogRcIASaMgbuTqGqxj++Nk/oY9ZSv3pbchJ7KX4J8W7K
	dFvL1coavY6ot/zgEDT1qpgrQSIInnjpSjWtkZR6JJR2+8qWjEIewx1wzw3CIHNFKeb3CdwSJ1P
	MFpcCeCXhZH3FXtW+Bs9Ure97UkmMC+nbtrZNUAzmZg9dwX0bcYgthBbhjfpzsAXq5XykQwO4I4
	Wx3EgZR1gAbzuH4okPcjQZzfXbj9xaSI5lu1vLCp9r18mJd2c7EEA3SEzwNVg6vyVVAw/frM44V
	LdM8vAlgHokVzUaVGC2LkVfsZqU=
X-Google-Smtp-Source: AGHT+IGrYbGUckFbA0uI/Uak1RoxWaGizxcWDMRvFWxpw/hL/+bdMgS3hQvghW4USBbg4LCsrOKENWVewsmE9VZ7WWY=
X-Received: by 2002:a05:6512:128c:b0:598:eaf8:8f5a with SMTP id
 2adb3069b0e04-59a17d573afmr14623e87.38.1766072864074; Thu, 18 Dec 2025
 07:47:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com> <20251218154412.1524249-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20251218154412.1524249-1-alexander.stein@ew.tq-group.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 18 Dec 2025 12:47:33 -0300
X-Gm-Features: AQt7F2qc4TJ7gyArwoED7PIRPB0eAsifB8ZnC9eeMqM3yyZByNJJ_XOF-WESW6g
Message-ID: <CAOMZO5CmP_rdFA=PqGSmKDU+ObzifHFDjwYMD3J67bjs0h_sfw@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: Add TQ imx8qm based board
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
	Roger Quadros <rogerq@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 12:45=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> * TQMa8QM on MBa8x

This commit log should be improved by explaining the SoM and base
board in more detail, providing a URL, etc.

