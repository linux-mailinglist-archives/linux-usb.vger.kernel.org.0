Return-Path: <linux-usb+bounces-17046-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8A49BB32C
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 12:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7980CB27027
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 11:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDA41B0F15;
	Mon,  4 Nov 2024 11:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lNo3qFND"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B83E1B218D
	for <linux-usb@vger.kernel.org>; Mon,  4 Nov 2024 11:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730718932; cv=none; b=dmuMlpydWluG1mpxPKi1a34LaIZYNLNsV1fFdBpu5cmTDOkSYpKWVpGS0CyLHDGF8B4xw11mxPEKthXOte6ApvoPHaJBkQjEZ22mDgzekFQvMwxO/SRoA8BuCb4hDz58a/H7+H3pavPICIm75FZx2QjDC9ZEwABQ6tK6KWpyzy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730718932; c=relaxed/simple;
	bh=8Pb8sCWqVT78PKsPAopEAxFND+meVGRZNGnRJZybrj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLDP9XwnhgKqHfUQ699se9Xp2mnLjka6ujBEqP21tfrN8dXneFDs2E8D34cgAi7hu7sOZbA7ThI5/im3UlWYj+Dap6OmtIU9/AIu/mzCOXDTBCEI9nT/kNGXt1BDH9unN9tAhhzQ5TEq0M4v+N4A612z3YmxxUe4w+LiURIHJVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lNo3qFND; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539e7e73740so1526252e87.3
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2024 03:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730718929; x=1731323729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xH9DoC23Bb2/vYAIB0rsuoA8K2PG80L2HkKuDb8tLsE=;
        b=lNo3qFND51bxdP8OWa7VkbuldLEz45VHLKotjLuYucAcGPygm9IwFIGwDw1H6IVHoQ
         gr9Fn9fvqkdpkvUV8cMeJS5Tz+3olNlf4H3wSSe16AtnEVyWkzeE1Qd5sIwG3lL9/WOH
         VzxgTwQn/wKei/C6S4jFo/fiswOVM07RJS9LBL65+ZcwnPVjYvL0WR60SE1cHH3H3vI5
         YSN4ctq9Tae9hpOCk5wQUSqBAkcCpVsEH4CSN/FCgSKSuCTrljQmRy/BeWwO2oLjAorD
         i/SEz/QpkEekimVFUdF7K1pyVmszyLojiIrwijXGUXSQP4u0Ty7aWh5Y4mmuqmlNP97k
         2Msg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730718929; x=1731323729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xH9DoC23Bb2/vYAIB0rsuoA8K2PG80L2HkKuDb8tLsE=;
        b=AxyoxDBrvQaljrbw/4hAG8+bfwi65tyIwPxX1evm9idgGy49xsUQEXCS2PptqjRkv3
         HRoBU4H3nSg1QG5wuza5wMZcH8YeEUauS6nP7LLCM3/cGcRH0hXrxRXuLfxehZe4y7VA
         SYzivOlPewTWc73LLk5BJZyhhIJxNJI5JoQZavOFbBQwW12Jrkdvr+RnuebUSpiK5F1M
         wPb5txrvBX8Yrxy8RWgymH2z46ODYmcnUdzhiMb7N+KPbgWGKCa0KoNDOmt4l4mqz+Hp
         V696FxLTqXXIIalG04uOHP7fHq9c5gUu7TaWB5RW8NUBlC9MTBESKtlA2I45mVRACYvI
         EPSg==
X-Forwarded-Encrypted: i=1; AJvYcCWVR1ZrMfqE+5DeUYJpA7bhZKdNjawvB+snRUgWzfMDyhX9gna73dsHBp+2sOSPRzr9IzmxjZA9yHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiCI9FmdoT8P31QBlVZDA4pSqUw5N33X6Pkg96+FLNTdxSqw2L
	zfO0QlwItgay4dvHF1HyVjk09bQ1YTPsp7lkU0sTOm2BrIrmy0tLhlQGMvkt0BUOQ7QkaHiBGjC
	GXR0=
X-Google-Smtp-Source: AGHT+IFEO+EDtDqFJQorDAHgKOspX3rc8SvNpXsw47ifoSIAuvGSd8clbgoZacNUkzbI2eHhD845gw==
X-Received: by 2002:a05:6512:308a:b0:539:8d67:1b1b with SMTP id 2adb3069b0e04-53b7ecf1ff6mr10243566e87.26.1730718928569;
        Mon, 04 Nov 2024 03:15:28 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc961dbsm1650852e87.43.2024.11.04.03.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 03:15:27 -0800 (PST)
Date: Mon, 4 Nov 2024 13:15:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, linux-usb@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: Drop reference to a fwnode
Message-ID: <wygsgyxczjwr5mxrmqoqloww4dp5ac22bxkor2y2elbxi7ifvw@b2mb3woxye5y>
References: <20241104083045.2101350-1-joe@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104083045.2101350-1-joe@pf.is.s.u-tokyo.ac.jp>

On Mon, Nov 04, 2024 at 05:30:45PM +0900, Joe Hattori wrote:
> In typec_port_register_altmodes(), the fwnode reference obtained by
> device_get_named_child_node() is not dropped. This commit adds a call to
> fwnode_handle_put() to fix the possible reference leak.

Nit: s/This commit adds/Add/g , see
Documentation/process/submitting-patches.rst


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Fixes: 7b458a4c5d73 ("usb: typec: Add typec_port_register_altmodes()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---
> Changes in v2:
> - Add the Cc: stable@vger.kernel.org line.
> ---
>  drivers/usb/typec/class.c | 1 +
>  1 file changed, 1 insertion(+)
> 

-- 
With best wishes
Dmitry

