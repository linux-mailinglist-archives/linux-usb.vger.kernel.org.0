Return-Path: <linux-usb+bounces-17702-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C31EC9D177D
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2024 18:58:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 879CA283479
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2024 17:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112A61C1F37;
	Mon, 18 Nov 2024 17:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xt6gsZNy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963DB1BD9F3
	for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2024 17:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731952710; cv=none; b=k1rGdX1N0qRSrm64/Hn8hrcrHi5eV/aKWRAGGpXub68eJ2213RClMcCqcCKqKjApNbJ1zc+wCS5sc5rfgNIR0I3wAI+dgLdkpXYr9K346n/Rg2FeVaV0KWumrWI8yXqN121RPAr++yNPMJ9FoBsdEVD4lbpX7y/nTtlH0/4Id9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731952710; c=relaxed/simple;
	bh=laZIAQktD4QzqPlaVyKPfOrBu4SfRyQ3/OCJp+BYGEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cD6/G/RlFqWk1h0yQT89xmCBDXz6ApuAxV+fSHAcsdySc3svDQTMbr779YkpUWYFkrAEH4VKKbQ71ztHOxGxexNwTRLaQn/+Rlyn5vxDSP6xOSSkZ8JWcFm+7U2YKe3i+zqkGtwS37OkJ34593O2AZIBToE7mpi0332sQFanH/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xt6gsZNy; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53da4ff4d7fso4375893e87.1
        for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2024 09:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731952705; x=1732557505; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QlLGnW7dtwwICLyvfGuSa1NcQ36vNNOBbZLVzsySdLE=;
        b=Xt6gsZNyA25zn3g2Sek8XJQDvzW8ZZCWx1YaqNPy10mtBbE1ZuVZUp8JVxqQwHok2c
         kLukUMEEog2WVZR0AlbMRFvy/vD0tQbcHc3blIKJT+hUWWFN+qwLvCDJNoIJyEqckdIJ
         sy52Byvc0sHVmnfvaMrLnnrQ1fLBaElJs7U90slxL5J0wPBrtw79iYsx3hc6knZ0Uz+4
         7ZRB7eny02MSn+rL/n5BTyLmyyUa57v6KEpfK2J6h/zcfswAcwfzKa9LqgP0oz1Dzbgm
         70Ri04EyxY7I9M9cRtO362z2nG24MekVyfv/TxJhL2V4eS679+B8CApyLZg3WHvI0Eyf
         f/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731952705; x=1732557505;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QlLGnW7dtwwICLyvfGuSa1NcQ36vNNOBbZLVzsySdLE=;
        b=oV8Per61pJwrrYP3DNweOTh1rE3kf55PgG4OoYk1PwqNtHwlbdLks0nYCL9+fpIKDR
         yMoQKZzHp5S+Mt08zI6rMluXT+sOMGb734IZZNZKaoyhAMPP1Iv536Bfp6KRjFCmph4s
         lGXt0hbwhlQrs7gxi7kV5TR2LNFwXt1B4XqQOxU6A0Ap9LdKX4bHdRdA4rK2Z6rAarXM
         YuBCZJQANGLeMffVg318PJbyfeeVURwLHuG3oR7z3CxnL7q9WtHhjNzgfi/lr/6v0X+V
         /YiIVxkxLe3TB/4xvxkeD7h2ETgxTAB0Nf12ljXcm/ywRVvueKXjRTbnsHvGS0zxh0uh
         wp8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOcgFnD+3bao3no+jz+0C4hRM1aCFHtMwM1kXh9VzWVIrA3Jh/wPQlPuFN8CtAip6s4F7bCreYvXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsR4cCdkpzmWJzSpzYJ5hBXEsPDGwoBlPnzD4h8XC9A7IZi353
	ewDtGy7FtC6n/ozrYt/WXi/AZO6ak3W131J9wNxs8aelBYdivBqdM2L7ofTN6vA=
X-Google-Smtp-Source: AGHT+IF+k106SySWsa5RW6D8wDsdbeikotHZLceTzJqS77LXkttXhrPKvuUPvkQI0pZUabYUcvomPg==
X-Received: by 2002:a05:6512:31c7:b0:539:f84d:bee1 with SMTP id 2adb3069b0e04-53dbd4a08b4mr104842e87.17.1731952704554;
        Mon, 18 Nov 2024 09:58:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbd472359sm18758e87.198.2024.11.18.09.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 09:58:23 -0800 (PST)
Date: Mon, 18 Nov 2024 19:58:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v1] usb: typec: ucsi: Fix completion notifications
Message-ID: <5iacpnq5akk3gk7kdg5wkbaohbtwtuc6cl7xyubsh2apkteye3@2ztqtkpoauyg>
References: <20241104154252.1463188-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241104154252.1463188-1-ukaszb@chromium.org>

On Mon, Nov 04, 2024 at 03:42:52PM +0000, Łukasz Bartosik wrote:
> OPM                         PPM                         LPM
>  |        1.send cmd         |                           |
>  |-------------------------->|                           |
>  |                           |--                         |
>  |                           |  | 2.set busy bit in CCI  |
>  |                           |<-                         |
>  |      3.notify the OPM     |                           |
>  |<--------------------------|                           |
>  |                           | 4.send cmd to be executed |
>  |                           |-------------------------->|
>  |                           |                           |
>  |                           |      5.cmd completed      |
>  |                           |<--------------------------|
>  |                           |                           |
>  |                           |--                         |
>  |                           |  | 6.set cmd completed    |
>  |                           |<-       bit in CCI        |
>  |                           |                           |
>  |   7.handle notification   |                           |
>  |   from point 3, read CCI  |                           |
>  |<--------------------------|                           |
>  |                           |                           |
>  |     8.notify the OPM      |                           |
>  |<--------------------------|                           |
>  |                           |                           |
> 
> When the PPM receives command from the OPM (p.1) it sets the busy bit
> in the CCI (p.2), sends notification to the OPM (p.3) and forwards the
> command to be executed by the LPM (p.4). When the PPM receives command
> completion from the LPM (p.5) it sets command completion bit in the CCI
> (p.6) and sends notification to the OPM (p.8). If command execution by
> the LPM is fast enough then when the OPM starts handling the notification
> from p.3 in p.7 and reads the CCI value it will see command completion bit
> and will call complete(). Then complete() might be called again when the
> OPM handles notification from p.8.

I think the change is fine, but I'd like to understand, what code path
causes the first read from the OPM side before the notification from
the PPM?

> 
> This fix replaces test_bit() with test_and_clear_bit()
> in ucsi_notify_common() in order to call complete() only
> once per request.
> 
> Fixes: 584e8df58942 ("usb: typec: ucsi: extract common code for command handling")
> Cc: stable@vger.kernel.org
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index e0f3925e401b..7a9b987ea80c 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -46,11 +46,11 @@ void ucsi_notify_common(struct ucsi *ucsi, u32 cci)
>  		ucsi_connector_change(ucsi, UCSI_CCI_CONNECTOR(cci));
>  
>  	if (cci & UCSI_CCI_ACK_COMPLETE &&
> -	    test_bit(ACK_PENDING, &ucsi->flags))
> +	    test_and_clear_bit(ACK_PENDING, &ucsi->flags))
>  		complete(&ucsi->complete);
>  
>  	if (cci & UCSI_CCI_COMMAND_COMPLETE &&
> -	    test_bit(COMMAND_PENDING, &ucsi->flags))
> +	    test_and_clear_bit(COMMAND_PENDING, &ucsi->flags))
>  		complete(&ucsi->complete);
>  }
>  EXPORT_SYMBOL_GPL(ucsi_notify_common);
> -- 
> 2.47.0.199.ga7371fff76-goog
> 

-- 
With best wishes
Dmitry

