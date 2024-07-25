Return-Path: <linux-usb+bounces-12407-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1527E93BB54
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2024 05:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE64128526D
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2024 03:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE0E17BAF;
	Thu, 25 Jul 2024 03:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qH35jpn/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9863D33CA
	for <linux-usb@vger.kernel.org>; Thu, 25 Jul 2024 03:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721879482; cv=none; b=Sf3lFxnyhh29xYZikhE/Dp3l2Y1yrE7wVvaDUwAEDAIfyDc/WAmewv35SngB2lqcCUgzU5oUJFGRYvB2FytSEj+cdi+JN/s0AwTCO6aUbXJLf/LomGss+5L1cjsig4O7Bw5YOrDPEGPJPDeADncEJGOqOOHvJVyN/EFo/qZUjZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721879482; c=relaxed/simple;
	bh=fCfETQcIwR0zoxCaDh7zmy6xKdyMs2KCqzVmscPbTO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iMZd60FRC6ACa9E+JakA8G8aWyTMI816jPpGbuvqupRNRTOW+XFbjd7jjVdR6pHS7bncdHUNSOztWHMme0G6CWxhxL0SQs/FOGHBlOWuLl0NVSg/sANOjjsJ9Jg7Wx8Hynf9UHLR8xIymCfLm24FVWH57TSeUA3x9cXCKztF8uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qH35jpn/; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52efaae7edfso381833e87.2
        for <linux-usb@vger.kernel.org>; Wed, 24 Jul 2024 20:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721879479; x=1722484279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BNYhTjsxqh1MBcJckEFXN+yzwFzXcYglKIB13bT1HUk=;
        b=qH35jpn/veqEnRHK+l7yp0J0WwfYq++vnIrp8uPeGTtR4QvYGMd8AHeFOauKlswri3
         QD8djG6JQv9zz7VWMGBoWkPjBS1y5kX+hda56GK6u8d5pKkiMgfBaptGCw1RcSWF6MEZ
         64AFmKzlKgWiAJAUsjCmm1yiDCv9ixjfvhyVAWJ0W57/pnXtr2uDDstvofchMG7Z2wUH
         EymM+V0BHaRxheNg/++Oeip/xSi5THj4fYPTzaS6u/4H5in148M5Lsx6WQbcvbaj+iMx
         Oo/4vDWeQ1+csX257vkzAZyIvHfPvvYyVB3A19079mgUoBvUewWAk2cfqB3mTn0l8IDs
         Mrmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721879479; x=1722484279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNYhTjsxqh1MBcJckEFXN+yzwFzXcYglKIB13bT1HUk=;
        b=FRcnz7kUvjN4eEEJoPuuurNtsJesM7AFW0VrE6qmtFozME77dkCP+uZK7UvLBC73Mg
         RP/6jBrdrkqBZAeMyoSiF6csbbPlm7kEnXCcGiVY3IisBFH3e5aZqYmsE+y1lQLoyzDe
         0ylJ8oinb958sKt3S0gjUfMkV1QGmW2bkXv8TW9eizha/kisIueVIo5PlamiL6bfuX87
         CQxOs3uwK6kLB8kuKHOamxyF6/FVPruoHxuOzRX8xD9VFzYFv9VAiDP0FabrgLYTLaag
         qQQbkDTMA9nnDrULbOvqPfY0Mwf4lbe/8iObvYwnRq4VieJOiUzu7DhG6OGBqceQoiGu
         fz+w==
X-Forwarded-Encrypted: i=1; AJvYcCVctDaJ+WW5Ef4PBNeAcpp3iesNIy1X/XUZaT3YKEHZBJh4s9Z49uBIxTBD5nSlAeR32hle6474p0wuVjb2YijweJqOt41dH2f7
X-Gm-Message-State: AOJu0Yxmher1tuU9QrKy/q85Nk3hkK0jq8dBKhevk6RiipVY2s30uW5P
	KjpkSRK8QhzG6FQ7PvmS6C/wlSOaX9WGSUN8ojUrYO98+fG7FgLzEGG/WqLZz6s=
X-Google-Smtp-Source: AGHT+IFVQ+aVJJmE25JP8a0HX3bdKT13fCdNQmhW/3KOv9baRW9TsF3kvo+Z+I11aF2nOvo3uSUiiw==
X-Received: by 2002:a05:6512:1c3:b0:52e:f463:977d with SMTP id 2adb3069b0e04-52fd602a7famr308517e87.20.1721879478572;
        Wed, 24 Jul 2024 20:51:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c1a148sm68691e87.226.2024.07.24.20.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 20:51:17 -0700 (PDT)
Date: Thu, 25 Jul 2024 06:51:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	bleung@google.com, abhishekpandit@chromium.org, andersson@kernel.org, 
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	neil.armstrong@linaro.org, rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] usb: typec: ucsi: Fix SET_PDR typo in UCSI header
 file
Message-ID: <qjtutodlbqhsj3ofdhhw2ggjgh3sqglvxmxt72oz3j3xsswmau@g4b5ub56ctfl>
References: <20240724201116.2094059-1-jthies@google.com>
 <20240724201116.2094059-5-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724201116.2094059-5-jthies@google.com>

On Wed, Jul 24, 2024 at 08:11:16PM GMT, Jameson Thies wrote:
> Fix SET_PDR typo in UCSI header file.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Jameson Thies <jthies@google.com>
> ---
> Changes in V2:
> - None.

Fixes: 470ce43a1a81 ("usb: typec: ucsi: Remove struct ucsi_control")

Note, fixes patches should come before the rest of the changes.

> 
>  drivers/usb/typec/ucsi/ucsi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index 6a958eac5703..a0e91335da80 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -153,7 +153,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
>  #define UCSI_SET_UOR_ROLE(_r_)		(((_r_) == TYPEC_HOST ? 1 : 2) << 23)
>  #define UCSI_SET_UOR_ACCEPT_ROLE_SWAPS		BIT(25)
>  
> -/* SET_PDF command bits */
> +/* SET_PDR command bits */
>  #define UCSI_SET_PDR_ROLE(_r_)		(((_r_) == TYPEC_SOURCE ? 1 : 2) << 23)
>  #define UCSI_SET_PDR_ACCEPT_ROLE_SWAPS		BIT(25)
>  
> -- 
> 2.45.2.1089.g2a221341d9-goog
> 

-- 
With best wishes
Dmitry

