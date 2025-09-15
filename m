Return-Path: <linux-usb+bounces-28115-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B008B57E6C
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 16:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 937431895752
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 14:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE574313286;
	Mon, 15 Sep 2025 14:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="iuaJnCDi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCFC30FC17
	for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 14:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757945333; cv=none; b=aTQmuvWYvacV9tFK9IocxI781NXixu700nW0JU6t0laIibPE0rvza3esFRSEx7XBSGK5/lf0uCNaYxOg5XdeefRWcJ3LZamSKWM+3cL86EGJTlTJGIWKKrZ8e9rGdoFWxWlt9xK7ACOAlrvBvjDhWo6yx2+NjH9gxAZGS88yNaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757945333; c=relaxed/simple;
	bh=CFdz9SBebPziM2fQihiODisdksPGhrdbkpIvqubAghI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j2Sw6bcK/gyWQ5vZS0hINTJIAiN+uL229dBOzukIhwSCcJ6hRT4A4BYw3k0E2c5HKs9Lqdb2dJAqECp8S3S5iKjePGMCnb9dlHQ/D6nXsLbF/cAbzdX+h58dN5ahLgQ9iNSTM1b1fHWgUtK9msLILGHydoWn+C7iZCSCWLV3EjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=iuaJnCDi; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-781fbbad816so7490516d6.1
        for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 07:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1757945331; x=1758550131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bT/fKPYPqCKNM08+lHlTAaEmzw06dWk4v6JQAr9+btc=;
        b=iuaJnCDif0E82LxhFJpb+snLTcMHd2LMw9oN5oMEPM4wL29dmPBmp2Mqlg/gtVY/hF
         9tjxGpGDbjqfeB0Npgkme5Zm2Qk1VhyDjMDx1kP5zINIu8GIkBaVbfHcmdROndbKo7rZ
         6BNAVfPSy96b8osIo/Gc7+Ns8gNZUglXjG5VUexG5mx+dNZEnQLDv+5j7i1+gN8cV0z+
         UmVWDGdpnAubZJwMCP3j7KeVbGsl35x2qzSqi7e66c1qDmcQbnyQWs8qeVrjipLFwsHW
         iqUWjW2wbG4445OVEA813kIht04EA3+S6+qt11T+bgslm9z/ZeZhaqkKrg7vdtlHmj05
         pREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757945331; x=1758550131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bT/fKPYPqCKNM08+lHlTAaEmzw06dWk4v6JQAr9+btc=;
        b=EWGyDBDd3Z8PB83iGVXJT3vBzrCiNwMh2hMpEvIhPd82OkE+fALheZE7AoT5zm5Yqe
         touxA1fyPzAJxHjJRjAGTQYR3SM3eAlR2mM2zR8RcbXmcMZN8gdHnHECghQDfKfF7E3n
         2Uh+0B9iH4Qtjlxzb+1O3G7qzO746HYR2314t+L7mGaS2YJkcROf2uyhM7BcvQAgAGRE
         3fvwpSF+Kp8vx3azFecE7ZoKc2VhyptLMVJiM5KBZVN0sL37gk5XOsmWA/Dzx6f8u0rK
         doOCvgk8AQAwtIYZguXJ72q328qoaDMB+OGVTbsBtka7SKW6ZixXbl3ecBoF53/mWE4l
         T1Yw==
X-Forwarded-Encrypted: i=1; AJvYcCU3HbPjUGuOEgIhYWhMftyCPkZG1xEBdHZpjHtJFpJ/yRvoc2zNC//btyzRDzOhLnfxCp1Nzprgsog=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyLNIp81wj2/OFs+OyjQEs7WVx/Ffmqc1LC9xO2LAiOf/Ma8Lc
	POdeUKSRfW3a1D+ZUmiWyZF/2CD5dGDRNcx8qVUx6SNwI/jrlb8y92HBVqSgmiFV3W25mo9QZYJ
	mImM=
X-Gm-Gg: ASbGncs5aXhYTUTHIbMw5RqbTcPL/A/attnl3Cyj7ChYCDxq2Dni/1pg48zlrxYg9Ck
	uFJAxv5P0FkJGWhEIssmJyAfw9IrcU5gNdfBt8qFJTxYH7bN213btcotwEdH01FE9/bSigRjND2
	nkk5VjYMt+XmiV+VOD9QIfjgSsMjsV98a+hBPdquoLOdkJzAa5CLnD0boImN4lS/xUF+N2E5uvX
	KOieufp7W4N5LUOT3t5hC58VhV8iGV49z99KTK6Hekc1aWXI1eWGik0dkjZJUgxAldavTdK1nhg
	lLjQFZPbbS1QUQIgZdAKMi0Fi5rC4M/db7qD0YDzwJeSeAuLcZZc/UsXOVWEtuMExhxgWbSGAmi
	Mjr4bqDNeLsnJawcL8z0D1w7JbzC1ct6znGlAZ9OfUw==
X-Google-Smtp-Source: AGHT+IGgUoL7jLIBaXg5mPC5yFH8zCfSY55YjyfTo82yTMlTSMjgpi1YulLIkoPwfHcFLdYBMd00kA==
X-Received: by 2002:a05:6214:d83:b0:72a:1744:aa07 with SMTP id 6a1803df08f44-767c410ad98mr176817436d6.45.1757945330498;
        Mon, 15 Sep 2025 07:08:50 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-787dba7125bsm10991896d6.6.2025.09.15.07.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 07:08:49 -0700 (PDT)
Date: Mon, 15 Sep 2025 10:08:47 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] usb: uhci: Add reset control support
Message-ID: <3cf94df2-48e1-4cbe-8f0a-84f05cb9760d@rowland.harvard.edu>
References: <20250915073926.3057368-1-ryan_chen@aspeedtech.com>
 <20250915073926.3057368-3-ryan_chen@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915073926.3057368-3-ryan_chen@aspeedtech.com>

On Mon, Sep 15, 2025 at 03:39:24PM +0800, Ryan Chen wrote:
> Some SoCs, such as the Aspeed AST2700, require the UHCI controller
> to be taken out of reset before it can operate. Add optional reset
> control support to the UHCI platform driver.
> 
> The driver now acquires an optional reset line from device tree,
> deasserts it during probe, and asserts it again in the error path
> and shutdown.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  drivers/usb/host/uhci-hcd.h      |  1 +
>  drivers/usb/host/uhci-platform.c | 19 +++++++++++++++++--
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/uhci-hcd.h b/drivers/usb/host/uhci-hcd.h
> index 13ee2a6144b2..4326d1f3ca76 100644
> --- a/drivers/usb/host/uhci-hcd.h
> +++ b/drivers/usb/host/uhci-hcd.h
> @@ -445,6 +445,7 @@ struct uhci_hcd {
>  	short load[MAX_PHASE];			/* Periodic allocations */
>  
>  	struct clk *clk;			/* (optional) clock source */
> +	struct reset_control *rsts;		/* (optional) clock reset */
>  
>  	/* Reset host controller */
>  	void	(*reset_hc) (struct uhci_hcd *uhci);
> diff --git a/drivers/usb/host/uhci-platform.c b/drivers/usb/host/uhci-platform.c
> index 62318291f566..010c458e7d8f 100644
> --- a/drivers/usb/host/uhci-platform.c
> +++ b/drivers/usb/host/uhci-platform.c
> @@ -11,6 +11,7 @@
>  #include <linux/of.h>
>  #include <linux/device.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>
>  
>  static int uhci_platform_init(struct usb_hcd *hcd)
>  {
> @@ -132,19 +133,33 @@ static int uhci_hcd_platform_probe(struct platform_device *pdev)
>  		goto err_rmr;
>  	}
>  
> +	uhci->rsts = devm_reset_control_array_get_optional_shared(&pdev->dev);
> +	if (IS_ERR(uhci->rsts)) {
> +		ret = PTR_ERR(uhci->rsts);
> +		goto err_clk;
> +	}
> +	ret = reset_control_deassert(uhci->rsts);
> +	if (ret)
> +		goto err_clk;
> +
>  	ret = platform_get_irq(pdev, 0);
>  	if (ret < 0)
> -		goto err_clk;
> +		goto err_reset;
>  
>  	ret = usb_add_hcd(hcd, ret, IRQF_SHARED);
>  	if (ret)
> -		goto err_clk;
> +		goto err_reset;
>  
>  	device_wakeup_enable(hcd->self.controller);
>  	return 0;
>  
>  err_clk:
>  	clk_disable_unprepare(uhci->clk);
> +
> +err_reset:
> +	if (!IS_ERR_OR_NULL(uhci->rsts))
> +		reset_control_assert(uhci->rsts);

This error handler was added in the wrong place.  It should come before 
err_clk, so that if an error occurs in platform_get_irq(), the clock 
will be unprepared and disabled.

Alan Stern

> +
>  err_rmr:
>  	usb_put_hcd(hcd);
>  
> -- 
> 2.34.1

