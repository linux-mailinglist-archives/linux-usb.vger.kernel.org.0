Return-Path: <linux-usb+bounces-17395-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E339C2BE1
	for <lists+linux-usb@lfdr.de>; Sat,  9 Nov 2024 11:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C38B282F68
	for <lists+linux-usb@lfdr.de>; Sat,  9 Nov 2024 10:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277AD14F102;
	Sat,  9 Nov 2024 10:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Deis4Y+q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE197233D73
	for <linux-usb@vger.kernel.org>; Sat,  9 Nov 2024 10:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731148519; cv=none; b=Fu9fY7L9JEYjngH5YW0A2UBXn9wBzCVcAfoqCY+Dlv8va/0tZwhUxmT+1Iih1CvjxolLoo1s6LKiyVjYow7y57Vd2Drhjzcerz9VKnG7Px6NV/LHvLr+cYT4zAZrip7vaFy9DaIVRCkGJgY10iIagpCzgnBBfCnLq1EJx8CWqmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731148519; c=relaxed/simple;
	bh=bZphrblYcWDzNaNPE8QbYYa226/IKLKEJL7XPzjzQyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sg+V0fUt0RfI0NhLeMiLYO1VNHPmrltwMpjkdDPACV7JxDHhL+SB7RRT22PYRYMSIobrKFCPFc4clpyVX5Y6sAs4eC+2WtWYX/dlj3cLYyuP0/REg8l6mx53pzwwirNR29Y7oNOxr4lclwuL0hYvZizr4XUgj41BqTRZ6ozko7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Deis4Y+q; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d4d1b48f3so1868981f8f.1
        for <linux-usb@vger.kernel.org>; Sat, 09 Nov 2024 02:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731148516; x=1731753316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tg1HA2kf5RNhTkX/ea+Ml58K6U7s0o1N/8zL42k0Xu8=;
        b=Deis4Y+qzdhpKiMFbrB3Hi25DuskfTWke4Tp/ymzC7yGV357nElFfpvzFsTT1XhNM9
         hAdmnxkQbKSyz2s53NmLXxomT3d8Z08mh3NH+EWX32CVwvuK7JzUPw9Hd8B7x0fIYKi6
         eymkiElk4yljszKeLmhlFkO6JPCuIXF4d4xr0GEiKFT5yzeVnvWhc0aIHsigMZHYFnlI
         tKAB9Z3RP2qJWAk8stoAZAkIA97d2ZTWRGpNjAJ+Ph3X6wese5QDZ5uDMX0qHX4lIRn9
         1GHNQ0aQR4m0jkWv7ePtWpgN4ZNuySvhOXidGjYreW0y4SupAVVt2QZgwR34hSS9sJ6e
         +RiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731148516; x=1731753316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tg1HA2kf5RNhTkX/ea+Ml58K6U7s0o1N/8zL42k0Xu8=;
        b=lw8iZvm5ZPKVpXTnCejdyeOM61Ba7XQfoRq1BO/7rgEfNLuVXNkBtZTisbtQeF2sB8
         9oWQ+cnvl8+j57VWKaWshLScgr6byleFSoHAHsL/uBck7ZYem1GebJQ8AJaS4AbwC6Xj
         NAyLnCy/dV8H3rOU+ToF2CMkOXfd6b/Y9srbA24tD7sgGJDJAIKLe9vFGZbNvh5pZA5t
         yyCINc6o8r0wcKYlBX47rMr0i3KNR+lz7buDoc9Ohz5zT3mIi5DlFf7DRhY+bTnhk1KZ
         xIroBZbiX/FoHBWAHX8MsnML2pRmYML1jSNwpUi9licD0y/T6Al5E+HHs7MITgdWj7a5
         lo2g==
X-Forwarded-Encrypted: i=1; AJvYcCXcaE2o8ePQEErl8chreNEDSfp0fwSMxR/Bf0NQoonEA//9uyB/jG36lamt7GsLkJ0w2a38hy2p7FM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc6vqEDBZlhRYd2UHkIExZJubuDb8miONlNgYYUWYgEaJwwUSW
	7qbo+ZJhpEI9i2D/mpIboUDvChE3ngnJ4kQUJowb2BAYADP8/IkRuZQuewHN9Z4=
X-Google-Smtp-Source: AGHT+IGW3JENbXlIs1vQ16HgAQOXxt5af/i5Qc57x0iEcIbhDYR/IKiUtFex1oOxNes4yE8sVizySg==
X-Received: by 2002:a05:6000:2a88:b0:381:f443:21c2 with SMTP id ffacd0b85a97d-381f4432495mr3401767f8f.5.1731148515914;
        Sat, 09 Nov 2024 02:35:15 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9706e2sm7523037f8f.7.2024.11.09.02.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 02:35:14 -0800 (PST)
Date: Sat, 9 Nov 2024 12:35:13 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Bartosz Szpila <bszpila@google.com>,
	"Katiyar, Pooja" <pooja.katiyar@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: ucsi: Convert connector specific commands
 to bitmaps
Message-ID: <Zy864W7sysWZbCTd@linaro.org>
References: <20241106150605.1017744-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106150605.1017744-1-heikki.krogerus@linux.intel.com>

On 24-11-06 17:06:05, Heikki Krogerus wrote:
> That allows the fields in those command data structures to
> be easily validated. If an unsupported field is accessed, a
> warning is generated.
> 
> This will not force UCSI version checks to be made in every
> place where these data structures are accessed, but it will
> make it easier to pinpoint issues that are caused by the
> unconditional accesses to those fields, and perhaps more
> importantly, allow those issues to be noticed immediately.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
> 
> Changed since v1:
> - The CONCAP macro now reads the correct member.
> 
> I added the version to all the field definitions that need it instead
> of adding a complete macro for each of those fields. I think that
> should be enough to make the version clear to everybody during use as
> well as review.
> 
> ---
>  drivers/usb/typec/ucsi/psy.c       |  28 ++--
>  drivers/usb/typec/ucsi/trace.h     |  28 ++--
>  drivers/usb/typec/ucsi/ucsi.c      | 121 +++++++-------
>  drivers/usb/typec/ucsi/ucsi.h      | 252 +++++++++++++++++------------
>  drivers/usb/typec/ucsi/ucsi_acpi.c |   7 +-
>  5 files changed, 240 insertions(+), 196 deletions(-)
> 

[...]

> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index e430a0ca4a2b..974a441155e1 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c

[...]

> @@ -1778,7 +1775,7 @@ static int ucsi_init(struct ucsi *ucsi)
>  
>  	/* Get PPM capabilities */
>  	command = UCSI_GET_CAPABILITY;
> -	ret = ucsi_send_command(ucsi, command, &ucsi->cap, sizeof(ucsi->cap));
> +	ret = ucsi_send_command(ucsi, command, &ucsi->cap, UCSI_GET_CAPABILITY_SIZE);

This fails for version < UCSI_VERSION_2_0. Size is wrong.

>  	if (ret < 0)
>  		goto err_reset;
>  

[...]

