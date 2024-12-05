Return-Path: <linux-usb+bounces-18171-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EEC9E595A
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2024 16:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 596B918849C5
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2024 15:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6B921A42B;
	Thu,  5 Dec 2024 15:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="LpUB63CH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C465021A440
	for <linux-usb@vger.kernel.org>; Thu,  5 Dec 2024 15:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733411181; cv=none; b=nPi5gAMSOLSw2C4Xe5jWRlRbPHvHJJDTcicjMcmjqFeppWgx9pSsl0lzRX5piglsDED+lDx93YbD0rciS3UACbjDJLfIVee9rutpZe3NL4NRrauZCTXEjwGS7/bqXFa4UH87s36GfIdZh84+ujAbF4OqjSJwzORTp9dOu2HSkOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733411181; c=relaxed/simple;
	bh=Qzir4cDqPRP4uUW2o+bZZjYGkwQV4zqZ/0NH7WgT0Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shdWlrT5n0W6kN1ZF15rjOmhM5i7V2DDub8V5W34yHrFqsjyaRsXlaZNFDMjXpaHmZmhHzYzJoMz6DBLc+49M6E5OoIW1jVXALVkelWJnLUTHj4820EmSKqLneZ2vXkIEn+xEqhyO0qYZBwjKFdpo60sWmJXhTyhIgDEx+Ch4lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=LpUB63CH; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b6600c9338so55251485a.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Dec 2024 07:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1733411176; x=1734015976; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OqFlGhtdoPqBAsBXUfK8GHOXS7I6sc2ExEvs4W8qdcs=;
        b=LpUB63CHePfNhu7LMSRJoypvIjGDXxcCPCa8wejwug23BKfQhRso4hTggL9CKB9+3C
         Cp/IWj//v4RXev7DbZehoKO2U4LKdlsR+jMebhIptDcJ5NJ4pMzqn+PWVdK7JxzYbtln
         dK+kgeEYej5kdEDeFd7GRmRm3dI5/8i+wWGaxWbupewwku9nW/qwYmWHOLuGzVbw1SDu
         5UAt5/80kViLmIs5DRNhc2z6k/A9a+k7ks6gOxcqVFEqs9NOMfYeuZKG/Tyfl1q4zocP
         HTHvkDLCGOCQkLrsWDjpDJhlsQdFktYAU8a96gZbtusa68JBerXtAh6x9hxDGzl4LTGh
         TzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733411176; x=1734015976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqFlGhtdoPqBAsBXUfK8GHOXS7I6sc2ExEvs4W8qdcs=;
        b=clQB7Joi9+/rdJ6VgjZuWX7SiZ6CxbS/TsX3zwQ5qKjF07MgEc5ECWOayv6X2L9fZf
         b+lo0EyWoxlYru7iYSwZBZr2Zn/gN7SYS4FiLY+bDs+TelrHl5zj/4Zhb1vvsnc+ii/s
         0T1rdyW55wa2yjLiGtFBCKZ8s/elJZ8BlVIyyHk9/jR2dtSYmEXmJ7IQBadu7eNGm9GI
         KiZCUzVfdlCfBNCA6mMDR4COyvXeUE1vbz4W+BP/HbLjQB2QbehO9yRY/NF2nnVNi0Yh
         FzaDkQ447m5KZBjaYppW6kEnim4jjN+OwsH87OmDaMNZnhX1g+0GklhGICa4yucyRUaz
         dJyw==
X-Forwarded-Encrypted: i=1; AJvYcCV1BW3O4GO24R70Wtl0KPfOprB9oC9l/WTXh9d46ts13M8PcqpfBoVF1/eRVx+E2U8VChvx02SWuFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAGAoa49KHMYTJDU/5teTNl5YNVDhNdism3Am0D7hxL/4ZzxA8
	5ChSNuRVzpIwWoMCX1TDlYLN3hoNpj5UG/al/akErJVymWBjZjshKQJgr7JuSA==
X-Gm-Gg: ASbGncsoeqWlVgIbazxssYea0SoQdrYeuqJOVNBOGIB+/HF4lKCQerhCPL05fXHK2VK
	eOUJZn9b8QyRjGowaLwTrnPPbQU++NwmN6D+buC33xKNiw//3N91Xz+nn5J0h1CBsOa1KfQ+uh5
	dr9/OH/q3b2TK6w2diKBUGvakuPbO7rDtxOt8ilccYvSoPkCAU3Z+QcWVc/ISCnBcrjPbozGnHn
	SFbpXZCHh2L8rcWhCQnu5LVCvaWJTLS4DDzwcjtxaKoWi8KzJo=
X-Google-Smtp-Source: AGHT+IELmQdNT+1hsoXFGPSm28f9agdhcrSIwOgp6I2ewJudqY4XKJvMxXYV2ThqzvhMJRi9RwHfOQ==
X-Received: by 2002:ad4:5d43:0:b0:6d8:7fe2:8b1e with SMTP id 6a1803df08f44-6d8b7455674mr157979416d6.48.1733411175790;
        Thu, 05 Dec 2024 07:06:15 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::d4d1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6b5a9e7d6sm67378685a.119.2024.12.05.07.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 07:06:15 -0800 (PST)
Date: Thu, 5 Dec 2024 10:06:11 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Kai-Heng Feng <kaihengf@nvidia.com>
Cc: gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wayne Chang <waynec@nvidia.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2] USB: core: Disable LPM only for non-suspended ports
Message-ID: <a9f767eb-2196-4273-ba1a-19b07ccdafd8@rowland.harvard.edu>
References: <20241205091215.41348-1-kaihengf@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205091215.41348-1-kaihengf@nvidia.com>

On Thu, Dec 05, 2024 at 05:12:15PM +0800, Kai-Heng Feng wrote:
> There's USB error when tegra board is shutting down:
> [  180.919315] usb 2-3: Failed to set U1 timeout to 0x0,error code -113
> [  180.919995] usb 2-3: Failed to set U1 timeout to 0xa,error code -113
> [  180.920512] usb 2-3: Failed to set U2 timeout to 0x4,error code -113
> [  186.157172] tegra-xusb 3610000.usb: xHCI host controller not responding, assume dead
> [  186.157858] tegra-xusb 3610000.usb: HC died; cleaning up
> [  186.317280] tegra-xusb 3610000.usb: Timeout while waiting for evaluate context command
> 
> The issue is caused by disabling LPM on already suspended ports.
> 
> For USB2 LPM, the LPM is already disabled during port suspend. For USB3
> LPM, port won't transit to U1/U2 when it's already suspended in U3,
> hence disabling LPM is only needed for ports that are not suspended.
> 
> Cc: Wayne Chang <waynec@nvidia.com>
> Cc: stable@vger.kernel.org
> Fixes: d920a2ed8620 ("usb: Disable USB3 LPM at shutdown")
> Signed-off-by: Kai-Heng Feng <kaihengf@nvidia.com>
> ---
> v2:
>  Add "Cc: stable@vger.kernel.org"
> 
>  drivers/usb/core/port.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index e7da2fca11a4..d50b9e004e76 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -452,10 +452,11 @@ static int usb_port_runtime_suspend(struct device *dev)
>  static void usb_port_shutdown(struct device *dev)
>  {
>  	struct usb_port *port_dev = to_usb_port(dev);
> +	struct usb_device *udev = port_dev->child;
>  
> -	if (port_dev->child) {
> -		usb_disable_usb2_hardware_lpm(port_dev->child);
> -		usb_unlocked_disable_lpm(port_dev->child);
> +	if (udev && !pm_runtime_suspended(&udev->dev)) {

Instead of testing !pm_runtime_suspended(&udev->dev), it would be better 
to test udev->port_is_suspended.  This field records the actual status 
of the device's upstream port, whereas in some circumstances 
pm_runtime_suspended() will return true when the port is in U0.

Alan Stern

> +		usb_disable_usb2_hardware_lpm(udev);
> +		usb_unlocked_disable_lpm(udev);
>  	}
>  }
>  
> -- 
> 2.47.0

