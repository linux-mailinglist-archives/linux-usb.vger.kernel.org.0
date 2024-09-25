Return-Path: <linux-usb+bounces-15462-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 260B998653A
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 18:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3860B22BFA
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 16:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06F34962B;
	Wed, 25 Sep 2024 16:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dbNZSfkd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591CE4644E
	for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 16:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727283254; cv=none; b=Yy/2q0XKW/HwxMVxtfIPXhQeoTkrkuk31VnFfEuH0V/EkyYexMQeP6szcr0Cz2533V23nG3TNrJb/8iLW+qzM6GCzWHmZMVnbC8VHhKezgn2NhYSjozpK/oEt36N//0v31OiGhWe9qK0hHYEPGC+kAdMcxEUQrUCPjoerzX9PcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727283254; c=relaxed/simple;
	bh=/HPgHqkfAAKOnS/zotTcMow8rwqhetyy7ZWy/2jAa64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hp22h3NLz2hwpVEf9Ad2g9U68HtD2/uUdVSjQE+cnnHhdSpDKXpQPY6zOgKyBQui+P2bkksV5lHZMrIuYZ/YzOUkFnlwS92sx21avlmul9Q7PfasAigK++faNUE6hOb7viLelyabM/MeK5uwX8H9SYTfrLevvhelHts5RyxW5AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dbNZSfkd; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53568ffc525so115889e87.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 09:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727283250; x=1727888050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ENQCJFCOWqwm3yXLIQjuIpFGChSvV27xLcKN/dTNuY=;
        b=dbNZSfkdtS6FeCGpCqUzwV6sESjJflrQ0e6dX/B9ISsdfLdJauS56xC/lDdZTJzI8f
         dQBENUquGB+/MKyfe4lwlRIPj3ms/JLWi3IOK07R0B+yuv1UjdHGOE2abY5kbsmG5yYu
         QOPJLffQoig9oN9zOiMe56Yn2MO6+wWDTPWe2y4kQiW0BDxESQw+16q5dpHvkoUZmcOO
         daDPTHymxNJOlw+DzXZKlAWaxETQVWLYHd2zI7qosko/bW0cmEqZ5GWfiocoBg2Up5Iv
         W7XmKGgGxW2AutKfvMrPwpCAdh802fzfXJT/VN/4EnznG0wFpZFyKMIK4xW1AlPjjeLO
         5p4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727283250; x=1727888050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ENQCJFCOWqwm3yXLIQjuIpFGChSvV27xLcKN/dTNuY=;
        b=D6AI9f4kOIVoMxsNXotWZZf5Vz7jy/jMSLfM7x3hnIOK84QLbDilm3kf1vk1dHYa/R
         PM/o5RDef/jhoA9SaaZlZH6jesAUUEXLjvYTkIHKQOjz6/WmyV4SDgRv9pi2AzTkkcRp
         3ejJ2h4dqUcRfargWbdhJIM8gXiOBBBFN/97504I9MF2DwKckTzFQnXyrCWVTQCCVoYa
         kqQxLWhqCPfSIFfW7fwLQMCvXVucfToYgUA5QJB6JgFhtlG+tuem2wfCrJktwy6A2pSd
         i9sd9v6+HqQI2RwVtM1miAKRcZyYGTl2P5Hw5NckEKWmDboZvxsemy+1H1GCueTBG/hK
         8IVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXNiJ72HrKqt5Ay3I9dNYZC/w6RM06ptyT3ClVn8mP+Nawz/zYbBKMHZIxhwEDy21t4BvbVH2OJcU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz3MPVREZrB5Hi+FKt37n6VgdWrxWjiHrH+Rg32iu1yQnT9/Gj
	HNwqsuSNEsggPsMW3d6so+N1bQ9OYfH+XATO+MLAeBq7rRerh515PRvTVecggg/HYn5I4YOTh6R
	PJd7D1g==
X-Google-Smtp-Source: AGHT+IHvKYHAHWHafFPYrSDrM8b/jSGUoPC8QoWoOuH37k8DrfGhctKe3x/LnLPhuqiIPog3DBD1Kw==
X-Received: by 2002:a05:6512:250a:b0:535:6a4d:ed74 with SMTP id 2adb3069b0e04-538775678f1mr2145924e87.51.1727283250322;
        Wed, 25 Sep 2024 09:54:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a8640abasm568591e87.177.2024.09.25.09.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 09:54:09 -0700 (PDT)
Date: Wed, 25 Sep 2024 19:54:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org, jthies@google.com, 
	pmalani@chromium.org, akuchynski@google.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/8] usb: typec: intel_pmc_mux: Null check before use
Message-ID: <xzk3yjkf4zew4p3f4jo6an3cnp4qe2vcvdbu6eq4ths5q4aqmp@4d2qfvrdwym5>
References: <20240925162513.435177-1-abhishekpandit@chromium.org>
 <20240925092505.3.Ib7a83adb069df1cb0a40dcddff29618bf3255700@changeid>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925092505.3.Ib7a83adb069df1cb0a40dcddff29618bf3255700@changeid>

On Wed, Sep 25, 2024 at 09:25:04AM GMT, Abhishek Pandit-Subedi wrote:
> Make sure the data pointer in typec_mux_state is not null before
> accessing it.
> 
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Is the a fix for an actual issue or just good-to-have thing? In the
former case it lacks a description of how the issue can be triggered and
a Fixes tag.

> ---
> 
>  drivers/usb/typec/mux/intel_pmc_mux.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
> index 56989a0d0f43..4283fead9a69 100644
> --- a/drivers/usb/typec/mux/intel_pmc_mux.c
> +++ b/drivers/usb/typec/mux/intel_pmc_mux.c
> @@ -331,14 +331,19 @@ static int
>  pmc_usb_mux_tbt(struct pmc_usb_port *port, struct typec_mux_state *state)
>  {
>  	struct typec_thunderbolt_data *data = state->data;
> -	u8 cable_rounded = TBT_CABLE_ROUNDED_SUPPORT(data->cable_mode);
> -	u8 cable_speed = TBT_CABLE_SPEED(data->cable_mode);
> +	u8 cable_rounded, cable_speed;
>  	struct altmode_req req = { };
>  
> +	if (!data)
> +		return 0;
> +
>  	if (IOM_PORT_ACTIVITY_IS(port->iom_status, TBT) ||
>  	    IOM_PORT_ACTIVITY_IS(port->iom_status, ALT_MODE_TBT_USB))
>  		return 0;
>  
> +	cable_rounded = TBT_CABLE_ROUNDED_SUPPORT(data->cable_mode);
> +	cable_speed = TBT_CABLE_SPEED(data->cable_mode);
> +
>  	req.usage = PMC_USB_ALT_MODE;
>  	req.usage |= port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
>  	req.mode_type = PMC_USB_MODE_TYPE_TBT << PMC_USB_MODE_TYPE_SHIFT;
> -- 
> 2.46.0.792.g87dc391469-goog
> 

-- 
With best wishes
Dmitry

