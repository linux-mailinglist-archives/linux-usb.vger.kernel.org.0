Return-Path: <linux-usb+bounces-29602-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BBCC04E30
	for <lists+linux-usb@lfdr.de>; Fri, 24 Oct 2025 09:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B35E189D54C
	for <lists+linux-usb@lfdr.de>; Fri, 24 Oct 2025 07:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA6B92FB0BA;
	Fri, 24 Oct 2025 07:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="v3iF3RAP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24DC2F99BE
	for <linux-usb@vger.kernel.org>; Fri, 24 Oct 2025 07:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761292584; cv=none; b=aRC3eX+DVCwGyJWnoZh5Ax3jbl6LbxnOZgglF06GI9AdBjX98Choamh+FLvnvOVaVMecpzN5ejliDWKiNbMmVusgyxb6z6pC3DOgGphqdZa26t9ASmDZ2AX2d2XiDmgIDo7wVAuvLKOyuVX1O4Tuu0ZpIJdJTJ3ho+5C97G2ypQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761292584; c=relaxed/simple;
	bh=nxy0zWX1h247nPbsMpYtj4rqvQKsZpsdIsqOdaa3i18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BwO27n5ZyxEji8ugZUy2t8CcIcSexEN52SPne8Z4mNGP14PKuvjauXrCfT87wQidZX26fNpglGwAb8dHdLqQT/IHcwEkUkoghopJOpjeJStvkN1JAHdM/MWB81h4NghXdpo46cqQ8UNJ6u57n3Vq9BltNV88UZYOuzsRFPDnAAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=v3iF3RAP; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-57bd482dfd2so1887512e87.2
        for <linux-usb@vger.kernel.org>; Fri, 24 Oct 2025 00:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761292579; x=1761897379; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxy0zWX1h247nPbsMpYtj4rqvQKsZpsdIsqOdaa3i18=;
        b=v3iF3RAPDCb1elFqO0VtoWQu+fW6ymU7UCcKEvvmYKNYTD2ooJnLd6jMbuJoUoN+Dn
         48jC0TXcnzK7hHI8l7XLLufqE40irxcJ4vQUvDf4zdOy47noMAAYnUg6+rKFE7kuW8KB
         USll7/Aewk1bIvHRDatF6iZ+ivUhLjYhiJEJEaA/t1MN12k63JvJ8Z2BqetAPfCPpfzc
         bXyJLqDmaG/v2uSkzQNDFkhtLwjQdE/QsFWa4lokn+PvuaNQ6Zeenb8G29xaiiFXP0S7
         FDqWxQyTvlalR9tZ8BC9oRxHctw1PO5qfa50RYj0lq81NdRESC/gWmdIjcg72jvCS2fV
         wJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761292579; x=1761897379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxy0zWX1h247nPbsMpYtj4rqvQKsZpsdIsqOdaa3i18=;
        b=XZGB0rLllpYfKXcjx+x+ejbcJVmzRR8Q/TCsLxXLQ5Gq/mc9dZpmprzNUMDh35VNYg
         VoS7pMNAYbWZKxEO8UJscz6NOxorcS0TAxK0qYTxF2FO5psuqGZffaLB1sqbUzi9JIRo
         HBkGmoSSVowLZqNVgwnJpb4g51tICRtnNZkQyz3bvMf1FGHNC3TcRLR+ZZNv23mEhVHB
         9G3ou7sx8JjZ3hzXyi7H3kAFREIxE1Cukg4wTH/rL2HJreZrsMwoE/3w/7N3k4WufN+z
         lPMiWVTtBA3BQ+B6yVY1Ia+jRFMy6WriJHwckzXdrLFsvpW4/hflFr49hzQQJtIGK1Sd
         tdSA==
X-Forwarded-Encrypted: i=1; AJvYcCUTXvW6aAxgqh1OWZizIlGh40N1ZAUqdZX/50annsJvX5xZhzbVDWTm9x2hrQlLhSYoItr8T0Ks/ps=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyaI0Kk8OjodTrp870buLBOF5RQGfXlJThY9ny5vC03a5K06cg
	oDtw8p1YzTHcOVGjqju4Yme5m5kHeSjSuVOylDgAv/Vob05VvVYqLPf+MFSYNhKKgMBZh8yVBAT
	VeSvth+NlnX9wL4TWLvikVw4XBK5TK/A0TqA+0uzE8w==
X-Gm-Gg: ASbGnct1uSm1o8SIpXN6GMJrACXW1r+RXra6wEopl8u0T4sdOlq7N/jq+BJcXcilw5B
	4hASrEbuNZ0muwu4ftiip/H9b8bogpQqxXTowx+5BxZ/G8YZtxW4KCr8Q4N+1MkOQ81eRP6joC+
	Izl9idcGZxDFtT4geqeRufbh2XaKWie07VdWJgEIvLMdwADQRBLvEV+IQ2H1okcJWvUXHxgU7LM
	d4w1OwJvDtKKUOSrkwGWS8vfHQVQuwQ1JHky/BwVVQVmuD4aG7qqzZn7r7ku1NwC8j0TYThhmrV
	uI3VLvK7csaC6IQ=
X-Google-Smtp-Source: AGHT+IHSnXZ/gyOux7cXwXN4jLtleYFyXBIE1/V6t/jovl+yJ4b+HMb04wimJ5i7xVzENgmv7b2GUJ2i/5ONH7mEpKM=
X-Received: by 2002:a05:6512:130c:b0:586:83e2:2295 with SMTP id
 2adb3069b0e04-591d85525f5mr9376212e87.45.1761292578695; Fri, 24 Oct 2025
 00:56:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023143957.2899600-1-robh@kernel.org>
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 Oct 2025 09:56:07 +0200
X-Gm-Features: AS18NWBwXS6t25LKJEi_UKqvj6YhljrcGI4AFOhItyKPndeRwhvu3EmnTJe9vDc
Message-ID: <CAMRc=MdE=1cPDPQwPQA6mdBkbXF2pG=oQ_oR_YuasGzaPDsKtg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, 
	Guenter Roeck <linux@roeck-us.net>, Andi Shyti <andi.shyti@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Georgi Djakov <djakov@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Joerg Roedel <joro@8bytes.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-fpga@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 4:40=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Generally at most 1 blank line is the standard style for DT schema
> files. Remove the few cases with more than 1 so that the yamllint check
> for this can be enabled.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

For GPIO:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

