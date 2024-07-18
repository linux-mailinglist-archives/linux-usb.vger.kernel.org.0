Return-Path: <linux-usb+bounces-12279-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4007D9370B6
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jul 2024 00:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E32FF281E23
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jul 2024 22:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65BF5146591;
	Thu, 18 Jul 2024 22:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BUyX0VUH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867B15B1FB
	for <linux-usb@vger.kernel.org>; Thu, 18 Jul 2024 22:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721342122; cv=none; b=Sv+TkIAyiRQdnWq1VXdXYMAq964XgvNi3sP+fPTOOdYehxAhKuZFnURGbblmxuW7p9dqUKgxBFXppPhY3V01NScxkIHLhMi84XZXmvwOVybWBaK611R709a2Nj39D2iM8KDVpwfE8KehxqE0bxwOPXA56Lv+3uGxH96Zx1dn+9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721342122; c=relaxed/simple;
	bh=uBrVziKrh9wuW7qZktms0c2SGtYTIAf+915rwmXJe3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHjoyfX4UuxwRtNfkT5GvnQaxBQ6UIhWYXbu25+ZMNhwo7ZftA2UMiu1wy8aN5YfbwehdQczxxPedljYdwykso/GNpU4FAkOcFioGFcad1yzDmThKfC879YYPc7b3YZeX+fn1mI9f2V5cfOUED7q8fhGIUZxmx4s1RGyrIz7cbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BUyX0VUH; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-8111f946f04so49316139f.3
        for <linux-usb@vger.kernel.org>; Thu, 18 Jul 2024 15:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721342119; x=1721946919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RHed+P96itcIQNzLtbTOuPRqeg9F31qpRuhm4M1r37w=;
        b=BUyX0VUHv4e3+msQmonB5kA6JgwKFqACMjMRKZrnfcYYmocq9p5wjlYBHkrqFIobgZ
         V6jzJUX3YW3+6EkBcRk+rhzdkpm60cjUrhk8pIuLCza51OxLExoaK7vh32YF8HN5Lo9x
         06/AGuJUGhlGjfPYBAnyUwd6nsOSKt3NpP6gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721342119; x=1721946919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHed+P96itcIQNzLtbTOuPRqeg9F31qpRuhm4M1r37w=;
        b=J5lAWjRI4u1ImMTYfsnUjkrsADn4BsL0ceTmaPz7gYCcJvHtan/ohGufMOVaAepF9b
         Q3ftNXephFymQJNwaXHDiPh/E/PszNbJ3Q/MYMJ2QSIuTi4XGLLMk5gBQdeyf6CLBxsW
         TxGN7XEZZx7JvAOdjoUUvGYWuqSnqtUfzz2c96jRQcEAd9rrrGoKUc2lh+onFSv81PaA
         tRoZrZu7phl5Fe0GSiNdIpOVLP8pNDqTD5nCzcSzC+3sgFn0tAQnmN5mJLZOjINzP5cZ
         PcoZBkjARJyqaKetkUwldcFmDkrK19t/2rlJDnpTPBo7A7gr7uvDvfv3fUnQFjWHx8N4
         9KkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtHMNAHcWRpbnm4A2XWpBqKA2F8sZufA4gkA/7iWQmysu4n79nutJkL3V5ViW5CsniqQXyAaRAip46dipmAm0g5+SUNmVVVt2X
X-Gm-Message-State: AOJu0YwB3iNnIWkULVM3kwtBblJHg0i5t5EFt4CzQQ8lY6SVPaTcs7Rw
	wrb4upikYJPeF4NLhh3FSC0XGINU2ofMdX5l4I+aHr3wMVRoamKXta4xGPslIg==
X-Google-Smtp-Source: AGHT+IE7ztAOpPJbMaHRiLmD4M8ceQs8LFBUXdW3Xk37Ryv3IBx0w2NCY6VQZzcxRrDl/CCuXvvQSw==
X-Received: by 2002:a05:6602:6d86:b0:7ff:cec0:2985 with SMTP id ca18e2360f4ac-81711e17e2bmr905711639f.13.1721342118602;
        Thu, 18 Jul 2024 15:35:18 -0700 (PDT)
Received: from localhost (161.74.123.34.bc.googleusercontent.com. [34.123.74.161])
        by smtp.gmail.com with UTF8SMTPSA id ca18e2360f4ac-819aba11fd4sm6868639f.4.2024.07.18.15.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 15:35:18 -0700 (PDT)
Date: Thu, 18 Jul 2024 22:35:17 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, javier.carrasco@wolfvision.net,
	benjamin.bara@skidata.com, macpaul.lin@mediatek.com,
	linux.amoon@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v2 1/2] usb: misc: onboard_dev: extend platform data to
 add power on delay field
Message-ID: <ZpmYpQepfSZDaPew@google.com>
References: <1721244223-3194869-1-git-send-email-radhey.shyam.pandey@amd.com>
 <1721244223-3194869-2-git-send-email-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1721244223-3194869-2-git-send-email-radhey.shyam.pandey@amd.com>

On Thu, Jul 18, 2024 at 12:53:42AM +0530, Radhey Shyam Pandey wrote:
> Introduce dedicated field 'power_on_delay_us' in onboard platform data
> and update its delay for USB5744 configuration. Hub itself requires some
> delay after reset to get to state where configuration data is going to
> be accepted. Without delay upcoming support for configuration via SMBUS
> is reporting a failure on the first SMBus write.
> 
> i2c 2-002d: error -ENXIO: BYPASS_UDC_SUSPEND bit configuration failed
> 
> Similar delay is likely also required for default configuration but
> because there is enough time (code execution) between reset and usage
> of the hub any issue is not visible but it doesn't mean delay shouldn't
> be reflected.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> Suggested-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes for v2:
> - New patch
> ---
>  drivers/usb/misc/onboard_usb_dev.c | 1 +
>  drivers/usb/misc/onboard_usb_dev.h | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> index f2bcc1a8b95f..94d5424841fd 100644
> --- a/drivers/usb/misc/onboard_usb_dev.c
> +++ b/drivers/usb/misc/onboard_usb_dev.c
> @@ -98,6 +98,7 @@ static int onboard_dev_power_on(struct onboard_dev *onboard_dev)
>  
>  	fsleep(onboard_dev->pdata->reset_us);
>  	gpiod_set_value_cansleep(onboard_dev->reset_gpio, 0);
> +	fsleep(onboard_dev->pdata->power_on_delay_us);
>  
>  	onboard_dev->is_powered_on = true;
>  
> diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
> index fbba549c0f47..82c76a0b3346 100644
> --- a/drivers/usb/misc/onboard_usb_dev.h
> +++ b/drivers/usb/misc/onboard_usb_dev.h
> @@ -10,6 +10,7 @@
>  
>  struct onboard_dev_pdata {
>  	unsigned long reset_us;		/* reset pulse width in us */
> +	unsigned long power_on_delay_us; /* power on pulse width in us */

nit: it isn't really a pulse width, just a simple delay.

>  	unsigned int num_supplies;	/* number of supplies */
>  	const char * const supply_names[MAX_SUPPLIES];
>  	bool is_hub;
> @@ -24,6 +25,7 @@ static const struct onboard_dev_pdata microchip_usb424_data = {
>  
>  static const struct onboard_dev_pdata microchip_usb5744_data = {
>  	.reset_us = 0,
> +	.power_on_delay_us = 10000,
>  	.num_supplies = 2,
>  	.supply_names = { "vdd", "vdd2" },
>  	.is_hub = true,
> -- 
> 2.34.1
> 

