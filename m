Return-Path: <linux-usb+bounces-31605-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF69CCCF36
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 18:22:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 073F030184F7
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 17:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC80A3596F2;
	Thu, 18 Dec 2025 15:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="J0z0AW9h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D19533A704
	for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 15:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766073141; cv=none; b=mkXmRU+1+8JxNCRZcv+oq50+2Pm20QoC98XspordMrTBcRDMOza1Jh/Eruo79vlnyLyPLgoRZrrLcobWf9OK5s5mE/F7Y2uDTL6eAg04QqnIoVK+U/aYx+DDdO4tIrbxISQFUpUWU9O1onRSbhjh9hVoTKnXW/6fkvilv4H5pnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766073141; c=relaxed/simple;
	bh=Xh1E3qsm/qasJNMVvvqXFxuDKwQq6V1HA7yNPOSOlCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMVwHCFJBXsDORL9dSBu4uH8h8ErkXrU8INpSBCoac/v3zXNspfaOaje9kQ4f8WR06hEG7yEz132L0txU6dAbuojpv174mm48v3z7LwwEHAkZ8WNSBlpcBqk9Cq4bNnv5tFtQYGELrmz6941RmkvhL/mE4TmDOHn3LOmfL4hZHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=J0z0AW9h; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8888a444300so8313436d6.1
        for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 07:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1766073137; x=1766677937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cW1M7fqhwlN10fdEj0fPal9hwmmZjLYjufee+fkgnhM=;
        b=J0z0AW9hKzi615k9wVeEjklkDNiUsuVhMB73ArCAzXQFZEy98P6rsaOIlgu5bUa/Ve
         wA/h7ENiu+pb4HXbQN8Vgu1fZ9UXar6Cb72lIMmQpTgHbXJx4YB6iRe1VSa446LR+A6o
         o8HXVGmPS0yei3Bb94GpwY4aCgLGcou1BPnDHJL/SINWaJ3+6HrVfgsuRhkfdjcM6UcU
         HK3JiURUtsNRY46F/xMvb4LRh83y64W9qi1kaOXq8W6fE0dHah5C5SK2d/RGOL+bndRD
         fHzgKBCN31aT82S8FdM+AlZGIfG7ORh+yzGNk6b+iLowBGGOnUSKfFOjNmdgToJ/v/wV
         G5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766073137; x=1766677937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cW1M7fqhwlN10fdEj0fPal9hwmmZjLYjufee+fkgnhM=;
        b=WQ0gNzunq86pIyVFMCBe+TCXyhvwpOEtRVMFGCbwW8JXVY5olDaAyGkFOAYOpvzBOJ
         hQJJI7y75Tlmb5FKELE79RzARSaViQxpKE3vSbrGpAXSQKeSVoCOHPGWOu2gJGgbQXHn
         8TT97RPoxoEcsrrkd6G37ZYommryruxFgFpn467d29a967mxBpiniNtQKgiBVdm9Ngj6
         8KlyLKs2aJ/2ttqaXUvg+Q6n+qcGdMD1GWObcwh1qNFbZmTPrL/MxshgNrsojrScp+/2
         ubzdqPeswJaEH+ABpfwRWmBVJwqVTlBhG75ciFm1pdy3+eaFQlpI6KrfWSEm+DuqYdgq
         jsYA==
X-Forwarded-Encrypted: i=1; AJvYcCVT3Jw8mVbnVAgwad4912EmmJ4b9Q0rH8UHa7va4M7UkWIyo9qynA+geyrlo/cpTlargmDDzPwUsrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB7myPZ02IwBZ/C9pfeP47YMyDQBqnwlJ+atNn4krGB8YwQWv1
	i/ZjX5CVxhzB1BzVYCApEN0PRyQ994jnYdo0IXmIebY8JJDvz0yRtgD/UCT83+51bw==
X-Gm-Gg: AY/fxX4tXez5yRILCcao6yBV1PAfYDT/sspTo4zZnKrcS5fLBTf71/hHzDeT3Ql55o1
	vJugCS1PSd5joQDuo6ISIuVspPnu/2uFdH+5WwTAuLEW+5C+spUMysnNqVPBNyBJOt2+Dllfj+Y
	GZ/hJBCpZM0rsYNVfjMi8UxUlXdR8r2fi67t4S7k51uYBot0UgW7PhZwFhv6xWIKFNHSkqCQDvA
	Q7fyxq0aSkg69ubM8nM7MF83rr0EF2Aoiqzs8UvFdGyS9BfkAORXR6q7ViIR5VC4vtHew9caSEg
	72sWLLlMSXm0YlSHxS9IoQrqM+WCnhZDEvyMCOVmBwPI5d/yKBEDQgLSUe08PCjzyhaqgBJwrQ3
	RpdtzBQ3llteGfBxUaYEf3sZIeSZhPU8WaOGFSlb6N9QKYGAgGFi1219whT0PKhYc0SmpAKsSud
	wRcJsXwJURiEq/+/uSkXN475vewJntfw==
X-Google-Smtp-Source: AGHT+IEVS0EMW5+YUzuROLbK1pP+erdv1sbXdrakeuxuQx1ssbC7QlrMadTMdJ49F/XbA4Ay1I+Whg==
X-Received: by 2002:a05:6214:4015:b0:880:5a06:3a64 with SMTP id 6a1803df08f44-88d855df020mr637876d6.66.1766073137178;
        Thu, 18 Dec 2025 07:52:17 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88c616751b1sm20448046d6.54.2025.12.18.07.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:52:15 -0800 (PST)
Date: Thu, 18 Dec 2025 10:52:12 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Ma Ke <make24@iscas.ac.cn>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 3/5] usb: ohci-nxp: fix device leak on probe failure
Message-ID: <6c056004-666f-467f-bbbe-a67aec4d5dac@rowland.harvard.edu>
References: <20251218153519.19453-1-johan@kernel.org>
 <20251218153519.19453-4-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218153519.19453-4-johan@kernel.org>

On Thu, Dec 18, 2025 at 04:35:17PM +0100, Johan Hovold wrote:
> Make sure to drop the reference taken when looking up the PHY I2C device
> during probe on probe failure (e.g. probe deferral) and on driver
> unbind.
> 
> Fixes: 73108aa90cbf ("USB: ohci-nxp: Use isp1301 driver")
> Cc: stable@vger.kernel.org	# 3.5
> Reported-by: Ma Ke <make24@iscas.ac.cn>
> Link: https://lore.kernel.org/lkml/20251117013428.21840-1-make24@iscas.ac.cn/
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---

For this patch and the 5/5 patch:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

>  drivers/usb/host/ohci-nxp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
> index 24d5a1dc5056..509ca7d8d513 100644
> --- a/drivers/usb/host/ohci-nxp.c
> +++ b/drivers/usb/host/ohci-nxp.c
> @@ -223,6 +223,7 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
>  fail_resource:
>  	usb_put_hcd(hcd);
>  fail_disable:
> +	put_device(&isp1301_i2c_client->dev);
>  	isp1301_i2c_client = NULL;
>  	return ret;
>  }
> @@ -234,6 +235,7 @@ static void ohci_hcd_nxp_remove(struct platform_device *pdev)
>  	usb_remove_hcd(hcd);
>  	ohci_nxp_stop_hc();
>  	usb_put_hcd(hcd);
> +	put_device(&isp1301_i2c_client->dev);
>  	isp1301_i2c_client = NULL;
>  }
>  
> -- 
> 2.51.2
> 

