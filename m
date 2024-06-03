Return-Path: <linux-usb+bounces-10779-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F70C8D7FC2
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jun 2024 12:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E4751F237DA
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jun 2024 10:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D67824A6;
	Mon,  3 Jun 2024 10:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X3kHmeSC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818D48060E
	for <linux-usb@vger.kernel.org>; Mon,  3 Jun 2024 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717409432; cv=none; b=ebZ7iP6sZkWx6nbv1lA88W2ouRnXzrhXlKzRMc7Yk8q+S68uvzgoWZ2v54cgEAdSip/ikbMeL8edB2OLkjrNJb8orh6yPl0jnp9DU0Q+jZz6iZt4jIxp3DtQWxmB0gVED7Mvf0xP6N2IF/FwdGMpSigndI9DbC2iT11tfzNGQAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717409432; c=relaxed/simple;
	bh=XuAc7dh5ANwBVYj9UfeHlkW7qY8aQh6rucm3UqmciOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lz9kbICKIOyNZaelHvn34xsS3dD7pB2IKcggO2erazLuHYfesxAXLEB7QcB9GjJRHLuUFDRg+84oeE9/euDanZPvQMaB0RkSdgJ+AjcJmd4qMas6x/ewViskFAHlzogdr6NXkZX2uTYgzhgELsCPNOZmvC5rNmihKqLB74skaEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X3kHmeSC; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a689ad8d1f6so277301066b.2
        for <linux-usb@vger.kernel.org>; Mon, 03 Jun 2024 03:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717409429; x=1718014229; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LkWOhV+DQwJ6ndMHwlwz7TM2x8mN3yyZr2x2zYuk2Oc=;
        b=X3kHmeSCFoAePasblA5NKIPXNXRH1knV+4U+zs/hhpRgkouB1JIyz2hYuYUkePuLvB
         pwWRfpPcYD4s+AqGjaxQJ8vc3e7RHzCMOCzFXNq0MJJqNCAeaqdI38FTu/Ewx3Xblh+g
         rmSaG/4w04gvLPf2P5ilTCsU9aGQNYWjk1id7vCmis+f0n90kv2UdZtpiAkXXXD+HgEC
         hXYCaJpUki2vPiQJ0QOgW8TzvbzZtdpFCXbiB+Ugl3/bFj7Y9tHNcbX/YOr2mr8GCrOg
         T6h7HAe56JeleUUxiU7KF+iaGLa8w2NY8/32gvR/hRjL6FqAs6r1EPNoJdez6C3FdnRK
         fGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717409429; x=1718014229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkWOhV+DQwJ6ndMHwlwz7TM2x8mN3yyZr2x2zYuk2Oc=;
        b=dVbOitmsqptKnwFJvn0+E0OVAXMO3cS340QJnc6fLJGoUpxHCc7hVVFTgeZV5+Tpah
         xPuYZSlI6ai1AtL7utij/EQWiK5rGhBZy7SBeP7Ub+MFMmyCcPVrj3uXjyY5Ir0qBBvO
         xFp6mlD9hPrxRzIiuP9OWnvXCW3DOe3ZNTjpMRTfZb6eTxOah7Ric0ypH1X1KWsF4RaF
         YLeBFuyEs8kzNPd/G2wC/2vP9ZZipdltVqQGNpR4VStt7mn5OiQQDBSqezTywCRp1jSC
         6julLzF5EjoEuiVtNEqgfOeFopL2VIiAaF5s3snm73Zvvxr5Q6222mGSv5mOXgm62sW7
         WCiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwNJRpkauRl49hT/hMfDQJ2405q/Uxrx4JKmtUhnGgluAfRpaurfs1woHX8usgIE7b6jwHXc53ndjhDUCZc/+1xFl7k6Tbg/iA
X-Gm-Message-State: AOJu0YzX2mK/5Zkgu/jSlHRoB4EzddbCsOemmXflXsQ9dARJ+ZwJ4suN
	mZd/y0RtaVfclkJkC0Zik49jB8SwwHCq9TftEiUI2cHNhwO3fwbAlk7yrv+GObc=
X-Google-Smtp-Source: AGHT+IHbpgvcshlXyC2u1OwtaVW61Tn6IJT8AxGEZwKgPW1bJBRtTNMuu6EOVReA48fHyxMu0ZnKYQ==
X-Received: by 2002:a17:906:7f90:b0:a63:4e03:d71 with SMTP id a640c23a62f3a-a681fb6080fmr594007366b.6.1717409428702;
        Mon, 03 Jun 2024 03:10:28 -0700 (PDT)
Received: from linaro.org ([188.27.161.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68f9092ddbsm201510266b.101.2024.06.03.03.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 03:10:28 -0700 (PDT)
Date: Mon, 3 Jun 2024 13:10:27 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: glink: increase max ports for x1e80100
Message-ID: <Zl2Wkx5AqAfr1jfV@linaro.org>
References: <20240603100007.10236-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603100007.10236-1-johan+linaro@kernel.org>

On 24-06-03 12:00:07, Johan Hovold wrote:
> The new X Elite (x1e80100) platform has three ports so increase the
> maximum so that all ports can be registered.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index f7546bb488c3..985a880e86da 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -14,7 +14,7 @@
>  #include <linux/soc/qcom/pmic_glink.h>
>  #include "ucsi.h"
>  
> -#define PMIC_GLINK_MAX_PORTS	2
> +#define PMIC_GLINK_MAX_PORTS		3
>  
>  #define UCSI_BUF_SIZE                   48
>  
> -- 
> 2.44.1
> 

