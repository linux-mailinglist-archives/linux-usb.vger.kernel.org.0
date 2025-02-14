Return-Path: <linux-usb+bounces-20661-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1192BA367E4
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 22:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B34141709FA
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 21:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40CC21DC1A7;
	Fri, 14 Feb 2025 21:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hbVoXDb1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC5E1C861A
	for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 21:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739570249; cv=none; b=NfD1+ftomhBWUHUdrxhJu3H4q9qBcim0LG78lUqeHOmPJmBqAA8z74Sib5kmvlX1EgdorS4mqdyvVtcWeAtjSA8/E8OdfyKMzgW+7hIfEHzKGJ3iL3GA1QBC/ScXBlw20AYeD9MLmqw7O5u9wbAnjHXI7yDQJdvtCB40ogft7Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739570249; c=relaxed/simple;
	bh=J2jwGq9qpPorpXDenwVkAsbmo0Fz+ziYV4jByJMgWc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZscK26KM09Jl89diR4a5By8KsoVAYs4Ym6m2RND5gB4vMY10Kh6ueJOkmHX5BuH2900Wf1jjk7YOYsCkOJscvEpUpGXbu4Su3KSfiSJiriinb6SQVToL6hHUgYYeMqRVvGJ0Y7Cwhrxc6eCrdmzmAXpTySSHIRtYzB2jQy1w/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hbVoXDb1; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220c8f38febso47823415ad.2
        for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 13:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739570247; x=1740175047; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wRWtn1ykS3Bkkf2XIvb7lfKIw3peefiZqLW6ILRvMlk=;
        b=hbVoXDb1gDyeGuQ+T4mEJaZifgLQU0bEwi42pgsft8IVrb5mXoV56/pL1UhmedFpMh
         XwucjXhBOAo2p8gH5viBqPJpg5RPj7NMXpXrcuRObEBf19KeK7C9IT5hMSerTxslc4+X
         nOutU19/CDnSAnm0IH9Q3m5ZpFtRiBIS1mqg+cpAMXa4NWywea95H71txHuJXtbE3Hk8
         ogu/gDlKe/Xmao2YtvgSBzoIMGrpQRTx+SqFsi8kM27jSDbCc955exzKqrOjcxSW0s+L
         P+f/2jDsyPr6+p2mBKnEgrm09JC8J7r/cfLsqCgVtEy3Kd7O7D0HqJoVJHZM3egiCaZP
         hUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739570247; x=1740175047;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wRWtn1ykS3Bkkf2XIvb7lfKIw3peefiZqLW6ILRvMlk=;
        b=AZB9vQUPtJPpHm3Sap8siLwYS9Vyi1RXrAYWNvDuGYYm0HAAaonJFGt0+9v3NSlzkS
         nmt2ACnvkEWMBqtQSRonQeaZ6FFIu1zOD+1p3XS5ndpaNlSB2mD+onBAT+eWicZyQK1d
         hTxcGtCR7J3gIJTyd6QJjKuNYPoFUH1qvCJmSzVN8AGAhJ4WZ8ifDokkBOF7vvJ8WM0r
         nN+2jcGcNsdL7yPW1FGZ4Bpvjvn6JUUjWJOKa7kb+bun35hgjnuK5FdBw30ea7I3pRok
         zghSO23IOls4rJvfLD8LqkQijsvfRVQd91JVa1S5eqfYz48aZ6rXlbXnkJB0KjeVPWBe
         CCiw==
X-Forwarded-Encrypted: i=1; AJvYcCWax59axmA+u9+Cx9mIGNAMGR56RebUKrYk1uHjTiTNJegP3XJotQH2uoCLSxvJp50LXY70n/5Yvi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbU4m+SF1QJ/YBRe4S0//Klst0a7dAQZeBcH0tjNArOO1zVT0r
	atdVNKJsi/LQxHtclM4fAqKab6hqwVnLLBsgx41AgK0TCNOLbgDqZJfykWiJQw==
X-Gm-Gg: ASbGnctwSntxDgwkNOWUz+yJpG5h3Ti5YVR7dvFXel8sPibTbhdGBdMTWYpvfqF1oOR
	vnG7MOqaLpatNrlaZ54eRkPICVconqNSYmCAwDrrFXYrup2nGZ7x5jqZXFuQWR9QHzQ6GRv1eOQ
	UHjelM+3hAs0xcGjuzM7HsMXDy8BB9yWB/5yUsrsHLN4G4lUigV4rrfAJXsV+IC6BNGtux5Ok+n
	hOivQJLNHg2uIX6J3b23UpNQ9Le2RCIWCdYIdKxaRk9nrTMZxgmWhxVunWFudVlw2W3N3TzV+ZM
	+pGKBHJHrNKNzGur/XTocY/nCg4UFdh54BwfDHHIFA6LaKbZDEQKiZYS
X-Google-Smtp-Source: AGHT+IFZkKyWI5cbOzU+tAQBXH6DK01VJZJyEtEn7GBkrLBMpC5lv7rkqivWWjlmMr5gTo9wQl2d1g==
X-Received: by 2002:a17:902:cec9:b0:21f:7880:8473 with SMTP id d9443c01a7336-22103efa562mr12942065ad.11.1739570247291;
        Fri, 14 Feb 2025 13:57:27 -0800 (PST)
Received: from google.com (139.11.82.34.bc.googleusercontent.com. [34.82.11.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d663sm33080155ad.120.2025.02.14.13.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 13:57:26 -0800 (PST)
Date: Fri, 14 Feb 2025 13:57:23 -0800
From: William McVicker <willmcvicker@google.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>, kernel-team@android.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm/tcpci_maxim: better interrupt name
Message-ID: <Z6-8Q9oDj04NurJ5@google.com>
References: <20250213-max33359-irq-name-v1-1-1900da7a1e79@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250213-max33359-irq-name-v1-1-1900da7a1e79@linaro.org>

On 02/13/2025, André Draszik wrote:
> This changes the output of /proc/interrupts from the non-descriptive:
>     1-0025
> (or similar) to a more descriptive:
>     1-0025-max33359
> 
> This makes it easier to find the device, in particular if there are
> multiple i2c devices, as one doesn't have to remember (or lookup) where
> it is located.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  drivers/usb/typec/tcpm/tcpci_maxim_core.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> index fd1b80593367..46fc626589db 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> @@ -420,12 +420,14 @@ static irqreturn_t max_tcpci_isr(int irq, void *dev_id)
>  	return IRQ_WAKE_THREAD;
>  }
>  
> -static int max_tcpci_init_alert(struct max_tcpci_chip *chip, struct i2c_client *client)
> +static int max_tcpci_init_alert(struct max_tcpci_chip *chip,
> +				struct i2c_client *client,
> +				const char *name)
>  {
>  	int ret;
>  
>  	ret = devm_request_threaded_irq(chip->dev, client->irq, max_tcpci_isr, max_tcpci_irq,
> -					(IRQF_TRIGGER_LOW | IRQF_ONESHOT), dev_name(chip->dev),
> +					(IRQF_TRIGGER_LOW | IRQF_ONESHOT), name,
>  					chip);
>  
>  	if (ret < 0)
> @@ -485,6 +487,7 @@ static int max_tcpci_probe(struct i2c_client *client)
>  	int ret;
>  	struct max_tcpci_chip *chip;
>  	u8 power_status;
> +	const char *name;
>  
>  	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
>  	if (!chip)
> @@ -531,7 +534,11 @@ static int max_tcpci_probe(struct i2c_client *client)
>  
>  	chip->port = tcpci_get_tcpm_port(chip->tcpci);
>  
> -	ret = max_tcpci_init_alert(chip, client);
> +	name = devm_kasprintf(&client->dev, GFP_KERNEL, "%s-%s",
> +			      dev_name(&client->dev), client->name);
> +	if (!name)
> +		return -ENOMEM;
> +	ret = max_tcpci_init_alert(chip, client, name);
>  	if (ret < 0)
>  		return dev_err_probe(&client->dev, ret,
>  				     "IRQ initialization failed\n");

Can you just change the `init_name` instead like this?

  chip->client->dev.init_name = name;

That way calling `dev_name()` will get you this more informative name as well?


Thanks,
Will

