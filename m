Return-Path: <linux-usb+bounces-17427-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2199C3C0D
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2024 11:34:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 062881F2224C
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2024 10:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BAF7158555;
	Mon, 11 Nov 2024 10:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ca9OuJs9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3C715666B
	for <linux-usb@vger.kernel.org>; Mon, 11 Nov 2024 10:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731321248; cv=none; b=NZ0SpFJO7HifbmPHvuhGykFj+BqbJnLNGuYwZtEVNOVk9+n3nYL1nheJF7yBEAw90skLASeW7iCztrOBpyD9Dma2ti0Fl/uiaj3Tjqt5YXrfToc+uXdfONL0k25HR4XDNw5eG4mZ6TxC2Zm1kamYR5bFER9VYuGhXW4S4k+qWVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731321248; c=relaxed/simple;
	bh=rh2GeJF4QVyUpmHGJsOHbhA3iRjcTX6tfVlu+SANcmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqzI+nwAKNqPCeIfLbVrXnJKhUkXnsLQBLINPp7pes4vQHErqMWM31ZQ2D7IK4SrkzFAXH5OkJwhiCaBu90GAikBdzf0tY9KooyEagQPZFIDlBR/eH81K4yOultpMu4FNjFa9wXD0fy4+6XT7sKLtU0wke3zAYpV/BcUj18VDWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ca9OuJs9; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d5aedd177so2517972f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 11 Nov 2024 02:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731321245; x=1731926045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FwuGf2+cwJHbTfTWkBmiXJ6p4B87DVWKG2r44BIZo/M=;
        b=Ca9OuJs9ssBhclrO6e6kfI/wp5HiukZ+zhcOaZWMYFQCuPOir7e4gN2ZNa24No4IUJ
         l/mA7LFl9iQOrbKrxZR1rkHOjjGxsj81eGPI+YbkKupuUisUmwh5Lhge0aPlqnfoSOSz
         IT8b0xE7YKDZQxG4AJKHsadSzFPDCkSe/ngAtOgAIZrgvR2zE6vkCE6cI45cpcrc6Gxg
         9pTdHUq/SMTTj7h02sxYRGnjOp+UmY8Ek5UAgPj0QakHEpfpS1rB4zaPn3jWgci0xiZp
         8p+6MqmNEqPMxBnkDGA4vEZgGASedG57CHR6Zv5VDRJHKEWeEsU6mWoU28E7u++ywTGG
         SOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731321245; x=1731926045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwuGf2+cwJHbTfTWkBmiXJ6p4B87DVWKG2r44BIZo/M=;
        b=bgUYhuz4J1eS+FOgP630puAcs4uN0oi6Do304JlVmwS/VJWuFa1LwVJN45pKNflIR3
         0/6YA5TC3tozynNyaB0aSgEwG1y1AuA+yJdhdmWj/33TYooAVYvGeB7eyAnyFoY3bnqV
         qUhpqRpxzCwgawHIcWm0rDLXNy19pOnUyhD/SEuId9zHIWpzWF9MxuPx98MILZchSpUG
         ENPYPMzH8UMK1GrjKqnSW4t2D0N0Zr8m+gFI6x+ctBUCV390ppfLvf1pmfuADFMa3+DU
         8McF484soztPAbL1smOdchvnpulpUN7u0hSQm01JJfjdQjutOFGk5IasROOneyjZdC0D
         qBoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6q8oaMVXCMlAHDexscRw1byOKz5Ynb0qrpWWuEfW7xP55g80Z+QVSHv22wlgws3A4KWOEuNDHF1U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Tsd2ySVGgOUgQD1CgxMmDZYwab0wFNbf10uRd3QP3PFd1K+R
	fqodAoAfm6RO1dJ0P0/brVu4ruWRQellmyLzvoUmre3YBuiqerYpFh1t5hO+YVOjaoQXO9SUVfG
	x
X-Google-Smtp-Source: AGHT+IHZE4L79KxV4qbUKuzXhIozbYxbYxMLdAtAMoyuxlCVar8QGw2uQLLvgLJ67qC0VUxOpNxPTw==
X-Received: by 2002:a05:6000:2a88:b0:381:f443:21b9 with SMTP id ffacd0b85a97d-381f44325e6mr7260492f8f.3.1731321245029;
        Mon, 11 Nov 2024 02:34:05 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda03e42sm12787299f8f.89.2024.11.11.02.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 02:34:04 -0800 (PST)
Date: Mon, 11 Nov 2024 12:34:03 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Fix a missing bits to bytes conversion
 in ucsi_init()
Message-ID: <ZzHdm5GMYrKe+IL0@linaro.org>
References: <20241111100220.1743872-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111100220.1743872-1-heikki.krogerus@linux.intel.com>

On 24-11-11 12:02:20, Heikki Krogerus wrote:
> The GET_CAPABILITY size is wrong. The definitions for the
> command sizes are for bitfieds and therefore in bits, not
> bytes.
> 
> This fixes an issue that prevents the interface from being
> registered with UCSI versions older than 2.0 because the
> command size exceeds the MESSAGE_IN field size.
> 
> Fixes: 226ff2e681d0 ("usb: typec: ucsi: Convert connector specific commands to bitmaps")
> Reported-by: Abel Vesa <abel.vesa@linaro.org>
> Closes: https://lore.kernel.org/linux-usb/Zy864W7sysWZbCTd@linaro.org/
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Tested-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 974a441155e1..c435c0835744 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1775,7 +1775,8 @@ static int ucsi_init(struct ucsi *ucsi)
>  
>  	/* Get PPM capabilities */
>  	command = UCSI_GET_CAPABILITY;
> -	ret = ucsi_send_command(ucsi, command, &ucsi->cap, UCSI_GET_CAPABILITY_SIZE);
> +	ret = ucsi_send_command(ucsi, command, &ucsi->cap,
> +				BITS_TO_BYTES(UCSI_GET_CAPABILITY_SIZE));
>  	if (ret < 0)
>  		goto err_reset;
>  
> -- 
> 2.45.2
> 

