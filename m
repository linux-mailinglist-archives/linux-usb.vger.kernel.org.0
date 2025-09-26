Return-Path: <linux-usb+bounces-28716-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E672FBA45FC
	for <lists+linux-usb@lfdr.de>; Fri, 26 Sep 2025 17:15:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C3DA3B480E
	for <lists+linux-usb@lfdr.de>; Fri, 26 Sep 2025 15:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E911F1F8EEC;
	Fri, 26 Sep 2025 15:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="CXk4sqxJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF12818DB35
	for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 15:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758899742; cv=none; b=LiszQbnh+6vNjpvJKtFzjD3n7sl5RuGyAKiQ/QzxR4/ecnsenaoL3nXlOeXGn6IipKRNONHQSsMR+J0b9ZL2Y6ADrEj2ctWciLULMeps6YLhatVEvenvujWW/k+WnhcGdtmM4ZvRmh4L2Nou3m4jshfPiDuXrNcWCiKEi7u/aBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758899742; c=relaxed/simple;
	bh=tnE3QGr4qwOpMW+YrXCOEjh1zg0YQogd2On/Zb7EF1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRsJbvoK1QeiE9NTBL3qhjQRUhSDnaF/eIpcz9xG/JymK7F0oGNfUg6js7lq9KhE0bPocPGdbWgNx8n7ZCejoLhcTUyLqLqN7njETnJgc60WGDOs4CAee1si4kg9cfFY8Bf2eUZZJJsBy7fp2urbFKgn/WEzvkmeaJuPY9qDEPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=CXk4sqxJ; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-80ff41475cdso14637846d6.2
        for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 08:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1758899740; x=1759504540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8mgmIsUwHn5NnmA1QDmFh3xD/ZS6ogc5baSh2F4ITRY=;
        b=CXk4sqxJJ+h9NUHlMDlicPoxGWs/wBCXgn/TcYPTo7Xuq6BD+afR6CuJS4OWaTHEq4
         pqgvimceEQO/eFvgP/b2dB5CDAO03svGY+gIjPP4Bx/zVzl7h8hh5KJrYRRCM3PJeU0D
         SD/fUxLPrEHtP/ivbb5VgLhcPbg90NjBnsh6HDMNPRsSj7p5BUinBM62EQ/NIElQ04Fi
         qh56xth5ie8Cr1wnMeQe4v2Ex32i0kImhl47tCq+oV+rMp4wiZGj7aOXV1nbV8dzamg6
         zGnz3Tx9Y0Zd56Z9KopxVf/D3bNabc9Sm5zY9tC99kziFPivCLYkhGquiR2T/t2YSb9X
         l5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758899740; x=1759504540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mgmIsUwHn5NnmA1QDmFh3xD/ZS6ogc5baSh2F4ITRY=;
        b=L2kf6Q2fw87/MgV/ax0e7yCGv/yWBkJD5aF9pbBg1WNtpPz169ShL+Tf+s1Y7pXFQR
         yri7kvEcWe4wg1HOQcUIvzJD/11/wSGrdKEyqOmKgPy3yL1ntBgsUbmjEoa/8WBNdGUQ
         Yb4EbS4jyCz/cp7UHqJUbhgjTtWuQZkEUazwTUHVen2CUYTloxtKySmb1YmTTVuwm1Zs
         CRSsa21sJrPs5yxQXUbfHHl0V2k+/O0eKbbLEAPd8XDLzms96V8v/rqlmy5BR1BYN2X9
         dIzf8WoY6omllH710k1+2DJy1ZHZyXDXDj4jdI8jnBY6ATpxPrcxdsbaYpzwZEnpJ1yu
         p2aw==
X-Forwarded-Encrypted: i=1; AJvYcCUhNJ+hYtLYfHhpqCd5PWPDjQDdHkqKVbrk7U+o4vYOFd+68tykbgth4GYCEP8WpiGQ23WqRqaXqHE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzdVOa66hEAgBkFSBVuz3oE4My/4wUn/H4+lFDIFFNHJ5X1R1e
	LZQufQIkevcgHhuQhZ5uE4zwP1i0wkouEL6tHjscMlKGta4pTZl+r1G7tJJEdzA6KA==
X-Gm-Gg: ASbGncuw2IpzgbFBfaSOS6YGTkltDXFw3fwlI5Wu9/4AofOt/t0D04bdKWfF5XisuhF
	fV7EJ0GX/TziSzNXbY0OP9O7jB5O0poOoGu4pYFccvNIogF25gnpGyE1aE7DrPPvAM6CQtKhSkh
	0lg2oCcIWtuZfDEXME7s+2HDxFtR4g8btYS0xCj/nWB9lzSmim+Qg1H4+IIvoLPE48TyhRUPLQf
	amKKkDl0+toZ4gvENIov/oCpuJsEUWdXAq2eaHq+IilYE/9lnQLT1YMjCZIyLNgOPBLOk0agIY3
	on/fqy3jeAGpOXRx1tisG/D0ipA/f+rI+knDratiPFE9sG+c17ogL4CXDC1fKZc6xP8TaLnioxf
	+JU3ilHs/4zyqc/1pbpU67V4hcX7O
X-Google-Smtp-Source: AGHT+IHx7x8dpmnst2zIiS/IJcJkHsczM37IMp4b3wgC1hi2by/LThI2vKSMV96wujtmqZa+sVcurA==
X-Received: by 2002:a05:6214:e42:b0:78e:6354:b258 with SMTP id 6a1803df08f44-7fc2b767d7bmr104171166d6.15.1758899739627;
        Fri, 26 Sep 2025 08:15:39 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::bb27])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-80167018730sm27530516d6.39.2025.09.26.08.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 08:15:39 -0700 (PDT)
Date: Fri, 26 Sep 2025 11:15:36 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: ehci: Add Aspeed AST2700 support
Message-ID: <69e6fd9c-6020-4caf-b6e4-644ae794d421@rowland.harvard.edu>
References: <20250926023308.2890607-1-ryan_chen@aspeedtech.com>
 <20250926023308.2890607-3-ryan_chen@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926023308.2890607-3-ryan_chen@aspeedtech.com>

On Fri, Sep 26, 2025 at 10:33:08AM +0800, Ryan Chen wrote:
> Unlike earlier Aspeed SoCs (AST2400/2500/2600) which are limited to
> 32-bit DMA addressing, the EHCI controller in AST2700 supports 64-bit
> DMA. Update the EHCI platform driver to make use of this capability by
> selecting a 64-bit DMA mask when the "aspeed,ast2700-ehci" compatible
> is present in device tree.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  drivers/usb/host/ehci-platform.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
> index 6aab45c8525c..18e231d345d0 100644
> --- a/drivers/usb/host/ehci-platform.c
> +++ b/drivers/usb/host/ehci-platform.c
> @@ -27,6 +27,7 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
>  #include <linux/sys_soc.h>
> @@ -239,6 +240,7 @@ static int ehci_platform_probe(struct platform_device *dev)
>  	struct usb_hcd *hcd;
>  	struct resource *res_mem;
>  	struct usb_ehci_pdata *pdata = dev_get_platdata(&dev->dev);
> +	const struct of_device_id *match;
>  	struct ehci_platform_priv *priv;
>  	struct ehci_hcd *ehci;
>  	int err, irq, clk = 0;
> @@ -253,6 +255,10 @@ static int ehci_platform_probe(struct platform_device *dev)
>  	if (!pdata)
>  		pdata = &ehci_platform_defaults;
>  
> +	match = of_match_device(dev->dev.driver->of_match_table, &dev->dev);
> +	if (match && match->data)
> +		pdata->dma_mask_64 = 1;

You must not do this, since pdata may be pointing to the static 
ehci_platform_defaults structure.  Instead, set a local variable to the 
value of pdata->dma_mask_64, and if match->data is set then update the 
local variable.  

> +
>  	err = dma_coerce_mask_and_coherent(&dev->dev,
>  		pdata->dma_mask_64 ? DMA_BIT_MASK(64) : DMA_BIT_MASK(32));

Then use the local variable here to select which DMA mask is used.

Alan Stern

