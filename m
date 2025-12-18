Return-Path: <linux-usb+bounces-31608-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE9ACCD4DD
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 20:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE59A3015A88
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 18:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CFD32E72E;
	Thu, 18 Dec 2025 18:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzOjmPrn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EAB2ED17C
	for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 18:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766084327; cv=none; b=OkIbHj6rDs4rdYXzxSe+s3HQAsbv0soa4DThI9aJSlgLusJHWKyRlURNGk+hT+6aJITDecO3iL0oqVcLmBfWxB96efDlaJikQdZO0iBv6QEKlZ2VML2ttCiIAw6n7fc1Iwljxr6oCoC/eHYmin+oZj7yBYiGigrX1SEGifNVDk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766084327; c=relaxed/simple;
	bh=Jku28IM/c1IYSHnKsavbvy9aaLBIgMj3F4YQHgrupho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fql9EefKWN0X6rWKax3aUSxWTRvc0bntj2M+qOdfYFAbcgOUgdtE0m4Ljj6zjpOAiesQWaamREKzOxjfVSmmJc68zRBSqGgZ/jg7LPlo1ox76ktLyr+f9GZYwI4YjwtpSx4ZVvFoU5+c0DokSuwVCKnxIxN0xfnFqnT1y249XEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NzOjmPrn; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a099233e8dso9563885ad.3
        for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 10:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766084317; x=1766689117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQfRVSe9fO1PObUKRZHse1cNpjrf0uUXBusNVMTFfiA=;
        b=NzOjmPrn46f7eL94kTiu7+0zvL7EqcBFTL/HGLf3Rc6h3rBZjvJM5i3qCCD2fYrXy7
         eJklrOOWGmpDdYURm2bD9+/3PlBRsY8WKHCZ2GLGzwLcw74QlWuQ3QwUrvnoh8XgWay8
         gOij/Oftk04H9HcDeMjrum7Gp/tJMDS9TcpBQwDo75WutLi+yiY8j3WBiG0hbm0He5W7
         e9CpO9bAAOVDpz+N+io0xTJRBjOcs9kNkjAd+Z+kY0znjtSG4hOPaCJlbg1PV1xakEpj
         cFYP81lVX+QhyL2f1NFGqqWTbtem9suiHwzZLYFwy//KO+NJmpEmbUADkYq65Km/0XcM
         myZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766084317; x=1766689117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AQfRVSe9fO1PObUKRZHse1cNpjrf0uUXBusNVMTFfiA=;
        b=dMVMnIO++n6Nw4RNhZx9xlRN/SubhszoMBMfNX1J9tKJkL9lJjjXAFo+1vT9YGN+bH
         W8KEm6DxcF1WYXiKylce4/r/1FYP9Vla+It+3ml+tNdtPyvDwjoT0Z9+r5CHTJpJ2+1J
         Pxk+p0yB7JxsNAwQJ0CDMBCA798dUEnwYbEvhVoCd/1PMmQ2sI24y0GsKK1tPZX/q4XX
         l5aI0JCxzD7zxqJWRDTkPRIIkoMWPFI9QqfEsiCPfNGsgwan7JFgXfD/t2oZuYByLD2Q
         XjDhm2zkRPvwCPN+bs2pmNRwcPaQd5p1h3nQfeHnyqm81dhEcYPDczZgXqEUSYksz1R+
         imlA==
X-Forwarded-Encrypted: i=1; AJvYcCUt2xnTmp10FliKFfujcK/a507gR3rEJrAvqdMbLUsFl4N7UDjYiNGRNI56NvZNKiIKeky8pIIVVME=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc6ZcaAKqVKLQ7b49uB2azvSvZeidzG2tNNBRIFGfXGKwQTSZa
	5VjdltMs3lofRMGXGAW1BWQNPGnTURXOGRuXwlvlWXB/YbmfgyEPFrWK
X-Gm-Gg: AY/fxX7Yl8ludX8qmVILUgsecMZCw9IkiAa4yFV2hkG7tbthUCDOSsMTfPP8YPxgrLT
	uLRsKzCAgHbqfSfCkaUMKfJylOEYeey8NesqYSbfw5v9+Jeb3JqoLFWNzOhmpE1kZ7qdY14ZejN
	fjWJCywNCtZTfpKigmhhYE0cSNKlPTu0ouVlrgj8rL9Tp/FiSwMl/XKPmxV9l5L0Mjhn8eqf/1a
	W8S7/po4pBEvuD+NxsBm4hpqo7vEyDTg9kQWUyJ9eWTfmJczl4i8axOml2LYM5ZC9JbKqHkivvf
	GEWesG8cmyNvE1r1GiSRospWKSAkBQEwjqaUrjLc+SkfzmSlH6TUmgWtXtwnFyuDJHDW1I7jWxW
	bYw2pXi2KtPTrvjATtHz10/iqcHAGkaUbcWlrL7IGzeym1pWbzzdNAgOydG/9W3H/bc1GjYF/lk
	UHZzOVsWgCWqH3TAbHvQW9lNGc
X-Google-Smtp-Source: AGHT+IFf3D0xeHaQPPXEeazhorZHgIgTwRHiyRuussKNgJjGtFBYIJhQUMgRhb/IHzjPiFdB5lKzgg==
X-Received: by 2002:a05:7022:3705:b0:119:e56b:91e9 with SMTP id a92af1059eb24-121722dff1cmr177764c88.26.1766084317443;
        Thu, 18 Dec 2025 10:58:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c0c6sm299016c88.12.2025.12.18.10.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 10:58:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 18 Dec 2025 10:58:35 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
	andi.shyti@kernel.org, lee@kernel.org, andrew+netdev@lunn.ch,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linusw@kernel.org, olivia@selenic.com, radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	richardcochran@gmail.com, wsa+renesas@sang-engineering.com,
	romain.sioen@microchip.com, Ryan.Wanner@microchip.com,
	lars.povlsen@microchip.com, tudor.ambarus@linaro.org,
	charan.pedumuru@microchip.com, kavyasree.kotagiri@microchip.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org, mwalle@kernel.org,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v2 15/19] dt-bindings: hwmon: sparx5: add
 microchip,lan9691-temp
Message-ID: <8462a516-4e8f-413c-813d-e7ff0e6eaa1d@roeck-us.net>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-15-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215163820.1584926-15-robert.marko@sartura.hr>

On Mon, Dec 15, 2025 at 05:35:32PM +0100, Robert Marko wrote:
> Document LAN969x hwmon temperature sensor compatible.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter

