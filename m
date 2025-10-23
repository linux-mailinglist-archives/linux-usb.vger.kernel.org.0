Return-Path: <linux-usb+bounces-29591-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2012C02323
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 17:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3CD41AA1789
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 15:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918E333CEBC;
	Thu, 23 Oct 2025 15:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLsEC/hK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FAB33DEC5
	for <linux-usb@vger.kernel.org>; Thu, 23 Oct 2025 15:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761234150; cv=none; b=X8dRgf/8yn2X8NQfeSvQbjrSSYoY06zs9RkMx8Z1XRSkA8zDmUyYVZhQo3+WU3yAYTJPrMT+Ek30zioB6h+VF3Jfs8ZTHsgnOW+McaBZKkK0l7M7Qoc5G1Cr0MGg/uGuXzX81FoGrtwHE/bW+7zwmcsqcn8CZaVhG/YKid2nKx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761234150; c=relaxed/simple;
	bh=CdcIJyHX4clb96PckgG+JIrIZVu7Cky4+dgR8wQZ0AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QhzcJAU9EwO3mmgK0Q1FYYGDK1GTzLp23MAOFljoExIo5xbA0Udmum1rBba+Xd6UYJE+kzGAuzN6yCcHj+HeyNBx3+54R+n6viyjhjMo63bL5tK5J3pYqYs2/HkD7vRIxhTvtEUhYKzGWL1tV0cGczLJ8p6r3st4eHDNvnRy/a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLsEC/hK; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-290ac2ef203so9374735ad.1
        for <linux-usb@vger.kernel.org>; Thu, 23 Oct 2025 08:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761234146; x=1761838946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiXLImZ7fPO15Ek72Gzubnx0U1bgG0nde4mxLe+ZreM=;
        b=XLsEC/hKI9rcYtvZep1kAQCqqw3YI29awmGXe1rBHmx869IAnxsBuaeEQYB0t6jLQs
         imXwO/2IUFcQ/T4FXrbzCa4iK4fw1KiOFu5ITCVwnTwBKQFw/Ld6UhdCElxyHmrOnC6L
         ZlL0a4p9RqTAN+T048bJ/RrIYJM+v6w4/AwZafr2sonvbFsXG58KyM/1bY5LSWq7BmH0
         3sFqTzk+Cpf+GXDmZpQEcqhfDS4YOKcZ/CeX/sZSZCikzQoMak/Sjbj0n1nb+YU+m0Qa
         D8WzDb1sjN9Dk5u+tUXh9878VLKtcU+YcYZlNPE3+zGCQNIaoO7A4ZRnOKxhG75gCRmX
         9aWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761234146; x=1761838946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FiXLImZ7fPO15Ek72Gzubnx0U1bgG0nde4mxLe+ZreM=;
        b=pMjAzkx1yspYkjIYgn48M8DH2gYnKDXbU0ONrmZNd7S2DIMlNat7S9Ck/gj0H+Tl44
         /Us5s7k7Pv0g/sb7c7Y6as3jgB13DHhPLksF6FissAlLDusp8H9O9P4mAaI4vHaf/Msf
         dp0WpkSqwGlrAp+Ui/7+rJgRMUjbgu2VdBF6XEYfnvCmJV+u7z+GY4YCWRcSvOCNUSNz
         ToWkAGl1I/V+3kCBv+3a42Jy0h/FTcCwKlr/LUnhtTRXGoSZRjhhleyJDRubO0mTSsL/
         rkTKCvQSWHb5qAkINXt6dmMd4CNA5CCU0R6abgL0QbbFwEPQL02Pf2AFdtzUYo3855xd
         ddhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6ntc100sj5K4cG8UBrM5xGCnTxEOyWV2qqc4VNHlRBX6bozsUa+nv4PF1AyzizqXu5NdYM8iLmn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIqFC4doz9csw6Va1gKvLGDcpz9f34Y8kBrR2iIKnnsVZc7J/a
	9Uec3gKhCvOLsG4dZqGNPtHS/yLjbbgZR/jcNpJFtXK8IJZrKPlgfzBT
X-Gm-Gg: ASbGnctIuEdnTWL7LL0Q4guUrxB6b3s1ODYejsfajgWGH+vBKTEDZ3ozlLbR31FXDRa
	NqUG++Nw4vL4C9wykLVHF7/aT80pgsWMjS2K+9dDH91/IvABSEbY/u2y18kZqeVUPtlaSg/TC4Y
	HEXxq6hoWpxqpNjUKaDOaEu34ShcQlK8K+s7+EP+E9R14fGk/qGNamIRswMJMEI4Efm5o8L3EC/
	AnY2++5Q6CDPn8tdH8ycbe0QTMeGhARcP2M0ghFtmToQYxUlaiXNyvemuR64VPcsRV0ayfXzMhZ
	EyqMT6G5jhlbQsajlmkVkMNWRmVCEdUqUk7isMgUNy6hTHXLUrgdoQ2sTXmugDHg92lMZ5/0Sqh
	w53CUyoWhewLj5igBWlOtHIkBpj/D7tUU04kzXBrMyIXsMWCPbnzV/0nLEx0mJbTXtApSEkHD1u
	42Kd9yZX2kCItA
X-Google-Smtp-Source: AGHT+IFivLiKbkP0y2KMH2ZNEJ7GlEhOb9t2a5oI0W2mRRwwxItjHXvAd1GZTuvYOgULd0RdTXOLyw==
X-Received: by 2002:a17:903:1746:b0:290:9ebf:211b with SMTP id d9443c01a7336-290cb07d223mr295078455ad.40.1761234145718;
        Thu, 23 Oct 2025 08:42:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dda72ddsm27825615ad.6.2025.10.23.08.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 08:42:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 23 Oct 2025 08:42:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Georgi Djakov <djakov@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joerg Roedel <joro@8bytes.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-pm@vger.kernel.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
Message-ID: <0d01d218-15df-4553-8e84-fef84fde211e@roeck-us.net>
References: <20251023143957.2899600-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>

On Thu, Oct 23, 2025 at 09:37:56AM -0500, Rob Herring (Arm) wrote:
> Generally at most 1 blank line is the standard style for DT schema
> files. Remove the few cases with more than 1 so that the yamllint check
> for this can be enabled.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>

